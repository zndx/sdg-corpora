---
chapter_id: ch_live_functional_dependency_lhs_f75986
topic_id: 7
family: 07_long_tail
cited_terms: ['functional_dependency_lhs', 'division_eligibility_constraint', 'subclass_to_designative_ice']
model: engine-refine
---

Within the governance architecture, functional facts are anchored by identifiers that bind quantitative observations to their semantic context. The `fact_functional` table records left-hand side measurements alongside paired confidence and uncertainty metrics, each row uniquely addressed by an identifier such as `LHS-0001` through `LHS-0004`. A confidence value of `0.950` attached to `LHS-0004` signals a high degree of assurance in the associated value of `896.76`, whereas the same identifier space yields a confidence of `0.130` for `LHS-0002` with a corresponding value of `234.79` and an uncertainty of `197.20`. The uncertainty dimension, expressed as a continuous magnitude—`249.67`, `994.01`, `187.13`—quantifies the dispersion or error bound around each measurement, enabling downstream consumers to weight or filter observations according to their tolerance for imprecision. These functional facts are disambiguated through a dimension table that assigns each left-hand side entity a human-readable label, such as `F D Left Hand Side Label 01`, and a category designation like `F D Left Hand Side Category 01`, thereby providing the categorical scaffolding necessary for aggregation and reporting.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

Eligibility constraints governing divisional participation are modeled through a parallel structure that separates constraint definitions from their extensible attribute values. The constraint table enumerates distinct eligibility regimes—`EasternLeagueNovice`, `MountainWestOpen`, `SouthernTierPro`—each associated with a qualified athlete status such as `AccreditedVeteran`, `EndorsedFreshman`, or `LicensedElite`, and a cross-division transfer mechanism including `CircuitReroute`, `SectorTransfer`, and `LeagueBoundaryShift`. These three columns together define the policy envelope: the constraint name identifies the rule, the athlete status specifies who qualifies under it, and the cross-division transfer type determines how an athlete may move between divisions while remaining compliant. An identifier such as `CONS-0001` anchors the `EasternLeagueNovice` constraint, linking it to the `AccreditedVeteran` status and the `CircuitReroute` transfer mechanism in a single, queryable record.

**t_division_eligibility_constraint**

| id | division_eligibility_constraint | qualified_athlete_status | cross_division_transfer |
| --- | --- | --- | --- |
| CONS-0001 | EasternLeagueNovice | AccreditedVeteran | CircuitReroute |
| CONS-0002 | MountainWestOpen | AccreditedVeteran | ZoneRedistribution |
| CONS-0003 | MountainWestOpen | EndorsedFreshman | SectorTransfer |
| CONS-0004 | SouthernTierPro | LicensedElite | LeagueBoundaryShift |
| CONS-0005 | CentralStateSenior | ClearedAllStar | TierDowngrade |
| CONS-0006 | AtlanticZoneJunior | SanctionedContender | ConferenceSwitch |
| CONS-0007 | GreatLakesAmateur | CertifiedPro | ZoneRedistribution |

**t_division_eligibility_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | encoding | xsd:string |
| CONS-0002 | label_text | xsd:string |
| CONS-0003 | language | xsd:string |

**t_division_eligibility_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | pre-release note |
| CONS-0003 | CONS-0001 | CONS-0003 | fr |
| CONS-0004 | CONS-0002 | CONS-0001 | Encoding 04 |
| CONS-0005 | CONS-0002 | CONS-0002 | intake form |
| CONS-0006 | CONS-0002 | CONS-0003 | es |
| CONS-0007 | CONS-0003 | CONS-0001 | Encoding 07 |
| CONS-0008 | CONS-0003 | CONS-0002 | audit excerpt |

The extensibility of these constraints is achieved through an entity-attribute-value pattern that decouples attribute definitions from their runtime values. A dedicated attribute definition table declares the schema of permissible metadata fields—`encoding`, `label_text`, `language`—each typed as `xsd:string`, ensuring that all attached values conform to a known datatype. The corresponding value table then materializes these attributes against specific constraint entities: the entity identified as `CONS-0001` carries three attribute assignments, including an `encoding` value of `Encoding 01`, a `label_text` value of `pre-release note`, and a `language` value of `fr`. A fourth row, belonging to entity `CONS-0002`, assigns the attribute `encoding` the value `Encoding 04`. This separation allows the constraint model to accommodate arbitrary metadata without schema migration, while the attribute type column enforces datatype consistency across all attached values.

A structurally identical EAV pattern governs the designative ICE subclass, where entities such as `ICE-0001` through `ICE-0004` are associated with designative identifiers like `CryoStream-Link`, `CryoVault-Label`, `AeroFrost-ID`, and `IceSheet-Ref`. The attribute definition table for this subclass mirrors the constraint schema, declaring `encoding`, `label_text`, and `language` as `xsd:string` attributes. The value table populates these attributes against ICE entities: `ICE-0001` receives an `encoding` value of `Encoding 01`, a `label_text` value of `change rationale`, and a `language` value of `es`, while `ICE-0002` receives an `encoding` value of `Encoding 04`. The repetition of this pattern across both constraint and designative domains reflects a deliberate architectural choice to unify metadata handling across heterogeneous entity types, ensuring that attribute definitions and their values are managed through a consistent interface regardless of the parent entity's semantic domain.

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

**t_subclass_to_designative_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | Encoding 01 |
| ICE-0002 | ICE-0001 | ICE-0002 | change rationale |
| ICE-0003 | ICE-0001 | ICE-0003 | es |
| ICE-0004 | ICE-0002 | ICE-0001 | Encoding 04 |
| ICE-0005 | ICE-0002 | ICE-0002 | nightly summary |
| ICE-0006 | ICE-0002 | ICE-0003 | fr |
| ICE-0007 | ICE-0003 | ICE-0001 | Encoding 07 |
| ICE-0008 | ICE-0003 | ICE-0002 | change rationale |