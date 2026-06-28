---
chapter_id: ch_live_xdp_action_drop_614c88
topic_id: 61
family: 07_long_tail
cited_terms: ['xdp_action_drop', 'two_disjoint_artifacts', 'policy_with_review_cycle']
model: engine-refine
---

In governed operational environments, every enforceable object must be addressable without ambiguity, and the identifier fulfills that obligation as the durable key that survives renaming, redeployment, and cross-system reconciliation. A packet-drop action bound to `wlan0_monitor` carries `DROP-0001`; an artifact implicated in review workflows carries `ARTI-0001`; a policy subject to periodic attestation carries `CYCL-0003`. These designators are not decorative labels: they are the join surface across configuration, evidence, and control catalogs. When an XDP drop rule on `docker0_hook` must be traced to its governing review cycle, resolution proceeds through `DROP-0003` into `CYCL-0006`, not through interface names that operations teams may change overnight. The same discipline applies where two artifact families remain logically disjoint—`etl-job` paired with `data-lake` under `ARTI-0001` versus `config-bundle` paired with `traffic-router` under `ARTI-0002`—yet still participate in a single compliance graph because their identifiers interoperate with foreign references such as `ARTI-0002` appearing on a FedRAMP review cycle or `ARTI-0004` anchoring a CCPA control.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | CYCL-0004 |
| DROP-0002 | veth1_filter | CYCL-0008 |
| DROP-0003 | docker0_hook | CYCL-0006 |
| DROP-0004 | nfqueue_bridge | CYCL-0003 |
| DROP-0005 | eth0_ingress | CYCL-0007 |
| DROP-0006 | wlan0_monitor | CYCL-0002 |

The entity is the thing being described—the drop action, the artifact, the policy cycle—not the row that happens to store a single fact about it. In practice, entity identity is established once and then referenced repeatedly as attributes accrue. `DROP-0001` receives a checksum, a creation date, a designative identifier, and a license term; `ARTI-0001` receives the same attribute vocabulary even though the underlying artifact is an ETL job rather than a kernel hook. That separation matters because governance questions are almost always entity-centric—“what is the license on this object?”, “when was it created?”, “what checksum attests its integrity?”—while the storage layer must remain flexible enough to add attributes without schema migrations that would invalidate historical audits. Entity identifiers therefore function as the stable spine: `entity_id` in value stores always points back to the governed object, whether the stored fact is `2025-02-22` for `DROP-0002` or `9d2b7a16` for `ARTI-0001`.

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

Attributes name the facets along which entities are measured, classified, and provenanced, and attr_type declares the semantic contract each facet must honor before any value may be admitted. The recurring quartet—checksum, created_date, identifier, license—signals a deliberate metadata profile shared across artifact classes that otherwise share little operational DNA. Typing is not cosmetic: `xsd:date` constrains creation stamps such as `2023-10-04` and `2024-02-28` to calendar semantics suitable for retention schedules; `xsd:string` accommodates opaque digests like `1a4b6c2d` and license tokens like `CC-BY-4.0` or `MPL-2.0`; `cco:DesignativeICE` elevates identifier values such as `urn:uuid:9f2a` into formally designative references rather than free text. When attr_type is enforced at ingress, miscellany in the value layer cannot silently corrupt the catalog—an integer table holds counts and thresholds (`265`, `394`, `7`), a date table holds temporal evidence, and a varchar table holds lexical or URI-shaped misc—because each attr_id routes facts to the storage class its type demands.

The misc dimension—materialized as typed value payloads—is where abstract governance metadata becomes auditable fact. A checksum misc of `1a4b6c2d` on `DROP-0001` is a reproducibility anchor; a license misc of `CC-BY-4.0` on the same entity answers redistribution questions without opening the binary; a scope misc of `us-east-1` or `ap-south-2` ties the object to deployment geography even when the parent entity table names only functional roles. Integer misc values such as `36` and `462` typically encode cardinalities, severities, or version ordinals whose meaning is recoverable only in combination with their attr_id, which is precisely why entity and attr must resolve together. Date misc spanning `2023-05-09` through `2025-04-21` supplies the temporal spine auditors expect when proving that controls were reviewed while artifacts were current. Because multiple value rows may reference the same entity across different attr_ids—`DROP-0001` simultaneously carrying varchar, int, and date facts—the misc layer is intentionally normalized by type so validators, exporters, and policy engines can apply the correct lexical, numeric, or chronological rules at read time.

Scope and language extend the model from intrinsic object metadata into jurisdictional and communicative context, which is where compliance handbooks diverge from mere inventories. Scope values such as `local`, `team`, and `regional` delimit where a policy obligation applies independent of the policy’s technical identifier: CCPA under `CYCL-0003` is `regional`, FedRAMP under `CYCL-0001` is `local`, and SOC 2 Type II under `CYCL-0004` is likewise `regional`, signaling that identical control families may propagate differently across organizational boundaries. Language—`ja` for FedRAMP, NIST SP 800-53, and SOC 2 entries, `fr` for CCPA—does not alter the identifier or the review-cycle linkage (`ARTI-0005` appears on multiple cycles) but governs the human-consumable articulation of requirements, which matters when attestations must be produced for authorities, customers, or internal committees operating in designated locales. Together, scope and language ensure that the same canonical policy record can be referenced uniformly in automation while remaining intelligible and appropriately bounded for the audiences who must interpret it.

Operationally, the interplay of identifier, entity, attr, attr_type, misc, scope, and language yields a defensible chain of evidence from enforcement point to control framework. An XDP drop on `nfqueue_bridge` (`DROP-0004`) references cycle `CYCL-0003`; that cycle names CCPA, declares `regional` scope, and specifies `fr` as its language of record, while artifacts under review—`data-pipeline-v4` linked to `service-discovery` as `ARTI-0004`—supply the checksum, license, and dating misc needed to substantiate that the control environment was not stale at review time. Disjoint artifact tables do not break this chain because identifiers, not table names, carry semantics across domains. Reviewers therefore work against a uniform attribute vocabulary even when underlying technologies differ, and automated compliance tooling can validate types, aggregate misc by entity, filter obligations by scope, and render policy text by language without conflating storage convenience with governance meaning. That separation—stable identity, typed attributes, partitioned values, contextual scope and language—is what allows a single reference model to serve both kernel-level enforcement hooks and enterprise policy catalogs without sacrificing audit rigor.

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | ARTI-0002 | local | ja |
| CYCL-0002 | NIST SP 800-53 | ARTI-0005 | team | ja |
| CYCL-0003 | CCPA | ARTI-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | ARTI-0005 | regional | ja |
| CYCL-0005 | GDPR | ARTI-0002 | global | ja |
| CYCL-0006 | FedRAMP | ARTI-0005 | global | fr |
| CYCL-0007 | SOC 2 Type II | ARTI-0001 | global | ja |
| CYCL-0008 | CCPA | ARTI-0004 | local | ja |