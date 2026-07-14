# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Course
- **genus**: `bfo:0000040`
- **definition**: A structured educational program or subject area offered within the primary school curriculum, such as Mathematics, Chinese Language, or Character and Citizenship Education.
- **attributes**: courseCode, courseName, gradeLevel, isMotherTongue, isCompulsory
- **relations**: usesMaterial→EducationalMaterial, assignedToClass→StudentClass

## Educational Material
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital resource used in the delivery of an academic course, including textbooks, workbooks, exercise books, stationery, and supplementary readers.
- **attributes**: materialCode, title, publisher, unitPrice, category, isOptional, requiredQuantity
- **relations**: suppliesCourse→AcademicCourse, orderedBy→StudentOrder

## Student Class
- **genus**: `bfo:0000002`
- **definition**: A cohort of students enrolled in a specific grade and section within the primary school for a given academic year.
- **attributes**: classCode, gradeLevel, academicYear, schoolName
- **relations**: enrollsStudent→Student, usesMaterial→EducationalMaterial

## Student
- **genus**: `bfo:0000004`
- **definition**: An individual enrolled as a pupil in the primary school, identified by name and contact details for administrative and ordering purposes.
- **attributes**: studentName, contactNumber, classCode, orderStatus
- **relations**: belongsFromClass→StudentClass, placesOrder→StudentOrder

## Student Order
- **genus**: `cco:ont00000995`
- **definition**: A formal request or transaction record for purchasing educational materials, linking a specific student to the items they wish to acquire.
- **attributes**: orderDate, totalAmount, sectionA, sectionB, sectionC, collectionStatus
- **relations**: initiatedBy→Student, includesMaterial→EducationalMaterial
