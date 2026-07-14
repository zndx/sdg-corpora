# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student Placement Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record of a student's admission and ongoing enrollment at the school, capturing their needs, funding status, and placement details.
- **attributes**: placementId, startDate, status, fundingSource, riskAssessmentStatus, interviewCompleted
- **relations**: hasStudent→Student, linkedToEHCP→EducationHealthCarePlan, fundedByLEA→LocalEducationAuthority, requiresTraining→StaffProfessionalDevelopment

## Student Profile
- **genus**: `bfo:0000015`
- **definition**: A record of a student's demographic, medical, and educational profile, including their specific needs and age.
- **attributes**: studentId, dateOfBirth, primaryDiagnosis, hasCommunicationDifficulty, hasMedicalNeeds, hasContinenceNeeds, age
- **relations**: hasPlacement→StudentPlacement, hasEHCP→EducationHealthCarePlan, requiresRiskAssessment→HealthSafetyRiskAssessment

## Education Health and Care Plan
- **genus**: `cco:ont00000958`
- **definition**: A legal document outlining the educational, health, and social care needs of a student, required for admission.
- **attributes**: ehcpId, issueDate, reviewDate, status, fundingAgreed
- **relations**: belongs_to_student→Student, issued_by_lea→LocalEducationAuthority

## Local Education Authority
- **genus**: `bfo:0000040`
- **definition**: A governmental body responsible for special educational needs provision and funding for students in a specific region.
- **attributes**: leaCode, regionName, contactEmail, fundingStatus
- **relations**: issues_ehcp→EducationHealthCarePlan, funds_placements→StudentPlacement

## Health and Safety Risk Assessment
- **genus**: `bfo:0000015`
- **definition**: A process to evaluate and mitigate health and safety risks associated with a student's admission and presence at the school.
- **attributes**: assessmentId, assessmentDate, riskLevel, mitigationSteps, completedBy
- **relations**: assesses_student→Student, linked_to_placement→StudentPlacement

## Staff Professional Development Record
- **genus**: `cco:ont00000995`
- **definition**: A record of additional training provided to staff to address specific student needs that exceed current staff capabilities.
- **attributes**: trainingId, trainingDate, topic, status, staffMemberId
- **relations**: triggered_by_placement→StudentPlacement, assigned_to_staff→StaffMember

## Staff Member Profile
- **genus**: `bfo:0000004`
- **definition**: A record of a staff member's profile, including their role and training history.
- **attributes**: staffId, fullName, role, employmentStatus
- **relations**: receives_training→StaffProfessionalDevelopment
