---
chapter_id: ch_live_cardinality_min_one_generic_d9408d
topic_id: 42
family: 01_foundation
cited_terms: ['cardinality_min_one_generic', 'mass_function_min_one_focal', 'transformation_min_one_output']
model: engine-refine
---

The governance of evidence-bearing records rests on a layered architecture of identifiers, attributes, and cardinality constraints that together enforce referential integrity across heterogeneous data sources. Generic identifiers such as `GENE-0001` through `GENE-0004` serve as the foundational keys in the cardinality registry, where each entry is bound to a constraint—`exactlyOne`, `minOne`, or `required`—and linked to a focal element like `FOCA-0004` or `FOCA-0005`. This cardinality table establishes the minimum membership requirements for sets that underpin the mass function framework, ensuring that every focal element carries at least one validated association before it can participate in downstream transformations. The focal elements themselves, enumerated as `FOCA-0001` through `FOCA-0004`, are assigned mass values drawn from domains such as `audit_trail_eta`, `provenance_record_epsilon`, and `sensor_array_gamma`, and each focal element is mapped back to a generic entity—`GENE-0002` appears as the focal target for three of the four entries, while `GENE-0004` anchors the fourth—thereby creating a bidirectional traceability path from abstract constraint to concrete evidence assignment.

**t_cardinality_min_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | exactlyOne | FOCA-0004 |
| GENE-0002 | minOne | FOCA-0004 |
| GENE-0003 | minOne | FOCA-0004 |
| GENE-0004 | required | FOCA-0005 |
| GENE-0005 | minOne | FOCA-0004 |
| GENE-0006 | many | FOCA-0001 |

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | GENE-0004 |
| FOCA-0002 | audit_trail_eta | GENE-0002 |
| FOCA-0003 | provenance_record_epsilon | GENE-0002 |
| FOCA-0004 | sensor_array_gamma | GENE-0002 |
| FOCA-0005 | governance_log_delta | GENE-0001 |
| FOCA-0006 | provenance_record_epsilon | GENE-0003 |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

Attributes provide the dimensional scaffolding that gives focal elements their semantic specificity. The attribute registry defines four named properties—`confidence`, `dimension_kind`, `method`, and `recorded_at`—each typed according to the XML Schema Definition namespace: `xsd:decimal` for numeric precision, `xsd:string` for categorical labels, and `xsd:dateTime` for temporal markers. These attributes are not free-floating; they are bound to focal elements through a value-resolution layer that separates data by type into three dedicated stores. Decimal-valued attributes such as `confidence` resolve to measurements like `0.223` and `0.161`, while string-valued attributes capture designations like `Dimension Kind 01`, `Encoding 02`, `calibration record`, and `es`. Temporal attributes record timestamps spanning from `2023-01-26T15:54:26` through `2024-04-19T20:46:34`, anchoring each evidence record to a verifiable point in time. The entity column in each value table references the focal element that owns the attribute, while the attribute column points to the attribute definition, forming a composite foreign key that guarantees every value resolves to a valid entity-attribute pair.

The transformation layer introduces a second axis of relational structure, where operational processes are catalogued by their functional type and their output destinations. Transformations such as `data normalization` and `format conversion` are identified by keys like `OUTP-0001` through `OUTP-0004` and are associated with output datasets including `parsed access logs`, `curated events table`, and `standardized inventory index`. A junction table mediates the many-to-many relationship between transformations and output datasets, introducing a role dimension that distinguishes whether a given dataset serves as a `reviewer`, `contributor`, or `observer` in the context of a particular transformation. For instance, the transformation identified as `OUTP-0006` produces three distinct output datasets—`OUTP-0003`, `OUTP-0005`, and `OUTP-0001`—with the first two assigned the role of `contributor` and the third as `observer`, while `OUTP-0003` operates independently with its output dataset `OUTP-0003` holding the role of `observer`. This role-based mediation enables fine-grained governance over data lineage, making it possible to audit not only what transformations were applied but also the functional relationship each output dataset maintains to the transformation that produced it.

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |