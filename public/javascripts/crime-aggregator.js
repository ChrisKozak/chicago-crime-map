CrimeAggregator = function(crimeElements) {
    var locations = {};

    var crimeDigester = function(crimeElement) {
        return {lat: $(crimeElement).data("lat").toFixed(3), lng: $(crimeElement).data("long").toFixed(3)};
    };

    var addCrime = function(crimeElement) {
        var crime = crimeDigester(crimeElement)
        var lat = crime.lat;
        var long = crime.lng;
        if (locations[lat] === undefined) {
            locations[lat] = {};
            locations[lat][long] = 1;
            return;
        }
        else if (locations[lat][long] === undefined) {
            locations[lat][long] = 1;
            return;
        }
        else {
            locations[lat][long] += 1;
            return;
        }
    };

    var flattenedLocations = function() {
        var locationList = [];
        for (var latitude in locations) {
            for (var longitude in locations[latitude]) {
                locationList.push({lat: latitude, lng: longitude, count: locations[latitude][longitude]});
            }
        }
        return locationList;
    };

    var findMaxAggregation = function() {
        console.log("Max concentration: "+ _.max(flattenedLocations(), function(crimeLocation){ return crimeLocation.count; }).count)
        return _.max(flattenedLocations(), function(crimeLocation){ return crimeLocation.count; }).count;
    };

    (function(crimeElements) {
        $(crimeElements).each(function(index, crimeElement) {
            addCrime(crimeElement);
        });
    })(crimeElements);

    return {
        crimes : flattenedLocations,
        maxAggregation: findMaxAggregation
    }
};

