'use strict';

const { WorkloadModuleBase } = require('@hyperledger/caliper-core');

class MyWorkload extends WorkloadModuleBase {
    constructor() {
        super();
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);

//        for (let i=0; i<this.roundArguments.assets; i++) {
//            const assetID = `${this.workerIndex}_${i}`;
//            console.log(`Worker ${this.workerIndex}: Creating asset ${assetID}`);
//            const request = {
//                contractId: this.roundArguments.contractId,
//                contractFunction: 'CreateAsset',
//                invokerIdentity: 'User1',
//                contractArguments: [assetID,'blue','20','penguin','500'],
//                readOnly: false
//            };
//
//            await this.sutAdapter.sendRequests(request);
//        }
    }

    async submitTransaction() {
//        const assetID = `${this.workerIndex}_${i}`;
        const myArgs = {
            contractId: this.roundArguments.contractId,
            contractFunction: 'ContractProducers:createProducer',
            invokerIdentity: 'User1',
            contractArguments: ['abcd','Joseph Barnes','josephbarnes@gmail.com','1234','shikamaru farms','kumasi','0244065464'],
            readOnly: false
        };

        await this.sutAdapter.sendRequests(myArgs);
    }

    async cleanupWorkloadModule() {
//        for (let i=0; i<this.roundArguments.assets; i++) {
//            const assetID = `${this.workerIndex}_${i}`;
//            console.log(`Worker ${this.workerIndex}: Deleting asset ${assetID}`);
//            const request = {
//                contractId: this.roundArguments.contractId,
//                contractFunction: 'DeleteAsset',
//                invokerIdentity: 'User1',
//                contractArguments: ['213423'],
//                readOnly: false
//            };
//
//            await this.sutAdapter.sendRequests(request);
//        }
    }
}

function createWorkloadModule() {
    return new MyWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;

