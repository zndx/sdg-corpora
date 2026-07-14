# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Information Logistics Strategy
- **genus**: `cco:ont00000958`
- **definition**: A strategic plan designed to systematically pursue long-range, enterprise-wide goals for information logistics in alignment with IT and business strategies.
- **attributes**: strategyIdentifier, formulationDate, implementationStatus, targetScope, alignmentLevel
- **relations**: influencedBy→SuccessFactor, governs→AnalyticalInformationSystem, alignedWith→ITStrategy, evaluatedBy→PerformanceMetric

## Information Logistics Success Factor
- **genus**: `bfo:0000015`
- **definition**: A specific organizational, technical, or procedural element that significantly influences the successful implementation and operation of an information logistics strategy.
- **attributes**: factorIdentifier, factorName, validationStatus, impactCoefficient, measurementMethod
- **relations**: contributesTo→InformationLogisticsStrategy, measuredBy→PerformanceMetric, contextualizedIn→OrganizationalUnit

## Analytical Information System
- **genus**: `cco:ont00000995`
- **definition**: An enterprise application component, such as a business intelligence or data warehousing system, used for the systematic analysis of organizational data to support decision-making.
- **attributes**: systemIdentifier, systemName, deploymentDate, systemType, uptimePercentage
- **relations**: deployedIn→OrganizationalUnit, supports→DecisionMaker, maintainedBy→ITStrategy, supersededBy→InformationLogisticsStrategy

## Organizational Unit
- **genus**: `bfo:0000040`
- **definition**: A distinct functional division or department within an enterprise that participates in information logistics activities and decision-making processes.
- **attributes**: unitIdentifier, unitName, departmentCode, headCount, budgetAllocation
- **relations**: owns→AnalyticalInformationSystem, employs→DecisionMaker, participatesIn→InformationLogisticsStrategy, reportsTo→OrganizationalUnit

## Decision Maker
- **genus**: `bfo:0000004`
- **definition**: A stakeholder or individual within an organization who utilizes analytical information systems to make informed business decisions.
- **attributes**: stakeholderIdentifier, roleTitle, decisionFrequency, informationRequirementLevel, satisfactionScore
- **relations**: utilizes→AnalyticalInformationSystem, belongs_to→OrganizationalUnit, influencedBy→SuccessFactor, evaluatedBy→PerformanceMetric

## Performance Metric
- **genus**: `bfo:0000015`
- **definition**: A quantitative or qualitative measure used to evaluate the effectiveness, efficiency, and success of information logistics strategies and analytical systems.
- **attributes**: metricIdentifier, metricName, measurementDate, targetValue, actualValue, status
- **relations**: tracks→InformationLogisticsStrategy, measures→SuccessFactor, appliesTo→DecisionMaker, derivedFrom→AnalyticalInformationSystem
