---
chapter_id: ch_live_requirement_refines_83f4df
topic_id: 60
family: 03_directive_governance
cited_terms: ['requirement_refines', 'outlier_detection_with_baseline', 'home_electricity_reduction_program']
model: engine-refine
---

Reduction programs in residential energy management are catalogued by a stable identifier that anchors every downstream relationship, whether the program is the EcoHome Initiative, the SmartThermostat Rebate, the PowerDown Project, or the NetZero Home. Each program declares a targeted usage metric—Seasonal Peak, Daily kWh Consumption, or Base Load Baseline—that serves as the quantitative object of intervention. The identifier functions as the sole stable key across all association tables, ensuring that a program referenced as the subject in one relationship and the target in another resolves to the same entity without ambiguity. This design mirrors the practice of requirement traceability, where an identifier such as REFI-0001 ties a requirement like Access Control Matrix to its parent System Availability Target, with the scope column (team, regional, local, global) and language column (en, fr, es) providing the jurisdictional and linguistic context necessary for governance review.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | System Availability Target | team | es |
| REFI-0002 | Data Retention Policy | Network Latency Limit | regional | en |
| REFI-0003 | Data Retention Policy | Pipeline Throughput Goal | local | en |
| REFI-0004 | Data Retention Policy | GDPR Compliance | global | fr |

**t_home_electricity_reduction_program**

| id | reduction_program |
| --- | --- |
| PROG-0001 | EcoHome Initiative |
| PROG-0002 | SmartThermostat Rebate |
| PROG-0003 | PowerDown Project |
| PROG-0004 | NetZero Home |
| PROG-0005 | DemandResponse Trial |
| PROG-0006 | SmartThermostat Rebate |

**t_home_electricity_reduction_program_addresses_usage_metric**

| id | addresses_usage_metric |
| --- | --- |
| PROG-0001 | Seasonal Peak |
| PROG-0002 | Daily kWh Consumption |
| PROG-0003 | Base Load Baseline |
| PROG-0004 | Daily kWh Consumption |
| PROG-0005 | Base Load Baseline |
| PROG-0006 | Base Load Baseline |

**t_home_electricity_reduction_program__addresses_usage_metric**

| id | home_id | addresses_usage_metric_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | PROG-0004 | reviewer | Cardinality Note 01 |
| PROG-0002 | PROG-0001 | PROG-0006 | owner | Cardinality Note 02 |
| PROG-0003 | PROG-0001 | PROG-0006 | observer | Cardinality Note 03 |
| PROG-0004 | PROG-0006 | PROG-0002 | observer | Cardinality Note 04 |
| PROG-0005 | PROG-0002 | PROG-0005 | contributor | Cardinality Note 05 |
| PROG-0006 | PROG-0005 | PROG-0005 | contributor | Cardinality Note 06 |
| PROG-0007 | PROG-0003 | PROG-0003 | observer | Cardinality Note 07 |
| PROG-0008 | PROG-0006 | PROG-0002 | contributor | Cardinality Note 08 |

The association between programs and the participants they engage follows a deliberate two-hop pattern: a program row links to a participant descriptor—MultiGen Home, Property Manager, or SingleParent Household—through a junction table that introduces a role attribute. In the EcoHome Initiative, for instance, the program is associated with participant PROG-0007 under the role contributor, while the same program also connects to participant PROG-0003 under the role reviewer. This separation of the entity (the participant) from the relationship (the role) permits a single participant type to occupy multiple positions within a single program, and a single program to address multiple participant types with distinct expectations. The same structural discipline appears in outlier detection, where the outlier network latency jump (BASE-0001) is linked against the expected distribution (BASE-0005) with the role observer, and separately against the seasonal pattern (BASE-0004) with the role owner, allowing the same anomaly to be evaluated from different analytical perspectives without conflating the anomaly itself with the baselines against which it is measured.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

Cardinality notes provide the final layer of constraint on these associations, explicitly documenting whether a relationship is one-to-one, one-to-many, or many-to-many. In the program-to-metric junction, Cardinality Note 01 through Cardinality Note 04 accompany the links between home programs and usage metrics, clarifying whether a given program may address a metric once or repeatedly, and whether a metric may be consumed by multiple programs. The note Cardinality Note 03, for example, accompanies the association between home PROG-0001 and metric PROG-0006 under the role observer, signaling a specific multiplicity that differs from the one-to-one constraint implied by Cardinality Note 01 on the link between home PROG-0005 and metric PROG-0004 under the role reviewer. These notes are not metadata for their own sake; they are the operational specification that downstream systems use to enforce referential integrity, to generate validation rules, and to communicate capacity limits to stakeholders who consume the data.

Scope and language columns in the requirement refinement table extend this pattern of contextual annotation beyond energy programs into the broader governance fabric. A requirement such as Data Retention Policy may refine four distinct targets—System Availability Target, Network Latency Limit, Pipeline Throughput Goal, GDPR Compliance—each under a different scope (team, regional, local, global) and each rendered in a different language (en, fr, es). The scope column answers the question of jurisdiction: which organizational boundary does this refinement apply to? The language column answers the question of accessibility: in which linguistic register must the requirement be communicated to the relevant audience? Together with the identifier, these columns form a composite key that allows auditors to retrieve every refinement of a given requirement, filter by the applicable scope, and verify that the correct language version has been distributed to the correct audience.

The subject and target columns in the junction tables complete the relational model by distinguishing the initiating entity from the receiving entity in every association. In the program-to-participant link, home_id is the subject—the program that initiates the engagement—and targets_participant_id is the target—the participant who receives it. In the outlier-to-baseline link, outlier_id is the subject—the anomaly being evaluated—and against_id is the target—the baseline against which the evaluation occurs. The role column then qualifies the nature of the subject's relationship to the target: contributor, owner, reviewer, or observer. This triad of subject, target, and role is the fundamental unit of relationship semantics, and it appears consistently across all junction tables, whether the domain is energy reduction, outlier detection, or requirement refinement. The consistency of this pattern is what enables automated relationship traversal, cross-domain auditing, and the generation of governance reports that aggregate evidence from disparate data sources into a single coherent view.

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

**t_home_electricity_reduction_program_targets_participant**

| id | targets_participant |
| --- | --- |
| PROG-0001 | MultiGen Home |
| PROG-0002 | Property Manager |
| PROG-0003 | SingleParent Household |
| PROG-0004 | Property Manager |
| PROG-0005 | Suburban Dweller |
| PROG-0006 | Large Family Unit |
| PROG-0007 | Urban Apartment |

**t_home_electricity_reduction_program__targets_participant**

| id | home_id | targets_participant_id | role |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0001 | PROG-0007 | contributor |
| PROG-0002 | PROG-0003 | PROG-0002 | contributor |
| PROG-0003 | PROG-0002 | PROG-0007 | reviewer |
| PROG-0004 | PROG-0001 | PROG-0003 | reviewer |
| PROG-0005 | PROG-0006 | PROG-0004 | contributor |
| PROG-0006 | PROG-0003 | PROG-0007 | observer |
| PROG-0007 | PROG-0001 | PROG-0002 | contributor |
| PROG-0008 | PROG-0004 | PROG-0004 | contributor |