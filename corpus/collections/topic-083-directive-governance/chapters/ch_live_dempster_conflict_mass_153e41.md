---
chapter_id: ch_live_dempster_conflict_mass_153e41
topic_id: 83
family: 07_long_tail
cited_terms: ['dempster_conflict_mass', 'schemaorg_person_roleat', 'trace_with_service_name']
model: engine-refine
---

The architecture of provenance and attribution in distributed systems rests upon a disciplined separation between what is observed and how it is characterized. At the core of this separation lies the identifier—a stable, unique key that anchors every record regardless of its domain. In the conflict-mass fact table, identifiers such as MASS-0001 through MASS-0004 serve as the primary keys for Dempster-Shafer evidential records, while in the role-attribution layer, identifiers like ROLE-0001 and ROLE-0002 uniquely designate person-institution pairings, and NAME-0001 through NAME-0004 identify trace entries. The identifier is the immutable anchor; everything else—attributes, values, categories—flows from it.

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | SANS Institute | Atmospheric Sampling Lab |
| ROLE-0002 | WHO Cyber Health | Remote Telemetry Node |
| ROLE-0003 | NASA Ames Research | Cloud Governance Tier |
| ROLE-0004 | DARPA InfoTech | Emergency Ops Center |
| ROLE-0005 | Red Hat OpenShift | Network Security Zone |
| ROLE-0006 | IEEE Standards | Clinical Observation Wing |
| ROLE-0007 | DARPA InfoTech | Field Sensor Array |

**t_schemaorg_person_roleat_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ROLE-0001 | checksum | xsd:string |
| ROLE-0002 | created_date | xsd:date |
| ROLE-0003 | identifier | cco:DesignativeICE |
| ROLE-0004 | license | xsd:string |
| ROLE-0005 | mime_type | xsd:string |
| ROLE-0006 | size_bytes | xsd:long |
| ROLE-0007 | uri | xsd:string |
| ROLE-0008 | version | xsd:integer |

**t_schemaorg_person_roleat_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0006 | 325 |
| ROLE-0002 | ROLE-0001 | ROLE-0008 | 7 |
| ROLE-0003 | ROLE-0002 | ROLE-0006 | 319 |
| ROLE-0004 | ROLE-0002 | ROLE-0008 | 10 |
| ROLE-0005 | ROLE-0003 | ROLE-0006 | 407 |
| ROLE-0006 | ROLE-0003 | ROLE-0008 | 6 |
| ROLE-0007 | ROLE-0004 | ROLE-0006 | 258 |
| ROLE-0008 | ROLE-0004 | ROLE-0008 | 6 |

Attributes and their types constitute the vocabulary through which entities are described. The attribute definition table maps each attribute identifier to a human-readable name—checksum, created_date, identifier, license—and to a formal type constraint drawn from XML Schema or CC0 designative vocabularies: xsd:string, xsd:date, cco:DesignativeICE. These type declarations are not decorative; they govern how values are stored, validated, and compared across the value tables. Date attributes resolve to entries such as 2025-01-23 and 2024-08-11 in the value-date table, integer attributes carry magnitudes like 325 and 7 in the value-int table, and string attributes hold identifiers and URIs—c0ffee42, urn:uuid:9f2a, CC-BY-4.0, zone-b—in the value-varchar table. The entity_id column in each value table binds these typed values back to the role-at records they describe, ensuring that every datum is attributable to a specific entity-attribute pair.

**t_schemaorg_person_roleat_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0002 | 2025-01-23 |
| ROLE-0002 | ROLE-0002 | ROLE-0002 | 2024-08-11 |
| ROLE-0003 | ROLE-0003 | ROLE-0002 | 2023-01-21 |
| ROLE-0004 | ROLE-0004 | ROLE-0002 | 2023-10-22 |
| ROLE-0005 | ROLE-0005 | ROLE-0002 | 2023-09-13 |
| ROLE-0006 | ROLE-0006 | ROLE-0002 | 2023-05-29 |
| ROLE-0007 | ROLE-0007 | ROLE-0002 | 2024-03-07 |

**t_schemaorg_person_roleat_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0001 | c0ffee42 |
| ROLE-0002 | ROLE-0001 | ROLE-0003 | urn:uuid:9f2a |
| ROLE-0003 | ROLE-0001 | ROLE-0004 | CC-BY-4.0 |
| ROLE-0004 | ROLE-0001 | ROLE-0009 | zone-b |
| ROLE-0005 | ROLE-0001 | ROLE-0005 | text/plain |
| ROLE-0006 | ROLE-0001 | ROLE-0010 | Name 06 |
| ROLE-0007 | ROLE-0001 | ROLE-0011 | platform-team |
| ROLE-0008 | ROLE-0001 | ROLE-0012 | Tags 08 |

Categories and labels provide the semantic scaffolding that transforms raw identifiers into interpretable classifications. The conflict-mass dimension table assigns each mass record a human-readable label—Conflict Mass Label 01 through 04—and a category designation—Conflict Mass Category 01 through 04—that groups related records for aggregation and reporting. Similarly, the role-at table assigns each person-institution pairing an institutional context (SANS Institute, WHO Cyber Health, NASA Ames Research, DARPA InfoTech) and a physical or logical location (Atmospheric Sampling Lab, Remote Telemetry Node, Cloud Governance Tier, Emergency Ops Center), effectively categorizing the role by both organizational affiliation and operational domain.

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

Confidence and uncertainty quantify the epistemic state of evidential records. In the Dempster-Shafer fact table, confidence values range from 0.014 to 0.728, reflecting the degree of belief assigned to each conflict-mass observation, while uncertainty values span from 9.49 to 687.80, capturing the residual ignorance or imprecision that accompanies each measurement. These two metrics operate in tandem: a record with confidence of 0.728 and uncertainty of 479.57 carries substantially more evidential weight than one with confidence of 0.014 and uncertainty of 392.06, even when their associated value magnitudes (846.10 versus 137.18) suggest otherwise. The distinction between value—the observed quantity—and confidence/uncertainty—the quality of the observation—is fundamental to any system that must reason under imperfect information.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

The subject-target-role triad governs relational linking across heterogeneous entities. In the trace-service junction table, the subject column (trace_id) references a trace entry such as notif-send-8876 or api-gateway-991, the target column (service_name_id) references a service like inventory-db or search-engine, and the role column specifies the nature of the relationship—observer, owner, or reviewer. A single trace may relate to multiple services under different roles: NAME-0001 appears as the subject with role observer in one linkage and role reviewer in another, demonstrating that the same entity can occupy multiple relational positions simultaneously. This design decouples the identity of the participants from the semantics of their connection, enabling flexible, extensible relationship modeling without schema modification.

**t_trace_with_service_name**

| id | trace |
| --- | --- |
| NAME-0001 | notif-send-8876 |
| NAME-0002 | inventory-sync-2290 |
| NAME-0003 | payment-proc-4451 |
| NAME-0004 | api-gateway-991 |
| NAME-0005 | cache-warm-5502 |
| NAME-0006 | payment-proc-4451 |

**t_trace_with_service_name_service_name**

| id | service_name |
| --- | --- |
| NAME-0001 | inventory-db |
| NAME-0002 | order-processor |
| NAME-0003 | metrics-collector |
| NAME-0004 | search-engine |
| NAME-0005 | logging-agent |
| NAME-0006 | logging-agent |
| NAME-0007 | config-server |
| NAME-0008 | inventory-db |

**t_trace_with_service_name__service_name**

| id | trace_id | service_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0001 | NAME-0005 | observer |
| NAME-0002 | NAME-0005 | NAME-0007 | observer |
| NAME-0003 | NAME-0004 | NAME-0007 | owner |
| NAME-0004 | NAME-0001 | NAME-0006 | reviewer |
| NAME-0005 | NAME-0002 | NAME-0004 | observer |
| NAME-0006 | NAME-0003 | NAME-0008 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | contributor |
| NAME-0008 | NAME-0003 | NAME-0008 | reviewer |