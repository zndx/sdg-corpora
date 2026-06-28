---
chapter_id: ch_live_pci_dss_requirement_1468c6
topic_id: 1
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'tc_classifier_subclass', 'schema_version_subclass']
model: engine-refine
---

In compliance and data governance frameworks, the ability to unambiguously identify, classify, and relate regulatory artifacts to their underlying technical representations constitutes the foundation of auditability. Each requirement within a standard such as PCI DSS is assigned a stable identifier—REQU-0001 through REQU-0004, for instance—while simultaneously being associated with a particular version of the standard itself, whether PCI DSS v3.2, v1.1, or v4.0. This dual anchoring ensures that a given control can be traced both to its canonical position within a specific revision and to its evolution across revisions. The requirement-to-requirement mapping further refines this traceability: REQU-0001 resolves to Requirement 10.6, REQU-0002 to Requirement 2.1, REQU-0003 to Requirement 1.2, and REQU-0004 to Requirement 3.4, establishing a precise correspondence between internal identifiers and the external regulatory text.

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

The relationships between requirements are not merely hierarchical but carry semantic roles that distinguish how one requirement relates to another. A single requirement may serve as the owner of a dependent requirement, as observer, or as contributor, with REQU-0001 acting as owner of REQU-0005, REQU-0004 as contributor to REQU-0002, and REQU-0002 and REQU-0003 both observing REQU-0005. This role-based relationship model enables auditors to reconstruct the dependency graph of controls and to understand which requirements are primary versus secondary, which are derived versus foundational. The subject and target columns in these relationship tables encode the directionality of the linkage, with the subject representing the originating requirement and the target representing the dependent one.

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

Beyond regulatory requirements, the framework extends to the classification and versioning of technical artifacts such as schemas, event catalogs, and telemetry streams. The schema version subsystem assigns identifiers like VERS-0001 through VERS-0004 to distinct schema-subclass combinations, each tagged with a version qualifier that conveys its maturity: release-11.0 for the EventCatalog schema, rc-2.1 and alpha-0.9 for different versions of the AccessControlMatrix schema, and patch-3.2 for the TelemetryStream schema. These version labels are not arbitrary; they signal the development lifecycle stage and inform downstream consumers about the stability and expected compatibility of the artifact.

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | EventCatalog | release-11.0 |
| VERS-0002 | AccessControlMatrix | rc-2.1 |
| VERS-0003 | AccessControlMatrix | alpha-0.9 |
| VERS-0004 | TelemetryStream | patch-3.2 |
| VERS-0005 | AccessControlMatrix | rc-2.1 |
| VERS-0006 | AssetRegistry | hotfix-2.0 |
| VERS-0007 | AccessControlMatrix | alpha-0.9 |
| VERS-0008 | EventCatalog | hotfix-2.0 |

Attributes provide the mechanism by which entities—whether regulatory requirements, schema versions, or classified data objects—are described with structured metadata. An attribute is defined by its name and its type, where types range from standard XML Schema datatypes such as xsd:string and xsd:date to domain-specific types like cco:DesignativeICE. The attribute catalog includes properties such as checksum, created_date, identifier, and license, each typed appropriately for its semantic domain. Values for these attributes are stored in type-specialized tables: date values like 2024-06-07 and 2024-09-26 in the date store, integer values such as 24 and 11 in the integer store, and string values including checksums (a3f9c21e), DOIs (doi:10.1109/x), license identifiers (MPL-2.0), and deployment locations (on-prem-dc1) in the varchar store. This separation by type ensures type safety while allowing a single entity to carry heterogeneous attributes.

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

The classification dimension introduces directional and categorical metadata that governs how data artifacts are processed and routed. Each classifier carries a direction key—CLAS-0001 through CLAS-0006—that references a label and category from the direction dimension, where labels such as T C Direction Label 01 map to categories like T C Direction Category 01. The size of classified artifacts, measured in bytes, ranges from approximately 623 MB to 883 MB across the observed classifiers, providing operational visibility into the storage footprint of each classification. Together with the version number assigned to each classifier, these metrics enable capacity planning and compliance reporting on the volume and evolution of classified data.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |