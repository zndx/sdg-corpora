# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Nursing and Care Quality Forum
- **genus**: `cco:ont00000958`
- **definition**: A formal governance body or committee established to oversee nursing standards, care quality, and strategic leadership within the NHS.
- **attributes**: forumIdentifier, forumName, establishedDate, status, jurisdiction
- **relations**: hasMember→NursingProfessional, hasChair→NursingProfessional, hasWorkstream→QualityWorkstream

## Nursing Professional
- **genus**: `bfo:0000023`
- **definition**: A registered healthcare practitioner, such as a nurse, midwife, or clinical director, who holds a professional role within the NHS or related health bodies.
- **attributes**: professionalId, fullName, registrationNumber, primaryQualification, yearsOfExperience, currentRoleTitle, hasFellowship
- **relations**: holdsRoleAt→HealthTrust, servesOnForum→NursingForum, leadsWorkstream→QualityWorkstream, trainedAt→EducationalInstitution

## Quality Improvement Workstream
- **genus**: `bfo:0000015`
- **definition**: A focused strategic initiative or working group within a nursing forum dedicated to specific quality, safety, or cultural objectives.
- **attributes**: workstreamId, workstreamTitle, startDate, targetMetric, status, scope
- **relations**: belongs_to_forum→NursingForum, led_by→NursingProfessional, targets_outcome→ClinicalOutcome

## NHS Health Trust
- **genus**: `cco:ont00000995`
- **definition**: A statutory NHS organization or foundation trust responsible for delivering healthcare services, governance, and patient safety in a defined region.
- **attributes**: trustId, trustName, trustType, region, cqcRating, establishedYear
- **relations**: employs_professional→NursingProfessional, conducts_audit→ClinicalOutcome, located_in_region→GeographicRegion

## Clinical Quality Outcome
- **genus**: `bfo:0000015`
- **definition**: A measurable health service result, such as infection rates, patient safety incidents, or quality ratings, tracked to evaluate care standards.
- **attributes**: outcomeId, outcomeType, measurementValue, unitOfMeasure, measurementDate, trend, dataSource
- **relations**: measured_at→HealthTrust, influenced_by→QualityWorkstream, recorded_by→NursingProfessional

## Educational Institution
- **genus**: `cco:ont00000995`
- **definition**: A university, hospital school, or training body where nursing professionals receive initial qualification or postgraduate education.
- **attributes**: institutionId, institutionName, institutionType, location, accreditationBody
- **relations**: trained_professional→NursingProfessional, located_in→GeographicRegion
