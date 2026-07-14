# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Nursing and Care Quality Forum
- **genus**: `cco:ont00000995`
- **definition**: A formal organizational body established to oversee and improve nursing standards and care quality within the NHS.
- **attributes**: forumIdentifier, establishedDate, currentStatus, governingBody, scopeOfInfluence
- **relations**: hasChair→NursingLeader, hasWorkstreamLead→NursingLeader, hasMember→NursingLeader

## Nursing Leader
- **genus**: `bfo:0000023`
- **definition**: An individual holding a senior leadership or advisory role within the NHS, responsible for nursing strategy, quality improvement, or patient safety.
- **attributes**: leaderIdentifier, fullLegalName, professionalQualifications, currentTitle, appointmentDate, yearsOfExperience
- **relations**: leadsWorkstream→NursingWorkstream, affiliatedWithTrust→NHSFoundationTrust, previouslyHeldRoleAt→NHSFoundationTrust, servesOnBoard→QualityBoard

## Nursing Quality Workstream
- **genus**: `bfo:0000015`
- **definition**: A specific strategic initiative or focus area within the Nursing and Care Quality Forum dedicated to improving a particular aspect of nursing care.
- **attributes**: workstreamIdentifier, workstreamTitle, startDate, targetOutcome, successMetric
- **relations**: ledBy→NursingLeader, partOfForum→NursingForum, targetsTrust→NHSFoundationTrust

## NHS Foundation Trust
- **genus**: `cco:ont00000995`
- **definition**: A legally independent organization within the National Health Service responsible for delivering hospital and/or community health services.
- **attributes**: trustIdentifier, trustName, trustType, foundingYear, currentQualityRating
- **relations**: hasNursingDirector→NursingLeader, subjectOfReview→QualityReview, implementsWorkstream→NursingWorkstream

## Quality and Safety Review
- **genus**: `bfo:0000015`
- **definition**: An independent assessment or inspection conducted by regulatory bodies or expert panels to evaluate the quality, safety, and governance of an NHS Trust.
- **attributes**: reviewIdentifier, reviewType, reviewDate, reviewOutcome, keyFindings
- **relations**: conductedOnTrust→NHSFoundationTrust, informedByExpert→NursingLeader, ledToImprovementPlan→NursingWorkstream

## Patient Safety and Quality Metric
- **genus**: `cco:ont00000995`
- **definition**: A quantifiable measure used to track improvements in patient safety, clinical outcomes, or care quality within an NHS Trust.
- **attributes**: metricIdentifier, metricName, baselineValue, currentValue, targetValue, measurementDate
- **relations**: measuredAtTrust→NHSFoundationTrust, trackedByWorkstream→NursingWorkstream, monitoredByLeader→NursingLeader
