Product={
        componentIds: "Array",
        id: "String",
        name: "String",
        placeOfOrigin: "String",
        productionDate: "String",
        expirationDate: "String",
        unitQuantity: "Number",
        unitQuantityType: "String",
        batchQuantity: "Number",
        location: "ProductLocationData",
        productTest: {
            isTested: "Boolean",
            testResults: "Array<TestEntryData>"
        },
        approvedByAuth: "Boolean" 
    }

ProductLocationData={
    previous: "Array<ProductLocationEntry>",
    current: "ProductLocationEntry"
}

TestEntryData={
    tester: "String",
    testTimeStamp: "String",
    ripeness: "Boolean",
    productSpecies: "String",
    FFALevel: "Number",
    moistureContent: "Number",
    colour: "String",
    sampleTested: "Number"
}