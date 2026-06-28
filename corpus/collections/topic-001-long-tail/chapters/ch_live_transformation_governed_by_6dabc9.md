---
chapter_id: ch_live_transformation_governed_by_6dabc9
topic_id: 1
family: 07_long_tail
cited_terms: ['transformation_governed_by', 'hipaa_safeguard_admin', 'artifact_min_one_owner']
model: engine-refine
---

Attributes in this governance framework are defined by a name and a type, then instantiated as values bound to specific entities through a normalized, type-dispatched value store. The attribute registry enumerates properties such as effective_date, enforcement, mandatory, and priority, each annotated with a schema type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—that governs how values are stored and validated. Boolean attributes resolve to true or false, date attributes carry ISO-formatted dates like 2024-01-07 or 2025-04-08, integer attributes hold magnitudes ranging from 1 to 623, and string attributes capture free-form content including Encoding 01, change rationale, and fr. This separation of attribute definition from attribute value permits a single entity—identified by a code such as ADMI-0001 or ADMI-0002—to carry heterogeneous properties without schema churn, and it ensures that each value is persisted in the table whose type matches the attribute's declared type.

The entities to which attributes bind are HIPAA safeguard administration records, each of which is classified by a safeguard category and a corresponding rule or policy. A record may be associated with the Privacy Rule, the Security Rule, the Transactions Rule, or a Contingency Plan, while its safeguard designation might read Audit Controls, Omnibus Modification, e-Signature Rule, or Security Policy. These classifications provide the contextual frame within which attribute values acquire meaning: the mandatory flag on an Audit Controls record carries different operational weight than the same flag on a Contingency Plan record, and the enforcement attribute's string value is interpreted relative to the governing rule. The identifier scheme—ADMI-NNNN—anchors each record as a stable reference point across the attribute-value tables, where entity_id columns form the foreign keys that bind values back to their parent safeguard administration record.

**t_hipaa_safeguard_admin**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| ADMI-0001 | Privacy Rule | Audit Controls |
| ADMI-0002 | Security Rule | Omnibus Modification |
| ADMI-0003 | Transactions Rule | e-Signature Rule |
| ADMI-0004 | Contingency Plan | Security Policy |
| ADMI-0005 | Audit Controls | Access Control |
| ADMI-0006 | Unique ID Rule | Unique ID Rule |
| ADMI-0007 | HITECH Amendment | Incident Response |

**t_hipaa_safeguard_admin_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ADMI-0001 | effective_date | xsd:date |
| ADMI-0002 | enforcement | xsd:string |
| ADMI-0003 | mandatory | xsd:boolean |
| ADMI-0004 | priority | xsd:integer |
| ADMI-0005 | review_cycle_days | xsd:integer |
| ADMI-0006 | scope | xsd:string |
| ADMI-0007 | encoding | xsd:string |
| ADMI-0008 | label_text | xsd:string |

**t_hipaa_safeguard_admin_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0003 | true |
| ADMI-0002 | ADMI-0002 | ADMI-0003 | false |
| ADMI-0003 | ADMI-0003 | ADMI-0003 | true |
| ADMI-0004 | ADMI-0004 | ADMI-0003 | false |
| ADMI-0005 | ADMI-0005 | ADMI-0003 | true |
| ADMI-0006 | ADMI-0006 | ADMI-0003 | false |
| ADMI-0007 | ADMI-0007 | ADMI-0003 | false |

**t_hipaa_safeguard_admin_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0001 | 2024-01-07 |
| ADMI-0002 | ADMI-0002 | ADMI-0001 | 2023-01-18 |
| ADMI-0003 | ADMI-0003 | ADMI-0001 | 2025-04-08 |
| ADMI-0004 | ADMI-0004 | ADMI-0001 | 2024-08-23 |
| ADMI-0005 | ADMI-0005 | ADMI-0001 | 2023-10-19 |
| ADMI-0006 | ADMI-0006 | ADMI-0001 | 2024-11-12 |
| ADMI-0007 | ADMI-0007 | ADMI-0001 | 2023-08-20 |

**t_hipaa_safeguard_admin_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0004 | 1 |
| ADMI-0002 | ADMI-0001 | ADMI-0005 | 309 |
| ADMI-0003 | ADMI-0002 | ADMI-0004 | 1 |
| ADMI-0004 | ADMI-0002 | ADMI-0005 | 623 |
| ADMI-0005 | ADMI-0003 | ADMI-0004 | 3 |
| ADMI-0006 | ADMI-0003 | ADMI-0005 | 849 |
| ADMI-0007 | ADMI-0004 | ADMI-0004 | 5 |
| ADMI-0008 | ADMI-0004 | ADMI-0005 | 665 |

**t_hipaa_safeguard_admin_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0007 | Encoding 01 |
| ADMI-0002 | ADMI-0001 | ADMI-0002 | Enforcement 02 |
| ADMI-0003 | ADMI-0001 | ADMI-0008 | change rationale |
| ADMI-0004 | ADMI-0001 | ADMI-0009 | fr |
| ADMI-0005 | ADMI-0001 | ADMI-0006 | Scope 05 |
| ADMI-0006 | ADMI-0002 | ADMI-0007 | Encoding 06 |
| ADMI-0007 | ADMI-0002 | ADMI-0002 | Enforcement 07 |
| ADMI-0008 | ADMI-0002 | ADMI-0008 | audit excerpt |

Transformation governance follows a parallel two-table pattern, where a fact table records the operational parameters of a transformation and a dimension table supplies its descriptive metadata. The fact table carries a transformation identifier, a transformation key that may be shared across multiple fact rows, a priority level, and a review cycle expressed in days. A single transformation key such as GOVE-0006 can appear in four distinct fact rows, each with the same priority of 2 but with review cycles spanning 727, 888, and 407 days alongside a shorter 89-day cycle, reflecting divergent governance cadences applied to the same logical transformation. The dimension table resolves the transformation identifier to a human-readable label—Transformation Label 01 through Transformation Label 04—and assigns it to a category—Transformation Category 01 through Transformation Category 04—providing the classification layer that the fact table deliberately omits in favor of performance and normalization.

**fact_transformation**

| id | transformation_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0004 | 2 | 89 |
| GOVE-0002 | GOVE-0006 | 2 | 727 |
| GOVE-0003 | GOVE-0006 | 2 | 888 |
| GOVE-0004 | GOVE-0006 | 2 | 407 |
| GOVE-0005 | GOVE-0002 | 1 | 356 |
| GOVE-0006 | GOVE-0002 | 1 | 410 |
| GOVE-0007 | GOVE-0004 | 3 | 230 |

Artifact ownership is modeled through a fact table that links each artifact to an owner, records its size in bytes, and tracks its version number. Artifacts identified by codes such as OWNE-0001 and OWNE-0002 are owned by a single owner—OWN-0003—across multiple artifact rows, while another artifact is owned by OWNE-0005. File sizes range from approximately 43 megabytes to nearly 1 gigabyte, with values like 42978804 bytes and 996080316 bytes, and versions span from 5 to 10, indicating that the same owner may maintain multiple artifact versions or that artifacts have been promoted through successive releases. The owner dimension table resolves the owner identifier to a label and a category—Owner Label 01 through Owner Label 04 and Owner Category 01 through Owner Category 04—mirroring the transformation pattern and ensuring that ownership metadata remains decoupled from artifact measurements. Across all three domains—HIPAA safeguards, transformations, and artifacts—the identifier serves as the universal key, the category provides classification, and the misc column carries free-form labels or values that resist further normalization.

**dim_transformation**

| id | transformation_label | transformation_category |
| --- | --- | --- |
| GOVE-0001 | Transformation Label 01 | Transformation Category 01 |
| GOVE-0002 | Transformation Label 02 | Transformation Category 02 |
| GOVE-0003 | Transformation Label 03 | Transformation Category 03 |
| GOVE-0004 | Transformation Label 04 | Transformation Category 04 |
| GOVE-0005 | Transformation Label 05 | Transformation Category 05 |
| GOVE-0006 | Transformation Label 06 | Transformation Category 06 |

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |