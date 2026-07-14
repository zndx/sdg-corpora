# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Operating Division
- **genus**: `bfo:0000040`
- **definition**: A distinct organizational unit within the general contracting firm responsible for specific project types or geographic regions, submitting budgets and managing project teams.
- **attributes**: divisionId, divisionName, headquartersLocation, employeeCount, fiscalYear
- **relations**: submitsBudgetTo→BudgetSubmission, employsManager→DivisionManager

## Budget Submission
- **genus**: `bfo:0000040`
- **definition**: A formalized financial record submitted by an operating division to the company treasurer, detailing projected expenditures and revenue for a fiscal period.
- **attributes**: submissionId, totalProjectedExpenditure, submissionDate, fiscalYear, submissionStatus
- **relations**: submittedBy→OperatingDivision, reviewedBy→Treasurer, containsLineItem→BudgetLineItem

## Budget Line Item
- **genus**: `bfo:0000040`
- **definition**: A specific financial category or cost component within a divisional budget submission, such as labor, materials, or equipment.
- **attributes**: lineItemId, categoryName, allocatedAmount, currencyCode, approvalStatus
- **relations**: partOfSubmission→BudgetSubmission, fundedByDivision→OperatingDivision

## Internal Training Class
- **genus**: `bfo:0000040`
- **definition**: A scheduled educational session offered by the company to employees, covering topics such as safety standards, equipment operation, or software proficiency.
- **attributes**: classId, className, topicCategory, scheduledDate, maxCapacity, currentEnrollment
- **relations**: offeredAt→OfficeLocation, instructedBy→Instructor, enrollsParticipant→Employee

## Employee
- **genus**: `bfo:0000040`
- **definition**: A person employed by the general contracting firm, including division managers, project managers, and general staff who utilize productivity tools and attend training.
- **attributes**: employeeId, fullName, jobTitle, officeLocation, hireDate, isManager
- **relations**: assignedToDivision→OperatingDivision, submitsBudget→BudgetSubmission, enrollsInClass→InternalTrainingClass, usesSoftware→ProductivityTool

## Office Location
- **genus**: `bfo:0000040`
- **definition**: A physical facility or headquarters where the company's employees operate, manage projects, and conduct administrative tasks.
- **attributes**: locationId, city, state, isHeadquarters, employeeCapacity
- **relations**: hostsTraining→InternalTrainingClass, employsStaff→Employee

## Productivity Tool
- **genus**: `bfo:0000040`
- **definition**: A software application or system deployed to employees to enhance workflow, such as spreadsheet editors, presentation software, or collaboration platforms.
- **attributes**: toolId, toolName, softwareVersion, deploymentDate, isCollaborative
- **relations**: usedByEmployee→Employee, supportsTask→BusinessProcess

## Business Process
- **genus**: `bfo:0000015`
- **definition**: A recurring operational activity within the company, such as budgeting, training registration, or presentation creation, that is optimized through software deployment.
- **attributes**: processId, processName, averageDurationHours, efficiencyGainPercent, processStatus
- **relations**: executedBy→Employee, supportedByTool→ProductivityTool, generatesOutput→BudgetSubmission
