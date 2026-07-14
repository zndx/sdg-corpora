# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Power Splitter/Combiner Device
- **genus**: `cco:ont00000995`
- **definition**: A passive reciprocal RF device that splits an input signal into multiple outputs or combines multiple inputs into a single output with specific phase and amplitude characteristics.
- **attributes**: deviceIdentifier, deviceType, nominalImpedance, portCount, isolationRating, theoreticalInsertionLoss, phaseRelationship, status
- **relations**: hasPort→RFPort, exhibitsCharacteristic→SignalCharacteristic, usedInSystem→RFSystem

## RF Port
- **genus**: `cco:ont00000995`
- **definition**: A physical interface on a power splitter/combiner that accepts or delivers an RF signal, characterized by its impedance and termination state.
- **attributes**: portIdentifier, portLabel, impedance, terminationState, vswr
- **relations**: partOf→PowerSplitterCombiner, connectedTo→Antenna, connectedTo→Receiver

## Signal Characteristic
- **genus**: `bfo:0000015`
- **definition**: A measurable property of an RF signal passing through a splitter/combiner, such as amplitude, phase, or isolation level.
- **attributes**: characteristicType, value, unit, measurementCondition, status
- **relations**: measuredOn→PowerSplitterCombiner, appliesToPort→RFPort

## Antenna
- **genus**: `cco:ont00000995`
- **definition**: A transducer that converts electrical signals into electromagnetic waves or vice versa, connected to the RF ports of a splitter/combiner.
- **attributes**: antennaIdentifier, antennaType, resonantFrequency, impedance, status
- **relations**: connectedToPort→RFPort, feedsReceiver→Receiver

## Receiver
- **genus**: `cco:ont00000995`
- **definition**: An electronic device that processes incoming RF signals, connected to the output or sum port of a power splitter/combiner.
- **attributes**: receiverIdentifier, receiverType, inputImpedance, sensitivity, status
- **relations**: connectedToPort→RFPort, receivesFrom→Antenna

## RF Transformer
- **genus**: `cco:ont00000995`
- **definition**: A passive component within a power splitter/combiner circuit that provides impedance matching and phase shifting, often with a specific turns ratio.
- **attributes**: transformerIdentifier, turnsRatio, impedanceRatio, phaseShift, status
- **relations**: partOf→PowerSplitterCombiner, connectsPort→RFPort
