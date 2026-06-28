---
chapter_id: ch_live_soc2_trust_criterion_c6377a
topic_id: 125
family: 07_long_tail
cited_terms: ['soc2_trust_criterion', 'social_enterprise_annual_income', 'social_networking_service_usage']
model: engine-refine
---

In governed compliance and operational reporting environments, stable identifiers anchor every assertion that must survive audit, reconciliation, and longitudinal comparison. A trust criterion registered as CRIT-0001 does not merely name an obligation for CyberShield Ltd; it becomes the durable key through which effective dates, enforcement posture, mandatory flags, and priority rankings are retrieved without ambiguity. The same identifier discipline extends to income attestations—INCO-0001 through INCO-0004—and to usage facts such as USAG-0001, where the identifier binds a measurable occurrence to the dimensional context in which it arose. Without such keys, cross-table joins degenerate into brittle string matching; with them, governance systems can assert that the mandatory attribute applied to Data Privacy at HealthSys Networks (true for CRIT-0003) is the same mandatory attribute whose boolean misc value is false for Transaction Accuracy at CyberShield Ltd and DataVault Inc, even when those entities share superficially similar criterion labels.

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | Transaction Accuracy |
| CRIT-0002 | DataVault Inc | Transaction Accuracy |
| CRIT-0003 | CloudScale Services | Data Privacy |
| CRIT-0004 | HealthSys Networks | Security |
| CRIT-0005 | RetailChain Partners | Security |
| CRIT-0006 | FinTech Global | Transaction Accuracy |

An entity, in this sense, is the governed object whose properties are materialized through attributes rather than through ad hoc columns on a single wide record. CyberShield Ltd’s Transaction Accuracy criterion exists as entity CRIT-0001; BrightFuture Learning’s annual income posture exists as entity INCO-0001; Urban Harvest Co-op appears twice under INCO-0003 and INCO-0004, signalling that distinct reporting episodes or measurement contexts may legitimately coexist for nominally the same organization. Attributes—attr—declare what may be said about an entity: effective_date, enforcement, mandatory, and priority for SOC 2 trust criteria; confidence, dimension_kind, method, and recorded_at for social enterprise annual income. Each attr is not free-form text but a governed slot whose meaning is fixed by attr_type, typically expressed as XSD datatypes that prescribe validation, comparability, and storage strategy. Thus effective_date is xsd:date and lands in typed date stores with values such as 2025-04-05 for CRIT-0001 and 2023-07-21 for CRIT-0003; mandatory is xsd:boolean and resolves to misc values false or true; priority is xsd:integer, supporting ordinal ranking where CRIT-0001 carries 2 and 749 in separate int slots tied to related attr identifiers; confidence is xsd:decimal, as when INCO-0001 records 0.063 alongside a separate decimal 997.65 under another attr binding for the same entity.

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

**t_social_enterprise_annual_income_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INCO-0001 | confidence | xsd:decimal |
| INCO-0002 | dimension_kind | xsd:string |
| INCO-0003 | method | xsd:string |
| INCO-0004 | recorded_at | xsd:dateTime |
| INCO-0005 | uncertainty | xsd:decimal |
| INCO-0006 | unit | xsd:string |
| INCO-0007 | value | xsd:decimal |
| INCO-0008 | encoding | xsd:string |

**t_social_enterprise_annual_income_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0001 | 0.063 |
| INCO-0002 | INCO-0001 | INCO-0005 | 21.38 |
| INCO-0003 | INCO-0001 | INCO-0007 | 997.65 |
| INCO-0004 | INCO-0002 | INCO-0001 | 0.705 |
| INCO-0005 | INCO-0002 | INCO-0005 | 716.05 |
| INCO-0006 | INCO-0002 | INCO-0007 | 442.00 |
| INCO-0007 | INCO-0003 | INCO-0001 | 0.150 |
| INCO-0008 | INCO-0003 | INCO-0005 | 767.65 |

**t_social_enterprise_annual_income_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0002 | Dimension Kind 01 |
| INCO-0002 | INCO-0001 | INCO-0008 | Encoding 02 |
| INCO-0003 | INCO-0001 | INCO-0009 | change rationale |
| INCO-0004 | INCO-0001 | INCO-0010 | fr |
| INCO-0005 | INCO-0001 | INCO-0003 | automated |
| INCO-0006 | INCO-0001 | INCO-0006 | deg_C |
| INCO-0007 | INCO-0002 | INCO-0002 | Dimension Kind 07 |
| INCO-0008 | INCO-0002 | INCO-0008 | Encoding 08 |

The misc designation marks the payload—the literal value held once entity and attr have been resolved—while category supplies the taxonomic frame within which labels become analytically useful. For varchar misc entries, enforcement semantics surface as strings such as Enforcement 02 for CRIT-0001, change rationale documents provenance of amendment, and locale markers like en or fr indicate presentation or jurisdictional encoding without collapsing those distinctions into a single undifferentiated text field. In the dimensional layer governing social usage, category partitions participants and services into comparable cohorts: Involves Participant Category 03 classifies the participant keyed USAG-0003, while Utilizes Service Category 02 aligns with the service keyed USAG-0002 that appears in multiple fact rows. Category therefore answers “of what kind?” whereas misc on a dimension often carries the human-readable label—Involves Participant Label 03, Utilizes Service Label 02—that auditors and operators recognize during review.

Typed value decomposition is the operational mechanism that makes attr and attr_type enforceable in practice. Rather than coercing dates, booleans, integers, decimals, and datetimes into a uniform string column, the architecture routes each assertion to a table whose column constraints embody the attr_type contract. Boolean misc for mandatory on CRIT-0003 reads true while peer criteria remain false; datetime misc for recorded_at on income entities timestamps attestations at granular instants such as 2024-11-16T11:00:06 for INCO-0001 and 2025-02-04T05:23:06 for INCO-0002, supporting freshness analysis and sequencing under regulatory retention rules. Integer misc values—including 4 and 767 associated with CRIT-0002—enable quantitative thresholds and ordering where string misc would foreclose arithmetic aggregation. The pattern generalizes across domains: SOC 2 trust criterion governance and socialenterpriseannualincome reporting share the same entity–attr–misc spine even though their business semantics differ, which is why a compliance handbook can prescribe common controls over identifier issuance, attr registration, and type-safe persistence without rewriting the model per subject area.

**t_social_enterprise_annual_income**

| id | social_enterprise_annual_income |
| --- | --- |
| INCO-0001 | BrightFuture Learning |
| INCO-0002 | Sustainable Harvest Fund |
| INCO-0003 | Urban Harvest Co-op |
| INCO-0004 | Urban Harvest Co-op |
| INCO-0005 | CleanTech Ventures |
| INCO-0006 | FairTrade Roots |

**t_social_enterprise_annual_income_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0004 | 2024-11-16T11:00:06 |
| INCO-0002 | INCO-0002 | INCO-0004 | 2025-02-04T05:23:06 |
| INCO-0003 | INCO-0003 | INCO-0004 | 2023-12-18T07:36:57 |
| INCO-0004 | INCO-0004 | INCO-0004 | 2024-08-27T04:35:14 |
| INCO-0005 | INCO-0005 | INCO-0004 | 2023-06-07T02:54:49 |
| INCO-0006 | INCO-0006 | INCO-0004 | 2024-06-20T22:31:31 |

At the intersection of compliance metadata and operational telemetry, involves participant and utilizes service express relational roles that a fact table quantifies through event_count. Each usage row—USAG-0001 through USAG-0004—records how many events (283, 333, 199, 339) occurred under a specific pairing of participant and service keys, such as USAG-0003 involving a categorized participant while utilizing USAG-0006, or USAG-0004 linking USAG-0004 with USAG-0002. Event_count is not decorative volume; it is the measurable residue of activity subject to trust criteria like Security at HealthSys Networks or Data Privacy with mandatory true, and it is the bridge between dimensional description (who, what service, which category) and the scale at which controls must operate. Analysts can therefore relate high event counts against enforcement strings, effective dates, and priority integers to determine whether control design matches observed utilization intensity.

Taken together, identifier, entity, attr, attr_type, misc, and category constitute the evidentiary grammar through which governance frameworks remain both precise and extensible, while socialenterpriseannualincome, involves participant, utilizes service, and event_count instantiate that grammar in domains where fiscal attestation and service usage must be defended under scrutiny. A reviewer examining Urban Harvest Co-op across INCO-0003 and INCO-0004 can trace distinct recorded_at misc values and confidence decimals without conflating separate reporting cycles; a SOC 2 assessor can verify that Transaction Accuracy for DataVault Inc shares a criterion type with CyberShield Ltd yet diverges on effective_date and mandatory misc. The architecture’s practical virtue lies in this separation of concerns: identifiers stabilize reference, entities bear identity, attributes declare permissible statements, types enforce legality of misc values, categories enable cohort reasoning, and counted events ground abstract criteria in operational fact—so that compliance assertions remain traceable, typed, and aggregable long after individual labels or enforcement strings have been revised.

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