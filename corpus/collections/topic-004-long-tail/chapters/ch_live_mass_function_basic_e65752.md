---
chapter_id: ch_live_mass_function_basic_e65752
topic_id: 4
family: 06_belief_structure
cited_terms: ['mass_function_basic', 'column_property_subclass', 'claim_min_one_evidence']
model: engine-refine
---

In a robust data governance framework, every discrete entity must be anchored by a unique identifier to ensure traceability and integrity across the system. For instance, mass function records are distinguished by identifiers such as `FUNC-0001` or `FUNC-0002`, which serve as the primary keys for tracking specific operational states like `Filter cake` or `Effluent mass`. These identifiers are not merely labels; they link to critical metadata attributes, including the `method` of data acquisition—whether `automated` or `manual`—and the `encoding` standard applied, such as `ascii` or `latin1`. By standardizing these foundational attributes, organizations establish a reliable baseline for auditing and cross-referencing complex datasets.

**t_mass_function_basic**

| id | mass | method | encoding |
| --- | --- | --- | --- |
| FUNC-0001 | Filter cake | automated | ascii |
| FUNC-0002 | Effluent mass | manual | latin1 |
| FUNC-0003 | Target mass | automated | latin1 |
| FUNC-0004 | Total solids | manual | ascii |
| FUNC-0005 | Effluent mass | hybrid | latin1 |
| FUNC-0006 | Feedstock mass | automated | latin1 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

Beyond basic identification, the framework relies on a structured attribute system to define the specific characteristics of each entity. Attributes are formally categorized by their `attr_type`, ensuring that data validation rules are strictly enforced. For example, a `confidence` metric is strictly typed as `xsd:decimal`, allowing for precise numerical analysis, while a `recorded_at` timestamp is defined as `xsd:dateTime` to maintain chronological accuracy. These typed attributes are then populated with concrete values drawn from a `misc` pool of data types. A decimal attribute might hold a value like `0.032` or `504.02`, whereas a string-based attribute could store descriptive metadata such as `Dimension Kind 01` or `Encoding 02`. This separation of type definition from value assignment guarantees that the underlying data remains both semantically rich and structurally sound.

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

The integrity of the system is further reinforced by the ability to annotate and relate distinct entities through explicit mappings. A column property subclass, identified by an ID like `PROP-0001`, can be configured to `annotates_property_of` a specific mass function, such as `FUNC-0003`. This creates a direct lineage between a data element—like the `user_agent` or `device_serial` column—and the functional process it supports. Such granular mapping allows auditors and data stewards to trace exactly how raw inputs, such as a `request_payload` or `event_code`, feed into higher-level operational metrics, ensuring that every piece of data has a documented provenance and a clear functional context.

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | FUNC-0003 |
| PROP-0002 | device_serial | FUNC-0002 |
| PROP-0003 | request_payload | FUNC-0003 |
| PROP-0004 | event_code | FUNC-0006 |
| PROP-0005 | batch_id | FUNC-0006 |
| PROP-0006 | batch_id | FUNC-0002 |

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

Finally, the governance model utilizes a tripartite relationship structure to manage complex dependencies between claims and their supporting evidence. In this model, a `subject` represents the primary entity or claim under review, while the `target` denotes the specific piece of evidence or entity that validates it. The nature of this connection is governed by a `role`, which defines the functional capacity of the target relative to the subject. For instance, a claim identified as `EVID-0004` might be linked to a supporting evidence record `EVID-0002` through a `contributor` role, indicating that the target actively adds to the subject's validity. Alternatively, a target might assume a `reviewer` or `owner` role, providing a comprehensive matrix of accountability that clarifies exactly how disparate data points interact to form a cohesive, auditable conclusion.

**t_claim_min_one_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Antibiotic resistance rising |
| EVID-0002 | Glacier mass loss accelerating |
| EVID-0003 | Antibiotic resistance rising |
| EVID-0004 | Deforestation rate doubled |
| EVID-0005 | Ocean acidity increased 0.3 |
| EVID-0006 | Ocean acidity increased 0.3 |
| EVID-0007 | Deforestation rate doubled |

**t_claim_min_one_evidence_supported_by_evidence**

| id | supported_by_evidence |
| --- | --- |
| EVID-0001 | Lancet longitudinal cohort study |
| EVID-0002 | Lancet longitudinal cohort study |
| EVID-0003 | ICES marine ecosystem index |
| EVID-0004 | WHO mortality surveillance Q3 |
| EVID-0005 | WHO mortality surveillance Q3 |
| EVID-0006 | EPA ambient monitor 7B |
| EVID-0007 | IPCC AR6 synthesis report |
| EVID-0008 | ICES marine ecosystem index |

**t_claim_min_one_evidence__supported_by_evidence**

| id | claim_id | supported_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0004 | EVID-0002 | contributor |
| EVID-0002 | EVID-0003 | EVID-0007 | reviewer |
| EVID-0003 | EVID-0007 | EVID-0004 | owner |
| EVID-0004 | EVID-0007 | EVID-0005 | contributor |
| EVID-0005 | EVID-0005 | EVID-0004 | reviewer |
| EVID-0006 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0007 | EVID-0007 | EVID-0003 | reviewer |
| EVID-0008 | EVID-0004 | EVID-0004 | owner |