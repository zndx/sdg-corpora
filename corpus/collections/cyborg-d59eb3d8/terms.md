# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cyborg
- **genus**: `bfo:0000040`
- **definition**: A cybernetic organism that incorporates technological implants connected to its nervous system.
- **attributes**: cyborgId, classification, implantLocation, neuralIntegrationLevel, status
- **relations**: hasImplant→NeuralImplant, partOf→CyborgationProcess

## Neural Implant
- **genus**: `bfo:0000040`
- **definition**: A technological device implanted into the body to interface with the nervous system.
- **attributes**: implantId, type, material, powerSource, signalFormat
- **relations**: connectedTo→NerveFiber, transmitsTo→ComputerSystem

## Cyborgation Process
- **genus**: `bfo:0000015`
- **definition**: The process of transforming an organism into a cyborg through the implantation of technological devices.
- **attributes**: processId, startDate, endDate, procedureType, successRate
- **relations**: transforms→Cyborg, usesImplant→NeuralImplant

## Hybrot
- **genus**: `bfo:0000040`
- **definition**: A cybernetic organism resembling a robot, engineered from organic and inorganic materials.
- **attributes**: hybrotId, biologicalComponent, electronicComponent, longevity, status
- **relations**: contains→NeuralImplant, connectedTo→ComputerSystem

## Computer System
- **genus**: `bfo:0000040`
- **definition**: A system used to process and store data from neural implants and cyborgs.
- **attributes**: systemId, processingPower, storageCapacity, communicationProtocol, status
- **relations**: receivesDataFrom→NeuralImplant, processesFor→Cyborg

## Nerve Fiber
- **genus**: `bfo:0000002`
- **definition**: A biological structure that transmits nerve impulses.
- **attributes**: fiberId, location, diameter, signalSpeed
- **relations**: connectedTo→NeuralImplant, transmitsTo→Muscle

## Muscle
- **genus**: `bfo:0000002`
- **definition**: A biological tissue that contracts to produce movement.
- **attributes**: muscleId, type, location, strength
- **relations**: controlledBy→NerveFiber
