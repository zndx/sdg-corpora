---
chapter_id: ch_live_profiling_with_method_c04738
topic_id: 168
family: 02_observation_measurement
cited_terms: ['profiling_with_method', 'policy_basic', 'schemaorg_event_location']
model: engine-refine
---

The profiling infrastructure captures execution telemetry through a fact table keyed by unique identifiers such as METH-0001 and METH-0004, recording how long each operation took, whether it terminated cleanly, and how many retry attempts were consumed before reaching a final state. Duration measurements span a wide range—METH-0001 required 6716.87 seconds to complete, while METH-0002 finished in just 1113.38 seconds—reflecting the heterogeneous nature of the methods under observation. Exit codes such as 725, 809, and 348 serve as machine-readable status indicators, each encoding a distinct termination condition that downstream consumers can evaluate against policy thresholds. Retry counts, ranging from 186 to 303 across the observed methods, quantify the resilience of each approach; a method that exhausts 303 retries before exiting with code 348 signals a fundamentally different failure mode than one that succeeds after 186 attempts.

**fact_profiling**

| id | applies_method_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0001 | 6716.87 | 725 | 209 |
| METH-0002 | METH-0007 | 1113.38 | 809 | 186 |
| METH-0003 | METH-0007 | 2546.61 | 348 | 303 |
| METH-0004 | METH-0004 | 2074.93 | 827 | 264 |

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | Privacy Compliance Policy |
| POLI-0002 | Access Control Policy |
| POLI-0003 | Acceptable Use Policy |
| POLI-0004 | Security Baseline Policy |
| POLI-0005 | Data Sharing Policy |
| POLI-0006 | Data Retention Policy |
| POLI-0007 | Security Baseline Policy |

The applies_method dimension enriches these raw measurements with semantic context, linking each method identifier to a human-readable label and a categorical classification. METH-0001 carries the label "Applies Method Label 01" and is assigned to "Applies Method Category 01," while METH-0004 is grouped under "Applies Method Category 03" with its own distinct category identifier, METH-0001, in the category reference table. This two-level categorization—where the method dimension points to a separate category dimension—enables aggregation and roll-up of profiling data by functional group. An analyst can thus compare all methods tagged as "Category Name 01" against those in "Category Name 02" to identify systemic patterns in duration, exit behavior, or retry consumption that are specific to a class of operations rather than an individual method.

**dim_applies_method_category**

| id | category_name |
| --- | --- |
| METH-0001 | Category Name 01 |
| METH-0002 | Category Name 02 |
| METH-0003 | Category Name 03 |
| METH-0004 | Category Name 04 |
| METH-0005 | Category Name 05 |
| METH-0006 | Category Name 06 |

**dim_applies_method**

| id | applies_method_label | applies_method_category | category_id |
| --- | --- | --- | --- |
| METH-0001 | Applies Method Label 01 | Applies Method Category 01 | METH-0006 |
| METH-0002 | Applies Method Label 02 | Applies Method Category 02 | METH-0001 |
| METH-0003 | Applies Method Label 03 | Applies Method Category 03 | METH-0003 |
| METH-0004 | Applies Method Label 04 | Applies Method Category 04 | METH-0001 |
| METH-0005 | Applies Method Label 05 | Applies Method Category 05 | METH-0002 |
| METH-0006 | Applies Method Label 06 | Applies Method Category 06 | METH-0001 |
| METH-0007 | Applies Method Label 07 | Applies Method Category 07 | METH-0001 |

Policy governance is modeled through a parallel attribute-value architecture that separates the definition of an attribute from the storage of its typed values. The attribute registry declares names such as effective_date, enforcement, mandatory, and priority, each bound to an XSD type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—that constrains the shape of permissible values. A policy like "Privacy Compliance Policy" (POLI-0001) or "Access Control Policy" (POLI-0002) becomes the entity to which these attributes are attached, and the value tables partition storage by type so that boolean attributes resolve to true or false, date attributes to ISO-formatted strings like 2025-05-22, integer attributes to numeric values such as 409 or 74, and string attributes to free-form text including "Encoding 01" or "calibration record." This type-disaggregated design ensures that validation, indexing, and query optimization can proceed along well-defined type boundaries without requiring runtime type coercion.

**t_policy_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

Event locations follow the same attribute-value pattern, anchoring operational metadata to schema.org event types such as audit-log-archive and data-lake-ingestion-job. Each location entity—LOCA-0001 through LOCA-0004—carries attributes like checksum, created_date, identifier, and license, with values that include the hash c0ffee42, the reference ref-8842, the license Apache-2.0, and the region ap-south-2. The created_date attribute stores dates such as 2024-05-14 and 2023-06-13, while integer attributes hold values like 400 and 223, and the identifier attribute uses the custom type cco:DesignativeICE to encode designative identifiers. By mapping event locations back to policy entities through the event_location foreign key, the framework creates a traceable chain from raw operational events through their governing policies to the attributes that define compliance posture.

**t_policy_basic_attr**

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

**t_policy_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2025-05-22 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2023-08-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2025-01-30 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2025-06-16 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2023-11-15 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-13 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-02-02 |

**t_policy_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 409 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 74 |
| POLI-0005 | POLI-0003 | POLI-0004 | 3 |
| POLI-0006 | POLI-0003 | POLI-0005 | 787 |
| POLI-0007 | POLI-0004 | POLI-0004 | 3 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_policy_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | calibration record |
| POLI-0004 | POLI-0001 | POLI-0009 | en |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | intake form |

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | POLI-0007 |
| LOCA-0002 | data-lake-ingestion-job | POLI-0005 |
| LOCA-0003 | provenance-trace-record | POLI-0005 |
| LOCA-0004 | provenance-trace-record | POLI-0007 |
| LOCA-0005 | field-observation-dataset | POLI-0003 |
| LOCA-0006 | governance-policy-update | POLI-0002 |
| LOCA-0007 | lab-sample-tracker | POLI-0002 |
| LOCA-0008 | field-observation-dataset | POLI-0003 |

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |