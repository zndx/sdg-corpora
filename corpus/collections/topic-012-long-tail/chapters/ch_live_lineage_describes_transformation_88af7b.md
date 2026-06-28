---
chapter_id: ch_live_lineage_describes_transformation_88af7b
topic_id: 12
family: 07_long_tail
cited_terms: ['lineage_describes_transformation', 'column_version_subclass', 'allocation_associated_with_agent']
model: engine-refine
---

In data governance architectures that demand rigorous provenance tracking, the twin constructs of confidence and uncertainty serve as the quantitative backbone of lineage assessment. The fact_lineage table operationalises this by recording each lineage event alongside a confidence score—values such as 0.645 and 0.779 indicating moderate-to-strong assurance, while 0.071 signals near-negligible reliability—and a corresponding uncertainty magnitude, where figures like 708.23 and 612.22 denote substantial epistemic variance. These measures are not isolated; each fact_lineage row carries a lineage_key (TRAN-0001, TRAN-0003, TRAN-0005) that establishes a self-referential chain, enabling the reconstruction of transformation histories where one lineage event feeds into another. The associated dim_lineage dimension table anchors these numeric assessments to human-readable labels (Lineage Label 01 through Lineage Label 04) and categories (Lineage Category 01 through Lineage Category 04), thereby bridging machine-evaluated trust metrics with organisational taxonomy.

**fact_lineage**

| id | lineage_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | 0.645 | 612.22 | 903.86 |
| TRAN-0002 | TRAN-0003 | 0.071 | 133.03 | 832.18 |
| TRAN-0003 | TRAN-0005 | 0.404 | 76.69 | 862.00 |
| TRAN-0004 | TRAN-0003 | 0.779 | 708.23 | 259.55 |
| TRAN-0005 | TRAN-0003 | 0.376 | 801.99 | 986.33 |
| TRAN-0006 | TRAN-0008 | 0.744 | 956.79 | 34.40 |

**dim_lineage**

| id | lineage_label | lineage_category |
| --- | --- | --- |
| TRAN-0001 | Lineage Label 01 | Lineage Category 01 |
| TRAN-0002 | Lineage Label 02 | Lineage Category 02 |
| TRAN-0003 | Lineage Label 03 | Lineage Category 03 |
| TRAN-0004 | Lineage Label 04 | Lineage Category 04 |
| TRAN-0005 | Lineage Label 05 | Lineage Category 05 |
| TRAN-0006 | Lineage Label 06 | Lineage Category 06 |
| TRAN-0007 | Lineage Label 07 | Lineage Category 07 |
| TRAN-0008 | Lineage Label 08 | Lineage Category 08 |

The attribute system governing column version metadata follows an entity-attribute-value pattern that separates schema definition from value storage. The t_column_version_subclass_attr table declares each attribute by name—confidence, dimension_kind, method, recorded_at—and assigns it an XSD type (xsd:decimal, xsd:string, xsd:dateTime), establishing a type contract that downstream value tables must honour. The t_column_version_subclass table itself identifies column versions (VERS-0001 through VERS-0004) and maps them to their source columns (timestamp_utc, operator_code, humidity_pct) and version identifiers (release_2023q4, canonical_v3, staging_v0.9). Value storage is partitioned by type: decimal values such as 0.648, 428.43, and 933.19 reside in t_column_version_subclass_val_decimal; string values like Dimension Kind 01, Encoding 02, and intake form in t_column_version_subclass_val_varchar; and timestamped values including 2024-04-09T04:38:55 and 2023-01-13T23:21:50 in t_column_version_subclass_val_datetime. Each value row references its entity through entity_id and its attribute through attr_id, creating a sparse but type-safe value store.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | release_2023q4 |
| VERS-0002 | operator_code | canonical_v3 |
| VERS-0003 | timestamp_utc | staging_v0.9 |
| VERS-0004 | humidity_pct | canonical_v3 |
| VERS-0005 | sample_volume_ml | draft_03 |
| VERS-0006 | ph_level | staging_v0.9 |

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

Resource allocation relationships are modelled through a tripartite structure that distinguishes between current and historical associations. The t_allocation_associated_with_agent table enumerates active allocations—data-ingest-queue, telemetry-ingest-window, cloud-vpc-subnet, compute-fleet-reserve—while the was_associated_with table captures their prior bindings to systems such as helm-release-controller, governance-policy-engine, and lab-sample-tracker. The junction table t_allocation_associated_with_agent__was_associated_with binds these two dimensions together, assigning each pairing a role (observer or contributor) that specifies the nature of the relationship. Here, subject and target are explicit foreign-key columns (allocation_id and was_associated_with_id) that reference the respective allocation and association entities, while the role column encodes the semantic relationship type, enabling queries that distinguish between passive observation and active contribution across the allocation lifecycle.

**t_allocation_associated_with_agent**

| id | allocation |
| --- | --- |
| AGEN-0001 | data-ingest-queue |
| AGEN-0002 | telemetry-ingest-window |
| AGEN-0003 | cloud-vpc-subnet |
| AGEN-0004 | compute-fleet-reserve |
| AGEN-0005 | analytics-pipeline-slice |
| AGEN-0006 | prod-cpu-batch |

**t_allocation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | helm-release-controller |
| AGEN-0002 | governance-policy-engine |
| AGEN-0003 | governance-policy-engine |
| AGEN-0004 | lab-sample-tracker |
| AGEN-0005 | helm-release-controller |
| AGEN-0006 | helm-release-controller |

**t_allocation_associated_with_agent__was_associated_with**

| id | allocation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | AGEN-0004 | observer |
| AGEN-0002 | AGEN-0006 | AGEN-0004 | contributor |
| AGEN-0003 | AGEN-0005 | AGEN-0005 | contributor |
| AGEN-0004 | AGEN-0002 | AGEN-0004 | observer |
| AGEN-0005 | AGEN-0003 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0002 | owner |
| AGEN-0008 | AGEN-0002 | AGEN-0001 | owner |