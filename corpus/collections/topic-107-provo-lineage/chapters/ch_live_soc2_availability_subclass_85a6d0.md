---
chapter_id: ch_live_soc2_availability_subclass_85a6d0
topic_id: 107
family: 07_long_tail
cited_terms: ['soc2_availability_subclass', 'schemaorg_person_birthplace', 'lane_compliance_behavior']
model: engine-refine
---

In governed compliance and operational data systems, every recordable fact is anchored by an identifier—a durable, system-assigned key that survives renaming, reclassification, and cross-domain linkage. Identifiers such as AVAI-0001 and BEHA-0002 function not merely as surrogate keys but as audit anchors: they permit auditors, integrators, and policy engines to reference the same logical object across typed value stores, dimensional lookups, and associative bridges without ambiguity. The entity is the subject those identifiers denote—the SOC 2 availability subclass, the lane compliance behavior, the schema artifact—while attributes (attr) name the governed properties that may be asserted about it. Attribute typing (attr_type) enforces semantic discipline at ingestion: an effective_date must conform to xsd:date, a mandatory flag to xsd:boolean, enforcement narrative to xsd:string, and priority to xsd:integer, so that validation, reporting, and automated control testing operate on comparable, machine-checkable values rather than ad hoc literals.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | Financial Controls |
| AVAI-0002 | SOC 2 Privacy Assessment | Financial Controls |
| AVAI-0003 | SOC 2 Type I Assessment | Availability Criteria |
| AVAI-0004 | SOC 1 Financial Audit | Network Infrastructure |
| AVAI-0005 | SOC 2 Type I Assessment | Security Criteria |
| AVAI-0006 | SOC 1 Type I Report | Confidentiality Criteria |
| AVAI-0007 | SOC 2 Privacy Assessment | Privacy Criteria |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

The separation of attribute definition from attribute value is a foundational design choice in compliance registries. Definitions—effective_date, enforcement, mandatory, priority—declare what may be said; values, carried in type-specific stores and surfaced through a misc field or equivalent payload column, declare what is true for a given entity at a point in time. A SOC 2 Privacy Assessment may carry mandatory = true and effective_date = 2024-03-01, while a SOC 2 Type I Assessment records mandatory = false with effective_date = 2023-09-25, permitting differential enforcement without collapsing heterogeneous facts into a single untyped table. Integer priorities (5 versus 378) and varchar enforcement descriptors (Enforcement 02, Encoding 01) further illustrate how the same attribute framework accommodates ordinal ranking and human-readable policy text within one governance model. Category supplies the classificatory layer above raw labels: birthplace records resolve through birthplace_key into dim_birthplace entries whose birthplace_category values (Birthplace Category 01 through 04) group provenance sources for analytic roll-up, retention policy, and trust-boundary decisions.

**dim_birthplace**

| id | birthplace_label | birthplace_category |
| --- | --- | --- |
| BIRT-0001 | Birthplace Label 01 | Birthplace Category 01 |
| BIRT-0002 | Birthplace Label 02 | Birthplace Category 02 |
| BIRT-0003 | Birthplace Label 03 | Birthplace Category 03 |
| BIRT-0004 | Birthplace Label 04 | Birthplace Category 04 |
| BIRT-0005 | Birthplace Label 05 | Birthplace Category 05 |
| BIRT-0006 | Birthplace Label 06 | Birthplace Category 06 |

Provenance and scale enter the picture where external schema corpora—here indexed in fact_schemaorg—must be accounted for in bytes and version. size_bytes (895,265,030 for one artifact; 114,301,972 for another) quantifies storage footprint and migration cost; version (3, 5, 4, 8) tracks lineage drift across releases. Birthplace, in this register, denotes the origin context of a schema artifact: not geographic birth but institutional or technical genesis—the catalog, consortium, or build pipeline from which a vocabulary was derived. Pairing birthplace_label with birthplace_category allows operators to distinguish, for example, a consortium-issued extension from an internally authored profile while preserving a single identifier namespace for downstream fact tables.

**fact_schemaorg**

| id | birthplace_key | size_bytes | version |
| --- | --- | --- | --- |
| BIRT-0001 | BIRT-0006 | 895265030 | 3 |
| BIRT-0002 | BIRT-0002 | 114301972 | 5 |
| BIRT-0003 | BIRT-0001 | 338701831 | 4 |
| BIRT-0004 | BIRT-0005 | 998785819 | 8 |

Lane compliance behavior extends the same identifier–entity–association pattern from financial attestation into operational traffic governance. A lanecompliancebehavior names a monitored compliance context—I-280 Express Lane, SR-520 Toll, Route 128 North—within which obligations attach to vehicle operators (Heavy Haul Supervisor, Autonomous Fleet Unit) and to streettrafficconfiguration instances that describe the physical traffic regime: Tunnel Approach Lane, Urban Signalized Intersection, Highway Work Zone, Bridge Deck Section. Behaviors do not float freely; they are situated on street types and staffed by operators whose participation is qualified by role. In the involves_operator bridge, BEHA-0002 linked to BEHA-0005 carries role = reviewer, while BEHA-0003 linked to BEHA-0005 carries role = owner, signaling that identical operator identifiers may bear different governance responsibilities depending on which lane behavior is in scope.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

**t_lane_compliance_behavior_involves_operator**

| id | involves_operator |
| --- | --- |
| BEHA-0001 | Heavy Haul Supervisor |
| BEHA-0002 | Delivery Van Operator |
| BEHA-0003 | Autonomous Fleet Unit |
| BEHA-0004 | RideShare Driver |
| BEHA-0005 | RideShare Driver |
| BEHA-0006 | Logistics Coordinator |
| BEHA-0007 | Autonomous Fleet Unit |

**t_lane_compliance_behavior__involves_operator**

| id | lane_id | involves_operator_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0002 | BEHA-0005 | reviewer |
| BEHA-0002 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0003 | BEHA-0005 | BEHA-0005 | owner |
| BEHA-0004 | BEHA-0002 | BEHA-0003 | owner |
| BEHA-0005 | BEHA-0003 | BEHA-0006 | owner |
| BEHA-0006 | BEHA-0003 | BEHA-0007 | contributor |
| BEHA-0007 | BEHA-0003 | BEHA-0006 | contributor |
| BEHA-0008 | BEHA-0002 | BEHA-0007 | observer |

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

Role generalizes this pattern across associative tables: reviewer, owner, and observer are not decorative labels but permission and accountability primitives that control who may attest, who bears corrective action, and who may witness without authority to bind. The parallel occurs_on_street_type association applies the same logic to infrastructure: an observer on BEHA-0003 at BEHA-0006 documents observational separation of duties, whereas an owner on BEHA-0002 at BEHA-0001 denotes operational custody of the configuration. cardinality_note records explicit constraints on those relationships—Cardinality Note 01 through 04 in the sample—documenting whether a lane behavior may map to one street type or many, whether duplicate operator bindings are permitted, and how orphan or mandatory associations must be resolved during data quality review. Taken together, identifier stability, typed attributes, categorical provenance, byte-scaled schema facts, and role-annotated associations constitute the operational grammar through which compliance metadata remains evidence-grade: every assertion traceable to an entity, every value typed and retrievable, every cross-domain link qualified by role and cardinality so that assessment scope (Financial Controls, Availability Criteria, Network Infrastructure) and field behavior (express lane tolling on a bridge deck section) can be audited with the same rigor.

**t_lane_compliance_behavior__occurs_on_street_type**

| id | lane_id | occurs_on_street_type_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| BEHA-0001 | BEHA-0003 | BEHA-0006 | observer | Cardinality Note 01 |
| BEHA-0002 | BEHA-0004 | BEHA-0002 | observer | Cardinality Note 02 |
| BEHA-0003 | BEHA-0002 | BEHA-0001 | owner | Cardinality Note 03 |
| BEHA-0004 | BEHA-0001 | BEHA-0005 | reviewer | Cardinality Note 04 |
| BEHA-0005 | BEHA-0001 | BEHA-0006 | observer | Cardinality Note 05 |
| BEHA-0006 | BEHA-0001 | BEHA-0003 | contributor | Cardinality Note 06 |
| BEHA-0007 | BEHA-0004 | BEHA-0006 | contributor | Cardinality Note 07 |
| BEHA-0008 | BEHA-0006 | BEHA-0004 | observer | Cardinality Note 08 |