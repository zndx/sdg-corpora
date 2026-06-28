---
chapter_id: ch_live_evidence_correlated_with_d14221
topic_id: 5
family: 07_long_tail
cited_terms: ['evidence_correlated_with', 'state_observed_at_time', 'policy_subclass']
model: engine-refine
---

Evidence in this framework is never asserted as absolute; it is always qualified by a confidence score and an accompanying uncertainty bound, and it is always anchored to a specific entity through a stable identifier. A record such as WITH-0001 carries a confidence of 0.052 and an uncertainty of 125.66 against a measured value of 192.81, while WITH-0003, by contrast, reaches a confidence of 0.474 with an uncertainty of 366.82 and a value of 641.37. These paired metrics—confidence as a normalized probability and uncertainty as an absolute deviation—allow downstream consumers to weight observations appropriately, whether the entity in question is a sensor node observed in a calibrated state at 2024-03-17T09:33:40Z or a policy governing Data Lakes under the Telemetry Privacy Standard. The identifier, whether formatted as WITH-0001 for evidence records or TIME-0001 for state observations, serves as the immutable key that ties every attribute value back to its originating entity.

**fact_evidence**

| id | evidence_correlated_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0005 | 0.052 | 125.66 | 192.81 |
| WITH-0002 | WITH-0003 | 0.146 | 477.82 | 84.19 |
| WITH-0003 | WITH-0006 | 0.474 | 366.82 | 641.37 |
| WITH-0004 | WITH-0002 | 0.138 | 430.96 | 8.37 |

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | 2024-03-16T07:00:05Z |
| TIME-0002 | calibrated | 2024-03-17T09:33:40Z |
| TIME-0003 | idle | 2024-03-18T08:05:19Z |
| TIME-0004 | calibrated | 2024-03-16T11:22:30Z |
| TIME-0005 | idle | 2024-03-17T13:50:02Z |
| TIME-0006 | draining | 2024-03-15T10:45:11Z |
| TIME-0007 | idle | 2024-03-16T07:00:05Z |
| TIME-0008 | locked | 2024-03-15T08:30:00Z |

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

Attributes are the named properties through which entities are described, and each attribute carries a declared type that constrains the shape of its values. The attribute named confidence is typed as xsd:decimal, the attribute dimension_kind as xsd:string, and recorded_at as xsd:dateTime; similarly, policy attributes such as effective_date, enforcement, mandatory, and priority are typed as xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This type discipline is enforced not through a single monolithic column but through a family of value tables—t_state_observed_at_time_val_decimal, t_state_observed_at_time_val_varchar, t_state_observed_at_time_val_datetime for state observations, and their policy counterparts t_policy_subclass_val_boolean, t_policy_subclass_val_date, t_policy_subclass_val_int, t_policy_subclass_val_varchar—each keyed by entity_id and attr_id. An entity like TIME-0001 may thus carry a decimal value of 0.673 on attribute TIME-0001, a string value of Dimension Kind 01 on attribute TIME-0002, and a datetime value of 2023-08-28T00:49:09 on attribute TIME-0004, all within the same logical record.

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

Categories and labels provide the semantic scaffolding that transforms raw identifiers into interpretable evidence. The dimension table dim_evidence_correlated_with assigns to each evidence record a human-readable label—Evidence Correlated With Label 01 through Evidence Correlated With Label 04—and a category—Evidence Correlated With Category 01 through Evidence Correlated With Category 04—that groups related observations into coherent families. When fact_evidence references evidence_correlated_with_key values such as WITH-0005 or WITH-0003, it is not merely pointing to another record; it is asserting a relationship that can be filtered, aggregated, or traced through the category hierarchy. This separation of label and category mirrors a common pattern in governance frameworks where display names serve operational dashboards while categories drive policy enforcement logic.

**dim_evidence_correlated_with**

| id | evidence_correlated_with_label | evidence_correlated_with_category |
| --- | --- | --- |
| WITH-0001 | Evidence Correlated With Label 01 | Evidence Correlated With Category 01 |
| WITH-0002 | Evidence Correlated With Label 02 | Evidence Correlated With Category 02 |
| WITH-0003 | Evidence Correlated With Label 03 | Evidence Correlated With Category 03 |
| WITH-0004 | Evidence Correlated With Label 04 | Evidence Correlated With Category 04 |
| WITH-0005 | Evidence Correlated With Label 05 | Evidence Correlated With Category 05 |
| WITH-0006 | Evidence Correlated With Label 06 | Evidence Correlated With Category 06 |
| WITH-0007 | Evidence Correlated With Label 07 | Evidence Correlated With Category 07 |

The entity concept unifies these disparate threads. Whether the entity is a state observation identified as TIME-0001, a policy subclass identified as POLI-0001, or an evidence record identified as WITH-0001, the entity is the primary subject to which attributes, values, and relationships attach. Policies illustrate this clearly: POLI-0001, the Telemetry Privacy Standard, governs Data Lakes, carries an effective_date of 2023-01-31, has a mandatory flag set to false, and a priority of 1, while POLI-0002, the Provenance Directive, governs Research Archives, became effective on 2024-06-17, is mandatory, and carries a priority of 3. The same entity can accumulate values across multiple attribute types—boolean, date, integer, and varchar—each stored in its appropriately typed value table but unified under a single entity_id.

Uncertainty and confidence, taken together, form the epistemic backbone of the framework. Confidence values range from 0.052 to 0.474 in the evidence records, indicating that even the strongest observation carries substantial doubt, while uncertainty values span from 125.66 to 477.82, reflecting the absolute magnitude of that doubt in measurement units. These are not decorative fields; they are the mechanism by which automated systems can reason about data quality, trigger recalibration when uncertainty exceeds thresholds, or suppress low-confidence evidence from downstream reports. A state observed as offline at 2024-03-16T07:00:05Z with a confidence of 0.673 on one attribute and an uncertainty of 125.66 on another tells a different story than a calibrated state at 2024-03-17T09:33:40Z with a confidence of 0.137, and the framework preserves both the state and its qualification without collapsing one into the other.