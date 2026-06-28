---
chapter_id: ch_live_agent_identified_by_uri_d84d0a
topic_id: 126
family: 05_provo_lineage
cited_terms: ['agent_identified_by_uri', 'table_topic_tag', 'outlier_claim_min_one_attribute']
model: engine-refine
---

In a governed telemetry architecture, every observable phenomenon must be anchored to a persistent identifier and an accountable steward. The identifier functions as the immutable handle for provenance tracking, whether it resolves to a persistent URI such as `ark:/13030/n8yy3r`, a resource ARN like `ARN:res/41`, or a UUID variant such as `urn:uuid:9f2a`. Ownership is explicitly bound to these handles to enforce data lineage and remediation responsibility; infrastructure components like `edge-device-gateway` or `genomics-lab-director` are assigned to the `ml-infra` or `data-engineering` domains, ensuring that downstream consumers can trace each datum to a responsible team. The entity itself represents the concrete subject of measurement, acting as the pivot around which attribute-value pairs are organized, validated, and audited.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

**dim_table_topic**

| id | table_topic_label | table_topic_category |
| --- | --- | --- |
| TAG-0001 | Table Topic Label 01 | Table Topic Category 01 |
| TAG-0002 | Table Topic Label 02 | Table Topic Category 02 |
| TAG-0003 | Table Topic Label 03 | Table Topic Category 03 |
| TAG-0004 | Table Topic Label 04 | Table Topic Category 04 |
| TAG-0005 | Table Topic Label 05 | Table Topic Category 05 |
| TAG-0006 | Table Topic Label 06 | Table Topic Category 06 |

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

Attributes capture the specific dimensions of an entity’s state, and their semantics are strictly governed by declared attribute types. A type declaration such as `xsd:decimal` mandates numeric precision for quantitative metrics, while `xsd:string` and `xsd:dateTime` constrain textual descriptors and temporal stamps respectively. This type discipline ensures that heterogeneous values—ranging from calibration records and encoding schemes to precise timestamps like `2023-09-29T17:50:45`—are stored in appropriately typed columns without schema drift. The misc category functions as a flexible container for these heterogeneous payloads, accommodating both structured decimals and unstructured strings while preserving the underlying type contract and enabling cross-domain interoperability.

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

Quantitative assertions within the framework are never treated as absolute; they are qualified by confidence scores and paired with explicit uncertainty bounds. A confidence value of `0.874` signals a high degree of reliability for a given measurement, whereas a score of `0.140` warrants immediate flagging for review or suppression. These confidence metrics are inextricably linked to their uncertainty counterparts, which quantify the margin of error in absolute terms—values such as `289.58` or `899.39` provide the necessary context for risk assessment and thresholding. Each assertion is routed through a table topic, which acts as the conceptual bucket for aggregation and policy application, with topics categorized into distinct operational domains to streamline compliance reporting.

The categorization of table topics enables granular policy enforcement and auditability across disparate data streams. When an outlier claim emerges—such as a `count_mismatch_feedA` or a `voltage_sag_event`—it is evaluated against a defined attribute set, including sampling windows, alert policies, or provenance tags. The system cross-references the claim’s attributes against their declared types and values, applying the appropriate confidence and uncertainty thresholds to determine whether the deviation constitutes a genuine anomaly or a transient artifact. This structured approach to attribute typing, ownership assignment, and uncertainty quantification ensures that every data point, regardless of its source or format, meets the rigorous standards required for regulatory compliance and operational decision-making.

**fact_table**

| id | table_topic_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | 0.274 | 648.78 | 608.50 |
| TAG-0002 | TAG-0001 | 0.140 | 899.39 | 639.23 |
| TAG-0003 | TAG-0001 | 0.609 | 885.54 | 470.53 |
| TAG-0004 | TAG-0005 | 0.874 | 289.58 | 720.41 |

**t_outlier_claim_min_one_attribute**

| id | outlier | attribute_set |
| --- | --- | --- |
| ATTR-0001 | count_mismatch_feedA | schema_constraints |
| ATTR-0002 | log_checksum_fail | sampling_windows |
| ATTR-0003 | telemetry_gap_night | alert_policies |
| ATTR-0004 | voltage_sag_event | provenance_tags |
| ATTR-0005 | telemetry_gap_night | sampling_windows |
| ATTR-0006 | throughput_drop_zone3 | sampling_windows |

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