---
chapter_id: ch_live_cardinality_min_two_generic_42fd13
topic_id: 109
family: 01_foundation
cited_terms: ['cardinality_min_two_generic', 'artifact_subclass_two_parents', 'belief_interval_with_upper_bound']
model: engine-refine
---

The governance of belief intervals rests upon a tripartite structure of identifiers, attribute definitions, and typed value stores that together enforce semantic integrity across heterogeneous data. Each belief interval is assigned a unique identifier—BOUN-0001 through BOUN-0004—and is characterized by a natural-language description of the phenomenon it captures, such as "Model feature shift" or "Batch ingestion failure." These descriptions are not free text but are anchored to formal cardinality constraints drawn from the generic cardinality table, where identifiers like GENE-0001 and GENE-0002 encode requirements such as "AtLeastTwo" and "MinTwoRequired," and are themselves linked to specific belief intervals through a related-entity column. This linkage ensures that every belief interval satisfies a minimum cardinality requirement before it can be considered a valid construct within the ontology.

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | BOUN-0003 |
| GENE-0002 | MinTwoRequired | BOUN-0001 |
| GENE-0003 | AtLeastTwo | BOUN-0002 |
| GENE-0004 | AtLeastTwo | BOUN-0004 |
| GENE-0005 | DualAssociation | BOUN-0006 |
| GENE-0006 | TwinConstraint | BOUN-0004 |

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | GENE-0002 |
| BOUN-0002 | Batch ingestion failure | GENE-0002 |
| BOUN-0003 | Sensor calibration drift | GENE-0001 |
| BOUN-0004 | Storage quota warning | GENE-0005 |
| BOUN-0005 | Latency SLA breach | GENE-0005 |
| BOUN-0006 | Model feature shift | GENE-0002 |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

Attribute metadata is declared separately from values, establishing a schema layer that governs what properties may be attached to belief intervals. The attribute definition table records, for each belief interval, the name and type of its attributes: confidence is typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. This separation of schema from data enables type-safe value storage across three distinct value tables, each dedicated to a single XML Schema datatype. Decimal values—0.680, 473.67, 703.38, 0.590—are persisted in the decimal value table, string values—"Dimension Kind 01," "Encoding 02," "change rationale"—in the varchar table, and temporal stamps such as 2024-12-10T20:43:33 and 2025-04-06T06:40:08 in the datetime table. Each value row carries an entity identifier that references the belief interval to which it belongs and an attribute identifier that references the attribute definition, forming a normalized entity-attribute-value triple that preserves type discipline without requiring conditional logic at query time.

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

The plausibility upper bound of each belief interval is itself a reference to a cardinality constraint, creating a cross-table dependency that ties semantic bounds to structural requirements. BOUN-0001 and BOUN-0002 both reference GENE-0002 as their upper bound, while BOUN-0003 references GENE-0001 and BOUN-0004 references GENE-0005, establishing a many-to-one mapping from belief intervals to cardinality rules. This design means that the plausibility of a belief is not an intrinsic numeric property but a pointer to a governance rule that dictates how many related entities must exist, thereby embedding compliance logic directly into the data model rather than deferring it to application code.

Artifact subclassing introduces a parallel taxonomy organized around parent-child relationships between software artifacts. The artifact subclass table records pairs of artifacts—streaming-window-5min with ingestion-script-v2, telemetry-aggregate-q3 with encryption-key-rotation, model-checkpoint-epoch12 with master-schema-v1—each identified by a unique code such as PARE-0001 or PARE-0003. Every subclass entry carries a formal identifier in one of several namespaces: a DOI (doi:10.1109/x), an OID (oid:1.3.6.1), a reference number (ref-8842), or a UUID (urn:uuid:9f2a). Tags such as verified, pii, and internal provide an additional layer of classification that is orthogonal to the structural hierarchy, allowing artifacts to be filtered by compliance status or sensitivity without altering the parent-child graph.

**t_artifact_subclass_two_parents**

| id | artifact | artifact_2 | identifier | tags |
| --- | --- | --- | --- | --- |
| PARE-0001 | streaming-window-5min | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0002 | streaming-window-5min | metadata-registry-sync | oid:1.3.6.1 | pii |
| PARE-0003 | telemetry-aggregate-q3 | encryption-key-rotation | ref-8842 | verified |
| PARE-0004 | model-checkpoint-epoch12 | master-schema-v1 | urn:uuid:9f2a | internal |
| PARE-0005 | telemetry-aggregate-q3 | master-schema-v1 | oid:1.3.6.1 | public |
| PARE-0006 | model-checkpoint-epoch12 | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0007 | index-rebuild-prod | validation-ruleset-strict | urn:uuid:9f2a | verified |

Together, these tables form a coherent governance framework in which identifiers serve as the primary keys of every relationship, attribute types enforce value discipline, entities are described through typed properties, and tags provide ad hoc classification. The cardinality constraints ensure that no belief interval exists in isolation, the artifact subclassing captures lineage between software components, and the separation of attribute schema from value storage guarantees that queries can be optimized by datatype without sacrificing semantic clarity.