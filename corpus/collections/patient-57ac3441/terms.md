# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Patient
- **genus**: `bfo:0000004`
- **definition**: A living organism who is the subject of renal monitoring and dialysis treatment.
- **attributes**: patientId, age, sex, diagnosis
- **relations**: hasClinicalProfile→ClinicalProfile, undergoesTreatment→DialysisSession

## Clinical Profile
- **genus**: `cco:ont00000995`
- **definition**: A record of a patient's biochemical markers and physiological measurements used to assess kidney function.
- **attributes**: profileId, urea, creatinine, potassium, sodium, calcium, phosphorus, uricAcid
- **relations**: recordedFor→Patient, analyzedBy→NeuralNetworkModel

## Dialysis Session
- **genus**: `bfo:0000015`
- **definition**: A medical procedure involving the artificial removal of waste products and excess fluid from the blood.
- **attributes**: sessionId, startDate, duration, status
- **relations**: performedOn→Patient, conductedAt→Facility

## Neural Network Model
- **genus**: `cco:ont00000995`
- **definition**: A computational artifact representing an artificial neural network architecture trained to predict renal failure.
- **attributes**: modelId, architectureType, accuracy, trainingDate
- **relations**: analyzes→ClinicalProfile, trainedOn→Patient

## Facility
- **genus**: `bfo:0000004`
- **definition**: A physical location or organization providing medical services such as hospitals or hemodialysis centers.
- **attributes**: facilityId, name, type, location
- **relations**: hosts→DialysisSession
