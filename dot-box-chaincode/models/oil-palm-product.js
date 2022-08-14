const Product={
        componentIds: "Array<String>",
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

const ProductLocationData={
    previous: "Array<ProductLocationEntry>",
    current: "ProductLocationEntry"
}

const TestEntryData={
    tester: "String",
    testTimeStamp: "String",
    ripeness: "Boolean",
    productSpecies: "String",
    FFALevel: "Number",
    moistureContent: "Number",
    colour: "String",
    sampleTested: "Number"
}

// Proposed Asset Methods
// -createProduct method
// -transportTo method
// -getProductHistory method
// -getProduct method