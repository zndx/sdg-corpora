---
chapter_id: ch_live_metric_observed_by_event_d9a983
topic_id: 161
family: 07_long_tail
cited_terms: ['metric_observed_by_event', 'measurement_max_one_value', 'policy_enforced_by']
model: engine-refine
---

An identifier functions as the immutable key by which any observable phenomenon is distinguished within the data fabric; the metric even-0001, for instance, carries the label Memory latency, while even-0002 denotes Disk IOPS, and the sequence extends through cache hit ratio and cpu utilization, each anchored to a stable handle that survives across every table in which it appears. The measurement domain mirrors this discipline: valu-0001 through valu-0004 tag soil ph, water turbidity, air particulate, and cpu load respectively, and the enforcement registry assigns enfo-0001 through enfo-0004 to iso27001 encryption, ccpa data deletion, pci-dss tokenization, and finra record retention. These identifiers are not descriptive; they are structural pegs on which attributes, values, and relationships hang, ensuring that a single metric or policy can be traced through every layer of the model without ambiguity.

**t_metric_observed_by_event**

| id | metric |
| --- | --- |
| EVEN-0001 | Memory latency |
| EVEN-0002 | Disk IOPS |
| EVEN-0003 | Cache hit ratio |
| EVEN-0004 | CPU utilization |
| EVEN-0005 | Queue depth |
| EVEN-0006 | Cache hit ratio |

**t_metric_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Soil pH |
| VALU-0002 | Water turbidity |
| VALU-0003 | Air particulate |
| VALU-0004 | CPU load |
| VALU-0005 | Battery voltage |
| VALU-0006 | Air particulate |
| VALU-0007 | Core temperature |

An attribute is a named property of an entity, and its type constrains the shape of the value it may carry. The attribute table records confidence as an xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, establishing at schema time that a confidence score will be numeric, a method description textual, and a timestamp coercible to ISO-8601. This separation of name from type from value permits the value store to split into three physical tables—one for datetime, one for decimal, one for varchar—each holding only the data it can represent natively. A decimal value table carries figures such as 0.221, 966.79, 495.10, and 0.669; a varchar table stores strings like dimension kind 01, encoding 02, calibration record, and es; and the datetime table holds timestamps including 2023-03-01t06:18:02, 2025-03-12t18:54:27, 2023-04-23t18:00:40, and 2023-07-24t13:02:38. The entity is the thing to which these attributes belong, and the entity_id column in each value table points back to the originating metric or measurement, so that the decimal 966.79 can be resolved to the disk iops metric even-0002, and the timestamp 2025-03-12t18:54:27 can be resolved to the recorded_at attribute of even-0002.

**t_metric_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2023-03-01T06:18:02 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2025-03-12T18:54:27 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2023-04-23T18:00:40 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-07-24T13:02:38 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2025-03-15T05:43:19 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2024-11-18T14:01:50 |

**t_metric_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | calibration record |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | es |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | mg/L |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

The role column appears in the join tables that bind two entities together, and it encodes the nature of the relationship rather than merely asserting its existence. In the measurement-to-numeric-value linkage, the same measurement valu-0005 is associated with a numeric value through the role reviewer in one row and through the role contributor in another, indicating that the relationship is not singular but contextual—the value may serve as a reviewed figure in one context and a contributed figure in another. The policy enforcement join table exhibits the same pattern: enfo-0001 (iso27001 encryption) is linked to enfo-0003 (aws config rules) with the role observer, while enfo-0003 itself is linked to enfo-0001 with the role reviewer, and enfo-0006 carries the role owner against enfo-0001. These roles—reviewer, observer, contributor, owner—form a small but expressive vocabulary that lets a single pair of identifiers participate in multiple semantic relationships without requiring duplicate rows or denormalized columns.

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

Subject and target are the directional endpoints of every foreign-key relationship, and their naming convention makes the flow of reference explicit. In the measurement join table, measurement_id is the subject and numeric_value_id is the target, so that the row with subject valu-0005 and target valu-0001 reads as a directed edge from the measurement to its numeric value; in the policy join table, policy_id is the subject and enforced_by_id is the target, so that the row with subject enfo-0001 and target enfo-0003 reads as a directed edge from the iso27001 encryption policy to the aws config rules mechanism that enforces it. This subject-to-target orientation is consistent across all join tables and ensures that queries can follow the relationship in its intended direction without ambiguity. The identifier columns in the value tables—entity_id and attr_id—play the same directional role, anchoring each misc value to its entity and attribute so that the decimal 0.221, the string calibration record, and the timestamp 2023-03-01t06:18:02 are each resolvable to a precise location in the attribute space.

**t_metric_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.221 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 966.79 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 495.10 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.669 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 143.93 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 270.10 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.103 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 271.02 |

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |