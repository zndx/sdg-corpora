---
chapter_id: ch_live_equiv_intersect_basic_7f8ca6
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_intersect_basic', 'directive_only_governs_artifact', 'descriptive_either_evidence_or_claim']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the structural backbone of any compliance and governance data model, enabling precise tracking of regulatory obligations, their scope, and the evidence supporting adherence. At the core of this architecture are identifiers—unique keys that anchor every entity in the system. Directive-to-artifact relationships carry identifiers such as ARTI-0001 through ARTI-0004, while equivalence intersections between system components use identifiers like INTE-0001 through INTE-0004, and descriptive evidence or claims are tagged with identifiers ranging from CLAI-0001 through CLAI-0004. These identifiers serve as the primary reference points across all tables, ensuring that every attribute value can be traced back to a specific entity and that relationships between directives, artifacts, and evidence remain unambiguous.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | GDPR Compliance Mandate | Data Lake Metadata Catalog |
| ARTI-0004 | PCI DSS v4.0 Compliance | Data Lake Metadata Catalog |
| ARTI-0005 | FISMA Moderate Baseline | Laboratory Reagent Inventory |
| ARTI-0006 | OWASP Top Ten Control | Access Control Matrices |
| ARTI-0007 | NIST Cybersecurity Framework | Sensor Data Streams |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Attribute types define the semantic shape of the data stored against each entity, enforcing type safety and enabling consistent querying across heterogeneous value stores. In the directive-governance layer, attributes such as effective_date, enforcement, mandatory, and priority are declared with corresponding types of xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. The same pattern appears in the evidence and claims domain, where attributes like confidence, dimension_kind, method, and recorded_at are typed as xsd:decimal, xsd:string, xsd:string, and xsd:dateTime. This type discipline is critical because it dictates how values are stored, validated, and interpreted—boolean attributes such as mandatory are persisted in dedicated boolean value tables, date attributes like effective_date in their own date tables, and integer attributes such as priority in integer value tables. The separation of value storage by type ensures that each attribute's semantic meaning is preserved and that type-specific operations—date arithmetic, boolean logic, decimal precision—can be applied correctly.

Entities in this model represent the concrete objects of governance: the directives themselves, the artifacts they govern, and the evidence or claims documenting compliance. A directive such as ISO 27001 Security Policy governs the artifact Sensor Data Streams, while SOC 2 Type II Standard governs Network Access Control Lists, and both GDPR Compliance Mandate and PCI DSS v4.0 Compliance govern the Data Lake Metadata Catalog. Each of these directive-artifact relationships is an entity in its own right, carrying attributes that describe the nature of the governance obligation. For instance, the mandatory attribute for the ISO 27001 relationship holds the value true, indicating that compliance is non-negotiable, while the PCI DSS relationship records mandatory as false, suggesting a different enforcement posture. Similarly, the effective_date attribute captures when each governance obligation takes effect—2023-09-27 for the ISO 27001 relationship, 2025-04-15 for SOC 2, 2024-03-21 for GDPR, and 2024-02-09 for PCI DSS—enabling temporal queries about which obligations were active at any given point.

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

The value layer of the model stores actual attribute values in type-specific tables, each linked back to its entity through an entity_id foreign key and to its attribute definition through an attr_id foreign key. This three-way linkage—entity, attribute, value—creates a flexible schema where new attributes can be added without schema migrations, and where the same attribute can hold different values across different entities. For example, the mandatory attribute (attr_id ARTI-0003) holds the value true for entities ARTI-0001, ARTI-0002, and ARTI-0003, but false for ARTI-0004, reflecting varying enforcement requirements across different directive-artifact pairings. Priority attributes store integer values such as 5 and 959 for one entity and 4 and 97 for another, while string attributes capture descriptive values like Encoding 01, Enforcement 02, nightly summary, and en. In the evidence domain, decimal confidence values range from 0.015 to 92.51, recorded_at timestamps span from 2023-12-14T23:50:57 to 2025-04-28T22:05:41, and string attributes hold values such as Dimension Kind 01, Encoding 02, change rationale, and es.

Equivalence and intersection relationships, captured in tables like t_equiv_intersect_basic, model how system components relate to one another across multiple dimensions. An entry with identifier INTE-0001 links telemetry-baseline-set to fault-tolerance-layer and throughput-threshold, while INTE-0002 connects the same telemetry-baseline-set to policy-compliance-set and validation-matrix. These multi-dimensional relationships—where a single entity participates in intersections across three attribute dimensions (equiv, equiv_2, equiv_3)—enable complex queries about component interdependencies and compliance coverage. Descriptive evidence and claims follow a similar multi-dimensional pattern, with entries like CLAI-0001 pairing pipeline run log with checksum mismatch alert and validation rule set, and CLAI-0003 linking network latency trace with calibration certificate and chain of custody tag. Together, these structures create a comprehensive governance fabric where directives, artifacts, attributes, values, and evidence are all interconnected through well-defined foreign-key relationships, enabling auditors and operators to trace any compliance claim back to its governing directive, its target artifact, its supporting evidence, and the specific attribute values that substantiate it.

**t_equiv_intersect_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| INTE-0001 | telemetry-baseline-set | fault-tolerance-layer | throughput-threshold |
| INTE-0002 | telemetry-baseline-set | policy-compliance-set | replication-factor |
| INTE-0003 | telemetry-baseline-set | delta-sync-channel | validation-matrix |
| INTE-0004 | core-ingest-pipeline | validation-snapshot | throughput-threshold |
| INTE-0005 | sensor-fusion-node | partition-rebalance | error-rate-baseline |
| INTE-0006 | lineage-tracker | delta-sync-channel | circuit-breaker-state |
| INTE-0007 | query-optimizer-cache | checkpoint-manager | archival-mirror-set |