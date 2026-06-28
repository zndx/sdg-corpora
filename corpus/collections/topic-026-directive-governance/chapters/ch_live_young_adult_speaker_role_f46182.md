---
chapter_id: ch_live_young_adult_speaker_role_f46182
topic_id: 26
family: 08_derived
cited_terms: ['young_adult_speaker_role', 'audit_for_period', 'dbpedia_label_alignment']
model: engine-refine
---

The governance of educational presentation delivery and audit compliance is structured around a speaker-role registry that binds qualified individuals to specific presentation engagements. The `t_young_adult_speaker_role` table establishes these assignments through four columns: a unique identifier (`id`), the role designation (`young_adult_speaker_role`), the qualifying individual (`qualifying_individual`), and the presentation being delivered (`delivers_presentation`). Role identifiers such as `ROLE-0001` through `ROLE-0004` map to named positions—Morales PolicyYouth, Ruiz OpenEdLead, Chen TEDx2023, and Tanaka YouthTech—each associated with a distinct presenter: Chloe Tan, Lucas Fernandez, Elena Rossi, and Zara Okonkwo respectively. The presentation subject matter clusters around two primary topics: Ethical AI Governance, which accounts for three of the four assignments, and Open Source Licensing, delivered by Elena Rossi under the Chen TEDx2023 role. This concentration suggests a governance emphasis on ethical frameworks in technology discourse.

**t_young_adult_speaker_role**

| id | young_adult_speaker_role | qualifying_individual | delivers_presentation |
| --- | --- | --- | --- |
| ROLE-0001 | Morales PolicyYouth | Chloe Tan | Ethical AI Governance |
| ROLE-0002 | Ruiz OpenEdLead | Lucas Fernandez | Ethical AI Governance |
| ROLE-0003 | Chen TEDx2023 | Elena Rossi | Open Source Licensing |
| ROLE-0004 | Tanaka YouthTech | Zara Okonkwo | Ethical AI Governance |
| ROLE-0005 | Tanaka YouthTech | Zara Okonkwo | Cloud Cost Optimization |
| ROLE-0006 | Patel AIWorkshop | Zara Okonkwo | Neuroplasticity Learning |

Audit period management operates through a parallel structure that tracks compliance assessments and their interrelationships. The `t_audit_for_period` table records audit engagements by identifier and descriptive name, capturing assessments such as Data Privacy Impact Assessment, Annual-2022, and GDPR Compliance Review. Cross-referencing between audit periods is handled by `t_audit_for_period_for_audit_period`, which associates each period with a related audit—HIPAA Security Audit, SOC2 Type II, and ITIL Service Audit appear as linked targets. The junction table `t_audit_for_period__for_audit_period` introduces a role dimension to these cross-period relationships, assigning participants the functions of observer or reviewer to specific audit-to-audit mappings. For instance, the linkage from audit period `PERI-0001` to `PERI-0003` carries an observer role, while the connection from `PERI-0002` to `PERI-0005` designates a reviewer, establishing a clear accountability trail for inter-audit coordination.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

Semantic alignment between external knowledge bases and internal audit period identifiers is managed through a normalized attribute-value architecture. The `t_dbpedia_label_alignment` table serves as the central entity, mapping DBpedia resource labels—Mount Fuji, Great Barrier Reef, International Space Station—to internal audit period codes (PERI-0008, PERI-0006, PERI-0005, PERI-0004). Rather than embedding attribute values directly, the schema decomposes metadata into typed value tables referenced by the alignment entity. The `t_dbpedia_label_alignment_attr` table defines the attribute schema itself, specifying names such as confidence, dimension_kind, method, and recorded_at alongside their corresponding XML Schema types: xsd:decimal, xsd:string, and xsd:dateTime.

**t_dbpedia_label_alignment**

| id | dbpedia | aligned_to_d_bpedia_label |
| --- | --- | --- |
| ALIG-0001 | Mount Fuji | PERI-0008 |
| ALIG-0002 | Great Barrier Reef | PERI-0006 |
| ALIG-0003 | Great Barrier Reef | PERI-0005 |
| ALIG-0004 | International Space Station | PERI-0004 |
| ALIG-0005 | International Space Station | PERI-0007 |
| ALIG-0006 | Mount Fuji | PERI-0007 |

**t_dbpedia_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_dbpedia_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-30T18:47:51 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2023-03-19T14:45:09 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2023-04-29T16:40:54 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2025-02-04T06:16:43 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2025-03-19T01:28:11 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-10-31T13:56:29 |

**t_dbpedia_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.452 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 120.37 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 479.08 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.795 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 400.65 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 655.22 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.045 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 957.62 |

**t_dbpedia_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | hybrid |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | deg_C |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

Concrete attribute values are distributed across three type-specific tables, each keyed to an alignment entity and an attribute definition. Decimal-valued attributes stored in `t_dbpedia_label_alignment_val_decimal` include a confidence score of 0.452 for alignment ALIG-0001 and 0.795 for ALIG-0002, alongside dimension measurements of 120.37 and 479.08. String-valued attributes in `t_dbpedia_label_alignment_val_varchar` capture classification codes such as Dimension Kind 01 and Encoding 02, procedural notes like nightly summary, and locale indicators including fr. Temporal metadata in `t_dbpedia_label_alignment_val_datetime` records the alignment timestamps, ranging from 2023-03-19T14:45:09 through 2025-02-04T06:16:43, providing an auditable chronology of when each semantic alignment was established. This normalization ensures type safety while supporting extensible attribute definitions without schema modification.