# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Stakeholder Group
- **genus**: `bfo:0000040`
- **definition**: A social group or category of individuals who have an interest in or are affected by the operations and outcomes of a public higher education institution.
- **attributes**: identifier, groupName, description, priorityLevel, influenceScore
- **relations**: hasStakeholderNeeds→StakeholderNeed, isRepresentedBy→Representative

## Stakeholder Need
- **genus**: `bfo:0000016`
- **definition**: A specific requirement, expectation, or demand identified by a stakeholder group that the institution must address to provide value and maintain legitimacy.
- **attributes**: needId, needDescription, urgencyLevel, satisfactionStatus, lastAssessedDate
- **relations**: belongsToManyStakeholders→StakeholderGroup, isAddressedBy→ITGovernanceProcess

## IT Governance Process
- **genus**: `bfo:0000015`
- **definition**: A structured activity or set of activities within an institution that directs and controls IT investments and activities to ensure alignment with organizational goals and stakeholder needs.
- **attributes**: processId, processName, framework, maturityLevel, lastAuditDate, complianceStatus
- **relations**: addressesStakeholderNeeds→StakeholderNeed, isImplementedIn→HigherEducationInstitution

## Higher Education Institution
- **genus**: `bfo:0000002`
- **definition**: A public organization in Egypt responsible for providing higher education, conducting research, and offering community services, which is subject to IT governance frameworks.
- **attributes**: institutionId, institutionName, locationCity, establishmentYear, fundingSource, governanceStatus
- **relations**: implementsITGovernanceProcesses→ITGovernanceProcess, servesStakeholderGroups→StakeholderGroup

## Reform Initiative
- **genus**: `bfo:0000015`
- **definition**: A structured program or project implemented to improve the operational effectiveness, efficiency, or strategic alignment of public higher education institutions, often involving IT infrastructure.
- **attributes**: initiativeId, initiativeName, startDate, endDate, budgetAmount, fundingAgency, completionStatus
- **relations**: targetsInstitutions→HigherEducationInstitution, includesITSubProject→ITSubProject

## IT Sub-Project
- **genus**: `bfo:0000015`
- **definition**: A specific component or sub-project within a larger reform initiative that focuses on implementing Information and Communication Technology infrastructure or governance capabilities.
- **attributes**: subProjectId, subProjectName, budgetAllocation, implementationPhase, technologyStack, successMetric
- **relations**: isPartOfInitiative→ReformInitiative, supportsGovernanceProcess→ITGovernanceProcess
