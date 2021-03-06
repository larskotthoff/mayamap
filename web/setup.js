var searching = false;
var detailed = false;
var searchTimeout;
var map, terrain, maya, modern;
var selectControl;
var measurePopup;
var vControls;

function init() {
    OpenLayers.ImgPath = "http://js.mapbox.com/theme/dark/";
    map = new OpenLayers.Map(('map'), {
        controls: [
            new OpenLayers.Control.Navigation(),
            new OpenLayers.Control.PanZoomBar(),
            new OpenLayers.Control.LayerSwitcher({'ascending':false}),
            new OpenLayers.Control.Permalink(),
            new OpenLayers.Control.ScaleLine(),
            //new OpenLayers.Control.MousePosition(),
            new OpenLayers.Control.KeyboardDefaults(),
            new OpenLayers.Control.OverviewMap()
        ],
        projection: "+init=epsg:3857",
        //projection: "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs",
        maxExtent: new OpenLayers.Bounds(-20037508.34,-20037508.34,20037508.34,20037508.34),
        restrictedExtent: new OpenLayers.Bounds(-10797990.61,1459732.27,-9462156.72,2511525.23),
        resolutions: [611.4962261718750,305.7481130859375,152.87405654296876,76.43702827148438,38.21851413574219,19.109257067871095,9.554628533935547,4.777314266967774,2.388657133483887]
    });
    terrain = new OpenLayers.Layer.XYZ("Terrain",
            "http://tiles.mayamap.org/tc/terrain/${z}/${x}/${y}.png", {
                format: 'image/png',
                maxResolution: 611.4962261718750,
                units: "m",
                zoomOffset: 8,
                resolutions: [611.4962261718750,305.7481130859375,152.87405654296876,76.43702827148438,38.21851413574219,19.109257067871095,9.554628533935547,4.777314266967774,2.388657133483887],
                sphericalMercator: true
    });
    maya = new OpenLayers.Layer.XYZ("Maya",
            "http://tiles.mayamap.org/tc/maya/${z}/${x}/${y}.png", {
                format: 'image/png',
                zoomOffset: 8,
                resolutions: [611.4962261718750,305.7481130859375,152.87405654296876,76.43702827148438,38.21851413574219,19.109257067871095,9.554628533935547,4.777314266967774,2.388657133483887],
                sphericalMercator: true
    });
    maya.setIsBaseLayer(false);
    modern = new OpenLayers.Layer.XYZ("Modern",
            "http://tiles.mayamap.org/tc/modern/${z}/${x}/${y}.png", {
                format: 'image/png',
                zoomOffset: 8,
                resolutions: [611.4962261718750,305.7481130859375,152.87405654296876,76.43702827148438,38.21851413574219,19.109257067871095,9.554628533935547,4.777314266967774,2.388657133483887],
                sphericalMercator: true
    });
    modern.setIsBaseLayer(false);
    modern.setVisibility(false);

    gsat = new OpenLayers.Layer.Google("Google Satellite", {
            type: google.maps.MapTypeId.SATELLITE
    });
    gsat.MIN_ZOOM_LEVEL = 8;
    gsat.MAX_ZOOM_LEVEL = 16;
    //document.write(gsat.RESOLUTIONS);

    gter = new OpenLayers.Layer.Google("Google Terrain", {
            type: google.maps.MapTypeId.TERRAIN
    });
    gter.MIN_ZOOM_LEVEL = 8;
    gter.MAX_ZOOM_LEVEL = 16;

    annotations = new OpenLayers.Layer.Vector("Annotations", {
        strategies: [new OpenLayers.Strategy.Fixed({preload: true})],
        protocol: new OpenLayers.Protocol.HTTP({
            url: "annotations.txt",
            format: new OpenLayers.Format.Text()
        })
    });
    annotations.setIsBaseLayer(false);
    annotations.setVisibility(false);
    selectControl = new OpenLayers.Control.SelectFeature(annotations,
        {onSelect: onFeatureSelect, onUnselect: onFeatureUnselect});
    map.addControl(selectControl);
    selectControl.activate();

    map.addLayers([modern, maya, annotations, terrain, gter, gsat]);
    if(!map.getCenter()) {
        map.setCenter(new OpenLayers.LonLat(-9958273.066, 1981951.16106), 0);
    }
    map.events.register("changelayer", map, updateLegend)
    map.events.register("zoomend", map, updateLegend)

    sketchSymbolizers = {
        "Point": {
            pointRadius: 4,
            graphicName: "square",
            fillColor: "white",
            fillOpacity: 1,
            strokeWidth: 1,
            strokeOpacity: 1,
            strokeColor: "#333333"
        },
        "Line": {
            strokeWidth: 3,
            strokeOpacity: 1,
            strokeColor: "#666666",
            strokeDashstyle: "dash"
        },
        "Polygon": {
            strokeWidth: 2,
            strokeOpacity: 1,
            strokeColor: "#666666",
            fillColor: "white",
            fillOpacity: 0.3
        }
    };
    style = new OpenLayers.Style();
    style.addRules([
        new OpenLayers.Rule({symbolizer: sketchSymbolizers})
    ]);
    styleMap = new OpenLayers.StyleMap({"default": style});
    
    linem = new OpenLayers.Control.Measure(
            OpenLayers.Handler.Path, {
                displayClass: "measureLength",
                persist: true,
                title: "Measure length",
                handlerOptions: {
                    layerOptions: {styleMap: styleMap}
                }
            }
    )
    linem.events.on({
        "measure": handleMeasurements,
        "measurepartial": deleteMeasurePopup,
        "deactivate": deleteMeasurePopup
    });
    aream = new OpenLayers.Control.Measure(
            OpenLayers.Handler.Polygon, {
                displayClass: "measureArea",
                persist: true,
                title: "Measure area",
                handlerOptions: {
                    layerOptions: {styleMap: styleMap}
                }
            }
    )
    aream.events.on({
        "measure": handleMeasurements,
        "measurepartial": deleteMeasurePopup,
        "deactivate": deleteMeasurePopup
    });

    std = new OpenLayers.Control.MouseDefaults({title:'Move and zoom'});

    panel = new OpenLayers.Control.Panel({defaultControl: std});
    panel.addControls([aream, linem, std]);
    map.addControl(panel);
    
    vControls = $("[id^=OpenLayers.Control.]").not("[id*=ScaleLine]");
    $("#map").mouseenter(showControls);
    $("#map").mouseleave(hideControls);

    $("#detail").click(function() {
        detailed = this.checked;
        if(!searching) {
            updateNav();
        }
    });
}

function hideControls() {
    vControls.hide();
    $("#north").show();
}

function showControls() {
    vControls.show();
    $("#north").hide();
}

function onPopupClose(evt) {
    selectControl.unselect(this.feature);
}

function onFeatureSelect(feature) {
    if(feature.popup) {
        onFeatureUnselect(feature);
        selectControl.unselect(feature);
    } else {
        popup = new OpenLayers.Popup.AnchoredBubble("annotationPopup",
                     feature.geometry.getBounds().getCenterLonLat(),
                     null,
                     "<h2>"+feature.attributes.title + "</h2>" +
                     feature.attributes.description,
                     null, true, onPopupClose);
        popup.maxSize = new OpenLayers.Size(300, 1000);
        popup.autoSize = true;
        popup.keepInMap = true;
        feature.popup = popup;
        popup.feature = feature;
        map.addPopup(popup);
    }
}

function onFeatureUnselect(feature) {
    if(feature.popup) {
        popup.feature = null;
        map.removePopup(feature.popup);
        feature.popup.destroy();
        feature.popup = null;
    }
}

function deleteMeasurePopup() {
    if(measurePopup) {
        map.removePopup(measurePopup);
        measurePopup.destroy();
        measurePopup = null;
    }
}

function handleMeasurements(event) {
    geometry = event.geometry;
    units = event.units;
    order = event.order;
    measure = event.measure;
    out = "<strong>";
    if(order == 1) {
        out += measure.toFixed(3) + " " + units;
    } else {
        out += measure.toFixed(3) + " " + units + "<sup>2</" + "sup>";
    }
    out += "</strong>";
    measurePopup = new OpenLayers.Popup.AnchoredBubble("measure",
                 geometry.getBounds().getCenterLonLat(),
                 null, out,
                 null, true, null);
    measurePopup.maxSize = new OpenLayers.Size(300, 1000);
    measurePopup.autoSize = true;
    measurePopup.keepInMap = true;
    map.addPopup(measurePopup);
}

function toggleTools() {
    $("#toolbox").toggleClass("hidden");
    updateMap();
    if($("#toolbox").hasClass("hidden")) {
        $("#showhidetools").html("show legend");
    } else {
        $("#showhidetools").html("hide legend");
        updateLegend();
    }
}

function toggleNav() {
    $("#nav").toggleClass("hidden");
    updateMap();
    if($("#nav").hasClass("hidden")) {
        $("#showhidenav").html("show navigation");
    } else {
        $("#showhidenav").html("hide navigation");
    }
}

function updateMap() {
    $("#map").removeClass();
    $("#footer").removeClass();
    if($("#toolbox").hasClass("hidden") && $("#nav").hasClass("hidden")) {
        $("#map").toggleClass("mapFull");
        $("#footer").toggleClass("footerFull");
    } else if($("#toolbox").hasClass("hidden")) {
        $("#map").toggleClass("mapwNav");
        $("#footer").toggleClass("footerwNav");
    } else if($("#nav").hasClass("hidden")) {
        $("#map").toggleClass("mapwTools");
        $("#footer").toggleClass("footerwTools");
    } else {
        $("#map").toggleClass("mapwNavTools");
        $("#footer").toggleClass("footerwNavTools");
    }
}
    
function updateLegend() {
    $("#legend-maya").empty();
    $("#legend-modern").empty();
    $("#legend-terrain").empty();
    layers = map.getLayersBy("visibility", true);
    for(i = 0; i < layers.length; i++) {
        if(layers[i].name === "Maya") {
            if(map.getZoom() >= 5) {
                $("#legend-maya").load("legend_maya_high.html");
            } else {
                $("#legend-maya").load("legend_maya_low.html");
            }
        } else if(layers[i].name === "Modern") {
            $("#legend-modern").load("legend_modern.html");
        } else if(layers[i].name === "Terrain") {
            $("#legend-terrain").load("legend_terrain.html");
        }
    }
}

function filter() {
    if(!searching) {
        searching = true;
        searchTimeout = setTimeout(updateNav, 700);
    } else {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(updateNav, 700);
    }
}

function updateNav() {
    $("#navigation").empty();
    term = $("#search").val().toLowerCase();
    if(term.length > 0) {
        $.each(sites, function(id, l) {
            if(l[0].search(new RegExp(term, "i")) >= 0) {
                appendNav(l);
            }
        });
    } else {
        $.each(sites, function(id, l) {
            appendNav(l);
        });
    }
    searching = false;
}

function appendNav(l) {
    if(!detailed || (l[3] == 1)) {
        $("#navigation").append('<li><a href="#" onclick="map.setCenter(new OpenLayers.LonLat('+l[1]+','+l[2]+'),'+(5+l[3])+');">'+l[0]+'</a></li>');
    }
}
