---
chapter_id: ch_live_policy_subclass_e500f8
topic_id: 35
family: 01_foundation
cited_terms: ['policy_subclass', 'agent_basic', 'artifact_not_deprecated']
model: engine-refine
---

Policy entities are distinguished by opaque identifiers—POLI-0001 through POLI-0004—that anchor a taxonomy of governance instruments including the Telemetry Privacy Standard, Provenance Directive, Data Retention Policy, and Metadata Governance. Each identifier maps to a named policy and a target scope: Data Lakes, Research Archives, Sensor Networks, and API Gateways respectively. This one-to-one correspondence between identifier, policy name, and governed domain establishes the primary entity table from which all attribute assignments derive. The identifier functions as both a stable reference and a foreign key, ensuring that every subsequent value assignment can be traced back to a single, unambiguous policy instrument.

Attributes are declared independently of their values in a dedicated definition table, where each attribute carries a machine-readable type drawn from the XSD namespace. The effective_date attribute is typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. This separation of attribute schema from attribute instances permits type-safe validation at ingestion time and allows new attributes to be introduced without altering the value storage layer. The attr_name column records the human-readable label while attr_type enforces a rigid schema that governs which value table—boolean, date, integer, or varchar—will hold the corresponding data.

Attribute values are materialized across four type-disjoint tables, each keyed by a composite of identifier, entity_id, and attr_id. Boolean assignments such as false and true populate t_policy_subclass_val_boolean; date literals like 2023-01-31, 2024-06-17, 2023-06-01, and 2024-01-12 reside in t_policy_subclass_val_date; integer priorities including 1, 740, 3, and 958 are stored in t_policy_subclass_val_int; and string values—Encoding 01, Enforcement 02, nightly summary, fr—are held in t_policy_subclass_val_varchar. The entity_id column in each value table references back to the policy identifier, while attr_id points to the attribute definition, forming a normalized star schema that avoids null proliferation and preserves type integrity across heterogeneous property values.

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

Agents and artifacts follow an analogous dimensional pattern, each decomposed into fact and dimension tables that separate measurable properties from descriptive metadata. The fact_agent table records quantitative attributes—size_bytes values of 211345771, 458577289, 548859900, and 20883723 alongside version numbers 7, 1, 1, and 12—while the dimension table supplies categorical labels such as Agent Category 01 through Agent Category 04 and free-form labels like Agent Label 01. A parallel structure governs artifacts: fact_artifact stores size_bytes (123155790, 42978804, 996080316, 597369362) and version (6, 5, 5, 10), and dim_artifact provides artifact_category and artifact_label columns. The agent_key and artifact_key columns within the fact tables serve as cross-references to external registries, enabling the same physical entity to appear under multiple identifiers across different operational contexts.

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |