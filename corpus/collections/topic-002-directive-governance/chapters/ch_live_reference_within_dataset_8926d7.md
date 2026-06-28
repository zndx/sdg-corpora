---
chapter_id: ch_live_reference_within_dataset_8926d7
topic_id: 2
family: 01_foundation
cited_terms: ['reference_within_dataset', 'control_with_evidence_requirement', 'directory_query_service']
model: engine-refine
---

Cross-dataset reference governance rests on stable identifiers that bind evidentiary artifacts to the controls they substantiate and to the operational contexts in which those artifacts circulate. Each reference record carries a durable key—such as DATA-0001, DATA-0002, DATA-0003, or DATA-0004—that permits auditors, catalog stewards, and automated validators to retrieve the same object regardless of whether it is cited in a machine-learning training run, a regulatory submission, a cloud storage bucket, or an enterprise data catalog. The identifier therefore functions not merely as a surrogate key but as the linchpin of traceability: PROVENANCE-MAP-V4 and SCHEMA-REF-ALPHA may denote distinct documentary classes, yet both resolve through their respective identifiers to requirement REQU-0003, demonstrating how a single control obligation can be satisfied by heterogeneous evidence types so long as each artifact remains addressable and version-stable.

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | REQU-0003 | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | REQU-0003 | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | REQU-0006 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | REQU-0004 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | REQU-0003 | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | REQU-0001 | regulatory_submission |

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

Attributes and attribute types supply the semantic scaffolding that makes those identifiers machine-interpretable. An attr declaration—checksum_algo, code, format, issued_date—names the facet of a reference object under measurement, while attr_type prescribes the validation grammar: xsd:string for textual encodings such as Checksum Algo 01, A-01, Encoding 03, and RFC-3339, and xsd:date for temporal assertions. Typed attributes prevent category errors at ingestion time and ensure that downstream enforcement logic compares like with like. When issued_date values of 2024-10-25, 2024-06-06, 2023-04-24, and 2023-10-13 attach to entity DATA-0001 through DATA-0004 under a common attr_id, the entity–attribute–value pattern records provenance of record without collapsing distinct reference objects into a single undifferentiated blob; entity in this sense denotes the governed object instance, attr the measured property, and misc the concrete payload held in typed value stores.

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

Control-to-evidence linkage translates attribute-level precision into compliance posture. A requirement such as REQU-0003, which governs DataEncryptionAtRest and mandates attachment of evidence DATA-0003, inherits its operational force from the enforcement designation assigned at the requirement layer: deprecated controls retain documentary value but exert no binding obligation, advisory controls guide practice without sanction, and mandatory controls—exemplified where DataEncryptionAtRest under REQU-0004 requires DATA-0001—trigger pass-fail gates in submission workflows. Language further localizes obligation without fragmenting the evidentiary spine: the same control family may be published in en, es, or ja, yet continues to point at the identical evidence keys, preserving cross-jurisdiction comparability while permitting locale-appropriate articulation. BaselineConfigurationCheck, by contrast, may remain advisory and cite evidence not present in the core reference quartet, illustrating that enforcement and evidence cardinality are independently governed dimensions.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | DATA-0001 | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | DATA-0006 | advisory | es |
| REQU-0003 | DataEncryptionAtRest | DATA-0003 | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | DATA-0001 | mandatory | ja |
| REQU-0005 | MultiFactorAuth | DATA-0004 | advisory | ja |
| REQU-0006 | DataEncryptionAtRest | DATA-0003 | blocking | en |

Service-directory analytics close the loop between static governance metadata and lived operational behavior. The fact layer records how often a governed interaction occurs—event counts of 315, 259, 81, and 397 across SERV-0001 through SERV-0004—while dimension tables classify who is addressed and what response class the interaction produces. targets_user resolves through category labels such as Targets User Category 01 and Targets User Category 02, and generates_response through Generates Response Category 03 and Generates Response Category 04, so that raw tallies become interpretable cohorts rather than anonymous counters. A service that targets SERV-0006 and generates SERV-0007 differs categorically from one that targets SERV-0002 and generates SERV-0005 even when absolute volumes converge, because category partitions the analytic grain for risk prioritization, capacity planning, and control-effectiveness review.

**fact_directory**

| id | targets_user_key | generates_response_key | event_count |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0006 | SERV-0007 | 315 |
| SERV-0002 | SERV-0002 | SERV-0002 | 259 |
| SERV-0003 | SERV-0001 | SERV-0006 | 81 |
| SERV-0004 | SERV-0002 | SERV-0005 | 397 |

Taken together, identifier stability, typed attributes, enforcement gradations, localized language, entity-bound misc values, and categorized service facts constitute a single evidentiary chain from documentary reference through control satisfaction to operational telemetry. Stewards who maintain attr_type integrity and entity scoping preserve the validity of checksum and issuance assertions; compliance officers who calibrate enforcement prevent deprecated obligations from blocking production while ensuring mandatory ones retain teeth; and operators who monitor event_count against targets_user and generates_response categories detect drift between what the framework requires and what the environment actually does. The architecture succeeds when each term—attr, attr_type, category, enforcement, entity, event_count, generates_response, identifier, language, misc, targets_user—remains semantically load-bearing: remove any one, and the chain from PROVENANCE-MAP-V4 in an ml_training_run to a mandatory DataEncryptionAtRest attestation to a 397-event service response collapses into disconnected records that neither auditors nor automation can reconcile.

**dim_targets_user**

| id | targets_user_label | targets_user_category |
| --- | --- | --- |
| SERV-0001 | Targets User Label 01 | Targets User Category 01 |
| SERV-0002 | Targets User Label 02 | Targets User Category 02 |
| SERV-0003 | Targets User Label 03 | Targets User Category 03 |
| SERV-0004 | Targets User Label 04 | Targets User Category 04 |
| SERV-0005 | Targets User Label 05 | Targets User Category 05 |
| SERV-0006 | Targets User Label 06 | Targets User Category 06 |

**dim_generates_response**

| id | generates_response_label | generates_response_category |
| --- | --- | --- |
| SERV-0001 | Generates Response Label 01 | Generates Response Category 01 |
| SERV-0002 | Generates Response Label 02 | Generates Response Category 02 |
| SERV-0003 | Generates Response Label 03 | Generates Response Category 03 |
| SERV-0004 | Generates Response Label 04 | Generates Response Category 04 |
| SERV-0005 | Generates Response Label 05 | Generates Response Category 05 |
| SERV-0006 | Generates Response Label 06 | Generates Response Category 06 |
| SERV-0007 | Generates Response Label 07 | Generates Response Category 07 |
| SERV-0008 | Generates Response Label 08 | Generates Response Category 08 |