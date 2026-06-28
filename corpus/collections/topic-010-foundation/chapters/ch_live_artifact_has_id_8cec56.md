---
chapter_id: ch_live_artifact_has_id_8cec56
topic_id: 10
family: 01_foundation
cited_terms: ['artifact_has_id', 'allocation_with_run_status', 'kernelhook_basic']
model: engine-refine
---

ATTRIBUTES, THEIR TYPES, AND THE ENTITIES THEY DESCRIBE form the foundational layer of any structured metadata regime. An attribute is a named property of an entity, and its type constrains the domain of permissible values. In the kernel hook registry, attributes such as `checksum`, `created_date`, `identifier`, and `license` are declared with distinct type annotations: `xsd:string` for free-form text, `xsd:date` for temporal values, and `cco:DesignativeICE` for internationalized component identifiers. This type discipline ensures that the value layer—partitioned across date, integer, and variable-character tables—can be validated at ingestion. A `created_date` attribute on entity `KERN-0001` yields the value `2023-02-05`; the same attribute on `KERN-0002` yields `2024-05-21`. Integer attributes, such as those stored in the integer value table, carry values like `323` and `12` for entity `KERN-0001`, while string attributes hold values ranging from the hash-like `a3f9c21e` to the URN `gid://svc/77` and the license designation `Apache-2.0`. The separation of value types into dedicated tables is not merely a normalization convenience; it enforces schema-level type safety and permits indexed queries on the appropriate value domain without cross-type coercion.

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |

IDENTIFIERS serve as the stable, globally unique keys that bind entities to their attributes, to one another, and to external naming authorities. The identifier table `t_artifact_has_id` demonstrates this binding in practice: the artifact `MetricsDump88A` is associated with the identifier `oid:1.3.6.1` at version `3`, while `DroneFleet7C` shares the same OID but diverges at version `4`, indicating a distinct revision of the same logical object. Other artifacts resolve to different identifier namespaces—`ConfigManifest99` maps to `doi:10.1109/x`, and `DataPipelineV3` to `ARN:res/41`—each namespace carrying its own resolution semantics. The `identifier` attribute itself, typed as `cco:DesignativeICE`, is one of the properties that can be assigned to an entity, creating a recursive layer in which an entity's identity is itself an attribute of that entity. This recursive structure is essential for systems that must track provenance across heterogeneous identifier registries.

**t_artifact_has_id**

| id | artifact | identifier | version |
| --- | --- | --- | --- |
| HAS-0001 | MetricsDump88A | oid:1.3.6.1 | 3 |
| HAS-0002 | DroneFleet7C | oid:1.3.6.1 | 4 |
| HAS-0003 | ConfigManifest99 | doi:10.1109/x | 9 |
| HAS-0004 | DataPipelineV3 | ARN:res/41 | 6 |
| HAS-0005 | DataPipelineV3 | ref-8842 | 11 |
| HAS-0006 | DroneFleet7C | oid:1.3.6.1 | 5 |

VERSIONS capture the temporal dimension of entity evolution. Each artifact in `t_artifact_has_id` carries a version number—`3`, `4`, `9`, `6`—that distinguishes one instantiation of the artifact from another under the same identifier. Versioning is orthogonal to the attribute-value model: an entity may acquire new attributes, shed old ones, or see existing attribute values change, and each such change is reflected in a new version record. The version column thus functions as a logical timestamp, enabling reconstruction of an entity's state at any point in its lifecycle without requiring a full history table. In operational contexts, version numbers are the primary mechanism by which deployment pipelines, audit systems, and rollback procedures reference a specific artifact state.

RELATIONSHIPS BETWEEN ENTITIES are mediated by roles, which assign semantic meaning to subject–target pairs. The junction table `t_allocation_with_run_status__run_status` exemplifies this pattern: each row links an allocation (the subject) to a run status (the target) and assigns a role—`reviewer`, `observer`, or `contributor`—that describes the nature of the association. For instance, allocation `STAT-0001` is linked to run status `STAT-0006` with the role `reviewer`, while the same allocation is linked to run status `STAT-0005` with the role `contributor`. The same target status `STAT-0002` appears as the target of allocation `STAT-0004` under the role `contributor`. Roles are not inherent to the entities themselves; they are properties of the relationship, and this separation allows a single entity to participate in multiple relationships with different semantic meanings. The allocation registry itself—containing entries such as `kafka-consumer-group`, `vault-secret-rotate`, and `gpu-cluster-alpha`—is independent of the status values (`timeout-expired`, `disconnected-drift`, `succeeded-final`) to which allocations are bound, and the many-to-many relationship between them is captured entirely by the role-annotated junction table.

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |

ENTITY, ATTRIBUTE, VALUE, IDENTIFIER, VERSION, ROLE, SUBJECT, and TARGET together constitute a minimal but complete metadata calculus. An entity is any discrete resource—be it a kernel hook such as `Tracepoint-block-io` or `BPF-co-re-syscall`, an allocation such as `kafka-consumer-group`, or an artifact such as `MetricsDump88A`. Attributes describe the entity's properties, typed to constrain value domains. Values are stored in type-specific tables, ensuring that `xsd:date` values like `2025-01-30` never collide with `xsd:string` values like `eu-west-3`. Identifiers bind entities to external naming schemes and to their own attribute declarations. Versions track the evolution of artifact–identifier bindings over time. Roles annotate the relationships between subjects and targets, enabling rich, semantically aware graph structures without sacrificing the relational model's integrity guarantees. This calculus is not novel; it is the structural core of RDF, of property graphs, and of virtually every system that must represent complex, evolving metadata in a queryable form.