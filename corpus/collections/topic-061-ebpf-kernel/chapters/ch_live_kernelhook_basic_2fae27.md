---
chapter_id: ch_live_kernelhook_basic_2fae27
topic_id: 61
family: 04_ebpf_kernel
cited_terms: ['kernelhook_basic', 'existential_with_part_of', 'schemaorg_creativework_author']
model: engine-refine
---

In governed technical catalogs, an identifier is the durable handle by which a record remains recognizable across ingestion, audit, and reconciliation cycles. Designative identifiers such as KERN-0001 and AUTH-0003 are not incidental labels; they function as primary keys that bind a kernel-hook definition, a creative-work authorship record, or a compositional membership assertion to a single canonical row. Where an attribute is itself typed as cco:DesignativeICE, the identifier becomes both a structural key and a semantically classified datum—checksum hashes like a3f9c21e and 7b14de08, global identifiers such as gid://svc/77, and license strings Apache-2.0 and GPL-3.0 all attach to entity KERN-0001 or AUTH-0001 through attr_id KERN-0001 or AUTH-0001, demonstrating that the same conceptual slot can carry qualitatively different identifier payloads while preserving referential discipline. Operational practice therefore treats identifier governance as a first-order control: without stable, typed designation, downstream validation tables cannot reliably join facts to the entities they describe.

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

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | WorkflowEngineer |
| AUTH-0002 | Provenance_Trace_Report | APIMaintainer |
| AUTH-0003 | API_Reference_Guide | SensorArchitect |
| AUTH-0004 | Provenance_Trace_Report | ModelReviewer |
| AUTH-0005 | Sensor_Network_Spec | ModelReviewer |
| AUTH-0006 | Catalog_Metadata_Index | ModelReviewer |
| AUTH-0007 | Telemetry_Config_Spec | CatalogAdmin |
| AUTH-0008 | Catalog_Metadata_Index | CatalogAdmin |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

An entity is the object of description—the kernel hook, the authored work, the infrastructural component—whose existence is asserted independently of the particular facts recorded about it. KERN-0002 names BPF-co-re-syscall as a hooking mechanism; AUTH-0002 associates Provenance_Trace_Report with author APIMaintainer; PART-0002 situates alpha_compute_cluster within geo_redundant_backup. In the attribute-value layer, entity_id repeats this commitment at the fact level: created_date values for KERN-0002 through KERN-0004 (2024-05-21, 2024-01-08, 2025-01-30) all reference entity_id KERN-0002, KERN-0003, and KERN-0004 respectively while sharing attr_id KERN-0002, proving that one attribute definition applies uniformly across heterogeneous entities. Integer facts exhibit the same pattern—KERN-0001 carries 323 and 12 under attr_id KERN-0006 and KERN-0008, while KERN-0002 carries 186 and 2 under the same attribute pair—so entity scoping is what differentiates otherwise identically shaped measurements. Entity integrity matters because compliance queries are almost always entity-centric: one asks not merely what dates exist, but which hook or which report bore them.

Attributes name the dimensions along which entities may be characterized, and attr_type declares the interpretive contract each dimension carries. The recurring quartet checksum, created_date, identifier, and license—registered alike for kernel hooks and Schema.org creative-work author records—shows that attribute catalogs are reusable vocabularies rather than ad hoc column sets. attr_type assignments make that vocabulary machine-actionable: xsd:string governs free-text or lexical values including license terms and regional deployment markers such as eu-west-3 and on-prem-dc1; xsd:date routes temporal assertions into date-typed value stores; cco:DesignativeICE signals that the attribute slot is reserved for identity-bearing tokens rather than descriptive prose. Because attr_id KERN-0002 consistently denotes created_date and attr_id KERN-0004 denotes license across the KERN namespace—and AUTH-0002 and AUTH-0004 play the parallel roles in the AUTH namespace—implementers can enforce type-appropriate validation before any misc value is accepted. Attribute typing is thus the bridge between semantic intent and physical storage: it determines which value relation may legally hold a proposed fact and which constraints apply at write time.

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

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

The misc designation marks the instantiated value itself—the miscellaneous fact that completes the entity–attribute pairing. Despite the neutral label, misc is not semantically void; it is the evidence payload whose meaning is entirely determined by the attr and attr_type context in which it appears. A misc of 2023-02-05 attached to entity KERN-0001 under attr_id KERN-0002 is a creation timestamp; the same column holding 323 under attr_id KERN-0006 on the same entity is an integer metric; holding a3f9c21e under attr_id KERN-0001 it is a checksum identifier. Partitioning misc across typed relations—val_date, val_int, val_varchar—implements a disciplined form of entity–attribute–value modeling without sacrificing query predictability: dates never compete with integers for storage semantics, and lexical values such as Apache-2.0, GPL-3.0, and gid://svc/77 remain in varchar stores where string operations and pattern matching are appropriate. This separation is operationally significant when catalogs scale: validators can reject category errors early, and auditors can trace each misc value back through attr_id to a named, typed attribute and through entity_id to a specific governed object.

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

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

Taken together, identifier, entity, attr, attr_type, and misc form a layered evidentiary grammar. Identifiers anchor rows; entities name what exists; attributes declare what may be said; attr_types specify how it may be said; misc records what was in fact said. Cross-domain regularity reinforces the model: kernel-hook and creative-work subgraphs share attribute nomenclature and typing conventions even though their existential records describe different universes—Tracepoint-block-io versus API_Reference_Guide, regional_telemetry_gateway part_of geo_redundant_backup versus WorkflowEngineer authoring a guide. That parallelism is not cosmetic; it enables unified governance policies over checksum integrity, license compliance, and provenance dating regardless of whether the underlying entity is instrumentation code or published documentation. Mature practice therefore maintains attribute registries as controlled artifacts, treats attr_type as a non-negotiable enforcement surface, and logs misc writes as attributable statements whose validity is always evaluated in the joint context of entity identity and attribute semantics—precisely the joint context that identifiers such as KERN-0004 and AUTH-0004 are designed to preserve when a Fentry-kernel-init hook or a ModelReviewer-authored Provenance_Trace_Report must be shown, years later, to have carried license eu-west-3 or deployment posture on-prem-dc1 at a known created_date.