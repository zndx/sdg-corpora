---
chapter_id: ae2c0bf8e04fcd3f
topic_id: 125
family: 07_long_tail
cited_terms: ['schemaorg_place_address', 'observation_with_participant', 'artifact_min_one_owner']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Mapping of Physical Assets and Custodial Governance

## 4.1 Scope and Preamble

This chapter establishes the formal ontological framework required for the accurate representation of physical assets, their spatial designation, and their custodial relationships within a compliant governance infrastructure. The primary objective is to define a rigorous data model that aligns with the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), ensuring that all assertions regarding artifact location and ownership are machine-readable and auditable. The following sections detail three specific axiom sets—observation with participant, place-address mapping, and artifact ownership—providing the necessary logical constraints to prevent data ambiguity in regulatory reporting. By adhering to these schemas, practitioners ensure that asset inventories are not merely descriptive lists but semantically anchored networks of evidence that satisfy the strict requirements of international compliance standards.

## 4.2 Observation with Participant

### 4.2.1 Conceptual Definition

The foundational unit of auditability in any physical system is the *Observation*. In the context of BFO, an observation is not a static data point but a temporal process (`bfo:0000015`). It represents the act of detecting or recording the presence of an entity. For an observation to be meaningful, it must be directed at a *Participant*. The axiom `observation_with_participant` formalizes this by asserting that the observation process (`X`) has a participant that is an Artifact (`cco:Artifact`).

This distinction is critical for governance. It separates the *event* of recording an asset (the observation) from the *asset* itself. In a forensic audit or a chain-of-custody investigation, one must be able to distinguish between the server rack (the artifact) and the log entry stating the server rack was seen (the observation). The Manchester syntax for this axiom is expressed as: `Class: {X:Class} SubClassOf: bfo:0000015, bfo:0000057 some cco:Artifact`. This verbalizes to: *{X} is something that has participant artifact*.

### 4.2.2 Implementation and Relational Schema

To implement this axiom within a relational database management system (RDBMS), we utilize a table structure that isolates the observation event while linking it to the artifact involved. The primary key (`id`) serves as the unique identifier for the observation event, while the column `x` denotes the specific artifact instance participating in that process.

The table `t_observation_with_participant` acts as the central ledger for all interaction events. It is referenced by other governance tables to establish provenance. For instance, when recording a location or an owner, the system does not merely link to a string of text; it links to a specific observation event where that location or owner was verified against the artifact.

**Table 4.1: Observation Event Ledger**
The following table records specific observation processes where artifacts were identified and cataloged. The `id` represents the unique observation event ID, and `x` represents the name or identifier of the artifact participant.

| id | x |
|---|---|
| OBS-2024-001 | Industrial Pump Unit Alpha |
| OBS-2024-002 | Secure Server Rack B-12 |
| OBS-2024-003 | Emergency Generator V4 |
| OBS-2024-004 | HVAC Control Unit 5 |
| OBS-2024-005 | Fiber Optic Terminal 2 |

*Table 4.1 Note: The `id` column serves as the foreign key target for subsequent ownership and location assertions, ensuring that every claim of custody or geography is anchored to a verified observation event.*

## 4.3 Schema.org Place and Address Mapping

### 4.3.1 Conceptual Definition

While the previous section addressed the *event* of observation, this section addresses the *spatial* grounding of artifacts. In regulatory frameworks, an asset cannot exist in a vacuum; it must be assigned to a jurisdictional or postal address for tax, safety, and compliance purposes. The axiom `schemaorg_place_address` bridges the gap between a physical location (a Place, which is a subclass of `cco:Artifact`) and its postal designation.

The axiom is formally defined in Manchester syntax as: `Class: {X:Class} SubClassOf: cco:Artifact, sdg:hasPostalAddress some {Y:Class}`. This verbalizes to: *{X} is something that has postal address {Y}*. Here, `X` represents the facility or site (the Place), and `Y` represents the postal address data structure. This relationship is essential for cross-border compliance, where the legal status of a site often depends entirely on its postal code or municipal boundary.

### 4.3.2 Implementation and Relational Schema

The relational projection of this axiom requires a table that links a specific place instance to its corresponding address record. Crucially, the schema enforces a foreign key constraint where the address (`y`) must reference a valid entry in the `t_observation_with_participant` table. This design choice enforces the rule that an address cannot be formally associated with a place unless that address (or the place itself) has been subject to an observation process. It prevents the entry of "ghost" locations that have never been verified or surveyed.

**Table 4.2: Place-Address Correspondence**
The table below embodies the `schemaorg_place_address` axiom. The `id` is the unique identifier for the place-address relationship. Column `x` denotes the specific Place (Artifact), and column `y` contains the `id` of the observation record that validates the address details. This structure ensures that the address data (`y`) is treated as a distinct entity traceable to an observation event.

| id | x | y |
|---|---|---|
| PLACE-ADDR-101 | North Logistics Hub | OBS-2024-001 |
| PLACE-ADDR-102 | Data Center Wing 4 | OBS-2024-002 |
| PLACE-ADDR-103 | Auxiliary Power Station | OBS-2024-003 |
| PLACE-ADDR-104 | Rooftop Maintenance Access | OBS-2024-004 |

*Table 4.2 Note: The `y` column functions as a foreign key into the Observation Event Ledger. For example, the address for the "North Logistics Hub" is validated by the observation event `OBS-2024-001`. This enforces the axiom that the address is a participant in the observation of the place.*

## 4.4 Artifact Ownership and Stewardship

### 4.4.1 Conceptual Definition

The final concept in this ontological triad is that of *Ownership* or *Stewardship*. In the context of asset governance, it is insufficient to merely locate an asset; one must also identify the agent responsible for it. The axiom `artifact_min_one_owner` imposes a cardinality constraint on the ownership relationship. It asserts that any valid Artifact (`X`) must have a minimum of one Owner (`Y`).

The Manchester syntax for this axiom is: `Class: {X:Class} SubClassOf: cco:Artifact, sdg:hasOwner min 1 {Y:Class}`. The verbalization is: *{X} is a artifact*. The inclusion of `min 1` is a governance control mechanism; it prohibits the existence of "orphan" assets within the database. If an artifact exists, it *must* have a defined owner. This is a critical validation rule for audit readiness, ensuring that liability for every physical object is explicitly assigned.

### 4.4.2 Implementation and Relational Schema

The relational schema for `artifact_min_one_owner` creates a direct link between the artifact and the owner entity. Similar to the address mapping, the owner entity (`y`) is not stored as a simple string but as a reference to an observation record. This implies that the "Owner" is treated as a participant in the system's observational reality—perhaps verified via a contract signing or an HR record update.

The table `t_artifact_min_one_owner` serves as the registry of accountability. By querying this table, an auditor can instantly produce a report of all assets and their corresponding responsible parties. The `NOT NULL` constraint on the `y` column enforces the "min 1" requirement at the database level.

**Table 4.3: Artifact Ownership Registry**
This table operationalizes the `artifact_min_one_owner` axiom. Column `x` lists the Artifact, and column `y` references the observation record (`id`) that identifies the Owner entity. This structure ensures that every artifact listed is explicitly tied to a responsible party.

| id | x | y |
|---|---|---|
| OWN-REL-501 | Industrial Pump Unit Alpha | OBS-2024-001 |
| OWN-REL-502 | Secure Server Rack B-12 | OBS-2024-002 |
| OWN-REL-503 | Emergency Generator V4 | OBS-2024-003 |
| OWN-REL-504 | HVAC Control Unit 5 | OBS-2024-004 |
| OWN-REL-505 | Fiber Optic Terminal 2 | OBS-2024-005 |

*Table 4.3 Note: The foreign key constraint on `y` ensures that the owner is a recognized entity within the observation framework. For instance, "Secure Server Rack B-12" is owned by the entity recorded in observation `OBS-2024-002`. The presence of five rows demonstrates compliance with the `min 1` cardinality rule for all listed artifacts.*

```json
{
  "tables": [
    {
      "name": "t_observation_with_participant",
      "rows": [
        [
          "OBS-2024-001",
          "Industrial Pump Unit Alpha"
        ],
        [
          "OBS-2024-002",
          "Secure Server Rack B-12"
        ],
        [
          "OBS-2024-003",
          "Emergency Generator V4"
        ],
        [
          "OBS-2024-004",
          "HVAC Control Unit 5"
        ],
        [
          "OBS-2024-005",
          "Fiber Optic Terminal 2"
        ]
      ]
    },
    {
      "name": "t_schemaorg_place_address",
      "rows": [
        [
          "PLACE-ADDR-101",
          "North Logistics Hub",
          "OBS-2024-001"
        ],
        [
          "PLACE-ADDR-102",
          "Data Center Wing 4",
          "OBS-2024-002"
        ],
        [
          "PLACE-ADDR-103",
          "Auxiliary Power Station",
          "OBS-2024-003"
        ],
        [
          "PLACE-ADDR-104",
          "Rooftop Maintenance Access",
          "OBS-2024-004"
        ]
      ]
    },
    {
      "name": "t_artifact_min_one_owner",
      "rows": [
        [
          "OWN-REL-501",
          "Industrial Pump Unit Alpha",
          "OBS-2024-001"
        ],
        [
          "OWN-REL-502",
          "Secure Server Rack B-12",
          "OBS-2024-002"
        ],
        [
          "OWN-REL-503",
          "Emergency Generator V4",
          "OBS-2024-003"
        ],
        [
          "OWN-REL-504",
          "HVAC Control Unit 5",
          "OBS-2024-004"
        ],
        [
          "OWN-REL-505",
          "Fiber Optic Terminal 2",
          "OBS-2024-005"
        ]
      ]
    }
  ]
}
```