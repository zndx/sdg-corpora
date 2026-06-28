---
chapter_id: ch_live_ganglion_cyst_tissue_origin_a79fd0
topic_id: 0
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'profiling_only_targets_datasets', 'dempster_combinant_second']
model: engine-refine
---

The governance of clinical and analytical evidence rests on a unified entity–attribute–value architecture that separates identity, structural definition, and runtime data into distinct layers. At the top of this hierarchy, entities such as tissue origins and profiling datasets are assigned stable identifiers—ORIG-0001 through ORIG-0004 for anatomical sources, DATA-0001 through DATA-0004 for data-quality operations—each anchoring a set of typed attributes that describe their properties. A tissue origin may denote the sacroiliac joint, the metacarpophalangeal joint, the subacromial bursa, or the first dorsal compartment, while a profiling dataset records the nature of its analysis, whether null rate analysis, cardinality profiling, data lineage sweep, or hash integrity check. These identifiers are not merely labels; they serve as the join keys that propagate through every subsequent table, ensuring that attribute definitions and their concrete values remain traceable to the entity they characterise.

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

Attribute definitions are themselves first-class records, each carrying a name and an XML Schema type that constrains the values permitted downstream. The profiling datasets declare attributes such as duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string), while the Dempster–Shafer combinants expose confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). This separation of schema from data means that the attribute catalogue—captured in the attr and attr_type columns—can evolve independently of the value tables, and that type enforcement can be applied at query time rather than at insert time. The xsd namespace on every type declaration signals a commitment to W3C-standard serialisation, which in turn guarantees that values stored as decimal, dateTime, integer, or string can be round-tripped across heterogeneous systems without ambiguity.

Concrete values are materialised in a family of type-dispatch tables, each keyed by a composite of entity and attribute. A profiling dataset identified as DATA-0001 may carry a duration_seconds value of 30.48, an end_time of 2024-10-18T20:19:23, an exit_code of 255, and a host_name of gw-12, with each value residing in its own value table—val_decimal, val_datetime, val_int, and val_varchar respectively. The Dempster–Shafer combinants follow the same pattern: the EvidenceCombinationBeta node (SECO-0001) records a confidence of 0.328, a recorded_at timestamp of 2024-10-02T15:13:46, and a dimension_kind of Dimension Kind 01, while the AnomalyFusionEngine (SECO-0002) carries a confidence of 0.558 and a recorded_at of 2024-09-30T23:04:21. This value-dispatch design avoids the cardinality explosion of wide tables; instead, each attribute–entity pair occupies exactly one row in the appropriate type table, and the full attribute vector for any entity is reconstructed by joining across the four value tables.

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

Beyond simple attribute storage, the model supports relational composition through role-bearing junction tables. The tissue-origin hierarchy is expressed via a part-of relationship that maps each ganglion cyst tissue origin to a connective tissue structure—periosteal layer, joint capsule, deep fascia, or fibrous adventitia—while a separate associative table, t_ganglion_cyst_tissue_origin__part_of, attaches a role to each link. The same ganglion_id ORIG-0007 may appear twice in this junction, once with the role reviewer and once with the role owner, each time pointing to a different part_of_id (ORIG-0001 and ORIG-0005 respectively). This role column transforms a plain foreign-key graph into a semantically annotated relationship, enabling queries that distinguish, for example, which entities are contributors versus owners of a given anatomical structure. The Dempster–Shafer layer mirrors this pattern: the t_dempster_combinant_second table links a combination engine such as GovernanceEvidenceModel to a second combinant dataset (DATA-0004), and the full evidence-combination record is then enriched with its own attribute definitions and typed values, forming a nested entity that references other entities in the profiling domain.

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

The practical consequence of this architecture is that governance, provenance, and data-quality metadata share a single modelling vocabulary. Whether one is tracking the tissue origin of a ganglion cyst, the execution duration of a profiling job, or the confidence score of an evidence-combination node, the same id–attr–attr_type–value chain applies. Identifiers propagate unchanged from the entity catalogue through the attribute schema into the value tables and across junction links, so that a query starting from DATA-0001 can traverse to its profiling type, then to its duration_seconds attribute, then to the decimal value 30.48, and finally to any Dempster–Shafer combinant that references DATA-0001 as its second_combinant. This uniformity is what allows the system to enforce consistency across clinical anatomy, data-quality operations, and evidence fusion without introducing domain-specific schemas at each layer.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | DATA-0005 |
| SECO-0002 | AnomalyFusionEngine | DATA-0001 |
| SECO-0003 | LabDataCombinerNode | DATA-0006 |
| SECO-0004 | GovernanceEvidenceModel | DATA-0004 |
| SECO-0005 | GovernanceEvidenceModel | DATA-0006 |
| SECO-0006 | GovernanceEvidenceModel | DATA-0002 |
| SECO-0007 | CrossDomainEvidenceRule | DATA-0005 |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |