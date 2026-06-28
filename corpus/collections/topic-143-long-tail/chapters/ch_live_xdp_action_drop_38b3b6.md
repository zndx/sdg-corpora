---
chapter_id: ch_live_xdp_action_drop_38b3b6
topic_id: 143
family: 07_long_tail
cited_terms: ['xdp_action_drop', 'ebpfprogram_equiv_typed_with_hook', 'schemaorg_place_longitude']
model: engine-refine
---

In kernel-space packet enforcement, every drop action is anchored by a stable identifier that survives recompilation, redeployment, and audit review across operational cycles. Identifiers such as DROP-0001 through DROP-0004 denote discrete enforcement decisions—quarantine on wlan0_monitor, conntrack_drop on veth1_filter, acl_denied at docker0_hook, threat_block through nfqueue_bridge—each binding a named XDP attachment point to a concrete disposition policy. Because these keys are referenced uniformly across attribute registries, typed value stores, and downstream fact tables, they function as the durable spine of traceability: an auditor who encounters DROP-0003 in a log can resolve it to the same semantic record whether the inquiry concerns program lineage, metadata provenance, or hook placement.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | quarantine |
| DROP-0002 | veth1_filter | conntrack_drop |
| DROP-0003 | docker0_hook | acl_denied |
| DROP-0004 | nfqueue_bridge | threat_block |
| DROP-0005 | eth0_ingress | acl_denied |
| DROP-0006 | wlan0_monitor | threat_block |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

Attribute governance separates what may be said about an entity from how those statements are typed and stored. An attr entry—checksum, created_date, identifier, license—declares a permitted descriptive dimension, while attr_type constrains its legal representation: xsd:string for lexical tokens, xsd:date for temporal stamps, cco:DesignativeICE for designative identifiers that carry ontological weight beyond mere strings. The entity is the object under description (DROP-0001, DROP-0002, and siblings), and misc holds the instantiated value once type resolution has routed the assertion to the correct physical store—2025-02-22 and 2023-10-04 in the date plane, 265 and 394 in the integer plane, 1a4b6c2d and CC-BY-4.0 in the varchar plane. This entity–attribute–value decomposition matters in practice because it permits schema evolution without rewriting historical facts: new attributes enter the attr registry with explicit types, and curators validate submissions against those types before values are admitted, much as compliance officers reject malformed attestations before they enter the authoritative record.

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

eBPF program inventory extends the same identifier discipline into runtime attachment semantics. Program type classifies what a loaded object is—resolved through dimension keys HOOK-0005 through HOOK-0007 into labels and categories such as Program Type Category 03—while attaches to hook specifies where execution is bound in the network stack, mapped via HOOK-0001 and HOOK-0006 to hook labels and Attaches To Hook Category 02. Size_bytes records the on-disk or in-memory footprint of each artifact (784335640 bytes for one program at version 12, 113209263 for another at version 11), a figure that matters for capacity planning, verifier budgets, and change-control thresholds when binaries grow across releases. Category, in both program-type and hook dimensions, supplies the taxonomic layer that lets operators filter inventories by functional family rather than by opaque surrogate keys alone.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

Semantic linkage introduces subject, target, and role as the relational vocabulary for asserting directed associations between independently identified resources. In geospatial attestations over schema.org places—HooverDam, MaunaLoaObservatory, GoldenGateBridge, ISSOrbitModule—longitude values such as −27.9692 and 2.2945 exist as first-class entities (LONG-0001, LONG-0002), while junction records bind a schemaorg_id subject to a longitude_id target under an explicit role: reviewer, contributor, or owner. Role is not decorative metadata; it governs who may amend, who may attest, and who bears custodial responsibility for the association, so that a subject LONG-0003 linked to target LONG-0001 as owner is interpretable differently from the same subject paired with LONG-0003 under contributor. Curators maintaining such graphs work continuously to preserve referential integrity across these edges, ensuring that every subject–target pair remains resolvable to its identifier endpoints and that role assignments align with governance policy.

**t_schemaorg_place_longitude**

| id | schemaorg |
| --- | --- |
| LONG-0001 | HooverDam |
| LONG-0002 | MaunaLoaObservatory |
| LONG-0003 | GoldenGateBridge |
| LONG-0004 | ISSOrbitModule |
| LONG-0005 | CERNControlCenter |
| LONG-0006 | PaloAltoResearchCenter |
| LONG-0007 | BlackRockForest |

**t_schemaorg_place_longitude_longitude**

| id | longitude |
| --- | --- |
| LONG-0001 | -27.9692 |
| LONG-0002 | 2.2945 |
| LONG-0003 | -3.3869 |
| LONG-0004 | 2.2945 |
| LONG-0005 | -27.0366 |
| LONG-0006 | -27.0366 |

**t_schemaorg_place_longitude__longitude**

| id | schemaorg_id | longitude_id | role |
| --- | --- | --- | --- |
| LONG-0001 | LONG-0005 | LONG-0002 | reviewer |
| LONG-0002 | LONG-0007 | LONG-0004 | contributor |
| LONG-0003 | LONG-0003 | LONG-0001 | owner |
| LONG-0004 | LONG-0003 | LONG-0003 | owner |
| LONG-0005 | LONG-0002 | LONG-0003 | reviewer |
| LONG-0006 | LONG-0001 | LONG-0003 | contributor |
| LONG-0007 | LONG-0004 | LONG-0002 | reviewer |
| LONG-0008 | LONG-0007 | LONG-0006 | contributor |

Taken together, these constructs form an interlocking compliance surface: identifiers name enforceable objects and programs; attr and attr_type govern what may be recorded about them; entity and misc instantiate those records in type-safe stores; program type, attaches to hook, category, and size_bytes characterize deployed kernel artifacts; and subject, target, and role articulate provenance and authority in linked assertions. Operational teams that treat each dimension as a first-class governance object—rather than as incidental columns in a flat export—gain auditable chains from packet-drop policy through program attachment to metadata lineage and, where applicable, to geospatial or licensing attestations such as urn:uuid:9f2a or us-east-1, without conflating the enforcement event with the descriptive facts that surround it.

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |