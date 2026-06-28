---
chapter_id: ch_live_verification_basic_1b7134
topic_id: 23
family: 03_directive_governance
cited_terms: ['verification_basic', 'designative_for_specific_role', 'frozen_artifact_governed_by']
model: engine-refine
---

An identifier furnishes the durable, referentially stable handle by which every governed object remains addressable across ingestion, audit, and reconciliation cycles without ambiguity of scope or lineage. In verification and governance corpora, identifiers such as VERI-0001 through VERI-0004 and GOVE-0001 through GOVE-0004 function not merely as surrogate keys but as the contractual boundary between a named operational fact—Compliance snapshot test, Calibration certificate review, Pipeline integrity check, Sensor drift assessment—and every downstream assertion made about it. The same identifier propagates into role-binding records, where ROLE-0001 associates Sensor-Array-Beta with VERI-0001 and ROLE-0002 binds Unit-Shift-Log to VERI-0002, so that designative labels remain traceable to the verification instance they purport to characterize. Because identifiers are typed as keys in the persistence layer, any break in identifier integrity—collision, orphan reference, or silent reassignment—propagates as a systemic failure rather than a localized data defect, which is why identifier discipline is treated as a first-class governance control rather than an implementation detail.

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

The entity is the subject of description: the verification run, the frozen governance artifact, or any other record whose properties are asserted rather than embedded in a wide, schema-rigid row. Entity identity is carried by entity_id in the value store and aligns with the parent record’s identifier, so that a single verification such as VERI-0001 may accumulate multiple typed observations—duration_seconds recorded as 500.97, end_time as 2023-02-01T08:41:13, exit_code 182, host_name ingest-21—each tied to the same entity without collapsing heterogeneous semantics into one undifferentiated field. Governance artifacts exhibit the same pattern: GOVE-0002 (Model-Prod-v4) receives mandatory true, effective_date 2024-02-08, and priority 718 as distinct entity-scoped facts. Treating entity as an explicit dimension separates what is being described from how it is described, which is essential when the population of describable objects grows faster than the set of stable column definitions and when the same attribute vocabulary must apply across artifact classes that differ in lifecycle and enforcement posture.

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

An attr names the dimension along which a fact is stated and, together with attr_type, prescribes the interpretive contract under which misc—the stored payload—must be read, compared, and validated. Attributes such as duration_seconds, end_time, exit_code, and host_name for verification, or effective_date, enforcement, mandatory, and priority for frozen governance records, are not free-text labels; they are registered members of a controlled vocabulary whose meaning is fixed by attr_type bindings to XSD datatypes including xsd:decimal, xsd:dateTime, xsd:integer, xsd:string, xsd:date, and xsd:boolean. The attr_type therefore performs the work of encoding at the semantic layer: it routes each assertion to the appropriate physical representation—decimal magnitudes like 4488.38 and 4833.98, integer exit and status codes 65 and 828, boolean mandatory flags false and true, or lexical values such as execution and complete—so that parsers, comparators, and compliance rules never coerce types implicitly. Where attr_id in a value row references the attribute registry rather than repeating attr_name, the system preserves a single authoritative definition even when the same attribute is asserted many times across entities and time windows.

Misc, in this architecture, denotes the value-bearing column whose contents are intentionally polymorphic at the logical level yet strictly homogeneous at the storage level once attr_type has been applied. A misc field holding 2025-05-09T15:15:58 is not interchangeable with one holding Log Level 02 or Enforcement 02, even though all occupy the same conceptual role as “the answer” to an attribute question; the partition into datetime, decimal, integer, varchar, boolean, and date value relations enforces that distinction at rest. This separation matters in practice because governance queries—threshold checks on duration_seconds, temporal ordering of end_time relative to effective_date, pass/fail inference from exit_code—depend on misc being interpreted under the datatype contract established by attr, not under the incidental syntax of the hosting table. When misc values span operational and jurisdictional domains within one corpus, as with host_name ingest-21, calibration record, and locale token es attached to GOVE-0001, the misc layer remains comparable only to the extent that attr and attr_type jointly define normalization, units, and allowed enumerations.

Encoding addresses a complementary concern at the character-representation boundary: how designative strings and auxiliary codes are serialized when identifiers and human-readable labels cross systems that may assume different byte-level conventions. Role records carry an explicit encoding declaration—ascii for Sensor-Array-Beta with code D-33 and for Batch-Alpha-99 with A-01, unicode for Unit-Shift-Log (B-12) and CoreSample-X22 (E-21)—so that downstream consumers do not misread multibyte sequences or apply incompatible collation when resolving identifies links to VERI-0001, VERI-0002, or VERI-0005. Encoding is therefore not a substitute for attr_type; it governs lexical fidelity and interchange safety for designative and code fields, while attr_type governs logical datatype for measurable and temporal facts. In operational guides, the two layers are documented separately because a verification pipeline may correctly parse xsd:dateTime end_time values yet still fail audit if a unicode designative is ingested as ascii, producing silent substitution or truncation that identifier integrity alone cannot detect.

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | VERI-0001 | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | VERI-0005 | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | VERI-0005 | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | VERI-0002 | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | VERI-0006 | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | VERI-0001 | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | VERI-0006 | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | VERI-0001 | A-01 | latin1 |

Taken together, identifier, entity, attr, attr_type, encoding, and misc instantiate a layered evidentiary model in which stable keys anchor describable objects, controlled attributes define what may be said about them, XSD typing routes assertions into comparable storage, encoding protects lexical interchange, and misc holds the instantiated fact under that contract. A calibration certificate review bound to VERI-0002 thus emerges in the record not as an opaque document row but as a composable set of entity-scoped misc values—duration_seconds 4488.38, end_time 2023-06-08T16:52:03, exit_code 38—linked through attr_id to registered meanings, while parallel governance rows for Log-Archive-23Q4 or Compliance-09 attach enforcement and priority semantics under GOVE identifiers with effective_date and mandatory constraints that auditors can evaluate uniformly. That composability is why these primitives matter: they convert heterogeneous operational telemetry and frozen policy artifacts into a single, evidence-anchored reference fabric in which every value is locatable by identifier, attributable to an entity, interpretable by attr and attr_type, and safe to exchange only when encoding and misc are honored as distinct, non-substitutable obligations.

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |