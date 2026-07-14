# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## School Librarian
- **genus**: `bfo:0000040`
- **definition**: A person who serves as a professional librarian within a school, providing leadership, instruction, and support for digital learning and library programs.
- **attributes**: librarianId, fullName, employmentStatus, certificationLevel, yearsOfExperience, currentRole
- **relations**: worksAt→School, leads→LibraryProgram, partnersWith→Educator, advocatesFor→StudentPrivacyPolicy

## Library Program
- **genus**: `bfo:0000040`
- **definition**: A structured set of activities, resources, and spaces managed by a school librarian to support student learning, inquiry, and digital literacy.
- **attributes**: programId, programName, programType, startDate, endDate, isActive, targetAudience
- **relations**: managedBy→SchoolLibrarian, usesSpace→FlexibleSpace, integrates→DigitalResource, supportsGoal→FutureReadyGoal

## Flexible Space
- **genus**: `bfo:0000040`
- **definition**: A physical or virtual area within a school library designed to promote inquiry, creativity, collaboration, and community engagement through adaptable configurations.
- **attributes**: spaceId, spaceName, spaceType, capacity, equipmentProvided, isBookable, accessibilityCompliant
- **relations**: locatedIn→School, supportsActivity→LibraryProgram, equippedWith→DigitalDevice

## Digital Resource
- **genus**: `bfo:0000040`
- **definition**: An electronic tool, content, or service used to support teaching, learning, and digital literacy within a school or district.
- **attributes**: resourceId, resourceName, resourceType, accessLevel, cost, lastUpdated, isEquitable
- **relations**: investedIn→Budget, usedIn→LibraryProgram, supportsSkill→DigitalSkill

## Community Partnership
- **genus**: `bfo:0000040`
- **definition**: A formal or informal collaboration between a school library and external entities such as families, non-profits, government agencies, or public libraries to enhance learning and engagement.
- **attributes**: partnershipId, partnershipName, partnerType, startDate, endDate, isActive, focusArea
- **relations**: initiatedBy→SchoolLibrarian, collaboratesWith→School, providesResource→DigitalResource

## Future Ready Goal
- **genus**: `bfo:0000040`
- **definition**: A strategic objective within the Future Ready Schools framework that guides the integration of digital tools, equitable access, and collaborative leadership in education.
- **attributes**: goalId, goalName, goalCategory, priorityLevel, isMet, lastAssessed
- **relations**: pursuedBy→School, supportedBy→LibraryProgram, measuredBy→Assessment

## Assessment
- **genus**: `bfo:0000040`
- **definition**: A tool or process used to evaluate student learning, digital literacy, or program effectiveness in alignment with evidence-based curricula and deeper learning standards.
- **attributes**: assessmentId, assessmentName, assessmentType, targetSkill, isDigital, lastAdministered
- **relations**: usedIn→LibraryProgram, evaluates→Student, alignsWith→FutureReadyGoal
