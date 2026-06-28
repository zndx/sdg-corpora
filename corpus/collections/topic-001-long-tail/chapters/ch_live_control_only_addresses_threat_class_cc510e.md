---
chapter_id: ch_live_control_only_addresses_threat_class_cc510e
topic_id: 1
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'log_record_subclass', 'qualifications_framework']
model: engine-refine
---

Identifier fields serve as the immutable anchors of every relational construct, whether the record represents a threat-classification control such as THRE-0001 or a log-fact entry such as RECO-0001. These identifiers—uniformly formatted with a domain prefix and a zero-padded sequence number—provide the primary keys that enable cross-table joins and enforce referential integrity across the schema. The entity column operates as a foreign-key reference back to the owning identifier, establishing a parent-child linkage that is most visible in the attribute-value architecture: a single entity such as THRE-0001 may carry multiple attribute values, each distinguished by its own surrogate identifier and its association to a specific attribute definition. This design permits a single control record—say, the Incident Response Plan addressing Configuration Drift—to accumulate heterogeneous attribute values without requiring schema modifications.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | Data Exfiltration |
| THRE-0002 | Incident Response Plan | System Downtime |
| THRE-0003 | Incident Response Plan | Configuration Drift |
| THRE-0004 | Access Review Policy | System Downtime |
| THRE-0005 | Backup Retention Schedule | Configuration Drift |
| THRE-0006 | Backup Retention Schedule | Configuration Drift |
| THRE-0007 | Access Review Policy | Credential Theft |
| THRE-0008 | Incident Response Plan | Supply Chain Compromise |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |

Attribute definitions and their associated types form a typed metadata layer that decouples schema evolution from data storage. Each attribute carries a name such as effective_date, enforcement, mandatory, or priority, and is paired with an attr_type drawn from the XSD namespace—xsd:date, xsd:string, xsd:boolean, or xsd:integer—ensuring that value validation remains declarative rather than procedural. The actual values are materialized in type-specific tables: boolean attributes resolve to true or false, date attributes to ISO-formatted dates such as 2024-12-09 or 2025-01-04, integer attributes to magnitudes ranging from 5 to 926, and string attributes to free-form text including Encoding 01, Enforcement 02, and change rationale. This normalization by data type eliminates the need for type coercion at query time and allows the database engine to enforce constraints at the storage layer.

Log severity and its associated category constitute a dimensional model for classifying operational events. The fact_log table records individual log entries identified by keys such as RECO-0001 through RECO-0004, each annotated with a log_severity_key that references the dim_log_severity dimension table. That dimension table provides both a human-readable label—Log Severity Label 01 through Log Severity Label 04—and a categorical classification—Log Severity Category 01 through Log Severity Category 04—enabling aggregation and filtering along semantic axes. Each fact record also carries a size_bytes column, which quantifies the byte footprint of the log entry; observed values span from 442,933,768 bytes to 913,386,183 bytes, reflecting the substantial volume of individual log artifacts. A version column further distinguishes revisions of the same logical entry, with values such as 2, 6, and 7 appearing across the dataset.

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |

The qualifications framework models educational and professional credentials through a network of articulated outcomes and specified levels. The t_qualifications_framework table enumerates credentials such as Master of Science Data, National Vocational Qualification, European Qualifications Framework, and Certified Public Accountant, each identified by a FRAM-prefixed key. The articulates relationship links these qualifications to learning outcomes—Cloud Infrastructure Deployment, Agile Project Management, and Natural Language Processing—while the specifies relationship maps them to qualification levels including Advanced Practitioner, EQF Level Three, and NFQ Level Six. Both relationships are mediated through junction tables that carry a role column, assigning functional responsibilities such as observer, reviewer, owner, or contributor to each linkage. The t_qualifications_framework__specifies junction table additionally carries a cardinality_note column—Cardinality Note 01 through Cardinality Note 04—providing metadata on the multiplicity constraints of the qualification-to-level mapping. This layered structure supports complex queries about which qualifications articulate which outcomes and at what specification level, while the role and cardinality metadata capture governance and ownership semantics.

**t_qualifications_framework**

| id | qualifications |
| --- | --- |
| FRAM-0001 | Master of Science Data |
| FRAM-0002 | National Vocational Qualification |
| FRAM-0003 | European Qualifications Framework |
| FRAM-0004 | Certified Public Accountant |
| FRAM-0005 | Professional Engineer License |
| FRAM-0006 | Graduate Certificate Cyber |

**t_qualifications_framework_articulates**

| id | articulates |
| --- | --- |
| FRAM-0001 | Cloud Infrastructure Deployment |
| FRAM-0002 | Agile Project Management |
| FRAM-0003 | Natural Language Processing |
| FRAM-0004 | Natural Language Processing |
| FRAM-0005 | Machine Learning Model Training |
| FRAM-0006 | Cybersecurity Threat Modeling |

**t_qualifications_framework__articulates**

| id | qualifications_id | articulates_id | role |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0004 | FRAM-0001 | observer |
| FRAM-0002 | FRAM-0004 | FRAM-0001 | reviewer |
| FRAM-0003 | FRAM-0001 | FRAM-0003 | owner |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | observer |
| FRAM-0005 | FRAM-0006 | FRAM-0004 | reviewer |
| FRAM-0006 | FRAM-0003 | FRAM-0004 | owner |
| FRAM-0007 | FRAM-0004 | FRAM-0005 | reviewer |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | reviewer |

**t_qualifications_framework_specifies**

| id | specifies |
| --- | --- |
| FRAM-0001 | Advanced Practitioner |
| FRAM-0002 | EQF Level Three |
| FRAM-0003 | Advanced Practitioner |
| FRAM-0004 | NFQ Level Six |
| FRAM-0005 | Associate Degree |
| FRAM-0006 | Postgraduate Master |
| FRAM-0007 | Entry Level Technician |

**t_qualifications_framework__specifies**

| id | qualifications_id | specifies_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| FRAM-0001 | FRAM-0006 | FRAM-0006 | contributor | Cardinality Note 01 |
| FRAM-0002 | FRAM-0006 | FRAM-0007 | owner | Cardinality Note 02 |
| FRAM-0003 | FRAM-0002 | FRAM-0001 | owner | Cardinality Note 03 |
| FRAM-0004 | FRAM-0004 | FRAM-0005 | reviewer | Cardinality Note 04 |
| FRAM-0005 | FRAM-0003 | FRAM-0007 | contributor | Cardinality Note 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0001 | reviewer | Cardinality Note 06 |
| FRAM-0007 | FRAM-0005 | FRAM-0007 | reviewer | Cardinality Note 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0007 | contributor | Cardinality Note 08 |