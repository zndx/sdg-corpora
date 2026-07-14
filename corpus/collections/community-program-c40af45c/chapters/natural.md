# Chapter 7 — Logic Models and Community Program Architecture

Community programs operate within complex ecosystems where resources, activities, outputs, and outcomes must be deliberately aligned to address identified community needs. A logic model serves as the structural backbone of such programs, mapping the causal chain from inputs through activities to outputs and ultimately to outcomes, all while making explicit the assumptions that connect each stage. This chapter examines the architecture of logic models as they are recorded and managed within a program management system, drawing on concrete examples from the operational data to illustrate how programs are designed, linked to community needs, and evaluated against their stated objectives.

## The Core Entities

At the center of the system are community programs, each identified by a unique program identifier and associated with a specific logic model. The  table records programs such as PRO-2198, titled "Extended Review," which was placed in a planning status with a specific_component scope, and PRO-2205, "Pilot Initiative A," which is currently active and covers an entire_program scope. Programs like PRO-2212 ("Baseline Model") and PRO-2219 ("Distributed Cluster") demonstrate the range of statuses—completed and terminated, respectively—alongside the organizational scope dimensions of organization_wide and specific_component. Each program carries a start date and an end date, and is linked to a logic model through its model identifier.

The  table defines the logical structure that governs each program. Logic models are identified by model identifiers such as MOD-2065 and MOD-2070, and specify a layout orientation—left_to_right, top_to_bottom, bottom_to_top, or circular—that determines how the causal chain is visually and conceptually organized. Verification and explicitness flags indicate whether a model has been formally verified (as MOD-2065 and MOD-2075 are) and whether its components are explicitly documented (as MOD-2070 and MOD-2080 are). The isMeaningful flag further distinguishes models that have been assessed for substantive relevance. Each logic model is tied to exactly one program, establishing a one-to-one relationship between the structural blueprint and the operational program.

Community needs form the external context that programs are designed to address. The  table catalogs needs such as NEE-2502 ("Baseline Series D") with a low severity level, NEE-2506 ("Distributed Assessment") rated at medium severity, NEE-2510 ("Adaptive Survey") at high severity, and NEE-2514 ("Primary Corridor A") at critical severity. Each need identifies a target population—composite-target-21, primary-target-22, adaptive-target-23, distributed-target-24—and a geographic scope ranging from distributed-geograph-78 to extended-geograph-81. These needs are the starting point for program design, and their linkage to programs is managed through dedicated association tables.

## Resources, Activities, Outputs, and Outcomes

Programs consume resources, execute activities, produce outputs, and generate outcomes. The  table records the resources allocated to each program. Inputs include financial resources such as INP-2641 ("Seasonal Standard") with a quantity of 3.95 and a cost of 12.87, human resources like INP-2648 ("Integrated Framework") with a quantity of 6.90 and a cost of 29.99, material resources such as INP-2655 ("Extended Protocol D"), and informational resources like INP-2662 ("Pilot Programme"). Each input carries an acquisition date and timestamps for when it was created and last updated, providing an audit trail for resource management.

The  table captures the actions taken by programs. Activities include ACT-2184 ("Composite Programme") executed as a one_time event with a duration of 4.20, ACT-2190 ("Compact Standard A") conducted daily with a duration of 8.40, ACT-2196 ("Legacy Framework") performed weekly with a duration of 12.60, and ACT-2202 ("Regional Protocol") carried out monthly with a duration of 16.80. Each activity has a defined start and end date, and is associated with a specific program.

Outputs represent the direct products of activities. The  table records outputs such as OUT-2721 ("Baseline Standard D"), a service_count with a measured value of 19.95 against a target of 13.45, and OUT-2728 ("Distributed Framework"), a product_quantity with a value of 21.90 against a target of 15.90. Other outputs include OUT-2735 ("Adaptive Protocol"), a client_count measuring 23.85 against a target of 18.35, and OUT-2742 ("Primary Programme A"), a satisfaction_score of 25.80 against a target of 20.80. Each output is linked to a specific activity and carries a measurement date.

Outcomes represent the longer-term changes that programs aim to achieve. The  table records these results, though the specific outcome records are accessed through the join and view structures described below. Causal assumptions, recorded in the  table, articulate the beliefs about why inputs lead to activities, activities lead to outputs, and outputs lead to outcomes. These assumptions are essential for program evaluation, as they make the implicit reasoning explicit and subject to testing.

## Linking Programs to Needs and Models

The relationship between community programs and community needs is managed through the  table, which creates many-to-many associations between programs and the needs they are designed to address. This linkage ensures that every program can be traced back to the specific community need it targets. The  table provides the inverse perspective, organizing needs by the programs that respond to them.

Programs are linked to logic models through the , , , and  tables, which establish which inputs, activities, outputs, and outcomes are part of a given logic model. The  table similarly links causal assumptions to logic models, ensuring that the reasoning behind each model is documented and accessible.

Within programs, the flow from inputs to activities to outputs to outcomes is captured through a series of association tables. The  table links programs to their inputs, while the , , and  tables establish the program-level connections to each stage of the causal chain. The  table specifies which inputs are consumed by which activities, and the  table provides the inverse mapping.

The progression from activities to outputs is recorded in the  table, with the  table capturing the direct activity-to-outcome relationships. The  table links outputs to outcomes, and the  table provides the reverse mapping. Finally, the  table connects outcomes back to the community needs they are intended to address, completing the causal loop from need identification through program execution to need resolution.

Causal assumptions are further linked to specific resources and actions through the  and  tables, ensuring that every assumption can be traced to the concrete inputs and activities it pertains to.

## View-Based Perspectives on Program Architecture

The system provides a comprehensive set of views that join these tables to answer specific analytical questions about program design and execution. Each view presents a particular lens through which practitioners can examine the program architecture.

The  presents a consolidated view of each community program alongside its associated logic model, answering the question of which programs use which models and what the characteristics of those models are. A row from this view might show PRO-2198 ("Extended Review") linked to MOD-2065 with a left_to_right orientation, where the model is verified but neither explicit nor meaningful.

The  joins community programs with their associated community needs, revealing which programs target which needs. This view helps practitioners verify that every identified need has at least one program addressing it, and that programs are not duplicating effort across multiple needs unnecessarily.

The  provides a detailed view of each program's inputs, showing the input name, resource type, quantity, cost, and acquisition date alongside the program details. This view is essential for budget analysis and resource allocation decisions.

The  joins programs with their activities, presenting the activity name, frequency, duration, and date range alongside program information. This view supports scheduling and capacity planning by showing the temporal and operational characteristics of each program's activities.

The  connects programs to their outputs, displaying the output name, type, measured value, target value, and measurement date. This view enables practitioners to assess whether programs are meeting their output targets—for instance, checking whether OUT-2721's service_count of 19.95 exceeds its target of 13.45.

The  links programs to their outcomes, providing a view of the longer-term results that programs are generating. This view is critical for outcome-based evaluation and for demonstrating the impact of programs to stakeholders.

The  presents the inverse of the first view, organizing programs by their logic models and showing which programs share the same structural blueprint. This view is useful for identifying patterns across programs that use the same model.

The , , , and  views each provide detailed perspectives on the inputs, activities, outputs, and outcomes that constitute a given logic model. These views answer the question of what resources, actions, products, and results are encompassed within a specific model, enabling model-level analysis and comparison.

The  presents the causal assumptions associated with each logic model, making the reasoning behind the model's structure explicit and accessible for review and validation.

The  and  views provide need-centric perspectives, showing which programs address each need and what outcomes have been achieved in response to each need. These views support needs-based portfolio analysis.

The  and  views offer input-centric perspectives, showing which programs use each input and which activities consume each input. These views support resource utilization analysis.

The , , , and  views provide activity-centric perspectives, showing the program context, input consumption, output production, and outcome generation associated with each activity. These views support activity-level performance analysis.

The  and  views present output-centric perspectives, linking outputs to their source activities and their downstream outcomes. These views support output-level evaluation.

The , , and  views provide outcome-centric perspectives, showing which programs generate each outcome, which outputs contribute to each outcome, and which community needs are addressed by each outcome. These views support outcome-level impact analysis.

The  and  views present assumption-centric perspectives, showing which inputs and activities are associated with each causal assumption. These views support assumption validation by linking abstract reasoning to concrete program elements.

## Synthesis

The architecture described above provides a comprehensive framework for designing, implementing, and evaluating community programs. By explicitly recording the relationships between community needs, programs, logic models, inputs, activities, outputs, outcomes, and causal assumptions, the system enables practitioners to trace the full causal chain from need identification through program execution to need resolution. The join tables ensure that these relationships are flexible and many-to-many where appropriate, while the views provide multiple analytical perspectives for examining the program portfolio. This structured approach to program management supports evidence-based decision-making, facilitates accountability, and enables continuous improvement of community interventions.

## Data appendix

**Table `CommunityProgram`**

| id | programIdentifier | programName | startDate | endDate | status | scope | modelId |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | specific_component | 1 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | entire_program | 2 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | organization_wide | 3 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | terminated | specific_component | 4 |

**Table `LogicModel`**

| id | modelIdentifier | layoutOrientation | creationDate | isVerified | isExplicit | isMeaningful | programId |
|---|---|---|---|---|---|---|---|
| 1 | MOD-2065 | left_to_right | 2022-01-13T12:24:00 | true | false | false | 1 |
| 2 | MOD-2070 | top_to_bottom | 2023-06-24T19:41:00 | false | true | true | 2 |
| 3 | MOD-2075 | bottom_to_top | 2024-11-08T02:58:00 | true | false | false | 3 |
| 4 | MOD-2080 | circular | 2025-04-19T09:15:00 | false | true | true | 4 |

**Table `CommunityNeed`**

| needId | needIdentifier | needDescription | severityLevel | targetPopulation | geographicScope |
|---|---|---|---|---|---|
| 1 | NEE-2502 | Baseline Series D | low | composite-target-21 | distributed-geograph-78 |
| 2 | NEE-2506 | Distributed Assessment | medium | primary-target-22 | baseline-geograph-79 |
| 3 | NEE-2510 | Adaptive Survey | high | adaptive-target-23 | pilot-geograph-80 |
| 4 | NEE-2514 | Primary Corridor A | critical | distributed-target-24 | extended-geograph-81 |

**Table `ProgramInput`**

| id | inputIdentifier | inputName | resourceType | quantity | cost | acquisitionDate | programId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | INP-2641 | Seasonal Standard | financial | 3.95 | 12.87 | 2023-02-07T01:39:00 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | INP-2648 | Integrated Framework | human | 6.90 | 29.99 | 2024-07-18T08:56:00 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | INP-2655 | Extended Protocol D | material | 9.85 | 12.36 | 2025-12-02T15:13:00 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | INP-2662 | Pilot Programme | informational | 12.80 | 37.54 | 2022-05-13T22:30:00 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `ProgramActivity`**

| activityId | activityIdentifier | activityName | startDate | endDate | frequency | duration | programId |
|---|---|---|---|---|---|---|---|
| 1 | ACT-2184 | Composite Programme | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | one_time | 4.20 | 1 |
| 2 | ACT-2190 | Compact Standard A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | daily | 8.40 | 2 |
| 3 | ACT-2196 | Legacy Framework | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | weekly | 12.60 | 3 |
| 4 | ACT-2202 | Regional Protocol | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | monthly | 16.80 | 4 |

**Table `ProgramOutput`**

| id | outputIdentifier | outputName | outputType | value | measurementDate | targetValue | activityId |
|---|---|---|---|---|---|---|---|
| 1 | OUT-2721 | Baseline Standard D | service_count | 19.95 | 2024-07-01T18:54:00 | 13.45 | 1 |
| 2 | OUT-2728 | Distributed Framework | product_quantity | 21.90 | 2025-12-12T01:11:00 | 15.90 | 2 |
| 3 | OUT-2735 | Adaptive Protocol | client_count | 23.85 | 2022-05-23T08:28:00 | 18.35 | 3 |
| 4 | OUT-2742 | Primary Programme A | satisfaction_score | 25.80 | 2023-10-07T15:45:00 | 20.80 | 4 |

**Table `ProgramOutcome`**

| id | outcomeIdentifier | outcomeDescription | timeHorizon | changeDirection | targetLevel | measurableValue | measurementDate | programId |
|---|---|---|---|---|---|---|---|---|
| 1 | OUT-2476 | Legacy Assessment D | short_term | increased | individual | 11.95 | 2024-07-01T18:54:00 | 1 |
| 2 | OUT-2479 | Regional Survey | medium_term | decreased | group | 14.90 | 2025-12-12T01:11:00 | 2 |
| 3 | OUT-2482 | Seasonal Corridor | long_term | improved | community | 17.85 | 2022-05-23T08:28:00 | 3 |
| 4 | OUT-2485 | Integrated Series A | short_term | enhanced | individual | 20.80 | 2023-10-07T15:45:00 | 4 |

**Table `CausalAssumption`**

| assumptionId | assumptionIdentifier | assumptionText | confidenceLevel | isVerified | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 100 | ASS-2153 | pilot-assumpti-68 | low | true | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | ASS-2158 | extended-assumpti-69 | medium | false | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | ASS-2163 | integrated-assumpti-70 | high | true | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | ASS-2168 | seasonal-assumpti-71 | low | false | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

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
