## Ontology-Grounded Schema Design for Resource Extraction Governance

The resource extraction governance domain captures the legal, physical, and operational relationships surrounding subsurface resource activities. At its core, the model tracks which jurisdictional statutes apply to which extraction wells, which wells sit on which land parcels, which lease agreements govern extraction rights, and what actual extraction events have occurred at each well. The ontology distinguishes five entity types—statutes, wells, parcels, events, and agreements—connected through many-to-many relationships that require junction tables in the relational materialization. Each view materializes a specific domain fact by joining the normalized tables back together, answering questions like "which statute governs this well?" or "what extraction events occurred on this parcel under this lease?"

### Jurisdictional Statutes

The regulatory backbone of the domain is the `jurisdictional_statutes` table, which records the legal instruments that govern extraction activities within specific jurisdictions. Each statute carries a unique `id` (e.g., `100`), a human-readable `statute_identifier` such as `STA-2074`, an `enactment_date` like `2022-01-04`, and a `jurisdiction_name` identifying the regulatory body—`Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, or `Adaptive Model` in the sample data. The `status` column captures the lifecycle state (`active`, `amended`, `repealed`, `pending`), while `subject_matter` classifies the regulatory focus (`seasonal-subject-29`, `regional-subject-30`, `legacy-subject-31`, `compact-subject-32`). The `jurisdictional_statute_id` column serves as a self-referencing alias for the statute, enabling downstream joins.

**Table `jurisdictional_statutes`**

| id | statute_identifier | enactment_date | jurisdiction_name | status | subject_matter | jurisdictional_statute_id |
|---|---|---|---|---|---|---|
| 100 | STA-2074 | 2022-01-04 | Pilot Cluster | active | seasonal-subject-29 | 100 |
| 101 | STA-2078 | 2023-06-15 | Baseline Review | amended | regional-subject-30 | 101 |
| 102 | STA-2082 | 2024-11-26 | Distributed Initiative A | repealed | legacy-subject-31 | 102 |
| 103 | STA-2086 | 2025-04-10 | Adaptive Model | pending | compact-subject-32 | 103 |

The statute table is the regulatory anchor: every other entity type in the domain can be traced back to a governing statute through direct foreign keys or through junction tables. The jurisdiction names suggest a federated regulatory structure where multiple overlapping statutes may apply to the same physical asset.

### Extraction Wells

The `extraction_wells` table models the physical infrastructure through which resources are removed from the subsurface. Each well has an `id` (e.g., `1`), a `well_identifier` such as `WEL-2588`, a `completion_date` in ISO 8601 format (`2024-03-14T02:06:00`), and a `well_type` distinguishing `oil`, `gas`, `water`, or `injection` operations. The `depth_meters` column records the well's depth (values like `0.4`, `0.01999998`, `0.13`, `0.96` in the sample), while `operator_name` identifies the operating entity (`Baseline Model D`, `Distributed Cluster`, `Adaptive Review`, `Primary Initiative A`). The `status` column tracks operational state (`active`, `plugged`, `abandoned`, `idle`).

**Table `extraction_wells`**

| id | well_identifier | completion_date | well_type | depth_meters | operator_name | status | land_parcel_id | extraction_well_id |
|---|---|---|---|---|---|---|---|---|
| 1 | WEL-2588 | 2024-03-14T02:06:00 | oil | 0.4 | Baseline Model D | active | 1000 | 1 |
| 2 | WEL-2590 | 2025-08-25T09:23:00 | gas | 0.01999998 | Distributed Cluster | plugged | 1001 | 2 |
| 3 | WEL-2592 | 2022-01-09T16:40:00 | water | 0.13 | Adaptive Review | abandoned | 1002 | 3 |
| 4 | WEL-2594 | 2023-06-20T23:57:00 | injection | 0.96 | Primary Initiative A | idle | 1003 | 4 |

Two foreign keys anchor the well to the rest of the domain: `land_parcel_id` links the well to its surface location, and `extraction_well_id` serves as a self-referencing alias. The well table is the central operational entity—events occur at wells, wells sit on parcels, wells are governed by statutes, and wells are leased under agreements.

### Land Parcels

The `land_parcels` table represents the surface land units upon which extraction infrastructure is sited. Each parcel has a `land_parcel_id` (e.g., `1000`), a `parcel_identifier` such as `PAR-2364`, and geographic identifiers `county_name` (`Extended Model`, `Pilot Cluster A`, `Baseline Review`, `Distributed Initiative`) and `state_name` (`Composite Protocol`, `Compact Programme A`, `Legacy Standard`, `Regional Framework`). The `total_area_acres` column records parcel size (`11.70`, `16.40`, `21.10`, `25.80`), while `zoning_classification` captures land-use designation (`baseline-zoning-85`, `pilot-zoning-86`, `extended-zoning-87`, `integrated-zoning-88`). The `surface_owner_name` identifies the surface rights holder (`Sarah Villanueva`, `Brian Hamilton`, `Elizabeth Woods`, `Jorge Sullivan`).

**Table `land_parcels`**

| land_parcel_id | parcel_identifier | county_name | state_name | total_area_acres | zoning_classification | surface_owner_name | jurisdictional_statute_id |
|---|---|---|---|---|---|---|---|
| 1000 | PAR-2364 | Extended Model | Composite Protocol | 11.70 | baseline-zoning-85 | Sarah Villanueva | 100 |
| 1001 | PAR-2368 | Pilot Cluster A | Compact Programme A | 16.40 | pilot-zoning-86 | Brian Hamilton | 101 |
| 1002 | PAR-2372 | Baseline Review | Legacy Standard | 21.10 | extended-zoning-87 | Elizabeth Woods | 102 |
| 1003 | PAR-2376 | Distributed Initiative | Regional Framework | 25.80 | integrated-zoning-88 | Jorge Sullivan | 103 |

The `jurisdictional_statute_id` column directly links each parcel to a governing statute, establishing a one-to-many relationship where a single statute can govern multiple parcels. This direct foreign key means that parcel-to-statute relationships are captured without a junction table, reflecting the design decision that each parcel has a single primary regulatory jurisdiction.

### Resource Extraction Events

The `resource_extraction_events` table records discrete measurement events at extraction wells. Each event has an `id` (e.g., `1`), an `event_identifier` such as `EVE-2706`, a `measurement_date_time` (`2023-06-16T05:39:00`), and volumetric measurements in `volume_barrels` (`21.45`, `24.90`, `28.35`, `31.80`) and `volume_thousand_cubic_feet` (`6.20`, `9.40`, `12.60`, `15.80`). The `pressure_p_s_i` column records downhole pressure (`3.45`, `5.90`, `8.35`, `10.80`), while `fluid_type` classifies the extracted material (`crude_oil`, `natural_gas`, `produced_water`, `mixed`).

**Table `resource_extraction_events`**

| id | event_identifier | measurement_date_time | volume_barrels | volume_thousand_cubic_feet | pressure_p_s_i | fluid_type | extraction_well_id | land_parcel_id | jurisdictional_statute_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2023-06-16T05:39:00 | 21.45 | 6.20 | 3.45 | crude_oil | 1 | 1000 | 100 |
| 2 | EVE-2707 | 2024-11-27T12:56:00 | 24.90 | 9.40 | 5.90 | natural_gas | 2 | 1001 | 101 |
| 3 | EVE-2708 | 2025-04-11T19:13:00 | 28.35 | 12.60 | 8.35 | produced_water | 3 | 1002 | 102 |
| 4 | EVE-2709 | 2022-09-22T02:30:00 | 31.80 | 15.80 | 10.80 | mixed | 4 | 1003 | 103 |

Three foreign keys anchor each event: `extraction_well_id` identifies the well where the measurement occurred, `land_parcel_id` identifies the surface parcel, and `jurisdictional_statute_id` identifies the governing statute. The presence of all three foreign keys on the event table means that every extraction event is fully contextualized within the regulatory and physical framework of the domain.

### Lease Agreements

The `lease_agreements` table captures the contractual relationships governing extraction rights. Each agreement has a `lease_agreement_id` (e.g., `1`), a `lease_identifier` such as `LEA-2437`, an `effective_date` (`2023-02-14`), and an `expiration_date` (`2025-08-18`). The `royalty_percentage` column records the royalty rate (`1.70`, `3.40`, `5.10`, `6.80`), while `bonus_payment_amount` captures the upfront payment (`1,862`, `41,973`, `14.58`, `5,395`). The `lessor_name` identifies the rights grantor (`Compact Series`, `Legacy Assessment`, `Regional Survey A`, `Seasonal Corridor`) and `lessee_name` identifies the rights holder (`Primary Framework A`, `Composite Protocol`, `Compact Programme`, `Legacy Standard D`).

**Table `lease_agreements`**

| lease_agreement_id | lease_identifier | effective_date | expiration_date | royalty_percentage | bonus_payment_amount | lessor_name | lessee_name | land_parcel_id | jurisdictional_statute_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | LEA-2437 | 2023-02-14 | 2025-08-18 | 1.70 | 1,862 | Compact Series | Primary Framework A | 1000 | 100 |
| 2 | LEA-2443 | 2024-07-25 | 2022-01-02 | 3.40 | 41,973 | Legacy Assessment | Composite Protocol | 1001 | 101 |
| 3 | LEA-2449 | 2025-12-09 | 2023-06-13 | 5.10 | 14.58 | Regional Survey A | Compact Programme | 1002 | 102 |
| 4 | LEA-2455 | 2022-05-20 | 2024-11-24 | 6.80 | 5,395 | Seasonal Corridor | Legacy Standard D | 1003 | 103 |

The `land_parcel_id` and `jurisdictional_statute_id` columns directly link each lease to its surface parcel and governing statute, respectively. Like the parcel table, the lease table uses direct foreign keys rather than junction tables for these relationships, reflecting the design assumption that each lease is tied to a single parcel and a single statute.

### Junction Tables for Many-to-Many Relationships

While parcels, events, and leases each carry direct foreign keys to statutes, the relationship between statutes and wells is many-to-many: a single statute can govern multiple wells, and a single well can be subject to multiple statutes. This relationship is materialized in the `statutes_wells` junction table, which contains pairs of `jurisdictional_statute_id` and `extraction_well_id`.

**Table `statutes_wells`**

| jurisdictional_statute_id | extraction_well_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The sample data shows statute `100` governing wells `1` and `2`, statute `101` governing wells `2` and `3`, statute `102` governing wells `3` and `4`, and statute `103` governing wells `4` and `1`. This creates a cyclic overlap pattern where each statute governs exactly two wells and each well is governed by exactly two statutes.

The remaining junction tables—`wells_events`, `parcels_wells`, `parcels_agreements`, and `agreements_wells`—serve the same structural purpose for their respective entity pairs. The `wells_events` table links wells to extraction events, `parcels_wells` links parcels to wells (allowing a parcel to host multiple wells and a well to be associated with multiple parcels), `parcels_agreements` links parcels to lease agreements, and `agreements_wells` links lease agreements to wells.

**Table `wells_events`**

| extraction_well_id | resource_extraction_event_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `parcels_wells`**

| land_parcel_id | extraction_well_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `parcels_agreements`**

| land_parcel_id | lease_agreement_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `agreements_wells`**

| lease_agreement_id | extraction_well_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

These junction tables embody the cardinality-bounded nature of the relationships: each row represents a single association between two entities, and the composite primary key on the two foreign key columns prevents duplicate associations. The junction tables are the relational manifestation of the ontology's relationship classes, transforming conceptual many-to-many links into queryable, constraint-enforced data.

### Views: Reconstructing Domain Facts

The view layer materializes the normalized schema into domain-meaningful projections. Each view joins the base tables and junction tables to answer a specific question about the resource extraction domain.

#### Statute-to-Well Detail Views

The view `v_jurisdictional_statute_extraction_well_detail` reconstructs the relationship between a statute and the wells it governs, joining `jurisdictional_statutes` through `statutes_wells` to `extraction_wells`. This view answers the question: "which wells fall under this statute's regulatory authority?"

**View `v_jurisdictional_statute_extraction_well_detail`**

```sql
CREATE VIEW v_jurisdictional_statute_extraction_well_detail AS
SELECT a.id, a.statute_identifier, a.enactment_date, b.id AS well_id, b.well_identifier AS well_well_identifier, b.completion_date AS well_completion_date
FROM jurisdictional_statutes a
  JOIN statutes_wells j ON j.jurisdictional_statute_id = a.id
  JOIN extraction_wells b ON b.id = j.extraction_well_id;
```

| id | statute_identifier | enactment_date | well_id | well_well_identifier | well_completion_date |
|---|---|---|---|---|---|
| 100 | STA-2074 | 2022-01-04 | 1 | WEL-2588 | 2024-03-14T02:06:00 |
| 100 | STA-2074 | 2022-01-04 | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 101 | STA-2078 | 2023-06-15 | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 101 | STA-2078 | 2023-06-15 | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 102 | STA-2082 | 2024-11-26 | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 102 | STA-2082 | 2024-11-26 | 4 | WEL-2594 | 2023-06-20T23:57:00 |
| 103 | STA-2086 | 2025-04-10 | 4 | WEL-2594 | 2023-06-20T23:57:00 |
| 103 | STA-2086 | 2025-04-10 | 1 | WEL-2588 | 2024-03-14T02:06:00 |

The view `v_jurisdictional_statute_jurisdictional_statute` provides a self-join on the statute table, enabling queries about statute-to-statute relationships or self-referencing regulatory hierarchies.

**View `v_jurisdictional_statute_jurisdictional_statute`**

```sql
CREATE VIEW v_jurisdictional_statute_jurisdictional_statute AS
SELECT a.id, a.statute_identifier, a.enactment_date, a.jurisdiction_name, b.id AS statute_id, b.statute_identifier AS statute_statute_identifier, b.enactment_date AS statute_enactment_date
FROM jurisdictional_statutes a JOIN jurisdictional_statutes b ON a.jurisdictional_statute_id = b.id;
```

| id | statute_identifier | enactment_date | jurisdiction_name | statute_id | statute_statute_identifier | statute_enactment_date |
|---|---|---|---|---|---|---|
| 100 | STA-2074 | 2022-01-04 | Pilot Cluster | 100 | STA-2074 | 2022-01-04 |
| 101 | STA-2078 | 2023-06-15 | Baseline Review | 101 | STA-2078 | 2023-06-15 |
| 102 | STA-2082 | 2024-11-26 | Distributed Initiative A | 102 | STA-2082 | 2024-11-26 |
| 103 | STA-2086 | 2025-04-10 | Adaptive Model | 103 | STA-2086 | 2025-04-10 |

#### Well-to-Parcel and Well-to-Well Views

The view `v_extraction_well_land_parcel` joins `extraction_wells` to `land_parcels` (directly via the `land_parcel_id` foreign key or through `parcels_wells`), answering: "which land parcel hosts this well?" Reading the sample data, well `WEL-2588` (id `1`) sits on parcel `PAR-2364` (id `1000`), owned by Sarah Villanueva in the Extended Model county.

**View `v_extraction_well_land_parcel`**

```sql
CREATE VIEW v_extraction_well_land_parcel AS
SELECT a.id, a.well_identifier, a.completion_date, a.well_type, b.land_parcel_id AS parcel_land_parcel_id, b.parcel_identifier AS parcel_parcel_identifier, b.county_name AS parcel_county_name
FROM extraction_wells a JOIN land_parcels b ON a.land_parcel_id = b.land_parcel_id;
```

| id | well_identifier | completion_date | well_type | parcel_land_parcel_id | parcel_parcel_identifier | parcel_county_name |
|---|---|---|---|---|---|---|
| 1 | WEL-2588 | 2024-03-14T02:06:00 | oil | 1000 | PAR-2364 | Extended Model |
| 2 | WEL-2590 | 2025-08-25T09:23:00 | gas | 1001 | PAR-2368 | Pilot Cluster A |
| 3 | WEL-2592 | 2022-01-09T16:40:00 | water | 1002 | PAR-2372 | Baseline Review |
| 4 | WEL-2594 | 2023-06-20T23:57:00 | injection | 1003 | PAR-2376 | Distributed Initiative |

The view `v_extraction_well_extraction_well` provides a self-join on the well table, enabling comparisons between wells or hierarchical well relationships.

**View `v_extraction_well_extraction_well`**

```sql
CREATE VIEW v_extraction_well_extraction_well AS
SELECT a.id, a.well_identifier, a.completion_date, a.well_type, b.id AS well_id, b.well_identifier AS well_well_identifier, b.completion_date AS well_completion_date
FROM extraction_wells a JOIN extraction_wells b ON a.extraction_well_id = b.id;
```

| id | well_identifier | completion_date | well_type | well_id | well_well_identifier | well_completion_date |
|---|---|---|---|---|---|---|
| 1 | WEL-2588 | 2024-03-14T02:06:00 | oil | 1 | WEL-2588 | 2024-03-14T02:06:00 |
| 2 | WEL-2590 | 2025-08-25T09:23:00 | gas | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 3 | WEL-2592 | 2022-01-09T16:40:00 | water | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 4 | WEL-2594 | 2023-06-20T23:57:00 | injection | 4 | WEL-2594 | 2023-06-20T23:57:00 |

The view `v_extraction_well_resource_extraction_event_detail` joins `extraction_wells` to `resource_extraction_events`, answering: "what extraction events have occurred at this well?" For example, event `EVE-2706` at well `WEL-2588` recorded a volume of `21.45` barrels of `crude_oil` at a pressure of `3.45` psi on `2023-06-16T05:39:00`.

**View `v_extraction_well_resource_extraction_event_detail`**

```sql
CREATE VIEW v_extraction_well_resource_extraction_event_detail AS
SELECT a.id, a.well_identifier, a.completion_date, b.id AS event_id, b.event_identifier AS event_event_identifier, b.measurement_date_time AS event_measurement_date_time
FROM extraction_wells a
  JOIN wells_events j ON j.extraction_well_id = a.id
  JOIN resource_extraction_events b ON b.id = j.resource_extraction_event_id;
```

| id | well_identifier | completion_date | event_id | event_event_identifier | event_measurement_date_time |
|---|---|---|---|---|---|
| 1 | WEL-2588 | 2024-03-14T02:06:00 | 1 | EVE-2706 | 2023-06-16T05:39:00 |
| 1 | WEL-2588 | 2024-03-14T02:06:00 | 2 | EVE-2707 | 2024-11-27T12:56:00 |
| 2 | WEL-2590 | 2025-08-25T09:23:00 | 2 | EVE-2707 | 2024-11-27T12:56:00 |
| 2 | WEL-2590 | 2025-08-25T09:23:00 | 3 | EVE-2708 | 2025-04-11T19:13:00 |
| 3 | WEL-2592 | 2022-01-09T16:40:00 | 3 | EVE-2708 | 2025-04-11T19:13:00 |
| 3 | WEL-2592 | 2022-01-09T16:40:00 | 4 | EVE-2709 | 2022-09-22T02:30:00 |
| 4 | WEL-2594 | 2023-06-20T23:57:00 | 4 | EVE-2709 | 2022-09-22T02:30:00 |
| 4 | WEL-2594 | 2023-06-20T23:57:00 | 1 | EVE-2706 | 2023-06-16T05:39:00 |

#### Parcel-Centric Views

The view `v_land_parcel_extraction_well_detail` joins `land_parcels` to `extraction_wells`, answering: "which wells are located on this parcel?" Parcel `PAR-2364` (id `1000`) hosts well `WEL-2588`, an `oil` well operated by `Baseline Model D` with a depth of `0.4` meters.

**View `v_land_parcel_extraction_well_detail`**

```sql
CREATE VIEW v_land_parcel_extraction_well_detail AS
SELECT a.land_parcel_id, a.parcel_identifier, a.county_name, b.id AS well_id, b.well_identifier AS well_well_identifier, b.completion_date AS well_completion_date
FROM land_parcels a
  JOIN parcels_wells j ON j.land_parcel_id = a.land_parcel_id
  JOIN extraction_wells b ON b.id = j.extraction_well_id;
```

| land_parcel_id | parcel_identifier | county_name | well_id | well_well_identifier | well_completion_date |
|---|---|---|---|---|---|
| 1000 | PAR-2364 | Extended Model | 1 | WEL-2588 | 2024-03-14T02:06:00 |
| 1000 | PAR-2364 | Extended Model | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 1001 | PAR-2368 | Pilot Cluster A | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 1001 | PAR-2368 | Pilot Cluster A | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 1002 | PAR-2372 | Baseline Review | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 1002 | PAR-2372 | Baseline Review | 4 | WEL-2594 | 2023-06-20T23:57:00 |
| 1003 | PAR-2376 | Distributed Initiative | 4 | WEL-2594 | 2023-06-20T23:57:00 |
| 1003 | PAR-2376 | Distributed Initiative | 1 | WEL-2588 | 2024-03-14T02:06:00 |

The view `v_land_parcel_lease_agreement_detail` joins `land_parcels` to `lease_agreements`, answering: "which lease agreements apply to this parcel?" Parcel `PAR-2364` (id `1000`) is covered by lease `LEA-2437`, where `Compact Series` (lessor) granted rights to `Primary Framework A` (lessee) with a `1.70` percent royalty and a bonus payment of `1,862`.

**View `v_land_parcel_lease_agreement_detail`**

```sql
CREATE VIEW v_land_parcel_lease_agreement_detail AS
SELECT a.land_parcel_id, a.parcel_identifier, a.county_name, b.lease_agreement_id AS agreement_lease_agreement_id, b.lease_identifier AS agreement_lease_identifier, b.effective_date AS agreement_effective_date
FROM land_parcels a
  JOIN parcels_agreements j ON j.land_parcel_id = a.land_parcel_id
  JOIN lease_agreements b ON b.lease_agreement_id = j.lease_agreement_id;
```

| land_parcel_id | parcel_identifier | county_name | agreement_lease_agreement_id | agreement_lease_identifier | agreement_effective_date |
|---|---|---|---|---|---|
| 1000 | PAR-2364 | Extended Model | 1 | LEA-2437 | 2023-02-14 |
| 1000 | PAR-2364 | Extended Model | 2 | LEA-2443 | 2024-07-25 |
| 1001 | PAR-2368 | Pilot Cluster A | 2 | LEA-2443 | 2024-07-25 |
| 1001 | PAR-2368 | Pilot Cluster A | 3 | LEA-2449 | 2025-12-09 |
| 1002 | PAR-2372 | Baseline Review | 3 | LEA-2449 | 2025-12-09 |
| 1002 | PAR-2372 | Baseline Review | 4 | LEA-2455 | 2022-05-20 |
| 1003 | PAR-2376 | Distributed Initiative | 4 | LEA-2455 | 2022-05-20 |
| 1003 | PAR-2376 | Distributed Initiative | 1 | LEA-2437 | 2023-02-14 |

The view `v_land_parcel_jurisdictional_statute` joins `land_parcels` to `jurisdictional_statutes` via the direct `jurisdictional_statute_id` foreign key, answering: "which statute governs this parcel?" Parcel `PAR-2364` is governed by statute `STA-2074` under the `Pilot Cluster` jurisdiction, which is currently `active` and covers `seasonal-subject-29`.

**View `v_land_parcel_jurisdictional_statute`**

```sql
CREATE VIEW v_land_parcel_jurisdictional_statute AS
SELECT a.land_parcel_id, a.parcel_identifier, a.county_name, a.state_name, b.id AS statute_id, b.statute_identifier AS statute_statute_identifier, b.enactment_date AS statute_enactment_date
FROM land_parcels a JOIN jurisdictional_statutes b ON a.jurisdictional_statute_id = b.id;
```

| land_parcel_id | parcel_identifier | county_name | state_name | statute_id | statute_statute_identifier | statute_enactment_date |
|---|---|---|---|---|---|---|
| 1000 | PAR-2364 | Extended Model | Composite Protocol | 100 | STA-2074 | 2022-01-04 |
| 1001 | PAR-2368 | Pilot Cluster A | Compact Programme A | 101 | STA-2078 | 2023-06-15 |
| 1002 | PAR-2372 | Baseline Review | Legacy Standard | 102 | STA-2082 | 2024-11-26 |
| 1003 | PAR-2376 | Distributed Initiative | Regional Framework | 103 | STA-2086 | 2025-04-10 |

#### Event-Centric Views

The view `v_resource_extraction_event_extraction_well` joins `resource_extraction_events` to `extraction_wells`, answering: "which well produced this extraction event?" Event `EVE-2706` occurred at well `WEL-2588`, an `oil` well operated by `Baseline Model D`.

**View `v_resource_extraction_event_extraction_well`**

```sql
CREATE VIEW v_resource_extraction_event_extraction_well AS
SELECT a.id, a.event_identifier, a.measurement_date_time, a.volume_barrels, b.id AS well_id, b.well_identifier AS well_well_identifier, b.completion_date AS well_completion_date
FROM resource_extraction_events a JOIN extraction_wells b ON a.extraction_well_id = b.id;
```

| id | event_identifier | measurement_date_time | volume_barrels | well_id | well_well_identifier | well_completion_date |
|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2023-06-16T05:39:00 | 21.45 | 1 | WEL-2588 | 2024-03-14T02:06:00 |
| 2 | EVE-2707 | 2024-11-27T12:56:00 | 24.90 | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 3 | EVE-2708 | 2025-04-11T19:13:00 | 28.35 | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 4 | EVE-2709 | 2022-09-22T02:30:00 | 31.80 | 4 | WEL-2594 | 2023-06-20T23:57:00 |

The view `v_resource_extraction_event_land_parcel` joins `resource_extraction_events` to `land_parcels`, answering: "on which parcel did this extraction event occur?" Event `EVE-2706` occurred on parcel `PAR-2364`, a `11.70`-acre parcel in `Extended Model` county owned by `Sarah Villanueva`.

**View `v_resource_extraction_event_land_parcel`**

```sql
CREATE VIEW v_resource_extraction_event_land_parcel AS
SELECT a.id, a.event_identifier, a.measurement_date_time, a.volume_barrels, b.land_parcel_id AS parcel_land_parcel_id, b.parcel_identifier AS parcel_parcel_identifier, b.county_name AS parcel_county_name
FROM resource_extraction_events a JOIN land_parcels b ON a.land_parcel_id = b.land_parcel_id;
```

| id | event_identifier | measurement_date_time | volume_barrels | parcel_land_parcel_id | parcel_parcel_identifier | parcel_county_name |
|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2023-06-16T05:39:00 | 21.45 | 1000 | PAR-2364 | Extended Model |
| 2 | EVE-2707 | 2024-11-27T12:56:00 | 24.90 | 1001 | PAR-2368 | Pilot Cluster A |
| 3 | EVE-2708 | 2025-04-11T19:13:00 | 28.35 | 1002 | PAR-2372 | Baseline Review |
| 4 | EVE-2709 | 2022-09-22T02:30:00 | 31.80 | 1003 | PAR-2376 | Distributed Initiative |

The view `v_resource_extraction_event_jurisdictional_statute` joins `resource_extraction_events` to `jurisdictional_statutes`, answering: "under which statute was this extraction event regulated?" Event `EVE-2706` was governed by statute `STA-2074` under the `Pilot Cluster` jurisdiction.

**View `v_resource_extraction_event_jurisdictional_statute`**

```sql
CREATE VIEW v_resource_extraction_event_jurisdictional_statute AS
SELECT a.id, a.event_identifier, a.measurement_date_time, a.volume_barrels, b.id AS statute_id, b.statute_identifier AS statute_statute_identifier, b.enactment_date AS statute_enactment_date
FROM resource_extraction_events a JOIN jurisdictional_statutes b ON a.jurisdictional_statute_id = b.id;
```

| id | event_identifier | measurement_date_time | volume_barrels | statute_id | statute_statute_identifier | statute_enactment_date |
|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2023-06-16T05:39:00 | 21.45 | 100 | STA-2074 | 2022-01-04 |
| 2 | EVE-2707 | 2024-11-27T12:56:00 | 24.90 | 101 | STA-2078 | 2023-06-15 |
| 3 | EVE-2708 | 2025-04-11T19:13:00 | 28.35 | 102 | STA-2082 | 2024-11-26 |
| 4 | EVE-2709 | 2022-09-22T02:30:00 | 31.80 | 103 | STA-2086 | 2025-04-10 |

#### Lease-Centric Views

The view `v_lease_agreement_land_parcel` joins `lease_agreements` to `land_parcels`, answering: "which parcel is covered by this lease agreement?" Lease `LEA-2437` covers parcel `PAR-2364`, a `11.70`-acre parcel in `Extended Model` county.

**View `v_lease_agreement_land_parcel`**

```sql
CREATE VIEW v_lease_agreement_land_parcel AS
SELECT a.lease_agreement_id, a.lease_identifier, a.effective_date, a.expiration_date, b.land_parcel_id AS parcel_land_parcel_id, b.parcel_identifier AS parcel_parcel_identifier, b.county_name AS parcel_county_name
FROM lease_agreements a JOIN land_parcels b ON a.land_parcel_id = b.land_parcel_id;
```

| lease_agreement_id | lease_identifier | effective_date | expiration_date | parcel_land_parcel_id | parcel_parcel_identifier | parcel_county_name |
|---|---|---|---|---|---|---|
| 1 | LEA-2437 | 2023-02-14 | 2025-08-18 | 1000 | PAR-2364 | Extended Model |
| 2 | LEA-2443 | 2024-07-25 | 2022-01-02 | 1001 | PAR-2368 | Pilot Cluster A |
| 3 | LEA-2449 | 2025-12-09 | 2023-06-13 | 1002 | PAR-2372 | Baseline Review |
| 4 | LEA-2455 | 2022-05-20 | 2024-11-24 | 1003 | PAR-2376 | Distributed Initiative |

The view `v_lease_agreement_extraction_well_detail` joins `lease_agreements` to `extraction_wells` (through `agreements_wells`), answering: "which wells are operated under this lease agreement?" This view reconstructs the contractual-to-operational link, showing which physical infrastructure is governed by which lease.

**View `v_lease_agreement_extraction_well_detail`**

```sql
CREATE VIEW v_lease_agreement_extraction_well_detail AS
SELECT a.lease_agreement_id, a.lease_identifier, a.effective_date, b.id AS well_id, b.well_identifier AS well_well_identifier, b.completion_date AS well_completion_date
FROM lease_agreements a
  JOIN agreements_wells j ON j.lease_agreement_id = a.lease_agreement_id
  JOIN extraction_wells b ON b.id = j.extraction_well_id;
```

| lease_agreement_id | lease_identifier | effective_date | well_id | well_well_identifier | well_completion_date |
|---|---|---|---|---|---|
| 1 | LEA-2437 | 2023-02-14 | 1 | WEL-2588 | 2024-03-14T02:06:00 |
| 1 | LEA-2437 | 2023-02-14 | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 2 | LEA-2443 | 2024-07-25 | 2 | WEL-2590 | 2025-08-25T09:23:00 |
| 2 | LEA-2443 | 2024-07-25 | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 3 | LEA-2449 | 2025-12-09 | 3 | WEL-2592 | 2022-01-09T16:40:00 |
| 3 | LEA-2449 | 2025-12-09 | 4 | WEL-2594 | 2023-06-20T23:57:00 |
| 4 | LEA-2455 | 2022-05-20 | 4 | WEL-2594 | 2023-06-20T23:57:00 |
| 4 | LEA-2455 | 2022-05-20 | 1 | WEL-2588 | 2024-03-14T02:06:00 |

The view `v_lease_agreement_jurisdictional_statute` joins `lease_agreements` to `jurisdictional_statutes`, answering: "under which statute is this lease agreement regulated?" Lease `LEA-2437` is governed by statute `STA-2074` under the `Pilot Cluster` jurisdiction.

**View `v_lease_agreement_jurisdictional_statute`**

```sql
CREATE VIEW v_lease_agreement_jurisdictional_statute AS
SELECT a.lease_agreement_id, a.lease_identifier, a.effective_date, a.expiration_date, b.id AS statute_id, b.statute_identifier AS statute_statute_identifier, b.enactment_date AS statute_enactment_date
FROM lease_agreements a JOIN jurisdictional_statutes b ON a.jurisdictional_statute_id = b.id;
```

| lease_agreement_id | lease_identifier | effective_date | expiration_date | statute_id | statute_statute_identifier | statute_enactment_date |
|---|---|---|---|---|---|---|
| 1 | LEA-2437 | 2023-02-14 | 2025-08-18 | 100 | STA-2074 | 2022-01-04 |
| 2 | LEA-2443 | 2024-07-25 | 2022-01-02 | 101 | STA-2078 | 2023-06-15 |
| 3 | LEA-2449 | 2025-12-09 | 2023-06-13 | 102 | STA-2082 | 2024-11-26 |
| 4 | LEA-2455 | 2022-05-20 | 2024-11-24 | 103 | STA-2086 | 2025-04-10 |

### Synthesis

The schema design reflects a deliberate separation between the regulatory framework (statutes), the physical infrastructure (wells and parcels), the contractual layer (leases), and the operational record (events). The five base tables capture the core entities with their intrinsic attributes, while the five junction tables materialize the many-to-many relationships that the ontology prescribes. The fourteen views then reconstruct domain-meaningful facts by joining these tables back together, each view answering a specific question about the resource extraction domain. The design ensures that every extraction event can be traced back through its well to its parcel, its lease, and its governing statute—a complete audit trail from regulatory authority to physical measurement. The representative values in the data—statute `STA-2074` governing well `WEL-2588` on parcel `PAR-2364` under lease `LEA-2437` with event `EVE-2706` recording `21.45` barrels of `crude_oil`—demonstrate how the normalized tables, when joined through the view layer, reconstruct a coherent narrative of regulated resource extraction.