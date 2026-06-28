---
chapter_id: ch_live_schema_revision_of_198e1d
topic_id: 186
family: 07_long_tail
cited_terms: ['schema_revision_of', 'measurement_aggregated_into', 'allocation_with_input_facets']
model: engine-refine
---

Within any structured data governance framework, the identifier serves as the immutable anchor for every entity, whether a schema revision, a measurement, or an allocation. Identifiers follow a disciplined naming convention that encodes provenance: revision records carry prefixes such as REVI-0001 through REVI-0004, measurement records use INTO-0001 through INTO-0004, and allocation records are tagged FACE-0001 through FACE-0004. This convention ensures that every row can be referenced unambiguously across tables, enabling traceability from a high-level schema revision like REVI-0001—which governs the network_flow_record schema—down through its relationships to legacy sources such as legacy_compliance_log and legacy_network_record. The identifier is not merely a key; it is the primary mechanism by which auditors and data stewards reconstruct the lineage of any datum.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

**t_allocation_with_input_facets**

| id | allocation |
| --- | --- |
| FACE-0001 | Quota Project Alpha |
| FACE-0002 | Cluster Alpha Node |
| FACE-0003 | Model Training Run |
| FACE-0004 | Quota Project Alpha |
| FACE-0005 | Quota Project Alpha |
| FACE-0006 | Quota Project Alpha |
| FACE-0007 | Cluster Alpha Node |
| FACE-0008 | Quota Project Alpha |

**t_allocation_with_input_facets_input_facet**

| id | input_facet |
| --- | --- |
| FACE-0001 | PostgreSQL Snapshot |
| FACE-0002 | GraphQL Query Results |
| FACE-0003 | PostgreSQL Snapshot |
| FACE-0004 | Raw JSON Logs |
| FACE-0005 | GraphQL Query Results |
| FACE-0006 | User Event Stream |
| FACE-0007 | User Event Stream |

Relationships between entities are expressed through a subject–target–role pattern that appears consistently across the model. In the schema-revision junction table, a single revision such as REVI-0001 can relate to multiple targets: it may designate REVI-0006 as a reviewer, REVI-0001 itself as a contributor, and REVI-0003 as a reviewer, while a separate revision, REVI-0007, assumes the role of owner against target REVI-0003. The same pattern governs allocation relationships, where FACE-0007 acts as the subject linking to target FACE-0005 under the role of owner, and FACE-0001 links to FACE-0007 as a reviewer. The role column captures the functional capacity of the subject in relation to the target—whether it is an owner responsible for the entity, a reviewer who validates it, or a contributor who adds to it. This triad of subject, target, and role provides a uniform vocabulary for expressing ownership, review, and contribution across all entity types.

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

**t_allocation_with_input_facets__input_facet**

| id | allocation_id | input_facet_id | role |
| --- | --- | --- | --- |
| FACE-0001 | FACE-0007 | FACE-0005 | owner |
| FACE-0002 | FACE-0005 | FACE-0003 | reviewer |
| FACE-0003 | FACE-0003 | FACE-0002 | contributor |
| FACE-0004 | FACE-0001 | FACE-0007 | reviewer |
| FACE-0005 | FACE-0002 | FACE-0003 | reviewer |
| FACE-0006 | FACE-0001 | FACE-0001 | observer |
| FACE-0007 | FACE-0002 | FACE-0006 | observer |
| FACE-0008 | FACE-0007 | FACE-0006 | observer |

Measurement quality is tracked through two complementary dimensions: confidence and uncertainty. Confidence values range from 0.307 to 0.945, with a record such as INTO-0002 achieving a confidence of 0.945 indicating a high degree of reliability, while INTO-0004 at 0.307 signals substantial doubt. Uncertainty, expressed as an absolute magnitude, ranges from 120.70 to 364.07; the measurement INTO-0004 carries an uncertainty of 364.07 alongside its low confidence, reinforcing the interpretation that this datum is both unreliable and highly variable. The misc column holds the actual measured value—353.34 for INTO-0001, 660.64 for INTO-0002, 878.99 for INTO-0003, and 64.10 for INTO-0004—allowing stewards to assess whether the magnitude of the value itself is consistent with its stated confidence and uncertainty. Together, these three columns form a quality profile that determines whether a measurement can be trusted for downstream aggregation or reporting.

Aggregation is modeled through the aggregated_into dimension, which classifies measurement records into higher-level groupings. Each aggregated_into_key, such as INTO-0005 or INTO-0004, points to a dimension record that provides both a human-readable label—Aggregated Into Label 01 through Aggregated Into Label 04—and a category classification—Aggregated Into Category 01 through Aggregated Into Category 04. This two-tier structure (label plus category) enables both operational navigation and analytical filtering: a data engineer can locate a specific aggregation by its label, while an analyst can group results by category to compare performance across domains. The fact_measurement table links individual records to their aggregation target via the aggregated_into_key column, so that INTO-0001 and INTO-0002 both roll up into INTO-0005, while INTO-0003 and INTO-0004 each map to their own aggregation targets. This design supports hierarchical roll-ups where granular measurements are summarized into category-level summaries, with the confidence and uncertainty of the parent aggregation derived from the quality profiles of its constituent records.

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |