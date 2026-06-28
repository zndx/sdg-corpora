---
chapter_id: ch_live_anonymous_demographic_information_947246
topic_id: 10
family: 08_derived
cited_terms: ['anonymous_demographic_information', 'artifact_has_id', 'opentelemetry_span_subclass']
model: engine-refine
---

Anonymous demographic information occupies the lowest-risk tier of population descriptors: attributes that describe groups or statistical cohorts without enabling direct identification of a natural person. In operational practice, such fields include school_district_enrollment, household_size, geographic_region, and health_survey_responses when those values are aggregated, de-identified, or otherwise stripped of linkage keys. The governance distinction is not merely nominal. The same token health_survey_responses may appear under anonymous_demographic_information for one record and under demographic_information for another, signaling a shift in sensitivity context rather than a change in lexical label. Demographic_information, by contrast, denotes attributes that remain descriptive of individuals or fine-grained segments—age_brackets alongside household_size and geographic_region—where re-identification risk rises because quasi-identifiers can be composed. Personally_identifiable_information completes the tripartite classification with direct identifiers: home_address, full_legal_name, and passport_number, each of which singly or in minimal combination establishes subject identity and triggers the strongest retention, access-control, and lawful-basis requirements.

Identifier stability anchors the entire classification scheme. Each governed information object receives a durable primary key—INFO-0001 through INFO-0004 in the anonymous-demographic corpus—that functions as the canonical handle for audit, lineage, and cross-reference regardless of how underlying attribute values evolve. The identifier is not the data; it is the persistent surrogate under which policy attaches. Parallel identifier namespaces extend the same principle to other artifact classes: HAS-0001 through HAS-0004 bind versioned external references, while SPAN-0001 through SPAN-0004 denote observable execution units in distributed telemetry. Consistent identifier grammar permits uniform join semantics, enforcement of referential integrity, and deterministic replay of compliance decisions across ingestion batches and downstream analytic pipelines.

**t_artifact_has_id**

| id | artifact | identifier | version |
| --- | --- | --- | --- |
| HAS-0001 | MetricsDump88A | oid:1.3.6.1 | 3 |
| HAS-0002 | DroneFleet7C | oid:1.3.6.1 | 4 |
| HAS-0003 | ConfigManifest99 | doi:10.1109/x | 9 |
| HAS-0004 | DataPipelineV3 | ARN:res/41 | 6 |
| HAS-0005 | DataPipelineV3 | ref-8842 | 11 |
| HAS-0006 | DroneFleet7C | oid:1.3.6.1 | 5 |

Attribute metadata formalizes what may be asserted about an entity and in what syntactic form. Each attr registers a named dimension—confidence, dimension_kind, method, recorded_at for demographic records; duration_seconds, end_time, exit_code, host_name for span subclasses—while attr_type constrains permissible values through XSD-aligned typing: xsd:decimal for numeric measures, xsd:string for categorical or free-text tokens, xsd:dateTime for temporal instants, and xsd:integer for discrete counters. Typing is enforced at persistence boundaries rather than left to consumer interpretation; a recorded_at value of 2024-08-15T06:37:30 and a confidence coefficient of 0.448 are stored in physically segregated value relations precisely because their validation, indexing, and aggregation semantics differ. The attr layer thus separates schema declaration from instance materialization, enabling extension of the attribute vocabulary without restructuring entity tables.

The entity–attribute–value pattern materializes assertions as typed tuples rather than as wide, nullable columns. An entity_id (INFO-0001, SPAN-0002, and cognates) selects the subject record; an attr_id selects which declared dimension is being populated; and the value field—denoted misc in the generic sense of miscellaneous typed payload—carries the literal. For INFO-0001, entity_id INFO-0001 paired with attr_id INFO-0001 yields 0.448, while the same entity paired with attr_id INFO-0002 yields the string Dimension Kind 01, demonstrating that one logical record may host heterogeneous measurements under a single identifier. Datetime-valued assertions such as recorded_at (attr_id INFO-0004) appear uniformly across INFO-0001 through INFO-0004 with timestamps spanning 2023-05-03T14:37:32 through 2024-08-15T06:37:30, supporting temporal provenance without collapsing all attributes into a single untyped bag. Integer-valued span attributes—exit_code values 345, 35, 179, and 164 bound to SPAN-0001 and SPAN-0002—illustrate the same partitioning principle applied to operational telemetry.

Versioning closes the loop between evolving artifacts and the identifiers that reference them. The artifact_has_id relation pairs each artifact name—MetricsDump88A, DroneFleet7C, ConfigManifest99, DataPipelineV3—with an external identifier drawn from heterogeneous registries (oid:1.3.6.1, doi:10.1109/x, ARN:res/41) and an integer version (3, 4, 9, 6 respectively). Version is not decorative metadata; it pins compliance scope to a reproducible configuration state so that demographic classifications, attribute declarations, and observed values can be interpreted against the specification generation that produced them. When ConfigManifest99 advances from an implicit prior state to version 9, downstream consumers must re-evaluate whether anonymous_demographic_information labels remain valid under altered aggregation rules or whether newly introduced fields reclassify former anonymous attributes as demographic_information.

Cross-domain recurrence of the identifier–entity–attr–typed-value architecture confirms its role as an operational invariant rather than a domain-specific convenience. OpenTelemetry span subclasses name observable behaviors—worker.cron.schedule, user-service.login—and attach span_context tokens such as span-link-3a4b5c or context-hash-9f8e7d that propagate correlation without conflating trace identity with demographic identity. Duration_seconds measurements reaching 6374.61 on SPAN-0004 and host_name edge-03 on SPAN-0001 demonstrate that misc-valued tuples serve observability with the same rigor applied to privacy-tiered population data. In aggregate, anonymousdemographicinformation, demographicinformation, and personallyidentifiableinformation define what may be collected; identifier and version define what object is governed and when; entity, attr, attr_type, and misc define how assertions are structured, validated, and retrieved—forming a single coherent framework within which evidence such as pre-release note, Encoding 02, or a passport_number on INFO-0004 is never inert text but a typed, attributable, policy-scoped fact.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

**t_anonymous_demographic_information_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INFO-0001 | confidence | xsd:decimal |
| INFO-0002 | dimension_kind | xsd:string |
| INFO-0003 | method | xsd:string |
| INFO-0004 | recorded_at | xsd:dateTime |
| INFO-0005 | uncertainty | xsd:decimal |
| INFO-0006 | unit | xsd:string |
| INFO-0007 | value | xsd:decimal |
| INFO-0008 | encoding | xsd:string |

**t_anonymous_demographic_information_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0004 | 2024-08-15T06:37:30 |
| INFO-0002 | INFO-0002 | INFO-0004 | 2023-10-27T17:02:18 |
| INFO-0003 | INFO-0003 | INFO-0004 | 2023-05-03T14:37:32 |
| INFO-0004 | INFO-0004 | INFO-0004 | 2023-05-25T07:11:49 |
| INFO-0005 | INFO-0005 | INFO-0004 | 2024-09-13T22:50:49 |
| INFO-0006 | INFO-0006 | INFO-0004 | 2024-02-07T11:47:33 |

**t_anonymous_demographic_information_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0001 | 0.448 |
| INFO-0002 | INFO-0001 | INFO-0005 | 124.47 |
| INFO-0003 | INFO-0001 | INFO-0007 | 40.18 |
| INFO-0004 | INFO-0002 | INFO-0001 | 0.771 |
| INFO-0005 | INFO-0002 | INFO-0005 | 477.18 |
| INFO-0006 | INFO-0002 | INFO-0007 | 862.09 |
| INFO-0007 | INFO-0003 | INFO-0001 | 0.785 |
| INFO-0008 | INFO-0003 | INFO-0005 | 9.71 |

**t_anonymous_demographic_information_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0002 | Dimension Kind 01 |
| INFO-0002 | INFO-0001 | INFO-0008 | Encoding 02 |
| INFO-0003 | INFO-0001 | INFO-0009 | pre-release note |
| INFO-0004 | INFO-0001 | INFO-0010 | de |
| INFO-0005 | INFO-0001 | INFO-0003 | automated |
| INFO-0006 | INFO-0001 | INFO-0006 | nm |
| INFO-0007 | INFO-0002 | INFO-0002 | Dimension Kind 07 |
| INFO-0008 | INFO-0002 | INFO-0008 | Encoding 08 |

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | span-link-3a4b5c |
| SPAN-0002 | worker.cron.schedule | context-hash-9f8e7d |
| SPAN-0003 | worker.cron.schedule | propagation-token-x7k2 |
| SPAN-0004 | user-service.login | context-hash-9f8e7d |
| SPAN-0005 | http.server.request | trace-root-alpha |
| SPAN-0006 | payment-gateway.process | correlation-id-9a8b7c |

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