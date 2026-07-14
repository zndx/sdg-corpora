# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Position
- **genus**: `bfo:0000023`
- **definition**: A role or job title held by an individual within an organizational structure, defining responsibilities and reporting relationships.
- **attributes**: positionId, title, classification, salaryRange, approvalDate, status
- **relations**: heldBy→Employee, supervises→Position, receivesDirectionFrom→Position, partOf→Department

## Employee
- **genus**: `bfo:0000002`
- **definition**: A person who performs work for an organization under a contract or employment agreement.
- **attributes**: employeeId, firstName, lastName, hireDate, terminationDate, employmentStatus
- **relations**: holdsPosition→Position, supervises→Employee, assignedTo→Department

## Department
- **genus**: `bfo:0000003`
- **definition**: A functional unit within an organization responsible for specific operational areas and reporting to higher administration.
- **attributes**: departmentId, name, code, establishedDate, status
- **relations**: containsPosition→Position, headOf→Employee, reportsTo→Department

## Collective Bargaining Agreement
- **genus**: `cco:ont00000958`
- **definition**: A formal written contract between an employer and a labor union representing employees, detailing terms of employment.
- **attributes**: agreementId, effectiveDate, expirationDate, unionName, status
- **relations**: covers→Employee, governs→Position, administeredBy→Employee

## Performance Review
- **genus**: `bfo:0000015`
- **definition**: A formal assessment process evaluating an employee's job performance against established objectives and standards.
- **attributes**: reviewId, reviewDate, rating, status, comments
- **relations**: assesses→Employee, conductedBy→Employee, references→Position, basedOn→CollectiveBargainingAgreement
