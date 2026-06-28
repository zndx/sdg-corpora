---
chapter_id: ch_live_cgroup_skb_subclass_7e724b
topic_id: 25
family: 07_long_tail
cited_terms: ['cgroup_skb_subclass', 'requirement_only_satisfied_by', 'frame_coarsening']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured knowledge graph, providing stable references that survive the evolution of the entities they denote. Within the cgroup subsystem, SKB-0001 through SKB-0004 uniquely identify subclass definitions whose operational context is captured by cgroup descriptors such as `user.slice/user-1001.scope` and `system.slice/postgresql.service`. Similarly, SATI-0001 through SATI-0004 enumerate compliance requirements—ranging from the OWASP authentication flow to TLS 1.3 cipher suite specifications—while COAR-0001 through COAR-0004 designate frame coarsening operations whose semantic scope is expressed through frame labels like "temporal observation scope" and "processing pipeline tier." These identifiers are not merely labels; they are the stable keys that permit cross-referencing across heterogeneous relationship tables, ensuring that an entity referenced as SKB-0001 in one context resolves to the same entity when it appears as a subject or target in a relationship table.

**t_cgroup_skb_subclass**

| id | cgroup |
| --- | --- |
| SKB-0001 | user.slice/user-1001.scope |
| SKB-0002 | user.slice/user-1000.scope |
| SKB-0003 | system.slice/postgresql.service |
| SKB-0004 | kubepods/pod1234567890ab |
| SKB-0005 | docker/4a2b3c1d5e6f |
| SKB-0006 | system.slice/nginx.service |

**t_cgroup_skb_subclass_attaches_to_cgroup**

| id | attaches_to_cgroup |
| --- | --- |
| SKB-0001 | system.slice/nginx.service |
| SKB-0002 | user.slice/user-1001.scope |
| SKB-0003 | user.slice/user-1001.scope |
| SKB-0004 | docker/7d8e9f0a1b2c |
| SKB-0005 | system.slice/docker.service |
| SKB-0006 | kubepods/burstable/pod8f9a0b1c |

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | temporal observation scope | SATI-0004 |
| COAR-0002 | raw sensor tick | SATI-0006 |
| COAR-0003 | raw sensor tick | SATI-0003 |
| COAR-0004 | processing pipeline tier | SATI-0005 |
| COAR-0005 | metadata catalog level | SATI-0006 |
| COAR-0006 | hourly sensor grid | SATI-0004 |

Relationships between entities are mediated through a consistent subject–target–role triad that captures not only connectivity but the nature of the connection itself. In the cgroup attachment model, a subclass identified by SKB-0001 may attach to a cgroup under the role of "observer," while SKB-0003 assumes the role of "owner" when attaching to a different cgroup, and SKB-0006 takes on the role of "reviewer" in its attachment to SKB-0005. The same structural pattern governs requirement satisfaction: SATI-0001 is satisfied by SATI-0004 under the role of "reviewer," and SATI-0003 is satisfied by SATI-0002 under the role of "observer." This uniformity of relationship representation—where subject and target are foreign keys pointing to entity identifiers, and role is a categorical descriptor of the relationship's semantic character—enables generic query patterns and consistent policy evaluation across domains as disparate as container lifecycle management and cryptographic compliance.

**t_cgroup_skb_subclass__attaches_to_cgroup**

| id | cgroup_id | attaches_to_cgroup_id | role |
| --- | --- | --- | --- |
| SKB-0001 | SKB-0005 | SKB-0001 | observer |
| SKB-0002 | SKB-0006 | SKB-0002 | contributor |
| SKB-0003 | SKB-0001 | SKB-0005 | owner |
| SKB-0004 | SKB-0006 | SKB-0005 | reviewer |
| SKB-0005 | SKB-0002 | SKB-0004 | owner |
| SKB-0006 | SKB-0003 | SKB-0005 | owner |
| SKB-0007 | SKB-0001 | SKB-0001 | reviewer |
| SKB-0008 | SKB-0003 | SKB-0003 | observer |

**t_requirement_only_satisfied_by**

| id | requirement |
| --- | --- |
| SATI-0001 | OWASP authentication flow |
| SATI-0002 | IEEE 802.1Q tagging |
| SATI-0003 | IEEE 802.1Q tagging |
| SATI-0004 | TLS 1.3 cipher suite |
| SATI-0005 | NIST 800-53 audit logging |
| SATI-0006 | GDPR data residency |

**t_requirement_only_satisfied_by_satisfied_by**

| id | satisfied_by |
| --- | --- |
| SATI-0001 | Let's Encrypt |
| SATI-0002 | OpenSSL 3.0 |
| SATI-0003 | FIPS 140-3 module |
| SATI-0004 | Zstd library |
| SATI-0005 | AWS KMS |
| SATI-0006 | AWS KMS |
| SATI-0007 | Zstd library |

**t_requirement_only_satisfied_by__satisfied_by**

| id | requirement_id | satisfied_by_id | role |
| --- | --- | --- | --- |
| SATI-0001 | SATI-0001 | SATI-0004 | reviewer |
| SATI-0002 | SATI-0003 | SATI-0005 | observer |
| SATI-0003 | SATI-0002 | SATI-0002 | reviewer |
| SATI-0004 | SATI-0003 | SATI-0003 | reviewer |
| SATI-0005 | SATI-0006 | SATI-0002 | observer |
| SATI-0006 | SATI-0001 | SATI-0003 | contributor |
| SATI-0007 | SATI-0003 | SATI-0004 | observer |
| SATI-0008 | SATI-0005 | SATI-0001 | owner |

Attributes provide the dimensional richness that transforms entities from abstract nodes into observable, measurable objects. The attribute schema is itself a first-class entity: `t_frame_coarsening_attr` defines attributes by name and type, where `confidence` is typed as `xsd:decimal`, `dimension_kind` as `xsd:string`, `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. This type discipline is enforced at the value storage layer through type-specialized value tables. Decimal-valued attributes such as `confidence` are persisted in `t_frame_coarsening_val_decimal` with values like 0.517 and 121.11; datetime-valued attributes like `recorded_at` are stored in `t_frame_coarsening_val_datetime` with ISO 8601 timestamps such as 2025-04-27T07:32:48 and 2023-03-09T02:04:03; and string-valued attributes are stored in `t_frame_coarsening_val_varchar` with values including "Dimension Kind 01," "Encoding 02," and "en." Each value row carries an entity_id that binds it to a specific entity instance and an attr_id that binds it to a specific attribute definition, forming a sparse but type-safe key-value store.

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |

The practical consequence of this architecture is that entities can carry heterogeneous attribute sets without schema rigidity. A single entity identified by COAR-0001 may simultaneously possess a decimal confidence of 0.517, a string dimension_kind of "Dimension Kind 01," a datetime recorded_at of 2025-04-27T07:32:48, and a string encoding of "en," each stored in its respective value table and retrievable through a unified entity_id lookup. This design supports the kind of granular provenance tracking required in compliance frameworks, where an entity's state must be auditable across multiple attribute dimensions—numeric precision for quantitative assessments, temporal stamps for chain-of-custody, and categorical strings for classification. The separation of attribute definition from attribute value, and the further separation of values by type, ensures that schema evolution can proceed independently of data migration: new attributes can be declared in the attribute table without altering the value storage layer, and type-specific value tables can be extended without affecting existing data.