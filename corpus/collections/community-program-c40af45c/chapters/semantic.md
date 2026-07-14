The domain under examination is a community program logic model — a structured framework for planning, executing, and evaluating public-sector or nonprofit interventions. At its core, the model captures how a community need motivates a program, which in turn consumes inputs, performs activities, produces outputs, and ultimately achieves outcomes, all underpinned by causal assumptions. The relational schema materializes this ontology through eight entity tables, twenty-one junction tables that resolve many-to-many and associative relationships, and twenty-seven views that reconstruct domain facts from the normalized tables. Each table and view is designed to support a specific analytical question about the program lifecycle.

## Entity Types and Their Attributes

The foundation of the schema consists of eight base tables, each representing a distinct concept in the logic model ontology.

**Table `CommunityProgram`**

| id | programIdentifier | programName | startDate | endDate | status | scope | modelId |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | specific_component | 1 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | entire_program | 2 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | organization_wide | 3 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | terminated | specific_component | 4 |

The `CommunityProgram` table anchors the entire model. Each row represents a discrete intervention effort, identified by a surrogate `id` and a human-readable `programIdentifier` such as `PRO-2198` or `PRO-2205`. The `programName` column carries descriptive labels like *Extended Review* or *Pilot Initiative A*. Temporal boundaries are captured through `startDate` and `endDate` columns, both stored as ISO 8601 timestamps — for instance, program `PRO-2198` spans from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`. The `status` column constrains the lifecycle phase to one of four values: `planning`, `active`, `completed`, or `terminated`. The `scope` column further classifies the program's organizational reach as `specific_component`, `entire_program`, or `organization_wide`. Finally, the `modelId` column serves as a foreign key linking each program to its corresponding `LogicModel` record, establishing the parent-child relationship between a program and its logical blueprint.

**Table `LogicModel`**

| id | modelIdentifier | layoutOrientation | creationDate | isVerified | isExplicit | isMeaningful | programId |
|---|---|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 2022-01-13T12:24:00 | true | false | false | 1 |
| 2 | MOD-2070 | top_to_bottom | 2023-06-24T19:41:00 | false | true | true | 2 |
| 3 | MOD-2075 | bottom_to_top | 2024-11-08T02:58:00 | true | false | false | 3 |
| 4 | MOD-2080 | circular | 2025-04-19T09:15:00 | false | true | true | 4 |

The `LogicModel` table defines the structural template for a program's causal chain. Each row is identified by `id` and `modelIdentifier` (e.g., `MOD-2065`, `MOD-2070`). The `layoutOrientation` column specifies the visual arrangement of the logic model as one of `left_to_right`, `top_to_bottom`, `bottom_to_top`, or `circular`. Metadata columns `creationDate`, `isVerified`, `isExplicit`, and `isMeaningful` capture the model's provenance and validation state — for example, model `MOD-2065` was created on `2022-01-13T12:24:00`, is verified (`true`), but is neither explicit nor meaningful in the model's own assessment. The `programId` column is a foreign key pointing back to the `CommunityProgram` table, completing the bidirectional link between program and model.

**Table `CommunityNeed`**

| needId | needIdentifier | needDescription | severityLevel | targetPopulation | geographicScope |
|---|---|---|---|---|---|
| 1 | NEE-2502 | Baseline Series D | low | composite-target-21 | distributed-geograph-78 |
| 2 | NEE-2506 | Distributed Assessment | medium | primary-target-22 | baseline-geograph-79 |
| 3 | NEE-2510 | Adaptive Survey | high | adaptive-target-23 | pilot-geograph-80 |
| 4 | NEE-2514 | Primary Corridor A | critical | distributed-target-24 | extended-geograph-81 |

Community needs represent the problems that motivate programmatic intervention. The table uses `needId` as its surrogate key and `needIdentifier` (e.g., `NEE-2502`, `NEE-2506`) as a stable external reference. The `needDescription` column carries free-text labels such as *Baseline Series D* or *Distributed Assessment*. The `severityLevel` column constrains urgency to one of four ordinal values: `low`, `medium`, `high`, or `critical`. The `targetPopulation` and `geographicScope` columns describe the affected demographic and spatial dimensions respectively, with values like `composite-target-21` and `distributed-geograph-78`.

**Table `ProgramInput`**

| id | inputIdentifier | inputName | resourceType | quantity | cost | acquisitionDate | programId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | INP-2641 | Seasonal Standard | financial | 3.95 | 12.87 | 2023-02-07T01:39:00 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | INP-2648 | Integrated Framework | human | 6.90 | 29.99 | 2024-07-18T08:56:00 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | INP-2655 | Extended Protocol D | material | 9.85 | 12.36 | 2025-12-02T15:13:00 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | INP-2662 | Pilot Programme | informational | 12.80 | 37.54 | 2022-05-13T22:30:00 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Inputs are the resources consumed by a program. The `ProgramInput` table uses `id` as its primary key and `inputIdentifier` (e.g., `INP-2641`, `INP-2648`) as a stable reference. The `inputName` column carries labels such as *Seasonal Standard* or *Integrated Framework*. The `resourceType` column classifies inputs as `financial`, `human`, `material`, or `informational`. Quantitative attributes include `quantity` (a decimal such as `3.95` or `12.80`) and `cost` (a monetary value like `12.87` or `37.54`). The `acquisitionDate` column records when the resource was obtained, while `programId` links the input to its parent program. Audit columns `createdAt` and `updatedAt` track the resource's lifecycle timestamps.

**Table `ProgramActivity`**

| activityId | activityIdentifier | activityName | startDate | endDate | frequency | duration | programId |
|---|---|---|---|---|---|---|---|
| 1 | ACT-2184 | Composite Programme | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | one_time | 4.20 | 1 |
| 2 | ACT-2190 | Compact Standard A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | daily | 8.40 | 2 |
| 3 | ACT-2196 | Legacy Framework | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | weekly | 12.60 | 3 |
| 4 | ACT-2202 | Regional Protocol | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | monthly | 16.80 | 4 |

Activities are the actions performed by a program. The `ProgramActivity` table uses `activityId` as its surrogate key and `activityIdentifier` (e.g., `ACT-2184`, `ACT-2190`) as a stable reference. The `activityName` column carries labels such as *Composite Programme* or *Compact Standard A*. Temporal attributes include `startDate` and `endDate`, while `frequency` constrains recurrence to `one_time`, `daily`, `weekly`, or `monthly`. The `duration` column records the activity's length as a decimal (e.g., `4.20`, `16.80`). The `programId` column links each activity to its parent program.

**Table `ProgramOutput`**

| id | outputIdentifier | outputName | outputType | value | measurementDate | targetValue | activityId |
|---|---|---|---|---|---|---|---|
| 1 | OUT-2721 | Baseline Standard D | service_count | 19.95 | 2024-07-01T18:54:00 | 13.45 | 1 |
| 2 | OUT-2728 | Distributed Framework | product_quantity | 21.90 | 2025-12-12T01:11:00 | 15.90 | 2 |
| 3 | OUT-2735 | Adaptive Protocol | client_count | 23.85 | 2022-05-23T08:28:00 | 18.35 | 3 |
| 4 | OUT-2742 | Primary Programme A | satisfaction_score | 25.80 | 2023-10-07T15:45:00 | 20.80 | 4 |

Outputs are the direct, tangible products of program activities. The `ProgramOutput` table uses `id` as its primary key and `outputIdentifier` (e.g., `OUT-2721`, `OUT-2728`) as a stable reference. The `outputName` column carries labels such as *Baseline Standard D* or *Distributed Framework*. The `outputType` column classifies the output as `service_count`, `product_quantity`, `client_count`, or `satisfaction_score`. The `value` column records the measured quantity (e.g., `19.95`, `25.80`), while `measurementDate` records when the measurement was taken. The `targetValue` column stores the expected benchmark (e.g., `13.45`, `20.80`). The `activityId` column links each output to its producing activity, establishing the activity-to-output relationship.

**Table `ProgramOutcome`**

| id | outcomeIdentifier | outcomeDescription | timeHorizon | changeDirection | targetLevel | measurableValue | measurementDate | programId |
|---|---|---|---|---|---|---|---|---|
| 1 | OUT-2476 | Legacy Assessment D | short_term | increased | individual | 11.95 | 2024-07-01T18:54:00 | 1 |
| 2 | OUT-2479 | Regional Survey | medium_term | decreased | group | 14.90 | 2025-12-12T01:11:00 | 2 |
| 3 | OUT-2482 | Seasonal Corridor | long_term | improved | community | 17.85 | 2022-05-23T08:28:00 | 3 |
| 4 | OUT-2485 | Integrated Series A | short_term | enhanced | individual | 20.80 | 2023-10-07T15:45:00 | 4 |

Outcomes represent the longer-term changes or benefits resulting from program outputs. The table uses `id` as its primary key and `outcomeIdentifier` as a stable reference. The `outcomeName` column carries descriptive labels, while `outcomeType` classifies the nature of the change. The `value` column records the measured outcome magnitude, and `measurementDate` records when it was assessed. The `targetValue` column stores the expected benchmark. The `outputId` column links each outcome to its producing output, while `communityNeedId` links the outcome back to the community need it addresses.

**Table `CausalAssumption`**

| assumptionId | assumptionIdentifier | assumptionText | confidenceLevel | isVerified | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 100 | ASS-2153 | pilot-assumpti-68 | low | true | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | ASS-2158 | extended-assumpti-69 | medium | false | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | ASS-2163 | integrated-assumpti-70 | high | true | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | ASS-2168 | seasonal-assumpti-71 | low | false | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Causal assumptions articulate the hypothesized links between logic model components. The table uses `id` as its primary key and `assumptionIdentifier` as a stable reference. The `assumptionDescription` column carries free-text explanations of the hypothesized causal mechanism. The `confidenceLevel` column records the modeler's confidence in the assumption. The `programInputId` and `programActivityId` columns link each assumption to its relevant input and activity, respectively.

## Junction Tables and Cardinality-Bounded Relationships

The many-to-many relationships between entity types are resolved through junction tables. Each junction table contains pairs of foreign keys that reference the participating entity tables, enabling a single entity to participate in multiple relationships.

**Table `CommunityProgramCommunityNeed`**

| programId | needId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This junction table links community programs to the community needs they address. Each row contains a `communityProgramId` foreign key referencing `CommunityProgram.id` and a `communityNeedId` foreign key referencing `CommunityNeed.needId`. This allows a single program to address multiple needs and a single need to be addressed by multiple programs.

**Table `CommunityProgramProgramInput`**

| programId | inputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links programs to their inputs. Each row contains a `communityProgramId` foreign key referencing `CommunityProgram.id` and a `programInputId` foreign key referencing `ProgramInput.id`. This supports the scenario where a program consumes multiple input resources and an input resource may be shared across programs.

**Table `CommunityProgramProgramActivity`**

| programId | activityId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links programs to their activities. Each row contains a `communityProgramId` foreign key referencing `CommunityProgram.id` and a `programActivityId` foreign key referencing `ProgramActivity.activityId`. This enables a program to execute multiple activities and an activity to be associated with multiple programs.

**Table `CommunityProgramProgramOutput`**

| programId | outputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links programs to their outputs. Each row contains a `communityProgramId` foreign key referencing `CommunityProgram.id` and a `programOutputId` foreign key referencing `ProgramOutput.id`. This supports the scenario where a program produces multiple outputs and an output may be attributed to multiple programs.

**Table `CommunityProgramProgramOutcome`**

| programId | outcomeId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links programs to their outcomes. Each row contains a `communityProgramId` foreign key referencing `CommunityProgram.id` and a `programOutcomeId` foreign key referencing `ProgramOutcome.id`. This enables a program to achieve multiple outcomes and an outcome to be attributed to multiple programs.

**Table `LogicModelProgramInput`**

| modelId | inputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links logic models to their inputs. Each row contains a `logicModelId` foreign key referencing `LogicModel.id` and a `programInputId` foreign key referencing `ProgramInput.id`. This allows a logic model to specify multiple input requirements and an input to be used across multiple logic models.

**Table `LogicModelProgramActivity`**

| modelId | activityId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links logic models to their activities. Each row contains a `logicModelId` foreign key referencing `LogicModel.id` and a `programActivityId` foreign key referencing `ProgramActivity.activityId`. This supports the scenario where a logic model prescribes multiple activities and an activity may be part of multiple logic models.

**Table `LogicModelProgramOutput`**

| modelId | outputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links logic models to their outputs. Each row contains a `logicModelId` foreign key referencing `LogicModel.id` and a `programOutputId` foreign key referencing `ProgramOutput.id`. This enables a logic model to define multiple expected outputs and an output to be referenced by multiple logic models.

**Table `LogicModelProgramOutcome`**

| modelId | outcomeId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links logic models to their outcomes. Each row contains a `logicModelId` foreign key referencing `LogicModel.id` and a `programOutcomeId` foreign key referencing `ProgramOutcome.id`. This supports the scenario where a logic model specifies multiple target outcomes and an outcome may be part of multiple logic models.

**Table `LogicModelCausalAssumption`**

| modelId | assumptionId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

This table links logic models to their causal assumptions. Each row contains a `logicModelId` foreign key referencing `LogicModel.id` and a `causalAssumptionId` foreign key referencing `CausalAssumption.id`. This allows a logic model to articulate multiple causal assumptions and an assumption to be referenced by multiple logic models.

**Table `CommunityNeedCommunityProgram`**

| needId | programId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This is the inverse of `CommunityProgramCommunityNeed`, providing a community-need-centric view of the same relationship. Each row contains a `communityNeedId` foreign key referencing `CommunityNeed.needId` and a `communityProgramId` foreign key referencing `CommunityProgram.id`.

**Table `CommunityNeedProgramOutcome`**

| needId | outcomeId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links community needs to the program outcomes that address them. Each row contains a `communityNeedId` foreign key referencing `CommunityNeed.needId` and a `programOutcomeId` foreign key referencing `ProgramOutcome.id`. This allows a need to be addressed by multiple outcomes and an outcome to address multiple needs.

**Table `ProgramInputProgramActivity`**

| inputId | activityId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links program inputs to the activities they support. Each row contains a `programInputId` foreign key referencing `ProgramInput.id` and a `programActivityId` foreign key referencing `ProgramActivity.activityId`. This supports the scenario where an input resource supports multiple activities and an activity consumes multiple inputs.

**Table `ProgramActivityProgramInput`**

| activityId | inputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This is the inverse of `ProgramInputProgramActivity`, providing an activity-centric view of the input-activity relationship. Each row contains a `programActivityId` foreign key referencing `ProgramActivity.activityId` and a `programInputId` foreign key referencing `ProgramInput.id`.

**Table `ProgramActivityProgramOutput`**

| activityId | outputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links program activities to their outputs. Each row contains a `programActivityId` foreign key referencing `ProgramActivity.activityId` and a `programOutputId` foreign key referencing `ProgramOutput.id`. This supports the scenario where an activity produces multiple outputs and an output may be produced by multiple activities.

**Table `ProgramActivityProgramOutcome`**

| activityId | outcomeId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links program activities to the outcomes they contribute to. Each row contains a `programActivityId` foreign key referencing `ProgramActivity.activityId` and a `programOutcomeId` foreign key referencing `ProgramOutcome.id`. This allows an activity to contribute to multiple outcomes and an outcome to be influenced by multiple activities.

**Table `ProgramOutputProgramOutcome`**

| outputId | outcomeId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links program outputs to the outcomes they produce. Each row contains a `programOutputId` foreign key referencing `ProgramOutput.id` and a `programOutcomeId` foreign key referencing `ProgramOutcome.id`. This supports the scenario where an output contributes to multiple outcomes and an outcome may be produced by multiple outputs.

**Table `ProgramOutcomeProgramOutput`**

| outcomeId | outputId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This is the inverse of `ProgramOutputProgramOutcome`, providing an outcome-centric view of the output-outcome relationship. Each row contains a `programOutcomeId` foreign key referencing `ProgramOutcome.id` and a `programOutputId` foreign key referencing `ProgramOutput.id`.

**Table `ProgramOutcomeCommunityNeed`**

| outcomeId | needId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table links program outcomes to the community needs they address. Each row contains a `programOutcomeId` foreign key referencing `ProgramOutcome.id` and a `communityNeedId` foreign key referencing `CommunityNeed.needId`. This allows an outcome to address multiple needs and a need to be addressed by multiple outcomes.

**Table `CausalAssumptionProgramInput`**

| assumptionId | inputId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

This table links causal assumptions to the program inputs they reference. Each row contains a `causalAssumptionId` foreign key referencing `CausalAssumption.id` and a `programInputId` foreign key referencing `ProgramInput.id`. This allows an assumption to reference multiple inputs and an input to be referenced by multiple assumptions.

**Table `CausalAssumptionProgramActivity`**

| assumptionId | activityId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

This table links causal assumptions to the program activities they reference. Each row contains a `causalAssumptionId` foreign key referencing `CausalAssumption.id` and a `programActivityId` foreign key referencing `ProgramActivity.activityId`. This supports the scenario where an assumption references multiple activities and an activity is referenced by multiple assumptions.

## Views and Their Analytical Questions

The twenty-seven views reconstruct domain facts by joining the normalized tables. Each view answers a specific analytical question by denormalizing a particular perspective of the logic model.

**View `community_program_logic_model_view`**

```sql
CREATE VIEW community_program_logic_model_view AS
SELECT a.id, a.programIdentifier, a.programName, a.startDate, b.id AS model_id, b.modelIdentifier AS model_modelIdentifier, b.layoutOrientation AS model_layoutOrientation
FROM CommunityProgram a JOIN LogicModel b ON a.modelId = b.id;
```

| id | programIdentifier | programName | startDate | model_id | model_modelIdentifier | model_layoutOrientation |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1 | MOD-2065 | left_to_right |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | MOD-2070 | top_to_bottom |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 3 | MOD-2075 | bottom_to_top |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | MOD-2080 | circular |

This view joins `CommunityProgram` with `LogicModel` on the `modelId`/`programId` relationship, answering the question: *What is the logical blueprint for each community program?* Reading the row for program `PRO-2198` (Extended Review), the view reveals that its logic model `MOD-2065` uses a `left_to_right` layout orientation, was created on `2022-01-13T12:24:00`, and is verified but neither explicit nor meaningful. The row for `PRO-2205` (Pilot Initiative A) shows its model `MOD-2070` uses a `top_to_bottom` orientation, was created on `2023-06-24T19:41:00`, and is neither verified but is both explicit and meaningful.

**View `community_program_community_need_detail_view`**

```sql
CREATE VIEW community_program_community_need_detail_view AS
SELECT a.id, a.programIdentifier, a.programName, b.needId AS need_needId, b.needIdentifier AS need_needIdentifier, b.needDescription AS need_needDescription
FROM CommunityProgram a
  JOIN CommunityProgramCommunityNeed j ON j.programId = a.id
  JOIN CommunityNeed b ON b.needId = j.needId;
```

| id | programIdentifier | programName | need_needId | need_needIdentifier | need_needDescription |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | NEE-2502 | Baseline Series D |
| 1 | PRO-2198 | Extended Review | 2 | NEE-2506 | Distributed Assessment |
| 2 | PRO-2205 | Pilot Initiative A | 2 | NEE-2506 | Distributed Assessment |
| 2 | PRO-2205 | Pilot Initiative A | 3 | NEE-2510 | Adaptive Survey |
| 3 | PRO-2212 | Baseline Model | 3 | NEE-2510 | Adaptive Survey |
| 3 | PRO-2212 | Baseline Model | 4 | NEE-2514 | Primary Corridor A |
| 4 | PRO-2219 | Distributed Cluster | 4 | NEE-2514 | Primary Corridor A |
| 4 | PRO-2219 | Distributed Cluster | 1 | NEE-2502 | Baseline Series D |

This view joins `CommunityProgram` with `CommunityNeed` through the `CommunityProgramCommunityNeed` junction table, answering: *Which community needs does each program address?* For program `PRO-2198`, the view would reveal the specific needs (such as `NEE-2502` with severity `low`) that motivated the program's design.

**View `community_program_program_input_detail_view`**

```sql
CREATE VIEW community_program_program_input_detail_view AS
SELECT a.id, a.programIdentifier, a.programName, b.id AS input_id, b.inputIdentifier AS input_inputIdentifier, b.inputName AS input_inputName
FROM CommunityProgram a
  JOIN CommunityProgramProgramInput j ON j.programId = a.id
  JOIN ProgramInput b ON b.id = j.inputId;
```

| id | programIdentifier | programName | input_id | input_inputIdentifier | input_inputName |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | INP-2641 | Seasonal Standard |
| 1 | PRO-2198 | Extended Review | 2 | INP-2648 | Integrated Framework |
| 2 | PRO-2205 | Pilot Initiative A | 2 | INP-2648 | Integrated Framework |
| 2 | PRO-2205 | Pilot Initiative A | 3 | INP-2655 | Extended Protocol D |
| 3 | PRO-2212 | Baseline Model | 3 | INP-2655 | Extended Protocol D |
| 3 | PRO-2212 | Baseline Model | 4 | INP-2662 | Pilot Programme |
| 4 | PRO-2219 | Distributed Cluster | 4 | INP-2662 | Pilot Programme |
| 4 | PRO-2219 | Distributed Cluster | 1 | INP-2641 | Seasonal Standard |

This view joins `CommunityProgram` with `ProgramInput` through the `CommunityProgramProgramInput` junction table, answering: *What resources does each program consume?* For program `PRO-2198`, the view would surface inputs like `INP-2641` (Seasonal Standard, financial resource type, quantity `3.95`, cost `12.87`).

**View `community_program_program_activity_detail_view`**

```sql
CREATE VIEW community_program_program_activity_detail_view AS
SELECT a.id, a.programIdentifier, a.programName, b.activityId AS activity_activityId, b.activityIdentifier AS activity_activityIdentifier, b.activityName AS activity_activityName
FROM CommunityProgram a
  JOIN CommunityProgramProgramActivity j ON j.programId = a.id
  JOIN ProgramActivity b ON b.activityId = j.activityId;
```

| id | programIdentifier | programName | activity_activityId | activity_activityIdentifier | activity_activityName |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | ACT-2184 | Composite Programme |
| 1 | PRO-2198 | Extended Review | 2 | ACT-2190 | Compact Standard A |
| 2 | PRO-2205 | Pilot Initiative A | 2 | ACT-2190 | Compact Standard A |
| 2 | PRO-2205 | Pilot Initiative A | 3 | ACT-2196 | Legacy Framework |
| 3 | PRO-2212 | Baseline Model | 3 | ACT-2196 | Legacy Framework |
| 3 | PRO-2212 | Baseline Model | 4 | ACT-2202 | Regional Protocol |
| 4 | PRO-2219 | Distributed Cluster | 4 | ACT-2202 | Regional Protocol |
| 4 | PRO-2219 | Distributed Cluster | 1 | ACT-2184 | Composite Programme |

This view joins `CommunityProgram` with `ProgramActivity` through the `CommunityProgramProgramActivity` junction table, answering: *What activities does each program execute?* For program `PRO-2198`, the view would reveal activities such as `ACT-2184` (Composite Programme, one_time frequency, duration `4.20`).

**View `community_program_program_output_detail_view`**

```sql
CREATE VIEW community_program_program_output_detail_view AS
SELECT a.id, a.programIdentifier, a.programName, b.id AS output_id, b.outputIdentifier AS output_outputIdentifier, b.outputName AS output_outputName
FROM CommunityProgram a
  JOIN CommunityProgramProgramOutput j ON j.programId = a.id
  JOIN ProgramOutput b ON b.id = j.outputId;
```

| id | programIdentifier | programName | output_id | output_outputIdentifier | output_outputName |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | OUT-2721 | Baseline Standard D |
| 1 | PRO-2198 | Extended Review | 2 | OUT-2728 | Distributed Framework |
| 2 | PRO-2205 | Pilot Initiative A | 2 | OUT-2728 | Distributed Framework |
| 2 | PRO-2205 | Pilot Initiative A | 3 | OUT-2735 | Adaptive Protocol |
| 3 | PRO-2212 | Baseline Model | 3 | OUT-2735 | Adaptive Protocol |
| 3 | PRO-2212 | Baseline Model | 4 | OUT-2742 | Primary Programme A |
| 4 | PRO-2219 | Distributed Cluster | 4 | OUT-2742 | Primary Programme A |
| 4 | PRO-2219 | Distributed Cluster | 1 | OUT-2721 | Baseline Standard D |

This view joins `CommunityProgram` with `ProgramOutput` through the `CommunityProgramProgramOutput` junction table, answering: *What outputs does each program produce?* For program `PRO-2198`, the view would surface outputs like `OUT-2721` (Baseline Standard D, service_count type, value `19.95`, target `13.45`).

**View `community_program_program_outcome_detail_view`**

```sql
CREATE VIEW community_program_program_outcome_detail_view AS
SELECT a.id, a.programIdentifier, a.programName, b.id AS outcome_id, b.outcomeIdentifier AS outcome_outcomeIdentifier, b.outcomeDescription AS outcome_outcomeDescription
FROM CommunityProgram a
  JOIN CommunityProgramProgramOutcome j ON j.programId = a.id
  JOIN ProgramOutcome b ON b.id = j.outcomeId;
```

| id | programIdentifier | programName | outcome_id | outcome_outcomeIdentifier | outcome_outcomeDescription |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | OUT-2476 | Legacy Assessment D |
| 1 | PRO-2198 | Extended Review | 2 | OUT-2479 | Regional Survey |
| 2 | PRO-2205 | Pilot Initiative A | 2 | OUT-2479 | Regional Survey |
| 2 | PRO-2205 | Pilot Initiative A | 3 | OUT-2482 | Seasonal Corridor |
| 3 | PRO-2212 | Baseline Model | 3 | OUT-2482 | Seasonal Corridor |
| 3 | PRO-2212 | Baseline Model | 4 | OUT-2485 | Integrated Series A |
| 4 | PRO-2219 | Distributed Cluster | 4 | OUT-2485 | Integrated Series A |
| 4 | PRO-2219 | Distributed Cluster | 1 | OUT-2476 | Legacy Assessment D |

This view joins `CommunityProgram` with `ProgramOutcome` through the `CommunityProgramProgramOutcome` junction table, answering: *What outcomes does each program achieve?* This view enables program managers to assess whether their interventions are delivering the intended long-term benefits.

**View `logic_model_community_program_view`**

```sql
CREATE VIEW logic_model_community_program_view AS
SELECT a.id, a.modelIdentifier, a.layoutOrientation, a.creationDate, b.id AS program_id, b.programIdentifier AS program_programIdentifier, b.programName AS program_programName
FROM LogicModel a JOIN CommunityProgram b ON a.programId = b.id;
```

| id | modelIdentifier | layoutOrientation | creationDate | program_id | program_programIdentifier | program_programName |
|---|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 2022-01-13T12:24:00 | 1 | PRO-2198 | Extended Review |
| 2 | MOD-2070 | top_to_bottom | 2023-06-24T19:41:00 | 2 | PRO-2205 | Pilot Initiative A |
| 3 | MOD-2075 | bottom_to_top | 2024-11-08T02:58:00 | 3 | PRO-2212 | Baseline Model |
| 4 | MOD-2080 | circular | 2025-04-19T09:15:00 | 4 | PRO-2219 | Distributed Cluster |

This view joins `LogicModel` with `CommunityProgram` on the `programId`/`id` relationship, answering the inverse question: *Which programs use each logic model?* For model `MOD-2065`, the view reveals that program `PRO-2198` (Extended Review) uses this blueprint. This perspective is useful for model reuse analysis — determining whether a single logic model template is applied across multiple programs.

**View `logic_model_program_input_detail_view`**

```sql
CREATE VIEW logic_model_program_input_detail_view AS
SELECT a.id, a.modelIdentifier, a.layoutOrientation, b.id AS input_id, b.inputIdentifier AS input_inputIdentifier, b.inputName AS input_inputName
FROM LogicModel a
  JOIN LogicModelProgramInput j ON j.modelId = a.id
  JOIN ProgramInput b ON b.id = j.inputId;
```

| id | modelIdentifier | layoutOrientation | input_id | input_inputIdentifier | input_inputName |
|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 1 | INP-2641 | Seasonal Standard |
| 1 | MOD-2065 | left_to_right | 2 | INP-2648 | Integrated Framework |
| 2 | MOD-2070 | top_to_bottom | 2 | INP-2648 | Integrated Framework |
| 2 | MOD-2070 | top_to_bottom | 3 | INP-2655 | Extended Protocol D |
| 3 | MOD-2075 | bottom_to_top | 3 | INP-2655 | Extended Protocol D |
| 3 | MOD-2075 | bottom_to_top | 4 | INP-2662 | Pilot Programme |
| 4 | MOD-2080 | circular | 4 | INP-2662 | Pilot Programme |
| 4 | MOD-2080 | circular | 1 | INP-2641 | Seasonal Standard |

This view joins `LogicModel` with `ProgramInput` through the `LogicModelProgramInput` junction table, answering: *What inputs does each logic model prescribe?* For model `MOD-2065`, the view would reveal the input resources that the model expects programs to consume.

**View `logic_model_program_activity_detail_view`**

```sql
CREATE VIEW logic_model_program_activity_detail_view AS
SELECT a.id, a.modelIdentifier, a.layoutOrientation, b.activityId AS activity_activityId, b.activityIdentifier AS activity_activityIdentifier, b.activityName AS activity_activityName
FROM LogicModel a
  JOIN LogicModelProgramActivity j ON j.modelId = a.id
  JOIN ProgramActivity b ON b.activityId = j.activityId;
```

| id | modelIdentifier | layoutOrientation | activity_activityId | activity_activityIdentifier | activity_activityName |
|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 1 | ACT-2184 | Composite Programme |
| 1 | MOD-2065 | left_to_right | 2 | ACT-2190 | Compact Standard A |
| 2 | MOD-2070 | top_to_bottom | 2 | ACT-2190 | Compact Standard A |
| 2 | MOD-2070 | top_to_bottom | 3 | ACT-2196 | Legacy Framework |
| 3 | MOD-2075 | bottom_to_top | 3 | ACT-2196 | Legacy Framework |
| 3 | MOD-2075 | bottom_to_top | 4 | ACT-2202 | Regional Protocol |
| 4 | MOD-2080 | circular | 4 | ACT-2202 | Regional Protocol |
| 4 | MOD-2080 | circular | 1 | ACT-2184 | Composite Programme |

This view joins `LogicModel` with `ProgramActivity` through the `LogicModelProgramActivity` junction table, answering: *What activities does each logic model prescribe?* For model `MOD-2065`, the view would surface the activities that the model expects programs to execute.

**View `logic_model_program_output_detail_view`**

```sql
CREATE VIEW logic_model_program_output_detail_view AS
SELECT a.id, a.modelIdentifier, a.layoutOrientation, b.id AS output_id, b.outputIdentifier AS output_outputIdentifier, b.outputName AS output_outputName
FROM LogicModel a
  JOIN LogicModelProgramOutput j ON j.modelId = a.id
  JOIN ProgramOutput b ON b.id = j.outputId;
```

| id | modelIdentifier | layoutOrientation | output_id | output_outputIdentifier | output_outputName |
|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 1 | OUT-2721 | Baseline Standard D |
| 1 | MOD-2065 | left_to_right | 2 | OUT-2728 | Distributed Framework |
| 2 | MOD-2070 | top_to_bottom | 2 | OUT-2728 | Distributed Framework |
| 2 | MOD-2070 | top_to_bottom | 3 | OUT-2735 | Adaptive Protocol |
| 3 | MOD-2075 | bottom_to_top | 3 | OUT-2735 | Adaptive Protocol |
| 3 | MOD-2075 | bottom_to_top | 4 | OUT-2742 | Primary Programme A |
| 4 | MOD-2080 | circular | 4 | OUT-2742 | Primary Programme A |
| 4 | MOD-2080 | circular | 1 | OUT-2721 | Baseline Standard D |

This view joins `LogicModel` with `ProgramOutput` through the `LogicModelProgramOutput` junction table, answering: *What outputs does each logic model prescribe?* For model `MOD-2065`, the view would reveal the outputs that the model expects programs to produce.

**View `logic_model_program_outcome_detail_view`**

```sql
CREATE VIEW logic_model_program_outcome_detail_view AS
SELECT a.id, a.modelIdentifier, a.layoutOrientation, b.id AS outcome_id, b.outcomeIdentifier AS outcome_outcomeIdentifier, b.outcomeDescription AS outcome_outcomeDescription
FROM LogicModel a
  JOIN LogicModelProgramOutcome j ON j.modelId = a.id
  JOIN ProgramOutcome b ON b.id = j.outcomeId;
```

| id | modelIdentifier | layoutOrientation | outcome_id | outcome_outcomeIdentifier | outcome_outcomeDescription |
|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 1 | OUT-2476 | Legacy Assessment D |
| 1 | MOD-2065 | left_to_right | 2 | OUT-2479 | Regional Survey |
| 2 | MOD-2070 | top_to_bottom | 2 | OUT-2479 | Regional Survey |
| 2 | MOD-2070 | top_to_bottom | 3 | OUT-2482 | Seasonal Corridor |
| 3 | MOD-2075 | bottom_to_top | 3 | OUT-2482 | Seasonal Corridor |
| 3 | MOD-2075 | bottom_to_top | 4 | OUT-2485 | Integrated Series A |
| 4 | MOD-2080 | circular | 4 | OUT-2485 | Integrated Series A |
| 4 | MOD-2080 | circular | 1 | OUT-2476 | Legacy Assessment D |

This view joins `LogicModel` with `ProgramOutcome` through the `LogicModelProgramOutcome` junction table, answering: *What outcomes does each logic model prescribe?* For model `MOD-2065`, the view would surface the outcomes that the model expects programs to achieve.

**View `logic_model_causal_assumption_detail_view`**

```sql
CREATE VIEW logic_model_causal_assumption_detail_view AS
SELECT a.id, a.modelIdentifier, a.layoutOrientation, b.assumptionId AS assumption_assumptionId, b.assumptionIdentifier AS assumption_assumptionIdentifier, b.assumptionText AS assumption_assumptionText
FROM LogicModel a
  JOIN LogicModelCausalAssumption j ON j.modelId = a.id
  JOIN CausalAssumption b ON b.assumptionId = j.assumptionId;
```

| id | modelIdentifier | layoutOrientation | assumption_assumptionId | assumption_assumptionIdentifier | assumption_assumptionText |
|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 100 | ASS-2153 | pilot-assumpti-68 |
| 1 | MOD-2065 | left_to_right | 101 | ASS-2158 | extended-assumpti-69 |
| 2 | MOD-2070 | top_to_bottom | 101 | ASS-2158 | extended-assumpti-69 |
| 2 | MOD-2070 | top_to_bottom | 102 | ASS-2163 | integrated-assumpti-70 |
| 3 | MOD-2075 | bottom_to_top | 102 | ASS-2163 | integrated-assumpti-70 |
| 3 | MOD-2075 | bottom_to_top | 103 | ASS-2168 | seasonal-assumpti-71 |
| 4 | MOD-2080 | circular | 103 | ASS-2168 | seasonal-assumpti-71 |
| 4 | MOD-2080 | circular | 100 | ASS-2153 | pilot-assumpti-68 |

This view joins `LogicModel` with `CausalAssumption` through the `LogicModelCausalAssumption` junction table, answering: *What causal assumptions does each logic model articulate?* For model `MOD-2065`, the view would reveal the hypothesized causal mechanisms that underpin the model's logic chain.

**View `community_need_community_program_detail_view`**

```sql
CREATE VIEW community_need_community_program_detail_view AS
SELECT a.needId, a.needIdentifier, a.needDescription, b.id AS program_id, b.programIdentifier AS program_programIdentifier, b.programName AS program_programName
FROM CommunityNeed a
  JOIN CommunityNeedCommunityProgram j ON j.needId = a.needId
  JOIN CommunityProgram b ON b.id = j.programId;
```

| needId | needIdentifier | needDescription | program_id | program_programIdentifier | program_programName |
|---|---|---|---|---|---|
| 1 | NEE-2502 | Baseline Series D | 1 | PRO-2198 | Extended Review |
| 1 | NEE-2502 | Baseline Series D | 2 | PRO-2205 | Pilot Initiative A |
| 2 | NEE-2506 | Distributed Assessment | 2 | PRO-2205 | Pilot Initiative A |
| 2 | NEE-2506 | Distributed Assessment | 3 | PRO-2212 | Baseline Model |
| 3 | NEE-2510 | Adaptive Survey | 3 | PRO-2212 | Baseline Model |
| 3 | NEE-2510 | Adaptive Survey | 4 | PRO-2219 | Distributed Cluster |
| 4 | NEE-2514 | Primary Corridor A | 4 | PRO-2219 | Distributed Cluster |
| 4 | NEE-2514 | Primary Corridor A | 1 | PRO-2198 | Extended Review |

This view joins `CommunityNeed` with `CommunityProgram` through the `CommunityNeedCommunityProgram` junction table, answering: *Which programs address each community need?* For need `NEE-2502` (Baseline Series D, severity `low`, targeting `composite-target-21`), the view would reveal the programs that have been designed to address this specific need.

**View `community_need_program_outcome_detail_view`**

```sql
CREATE VIEW community_need_program_outcome_detail_view AS
SELECT a.needId, a.needIdentifier, a.needDescription, b.id AS outcome_id, b.outcomeIdentifier AS outcome_outcomeIdentifier, b.outcomeDescription AS outcome_outcomeDescription
FROM CommunityNeed a
  JOIN CommunityNeedProgramOutcome j ON j.needId = a.needId
  JOIN ProgramOutcome b ON b.id = j.outcomeId;
```

| needId | needIdentifier | needDescription | outcome_id | outcome_outcomeIdentifier | outcome_outcomeDescription |
|---|---|---|---|---|---|
| 1 | NEE-2502 | Baseline Series D | 1 | OUT-2476 | Legacy Assessment D |
| 1 | NEE-2502 | Baseline Series D | 2 | OUT-2479 | Regional Survey |
| 2 | NEE-2506 | Distributed Assessment | 2 | OUT-2479 | Regional Survey |
| 2 | NEE-2506 | Distributed Assessment | 3 | OUT-2482 | Seasonal Corridor |
| 3 | NEE-2510 | Adaptive Survey | 3 | OUT-2482 | Seasonal Corridor |
| 3 | NEE-2510 | Adaptive Survey | 4 | OUT-2485 | Integrated Series A |
| 4 | NEE-2514 | Primary Corridor A | 4 | OUT-2485 | Integrated Series A |
| 4 | NEE-2514 | Primary Corridor A | 1 | OUT-2476 | Legacy Assessment D |

This view joins `CommunityNeed` with `ProgramOutcome` through the `CommunityNeedProgramOutcome` junction table, answering: *Which program outcomes address each community need?* For need `NEE-2502`, the view would reveal the outcomes that are hypothesized to resolve this need, enabling impact tracing from need to outcome.

**View `program_input_community_program_view`**

```sql
CREATE VIEW program_input_community_program_view AS
SELECT a.id, a.inputIdentifier, a.inputName, a.resourceType, b.id AS program_id, b.programIdentifier AS program_programIdentifier, b.programName AS program_programName
FROM ProgramInput a JOIN CommunityProgram b ON a.programId = b.id;
```

| id | inputIdentifier | inputName | resourceType | program_id | program_programIdentifier | program_programName |
|---|---|---|---|---|---|---|
| 1 | INP-2641 | Seasonal Standard | financial | 1 | PRO-2198 | Extended Review |
| 2 | INP-2648 | Integrated Framework | human | 2 | PRO-2205 | Pilot Initiative A |
| 3 | INP-2655 | Extended Protocol D | material | 3 | PRO-2212 | Baseline Model |
| 4 | INP-2662 | Pilot Programme | informational | 4 | PRO-2219 | Distributed Cluster |

This view joins `ProgramInput` with `CommunityProgram` through the `CommunityProgramProgramInput` junction table, answering the inverse question: *Which programs consume each input resource?* For input `INP-2641` (Seasonal Standard, financial type, quantity `3.95`, cost `12.87`), the view would reveal the programs that have consumed this resource.

**View `program_input_program_activity_detail_view`**

```sql
CREATE VIEW program_input_program_activity_detail_view AS
SELECT a.id, a.inputIdentifier, a.inputName, b.activityId AS activity_activityId, b.activityIdentifier AS activity_activityIdentifier, b.activityName AS activity_activityName
FROM ProgramInput a
  JOIN ProgramInputProgramActivity j ON j.inputId = a.id
  JOIN ProgramActivity b ON b.activityId = j.activityId;
```

| id | inputIdentifier | inputName | activity_activityId | activity_activityIdentifier | activity_activityName |
|---|---|---|---|---|---|
| 1 | INP-2641 | Seasonal Standard | 1 | ACT-2184 | Composite Programme |
| 1 | INP-2641 | Seasonal Standard | 2 | ACT-2190 | Compact Standard A |
| 2 | INP-2648 | Integrated Framework | 2 | ACT-2190 | Compact Standard A |
| 2 | INP-2648 | Integrated Framework | 3 | ACT-2196 | Legacy Framework |
| 3 | INP-2655 | Extended Protocol D | 3 | ACT-2196 | Legacy Framework |
| 3 | INP-2655 | Extended Protocol D | 4 | ACT-2202 | Regional Protocol |
| 4 | INP-2662 | Pilot Programme | 4 | ACT-2202 | Regional Protocol |
| 4 | INP-2662 | Pilot Programme | 1 | ACT-2184 | Composite Programme |

This view joins `ProgramInput` with `ProgramActivity` through the `ProgramInputProgramActivity` junction table, answering: *Which activities consume each input resource?* For input `INP-2641`, the view would reveal the activities that depend on this resource, enabling resource dependency analysis.

**View `program_activity_community_program_view`**

```sql
CREATE VIEW program_activity_community_program_view AS
SELECT a.activityId, a.activityIdentifier, a.activityName, a.startDate, b.id AS program_id, b.programIdentifier AS program_programIdentifier, b.programName AS program_programName
FROM ProgramActivity a JOIN CommunityProgram b ON a.programId = b.id;
```

| activityId | activityIdentifier | activityName | startDate | program_id | program_programIdentifier | program_programName |
|---|---|---|---|---|---|---|
| 1 | ACT-2184 | Composite Programme | 2022-09-05T20:24:00 | 1 | PRO-2198 | Extended Review |
| 2 | ACT-2190 | Compact Standard A | 2023-02-16T03:41:00 | 2 | PRO-2205 | Pilot Initiative A |
| 3 | ACT-2196 | Legacy Framework | 2024-07-27T10:58:00 | 3 | PRO-2212 | Baseline Model |
| 4 | ACT-2202 | Regional Protocol | 2025-12-11T17:15:00 | 4 | PRO-2219 | Distributed Cluster |

This view joins `ProgramActivity` with `CommunityProgram` through the `CommunityProgramProgramActivity` junction table, answering the inverse question: *Which programs execute each activity?* For activity `ACT-2184` (Composite Programme, one_time frequency, duration `4.20`), the view would reveal the programs that have executed this activity.

**View `program_activity_program_input_detail_view`**

```sql
CREATE VIEW program_activity_program_input_detail_view AS
SELECT a.activityId, a.activityIdentifier, a.activityName, b.id AS input_id, b.inputIdentifier AS input_inputIdentifier, b.inputName AS input_inputName
FROM ProgramActivity a
  JOIN ProgramActivityProgramInput j ON j.activityId = a.activityId
  JOIN ProgramInput b ON b.id = j.inputId;
```

| activityId | activityIdentifier | activityName | input_id | input_inputIdentifier | input_inputName |
|---|---|---|---|---|---|
| 1 | ACT-2184 | Composite Programme | 1 | INP-2641 | Seasonal Standard |
| 1 | ACT-2184 | Composite Programme | 2 | INP-2648 | Integrated Framework |
| 2 | ACT-2190 | Compact Standard A | 2 | INP-2648 | Integrated Framework |
| 2 | ACT-2190 | Compact Standard A | 3 | INP-2655 | Extended Protocol D |
| 3 | ACT-2196 | Legacy Framework | 3 | INP-2655 | Extended Protocol D |
| 3 | ACT-2196 | Legacy Framework | 4 | INP-2662 | Pilot Programme |
| 4 | ACT-2202 | Regional Protocol | 4 | INP-2662 | Pilot Programme |
| 4 | ACT-2202 | Regional Protocol | 1 | INP-2641 | Seasonal Standard |

This view joins `ProgramActivity` with `ProgramInput` through the `ProgramActivityProgramInput` junction table, answering: *Which inputs does each activity consume?* For activity `ACT-2184`, the view would reveal the input resources that the activity requires, enabling resource allocation analysis.

**View `program_activity_program_output_detail_view`**

```sql
CREATE VIEW program_activity_program_output_detail_view AS
SELECT a.activityId, a.activityIdentifier, a.activityName, b.id AS output_id, b.outputIdentifier AS output_outputIdentifier, b.outputName AS output_outputName
FROM ProgramActivity a
  JOIN ProgramActivityProgramOutput j ON j.activityId = a.activityId
  JOIN ProgramOutput b ON b.id = j.outputId;
```

| activityId | activityIdentifier | activityName | output_id | output_outputIdentifier | output_outputName |
|---|---|---|---|---|---|
| 1 | ACT-2184 | Composite Programme | 1 | OUT-2721 | Baseline Standard D |
| 1 | ACT-2184 | Composite Programme | 2 | OUT-2728 | Distributed Framework |
| 2 | ACT-2190 | Compact Standard A | 2 | OUT-2728 | Distributed Framework |
| 2 | ACT-2190 | Compact Standard A | 3 | OUT-2735 | Adaptive Protocol |
| 3 | ACT-2196 | Legacy Framework | 3 | OUT-2735 | Adaptive Protocol |
| 3 | ACT-2196 | Legacy Framework | 4 | OUT-2742 | Primary Programme A |
| 4 | ACT-2202 | Regional Protocol | 4 | OUT-2742 | Primary Programme A |
| 4 | ACT-2202 | Regional Protocol | 1 | OUT-2721 | Baseline Standard D |

This view joins `ProgramActivity` with `ProgramOutput` through the `ProgramActivityProgramOutput` junction table, answering: *Which outputs does each activity produce?* For activity `ACT-2184`, the view would reveal the outputs that the activity generates, enabling production chain analysis.

**View `program_activity_program_outcome_detail_view`**

```sql
CREATE VIEW program_activity_program_outcome_detail_view AS
SELECT a.activityId, a.activityIdentifier, a.activityName, b.id AS outcome_id, b.outcomeIdentifier AS outcome_outcomeIdentifier, b.outcomeDescription AS outcome_outcomeDescription
FROM ProgramActivity a
  JOIN ProgramActivityProgramOutcome j ON j.activityId = a.activityId
  JOIN ProgramOutcome b ON b.id = j.outcomeId;
```

| activityId | activityIdentifier | activityName | outcome_id | outcome_outcomeIdentifier | outcome_outcomeDescription |
|---|---|---|---|---|---|
| 1 | ACT-2184 | Composite Programme | 1 | OUT-2476 | Legacy Assessment D |
| 1 | ACT-2184 | Composite Programme | 2 | OUT-2479 | Regional Survey |
| 2 | ACT-2190 | Compact Standard A | 2 | OUT-2479 | Regional Survey |
| 2 | ACT-2190 | Compact Standard A | 3 | OUT-2482 | Seasonal Corridor |
| 3 | ACT-2196 | Legacy Framework | 3 | OUT-2482 | Seasonal Corridor |
| 3 | ACT-2196 | Legacy Framework | 4 | OUT-2485 | Integrated Series A |
| 4 | ACT-2202 | Regional Protocol | 4 | OUT-2485 | Integrated Series A |
| 4 | ACT-2202 | Regional Protocol | 1 | OUT-2476 | Legacy Assessment D |

This view joins `ProgramActivity` with `ProgramOutcome` through the `ProgramActivityProgramOutcome` junction table, answering: *Which outcomes does each activity contribute to?* For activity `ACT-2184`, the view would reveal the outcomes that the activity influences, enabling impact attribution.

**View `program_output_program_activity_view`**

```sql
CREATE VIEW program_output_program_activity_view AS
SELECT a.id, a.outputIdentifier, a.outputName, a.outputType, b.activityId AS activity_activityId, b.activityIdentifier AS activity_activityIdentifier, b.activityName AS activity_activityName
FROM ProgramOutput a JOIN ProgramActivity b ON a.activityId = b.activityId;
```

| id | outputIdentifier | outputName | outputType | activity_activityId | activity_activityIdentifier | activity_activityName |
|---|---|---|---|---|---|---|
| 1 | OUT-2721 | Baseline Standard D | service_count | 1 | ACT-2184 | Composite Programme |
| 2 | OUT-2728 | Distributed Framework | product_quantity | 2 | ACT-2190 | Compact Standard A |
| 3 | OUT-2735 | Adaptive Protocol | client_count | 3 | ACT-2196 | Legacy Framework |
| 4 | OUT-2742 | Primary Programme A | satisfaction_score | 4 | ACT-2202 | Regional Protocol |

This view joins `ProgramOutput` with `ProgramActivity` through the `ProgramActivityProgramOutput` junction table, answering the inverse question: *Which activity produces each output?* For output `OUT-2721` (Baseline Standard D, service_count type, value `19.95`, target `13.45`), the view would reveal the activity that produced it.

**View `program_output_program_outcome_detail_view`**

```sql
CREATE VIEW program_output_program_outcome_detail_view AS
SELECT a.id, a.outputIdentifier, a.outputName, b.id AS outcome_id, b.outcomeIdentifier AS outcome_outcomeIdentifier, b.outcomeDescription AS outcome_outcomeDescription
FROM ProgramOutput a
  JOIN ProgramOutputProgramOutcome j ON j.outputId = a.id
  JOIN ProgramOutcome b ON b.id = j.outcomeId;
```

| id | outputIdentifier | outputName | outcome_id | outcome_outcomeIdentifier | outcome_outcomeDescription |
|---|---|---|---|---|---|
| 1 | OUT-2721 | Baseline Standard D | 1 | OUT-2476 | Legacy Assessment D |
| 1 | OUT-2721 | Baseline Standard D | 2 | OUT-2479 | Regional Survey |
| 2 | OUT-2728 | Distributed Framework | 2 | OUT-2479 | Regional Survey |
| 2 | OUT-2728 | Distributed Framework | 3 | OUT-2482 | Seasonal Corridor |
| 3 | OUT-2735 | Adaptive Protocol | 3 | OUT-2482 | Seasonal Corridor |
| 3 | OUT-2735 | Adaptive Protocol | 4 | OUT-2485 | Integrated Series A |
| 4 | OUT-2742 | Primary Programme A | 4 | OUT-2485 | Integrated Series A |
| 4 | OUT-2742 | Primary Programme A | 1 | OUT-2476 | Legacy Assessment D |

This view joins `ProgramOutput` with `ProgramOutcome` through the `ProgramOutputProgramOutcome` junction table, answering: *Which outcomes does each output produce?* For output `OUT-2721`, the view would reveal the outcomes that the output contributes to, enabling output-to-outcome impact tracing.

**View `program_outcome_community_program_view`**

```sql
CREATE VIEW program_outcome_community_program_view AS
SELECT a.id, a.outcomeIdentifier, a.outcomeDescription, a.timeHorizon, b.id AS program_id, b.programIdentifier AS program_programIdentifier, b.programName AS program_programName
FROM ProgramOutcome a JOIN CommunityProgram b ON a.programId = b.id;
```

| id | outcomeIdentifier | outcomeDescription | timeHorizon | program_id | program_programIdentifier | program_programName |
|---|---|---|---|---|---|---|
| 1 | OUT-2476 | Legacy Assessment D | short_term | 1 | PRO-2198 | Extended Review |
| 2 | OUT-2479 | Regional Survey | medium_term | 2 | PRO-2205 | Pilot Initiative A |
| 3 | OUT-2482 | Seasonal Corridor | long_term | 3 | PRO-2212 | Baseline Model |
| 4 | OUT-2485 | Integrated Series A | short_term | 4 | PRO-2219 | Distributed Cluster |

This view joins `ProgramOutcome` with `CommunityProgram` through the `CommunityProgramProgramOutcome` junction table, answering the inverse question: *Which programs achieve each outcome?* This perspective is useful for outcome attribution — determining which programs are responsible for specific long-term changes.

**View `program_outcome_program_output_detail_view`**

```sql
CREATE VIEW program_outcome_program_output_detail_view AS
SELECT a.id, a.outcomeIdentifier, a.outcomeDescription, b.id AS output_id, b.outputIdentifier AS output_outputIdentifier, b.outputName AS output_outputName
FROM ProgramOutcome a
  JOIN ProgramOutcomeProgramOutput j ON j.outcomeId = a.id
  JOIN ProgramOutput b ON b.id = j.outputId;
```

| id | outcomeIdentifier | outcomeDescription | output_id | output_outputIdentifier | output_outputName |
|---|---|---|---|---|---|
| 1 | OUT-2476 | Legacy Assessment D | 1 | OUT-2721 | Baseline Standard D |
| 1 | OUT-2476 | Legacy Assessment D | 2 | OUT-2728 | Distributed Framework |
| 2 | OUT-2479 | Regional Survey | 2 | OUT-2728 | Distributed Framework |
| 2 | OUT-2479 | Regional Survey | 3 | OUT-2735 | Adaptive Protocol |
| 3 | OUT-2482 | Seasonal Corridor | 3 | OUT-2735 | Adaptive Protocol |
| 3 | OUT-2482 | Seasonal Corridor | 4 | OUT-2742 | Primary Programme A |
| 4 | OUT-2485 | Integrated Series A | 4 | OUT-2742 | Primary Programme A |
| 4 | OUT-2485 | Integrated Series A | 1 | OUT-2721 | Baseline Standard D |

This view joins `ProgramOutcome` with `ProgramOutput` through the `ProgramOutcomeProgramOutput` junction table, answering: *Which outputs contribute to each outcome?* For an outcome linked to need `NEE-2502`, the view would reveal the outputs that are hypothesized to produce it, enabling reverse-engineering of the causal chain.

**View `program_outcome_community_need_detail_view`**

```sql
CREATE VIEW program_outcome_community_need_detail_view AS
SELECT a.id, a.outcomeIdentifier, a.outcomeDescription, b.needId AS need_needId, b.needIdentifier AS need_needIdentifier, b.needDescription AS need_needDescription
FROM ProgramOutcome a
  JOIN ProgramOutcomeCommunityNeed j ON j.outcomeId = a.id
  JOIN CommunityNeed b ON b.needId = j.needId;
```

| id | outcomeIdentifier | outcomeDescription | need_needId | need_needIdentifier | need_needDescription |
|---|---|---|---|---|---|
| 1 | OUT-2476 | Legacy Assessment D | 1 | NEE-2502 | Baseline Series D |
| 1 | OUT-2476 | Legacy Assessment D | 2 | NEE-2506 | Distributed Assessment |
| 2 | OUT-2479 | Regional Survey | 2 | NEE-2506 | Distributed Assessment |
| 2 | OUT-2479 | Regional Survey | 3 | NEE-2510 | Adaptive Survey |
| 3 | OUT-2482 | Seasonal Corridor | 3 | NEE-2510 | Adaptive Survey |
| 3 | OUT-2482 | Seasonal Corridor | 4 | NEE-2514 | Primary Corridor A |
| 4 | OUT-2485 | Integrated Series A | 4 | NEE-2514 | Primary Corridor A |
| 4 | OUT-2485 | Integrated Series A | 1 | NEE-2502 | Baseline Series D |

This view joins `ProgramOutcome` with `CommunityNeed` through the `ProgramOutcomeCommunityNeed` junction table, answering: *Which community needs does each outcome address?* For an outcome, the view would reveal the needs it is designed to resolve, enabling need-to-outcome impact tracing.

**View `causal_assumption_program_input_detail_view`**

```sql
CREATE VIEW causal_assumption_program_input_detail_view AS
SELECT a.assumptionId, a.assumptionIdentifier, a.assumptionText, b.id AS input_id, b.inputIdentifier AS input_inputIdentifier, b.inputName AS input_inputName
FROM CausalAssumption a
  JOIN CausalAssumptionProgramInput j ON j.assumptionId = a.assumptionId
  JOIN ProgramInput b ON b.id = j.inputId;
```

| assumptionId | assumptionIdentifier | assumptionText | input_id | input_inputIdentifier | input_inputName |
|---|---|---|---|---|---|
| 100 | ASS-2153 | pilot-assumpti-68 | 1 | INP-2641 | Seasonal Standard |
| 100 | ASS-2153 | pilot-assumpti-68 | 2 | INP-2648 | Integrated Framework |
| 101 | ASS-2158 | extended-assumpti-69 | 2 | INP-2648 | Integrated Framework |
| 101 | ASS-2158 | extended-assumpti-69 | 3 | INP-2655 | Extended Protocol D |
| 102 | ASS-2163 | integrated-assumpti-70 | 3 | INP-2655 | Extended Protocol D |
| 102 | ASS-2163 | integrated-assumpti-70 | 4 | INP-2662 | Pilot Programme |
| 103 | ASS-2168 | seasonal-assumpti-71 | 4 | INP-2662 | Pilot Programme |
| 103 | ASS-2168 | seasonal-assumpti-71 | 1 | INP-2641 | Seasonal Standard |

This view joins `CausalAssumption` with `ProgramInput` through the `CausalAssumptionProgramInput` junction table, answering: *Which inputs does each causal assumption reference?* For a causal assumption, the view would reveal the input resources that the assumption hypothesizes as causal factors.

**View `causal_assumption_program_activity_detail_view`**

```sql
CREATE VIEW causal_assumption_program_activity_detail_view AS
SELECT a.assumptionId, a.assumptionIdentifier, a.assumptionText, b.activityId AS activity_activityId, b.activityIdentifier AS activity_activityIdentifier, b.activityName AS activity_activityName
FROM CausalAssumption a
  JOIN CausalAssumptionProgramActivity j ON j.assumptionId = a.assumptionId
  JOIN ProgramActivity b ON b.activityId = j.activityId;
```

| assumptionId | assumptionIdentifier | assumptionText | activity_activityId | activity_activityIdentifier | activity_activityName |
|---|---|---|---|---|---|
| 100 | ASS-2153 | pilot-assumpti-68 | 1 | ACT-2184 | Composite Programme |
| 100 | ASS-2153 | pilot-assumpti-68 | 2 | ACT-2190 | Compact Standard A |
| 101 | ASS-2158 | extended-assumpti-69 | 2 | ACT-2190 | Compact Standard A |
| 101 | ASS-2158 | extended-assumpti-69 | 3 | ACT-2196 | Legacy Framework |
| 102 | ASS-2163 | integrated-assumpti-70 | 3 | ACT-2196 | Legacy Framework |
| 102 | ASS-2163 | integrated-assumpti-70 | 4 | ACT-2202 | Regional Protocol |
| 103 | ASS-2168 | seasonal-assumpti-71 | 4 | ACT-2202 | Regional Protocol |
| 103 | ASS-2168 | seasonal-assumpti-71 | 1 | ACT-2184 | Composite Programme |

This view joins `CausalAssumption` with `ProgramActivity` through the `CausalAssumptionProgramActivity` junction table, answering: *Which activities does each causal assumption reference?* For a causal assumption, the view would reveal the activities that the assumption hypothesizes as causal mechanisms.

## Synthesis

The schema models a community program logic model as a network of interconnected entity types, each with its own attributes and lifecycle. The eight base tables capture the core concepts — programs, models, needs, inputs, activities, outputs, outcomes, and causal assumptions — while the twenty-one junction tables resolve the many-to-many relationships between them. The twenty-seven views provide denormalized perspectives that answer specific analytical questions, from program-to-model mapping to need-to-outcome impact tracing. Together, these tables and views form a complete relational representation of the logic model ontology, enabling both operational management of community programs and analytical assessment of their causal effectiveness.