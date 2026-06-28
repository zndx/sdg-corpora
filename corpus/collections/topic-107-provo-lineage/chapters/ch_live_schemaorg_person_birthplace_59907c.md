---
chapter_id: ch_live_schemaorg_person_birthplace_59907c
topic_id: 107
family: 07_long_tail
cited_terms: ['schemaorg_person_birthplace', 'constraint_basic', 'profile_has_distribution']
model: engine-refine
---

Every governed data artifact requires a rigorous provenance chain, anchored by a unique identifier that persists across revision cycles and distribution channels. The lineage of each schema object is traced through a birthplace registry, where origin points are classified into discrete category buckets such as Birthplace Category 01 through Birthplace Category 04, ensuring that downstream consumers can immediately assess the trust boundary and regulatory jurisdiction of incoming metadata. Storage footprints are explicitly quantified in size_bytes, with registered artifacts ranging from 114,301,972 bytes for compact rule sets to 998,785,819 bytes for expansive registry dumps, allowing capacity planners to forecast archival costs and network egress limits with precision. Concurrently, a version counter increments with each structural modification, cycling through revisions 3, 4, 5, and 8 to guarantee that downstream pipelines consume exactly the intended schema iteration rather than an unvalidated predecessor, thereby eliminating drift-induced compliance failures.

**fact_schemaorg**

| id | birthplace_key | size_bytes | version |
| --- | --- | --- | --- |
| BIRT-0001 | BIRT-0006 | 895265030 | 3 |
| BIRT-0002 | BIRT-0002 | 114301972 | 5 |
| BIRT-0003 | BIRT-0001 | 338701831 | 4 |
| BIRT-0004 | BIRT-0005 | 998785819 | 8 |

**dim_birthplace**

| id | birthplace_label | birthplace_category |
| --- | --- | --- |
| BIRT-0001 | Birthplace Label 01 | Birthplace Category 01 |
| BIRT-0002 | Birthplace Label 02 | Birthplace Category 02 |
| BIRT-0003 | Birthplace Label 03 | Birthplace Category 03 |
| BIRT-0004 | Birthplace Label 04 | Birthplace Category 04 |
| BIRT-0005 | Birthplace Label 05 | Birthplace Category 05 |
| BIRT-0006 | Birthplace Label 06 | Birthplace Category 06 |

**t_profile_has_distribution**

| id | profile | distribution |
| --- | --- | --- |
| DIST-0001 | Schema Evolution Registry | Kafka Topic Stream |
| DIST-0002 | Anomaly Detection Ruleset | JSON Schema Registry |
| DIST-0003 | Schema Validation Profile | XML Metadata Archive |
| DIST-0004 | Schema Evolution Registry | Parquet Dataset |
| DIST-0005 | Data Contract Specification | JSON Schema Registry |
| DIST-0006 | Lineage Tracking Map | Parquet Dataset |

Structural integrity is maintained through a constraint matrix that codifies operational boundaries, ranging from cryptographic mandates like ENCRYPTION_AES256 to payload limits such as PACKET_SIZE_MAX_1500 and cardinality guards like MAX_LENGTH_255. Each restriction carries a human-readable labeltext—designated as nightly summary, intake form, or pre-release note—to bridge the gap between machine-readable policy and auditor comprehension. The application of these rules is strictly governed by an enforcement posture, predominantly configured as blocking to halt nonconforming payloads at the ingress gateway, with selective mandatory flags reserved for legacy compatibility layers. This triad of constraint definition, descriptive labeling, and enforcement posture ensures that compliance boundaries are both programmatically actionable and administratively transparent, preventing unauthorized schema mutations from propagating into production environments.

**t_constraint_basic**

| id | constraint | enforcement | label_text |
| --- | --- | --- | --- |
| CONS-0001 | ENCRYPTION_AES256 | blocking | nightly summary |
| CONS-0002 | UNIQUE_EMAIL | blocking | intake form |
| CONS-0003 | PACKET_SIZE_MAX_1500 | mandatory | intake form |
| CONS-0004 | MAX_LENGTH_255 | blocking | pre-release note |
| CONS-0005 | MAX_LENGTH_255 | advisory | calibration record |
| CONS-0006 | CHECK_AGE_POSITIVE | advisory | change rationale |
| CONS-0007 | NOT_NULL | mandatory | change rationale |

Metadata extensibility relies on a disciplined attribute registry where each attr is paired with a strict attr_type to prevent type coercion and ensure query predictability across heterogeneous storage backends. Numeric confidence scores are bound to xsd:decimal, while categorical dimension_kind and method fields are constrained to xsd:string, and temporal checkpoints like recorded_at are locked to xsd:dateTime. These typed attributes do not exist in isolation; they are resolved against a concrete entity, which serves as the primary anchor linking abstract schema definitions to their instantiated values. Whether the distribution originates from a Kafka Topic Stream, a JSON Schema Registry, or a Parquet Dataset, the entity reference guarantees that attribute lookups remain deterministic, enabling auditors to reconstruct exactly which profile rules applied to which data slice at any given ingestion window.

**t_profile_has_distribution_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

**t_profile_has_distribution_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-01T19:38:09 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2025-05-10T14:15:47 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-06-29T13:14:55 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2025-03-10T08:03:10 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2025-05-31T19:13:55 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-10-12T04:18:41 |

**t_profile_has_distribution_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.522 |
| DIST-0002 | DIST-0001 | DIST-0005 | 445.38 |
| DIST-0003 | DIST-0001 | DIST-0007 | 68.45 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.997 |
| DIST-0005 | DIST-0002 | DIST-0005 | 691.41 |
| DIST-0006 | DIST-0002 | DIST-0007 | 957.20 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.423 |
| DIST-0008 | DIST-0003 | DIST-0005 | 321.82 |

**t_profile_has_distribution_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | nightly summary |
| DIST-0004 | DIST-0001 | DIST-0010 | de |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | kg |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |

The actual measurements, timestamps, and textual annotations that populate these typed attributes are stored in a misc repository designed to accommodate heterogeneous payloads without requiring core schema recompilation. Decimal registries capture precision metrics such as 0.522 and 445.38, enabling statistical anomaly detection against established baselines, while datetime stores preserve exact ingestion moments like 2024-02-01T19:38:09 and 2025-05-10T14:15:47 for audit trail reconstruction. String repositories hold operational descriptors including Dimension Kind 01, Encoding 02, and nightly summary, ensuring that free-form administrative notes remain queryable alongside structured telemetry. This separation of type definitions from value storage allows the governance framework to scale independently, accommodating new measurement types and regulatory reporting requirements without disrupting the underlying distribution topology.