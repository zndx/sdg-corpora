---
chapter_id: ch_live_lift_with_support_count_ca8b58
topic_id: 181
family: 02_observation_measurement
cited_terms: ['lift_with_support_count', 'attribute_set_supports_outlier_claim', 'survey_response_record']
model: engine-refine
---

Data quality monitoring in this system is built around an entity-attribute-value (EAV) architecture that decouples metric definitions from their stored values, enabling flexible tracking of lift measurements across heterogeneous data sources. The core lift records—identified by codes such as COUN-0001 through COUN-0004—carry a lift classification like signal amplification lift, data pipeline lift, or sensor drift lift, alongside a support count that quantifies the volume of underlying evidence, ranging from 2,048 to 32,768 observations. Rather than hard-coding attribute columns into the lift table, the system maintains a separate attribute registry where each attribute is defined by a name and an XML Schema type: confidence is stored as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This separation allows the schema to evolve without schema migrations, since new attributes can be registered and immediately populated with values.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |

The EAV pattern is realized through three value tables partitioned by data type, each linking an entity to an attribute via foreign keys and storing the actual measurement. Decimal attributes such as confidence hold values like 0.849 and 945.35, while string attributes capture categorical or textual data including Dimension Kind 01, Encoding 02, nightly summary, and the language code es. Timestamp attributes record when measurements were taken, with values such as 2024-12-28T07:07:56 and 2023-08-28T07:06:53. The same entity can carry multiple attributes of different types, and the same attribute can be measured across many entities, creating a sparse but highly extensible matrix of quality signals. This design is particularly suited to environments where the set of monitored attributes changes frequently, as is common in data engineering pipelines where new sensors, APIs, or transformation steps introduce new quality dimensions.

Governance of data quality extends beyond measurement to the documentation and attribution of outlier claims. When a lift metric deviates from expected behavior, the system records an outlier claim tied to a specific attribute—such as source system ID, validation rule, geolocation accuracy, or sensor calibration—and requires that each claim be supported by one or more evidence sources. These supports include infrastructure components like an API gateway or a PostgreSQL instance, as well as metadata registries like the Ontology registry. A junction table links attributes to their supports and assigns a role—contributor or owner—to each relationship, making it possible to trace which systems and teams are accountable for each piece of evidence. This role-based linkage ensures that when an outlier is investigated, the responsible parties and their supporting artifacts are immediately identifiable.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

Researcher and survey data are captured in a parallel structure that profiles the people behind data quality assessments. Survey response records—identified by codes such as RECO-0001 through RECO-0004—represent distinct submissions including Peer-Review-Submission, Q3-2023-Feedback, and Safety-Compliance-Check. Each record captures a specific profile attribute of the respondent, such as Clearance-Level, Domain-Expertise-Code, or Protocol-Approval-Ref, and is annotated with the encoding used (ascii, unicode, or utf8) and the language of the response (es, de, or en). This metadata ensures that survey data can be correctly parsed and that responses are attributable to qualified individuals, which is essential when survey results feed into governance decisions or compliance audits. The combination of structured profile attributes with encoding and language annotations allows the system to handle multilingual, multi-encoding survey inputs while maintaining traceability to the researcher's credentials.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |