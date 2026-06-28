---
chapter_id: ch_live_policy_enforced_by_bbd8e9
topic_id: 185
family: 03_directive_governance
cited_terms: ['policy_enforced_by', 'process_min_one_input', 'attrkey_with_value_type']
model: engine-refine
---

Policy governance in this framework is anchored by a set of enforceable compliance mandates, each identified by a structured code such as ENFO-0001 through ENFO-0004, and scoped to regulatory domains including ISO27001 Encryption, CCPA Data Deletion, PCI-DSS Tokenization, and FINRA Record Retention. These policies do not operate in isolation; they are assigned to enforcement mechanisms through a relational mapping that distinguishes the enforcing entity from the policy itself. Splunk SIEM, the ISO Audit Board, and AWS Config Rules appear as concrete enforcement targets, with the same mechanism capable of supporting multiple policies and, conversely, a single policy delegating to several mechanisms. The relationship between policy and enforcer is further qualified by a role attribute—observer, reviewer, or owner—that establishes accountability boundaries. For instance, the enforcement linkage for ENFO-0001 carries the role of reviewer, while ENFO-0002 and ENFO-0003 are both designated as observer, indicating a tiered oversight structure where certain mechanisms monitor compliance passively while others assume active governance responsibility.

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

Process inputs extend this governance model into operational execution, where each process—Real-time stream processing, Batch data ingestion, ETL transformation step, and Feature engineering workflow—is associated with one or more input identifiers drawn from the policy namespace. This cross-referencing ensures that every data-handling process can be traced back to its governing policy, creating an audit trail from regulatory requirement through to technical implementation. The input relationships are formalized through a dedicated mapping table that binds a process identifier to an input identifier, with the input itself carrying semantic meaning through its association with a policy code such as ENFO-0005 or ENFO-0001. This design permits a single process to consume inputs governed by different policies, thereby supporting multi-regulatory compliance within a unified operational pipeline.

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

**t_process_min_one_input**

| id | process | input |
| --- | --- | --- |
| INPU-0001 | Real-time stream processing | ENFO-0005 |
| INPU-0002 | Batch data ingestion | ENFO-0002 |
| INPU-0003 | ETL transformation step | ENFO-0006 |
| INPU-0004 | Feature engineering workflow | ENFO-0001 |
| INPU-0005 | Real-time stream processing | ENFO-0005 |
| INPU-0006 | Audit trail generation | ENFO-0002 |

The attribute schema governing these process inputs is defined through a type system that specifies both the name and the XML Schema definition type of each attribute. Attributes such as duration_seconds, end_time, exit_code, and host_name are classified under xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively, establishing a rigid typing discipline that constrains the values permitted in downstream data stores. This type metadata is not merely descriptive; it serves as a contract between the process definition and the value storage layer, ensuring that data integrity is maintained through schema enforcement rather than ad hoc validation. The separation of attribute definition from attribute value allows the same attribute to be reused across multiple processes and entities without duplication of type information.

**t_process_min_one_input_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INPU-0001 | duration_seconds | xsd:decimal |
| INPU-0002 | end_time | xsd:dateTime |
| INPU-0003 | exit_code | xsd:integer |
| INPU-0004 | host_name | xsd:string |
| INPU-0005 | log_level | xsd:string |
| INPU-0006 | phase | xsd:string |
| INPU-0007 | retry_count | xsd:integer |
| INPU-0008 | scheduled_at | xsd:dateTime |

Value storage is partitioned by data type into four distinct tables—datetime, decimal, integer, and varchar—each linking an entity identifier to an attribute identifier and storing the actual value. This normalization strategy avoids the pitfalls of wide tables with sparse columns, instead distributing values across type-specific stores that can be queried independently. The decimal values, for example, range from 2164.83 to 7108.77 and are associated with the duration_seconds attribute, while integer values such as 682, 200, 365, and 357 correspond to exit_code and a second integer attribute. String values include operational identifiers like ingest-21 and Log Level 02, alongside status indicators such as review and complete. Timestamp values span from 2023-04-22T11:20:36 to 2024-10-27T08:51:57, providing a temporal dimension to the process execution records.

**t_process_min_one_input_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0002 | 2023-04-22T11:20:36 |
| INPU-0002 | INPU-0001 | INPU-0008 | 2024-10-27T08:51:57 |
| INPU-0003 | INPU-0001 | INPU-0009 | 2024-06-22T04:25:17 |
| INPU-0004 | INPU-0002 | INPU-0002 | 2023-12-06T11:11:06 |
| INPU-0005 | INPU-0002 | INPU-0008 | 2025-02-03T11:35:55 |
| INPU-0006 | INPU-0002 | INPU-0009 | 2024-12-06T22:47:35 |
| INPU-0007 | INPU-0003 | INPU-0002 | 2023-08-23T16:52:39 |
| INPU-0008 | INPU-0003 | INPU-0008 | 2024-05-09T10:22:43 |

**t_process_min_one_input_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0001 | 2164.83 |
| INPU-0002 | INPU-0002 | INPU-0001 | 4485.78 |
| INPU-0003 | INPU-0003 | INPU-0001 | 2430.62 |
| INPU-0004 | INPU-0004 | INPU-0001 | 7108.77 |
| INPU-0005 | INPU-0005 | INPU-0001 | 1824.80 |
| INPU-0006 | INPU-0006 | INPU-0001 | 4795.57 |

**t_process_min_one_input_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0003 | 682 |
| INPU-0002 | INPU-0001 | INPU-0007 | 200 |
| INPU-0003 | INPU-0002 | INPU-0003 | 365 |
| INPU-0004 | INPU-0002 | INPU-0007 | 357 |
| INPU-0005 | INPU-0003 | INPU-0003 | 339 |
| INPU-0006 | INPU-0003 | INPU-0007 | 252 |
| INPU-0007 | INPU-0004 | INPU-0003 | 834 |
| INPU-0008 | INPU-0004 | INPU-0007 | 166 |

**t_process_min_one_input_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0004 | ingest-21 |
| INPU-0002 | INPU-0001 | INPU-0005 | Log Level 02 |
| INPU-0003 | INPU-0001 | INPU-0006 | review |
| INPU-0004 | INPU-0001 | INPU-0010 | complete |
| INPU-0005 | INPU-0001 | INPU-0011 | Triggered By 05 |
| INPU-0006 | INPU-0002 | INPU-0004 | node-b14 |
| INPU-0007 | INPU-0002 | INPU-0005 | Log Level 07 |
| INPU-0008 | INPU-0002 | INPU-0006 | review |

**t_attrkey_with_value_type**

| id | attrkey | value_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | config_hash | ENFO-0002 | md5 | C-07 |
| TYPE-0002 | data_quality_flag | ENFO-0005 | sha256 | A-01 |
| TYPE-0003 | event_type | ENFO-0005 | sha256 | A-01 |
| TYPE-0004 | timestamp_utc | ENFO-0004 | md5 | E-21 |
| TYPE-0005 | batch_number | ENFO-0006 | md5 | E-21 |
| TYPE-0006 | timestamp_utc | ENFO-0006 | sha1 | E-21 |
| TYPE-0007 | device_mac | ENFO-0002 | md5 | C-07 |
| TYPE-0008 | firmware_version | ENFO-0003 | blake2b | B-12 |

At the foundation of this attribute system lies a registry of attribute keys, each associated with a value type reference, a checksum algorithm, and a classification code. The attribute keys config_hash, data_quality_flag, event_type, and timestamp_utc are mapped to value types referenced by codes such as ENFO-0002 and ENFO-0005, and secured with either md5 or sha256 checksum algorithms. The classification codes C-07, A-01, and E-21 provide an additional layer of categorization that can be leveraged for reporting, access control, or data lineage tracking. This registry establishes the semantic vocabulary of the system, ensuring that every attribute used in process inputs can be traced to a canonical definition with known type constraints and integrity mechanisms.