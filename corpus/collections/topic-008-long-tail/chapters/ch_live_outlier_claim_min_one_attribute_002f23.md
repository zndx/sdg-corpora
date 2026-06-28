---
chapter_id: ch_live_outlier_claim_min_one_attribute_002f23
topic_id: 8
family: 02_observation_measurement
cited_terms: ['outlier_claim_min_one_attribute', 'iso27001_annexa_subclass', 'institutional_vision_statement']
model: engine-refine
---

Across operational governance frameworks, the management of heterogeneous attributes—whether applied to anomaly detection, regulatory compliance, or institutional strategy—relies on a normalized entity-attribute-value architecture that decouples metadata definitions from their typed values. Outlier claims such as `count_mismatch_feedA`, `log_checksum_fail`, `telemetry_gap_night`, and `voltage_sag_event` are each associated with an attribute set identifier (e.g., `ANNE-0001`, `ANNE-0006`, `ANNE-0004`), and each claim carries a suite of named attributes whose semantics are declared in a separate registry. The attribute registry specifies both the attribute name and its data type: `confidence` is typed as `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. This separation ensures that schema evolution—adding a new attribute or changing a type—does not require restructuring the value tables themselves.

**t_outlier_claim_min_one_attribute**

| id | outlier | attribute_set |
| --- | --- | --- |
| ATTR-0001 | count_mismatch_feedA | ANNE-0001 |
| ATTR-0002 | log_checksum_fail | ANNE-0001 |
| ATTR-0003 | telemetry_gap_night | ANNE-0006 |
| ATTR-0004 | voltage_sag_event | ANNE-0004 |
| ATTR-0005 | telemetry_gap_night | ANNE-0004 |
| ATTR-0006 | throughput_drop_zone3 | ANNE-0004 |

**t_outlier_claim_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_outlier_claim_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2023-09-29T17:50:45 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2023-11-30T14:55:48 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2024-10-03T15:06:44 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-24T15:12:01 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2025-03-04T01:17:47 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-12-29T13:19:15 |

**t_outlier_claim_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.179 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 145.76 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 830.74 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.034 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 316.10 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 304.68 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.373 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 478.83 |

**t_outlier_claim_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | calibration record |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | m/s |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_institutional_vision_statement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | effective_date | xsd:date |
| STAT-0002 | enforcement | xsd:string |
| STAT-0003 | mandatory | xsd:boolean |
| STAT-0004 | priority | xsd:integer |
| STAT-0005 | review_cycle_days | xsd:integer |
| STAT-0006 | scope | xsd:string |
| STAT-0007 | encoding | xsd:string |
| STAT-0008 | label_text | xsd:string |

The typed value tables materialize the attribute definitions through foreign-key joins back to the entity and attribute identifiers. Decimal-valued attributes store measurements such as `0.179`, `145.76`, and `830.74`, each row keyed by the entity identifier (e.g., `ATTR-0001`) and the attribute identifier (e.g., `ATTR-0001`, `ATTR-0005`, `ATTR-0007`). String-valued attributes hold categorical or free-text data: `Dimension Kind 01`, `Encoding 02`, `calibration record`, and `de`. DateTime-valued attributes capture temporal precision with values like `2023-09-29T17:50:45`, `2023-11-30T14:55:48`, `2024-10-03T15:06:44`, and `2025-03-24T15:12:01`. The entity identifier in each value table is not necessarily the claim identifier itself; rather, it references the entity to which the attribute value pertains, enabling a single claim to accumulate values across multiple entities and multiple attributes without duplication.

The ISO/IEC 27001 control mapping layer translates high-level standards into actionable Annex A controls, with governance roles assigned to each linkage. The subclass table anchors each mapping to a standard—`ISO/IEC 27001`, `ISO/IEC 27701`, or `ISO 20000-1`—and the control table enumerates specific measures such as `A.5.22 Cloud security`, `A.5.7 Threat intelligence`, `A.6.3 Remote working`, and `A.8.12 Data masking`. The join table between these two entities carries a role column that designates the governance posture of the linkage: `observer`, `reviewer`, or `owner`. For instance, the linkage between `ANNE-0003` (ISO/IEC 27701) and `ANNE-0001` carries the role `observer`, while the linkage between `ANNE-0001` (ISO/IEC 27001) and `ANNE-0004` carries the role `reviewer`. This role assignment provides an auditable trail of responsibility without conflating the control definition with its governance context.

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |

Institutional vision statements follow the same entity-attribute-value pattern, applied to strategic planning rather than operational telemetry. Four vision statements—`Community Impact Vision`, `Future-First Learning`, `Global Excellence Framework`, and `Campus 2030 Blueprint`—each target a specific educational goal (`Student Retention Improvement`, `Faculty Development Program`, `Curriculum Modernization`, `Alumni Engagement Metric`) and address a defined stakeholder group (`Research Faculty`, `Accrediting Bodies`, `Alumni Network`, `Local Community`). The attribute registry for these statements declares `effective_date` as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. Boolean values (`true`, `true`, `false`, `false`) indicate mandatory status, date values (`2023-09-09`, `2023-09-20`, `2023-06-25`, `2023-10-19`) anchor implementation timelines, integer values (`5`, `753`, `2`, `439`) encode priority scores, and string values (`Encoding 01`, `Enforcement 02`, `nightly summary`, `ja`) capture procedural metadata. The uniformity of the attribute-value pattern across operational anomaly detection, regulatory control mapping, and strategic vision management enables a single query engine to traverse heterogeneous governance domains without schema-specific adapters.

**t_institutional_vision_statement**

| id | institutional_vision_statement | targets_goal | addresses_stakeholder |
| --- | --- | --- | --- |
| STAT-0001 | Community Impact Vision | Student Retention Improvement | Research Faculty |
| STAT-0002 | Future-First Learning | Faculty Development Program | Accrediting Bodies |
| STAT-0003 | Global Excellence Framework | Curriculum Modernization | Alumni Network |
| STAT-0004 | Campus 2030 Blueprint | Alumni Engagement Metric | Local Community |
| STAT-0005 | Open Access Roadmap | Research Output Expansion | Undergraduate Cohort |
| STAT-0006 | Global Excellence Framework | Curriculum Modernization | Administrative Staff |
| STAT-0007 | Next-Gen Research Mandate | Inclusive Access Expansion | K-12 Pipeline |

**t_institutional_vision_statement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | true |
| STAT-0002 | STAT-0002 | STAT-0003 | true |
| STAT-0003 | STAT-0003 | STAT-0003 | false |
| STAT-0004 | STAT-0004 | STAT-0003 | false |
| STAT-0005 | STAT-0005 | STAT-0003 | true |
| STAT-0006 | STAT-0006 | STAT-0003 | false |
| STAT-0007 | STAT-0007 | STAT-0003 | false |

**t_institutional_vision_statement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 2023-09-09 |
| STAT-0002 | STAT-0002 | STAT-0001 | 2023-09-20 |
| STAT-0003 | STAT-0003 | STAT-0001 | 2023-06-25 |
| STAT-0004 | STAT-0004 | STAT-0001 | 2023-10-19 |
| STAT-0005 | STAT-0005 | STAT-0001 | 2024-08-06 |
| STAT-0006 | STAT-0006 | STAT-0001 | 2024-01-23 |
| STAT-0007 | STAT-0007 | STAT-0001 | 2025-03-30 |

**t_institutional_vision_statement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 5 |
| STAT-0002 | STAT-0001 | STAT-0005 | 753 |
| STAT-0003 | STAT-0002 | STAT-0004 | 2 |
| STAT-0004 | STAT-0002 | STAT-0005 | 439 |
| STAT-0005 | STAT-0003 | STAT-0004 | 5 |
| STAT-0006 | STAT-0003 | STAT-0005 | 277 |
| STAT-0007 | STAT-0004 | STAT-0004 | 5 |
| STAT-0008 | STAT-0004 | STAT-0005 | 639 |

**t_institutional_vision_statement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0007 | Encoding 01 |
| STAT-0002 | STAT-0001 | STAT-0002 | Enforcement 02 |
| STAT-0003 | STAT-0001 | STAT-0008 | nightly summary |
| STAT-0004 | STAT-0001 | STAT-0009 | ja |
| STAT-0005 | STAT-0001 | STAT-0006 | Scope 05 |
| STAT-0006 | STAT-0002 | STAT-0007 | Encoding 06 |
| STAT-0007 | STAT-0002 | STAT-0002 | Enforcement 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | nightly summary |