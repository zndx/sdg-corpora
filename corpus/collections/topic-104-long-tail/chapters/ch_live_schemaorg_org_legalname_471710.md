---
chapter_id: ch_live_schemaorg_org_legalname_471710
topic_id: 104
family: 07_long_tail
cited_terms: ['schemaorg_org_legalname', 'existential_anchored_to_artifact_via_part', 'disjunctive_combination']
model: engine-refine
---

In any structured data model, the identifier serves as the immutable anchor for every entity, a stable reference that persists across transformations and joins. Consider the corporate registry where entities such as NexusLabs, BioSynth, GlobalDataInc, and AeroSpaceX each carry a distinct identifier—LEGA-0001 through LEGA-0004—linking them to their corresponding legal names: TerraForma Holdings Ltd., CloudNative Solutions LLC, Global Data Systems LLC, and Acme Corporation. The identifier is not merely a surrogate key; it is the semantic handle by which downstream processes resolve, deduplicate, and audit records. When an entity carries multiple legal names or aliases, the relationship between the canonical schemaorg entry and each legal_name record is mediated through a junction table whose rows themselves bear identifiers and whose subject and target columns encode the directionality of the association. The role column further qualifies the relationship, distinguishing, for instance, whether a given legal_name was submitted as a reviewer's assertion, an observer's notation, or a contributor's declaration. This triad of subject, target, and role is the minimal pattern for any typed, role-bearing relationship in a normalized schema.

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | NexusLabs |
| LEGA-0002 | BioSynth |
| LEGA-0003 | GlobalDataInc |
| LEGA-0004 | AeroSpaceX |
| LEGA-0005 | QuantumEdge |
| LEGA-0006 | AcmeCorp |
| LEGA-0007 | GlobalDataInc |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |

The URI and location columns address two orthogonal dimensions of where an entity or its artifacts reside. The existential_anchored_to_artifact_via_part table demonstrates this duality: GovernanceRule77 is reachable at hdfs://cluster/staging and physically co-located on rack-7, while ObservationDrone04 and EdgeGateway-12 both point to abfss://prod/silver yet occupy distinct geographic or logical placements—eu-west-3 and on-prem-dc1 respectively. A LabSampleVial-7, meanwhile, shares rack-7 with GovernanceRule77 but is addressed via s3://lake/raw. The URI conveys the protocol-level addressability of a resource; the location conveys its physical or infrastructural placement. In governance frameworks, conflating the two leads to audit failures, because a URI can migrate across locations without changing its identifier, and a location can host multiple URIs simultaneously.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

Attributes and their types form the third pillar of the model, governing what properties an entity carries and how those properties are typed. The disjunctive_combination_attr table declares that a disjunctive combination such as Schema_validation_union or OR_filter_rule carries attributes named confidence, dimension_kind, method, and recorded_at, each bound to a precise type: xsd:decimal, xsd:string, xsd:string, and xsd:dateTime respectively. The attr_name column names the property; the attr_type column constrains its value domain. This separation of attribute definition from attribute value is essential for schema evolution, because adding a new attribute does not require altering existing value tables, and type enforcement can be applied at ingestion time.

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

Attribute values are materialized in dedicated value tables, each partitioned by type, and linked back to their owning entity and attribute through foreign keys. The entity column in t_disjunctive_combination_val_datetime, t_disjunctive_combination_val_decimal, and t_disjunctive_combination_val_varchar points to the disjunctive combination that owns the value, while the attr column points to the attribute definition. The misc column holds the actual value—2023-12-19T10:56:22 or 2025-06-13T05:31:45 in the datetime table, 0.084 or 689.68 in the decimal table, Dimension Kind 01 or calibration record in the varchar table. This type-partitioned value storage pattern avoids the null explosion of a wide EAV table while preserving the flexibility of an entity-attribute-value model. A single entity, COMB-0001, for example, carries a confidence of 0.084, a dimension_kind of Dimension Kind 01, a recorded_at timestamp of 2023-12-19T10:56:22, and a miscellaneous string value of calibration record, each residing in its own typed value table but unified through the shared entity and attr foreign keys.

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