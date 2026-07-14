# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Retail Brand
- **genus**: `cco:ont00000995`
- **definition**: A commercial enterprise entity that sells consumer goods through physical stores and direct-to-consumer channels.
- **attributes**: brandId, brandName, foundingYear, annualRevenue, totalStoreCount, headquartersLocation, parentCompany
- **relations**: hasLeadershipTeam→LeadershipTeam, employs→Employee, sells→ProductCategory, operatesIn→MarketCondition

## Retail Leadership Team
- **genus**: `bfo:0000015`
- **definition**: A group of top executives responsible for the overall performance and reputation of the retail brand.
- **attributes**: teamId, teamName, assessmentDate, teamSize, assessmentScore, teamStatus
- **relations**: belongs_to→Brand, has_member→Executive, conducts→TeamAssessment, reviews→BrandGoal

## Retail Executive
- **genus**: `bfo:0000015`
- **definition**: A senior individual responsible for a specific functional area within the retail organization.
- **attributes**: executiveId, fullName, jobTitle, department, tenureYears, location, isSenior
- **relations**: leads→Department, participates_in→LeadershipTeam, has_goal→BrandGoal, reports_to→Executive

## Strategic Brand Goal
- **genus**: `cco:ont00000995`
- **definition**: A specific, measurable objective set for the brand to achieve within a defined timeframe.
- **attributes**: goalId, goalDescription, targetYear, metricType, targetValue, currentValue, isBenchmarked
- **relations**: belongs_to→Brand, assigned_to→Executive, benchmarked_against→BrandGoal, tracks→KPI

## Corporate Department
- **genus**: `bfo:0000015`
- **definition**: A functional unit within the corporate organization responsible for specific business activities.
- **attributes**: deptId, deptName, headCount, budget, isSharedService, operationalStatus
- **relations**: has_executive→Executive, supports→Brand, employs→Employee, collaborates_with→Department

## Team Performance Assessment
- **genus**: `bfo:0000015`
- **definition**: A structured evaluation process measuring team functioning and performance against established models.
- **attributes**: assessmentId, assessmentType, dateConducted, durationMinutes, modelUsed, resultStatus
- **relations**: assesses→LeadershipTeam, conducted_by→Executive, uses_model→AssessmentModel, generates→AssessmentResult

## External Market Condition
- **genus**: `bfo:0000015`
- **definition**: An external economic or environmental factor influencing the brand's performance and strategy.
- **attributes**: conditionId, conditionName, impactLevel, trendDirection, measurementValue, lastUpdated
- **relations**: affects→Brand, influences→BrandGoal, monitored_by→Executive, categorized_as→ConditionType
