# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000040`
- **definition**: A young person aged 5 to 21 enrolled in the school who has special educational needs, predominantly involving interaction and communication difficulties.
- **attributes**: studentId, dateOfBirth, age, primaryDiagnosis, ehcpReference, enrollmentStatus
- **relations**: hasEHCP→EducationHealthCarePlan, hasDiagnosis→SpecialEducationalNeed, assignedToClass→Classroom, hasRiskAssessment→HealthSafetyRiskAssessment

## Special Educational Need
- **genus**: `bfo:0000040`
- **definition**: A diagnosed condition or complex need profile, such as Autism Spectrum Condition, Pathological Demand Avoidance, or Chromosome Disorders, that qualifies a student for placement.
- **attributes**: needCode, needName, severityLevel, isPrimary, requiresSpecializedTherapy
- **relations**: affectsStudent→Student, requiresStaffTraining→StaffTrainingModule

## Education Health and Care Plan
- **genus**: `cco:ont00000958`
- **definition**: A formal legal document issued by a Local Education Authority that outlines the special educational needs and provision required for a student.
- **attributes**: ehcpId, issuingLEA, issueDate, reviewDate, fundingStatus, legalStatus
- **relations**: coversStudent→Student, mandatesProvision→EducationalProvision

## Admission Application
- **genus**: `cco:ont00000958`
- **definition**: A formal request for placement submitted by a Local Education Authority or other source, subject to the school's admissions protocol.
- **attributes**: applicationId, submissionDate, applicationStatus, fundingAgreementId, interviewScheduled, oversubscribed
- **relations**: forStudent→Student, evaluatesNeed→SpecialEducationalNeed, linkedToEHCP→EducationHealthCarePlan, triggersRiskAssessment→HealthSafetyRiskAssessment

## Health and Safety Risk Assessment
- **genus**: `bfo:0000015`
- **definition**: A procedural evaluation of health and safety issues implemented as part of an admission decision to ensure the safety of the referred and existing students.
- **attributes**: assessmentId, assessmentDate, riskLevel, mitigationPlan, completedBy, status
- **relations**: assessesStudent→Student, linkedToApplication→AdmissionApplication, informsStaffTraining→StaffTrainingModule

## Staff Training Module
- **genus**: `bfo:0000015`
- **definition**: A professional development activity provided to staff when a student admission results in an area of special educational needs not previously resourced or where staff skills are inadequate.
- **attributes**: moduleId, moduleName, deliveryDate, completionStatus, targetAudience, hoursRequired
- **relations**: requiredForNeed→SpecialEducationalNeed, assignedToStaff→StaffMember, triggeredByAssessment→HealthSafetyRiskAssessment

## Staff Member
- **genus**: `bfo:0000040`
- **definition**: An adult employed by the school responsible for the education, therapy, care, and support of students, including teachers, therapists, and support staff.
- **attributes**: staffId, fullName, role, department, isQualified, employmentStatus
- **relations**: completesTraining→StaffTrainingModule, supervisesStudent→Student, reportsSafetyIssue→HealthSafetyRiskAssessment
