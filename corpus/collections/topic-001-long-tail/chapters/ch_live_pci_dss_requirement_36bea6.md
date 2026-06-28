---
chapter_id: ch_live_pci_dss_requirement_36bea6
topic_id: 1
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'column_dropped_at_version', 'attestation_min_one_signer']
model: engine-refine
---

In a rigorous compliance framework, the regulatory baseline is anchored by structured identifiers that map directly to specific control mandates, such as `REQU-0001` corresponding to PCI DSS v3.2 or `REQU-0004` aligning with the more recent PCI DSS v4.0. These identifiers serve as the immutable keys for requirement definitions, linking abstract regulatory expectations to concrete operational controls like Requirement 10.6 or Requirement 2.1. The integrity of this mapping ensures that every control objective is traceable to its originating standard, preventing ambiguity during audit cycles and establishing a clear lineage from high-level policy to executable technical controls.

**t_pci_dss_requirement**

| id | pci |
| --- | --- |
| REQU-0001 | PCI DSS v3.2 |
| REQU-0002 | PCI DSS v1.1 |
| REQU-0003 | PCI DSS v1.1 |
| REQU-0004 | PCI DSS v4.0 |
| REQU-0005 | PCI DSS v3.0 |
| REQU-0006 | PCI DSS v2.0 |

**t_pci_dss_requirement_pci_dss_requirement**

| id | pci_dss_requirement |
| --- | --- |
| REQU-0001 | Requirement 10.6 |
| REQU-0002 | Requirement 2.1 |
| REQU-0003 | Requirement 1.2 |
| REQU-0004 | Requirement 3.4 |
| REQU-0005 | Requirement 6.5 |
| REQU-0006 | Requirement 11.4 |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

Governance extends beyond isolated controls to the relational topology that binds them, where a `subject` requirement is explicitly linked to a `target` requirement through a defined `role`. For instance, a requirement identified as `REQU-0004` may act as a `contributor` to a target control `REQU-0002`, while another relationship might designate an `observer` status for `REQU-0001` against `REQU-0005`. This relational schema captures the dependency and influence matrices between controls, allowing auditors to trace how a primary obligation, such as Requirement 3.4, is supported or mitigated by secondary mandates, thereby revealing the systemic interdependencies that underpin the organization's security posture.

**t_pci_dss_requirement__pci_dss_requirement**

| id | pci_id | pci_dss_requirement_id | role |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | REQU-0002 | contributor |
| REQU-0002 | REQU-0005 | REQU-0005 | observer |
| REQU-0003 | REQU-0001 | REQU-0005 | owner |
| REQU-0004 | REQU-0002 | REQU-0005 | observer |
| REQU-0005 | REQU-0003 | REQU-0004 | owner |
| REQU-0006 | REQU-0003 | REQU-0002 | owner |
| REQU-0007 | REQU-0006 | REQU-0003 | owner |
| REQU-0008 | REQU-0006 | REQU-0002 | owner |

The evidentiary layer of the framework relies on structured attestation records, such as a "Chain of Custody Review" or a "SOC 2 Type II Audit," which are decomposed into granular attributes (`attr`) to facilitate machine-readable verification. Each attribute is strictly typed—ranging from `xsd:decimal` for metrics like `duration_seconds` to `xsd:dateTime` for `end_time` and `xsd:string` for `host_name`—ensuring that the data collected aligns with the expected schema. These attributes are bound to a specific `entity`, meaning that a particular attestation record, identified by `SIGN-0001`, aggregates diverse data points, such as a decimal value of 1355.00 or a string value of "node-b14," into a cohesive proof of compliance.

**t_attestation_min_one_signer_attr**

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

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |

Operational data within this ecosystem is subject to rigorous versioning and quality assessment, tracked through a `dropped_at_schema_version` mechanism that categorizes legacy data fields. Each data point is accompanied by a `confidence` score and an `uncertainty` metric, providing a statistical measure of reliability; for example, a value recorded as 257.80 might carry a confidence of 0.164 and an uncertainty of 560.21, signaling a need for manual review or data enrichment. These metrics are further contextualized by a `category` label, such as "Dropped At Schema Version Category 01," which classifies the data's lifecycle stage and ensures that deprecated fields are handled with appropriate governance protocols, maintaining the integrity of the historical record.

**fact_column**

| id | dropped_at_schema_version_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| VERS-0001 | VERS-0006 | 0.164 | 560.21 | 257.80 |
| VERS-0002 | VERS-0004 | 0.068 | 744.10 | 571.55 |
| VERS-0003 | VERS-0006 | 0.107 | 984.09 | 140.18 |
| VERS-0004 | VERS-0001 | 0.354 | 404.01 | 131.27 |
| VERS-0005 | VERS-0005 | 0.790 | 109.97 | 235.19 |
| VERS-0006 | VERS-0001 | 0.934 | 653.09 | 813.74 |
| VERS-0007 | VERS-0006 | 0.938 | 827.04 | 409.13 |
| VERS-0008 | VERS-0001 | 0.734 | 419.22 | 492.32 |

**dim_dropped_at_schema_version**

| id | dropped_at_schema_version_label | dropped_at_schema_version_category |
| --- | --- | --- |
| VERS-0001 | Dropped At Schema Version Label 01 | Dropped At Schema Version Category 01 |
| VERS-0002 | Dropped At Schema Version Label 02 | Dropped At Schema Version Category 02 |
| VERS-0003 | Dropped At Schema Version Label 03 | Dropped At Schema Version Category 03 |
| VERS-0004 | Dropped At Schema Version Label 04 | Dropped At Schema Version Category 04 |
| VERS-0005 | Dropped At Schema Version Label 05 | Dropped At Schema Version Category 05 |
| VERS-0006 | Dropped At Schema Version Label 06 | Dropped At Schema Version Category 06 |