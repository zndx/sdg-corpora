---
chapter_id: ch_live_schemaorg_review_target_3b59d0
topic_id: 67
family: 07_long_tail
cited_terms: ['schemaorg_review_target', 'existential_with_part_of', 'labrun_uses_instrument']
model: engine-refine
---

The foundational architecture of the system rests upon a disciplined separation of entity, attribute, and value, where each observable property is declared once and instantiated many times. Attribute definitions—such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`—are catalogued with their corresponding data types (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`), establishing a schema that constrains the shape of all downstream data. This declarative layer is then populated through a value store that distributes heterogeneous data into type-specific tables: decimal values such as `397.40`, `2693.73`, `4636.55`, and `1173.52` reside in one store; integer values like `889`, `321`, `608`, and `248` in another; datetime stamps including `2023-07-28T22:24:46`, `2024-09-04T14:41:30`, and `2025-06-09T20:56:36` in a third; and free-form strings such as `ingest-21`, `Log Level 02`, `execution`, and `superseded` in a fourth. The `entity_id` column binds each value to its originating entity—`INST-0001`, `INST-0002`—while the `attr_id` column resolves the attribute to which the value belongs, ensuring that every datum is traceable to both its source and its semantic definition.

Entities themselves are identified by opaque, versioned identifiers that serve as the primary key across all relational contexts. A target such as `TARG-0001` may be classified as a `SoftwareApplication` in the Schema.org taxonomy, while `TARG-0002` maps to `Person`, and `TARG-0003` and `TARG-0004` both resolve to `Service`. These targets are not isolated; they participate in structured relationships with review items—`GraphQLEndpoint`, `AzureBlobStorage`, `PostgreSQLTable`—through a junction table that encodes not merely the association but the nature of the association itself. The `role` column distinguishes between `owner` and `contributor` relationships, so that `TARG-0003` acts as the `owner` of `TARG-0003` (a self-referential ownership), while `TARG-0004` assumes a `contributor` role to `TARG-0003`, and `TARG-0005` serves as `owner` of `TARG-0001`. This role-bearing linkage transforms a simple many-to-many mapping into a semantically rich graph where the direction and character of each edge are explicit.

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

The same identification and relationship patterns recur across domains. In the existential hierarchy, components such as `regional_telemetry_gateway`, `alpha_compute_cluster`, `alpha_query_engine`, and `primary_stream_processor` are each assigned a `part_of` relationship to higher-order systems—`geo_redundant_backup`, `audit_logging_system`, and `realtime_analytics_platform`—creating a containment structure that mirrors organizational or architectural decomposition. Here, the `id` column (`PART-0001` through `PART-0004`) serves as the relationship key, while the `existential` and `part_of` columns capture the child and parent entities respectively. This pattern of explicit relationship tables, rather than implicit foreign keys, allows the system to attach additional metadata—such as role or cardinality—to edges without denormalizing the entity tables themselves.

Lab runs provide a concrete instantiation of these abstractions. A run identified as `RUN-2024-A7` uses instrument `TARG-0002`; `PROT-XRAY-03` and `CYTO-20241022` both reference `TARG-0001`; and `GENOME-READ-04` references `TARG-0003`. The `uses` column in the lab-run-to-instrument mapping establishes a subject-target relationship where the lab run is the active agent and the instrument is the passive resource. Each instrument, in turn, carries its own set of attributes—duration, timestamps, exit codes, hostnames—populated from the value tables described above. The entity `INST-0001`, for instance, has a `duration_seconds` value of `397.40`, an `end_time` of `2023-07-28T22:24:46`, an `exit_code` of `889`, and a `host_name` of `ingest-21`, all linked through their respective `attr_id` columns to the attribute definitions. This design permits an instrument to carry an arbitrary set of typed properties without requiring schema changes, while maintaining full referential integrity between values, attributes, and entities.

**t_labrun_uses_instrument**

| id | labrun | uses |
| --- | --- | --- |
| INST-0001 | RUN-2024-A7 | TARG-0002 |
| INST-0002 | PROT-XRAY-03 | TARG-0001 |
| INST-0003 | CYTO-20241022 | TARG-0001 |
| INST-0004 | GENOME-READ-04 | TARG-0003 |
| INST-0005 | FIELD-MAP-09 | TARG-0004 |
| INST-0006 | ASSAY-Q3-24 | TARG-0001 |

**t_labrun_uses_instrument_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INST-0001 | duration_seconds | xsd:decimal |
| INST-0002 | end_time | xsd:dateTime |
| INST-0003 | exit_code | xsd:integer |
| INST-0004 | host_name | xsd:string |
| INST-0005 | log_level | xsd:string |
| INST-0006 | phase | xsd:string |
| INST-0007 | retry_count | xsd:integer |
| INST-0008 | scheduled_at | xsd:dateTime |

**t_labrun_uses_instrument_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0002 | 2023-07-28T22:24:46 |
| INST-0002 | INST-0001 | INST-0008 | 2024-09-04T14:41:30 |
| INST-0003 | INST-0001 | INST-0009 | 2025-06-09T20:56:36 |
| INST-0004 | INST-0002 | INST-0002 | 2024-06-06T14:47:39 |
| INST-0005 | INST-0002 | INST-0008 | 2025-04-06T19:57:44 |
| INST-0006 | INST-0002 | INST-0009 | 2023-06-18T12:50:38 |
| INST-0007 | INST-0003 | INST-0002 | 2023-05-25T22:41:33 |
| INST-0008 | INST-0003 | INST-0008 | 2023-09-07T05:37:31 |

**t_labrun_uses_instrument_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0001 | 397.40 |
| INST-0002 | INST-0002 | INST-0001 | 2693.73 |
| INST-0003 | INST-0003 | INST-0001 | 4636.55 |
| INST-0004 | INST-0004 | INST-0001 | 1173.52 |
| INST-0005 | INST-0005 | INST-0001 | 1814.21 |
| INST-0006 | INST-0006 | INST-0001 | 5265.62 |

**t_labrun_uses_instrument_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0003 | 889 |
| INST-0002 | INST-0001 | INST-0007 | 321 |
| INST-0003 | INST-0002 | INST-0003 | 608 |
| INST-0004 | INST-0002 | INST-0007 | 248 |
| INST-0005 | INST-0003 | INST-0003 | 589 |
| INST-0006 | INST-0003 | INST-0007 | 121 |
| INST-0007 | INST-0004 | INST-0003 | 16 |
| INST-0008 | INST-0004 | INST-0007 | 442 |

**t_labrun_uses_instrument_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0004 | ingest-21 |
| INST-0002 | INST-0001 | INST-0005 | Log Level 02 |
| INST-0003 | INST-0001 | INST-0006 | execution |
| INST-0004 | INST-0001 | INST-0010 | superseded |
| INST-0005 | INST-0001 | INST-0011 | Triggered By 05 |
| INST-0006 | INST-0002 | INST-0004 | worker-07 |
| INST-0007 | INST-0002 | INST-0005 | Log Level 07 |
| INST-0008 | INST-0002 | INST-0006 | review |