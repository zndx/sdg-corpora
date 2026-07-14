# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Program
- **genus**: `cco:ont00000958`
- **definition**: A formalized curriculum design and administrative structure defining the requirements, competencies, and degree outcomes for a specific field of study.
- **attributes**: programCode, degreeLevel, concentration, totalCreditHoursRequired, maxAdvancedStandingCredits, enrollmentMode, effectiveDate, status
- **relations**: hasConcentration→Concentration, requiresCompetency→Competency, grantsRole→ProfessionalRole

## Concentration
- **genus**: `bfo:0000015`
- **definition**: A specialized area of focus within an academic program that defines the specific methodological tools and reasoning approaches students must master.
- **attributes**: concentrationName, focusArea, methodologyType, isCore
- **relations**: partOfProgram→AcademicProgram, teachesMethod→StatisticalMethod

## Competency
- **genus**: `cco:ont00000995`
- **definition**: A measurable skill, knowledge area, or behavioral outcome that a student must demonstrate proficiency in to satisfy program requirements.
- **attributes**: competencyID, competencyTitle, competencyDescription, proficiencyLevel, assessmentType
- **relations**: requiredByProgram→AcademicProgram, supportsRole→ProfessionalRole, demonstratedInActivity→ResearchActivity

## Professional Role
- **genus**: `bfo:0000023`
- **definition**: A social role or function (e.g., Researcher, Collaborator, Educator) that a graduate is prepared to perform in the public health and biostatistics domain.
- **attributes**: roleName, roleCategory, primaryResponsibility
- **relations**: grantedByProgram→AcademicProgram, requiresCompetency→Competency, performedInContext→ResearchActivity

## Research Activity
- **genus**: `bfo:0000015`
- **definition**: A specific empirical study, methodological development project, or educational dissemination event conducted within the public health or biomedical domain.
- **attributes**: activityID, activityType, studyDesign, dataSource, startDate, endDate, status
- **relations**: usesMethod→StatisticalMethod, demonstratesCompetency→Competency, fulfillsRole→ProfessionalRole, involvesCollaborator→ProfessionalRole

## Statistical Method
- **genus**: `cco:ont00000995`
- **definition**: A specific tool, technique, or reasoning framework used for designing studies, analyzing data, quantifying evidence, and making decisions in biostatistics.
- **attributes**: methodID, methodName, methodCategory, complexityLevel, isStandardized
- **relations**: taughtInConcentration→Concentration, appliedInActivity→ResearchActivity, developedByRole→ProfessionalRole
