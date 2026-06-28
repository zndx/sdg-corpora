---
chapter_id: ch_live_schemaorg_place_geocoord_d32e5a
topic_id: 1
family: 07_long_tail
cited_terms: ['schemaorg_place_geocoord', 'pci_dss_requirement', 'span_with_attribute']
model: engine-refine
---

Geospatial identifiers and their associated metadata form the backbone of location-aware data lineage, where each record carries a unique key such as GEOC-0001 or GEOC-0004 alongside categorical classifications like Geo Coordinates Category 01 through Geo Coordinates Category 04 and descriptive labels including Geo Coordinates Label 01 through Geo Coordinates Label 04. These dimension tables serve as the authoritative reference for spatial attributes, enabling fact tables to reference geo_coordinates_key values without duplicating classification metadata. The fact_schemaorg table materializes this relationship by anchoring concrete data assets to their spatial context, recording version numbers ranging from 3 to 8 and storage footprints that span from 114,301,972 bytes to 895,265,030 bytes, thereby establishing a traceable chain from identifier to geographic classification to volumetric footprint.

**fact_schemaorg**

| id | geo_coordinates_key | size_bytes | version |
| --- | --- | --- | --- |
| GEOC-0001 | GEOC-0004 | 895265030 | 3 |
| GEOC-0002 | GEOC-0006 | 114301972 | 5 |
| GEOC-0003 | GEOC-0004 | 338701831 | 4 |
| GEOC-0004 | GEOC-0004 | 998785819 | 8 |

**dim_geo_coordinates**

| id | geo_coordinates_label | geo_coordinates_category |
| --- | --- | --- |
| GEOC-0001 | Geo Coordinates Label 01 | Geo Coordinates Category 01 |
| GEOC-0002 | Geo Coordinates Label 02 | Geo Coordinates Category 02 |
| GEOC-0003 | Geo Coordinates Label 03 | Geo Coordinates Category 03 |
| GEOC-0004 | Geo Coordinates Label 04 | Geo Coordinates Category 04 |
| GEOC-0005 | Geo Coordinates Label 05 | Geo Coordinates Category 05 |
| GEOC-0006 | Geo Coordinates Label 06 | Geo Coordinates Category 06 |

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

Distributed tracing instrumentation follows an analogous dimensional architecture, wherein the dim_span_attribute table provides the categorical and descriptive scaffolding—Span Attribute Category 01 through 04 and corresponding labels—for the fact_span table, which captures operational telemetry at the point of execution. Each span record, identified by keys such as ATTR-0001 through ATTR-0004, carries a span_attribute_key that resolves to its dimensional definition, a duration_seconds measurement that varies from 410.92 seconds for brief operations to 4,963.54 seconds for extended processes, an exit_code that documents termination states including 767, 893, 599, and 91, and a retry_count that quantifies resilience attempts ranging from 145 to 494. This structure permits analysts to correlate attribute classification with performance degradation patterns and failure recovery behavior without conflating measurement with metadata.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

Compliance frameworks are similarly decomposed into requirement definitions and their interdependencies, as evidenced by the t_pci_dss_requirement table which enumerates standards such as PCI DSS v3.2, PCI DSS v1.1, and PCI DSS v4.0 against identifiers REQU-0001 through REQU-0004, while the junction table t_pci_dss_requirement_pci_dss_requirement maps specific control references including Requirement 10.6, Requirement 2.1, Requirement 1.2, and Requirement 3.4 to their parent requirements. The relationship matrix t_pci_dss_requirement__pci_dss_requirement then assigns governance roles—owner, contributor, observer—to the subject-to-target linkage between PCI DSS requirement records, establishing accountability boundaries where a subject such as REQU-0004 may reference a target like REQU-0002 under a contributor role, while REQU-0001 and REQU-0002 both designate REQU-0005 as their target under observer and owner designations respectively.

**t_pci_dss_requirement**

| id | pci |
| --- | --- |
| REQU-0001 | PCI DSS v3.2 |
| REQU-0002 | PCI DSS v1.1 |
| REQU-0003 | PCI DSS v1.1 |
| REQU-0004 | PCI DSS v4.0 |
| REQU-0005 | PCI DSS v3.0 |
| REQU-0006 | PCI DSS v2.0 |

**t_pci_dss_requirement_pci_dss_requirement**

| id | pci_dss_requirement |
| --- | --- |
| REQU-0001 | Requirement 10.6 |
| REQU-0002 | Requirement 2.1 |
| REQU-0003 | Requirement 1.2 |
| REQU-0004 | Requirement 3.4 |
| REQU-0005 | Requirement 6.5 |
| REQU-0006 | Requirement 11.4 |

**t_pci_dss_requirement__pci_dss_requirement**

| id | pci_id | pci_dss_requirement_id | role |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | REQU-0002 | contributor |
| REQU-0002 | REQU-0005 | REQU-0005 | observer |
| REQU-0003 | REQU-0001 | REQU-0005 | owner |
| REQU-0004 | REQU-0002 | REQU-0005 | observer |
| REQU-0005 | REQU-0003 | REQU-0004 | owner |
| REQU-0006 | REQU-0003 | REQU-0002 | owner |
| REQU-0007 | REQU-0006 | REQU-0003 | owner |
| REQU-0008 | REQU-0006 | REQU-0002 | owner |

The convergence of these dimensional patterns reveals a consistent architectural principle: identifiers serve as the immutable anchor points across all fact and dimension tables, while category and misc columns provide the human-readable classification layer that separates analytical signal from administrative noise. Duration measurements, byte counts, exit codes, and retry tallies populate the fact tables as quantifiable evidence of system behavior, each value—whether 3,549.11 seconds of span duration, 998,785,819 bytes of schemaorg storage, or 428 retry attempts—functioning as a discrete datum within a larger observability and compliance posture. The subject and target columns in the relationship tables encode directional dependencies, and the role column assigns participatory context to those dependencies, together forming a graph of accountability that can be queried, audited, and enforced.