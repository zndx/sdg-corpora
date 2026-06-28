---
chapter_id: ch_live_allocation_exactly_one_run_id_06ce62
topic_id: 183
family: 05_provo_lineage
cited_terms: ['allocation_exactly_one_run_id', 'responsive_optic_nerve_dysfunction', 'requirement_basic']
model: engine-refine
---

The data model is built around a flexible entity-attribute-value paradigm that enables heterogeneous metadata to be stored, typed, and queried without requiring rigid schema changes for each new property. At its core, every record carries a unique identifier—such as `RUN-0001` for an execution allocation, `DYSF-0001` for a clinical dysfunction record, or `REQU-0001` for a compliance requirement—which serves as the stable anchor for all relationships. Entities represent the domain objects being described, whether they are data pipeline runs, medical conditions, or governance requirements, and each entity can be enriched with an arbitrary set of attributes whose definitions are captured separately from their values. This separation of schema from data is what allows the model to accommodate diverse domains under a single structural pattern.

**t_allocation_exactly_one_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | etl-sync-west |
| RUN-0002 | batch-ingest-prod |
| RUN-0003 | query-opt-run |
| RUN-0004 | replica-clone-3 |
| RUN-0005 | model-deploy-stg |
| RUN-0006 | cache-warm-init |

**t_allocation_exactly_one_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | proc-id-4421 |
| RUN-0002 | session-77b |
| RUN-0003 | job-handle-11d |
| RUN-0004 | run-88f3a1 |
| RUN-0005 | run-tag-alpha |
| RUN-0006 | batch-snapshot-5e |
| RUN-0007 | pipeline-run-44f |
| RUN-0008 | task-uuid-003 |

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

Attributes are declared with a name and a type, establishing a contract for the kind of value that may be associated with them. The attribute registry supports a range of XML Schema types: `xsd:date` for temporal properties like `effective_date`, `xsd:string` for free-form text such as `enforcement`, `xsd:boolean` for binary flags like `mandatory`, and `xsd:integer` for numeric measures like `priority`. Values are then stored in dedicated typed value tables, each keyed by the entity it belongs to and the attribute it populates. For instance, the boolean attribute `mandatory` is evaluated as `true` for requirement `REQU-0001` but `false` for `REQU-0002`, `REQU-0003`, and `REQU-0004`, while the date attribute `effective_date` carries values such as `2025-06-11` and `2024-12-28` across different requirement records. Integer attributes like `priority` hold values ranging from `5` to `962`, and string attributes capture descriptive content such as `Encoding 01`, `calibration record`, and `Enforcement 02`. This type-dispatched storage ensures that values are validated at write time and retrieved with correct semantics.

Relationships between entities are expressed through subject-target-role triples, which model how one entity participates in a relationship with another under a specific role. In the allocation domain, for example, a run identifier such as `proc-id-4421` or `session-77b` is linked to an allocation like `etl-sync-west` or `batch-ingest-prod` through a relationship record that specifies the subject (the allocation being referenced), the target (the run identifier), and the role (such as `contributor`, `observer`, or `owner`). The same allocation `RUN-0002` can appear as a subject in one relationship and as a target in another, demonstrating that entities are not fixed to a single relational position but can play multiple roles depending on context. This triadic model supports complex, multi-directional associations without requiring additional tables for each relationship type.

**t_allocation_exactly_one_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0002 | RUN-0006 | contributor |
| RUN-0002 | RUN-0004 | RUN-0002 | contributor |
| RUN-0003 | RUN-0003 | RUN-0003 | observer |
| RUN-0004 | RUN-0005 | RUN-0002 | owner |
| RUN-0005 | RUN-0001 | RUN-0007 | contributor |
| RUN-0006 | RUN-0003 | RUN-0007 | observer |
| RUN-0007 | RUN-0004 | RUN-0007 | owner |
| RUN-0008 | RUN-0003 | RUN-0003 | contributor |

The model's generality is illustrated by its application across fundamentally different subject areas. In the clinical domain, entities identified as `DYSF-0001` through `DYSF-0004` represent optic nerve dysfunction records, each carrying attributes such as `responsive` (with values like `Focal Response` and `Diffuse Response`), `optic_nerve_dysfunction` (encompassing conditions like `MT-ND6 Strain`, `Secondary Atrophy`, and `Hereditary Degeneration`), and `leber_optic_atrophy` (with values including `Bilateral Atrophy`, `Focal Atrophy`, and `Nutritional Deficit`). In the pipeline management domain, allocations such as `query-opt-run` and `replica-clone-3` are tracked alongside their run identifiers and the roles of the participants who interact with them. In the governance domain, requirements like `Privacy Constraint` and `Encryption Standard` are enriched with typed attributes that capture their effective dates, enforcement status, and priority levels. The same structural primitives—identifiers, attributes, typed values, and role-based relationships—underpin all three domains, enabling a unified approach to data modeling, compliance tracking, and operational governance.

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |