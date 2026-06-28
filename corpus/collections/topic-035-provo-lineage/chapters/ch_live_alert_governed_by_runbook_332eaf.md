---
chapter_id: ch_live_alert_governed_by_runbook_332eaf
topic_id: 35
family: 07_long_tail
cited_terms: ['alert_governed_by_runbook', 'dataset_was_generated_by', 'schemaorg_product_brand']
model: engine-refine
---

In operational data governance, the integrity of any analytical pipeline rests upon a disciplined separation between the definitions of properties and the values those properties assume across distinct entities. Attributes serve as the named descriptors—effective_date, enforcement, mandatory, priority—each bound to a strict type such as xsd:date, xsd:string, xsd:boolean, or xsd:integer, ensuring that downstream consumers can interpret stored values without ambiguity. The boolean attribute mandatory, for instance, carries values of either true or false across governed runbooks, while the integer attribute priority assigns ordinal significance with values such as 3, 802, 2, and 702. Date-typed attributes anchor temporal governance with concrete effective dates like 2023-06-14 and 2025-03-21, and string-valued attributes capture free-form or coded information including pre-release notes and locale designators such as en. This typed attribute-value separation permits schema evolution: new attributes can be introduced without restructuring existing entity records, and type constraints enforce data quality at ingestion.

The entity concept binds these attributes to concrete operational objects, whether those objects are incident response runbooks identified by identifiers such as RUNB-0001 through RUNB-0004 or data products identified as GENE-0001 through GENE-0004. A runbook entity governs alerts ranging from Data Pipeline Stalled to TLS Certificate Expiry, each governed by a distinct identifier that serves as the primary key for all attribute-value associations. Similarly, dataset entities encompass supply-chain-manifest, satellite-imagery-stack, lab-culture-growth, and genomic-variant-call, each linked to generation sources through a relationship layer that captures not merely which source produced which dataset, but the nature of that production relationship. The role column in this relationship layer—taking values such as observer and contributor—adds semantic precision to the subject-target linkage, distinguishing passive awareness from active participation in data lineage.

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | supply-chain-manifest |
| GENE-0002 | satellite-imagery-stack |
| GENE-0003 | lab-culture-growth |
| GENE-0004 | genomic-variant-call |
| GENE-0005 | lab-culture-growth |
| GENE-0006 | genomic-variant-call |
| GENE-0007 | patient-vitals-csv |
| GENE-0008 | telemetry-sensor-readings |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | edge-compute-node |
| GENE-0002 | telemetry-collector |
| GENE-0003 | ml-training-runner |
| GENE-0004 | telemetry-collector |
| GENE-0005 | kafka-ingestion-job |
| GENE-0006 | batch-cleanup-script |

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |

Subject and target form the directional backbone of these relationship tables, encoding a directed edge from the originating entity to the dependent entity. In the dataset generation lineage, a subject such as GENE-0003 may link to a target such as GENE-0002 with the role contributor, indicating that the telemetry-collector actively produced the lab-culture-growth dataset. The same subject-target pair may appear with a different role in another context, reflecting the multiplicity of relationships that any two entities can maintain. This design avoids the loss of relational semantics that occurs when relationship data is flattened into entity-level columns, and it permits the same generation source—telemetry-collector, for example—to appear across multiple dataset entities without duplication.

Brand and category introduce a parallel dimensional structure for classifying data assets by provenance and domain. The brand dimension stores human-readable labels such as Brand Label 01 through Brand Label 04 alongside categorical classifications like Brand Category 01 through Brand Category 04, each keyed by a unique identifier. The fact table for schemaorg references these brands through a brand_key column, embedding the brand identifier as a foreign key within a record that also carries a size_bytes measurement—values such as 895265030, 114301972, 338701831, and 998785819—and a version number ranging from 3 to 8. This fact-dimension pairing follows the star schema pattern: the fact table captures measurable, additive properties of a data asset, while the dimension table provides the descriptive context that enables filtering and aggregation by brand or category.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

The identifier column, present across all tables, provides the universal keying mechanism that enables cross-table joins and referential integrity. Whether the identifier follows the RUNB prefix for runbook entities, the GENE prefix for dataset entities, or the BRAN prefix for brand entities, it serves as the atomic unit of entity resolution. The misc column, appearing in value tables and dimension tables, accommodates heterogeneous data that does not fit into the typed attribute-value paradigm—free-text notes, encoded strings, or categorical labels that are descriptive rather than analytical. Together, these design choices create a data model that is both extensible and queryable, supporting the governance requirements of modern data platforms without sacrificing the performance characteristics needed for operational analytics.