---
chapter_id: ch_live_schemaorg_review_author_e3059c
topic_id: 56
family: 07_long_tail
cited_terms: ['schemaorg_review_author', 'claim_with_belief_interval', 'port_isolation_measurement']
model: engine-refine
---

Within this data model, every observable fact is anchored to an **identifier**—a stable, machine-readable key such as `AUTH-0001`, `INTE-0001`, or `MEAS-0001`—that uniquely distinguishes one **entity** from all others. An entity is the fundamental unit of description: a person, a local business, a software application, or an event in the schema.org namespace; a network claim like "Network bandwidth saturated" or "Compliance audit passed"; or a port isolation measurement such as `Antenna_1_and_2`, `Switch_Network_P6`, `Balun_Prim_Sec`, and `Coaxial_Outlet_B`. The identifier is not merely a label but the join key that threads every attribute, value, and relationship back to its owner, ensuring referential integrity across the entire graph.

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Person | INTE-0003 |
| AUTH-0002 | LocalBusiness | INTE-0001 |
| AUTH-0003 | SoftwareApplication | INTE-0006 |
| AUTH-0004 | Event | INTE-0003 |
| AUTH-0005 | Place | INTE-0002 |
| AUTH-0006 | SoftwareApplication | INTE-0001 |

**t_port_isolation_measurement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | Encoding 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0002 | nightly summary |
| MEAS-0003 | MEAS-0001 | MEAS-0003 | en |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | Encoding 04 |
| MEAS-0005 | MEAS-0002 | MEAS-0002 | pre-release note |
| MEAS-0006 | MEAS-0002 | MEAS-0003 | de |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | Encoding 07 |
| MEAS-0008 | MEAS-0003 | MEAS-0002 | nightly summary |

Attributes and their types form the schema layer that gives entities structure. The **attr** concept captures the name of a property—`checksum`, `created_date`, `identifier`, `license`, `encoding`, `label_text`, `language`—while **attr_type** declares its semantic kind using a typed vocabulary: `xsd:string` for free-form text, `xsd:date` for calendar dates, and `cco:DesignativeICE` for designative identifiers. This separation of attribute definition from attribute value is deliberate: it allows the same attribute definition to be reused across many entities, and it permits the value store to be partitioned by data type. Date values such as `2025-02-16`, `2024-11-14`, `2023-06-05`, and `2023-01-18` reside in a dedicated value table keyed to their entity and attribute; integer values like `103`, `12`, `471`, and `5` in another; and string values such as `1a4b6c2d`, `ref-8842`, `CC-BY-4.0`, `on-prem-dc1`, `Encoding 01`, `nightly summary`, and `en` in a third. The **misc** column in these value tables simply denotes the cell's content—the actual datum—without imposing additional structure.

**t_schemaorg_review_author_attr**

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

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |

**t_schemaorg_review_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 103 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 471 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 5 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 402 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 1 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 318 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 3 |

**t_schemaorg_review_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 1a4b6c2d |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | ref-8842 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | CC-BY-4.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | application/xml |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | data-engineering |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Relationships between entities are expressed through a subject–target–role triad. In the claim-belief-interval association, a **subject** (the `claim_id`, e.g., `INTE-0001` for "Network bandwidth saturated" or `INTE-0003` for "API response time degraded") is linked to a **target** (the `belief_interval_id`, e.g., `0.75 to 0.88 interval` or `low medium high tier`) via a **role** that specifies the nature of the connection. The role values `reviewer` and `owner` distinguish whether the claimant is evaluating the interval or asserting ownership over it. This three-column junction table—`claim_id`, `belief_interval_id`, `role`—is the canonical pattern for many-to-many associations, and it generalizes cleanly to any domain where entities must be related without embedding the relationship inside either endpoint.

The port isolation measurement domain illustrates how physical-test entities carry their own attributes and cross-reference other measurement concepts. A measurement record such as `Switch_Network_P6` identifies which **portpair** is under test—`Coaxial_Outlet_B` in this case—and declares a dependency on an **impedancetermination** artifact, here `Depends On Impedance Termination 02`. The portpair concept captures the two endpoints whose isolation is being quantified; the impedance termination concept captures the physical termination condition that the measurement depends upon. Attributes like `encoding` with values `Encoding 01` and `Encoding 04`, and `language` with value `en`, are stored in the same attr/attr_type/value pattern used throughout the model, demonstrating that the attribute architecture is domain-agnostic and reusable.

**t_port_isolation_measurement**

| id | port_isolation_measurement | measures_port_isolation | depends_on_impedance_termination |
| --- | --- | --- | --- |
| MEAS-0001 | Antenna_1_and_2 | RF_Switch_3_4 | Depends On Impedance Termination 01 |
| MEAS-0002 | Switch_Network_P6 | Coaxial_Outlet_B | Depends On Impedance Termination 02 |
| MEAS-0003 | Balun_Prim_Sec | Fiber_Port_M_N | Depends On Impedance Termination 03 |
| MEAS-0004 | Coaxial_Outlet_B | Switch_Network_P6 | Depends On Impedance Termination 04 |
| MEAS-0005 | SMA_Port_A4 | Microstrip_Line_C | Depends On Impedance Termination 05 |
| MEAS-0006 | Balun_Secondary | SMA_Port_A4 | Depends On Impedance Termination 06 |
| MEAS-0007 | Optical_Coupler_1 | PCB_Trace_X_Y | Depends On Impedance Termination 07 |
| MEAS-0008 | Filter_Input_2 | Antenna_1_and_2 | Depends On Impedance Termination 08 |

Across all these tables, the design principle is uniform: identifiers provide stable anchors, attributes and their types define the vocabulary, value tables store the data separated by type for efficiency, and junction tables with subject, target, and role express the relationships. Whether describing a schema.org entity, a network claim with its belief interval, or a port isolation measurement with its impedance termination dependency, the same structural primitives apply. This uniformity is what makes the model composable—new entity types can be introduced by adding a new identifier namespace and a new set of attribute definitions, without requiring any change to the underlying value storage or relationship machinery.

**t_claim_with_belief_interval**

| id | claim |
| --- | --- |
| INTE-0001 | Network bandwidth saturated |
| INTE-0002 | Network bandwidth saturated |
| INTE-0003 | API response time degraded |
| INTE-0004 | Compliance audit passed |
| INTE-0005 | Compliance audit passed |
| INTE-0006 | Server CPU exceeds threshold |

**t_claim_with_belief_interval_belief_interval**

| id | belief_interval |
| --- | --- |
| INTE-0001 | low medium high tier |
| INTE-0002 | 0.75 to 0.88 interval |
| INTE-0003 | 0.75 to 0.88 interval |
| INTE-0004 | plus minus two units |
| INTE-0005 | 70 to 85 percent range |
| INTE-0006 | medium certainty window |
| INTE-0007 | 0.75 to 0.88 interval |
| INTE-0008 | 0.8 to 0.95 certainty |

**t_claim_with_belief_interval__belief_interval**

| id | claim_id | belief_interval_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0005 | reviewer |
| INTE-0002 | INTE-0001 | INTE-0002 | owner |
| INTE-0003 | INTE-0001 | INTE-0004 | reviewer |
| INTE-0004 | INTE-0004 | INTE-0002 | reviewer |
| INTE-0005 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0006 | INTE-0006 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0002 | INTE-0001 | contributor |
| INTE-0008 | INTE-0001 | INTE-0007 | reviewer |

**t_port_isolation_measurement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | encoding | xsd:string |
| MEAS-0002 | label_text | xsd:string |
| MEAS-0003 | language | xsd:string |