---
chapter_id: ch_live_schemaorg_person_affiliation_28fcd1
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_person_affiliation', 'mass_function_normalized_form', 'rollback_relation']
model: engine-refine
---

Affiliation relationships serve as the foundational linkage between organizational entities and the data assets they govern, establishing clear lines of accountability and traceability. Each affiliation record carries a unique identifier—such as AFFI-0001 through AFFI-0004—and is classified into a categorical taxonomy like Affiliation Category 01 or Affiliation Category 04, with human-readable labels including Affiliation Label 01 through Affiliation Label 04 providing operational clarity. These affiliations are tracked in a fact table that records the size of associated data in bytes, with observed values ranging from approximately 114 MB (114,301,972 bytes for AFFI-0004) to nearly 1 GB (998,785,819 bytes for AFFI-0003), alongside version numbers spanning from 3 to 8, enabling auditors to reconstruct the evolution of data holdings and their associated responsibilities over time.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

The normalization of mass functions represents a critical control mechanism for ensuring measurement consistency across heterogeneous data sources. Mass function records—identified by codes such as FORM-0001 through FORM-0004—capture specific measurement artifacts including the Silicon-28 isotope, Tungsten calibration, Copper-63 signal, and Platinum-195 trace. Each mass function is associated with one or more normalized forms that define the applicable standard, with observed standards including ISO 17025 baseline, NRC traceable standard, WHO certified control, and BIPM pilot scale. The relationship between mass functions and normalized forms is mediated through a junction table that assigns roles to each association, distinguishing between observer, owner, and reviewer responsibilities. For instance, the Platinum-195 trace (FORM-0008) is linked to the ISO 17025 baseline (FORM-0001) under a reviewer role, establishing a clear audit trail for compliance verification.

**t_mass_function_normalized_form**

| id | mass |
| --- | --- |
| FORM-0001 | Silicon-28 isotope |
| FORM-0002 | Tungsten calibration |
| FORM-0003 | Copper-63 signal |
| FORM-0004 | Platinum-195 trace |
| FORM-0005 | Copper-63 signal |
| FORM-0006 | Carbon-13 baseline |
| FORM-0007 | Copper-63 signal |
| FORM-0008 | Carbon-13 baseline |

**t_mass_function_normalized_form_normalized_form**

| id | normalized_form |
| --- | --- |
| FORM-0001 | ISO 17025 baseline |
| FORM-0002 | NRC traceable standard |
| FORM-0003 | WHO certified control |
| FORM-0004 | BIPM pilot scale |
| FORM-0005 | BIPM pilot scale |
| FORM-0006 | NRC traceable standard |
| FORM-0007 | ISO 17025 baseline |
| FORM-0008 | OIML R111 class |

**t_mass_function_normalized_form__normalized_form**

| id | mass_id | normalized_form_id | role |
| --- | --- | --- | --- |
| FORM-0001 | FORM-0004 | FORM-0004 | observer |
| FORM-0002 | FORM-0007 | FORM-0007 | owner |
| FORM-0003 | FORM-0006 | FORM-0008 | reviewer |
| FORM-0004 | FORM-0008 | FORM-0001 | reviewer |
| FORM-0005 | FORM-0006 | FORM-0006 | contributor |
| FORM-0006 | FORM-0003 | FORM-0006 | reviewer |
| FORM-0007 | FORM-0003 | FORM-0006 | observer |
| FORM-0008 | FORM-0008 | FORM-0008 | reviewer |

Rollback relations provide the operational mechanism for reversing data state changes while preserving complete attribute-level provenance. Each rollback relation is identified by a code such as RELA-0001 through RELA-0004 and captures the relationship between a rollback action—like release-tag-v3.2, telemetry-archive-oct, nightly-sync-rollback, or config-deploy-fail—and its target state, such as batch-processing-halt, dataset-v111-stable, telemetry-ingest-pause, or telemetry-archive-oct. The attribute framework supporting these relations is itself versioned and typed, with attribute names including confidence, dimension_kind, method, and recorded_at, each assigned a precise data type from the XSD namespace: xsd:decimal for numerical precision, xsd:string for categorical descriptors, and xsd:dateTime for temporal tracking. This typed attribute system ensures that rollback operations carry structured metadata that can be programmatically validated.

The value storage architecture for rollback relation attributes employs a type-specific normalization pattern that separates heterogeneous data into dedicated value tables while maintaining referential integrity through entity and attribute identifiers. DateTime attributes are stored in a dedicated table with values such as 2024-05-22T12:01:29, 2024-03-03T15:52:05, 2024-01-11T10:28:20, and 2025-05-09T21:44:43, enabling precise temporal reconstruction of rollback events. Decimal attributes capture numerical measurements with values ranging from 0.023 to 918.13, including a confidence value of 0.999 that may indicate measurement certainty or data quality scores. Varchar attributes store free-form text including Dimension Kind 01, Encoding 02, pre-release note, and de, providing the flexibility needed for operational notes and categorical descriptors that do not fit structured types. This separation of concerns by data type supports both query performance and data integrity, as each value table enforces the appropriate constraints for its assigned type while the common entity_id and attr_id columns maintain the logical connection to the rollback relation and its defining attributes.

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | batch-processing-halt |
| RELA-0002 | telemetry-archive-oct | dataset-v111-stable |
| RELA-0003 | nightly-sync-rollback | telemetry-ingest-pause |
| RELA-0004 | config-deploy-fail | telemetry-archive-oct |
| RELA-0005 | model-checkpoint-88 | dataset-v111-stable |
| RELA-0006 | batch-processing-halt | model-checkpoint-88 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |