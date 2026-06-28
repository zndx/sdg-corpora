---
chapter_id: ch_live_measurement_basic_f54919
topic_id: 125
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'division_eligibility_constraint', 'attestation_signed_by']
model: engine-refine
---

The data model organizes heterogeneous records through a normalized entity-attribute-value architecture, where each domain object—whether a measurement, an eligibility constraint, or a signed attestation—is decomposed into a core identifier, a set of typed attributes, and type-specific value stores. Every entity receives a unique identifier such as `MEAS-0001`, `CONS-0001`, or `SIGN-0001`, which serves as the anchor for all subsequent attribute bindings. The entity table itself carries a single domain-specific column: `measurement` holds values like Air Quality Index and Water pH Level; `division_eligibility_constraint` carries EasternLeagueNovice and MountainWestOpen; and `attestation` records System Access Certification and Privacy Impact Assessment. This separation ensures that the primary key space remains stable while attribute definitions and their values evolve independently.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |

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

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | System Access Certification |
| SIGN-0002 | Data Lineage Certification |
| SIGN-0003 | Privacy Impact Assessment |
| SIGN-0004 | System Access Certification |
| SIGN-0005 | Data Lineage Certification |
| SIGN-0006 | Model Performance Signoff |

**t_attestation_signed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

Attributes are declared in a dedicated metadata table that pairs each `attr_name` with an `attr_type` drawn from the XSD vocabulary. For measurements, attributes include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Eligibility constraints carry encoding, label_text, and language, all typed as xsd:string. Attestations expose duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string). The attr_type column is the schema-level contract that governs which value table a given attribute's data must inhabit, enforcing type discipline at the metadata layer rather than at query time.

Value storage is partitioned by type into four parallel tables—val_datetime, val_decimal, val_int, and val_varchar—each keyed by a surrogate id and linked to its owning entity through `entity_id` and to its attribute through `attr_id`. This design allows a single entity to carry multiple attributes of different types without nullable columns or type coercion. A measurement identified as MEAS-0001, for instance, stores its confidence value of 0.231 in the decimal table, its dimension_kind as Dimension Kind 01 in the varchar table, and its recorded_at timestamp of 2024-05-15T18:00:29 in the datetime table. The same entity may reference a different attribute in each value table; the attr_id column disambiguates which property the value represents. Attestation records follow the identical pattern: SIGN-0001 carries a duration_seconds of 2368.11, a host_name of gw-12, an exit_code of 407, and an end_time of 2023-11-18T17:18:55, each residing in its appropriate value table.

The eligibility constraint domain introduces two specialized columns that encode athletic governance rules. The `qualified_athlete_status` column distinguishes between AccreditedVeteran, EndorsedFreshman, and LicensedElite, while `cross_division_transfer` captures the mechanism by which an athlete moves between competitive tiers—CircuitReroute, ZoneRedistribution, SectorTransfer, and LeagueBoundaryShift appearing across the four constraint records. These columns sit alongside the generic attribute-value machinery: constraints also carry encoding values such as Encoding 01 and Encoding 04, a label_text of pre-release note, and a language attribute set to fr, all stored through the same varchar value table. The dual presence of domain-specific columns and generic attributes reflects a hybrid design where frequently queried governance fields are denormalized into the core table while auxiliary metadata flows through the EAV pipeline.

The identifier space, the attr/attr_type registry, and the typed value tables together form a reusable pattern that scales across entity types without schema migration. Adding a new attribute requires only an insertion into the attr table and the corresponding value into the appropriate type-specific store; no ALTER TABLE is needed. The entity_id foreign key ties every value back to its owner, and the attr_id foreign key ties every value to its declared type, creating a three-way join that reconstructs the full attribute set for any given record. This architecture supports the operational requirements of compliance tracking—where measurements must carry precision metadata, eligibility constraints must encode transfer rules, and attestations must record execution timestamps and exit codes—while maintaining a single, consistent data model across all three domains.