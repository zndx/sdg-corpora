---
chapter_id: ch_live_lineage_observed_by_event_f95e14
topic_id: 120
family: 05_provo_lineage
cited_terms: ['lineage_observed_by_event', 'ontology_class_match', 'artifact_min_one_owner']
model: engine-refine
---

Lineage events are uniquely identified by identifiers such as EVEN-0001 through EVEN-0004, each representing a distinct processing pipeline—sensor-fusion-pipeline, financial-risk-model, data-lake-ingestion, or quality-control-assay. Associated with every event is a set of attributes, each possessing a name and a strictly typed value domain. Attribute names include confidence, dimension_kind, method, and recorded_at, while their types conform to XML Schema definitions: xsd:decimal for numeric measures, xsd:string for categorical or textual descriptors, and xsd:dateTime for temporal stamps. This separation of attribute metadata from value storage enables type-safe serialization across heterogeneous data sources. A recorded_at attribute, for instance, carries a value of 2024-07-15T19:59:01, while a dimension_kind attribute resolves to Dimension Kind 01, and a method attribute may hold Encoding 02 or a pre-release note. The entity column in the value tables anchors each typed datum to its originating lineage event, ensuring that decimal values such as 0.142 or 754.57 are traceable to the correct pipeline instance.

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | sensor-fusion-pipeline |
| EVEN-0002 | financial-risk-model |
| EVEN-0003 | data-lake-ingestion |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | iot-telemetry-ingest |
| EVEN-0006 | financial-risk-model |

**t_lineage_observed_by_event_attr**

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

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

Ontology matching introduces a layer of semantic alignment between observed data elements and formal knowledge bases. The fact_ontology table records each match with a confidence score and a corresponding uncertainty metric, both of which quantify the reliability of the association. Confidence values range from 0.272 to 0.829, reflecting varying degrees of certainty in the classification, while uncertainty spans from 27.88 to 688.77, providing a complementary measure of dispersion. Each match references a target ontology class through the matches_ontology_class_key, which links to a dimension table where classes are further classified by category—Matches Ontology Class Category 01 through 04—and labeled with human-readable identifiers such as Matches Ontology Class Label 01. The value column in fact_ontology stores the raw matched quantity, for example 237.27 or 882.98, enabling downstream reconciliation against expected ranges.

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |

Artifact governance is structured around ownership and version control. The fact_artifact table records each artifact with an owner reference, a size in bytes, and a version number. Owner identifiers such as OWNE-0003 and OWNE-0005 point to a dimension table that provides owner labels and organizational categories, enabling accountability and access control policies to be enforced at the category level. Artifact sizes vary substantially, from 42,978,804 bytes to 996,080,316 bytes, reflecting the diversity of data products in the ecosystem. Version numbers—ranging from 5 to 10—support iterative development and change tracking, ensuring that lineage records can be correlated with the correct artifact revision. The misc column in the owner dimension stores supplementary labels that aid in human interpretation without affecting machine-readable categorization.

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |