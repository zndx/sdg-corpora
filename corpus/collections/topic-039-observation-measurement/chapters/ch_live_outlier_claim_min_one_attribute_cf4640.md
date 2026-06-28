---
chapter_id: ch_live_outlier_claim_min_one_attribute_cf4640
topic_id: 39
family: 02_observation_measurement
cited_terms: ['outlier_claim_min_one_attribute', 'outlier_claim_subclass', 'outlier_claim_supported_by']
model: engine-refine
---

Outlier claims in the monitoring architecture are anchored to specific anomaly types and contextualized through a structured attribute model. Each claim—identified by a unique key such as ATTR-0001 or CLAI-0001—is associated with a named outlier event, ranging from operational disturbances like Grid_Frequency_Drop and voltage_sag_event to diagnostic conditions including log_checksum_fail, Reactor_Core_Temp_Peak, and telemetry_gap_night. These claims are further classified by the attribute sets to which they belong: schema_constraints, sampling_windows, alert_policies, and provenance_tags. The attribute model itself is typed, with individual attributes carrying names such as confidence, dimension_kind, method, and recorded_at, each bound to an XSD type—xsd:decimal, xsd:string, or xsd:dateTime—ensuring that downstream consumers can interpret values without ambiguity. For instance, the confidence attribute is stored as a decimal, while recorded_at carries a full timestamp like 2023-09-29T17:50:45, and dimension_kind is a string value such as Dimension Kind 01.

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

The attribute value layer separates data by type into three distinct stores, each keyed by a composite of entity and attribute identifiers. Decimal values—0.179, 145.76, 830.74, 0.034—are persisted in the decimal store, string values—Encoding 02, calibration record, de—in the varchar store, and temporal values in the datetime store. This separation reflects a deliberate normalization strategy: the entity_id column references the claim or attribute that owns the value, while attr_id disambiguates which attribute within that entity is being populated. An entity such as ATTR-0001 may thus carry multiple attribute values across stores, each independently typed and independently queryable. The attr_name and attr_type columns in the attribute definition table provide the schema against which these values are validated, ensuring that a confidence score is always numeric, a recorded_at timestamp always conforms to ISO 8601, and a dimension_kind remains a free-form string.

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

At the claim level, outlier assertions are further subdivided by the operational domains they explain. A claim such as CLAI-0001, associated with the outlier log_checksum_fail, is linked to the domain Automotive_Test_Drive, while CLAI-0003, tied to Reactor_Core_Temp_Peak, maps to Power_Grid_Substation. The relationship between a claim and a domain is not merely associative; it carries a role that specifies the claim's function within that context. Roles include reviewer, owner, and observer—CLAI-0001 acts as a reviewer in one domain and an observer in another, while CLAI-0002 assumes the role of owner. This role-based linkage enables fine-grained governance: the same claim can be evaluated differently depending on whether it is auditing a process, owning a result, or passively observing a signal.

The evidentiary backbone of the system is captured in the fact_outlier table, which records each claim's measured value, its confidence score, and its uncertainty metric. Confidence values range from 0.147 to 0.877, reflecting the degree of assurance that the claim's assertion holds true; uncertainty values, expressed as magnitudes such as 516.58, 368.22, 10.24, and 719.33, quantify the dispersion or error bound around the claim's value. The value column itself—453.93, 510.05, 369.89, 757.33—represents the primary measurement or score associated with the claim. Each fact is supported_by a reference key, which in turn resolves to a dimension table (dim_supported_by) that provides a human-readable label and a categorical classification. Supported_by_label entries such as Supported By Label 01 and Supported By Category 01 serve as the metadata layer that connects raw evidence identifiers to their organizational or procedural context.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | log_checksum_fail |
| CLAI-0002 | grid_substation_surge |
| CLAI-0003 | Reactor_Core_Temp_Peak |
| CLAI-0004 | telemetry_gap_night |
| CLAI-0005 | grid_substation_surge |
| CLAI-0006 | Log_Flood_Event |
| CLAI-0007 | count_mismatch_feedA |

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Together, these tables form a coherent model for tracking, evaluating, and attributing outlier claims across heterogeneous operational domains. The identifier columns provide stable keys for every entity, attribute, and claim; the attribute type definitions ensure data integrity at ingestion; the role-based domain linkage clarifies accountability; and the confidence-uncertainty-value triad in the fact table quantifies the strength and precision of each assertion. The supported_by dimension closes the loop by grounding every claim in a traceable evidentiary source, complete with category and label metadata. This architecture supports both retrospective audit—reconstructing which claims were made, by whom, and with what certainty—and prospective governance, where role assignments and confidence thresholds can drive automated escalation or review workflows.

**t_outlier_claim_min_one_attribute**

| id | outlier | attribute_set |
| --- | --- | --- |
| ATTR-0001 | Grid_Frequency_Drop | schema_constraints |
| ATTR-0002 | voltage_sag_event | sampling_windows |
| ATTR-0003 | Database_Replication_Lag | alert_policies |
| ATTR-0004 | sensor_7A_spike | provenance_tags |
| ATTR-0005 | batch_42_drift | sampling_windows |
| ATTR-0006 | grid_substation_surge | sampling_windows |

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

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |