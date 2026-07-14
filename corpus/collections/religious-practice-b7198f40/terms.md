# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Religious Practice
- **genus**: `bfo:0000015`
- **definition**: A culturally transmitted ritual, belief, or activity associated with African traditional religions, such as ancestor veneration, spirit sacrifice, or the use of charms.
- **attributes**: practiceId, practiceName, practiceType, prevalencePercentage, region, isSyncretic
- **relations**: observedIn→SurveyResponse, associatedWith→ReligiousIdentity

## Religious Identity
- **genus**: `bfo:0000023`
- **definition**: The primary religious affiliation or self-identification of an individual, such as Christianity, Islam, or African Traditional Religion.
- **attributes**: identityId, identityLabel, isPrimary, adherenceLevel
- **relations**: heldBy→SurveyResponse, syncretizesWith→ReligiousPractice

## Survey Response
- **genus**: `cco:ont00000995`
- **definition**: A recorded answer or data point from a Pew Research study participant regarding their religious beliefs, practices, and demographics in Tanzania and other Sub-Saharan African countries.
- **attributes**: responseId, surveyDate, respondentAge, respondentGender, country, householdSize, isSickInHousehold
- **relations**: recordsIdentity→ReligiousIdentity, reportsPractice→ReligiousPractice, consults→TraditionalHealer, possesses→SacredObject

## Traditional Healer
- **genus**: `bfo:0000023`
- **definition**: A religious specialist, such as a diviner or healer, called upon to discern the root causes of misfortune and prescribe rituals or traditional medicines.
- **attributes**: healerId, specialistType, regionOfPractice, isRecognized
- **relations**: consultedBy→SurveyResponse, prescribes→TraditionalMedicine

## Sacred Object
- **genus**: `cco:ont00000995`
- **definition**: A physical item, such as an animal skin, skull, or charm (juju), kept in the home or used in rituals for protection or spiritual purposes.
- **attributes**: objectId, objectType, protectivePurpose, isKeptAtHome
- **relations**: possessedBy→SurveyResponse, usedIn→ReligiousPractice

## Traditional Medicine
- **genus**: `cco:ont00000995`
- **definition**: A substance or preparation derived from natural sources, prescribed by traditional healers to treat illness or counteract the effects of witchcraft or spiritual harm.
- **attributes**: medicineId, medicineName, sourceMaterial, intendedEffect
- **relations**: prescribedBy→TraditionalHealer, usedBy→SurveyResponse
