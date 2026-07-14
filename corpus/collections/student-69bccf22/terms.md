# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000040`
- **definition**: A material entity who is enrolled in the Boston Public Schools district and uses instructional software resources.
- **attributes**: studentId, firstName, lastName, gradeLevel, schoolName, isEligibleForProdigy
- **relations**: hasAccessTo→InstructionalResource, usesAuthenticationMethod→AuthenticationMethod

## InstructionalResource
- **genus**: `bfo:0000040`
- **definition**: A digital instructional software resource or application used by students for learning purposes.
- **attributes**: resourceId, resourceName, category, requiresAdditionalLogin, accessMethod, gradeRange
- **relations**: isAccessedBy→Student, usesAuthentication→AuthenticationMethod

## AuthenticationMethod
- **genus**: `bfo:0000040`
- **definition**: A method or credential used to authenticate a student's access to an instructional resource.
- **attributes**: authMethodId, methodName, isDefault, requiresAppInstallation
- **relations**: isUsedBy→Student, authenticatesAccessTo→InstructionalResource

## LearningManagementSystem
- **genus**: `bfo:0000040`
- **definition**: A specific type of instructional resource that allows teachers to create and manage assignments for students.
- **attributes**: lmsId, lmsName, supportsAssignmentCreation, accessViaClever
- **relations**: isAccessedBy→Student, usesAuthentication→AuthenticationMethod

## CurriculumResource
- **genus**: `bfo:0000040`
- **definition**: A digital resource that provides structured curriculum content for students, such as science or reading materials.
- **attributes**: curriculumId, curriculumName, subjectArea, requiresAdditionalLogin
- **relations**: isAccessedBy→Student, usesAuthentication→AuthenticationMethod

## TestPreparationResource
- **genus**: `bfo:0000040`
- **definition**: A digital resource that provides a database of questions to support students in test preparation.
- **attributes**: testPrepId, testPrepName, requiresAppInstallation
- **relations**: isAccessedBy→Student, usesAuthentication→AuthenticationMethod

## InterventionProgram
- **genus**: `bfo:0000040`
- **definition**: A digital program designed to provide targeted intervention in specific subjects for students.
- **attributes**: interventionId, interventionName, subjectArea, gradeRange, requiresAppInstallation
- **relations**: isAccessedBy→Student, usesAuthentication→AuthenticationMethod
