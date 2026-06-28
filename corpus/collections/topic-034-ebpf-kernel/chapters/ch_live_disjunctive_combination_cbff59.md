---
chapter_id: ch_live_disjunctive_combination_cbff59
topic_id: 34
family: 07_long_tail
cited_terms: ['disjunctive_combination', 'division_assignment_record', 'division_eligibility_constraint']
model: engine-refine
---

Athlete-to-division assignment forms the operational backbone of competitive eligibility management, linking individual competitors to the divisions in which they are authorized to participate. Each assignment record carries an identifier, references a specific athlete through an assigns_athlete key, and points to a target division via an assigns_division key. The assignment is not binary; it is scored with a confidence value that quantifies the system's certainty in the linkage. In practice, confidence scores range from 0.083 to 0.806 across observed records, with lower values such as 0.257 and 0.083 flagging assignments that warrant manual review or additional validation. Each assignment also carries an uncertainty metric—values like 96.89, 738.86, and 740.08—that captures the magnitude of variance around the assignment, alongside a numeric value field that may represent a derived score or threshold relevant to the placement decision.

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

The athletes and divisions themselves are catalogued as dimensional entities, each carrying a human-readable label and a category classification. Athlete dimension records include labels such as Assigns Athlete Label 01 through Assigns Athlete Label 04, paired with corresponding category designations like Assigns Athlete Category 01 through Assigns Athlete Category 04. Division dimension records follow the same pattern, with labels and categories that enable grouping, filtering, and reporting across the competitive structure. These categorical tags are not merely descriptive; they feed directly into eligibility logic, as the category of an athlete and the category of a division jointly determine whether a proposed assignment is permissible under the governing rules.

Eligibility constraints encode the policy layer that governs which athletes may compete in which divisions. Each constraint record identifies a specific rule—EasternLeagueNovice, MountainWestOpen, or SouthernTierPro—and ties it to a required qualified_athlete_status such as AccreditedVeteran, EndorsedFreshman, or LicensedElite. The constraint also specifies a cross_division_transfer mechanism, which defines how an athlete may move between divisions: CircuitReroute, ZoneRedistribution, SectorTransfer, and LeagueBoundaryShift are the observed transfer types. Together, these three fields form a triad that determines whether an assignment is valid, under what conditions an athlete qualifies, and what procedural path governs inter-division movement.

To support data provenance and quality assurance, the system models disjunctive combinations—logical OR-based aggregations of data sources or validation signals. Each combination carries an identifier such as COMB-0001 and specifies its disjunctive type, whether Schema_validation_union or OR_filter_rule, along with the sources it combines, including sensor_primary_signal, archived_log, mirror_table, and backup_readout. These combinations are enriched with typed attributes: confidence values stored as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at timestamps as xsd:dateTime. Attribute values are stored in type-specialized tables, with decimal values like 0.084 and 689.68, string values such as Dimension Kind 01, Encoding 02, calibration record, and ja, and datetime values including 2023-12-19T10:56:22 and 2025-06-13T05:31:45. This schema allows the system to track which data sources contributed to a given assessment and with what temporal and methodological context.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | sensor_primary_signal |
| COMB-0002 | OR_filter_rule | archived_log |
| COMB-0003 | OR_filter_rule | mirror_table |
| COMB-0004 | Schema_validation_union | backup_readout |
| COMB-0005 | Metric_aggregation_branch | primary_readout |
| COMB-0006 | Compliance_check_union | backup_readout |

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

The identifier namespace unifies these disparate elements under a consistent referencing scheme. Assignment records use identifiers like RECO-0001 through RECO-0004, eligibility constraints use CONS-0001 through CONS-0004, and disjunctive combinations use COMB-0001 through COMB-0004. Foreign-key relationships bind the structure: assignment records reference athlete and division dimension keys, attribute value tables reference their parent entity and attribute identifiers, and constraint attributes link back to their governing constraint. This relational fabric ensures that every assignment can be traced to its supporting data sources, its governing eligibility rules, and its confidence assessment, providing an auditable chain from raw signal to final competitive placement.

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

**t_division_eligibility_constraint**

| id | division_eligibility_constraint | qualified_athlete_status | cross_division_transfer |
| --- | --- | --- | --- |
| CONS-0001 | EasternLeagueNovice | AccreditedVeteran | CircuitReroute |
| CONS-0002 | MountainWestOpen | AccreditedVeteran | ZoneRedistribution |
| CONS-0003 | MountainWestOpen | EndorsedFreshman | SectorTransfer |
| CONS-0004 | SouthernTierPro | LicensedElite | LeagueBoundaryShift |
| CONS-0005 | CentralStateSenior | ClearedAllStar | TierDowngrade |
| CONS-0006 | AtlanticZoneJunior | SanctionedContender | ConferenceSwitch |
| CONS-0007 | GreatLakesAmateur | CertifiedPro | ZoneRedistribution |

**t_division_eligibility_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | encoding | xsd:string |
| CONS-0002 | label_text | xsd:string |
| CONS-0003 | language | xsd:string |

**t_division_eligibility_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | pre-release note |
| CONS-0003 | CONS-0001 | CONS-0003 | fr |
| CONS-0004 | CONS-0002 | CONS-0001 | Encoding 04 |
| CONS-0005 | CONS-0002 | CONS-0002 | intake form |
| CONS-0006 | CONS-0002 | CONS-0003 | es |
| CONS-0007 | CONS-0003 | CONS-0001 | Encoding 07 |
| CONS-0008 | CONS-0003 | CONS-0002 | audit excerpt |