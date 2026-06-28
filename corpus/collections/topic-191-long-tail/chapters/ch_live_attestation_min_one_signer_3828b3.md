---
chapter_id: ch_live_attestation_min_one_signer_3828b3
topic_id: 191
family: 03_directive_governance
cited_terms: ['attestation_min_one_signer', 'social_networking_service_usage', 'opentelemetry_span_subclass']
model: engine-refine
---

IDENTIFIER serves as the primary key across all attestation and telemetry records, anchoring every row with a structured code such as SIGN-0001, SPAN-0001, or USAG-0001. These identifiers propagate through the schema as foreign keys, enabling the relational joins that reconstruct a complete audit trail from an attestation event to its associated OpenTelemetry span and, ultimately, to the usage fact that aggregates participant and service interactions. An attestation record identified as SIGN-0001, for example, carries the label Chain of Custody Review and is referenced by the span subclass table where SIGN-0003 and SIGN-0004 appear as span_context values, while the usage fact table USAG-0001 through USAG-0004 embeds participant and service keys that resolve to their respective dimension tables.

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | SIGN-0004 |
| SPAN-0002 | worker.cron.schedule | SIGN-0004 |
| SPAN-0003 | worker.cron.schedule | SIGN-0003 |
| SPAN-0004 | user-service.login | SIGN-0003 |
| SPAN-0005 | http.server.request | SIGN-0005 |
| SPAN-0006 | payment-gateway.process | SIGN-0001 |

ATTR and ATTR TYPE define the schema of observable metadata attached to each entity. The attribute name—duration_seconds, end_time, exit_code, host_name—carries a corresponding type annotation drawn from the XML Schema definition namespace: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string. This type discipline governs which value table receives the data. A duration_seconds attribute of type xsd:decimal stores values such as 1355.00 and 6713.34 in the decimal value table, while the same attribute name in the OpenTelemetry span subclass context holds 2414.42 and 930.67. The end_time attribute, typed as xsd:dateTime, resolves to timestamps like 2023-01-30T09:27:18 and 2025-05-18T08:27:19, and exit_code, typed as xsd:integer, records values of 392 and 345. The host_name attribute, typed as xsd:string, captures identifiers such as node-b14 and edge-03.

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

**t_opentelemetry_span_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPAN-0001 | duration_seconds | xsd:decimal |
| SPAN-0002 | end_time | xsd:dateTime |
| SPAN-0003 | exit_code | xsd:integer |
| SPAN-0004 | host_name | xsd:string |
| SPAN-0005 | log_level | xsd:string |
| SPAN-0006 | phase | xsd:string |
| SPAN-0007 | retry_count | xsd:integer |
| SPAN-0008 | scheduled_at | xsd:dateTime |

**t_opentelemetry_span_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0002 | 2025-05-18T08:27:19 |
| SPAN-0002 | SPAN-0001 | SPAN-0008 | 2024-03-17T19:20:30 |
| SPAN-0003 | SPAN-0001 | SPAN-0009 | 2025-03-13T03:16:10 |
| SPAN-0004 | SPAN-0002 | SPAN-0002 | 2023-06-13T01:08:11 |
| SPAN-0005 | SPAN-0002 | SPAN-0008 | 2023-09-29T11:45:54 |
| SPAN-0006 | SPAN-0002 | SPAN-0009 | 2024-06-14T17:52:28 |
| SPAN-0007 | SPAN-0003 | SPAN-0002 | 2024-09-28T19:19:51 |
| SPAN-0008 | SPAN-0003 | SPAN-0008 | 2024-09-01T02:28:08 |

**t_opentelemetry_span_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0001 | 2414.42 |
| SPAN-0002 | SPAN-0002 | SPAN-0001 | 5931.72 |
| SPAN-0003 | SPAN-0003 | SPAN-0001 | 930.67 |
| SPAN-0004 | SPAN-0004 | SPAN-0001 | 6374.61 |
| SPAN-0005 | SPAN-0005 | SPAN-0001 | 857.91 |
| SPAN-0006 | SPAN-0006 | SPAN-0001 | 5761.32 |

**t_opentelemetry_span_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0003 | 345 |
| SPAN-0002 | SPAN-0001 | SPAN-0007 | 35 |
| SPAN-0003 | SPAN-0002 | SPAN-0003 | 179 |
| SPAN-0004 | SPAN-0002 | SPAN-0007 | 164 |
| SPAN-0005 | SPAN-0003 | SPAN-0003 | 571 |
| SPAN-0006 | SPAN-0003 | SPAN-0007 | 189 |
| SPAN-0007 | SPAN-0004 | SPAN-0003 | 122 |
| SPAN-0008 | SPAN-0004 | SPAN-0007 | 93 |

**t_opentelemetry_span_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0004 | edge-03 |
| SPAN-0002 | SPAN-0001 | SPAN-0005 | Log Level 02 |
| SPAN-0003 | SPAN-0001 | SPAN-0006 | closeout |
| SPAN-0004 | SPAN-0001 | SPAN-0010 | running |
| SPAN-0005 | SPAN-0001 | SPAN-0011 | Triggered By 05 |
| SPAN-0006 | SPAN-0002 | SPAN-0004 | ingest-21 |
| SPAN-0007 | SPAN-0002 | SPAN-0005 | Log Level 07 |
| SPAN-0008 | SPAN-0002 | SPAN-0006 | review |

ENTITY establishes the referential link between an attribute definition and its concrete value. In the value tables, the entity_id column points to the record whose attribute is being measured. For the attestation domain, entity_id values of SIGN-0001 and SIGN-0002 tie decimal measurements and datetime stamps to specific attestation events; in the telemetry domain, entity_id values of SPAN-0001 and SPAN-0002 perform the same function for span subclass records. The attr_id column in each value table completes the join, referencing the attribute definition so that a value of 6713.34 can be unambiguously resolved as the duration_seconds of attestation SIGN-0003, and a value of closeout can be resolved as the varchar attribute of span SPAN-0001.

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

MISC columns in the dimension tables carry human-readable labels and categorical groupings for participants and services. The dim_involves_participant table stores involves_participant_label values such as Involves Participant Label 01 through Involves Participant Label 04 alongside involves_participant_category values of Involves Participant Category 01 through 04. Similarly, dim_utilizes_service stores utilizes_service_label values like Utilizes Service Label 01 and utilizes_service_category values of Utilizes Service Category 01 through 04. These labels and categories are not embedded in the fact table itself; instead, the fact_social table carries only the foreign keys involves_participant_key and utilizes_service_key, which resolve to the dimension records. A usage fact identified as USAG-0001, for instance, references participant key USAG-0001 and service key USAG-0002, each of which maps to its respective label and category in the dimension tables.

**fact_social**

| id | involves_participant_key | utilizes_service_key | event_count |
| --- | --- | --- | --- |
| USAG-0001 | USAG-0003 | USAG-0005 | 333 |
| USAG-0002 | USAG-0004 | USAG-0002 | 199 |
| USAG-0003 | USAG-0003 | USAG-0006 | 339 |
| USAG-0004 | USAG-0001 | USAG-0002 | 283 |
| USAG-0005 | USAG-0005 | USAG-0001 | 488 |
| USAG-0006 | USAG-0004 | USAG-0003 | 193 |
| USAG-0007 | USAG-0001 | USAG-0006 | 419 |
| USAG-0008 | USAG-0006 | USAG-0002 | 202 |

**dim_involves_participant**

| id | involves_participant_label | involves_participant_category |
| --- | --- | --- |
| USAG-0001 | Involves Participant Label 01 | Involves Participant Category 01 |
| USAG-0002 | Involves Participant Label 02 | Involves Participant Category 02 |
| USAG-0003 | Involves Participant Label 03 | Involves Participant Category 03 |
| USAG-0004 | Involves Participant Label 04 | Involves Participant Category 04 |
| USAG-0005 | Involves Participant Label 05 | Involves Participant Category 05 |
| USAG-0006 | Involves Participant Label 06 | Involves Participant Category 06 |

**dim_utilizes_service**

| id | utilizes_service_label | utilizes_service_category |
| --- | --- | --- |
| USAG-0001 | Utilizes Service Label 01 | Utilizes Service Category 01 |
| USAG-0002 | Utilizes Service Label 02 | Utilizes Service Category 02 |
| USAG-0003 | Utilizes Service Label 03 | Utilizes Service Category 03 |
| USAG-0004 | Utilizes Service Label 04 | Utilizes Service Category 04 |
| USAG-0005 | Utilizes Service Label 05 | Utilizes Service Category 05 |
| USAG-0006 | Utilizes Service Label 06 | Utilizes Service Category 06 |

EVENT COUNT quantifies the volume of activity associated with each fact record. In the fact_social table, the event_count column holds integer values of 333, 199, 339, and 283, representing the number of events attributed to the participant-service pairing defined by the row's foreign keys. This count is the sole numeric measure in the fact table, serving as the grain of analytical aggregation: it enables roll-ups by participant category, by service category, or by any combination thereof, once the dimension keys are resolved through their respective label and category attributes.