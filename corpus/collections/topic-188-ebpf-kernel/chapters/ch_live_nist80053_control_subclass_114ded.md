---
chapter_id: ch_live_nist80053_control_subclass_114ded
topic_id: 188
family: 07_long_tail
cited_terms: ['nist80053_control_subclass', 'policy_enforced_by', 'black_belt_certification_requirement']
model: engine-refine
---

In compliance and governance knowledge bases, stable identifiers anchor every assertion that must survive audit, lineage review, and cross-framework mapping. A control subclass such as CONT-0001 is not merely a label but a durable key that binds a NIST publication reference—here, NIST SP 800-53 Rev 5—to an enforcement artifact ENFO-0002, while sibling identifiers CONT-0002 through CONT-0004 carry parallel bindings across NIST SP 800-171, NIST CSF 2.0, and NIST SP 800-207. The identifier therefore functions as the contract between cataloguing, operational enforcement, and downstream reporting: once CONT-0003 is cited in an assessment workbook or a certification dossier, every attribute value, policy linkage, and reviewer assignment must resolve to that same key without ambiguity.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | ENFO-0002 |
| CONT-0002 | NIST SP 800-171 | ENFO-0006 |
| CONT-0003 | NIST CSF 2.0 | ENFO-0005 |
| CONT-0004 | NIST SP 800-207 | ENFO-0004 |
| CONT-0005 | FIPS 140-3 | ENFO-0006 |
| CONT-0006 | NIST SP 800-171 | ENFO-0006 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

An entity is the governed object those identifiers denote—the control subclass, the policy, the certification requirement—not the identifier itself. Operational meaning accrues to the entity through attributes, each declared under attr with a constraining attr_type drawn from XSD primitives so that validation, indexing, and interchange remain predictable. For control subclasses, effective_date is typed xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer; for black-belt certification requirements, confidence is xsd:decimal, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime. Separating declaration (what may be said) from assertion (what is said) prevents type coercion errors in environments where a single misc value might otherwise be interpreted as text, number, or timestamp interchangeably.

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

**t_black_belt_certification_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | confidence | xsd:decimal |
| REQU-0002 | dimension_kind | xsd:string |
| REQU-0003 | method | xsd:string |
| REQU-0004 | recorded_at | xsd:dateTime |
| REQU-0005 | uncertainty | xsd:decimal |
| REQU-0006 | unit | xsd:string |
| REQU-0007 | value | xsd:decimal |
| REQU-0008 | encoding | xsd:string |

**t_black_belt_certification_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 2025-05-17T18:36:12 |
| REQU-0002 | REQU-0002 | REQU-0004 | 2024-10-05T03:41:40 |
| REQU-0003 | REQU-0003 | REQU-0004 | 2024-07-29T04:57:09 |
| REQU-0004 | REQU-0004 | REQU-0004 | 2025-04-05T22:06:20 |
| REQU-0005 | REQU-0005 | REQU-0004 | 2024-09-27T11:02:14 |
| REQU-0006 | REQU-0006 | REQU-0004 | 2023-05-05T18:06:19 |
| REQU-0007 | REQU-0007 | REQU-0004 | 2023-08-07T06:49:00 |
| REQU-0008 | REQU-0008 | REQU-0004 | 2023-09-09T17:25:37 |

**t_black_belt_certification_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 0.856 |
| REQU-0002 | REQU-0001 | REQU-0005 | 807.42 |
| REQU-0003 | REQU-0001 | REQU-0007 | 629.05 |
| REQU-0004 | REQU-0002 | REQU-0001 | 0.026 |
| REQU-0005 | REQU-0002 | REQU-0005 | 321.43 |
| REQU-0006 | REQU-0002 | REQU-0007 | 502.76 |
| REQU-0007 | REQU-0003 | REQU-0001 | 0.827 |
| REQU-0008 | REQU-0003 | REQU-0005 | 134.63 |

Attribute values materialize in typed stores where entity and attr jointly locate misc—the concrete datum—and the storage partition follows attr_type rather than entity kind. Thus CONT-0001 carries effective_date 2023-01-02 alongside priority 3 and 776 under distinct integer rows tied to attr_id CONT-0004 and CONT-0005, while mandatory for CONT-0003 is asserted true and for CONT-0004 false in the boolean partition keyed repeatedly to attr_id CONT-0003. Varchar misc further diversifies the same entity: Encoding 01, Enforcement 02, calibration record, and locale token es on CONT-0001 illustrate that string-typed attrs capture human-readable enforcement labels, documentary references, and localization metadata within one identifier family. The pattern generalizes to blackbeltcertificationrequirement entities REQU-0001 and REQU-0002, where ProvenanceTrackingBB and LabQualityControlBB accumulate decimal confidence scores (0.856 versus 0.026), varchar method and dimension_kind literals, and datetime stamps such as 2025-05-17T18:36:12—demonstrating that entity identity persists while misc varies by attr and type.

**t_black_belt_certification_requirement**

| id | black_belt_certification_requirement |
| --- | --- |
| REQU-0001 | ProvenanceTrackingBB |
| REQU-0002 | LabQualityControlBB |
| REQU-0003 | ProvenanceTrackingBB |
| REQU-0004 | LabQualityControlBB |
| REQU-0005 | ProvenanceTrackingBB |
| REQU-0006 | DataEngineeringBlackBelt |
| REQU-0007 | MLOpsQualityBB |
| REQU-0008 | APIGatewayBB |

**t_black_belt_certification_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | Dimension Kind 01 |
| REQU-0002 | REQU-0001 | REQU-0008 | Encoding 02 |
| REQU-0003 | REQU-0001 | REQU-0009 | pre-release note |
| REQU-0004 | REQU-0001 | REQU-0010 | ja |
| REQU-0005 | REQU-0001 | REQU-0003 | hybrid |
| REQU-0006 | REQU-0001 | REQU-0006 | m/s |
| REQU-0007 | REQU-0002 | REQU-0002 | Dimension Kind 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | Encoding 08 |

Governance graphs extend the entity–attribute model with directed associations qualified by role, using subject and target to orient policy obligations relative to enforcing mechanisms. In enforcement wiring, a subject policy_id (ENFO-0001 for ISO27001 Encryption, ENFO-0002 for CCPA Data Deletion) points to a target enforced_by_id (ENFO-0003 Splunk SIEM, ENFO-0006 ISO Audit Board, ENFO-0001 AWS Config Rules), and role states how that target participates: observer for SIEM and audit-board pairings, reviewer where AWS Config Rules scrutinizes PCI-DSS Tokenization, owner where the same Config Rules mechanism owns FINRA Record Retention under ENFO-0006. Role therefore prevents symmetric readings of enforcement—observation, review, and ownership are not interchangeable even when identifiers recur across rows—and subject/target orientation preserves audit narratives about who enforces what, rather than collapsing policies and tools into an undifferentiated set.

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

Blackbeltcertificationrequirement entities instantiate the same architectural primitives under a certification-specific semantic layer. REQU-0001 and REQU-0003 both name ProvenanceTrackingBB while REQU-0002 and REQU-0004 name LabQualityControlBB, yet their attr portfolios diverge in misc: shared recorded_at attrs anchor evidentiary timelines, decimal attrs express measured confidence or scale-like quantities (807.42, 629.05), and varchar attrs carry dimension_kind, encoding variants, pre-release notes, and locale ja. Interpreting a requirement therefore demands simultaneous resolution of identifier, entity type, attr schema, and typed misc—treating REQU-0002’s 0.026 confidence as comparable to REQU-0001’s 0.856 only after attr_id alignment and attr_type confirmation. In practice, reviewers traverse from framework control identifiers through enforcement subjects and targets to certification requirements, using role to determine evidentiary weight and attr_type to select the correct value plane before accepting or challenging any misc field in an attestation package.