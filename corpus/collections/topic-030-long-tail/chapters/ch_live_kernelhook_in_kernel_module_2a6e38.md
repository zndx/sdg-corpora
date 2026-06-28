---
chapter_id: ch_live_kernelhook_in_kernel_module_2a6e38
topic_id: 30
family: 04_ebpf_kernel
cited_terms: ['kernelhook_in_kernel_module', 'dataset_snapshot_subclass', 'attestation_min_one_signer']
model: engine-refine
---

Kernel hooks deployed within operating-system modules carry a structured provenance record that binds an identifier—such as MODU-0001 or MODU-0004—to the specific hook function, the parent kernel module, the governing license, and the deployment location. A hook like PsSetCreateProcessNotify_Monitor, resident within ntoskrnl.exe, may be distributed under CC-BY-4.0 and assigned to zone-b, whereas the same hook function loaded into kdcom.sys carries GPL-3.0 and is located in us-east-1. Licensing terms and geographic placement are not decorative; they determine audit scope, export-control obligations, and the chain of custody that must be demonstrated during compliance reviews. Attestations—Chain of Custody Review, Security Baseline Validation, SOC 2 Type II Audit—are themselves identified (SIGN-0001 through SIGN-0004) and enriched with typed attributes that capture operational metadata: duration_seconds as xsd:decimal (1355.00, 2257.11, 6713.34), end_time as xsd:dateTime (2023-01-30T09:27:18, 2024-10-31T01:25:16), exit_code as xsd:integer (392, 373, 567), and host_name as xsd:string (node-b14, Log Level 02). This attribute-value separation—where attr_name and attr_type are declared once and instantiated across entities through typed value tables—ensures that every attestation carries machine-readable, schema-enforced context without sacrificing flexibility.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

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

Dataset snapshots follow an analogous pattern of identifier-driven provenance, where each snapshot (SNAP-0001 through SNAP-0004) is assigned a version number (2, 5, 10) and a precise size in bytes (31,504,133 through 676,110,880), and is linked to a parent snapshot through a snapshot_of relationship. The dimension table resolves snapshot_of_label and snapshot_of_category values—Snapshot Of Label 01 through 04, Snapshot Of Category 01 through 04—providing the human-readable classification that accompanies the machine identifier. Versioning and sizing are critical for reproducibility: a dataset at version 10 occupying 350,697,080 bytes can be distinguished from its predecessor at version 2 occupying 31,504,133 bytes, and the snapshot_of linkage preserves the lineage that auditors require when tracing data transformations. The misc column in the value tables serves as the catch-all for heterogeneous string payloads—review, complete, or arbitrary labels—that do not fit the strict xsd types but must still be persisted as part of the attestation record. Together, these tables form a unified model where identifiers anchor every entity, attributes define the shape of evidence, licenses and locations constrain the legal and operational envelope, and snapshot metadata preserves the temporal and categorical context necessary for governance.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

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