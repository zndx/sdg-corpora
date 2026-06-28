---
chapter_id: ch_live_home_electricity_reduction_program_0f71e6
topic_id: 23
family: 08_derived
cited_terms: ['home_electricity_reduction_program', 'frozen_artifact_governed_by', 'schemaorg_review_rating']
model: engine-refine
---

The governance and attribution framework rests upon a disciplined separation between entity identity, typed attributes, and relational roles—a tripartite structure that ensures both semantic clarity and query efficiency across heterogeneous data domains. Every entity, whether a reduction program such as the EcoHome Initiative or the SmartThermostat Rebate, a frozen artifact like Log-Archive-23Q4 or Model-Prod-v4, or a schema.org subject including Adobe Photoshop and The Great Gatsby, is anchored by a unique identifier (PROG-0001, GOVE-0001, RATI-0001, and so forth) that serves as the immutable key for all downstream joins and lookups. This identifier convention—prefixed by domain abbreviation and zero-padded to four digits—provides an immediate signal of provenance while remaining agnostic to the underlying entity type, thereby enabling cross-domain queries without schema coupling.

**t_home_electricity_reduction_program**

| id | reduction_program |
| --- | --- |
| PROG-0001 | EcoHome Initiative |
| PROG-0002 | SmartThermostat Rebate |
| PROG-0003 | PowerDown Project |
| PROG-0004 | NetZero Home |
| PROG-0005 | DemandResponse Trial |
| PROG-0006 | SmartThermostat Rebate |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

Typed attributes are decoupled from entity instances through a schema-on-read pattern that stores attribute definitions separately from their values. The attribute catalog records each attribute's name and its corresponding XML Schema type: effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. Values are then materialized in type-specific tables—boolean values such as false and true, date values ranging from 2024-01-16 to 2025-04-28, integer values spanning from 1 to 718, and string values including calibration record, Encoding 01, and es—each row linking back to its entity through the entity_id foreign key and to its attribute definition through attr_id. This normalization eliminates type ambiguity at query time and permits the addition of new attribute types without altering existing table structures.

Relational semantics are expressed through a subject–target–role triad that appears consistently across all join tables, regardless of domain. In the reduction program domain, a home identified as PROG-0001 may be linked to a targeted usage metric such as Daily kWh Consumption or Base Load Baseline with the role of owner or observer, while the same home may be associated with a household participant like MultiGen Home or Property Manager with the role of contributor or reviewer. The role column—taking values such as contributor, reviewer, owner, and observer—encodes the nature of the relationship rather than merely asserting its existence, enabling downstream systems to distinguish between, say, a participant who contributes data versus one who merely reviews it. A cardinality_note column (Cardinality Note 01 through Cardinality Note 04) provides additional structural constraints on these relationships, capturing multiplicity information that would otherwise require application-layer logic.

**t_home_electricity_reduction_program__addresses_usage_metric**

| id | home_id | addresses_usage_metric_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | PROG-0004 | reviewer | Cardinality Note 01 |
| PROG-0002 | PROG-0001 | PROG-0006 | owner | Cardinality Note 02 |
| PROG-0003 | PROG-0001 | PROG-0006 | observer | Cardinality Note 03 |
| PROG-0004 | PROG-0006 | PROG-0002 | observer | Cardinality Note 04 |
| PROG-0005 | PROG-0002 | PROG-0005 | contributor | Cardinality Note 05 |
| PROG-0006 | PROG-0005 | PROG-0005 | contributor | Cardinality Note 06 |
| PROG-0007 | PROG-0003 | PROG-0003 | observer | Cardinality Note 07 |
| PROG-0008 | PROG-0006 | PROG-0002 | contributor | Cardinality Note 08 |

The household participant and reduction program domains illustrate how this framework scales across operational use cases. Reduction programs—EcoHome Initiative, SmartThermostat Rebate, PowerDown Project, NetZero Home—serve as the central organizing entity, with participants (MultiGen Home, Property Manager, SingleParent Household) and usage metrics (Seasonal Peak, Daily kWh Consumption, Base Load Baseline) linked through the same subject–target–role pattern. A single home may appear as PROG-0001 in one context and PROG-0005 or PROG-0006 in another, demonstrating that the identifier space for homes is distinct from the identifier space for programs, and that cross-referencing requires explicit join tables rather than implicit schema assumptions. Similarly, review ratings—3.2 points, 100 percentile, 9.1 rating, 4.0 average—are associated with schema.org subjects (iPhone 15 Pro, The Great Gatsby, Adobe Photoshop) through a reviewer or contributor role, maintaining the same relational grammar.

**t_home_electricity_reduction_program_targets_participant**

| id | targets_participant |
| --- | --- |
| PROG-0001 | MultiGen Home |
| PROG-0002 | Property Manager |
| PROG-0003 | SingleParent Household |
| PROG-0004 | Property Manager |
| PROG-0005 | Suburban Dweller |
| PROG-0006 | Large Family Unit |
| PROG-0007 | Urban Apartment |

**t_home_electricity_reduction_program__targets_participant**

| id | home_id | targets_participant_id | role |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0001 | PROG-0007 | contributor |
| PROG-0002 | PROG-0003 | PROG-0002 | contributor |
| PROG-0003 | PROG-0002 | PROG-0007 | reviewer |
| PROG-0004 | PROG-0001 | PROG-0003 | reviewer |
| PROG-0005 | PROG-0006 | PROG-0004 | contributor |
| PROG-0006 | PROG-0003 | PROG-0007 | observer |
| PROG-0007 | PROG-0001 | PROG-0002 | contributor |
| PROG-0008 | PROG-0004 | PROG-0004 | contributor |

**t_home_electricity_reduction_program_addresses_usage_metric**

| id | addresses_usage_metric |
| --- | --- |
| PROG-0001 | Seasonal Peak |
| PROG-0002 | Daily kWh Consumption |
| PROG-0003 | Base Load Baseline |
| PROG-0004 | Daily kWh Consumption |
| PROG-0005 | Base Load Baseline |
| PROG-0006 | Base Load Baseline |

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Adobe Photoshop |
| RATI-0002 | The Great Gatsby |
| RATI-0003 | iPhone 15 Pro |
| RATI-0004 | iPhone 15 Pro |
| RATI-0005 | Marriott International |
| RATI-0006 | Marriott International |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |

This uniform treatment of identity, attributes, and relationships—where identifier, attr, attr_type, entity, householdparticipant, misc, reductionprogram, role, subject, target, and targetedusagemetric are not merely column names but first-class domain concepts—enables a single query engine to navigate across energy efficiency programs, compliance artifacts, and product reviews without domain-specific adapters. The framework's strength lies not in any single table but in the invariant structure that connects them: every entity is identified, every attribute is typed, every relationship is role-labeled, and every value is type-coerced at ingestion.