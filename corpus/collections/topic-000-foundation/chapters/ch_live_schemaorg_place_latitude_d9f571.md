---
chapter_id: ch_live_schemaorg_place_latitude_d9f571
topic_id: 0
family: 07_long_tail
cited_terms: ['schemaorg_place_latitude', 'attestation_signed_by', 'attestation_subclass']
model: engine-refine
---

Within enterprise governance architectures, the management of attestation metadata demands a disciplined separation between the definition of attributes and the storage of their runtime values. Each attestation—whether an ISO27001 certification, a system access recertification, or a third-party vendor risk assessment—is enriched by a fixed schema of named properties such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`. These attribute names are paired with strict XML Schema Datatypes—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`—that govern how values are validated, persisted, and queried. The same attribute vocabulary is reused across attestation subclasses, including SecureBoot-enabled verification, data lineage confirmation, and privacy impact assessment reviews, ensuring that a uniform semantic layer spans heterogeneous compliance artifacts. By decoupling attribute definitions from their typed value stores, the model supports heterogeneous value populations: a single attestation entity may carry a decimal duration of 2368.11 seconds, an integer exit code of 407, a timestamped end time of 2023-11-18T17:18:55, and a string-valued host identifier such as `gw-12`, each persisted in its dedicated typed table and linked through a composite foreign key referencing both the entity and the attribute definition.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SecureBoot-Enabled |
| ATTE-0002 | ThirdPartyVendorRisk |
| ATTE-0003 | DataLineage-Verified |
| ATTE-0004 | PIA-Review |
| ATTE-0005 | EncryptionKeyRotation |
| ATTE-0006 | GitOps-Deployment |
| ATTE-0007 | Release Readiness Approval |

**t_attestation_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2025-01-08T20:38:13 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2024-01-27T20:47:31 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2024-07-24T11:57:07 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2024-04-06T01:35:21 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-02-15T00:38:24 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2023-06-05T10:05:45 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2024-06-10T20:49:48 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2023-08-11T12:49:10 |

**t_attestation_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 1293.13 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 215.34 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 4975.39 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 778.44 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5119.03 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 3990.60 |
| ATTE-0007 | ATTE-0007 | ATTE-0001 | 1452.26 |

**t_attestation_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 806 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 470 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 695 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 409 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 704 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 30 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 773 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 233 |

**t_attestation_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | gw-12 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | review |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | edge-03 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | closeout |

The attestation entities themselves are organized into two principal hierarchies. The signed-by attestation table anchors individual compliance assertions—each identified by a surrogate key such as `SIGN-0001`—to a specific attestation type, while the subclass table provides a parallel taxonomy of attestation categories like `SecureBoot-Enabled` or `PIA-Review`, keyed by identifiers such as `ATTE-0001`. Both hierarchies share an identical attribute schema, which means that the same four properties (`duration_seconds`, `end_time`, `exit_code`, `host_name`) and their corresponding XSD types are available to every entity regardless of its attestation classification. This structural symmetry simplifies reporting and enables cross-attestation queries that aggregate, for instance, all decimal durations or all datetime end times across the entire compliance corpus.

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | ISO27001-Cert |
| SIGN-0002 | System Access Certification |
| SIGN-0003 | ThirdPartyVendorRisk |
| SIGN-0004 | ISO27001-Cert |
| SIGN-0005 | System Access Certification |
| SIGN-0006 | Pipeline Security Audit |

**t_attestation_signed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

Complementing the attestation domain is a separate dimensional model centered on schema versioning and geographic or logical latitude. The fact table `fact_schemaorg` records each schema artifact with a unique identifier—`LATI-0001` through `LATI-0004`—a foreign key to the latitude dimension, a `size_bytes` measure ranging from 338,701,831 to 998,785,819 bytes, and a `version` integer spanning values 3 through 8. The dimension table `dim_latitude` resolves each latitude key to a human-readable label such as `Latitude Label 01` and a categorical classification like `Latitude Category 01`, providing the metadata necessary to group, filter, and report on schema artifacts by their logical or geographic context. The foreign-key relationship between `fact_schemaorg.latitude_key` and `dim_latitude.id` ensures that every size and version measurement is traceable to a well-defined latitude category, enabling capacity planning and version governance at the category level.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |

The practical significance of this architecture lies in its ability to support both granular compliance auditing and aggregate operational reporting without schema evolution. When an auditor queries all attestation entities whose `duration_seconds` exceeds a threshold, the system joins the entity to its typed value table, validates the value against the declared `xsd:decimal` type, and returns results without ambiguity. When a capacity planner examines schema artifacts by latitude category, the system joins the fact table to the dimension, aggregates `size_bytes` and `version` counts, and produces a category-level summary. The separation of attribute definitions from typed value tables means that new attributes can be introduced without altering existing value tables, and the reuse of the same attribute vocabulary across attestation hierarchies means that governance policies can be expressed once and applied uniformly.