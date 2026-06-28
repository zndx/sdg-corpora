---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_ff42fa
topic_id: 183
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'cgroup_skb_subclass', 'uretprobe_subclass']
model: engine-refine
---

In a governed operational environment, every resource must be uniquely addressable and semantically defined. The foundational unit of tracking is the entity, which is distinguished by a persistent identifier—such as `REST-0001` for a telemetry stream or `URET-0001` for a specific uretprobe configuration. These identifiers anchor the system's metadata, allowing disparate components like `telemetry_stream_alpha` or `ml_model_checkpoint` to be referenced unambiguously across the infrastructure. To enrich these entities, the framework employs an attribute-based model where properties are formally declared. An attribute, such as `checksum`, `created_date`, or `license`, serves as a named slot for metadata, ensuring that every entity carries a standardized set of descriptive characteristics.

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | pthread::create |
| URET-0002 | pthread_create_ret | python::Py_DECREF |
| URET-0003 | qt_delete_ret | pthread::create |
| URET-0004 | ssl_read_ret | libc::malloc |
| URET-0005 | libc_malloc_ret | python::Py_DECREF |
| URET-0006 | pthread_create_ret | python::Py_DECREF |
| URET-0007 | pthread_create_ret | ssl::SSL_read |

**t_uretprobe_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| URET-0001 | checksum | xsd:string |
| URET-0002 | created_date | xsd:date |
| URET-0003 | identifier | cco:DesignativeICE |
| URET-0004 | license | xsd:string |
| URET-0005 | mime_type | xsd:string |
| URET-0006 | size_bytes | xsd:long |
| URET-0007 | uri | xsd:string |
| URET-0008 | version | xsd:integer |

**t_uretprobe_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0002 | 2024-10-13 |
| URET-0002 | URET-0002 | URET-0002 | 2023-10-28 |
| URET-0003 | URET-0003 | URET-0002 | 2024-07-11 |
| URET-0004 | URET-0004 | URET-0002 | 2023-10-14 |
| URET-0005 | URET-0005 | URET-0002 | 2023-07-03 |
| URET-0006 | URET-0006 | URET-0002 | 2023-12-10 |
| URET-0007 | URET-0007 | URET-0002 | 2023-01-22 |

**t_uretprobe_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0006 | 365 |
| URET-0002 | URET-0001 | URET-0008 | 12 |
| URET-0003 | URET-0002 | URET-0006 | 45 |
| URET-0004 | URET-0002 | URET-0008 | 10 |
| URET-0005 | URET-0003 | URET-0006 | 43 |
| URET-0006 | URET-0003 | URET-0008 | 3 |
| URET-0007 | URET-0004 | URET-0006 | 104 |
| URET-0008 | URET-0004 | URET-0008 | 4 |

**t_uretprobe_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0001 | 9d2b7a16 |
| URET-0002 | URET-0001 | URET-0003 | ARN:res/41 |
| URET-0003 | URET-0001 | URET-0004 | CC-BY-4.0 |
| URET-0004 | URET-0001 | URET-0009 | us-east-1 |
| URET-0005 | URET-0001 | URET-0005 | application/octet-stream |
| URET-0006 | URET-0001 | URET-0010 | Name 06 |
| URET-0007 | URET-0001 | URET-0011 | data-engineering |
| URET-0008 | URET-0001 | URET-0012 | Tags 08 |

The integrity of this metadata relies on strict typing and value anchoring. Each attribute is bound to a specific type, such as `xsd:string` for alphanumeric data, `xsd:date` for temporal records, or `cco:DesignativeICE` for designative identifiers. This type system dictates how values are stored and validated within the `misc` value domain. For instance, a `created_date` attribute might hold a temporal value like `2024-10-13`, while a string attribute could store a license identifier like `CC-BY-4.0` or a resource identifier such as `ARN:res/41`. Numerical attributes are similarly constrained, capturing integer values like `365` or `12` to represent quantitative metrics. By separating the attribute definition from its concrete values, the system maintains flexibility while enforcing data consistency across diverse entity types.

Beyond static properties, entities engage in dynamic relationships governed by subject-target-role triples. In these interactions, a `subject` entity acts upon a `target` entity through a defined `role`. For example, a network classification rule identified as `SKB-0001` might act as an `owner` subject attaching to a `target` cgroup `SKB-0005`. The role defines the nature of the interaction, with standard designations including `observer`, `contributor`, `owner`, and `reviewer`. This tripartite structure allows for granular access control and dependency mapping, ensuring that every attachment or binding—such as a `uretprobe` hooking into `pthread::create`—is explicitly authorized and traceable.

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

The framework also supports complex intersections where entities are evaluated against multiple restrictions simultaneously. An entity like `REST-0002` might be evaluated for equivalence between `governance_policy_set` and `ml_model_checkpoint`, while simultaneously being related to `storage_volume` and `backup_volume`. Similarly, operational bindings require precise attachment logic; a `cgroup_skb_subclass` rule does not merely exist in isolation but attaches to specific runtime contexts, such as `system.slice/nginx.service` or `user.slice/user-1001.scope`. These attachments ensure that policies and probes are correctly scoped to their intended execution environments, whether that is a specific user session, a containerized pod, or a system service.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |

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

Ultimately, the cohesion of this governance model depends on the seamless integration of identifiers, attributes, and relational roles. The system leverages unique handles like `9d2b7a16` or `us-east-1` to ground abstract concepts in concrete operational realities. By rigorously defining entities through their attributes, validating values against strict types, and mapping relationships through subject-target-role triples, the framework provides a comprehensive audit trail. This structured approach ensures that every component, from a `centrifuge_tube` assay to a `pressure_transducer` reading, is fully accounted for, properly typed, and correctly positioned within the broader operational hierarchy.