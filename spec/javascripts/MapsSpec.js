describe("CrimeAggregator", function(){
    it("should report the maximum number of crimes in any aggregation", function(){
        var crimeElement1a = $("<div class='crime' data-lat='1' data-long='1'/>");
        var crimeElement2a = $("<div class='crime' data-lat='1' data-long='1'/>");
        var crimeElement3a = $("<div class='crime' data-lat='1' data-long='1'/>");

        var crimeElement1b = $("<div class='crime' data-lat='2' data-long='2'/>");
        var crimeElement2b = $("<div class='crime' data-lat='2' data-long='2'/>");

        var crimeElements = [crimeElement1a, crimeElement2a, crimeElement3a, crimeElement1b, crimeElement2b];

        var maxAggregation = CrimeAggregator(crimeElements).maxAggregation();

        expect(maxAggregation).toEqual(3);
    }),

    it("should aggregate all crimes within a minute (3 decimal digits) of each latitude and longitude", function(){
        var crimeElement1 = $("<div class='crime' data-lat='1.1114' data-long='1.1114'/>");
        var crimeElement2 = $("<div class='crime' data-lat='1.1113' data-long='1.1113'/>");
        var crimeElement3 = $("<div class='crime' data-lat='1.1109' data-long='1.1109'/>");
        var crimeElement4 = $("<div class='crime' data-lat='2' data-long='2'/>");
        var crimeElements = [crimeElement1, crimeElement2, crimeElement3, crimeElement4];

        var aggregateCrimes = CrimeAggregator(crimeElements).crimes();

        expect(aggregateCrimes).toContain({lat: '1.111', lng: '1.111', count: 3});
        expect(aggregateCrimes).toContain({lat: '2.000', lng: '2.000', count: 1});
    }),

    it("should aggregate all crimes for each latitude and longitude", function(){
        var crimeElement1 = $("<div class='crime' data-lat='25' data-long='45'/>");
        var crimeElement2 = $("<div class='crime' data-lat='25' data-long='45'/>");
        var crimeElements = [crimeElement1, crimeElement2];

        var aggregateCrimes = CrimeAggregator(crimeElements).crimes();

        expect(aggregateCrimes).toContain({lat: '25.000', lng: '45.000', count: 2});
    })
});