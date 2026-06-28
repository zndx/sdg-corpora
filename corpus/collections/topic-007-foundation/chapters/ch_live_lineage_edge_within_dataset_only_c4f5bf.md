---
chapter_id: ch_live_lineage_edge_within_dataset_only_c4f5bf
topic_id: 7
family: 05_provo_lineage
cited_terms: ['lineage_edge_within_dataset_only', 'allocation_subclass', 'designative_subclass_basic']
model: engine-refine
---

Within dataset architectures, identifiers serve as the immutable anchors of provenance, each entity assigned a scoped prefix that signals its domain of origin—`ONLY-0001` through `ONLY-0004` for lineage records, `ALLO-0001` through `ALLO-0005` for allocation and transformation mappings, and `DESI-0001` through `DESI-0004` for designative classifications. These identifiers are not arbitrary; they encode structural intent, enabling joins across fact and dimension tables without ambiguity. A lineage record identified as `ONLY-0001` references a downstream entity keyed as `ONLY-0003`, establishing a directed edge in the data dependency graph, while the same identifier space is reused independently in the allocation domain where `ALLO-0001` denotes a `nightly-ingest` allocation paired with a `Celery Worker` execution target. The separation of identifier namespaces prevents cross-domain collision while preserving a uniform addressing convention.

**fact_lineage**

| id | within_dataset_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONLY-0001 | ONLY-0003 | 0.645 | 612.22 | 903.86 |
| ONLY-0002 | ONLY-0004 | 0.071 | 133.03 | 832.18 |
| ONLY-0003 | ONLY-0005 | 0.404 | 76.69 | 862.00 |
| ONLY-0004 | ONLY-0006 | 0.779 | 708.23 | 259.55 |
| ONLY-0005 | ONLY-0001 | 0.376 | 801.99 | 986.33 |
| ONLY-0006 | ONLY-0004 | 0.744 | 956.79 | 34.40 |

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

Category and classification taxonomies provide the semantic scaffolding that transforms raw identifiers into queryable, governable entities. Within the dataset dimension, each identifier maps to a human-readable label—`Within Dataset Label 01` through `Within Dataset Label 04`—and a categorical assignment such as `Within Dataset Category 01` through `Within Dataset Category 04`, enabling aggregation and filtering at the conceptual level rather than the record level. Similarly, designative entities carry coded classifications: `event_tag_crash` instances are tagged with code `D-33` in both French (`fr`) and Spanish (`es`) locales, while `plate_A04` and `barcode_8842X` carry codes `B-12` and `E-21` respectively, each associated with a language designation that governs downstream localization and rendering. These categorical and linguistic attributes are not metadata ornaments; they determine routing, compliance, and accessibility policies across multi-tenant environments.

**dim_within_dataset**

| id | within_dataset_label | within_dataset_category |
| --- | --- | --- |
| ONLY-0001 | Within Dataset Label 01 | Within Dataset Category 01 |
| ONLY-0002 | Within Dataset Label 02 | Within Dataset Category 02 |
| ONLY-0003 | Within Dataset Label 03 | Within Dataset Category 03 |
| ONLY-0004 | Within Dataset Label 04 | Within Dataset Category 04 |
| ONLY-0005 | Within Dataset Label 05 | Within Dataset Category 05 |
| ONLY-0006 | Within Dataset Label 06 | Within Dataset Category 06 |

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |

Confidence and uncertainty metrics quantify the reliability of lineage assertions and measured values, forming the basis for risk-aware data consumption. In the lineage fact table, confidence scores range from `0.071`—indicating a tenuous or inferred relationship—to `0.779`, suggesting a well-established provenance link, while uncertainty values span from `76.69` to `708.23`, reflecting the magnitude of variance in associated measurements. The corresponding value column records the observed metric itself, with entries such as `903.86`, `832.18`, `862.00`, and `259.55`, each tied to a specific lineage edge and its associated confidence-uncertainty pair. Consumers of these records must weigh confidence against uncertainty when deciding whether to trust a data product's derivation path; a lineage edge with confidence `0.071` and uncertainty `133.03` carrying a value of `832.18` demands substantially more scrutiny than one with confidence `0.779` and uncertainty `708.23`, even though the latter exhibits greater absolute variance.

Role, subject, and target define the governance topology of transformation pipelines, specifying which allocation owns, contributes to, or merely observes a given execution target. The junction table linking allocations to transformations assigns each edge a role—`contributor`, `owner`, or `observer`—that determines access rights, audit obligations, and change-management requirements. Allocation `ALLO-0001` (`nightly-ingest`) assumes the role of `contributor` to transformation `ALLO-0001` (`Celery Worker`), while allocation `ALLO-0002` (`etl-daily-load`) similarly contributes to transformation `ALLO-0005` (`TensorFlow Serving`). Notably, allocation `ALLO-0004` (`batch-prod-main`) is assigned the role of `observer` against transformation `ALLO-0006` (`Flink TaskManager`), a configuration that permits visibility without write authority. These role assignments are not static; they reflect operational agreements that can be audited, revoked, or escalated as pipeline dependencies evolve.

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |

Miscellaneous attributes—free-form codes, measured values, and locale designations—complete the metadata fabric by capturing information that does not fit neatly into categorical or relational structures. The code field in designative records (`D-33`, `B-12`, `E-21`) serves as a compact, system-internal reference that may map to external registries or compliance frameworks. The value field in lineage facts captures the quantitative substance of a provenance claim, while language fields (`fr`, `es`) govern the linguistic context of associated labels and error messages. Together, these attributes ensure that every entity carries sufficient context for automated processing, human review, and regulatory reporting without requiring auxiliary lookups or external documentation.