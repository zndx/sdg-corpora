---
chapter_id: ch_live_iso27001_clause_subclass_b83937
topic_id: 101
family: 07_long_tail
cited_terms: ['iso27001_clause_subclass', 'ganglion_cyst_tissue_origin', 'lineage_edge_subclass']
model: engine-refine
---

The architecture of controlled ontologies and compliance frameworks relies upon a tripartite relational pattern that separates entity definitions from their interconnections, thereby enabling flexible, role-aware associations between classified concepts. At the foundation, classification tables assign stable identifiers to domain-specific entities and attach categorical metadata; the ISO 27001 clause subclass table, for instance, anchors clauses such as CLAU-0001 through CLAU-0004 to their corresponding ISO references (Iso 01 through Iso 04), while the ganglion cyst tissue origin table maps anatomical origins like sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment to identifiers ORIG-0001 through ORIG-0004. A parallel enrichment table then resolves these identifiers to human-readable classifications—the ISO clause subclass table associates CLAU-0001 with Risk treatment, CLAU-0002 with Performance evaluation, CLAU-0003 with Improvement, and CLAU-0004 with Leadership, whereas the ganglion cyst tissue origin part-of table links the same ORIG-0001 through ORIG-0004 identifiers to connective tissue structures including periosteal layer, joint capsule, deep fascia, and fibrous adventitia. This separation of identity, classification, and relationship ensures that the same entity can participate in multiple association schemas without schema modification.

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

The relationship layer introduces the critical concepts of subject, target, and role, which together encode directed, typed edges between entities. In the ISO 27001 clause mapping table, the subject column (iso_id) references one clause subclass while the target column (iso27001_clause_id) references another, and the role column specifies the nature of the association—reviewer, contributor, or owner. For example, CLAU-0001 appears as a subject linked to CLAU-0001 as target with the role reviewer, while CLAU-0004 serves as subject linked to CLAU-0006 as target with the role contributor. The ganglion cyst tissue origin part-of relationship table follows the identical structural pattern: ORIG-0007 acts as subject connected to ORIG-0001 as target under the role reviewer, and ORIG-0002 connects to ORIG-0006 as target under the role owner. This uniform schema permits a single query engine to traverse relationships across entirely different domains—information security governance and anatomical classification—using the same join logic.

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

Confidence scores and label text provide the evidentiary metadata that distinguishes this relational architecture from a simple graph database. The lineage edge subclass table introduces a fourth domain—data provenance—where each edge carries a lineage type (NetworkTrafficDump, ManufacturingBatchTrace, FinancialLedgerSync), a from_source system (PostgreSQLRawDB, GCSRawZone, RESTAPIGateway, S3ArchivalBucket), a numeric confidence value ranging from 0.101 to 1.000, and a label_text (intake form, calibration record) that humanizes the automated association. A confidence of 1.000 on a FinancialLedgerSync edge originating from S3ArchivalBucket signals near-certainty in the provenance claim, whereas a confidence of 0.101 on a ManufacturingBatchTrace edge from GCSRawZone indicates substantial uncertainty requiring manual verification. These confidence values are not stored in the relationship tables themselves but reside in the lineage edge subclass table, demonstrating how confidence metadata is attached at the edge-definition level rather than the edge-instance level.

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

The identifier column serves as the universal key binding all three domains together, enabling cross-referencing between entity definitions, their classifications, and their relationships. The identifier CLAU-0001 appears in the ISO clause subclass table, in the ISO clause subclass-to-clause mapping table, and in the ISO clause relationship table, creating a consistent reference point across all three tables. Similarly, ORIG-0001 anchors the ganglion cyst tissue origin table, the ganglion cyst tissue origin part-of table, and the ganglion cyst tissue origin relationship table. This identifier discipline ensures referential integrity and supports the construction of composite queries that traverse from a high-level classification (such as Leadership) through its associated clause subclass (CLAU-0004) to its role-bearing relationships (contributor linking to CLAU-0006).

In practice, this three-table pattern—entity definition, classification enrichment, and role-bearing relationship—provides a reusable template for any domain requiring typed, attributed associations between classified concepts. The role column distinguishes between ownership, contribution, and review relationships, enabling governance workflows that assign accountability without duplicating entity data. The confidence column, present in the lineage edge subclass table but absent from the ISO and anatomical tables, illustrates how additional metadata columns can be added to specific edge types without disrupting the shared schema. The label_text column similarly provides human-readable annotations that complement the machine-readable confidence scores, ensuring that automated provenance tracking remains interpretable by human auditors. Together, these columns form a complete provenance and governance record that supports both algorithmic traversal and manual review.