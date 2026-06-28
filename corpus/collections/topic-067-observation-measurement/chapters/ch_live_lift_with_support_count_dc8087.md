---
chapter_id: ch_live_lift_with_support_count_dc8087
topic_id: 67
family: 02_observation_measurement
cited_terms: ['lift_with_support_count', 'existential_with_has_part', 'labrun_min_one_sample']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers constitute the foundational vocabulary of any governed data architecture, and their proper structuring determines whether an information system can support auditability, type safety, and referential integrity across heterogeneous sources. An entity is any distinct object of interest—whether a computational pipeline, a laboratory experiment, or a metadata catalog—and it is distinguished from all other entities by a stable identifier. Identifiers such as COUN-0001 through COUN-0004 or SAMP-0001 through SAMP-0004 are not arbitrary labels; they are the immutable keys that anchor every attribute assignment and every value row to a single, traceable entity. The prefix convention itself encodes provenance: COUN- prefixed identifiers belong to the lift-and-support-count domain, where entities describe phenomena such as signal amplification lift, data pipeline lift, and sensor drift lift, each accompanied by a support count that ranges from 2048 to 32768. SAMP- prefixed identifiers, by contrast, belong to the laboratory-run domain, where entities such as SEQ-EXP-99, PROTOCOL-V3, and CEL-SEQR-112 represent experimental runs whose input samples include RNA-POOL-22, CELL-LINE-Hela, BLOOD-DRAW-A1, and REACTANT-SOL-4.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

The attribute concept bridges the gap between an entity's identity and the properties that describe it. An attribute is a named dimension of observation or configuration—confidence, dimension_kind, method, recorded_at in the lift domain; duration_seconds, end_time, exit_code, host_name in the lab-run domain—and each attribute is declared once in a metadata registry that binds the attribute name to an XSD type. The type declaration is not cosmetic: it enforces that the value assigned to a given attribute conforms to a single serialization format. An attribute typed as xsd:decimal, such as confidence or duration_seconds, receives its value from a dedicated decimal value table; an attribute typed as xsd:dateTime, such as recorded_at or end_time, receives its value from a datetime value table; an attribute typed as xsd:string, such as dimension_kind or host_name, receives its value from a varchar value table; and an attribute typed as xsd:integer, such as exit_code, receives its value from an integer value table. This type-dispatched storage pattern ensures that a value of 0.849 or 945.35 never collides with a timestamp like 2024-12-28T07:07:56 or a string like Dimension Kind 01, and it allows downstream consumers to parse, validate, and index each column according to its semantic contract.

The value tables themselves implement an entity-attribute-value decomposition that separates the what from the how. Each value row carries four fields: a surrogate identifier for the row itself, an entity_id that points back to the entity being described, an attr_id that points to the attribute definition, and a value column whose content is constrained by the attribute's declared type. In the lift domain, entity COUN-0001 carries a confidence value of 0.849 and a decimal measurement of 945.35, while entity COUN-0002 carries a confidence value of 0.258; the recorded_at attribute, typed as xsd:dateTime, is populated for all four lift entities with timestamps spanning from 2023-06-25T23:08:52 to 2024-12-28T07:07:56. In the lab-run domain, entity SAMP-0001 carries a duration of 2021.10 seconds, an exit code of 230, a host name of edge-03, and an end time of 2024-08-01T16:02:07, while entity SAMP-0002 carries a duration of 4946.17 seconds, an exit code of 670, and a host name of Log Level 02. The varchar value table also stores categorical annotations such as Encoding 02, nightly summary, and es, as well as status indicators like closeout and complete, all attached to the same set of lab-run entities through the same attr_id linkage.

Beyond attributes and values, the data model supports structural relationships that express composition and participation. The existential-with-has-part table encodes part-whole relationships between named components: BatchIngestionPipeline contains a FirewallRule, GlobalMetadataCatalog contains a StorageVolume, AuditLogArchive contains a WorkerProcess, and CoreControlSubsystem contains a TemperatureProbe. These relationships are distinct from attribute assignments because they describe the topology of the system rather than the properties of its parts. An entity can simultaneously possess attributes (a confidence score, a recorded_at timestamp, a host name) and participate in structural relationships (as a whole containing parts, or as a sample consumed by a lab run), and the separation of these concerns into distinct tables prevents the combinatorial explosion that would arise from conflating property values with structural links.

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FirewallRule |
| PART-0002 | GlobalMetadataCatalog | StorageVolume |
| PART-0003 | AuditLogArchive | WorkerProcess |
| PART-0004 | CoreControlSubsystem | TemperatureProbe |
| PART-0005 | ComputeNodePool | BackupSnapshot |
| PART-0006 | GlobalMetadataCatalog | ChecksumAlgorithm |

The practical consequence of this architecture is that every observable fact about every entity is independently addressable, type-checked, and traceable to its source definition. A query that asks for all decimal-valued attributes of entities whose support count exceeds 16384 can join the entity table to the decimal value table through the attr_id, filter on the support_count column, and return values such as 331.44 or 945.35 without ambiguity. A query that asks for the host names and exit codes of lab runs whose duration exceeds 4000 seconds can join the lab-run entity table to both the varchar and integer value tables through their respective attr_ids, filter on the decimal value table, and return combinations such as edge-03 with exit code 230 or Log Level 02 with exit code 670. The identifier columns—whether they appear as primary keys in the entity tables, as foreign keys in the value tables, or as join targets in the relationship tables—form a single coherent addressing scheme that makes it possible to reconstruct the complete state of any entity, or any subset of its attributes, at any point in time.

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |