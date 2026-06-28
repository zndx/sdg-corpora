---
chapter_id: ch_live_schemaorg_creativework_publisher_c1b387
topic_id: 4
family: 07_long_tail
cited_terms: ['schemaorg_creativework_publisher', 'ontology_class_match', 'artifact_with_universal']
model: engine-refine
---

In systems that manage structured metadata at scale, the distinction between an entity's identity and its properties is foundational. Each entity carries a unique identifier—such as `PUBL-0001` for an API Gateway Config published by the NIST Cybersecurity Office, or `UNIV-0001` for an Audit_Reporter artifact deployed in `us-east-1`—that anchors it within the data fabric. The properties themselves are modeled as attributes, each with a name and a type that governs how its value is interpreted. An attribute like `checksum` is typed as `xsd:string`, while `created_date` carries the type `xsd:date`, and `identifier` is classified under `cco:DesignativeICE`, a custom designative type. This separation of attribute definition from attribute value enables flexible, type-safe storage: string values such as `9d2b7a16` or `proprietary`, integer values like `72` or `3`, and date values including `2023-06-28` and `2024-12-26` are each persisted in dedicated value tables keyed to their entity and attribute, ensuring that type constraints are enforced at query time rather than at ingestion.

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | NIST Cybersecurity Office |
| PUBL-0002 | API Gateway Config | AWS Documentation Team |
| PUBL-0003 | Cloud Migration Playbook | AWS Documentation Team |
| PUBL-0004 | Cloud Migration Playbook | NIST Cybersecurity Office |
| PUBL-0005 | Incident Postmortem | ISO Technical Committee |
| PUBL-0006 | Telemetry Schema Draft | AWS Documentation Team |
| PUBL-0007 | Firmware Release Notes | Elastic Search Team |
| PUBL-0008 | Cloud Migration Playbook | Apache Software Foundation |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

Ontology matching introduces a layer of semantic classification atop this structured metadata, and it is here that confidence and uncertainty become critical governance signals. When an entity is evaluated against a known ontology class, the system records a match identifier—`MATC-0001` might correspond to "Matches Ontology Class Label 01" in category "Matches Ontology Class Category 01"—alongside a confidence score and an uncertainty measure. A confidence of `0.829` paired with an uncertainty of `27.88` signals a strong, reliable classification, whereas a confidence of `0.272` with uncertainty of `112.66` indicates a weak, potentially unreliable match that warrants human review. These paired metrics allow downstream consumers to filter, weight, or flag ontology assignments based on their trustworthiness, rather than treating all matches as equally valid. The value field associated with each match—ranging from `237.27` to `882.98`—captures additional quantitative context, such as a similarity score or a derived metric, that further supports classification decisions.

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

The temporal and spatial dimensions of managed artifacts provide essential context for auditability and operational awareness. Every artifact records a creation date—`2024-12-09` for the Audit_Reporter, `2024-10-11` for the Schema_Definition—enabling chronological tracking of when resources entered the system. The location field, which takes values such as `us-east-1` for cloud-deployed artifacts or `on-prem-dc1` for on-premises resources, anchors each entity within a specific infrastructure domain. These dimensions are not merely descriptive; they are queryable constraints that support compliance reporting, cost allocation, and incident response. An artifact like the Container_Image_Release, created on `2024-10-15` and located in `us-east-1`, can be traced to its related dependency—the Compliance_Audit_Log—creating a navigable chain of provenance that auditors and operators rely on.

Together, these constructs form a cohesive metadata management framework. Identifiers provide the primary keys that link entities to their attributes, their ontology classifications, and their temporal-spatial context. Attribute types enforce data integrity across heterogeneous value stores, while ontology confidence and uncertainty metrics introduce a graded notion of semantic trust. Creation dates and locations ground abstract metadata in real-world operational reality, and categories organize ontology classes into meaningful groupings. The result is a system where every piece of metadata is not only stored but contextualized—each value traceable to its entity, its type, its classification confidence, and its place in time and infrastructure.