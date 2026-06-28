---
chapter_id: ch_live_lineage_edge_subclass_d0f4eb
topic_id: 67
family: 05_provo_lineage
cited_terms: ['lineage_edge_subclass', 'dempster_conflict_mass', 'labrun_basic']
model: engine-refine
---

Within data lineage and provenance frameworks, every observable datum is anchored by a stable identifier that guarantees referential integrity across heterogeneous sources. Lineage edges carry identifiers such as EDGE-0001 through EDGE-0004, while laboratory run records are keyed by LABR-0001 through LABR-0004, and Dempster-Shafer conflict mass entries by MASS-0001 through MASS-0004. These identifiers serve as the immutable handles by which entities—discrete operational objects like a Microplate_Scan_9A or a ManufacturingBatchTrace—are tracked across their lifecycle. An entity is not merely a row in a table but a conceptual unit of provenance that accumulates attributes over time, and it is the entity identifier that binds attribute values back to the correct provenance context. When a decimal value of 1438.98 is recorded against entity LABR-0001, or a datetime stamp of 2025-01-01T00:58:28 is associated with the same entity, the entity_id column is the structural guarantee that these measurements belong to the same laboratory run and not to some other concurrent operation.

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

Attributes and their types form the schema of observability: each attribute name—duration_seconds, end_time, exit_code, host_name—describes a dimension of the entity, while the attribute type constrains the domain of permissible values to xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This typed attribute model enables a value-attribute-entity triad that is both flexible and rigorously typed. Decimal values such as 6523.97 or 7176.32 are stored in a dedicated value table keyed by entity and attribute, integer exit codes like 918 or 674 in another, datetime stamps like 2023-02-28T02:17:46 in a third, and free-form strings such as edge-03, Log Level 02, execution, or complete in a fourth. The separation of value types by schema is not an artifact of implementation but a deliberate design choice that preserves type safety while allowing the attribute model to scale without schema migrations. The misc column, which holds these actual values, is the terminal node of the provenance chain—the raw observation itself, unmediated and directly comparable.

Confidence and uncertainty quantify the epistemic state of every provenance assertion. Confidence scores range from near-zero—0.014 for one conflict mass entry, 0.101 for a lineage edge originating from GCSRawZone—to perfect certainty at 1.000 for a FinancialLedgerSync edge. These scores are not arbitrary; they reflect the assessed reliability of the data source, the completeness of the observation, or the degree of agreement among independent measurements. Uncertainty, measured on a scale that extends to 687.80 for one Dempster-Shafer fact and down to 9.49 for another, captures the residual ignorance that remains after confidence has been assigned. In the Dempster-Shafer framework, confidence and uncertainty are complementary dimensions of belief: a conflict mass fact with a confidence of 0.728 and an uncertainty of 479.57 represents a situation where substantial belief has been assigned to a proposition, yet a significant body of evidence remains uncommitted. The value column in these facts—846.10, 520.46, 137.18, 197.61—encodes the numerical mass assigned, and the conflict_mass_key column links each fact to its corresponding dimension record.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

Conflict mass itself is the mechanism by which contradictory evidence is quantified and managed. Each conflict mass entry carries a label—Conflict Mass Label 01 through Conflict Mass Label 04—and a category—Conflict Mass Category 01 through Conflict Mass Category 04—that together provide the semantic context for the numerical assessment. These labels and categories are not decorative; they classify the nature of the conflict, whether it arises from source disagreement, temporal inconsistency, or structural mismatch. The lineage edge subclass table extends this concept by attaching label_text values such as intake form and calibration record to edges that connect sources like PostgreSQLRawDB, GCSRawZone, RESTAPIGateway, and S3ArchivalBucket. A calibration record edge with confidence 1.000 from S3ArchivalBucket signals a fully trusted provenance link, while an intake form edge with confidence 0.584 from PostgreSQLRawDB indicates moderate assurance. The lineage column—NetworkTrafficDump, ManufacturingBatchTrace, FinancialLedgerSync—identifies the domain of the edge, ensuring that conflict mass assessments are interpreted within the correct operational context.

**t_lineage_edge_subclass**

| id | lineage | from_source | confidence | label_text |
| --- | --- | --- | --- | --- |
| EDGE-0001 | NetworkTrafficDump | PostgreSQLRawDB | 0.584 | intake form |
| EDGE-0002 | ManufacturingBatchTrace | GCSRawZone | 0.101 | calibration record |
| EDGE-0003 | ManufacturingBatchTrace | RESTAPIGateway | 0.280 | intake form |
| EDGE-0004 | FinancialLedgerSync | S3ArchivalBucket | 1.000 | calibration record |
| EDGE-0005 | ManufacturingBatchTrace | RedisCacheStore | 0.544 | audit excerpt |
| EDGE-0006 | NetworkTrafficDump | OracleERPSystem | 0.796 | calibration record |
| EDGE-0007 | PatientAdmissionRecord | RedisCacheStore | 0.907 | change rationale |
| EDGE-0008 | InventoryReconciliation | KafkaEventsStream | 0.508 | audit excerpt |