---
chapter_id: ch_live_mental_health_education_program_8ae60c
topic_id: 150
family: 08_derived
cited_terms: ['mental_health_education_program', 'soc2_availability_subclass', 'policy_applies_to']
model: engine-refine
---

Governance frameworks for youth mental health programming require precise tracking of which initiatives reach which populations and through what delivery mechanisms. The mental health education program registry captures this relationship by linking each program identifier—such as PROG-0001 through PROG-0004—to a named initiative, a specific educational presentation, and the youth demographic it targets. The Youth Wellness Initiative, for instance, appears across multiple program records, each distinguished by its presentation format and audience: a Coping Skills Session aimed at Immigrant Adolescents, an Emotional Intelligence Talk directed at College Freshmen. Similarly, the Sources of Strength program delivers a Recognizing Depression Workshop to Athlete Communities, while Foster Care Youths receive the Understanding Anxiety Workshop under the same Youth Wellness Initiative umbrella. This structure ensures that every educational presentation can be traced to both its parent program and its intended demographic, enabling accountability and impact measurement across diverse youth populations.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |

Compliance and security assessments operate under a parallel but distinct taxonomy, where the SOC 2 availability subclass organizes audit artifacts by their control domain and assessment type. Records such as AVAI-0001 through AVAI-0004 classify reports like the SOC 3 Public Report, SOC 2 Privacy Assessment, SOC 2 Type I Assessment, and SOC 1 Financial Audit against domains including Financial Controls, Availability Criteria, and Network Infrastructure. This classification layer provides the structural anchor to which extensible metadata attributes are attached, allowing organizations to enrich each assessment with operational details without altering the core schema.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | Financial Controls |
| AVAI-0002 | SOC 2 Privacy Assessment | Financial Controls |
| AVAI-0003 | SOC 2 Type I Assessment | Availability Criteria |
| AVAI-0004 | SOC 1 Financial Audit | Network Infrastructure |
| AVAI-0005 | SOC 2 Type I Assessment | Security Criteria |
| AVAI-0006 | SOC 1 Type I Report | Confidentiality Criteria |
| AVAI-0007 | SOC 2 Privacy Assessment | Privacy Criteria |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

The attribute system itself is defined through a schema table that pairs each attribute name with its data type, establishing a typed key-value model for storing heterogeneous metadata. Attributes such as effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer) are declared once and then instantiated across any number of assessment entities. This separation of attribute definition from attribute value enables flexible enrichment: an availability assessment can carry a mandatory flag, an effective date, and a priority score simultaneously, each stored in its own type-specific value table. The boolean values table records whether an attribute is true or false for a given entity—for example, the mandatory attribute evaluates to true for AVAI-0001 and AVAI-0002, but false for AVAI-0003 and AVAI-0004. The date table stores effective dates such as 2024-07-01, 2024-03-01, 2023-09-25, and 2024-01-04, while the integer table captures numeric metadata like priority levels of 5 and 378, or counts of 753. String values, stored in the varchar table, include labels such as Encoding 01, Enforcement 02, nightly summary, and the locale code fr. In each case, the entity column references the assessment record being annotated, and the attr column references the attribute definition, forming a normalized many-to-many relationship between assessments and their typed metadata.

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

Policy applicability extends this model into the realm of organizational governance, where policies are mapped to the systems, datasets, or personnel they govern, with an effective date and a descriptive label providing temporal and contextual clarity. The Cloud Security Baseline applies to API Gateway Endpoints with an effective date of 2025-01-11 and is annotated as an audit excerpt. The Zero Trust Architecture Guideline takes effect on 2023-03-13 for HR Personnel Files, while the GDPR Compliance Directive and Data Retention Standard apply to Kubernetes Clusters and Customer PII Datasets respectively, both carrying the label nightly summary. These label texts serve as human-readable markers for the nature of the policy reference—whether it is a pre-release note, an audit excerpt, or a routine operational summary—supporting both compliance reporting and internal governance audits.

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | API Gateway Endpoints | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | HR Personnel Files | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | Kubernetes Clusters | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | Customer PII Datasets | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | Financial Reporting Systems | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | Kubernetes Clusters | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | Kubernetes Clusters | 2024-07-03 | nightly summary |