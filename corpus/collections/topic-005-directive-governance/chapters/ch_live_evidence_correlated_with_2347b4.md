---
chapter_id: ch_live_evidence_correlated_with_2347b4
topic_id: 5
family: 07_long_tail
cited_terms: ['evidence_correlated_with', 'measurement_produced_by_run', 'entity_match_link']
model: engine-refine
---

Evidence and measurement records form the backbone of a provenance-aware data model, each carrying a quantified confidence score and an absolute uncertainty bound that together define the reliability envelope of the observation. In the evidence fact table, records identified as WITH-0001 through WITH-0004 carry confidence values ranging from 0.052 to 0.474, with corresponding uncertainty magnitudes spanning 125.66 to 477.82 and measured values from 8.37 to 641.37. The measurement fact table mirrors this structure with identifiers RUN-0001 through RUN-0004, where confidence reaches as high as 0.945 in record RUN-0002 while uncertainty sits at 279.24, contrasted against RUN-0004's confidence of 0.307 paired with an uncertainty of 364.07 and a value of 64.10. These paired metrics—confidence as a normalized reliability indicator and uncertainty as an absolute deviation bound—enable downstream consumers to weight observations appropriately, much as a market analyst might discount a signal whose confidence interval is too wide to support a trading decision.

**fact_evidence**

| id | evidence_correlated_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0005 | 0.052 | 125.66 | 192.81 |
| WITH-0002 | WITH-0003 | 0.146 | 477.82 | 84.19 |
| WITH-0003 | WITH-0006 | 0.474 | 366.82 | 641.37 |
| WITH-0004 | WITH-0002 | 0.138 | 430.96 | 8.37 |

**fact_measurement**

| id | measurement_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| RUN-0001 | RUN-0003 | 0.496 | 306.26 | 353.34 |
| RUN-0002 | RUN-0001 | 0.945 | 279.24 | 660.64 |
| RUN-0003 | RUN-0006 | 0.506 | 120.70 | 878.99 |
| RUN-0004 | RUN-0006 | 0.307 | 364.07 | 64.10 |
| RUN-0005 | RUN-0003 | 0.923 | 642.96 | 897.70 |

The categorical taxonomy underlying these observations is captured in separate dimension tables that decouple classification from measurement. The evidence correlation dimension assigns each correlated-with identifier a human-readable label and a category designation, with entries such as Evidence Correlated With Label 01 mapped to Evidence Correlated With Category 01, and Evidence Correlated With Label 04 to Evidence Correlated With Category 04. Similarly, the measurement dimension table associates measurement labels like Measurement Label 01 through Measurement Label 04 with their respective categories and a foreign key to the measurement category dimension, where category identifiers such as RUN-0004, RUN-0003, RUN-0002, and RUN-0005 provide a stable classification anchor independent of the measurement's mutable label. This separation ensures that reclassification of an observation does not require rewriting the fact records themselves.

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

**dim_measurement_category**

| id | category_name |
| --- | --- |
| RUN-0001 | Category Name 01 |
| RUN-0002 | Category Name 02 |
| RUN-0003 | Category Name 03 |
| RUN-0004 | Category Name 04 |
| RUN-0005 | Category Name 05 |
| RUN-0006 | Category Name 06 |

**dim_measurement**

| id | measurement_label | measurement_category | category_id |
| --- | --- | --- | --- |
| RUN-0001 | Measurement Label 01 | Measurement Category 01 | RUN-0004 |
| RUN-0002 | Measurement Label 02 | Measurement Category 02 | RUN-0003 |
| RUN-0003 | Measurement Label 03 | Measurement Category 03 | RUN-0002 |
| RUN-0004 | Measurement Label 04 | Measurement Category 04 | RUN-0005 |
| RUN-0005 | Measurement Label 05 | Measurement Category 05 | RUN-0003 |
| RUN-0006 | Measurement Label 06 | Measurement Category 06 | RUN-0001 |
| RUN-0007 | Measurement Label 07 | Measurement Category 07 | RUN-0002 |

Entity matching introduces a relational layer that connects disparate resources through explicit link records, each carrying typed attributes that describe the nature of the association. The entity match link table records connections between entities such as Lab instrument SN-4491 and Reference standard RS-004, Sample batch SB-2214 and Validation suite VS-605, Dataset v4.2.1 and Validation suite VS-605, and Governance policy DOC-992 and Standard template ST-099. The attribute schema governing these links is itself dimensional: the attribute dimension defines properties like confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, with each attribute receiving a stable identifier for value storage. This design permits heterogeneous attribute types to be stored in dedicated value tables—decimal values such as 0.249 and 448.20 in the decimal store, string values like Dimension Kind 01 and Encoding 02 in the varchar store, and timestamps including 2025-02-02T03:38:54 and 2024-07-01T04:17:43 in the datetime store—while preserving type safety and enabling efficient range queries on numeric and temporal attributes.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |