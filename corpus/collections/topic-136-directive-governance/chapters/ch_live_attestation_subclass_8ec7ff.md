---
chapter_id: ch_live_attestation_subclass_8ec7ff
topic_id: 136
family: 03_directive_governance
cited_terms: ['attestation_subclass', 'reference_within_dataset', 'ebpfprogram_has_program_type']
model: engine-refine
---

An identifier serves as the immutable handle by which any entity is distinguished within the data fabric; the attestation subclass table assigns identifiers such as ATTE-0001 through ATTE-0004 to concrete compliance artifacts—SOC2-TypeII, VulnerabilityScan-Q3, SecureBoot-Enabled, TPM-Attestation—while the reference table within a dataset uses DATA-0001 through DATA-0004 to tag provenance maps, schema references, and quality-control protocols that point back to those same attestation identifiers. An entity is the instantiated object that carries attributes and values; in the attestation domain, ATTE-0001 functions as the entity that accumulates a duration of 1293.13 seconds, an end time of 2025-01-08T20:38:13, an exit code of 806, and a host designation of gw-12, whereas ATTE-0002 records a duration of 215.34 seconds and an end time of 2024-01-27T20:47:31. The reference entities operate analogously: DATA-0001 carries a checksum algorithm of Checksum Algo 01, a code of A-01, an encoding format of Encoding 03, and an issued date of 2024-10-25, all while pointing to attestation ATTE-0003 and residing within the ml_training_run context.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SOC2-TypeII |
| ATTE-0002 | VulnerabilityScan-Q3 |
| ATTE-0003 | SecureBoot-Enabled |
| ATTE-0004 | TPM-Attestation |
| ATTE-0005 | GitOps-Deployment |
| ATTE-0006 | AccessControlReview |
| ATTE-0007 | ThirdPartyVendorRisk |

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

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | ATTE-0003 | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | ATTE-0003 | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | ATTE-0005 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | ATTE-0006 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | ATTE-0004 | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | ATTE-0005 | regulatory_submission |

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |

**t_ebpfprogram_has_program_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | tc_filter_ingress |
| TYPE-0002 | cgroup_skb_egress |
| TYPE-0003 | kprobe_sys_execve |
| TYPE-0004 | xdp_drop_packet |
| TYPE-0005 | lsm_bprm_committed |
| TYPE-0006 | tc_filter_ingress |
| TYPE-0007 | lwt_in_encap |

**t_ebpfprogram_has_program_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | cgroup_sock_addr |
| TYPE-0002 | kprobe |
| TYPE-0003 | cgroup_skb |
| TYPE-0004 | kprobe |
| TYPE-0005 | kprobe |
| TYPE-0006 | cgroup_sock_addr |

An attribute is a named property that describes a dimension of an entity, and an attribute type constrains the shape of the values that attribute may hold. The attribute definition table declares duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, thereby establishing the schema against which every stored value is validated. Similarly, the reference attribute definitions specify checksum_algo, code, format, and issued_date—all typed as xsd:string or xsd:date—ensuring that the values Checksum Algo 01, A-01, Encoding 03, and RFC-3339 conform to their declared types. This separation of attribute metadata from attribute values permits the system to store heterogeneous data types in dedicated value tables without conflating schema with instance data.

Values are materialized in type-specific value tables, each keyed by a unique identifier and linked to an entity and an attribute through foreign keys. The decimal value table records 1293.13, 215.34, 4975.39, and 778.44 against attribute ATTE-0001; the integer value table stores 806, 470, 695, and 409 against attributes ATTE-0003 and ATTE-0007; the datetime value table captures timestamps such as 2024-07-24T11:57:07 and 2024-04-06T01:35:21; and the varchar value table holds strings including review and superseded. The same pattern applies to reference values, where the date value table stores 2024-06-06, 2023-04-24, and 2023-10-13, and the varchar value table records RFC-3339 and other format descriptors. This normalization by type eliminates ambiguity and enables efficient indexing and query planning across millions of attribute-value pairs.

A subject and a target are the two endpoints of a typed relationship, and a role specifies the capacity in which the subject acts toward the target. The eBPF program-to-program-type association table exemplifies this triad: the program tc_filter_ingress assumes the role of observer against program type cgroup_sock_addr, while cgroup_skb_egress and kprobe_sys_execve both assume the role of reviewer against program types cgroup_skb and kprobe respectively, and xdp_drop_packet acts as contributor against program type kprobe. The subject column identifies the originating entity in the relationship, the target column identifies the entity being related to, and the role column encodes the semantic meaning of the connection—observer, reviewer, contributor—thereby transforming a bare link into a governed, auditable assertion about how system components interact.

**t_ebpfprogram_has_program_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0006 | TYPE-0005 | observer |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | reviewer |
| TYPE-0004 | TYPE-0004 | TYPE-0006 | contributor |
| TYPE-0005 | TYPE-0006 | TYPE-0001 | reviewer |
| TYPE-0006 | TYPE-0007 | TYPE-0002 | owner |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0006 | TYPE-0001 | observer |