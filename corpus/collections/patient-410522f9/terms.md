# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Patient
- **genus**: `bfo:0000002`
- **definition**: A real material entity representing an individual human subject enrolled in the clinical study of ozone therapy for optic nerve dysfunction.
- **attributes**: patientId, age, sex, diagnosis, diseaseDuration, baselineVisualAcuity, baselineVisualField, baselineVEP, baselinePRCST, treatmentGroup
- **relations**: undergoes→OzoneTherapySession, has→OphthalmologicalExam, has→OzoneTherapyProtocol

## Ozone Therapy Session
- **genus**: `bfo:0000015`
- **definition**: A clinical process representing a single administration of ozone/oxygen autohemotherapy to a patient.
- **attributes**: sessionNumber, ozoneConcentration, ozoneDose, treatmentDate, administeredBy, sessionStatus
- **relations**: administeredTo→Patient, uses→OzoneTherapyProtocol

## Ophthalmological Exam
- **genus**: `bfo:0000015`
- **definition**: A diagnostic process involving a set of tests to measure visual function parameters before or after ozone therapy.
- **attributes**: examDate, examType, visualAcuity, visualField, visualEvokedPotentials, contrastSensitivity, examPerformedBy
- **relations**: performedOn→Patient, measures→VisualFunctionParameter

## Visual Function Parameter
- **genus**: `bfo:0000015`
- **definition**: A measurable clinical outcome representing a specific aspect of visual function assessed during ophthalmological exams.
- **attributes**: parameterName, preTreatmentValue, postTreatmentValue, improvementPercentage, improvementStatus
- **relations**: measuredIn→OphthalmologicalExam, associatedWith→Patient

## Ozone Therapy Protocol
- **genus**: `bfo:0000015`
- **definition**: A standardized clinical procedure defining the administration of ozone/oxygen autohemotherapy, including dosage and frequency.
- **attributes**: protocolId, totalSessions, oxygenRatio, administrationMethod, biochemicalAdjustment
- **relations**: appliedTo→Patient, generates→OzoneTherapySession
