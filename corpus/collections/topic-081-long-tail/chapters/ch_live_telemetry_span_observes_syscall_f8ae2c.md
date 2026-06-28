---
chapter_id: ch_live_telemetry_span_observes_syscall_f8ae2c
topic_id: 81
family: 07_long_tail
cited_terms: ['telemetry_span_observes_syscall', 'responsive_optic_nerve_dysfunction', 'outlier_claim_supported_by']
model: engine-refine
---

Every observable entity in the telemetry and clinical domains is anchored by a unique identifier that serves as the primary key for all downstream relationships. Telemetry spans such as SYSC-0001 through SYSC-0004 are each associated with a specific monitoring platform—Prometheus, SignalFx Stream Processor, or Dynatrace OneAgent—and these identifiers propagate through the entire attribute-value graph. Similarly, clinical records for optic nerve dysfunction carry identifiers like DYSF-0001 through DYSF-0004, while outlier facts and their supporting dimensions use identifiers such as SUPP-0001 through SUPP-0006. This consistent use of identifiers ensures that every attribute, value, and relationship can be traced back to its originating entity without ambiguity.

**t_telemetry_span_observes_syscall**

| id | telemetry |
| --- | --- |
| SYSC-0001 | Prometheus |
| SYSC-0002 | SignalFx Stream Processor |
| SYSC-0003 | Dynatrace OneAgent |
| SYSC-0004 | Prometheus |
| SYSC-0005 | OpenTelemetry Collector |
| SYSC-0006 | Honeycomb Collector |

**t_telemetry_span_observes_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | checksum_algo | xsd:string |
| SYSC-0002 | code | xsd:string |
| SYSC-0003 | format | xsd:string |
| SYSC-0004 | issued_date | xsd:date |
| SYSC-0005 | namespace | xsd:string |
| SYSC-0006 | encoding | xsd:string |
| SYSC-0007 | label_text | xsd:string |
| SYSC-0008 | language | xsd:string |

**t_telemetry_span_observes_syscall_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | 2024-08-07 |
| SYSC-0002 | SYSC-0002 | SYSC-0004 | 2023-04-29 |
| SYSC-0003 | SYSC-0003 | SYSC-0004 | 2024-09-27 |
| SYSC-0004 | SYSC-0004 | SYSC-0004 | 2023-06-07 |
| SYSC-0005 | SYSC-0005 | SYSC-0004 | 2025-01-16 |
| SYSC-0006 | SYSC-0006 | SYSC-0004 | 2023-10-29 |

**t_telemetry_span_observes_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | Checksum Algo 01 |
| SYSC-0002 | SYSC-0001 | SYSC-0002 | D-33 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | Encoding 03 |
| SYSC-0004 | SYSC-0001 | SYSC-0003 | E.164 |
| SYSC-0005 | SYSC-0001 | SYSC-0007 | nightly summary |
| SYSC-0006 | SYSC-0001 | SYSC-0008 | fr |
| SYSC-0007 | SYSC-0001 | SYSC-0005 | Namespace 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0001 | Checksum Algo 08 |

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |

Attributes are defined by a name and a type, forming a schema that governs what data can be attached to each entity. The attribute catalog includes properties such as checksum_algo, code, format, and issued_date, each typed as xsd:string or xsd:date to enforce type safety across the system. These attributes are not free-form; they are declared once and then referenced by value records that bind them to specific entities. For instance, the issued_date attribute (xsd:date) is linked to entities through dedicated value tables, while string-valued attributes like checksum_algo and code are stored in a parallel varchar value table. This separation of attribute metadata from attribute values enables flexible, schema-on-read semantics while preserving the structural integrity of the data model.

Attribute values are materialized in two parallel value tables—one for date-typed attributes and another for variable-length strings—each carrying a foreign key back to both the entity and the attribute it belongs to. A single entity can accumulate multiple attributes across both tables; entity SYSC-0001, for example, carries string values such as "Checksum Algo 01," "D-33," "Encoding 03," and "E.164" across its attributes, while also storing a date value of 2024-08-07 for its issued_date attribute. The value tables use misc as a generic value type, reflecting that the actual content is heterogeneous and context-dependent. This design allows the system to attach rich, typed metadata to any entity without requiring schema migrations when new attributes are introduced.

In the clinical domain, the same attribute-value pattern applies to conditions such as optic nerve dysfunction and leber optic atrophy. Records capture specific manifestations—for example, MT-ND6 Strain and Secondary Atrophy as forms of optic nerve dysfunction, paired with corresponding leber optic atrophy presentations like Hereditary Degeneration and Nutritional Deficit. Each record also carries a response classification, such as Focal Response or Diffuse Response, which functions as an attribute value describing the nature of the clinical observation. These classifications, like their telemetry counterparts, are stored as attribute values bound to entity identifiers, maintaining a uniform data model across both operational and clinical domains.

Outlier detection results are captured in a fact table that links each observation to a supporting dimension through a foreign key relationship. The fact_outlier table records a measured value alongside a confidence score and an uncertainty metric, providing a quantitative assessment of the observation's reliability. Confidence values range from 0.147 to 0.877, reflecting varying degrees of certainty in the detection, while uncertainty values span from 10.24 to 719.33, quantifying the dispersion or noise associated with each measurement. The supported_by_key column references the dim_supported_by dimension table, which organizes supporting evidence into categories such as Supported By Category 01 through Supported By Category 04, each with a corresponding label. This categorical structure enables analysts to filter and aggregate outlier facts by the type of evidence supporting them, facilitating governance and audit workflows.

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