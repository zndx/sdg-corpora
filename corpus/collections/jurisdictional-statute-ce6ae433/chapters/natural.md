## Resource Extraction Governance and Land Tenure

The management of subsurface resource extraction requires a coordinated framework linking regulatory authority, physical infrastructure, land ownership, and commercial agreements. Operators drill wells across defined land parcels, each governed by jurisdictional statutes that establish the legal boundaries of permissible activity. Extraction events—measurements of volume, pressure, and fluid type—tie physical production to the wells that deliver it, while lease agreements formalize the financial relationships between lessors and lessees. This chapter describes the data structures that record these relationships, the intermediate mappings that connect them, and the analytical views that synthesize the full picture for practitioners who monitor compliance, production, and tenure.

At the foundation of the regulatory layer sit the jurisdictional statutes. These records define the legal instruments under which extraction activity is authorized, amended, or repealed.

**Table `jurisdictional_statutes`**

| id | statute_identifier | enactment_date | jurisdiction_name | status | subject_matter | jurisdictional_statute_id |
|---|---|---|---|---|---|---|
| 100 | STA-2074 | 2022-01-04 | Pilot Cluster | active | seasonal-subject-29 | 100 |
| 101 | STA-2078 | 2023-06-15 | Baseline Review | amended | regional-subject-30 | 101 |
| 102 | STA-2082 | 2024-11-26 | Distributed Initiative A | repealed | legacy-subject-31 | 102 |
| 103 | STA-2086 | 2025-04-10 | Adaptive Model | pending | compact-subject-32 | 103 |

Each statute carries a unique identifier such as STA-2074 or STA-2086, an enactment date, and a jurisdiction name ranging from Pilot Cluster to Adaptive Model. The status field tracks whether a statute is active, amended, repealed, or pending, while the subject_matter column categorizes its regulatory focus—seasonal-subject-29, regional-subject-30, legacy-subject-31, and compact-subject-32 appear in the current dataset. The self-referencing jurisdictional_statute_id column mirrors the primary key, enabling hierarchical or cross-referential statute relationships where one statute amends or supersedes another.

The physical infrastructure of extraction is captured in the extraction_wells table, which records every well drilled for resource recovery or injection.

**Table `extraction_wells`**

| id | well_identifier | completion_date | well_type | depth_meters | operator_name | status | land_parcel_id | extraction_well_id |
|---|---|---|---|---|---|---|---|---|
| 1 | WEL-2588 | 2024-03-14T02:06:00 | oil | 0.4 | Baseline Model D | active | 1000 | 1 |
| 2 | WEL-2590 | 2025-08-25T09:23:00 | gas | 0.01999998 | Distributed Cluster | plugged | 1001 | 2 |
| 3 | WEL-2592 | 2022-01-09T16:40:00 | water | 0.13 | Adaptive Review | abandoned | 1002 | 3 |
| 4 | WEL-2594 | 2023-06-20T23:57:00 | injection | 0.96 | Primary Initiative A | idle | 1003 | 4 |

Well identifiers such as WEL-2588 and WEL-2594 anchor each record, alongside the completion date, well type (oil, gas, water, or injection), and depth in meters. The operator_name column attributes each well to an operating entity—Baseline Model D, Distributed Cluster, Adaptive Review, and Primary Initiative A are the current operators. The status field reflects the operational state of the well, with values including active, plugged, abandoned, and idle. Each well is geographically anchored through its land_parcel_id, linking it to the surface parcel on which it sits. The extraction_well_id column serves as the primary key for downstream joins.

Land parcels form the spatial backbone of the extraction domain. The land_parcels table records the surface properties where wells are sited and leases are executed.

**Table `land_parcels`**

| land_parcel_id | parcel_identifier | county_name | state_name | total_area_acres | zoning_classification | surface_owner_name | jurisdictional_statute_id |
|---|---|---|---|---|---|---|---|
| 1000 | PAR-2364 | Extended Model | Composite Protocol | 11.70 | baseline-zoning-85 | Sarah Villanueva | 100 |
| 1001 | PAR-2368 | Pilot Cluster A | Compact Programme A | 16.40 | pilot-zoning-86 | Brian Hamilton | 101 |
| 1002 | PAR-2372 | Baseline Review | Legacy Standard | 21.10 | extended-zoning-87 | Elizabeth Woods | 102 |
| 1003 | PAR-2376 | Distributed Initiative | Regional Framework | 25.80 | integrated-zoning-88 | Jorge Sullivan | 103 |

Parcel identifiers such as PAR-2364 and PAR-2376 identify individual tracts, each associated with a county_name and state_name. The total_area_acres column quantifies parcel size, ranging from 11.70 acres for PAR-2364 to 25.80 acres for PAR-2376. Zoning classifications—baseline-zoning-85, pilot-zoning-86, extended-zoning-87, and integrated-zoning-88—encode the permitted use categories. The surface_owner_name column names the surface rights holder, from Sarah Villanueva to Jorge Sullivan. Each parcel is also linked to a jurisdictional_statute_id, establishing the regulatory framework that applies to activity on that land.

Production activity is recorded in the resource_extraction_events table, which logs individual measurement events at each well.

**Table `resource_extraction_events`**

| id | event_identifier | measurement_date_time | volume_barrels | volume_thousand_cubic_feet | pressure_p_s_i | fluid_type | extraction_well_id | land_parcel_id | jurisdictional_statute_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2023-06-16T05:39:00 | 21.45 | 6.20 | 3.45 | crude_oil | 1 | 1000 | 100 |
| 2 | EVE-2707 | 2024-11-27T12:56:00 | 24.90 | 9.40 | 5.90 | natural_gas | 2 | 1001 | 101 |
| 3 | EVE-2708 | 2025-04-11T19:13:00 | 28.35 | 12.60 | 8.35 | produced_water | 3 | 1002 | 102 |
| 4 | EVE-2709 | 2022-09-22T02:30:00 | 31.80 | 15.80 | 10.80 | mixed | 4 | 1003 | 103 |

Event identifiers such as EVE-2706 and EVE-2709 anchor each measurement, with a measurement_date_time stamp indicating when the reading was taken. The volume_barrels and volume_thousand_cubic_feet columns capture the extracted quantity in two units, while pressure_p_s_i records the downhole pressure at the time of measurement. The fluid_type column distinguishes between crude_oil, natural_gas, produced_water, and mixed fluids. Each event is linked to its source extraction_well_id and the land_parcel_id of the parcel where the well is located, and it references the jurisdictional_statute_id governing the activity.

Commercial relationships between surface owners and operators are formalized in the lease_agreements table.

**Table `lease_agreements`**

| lease_agreement_id | lease_identifier | effective_date | expiration_date | royalty_percentage | bonus_payment_amount | lessor_name | lessee_name | land_parcel_id | jurisdictional_statute_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | LEA-2437 | 2023-02-14 | 2025-08-18 | 1.70 | 1,862 | Compact Series | Primary Framework A | 1000 | 100 |
| 2 | LEA-2443 | 2024-07-25 | 2022-01-02 | 3.40 | 41,973 | Legacy Assessment | Composite Protocol | 1001 | 101 |
| 3 | LEA-2449 | 2025-12-09 | 2023-06-13 | 5.10 | 14.58 | Regional Survey A | Compact Programme | 1002 | 102 |
| 4 | LEA-2455 | 2022-05-20 | 2024-11-24 | 6.80 | 5,395 | Seasonal Corridor | Legacy Standard D | 1003 | 103 |

Lease identifiers such as LEA-2437 and LEA-2455 anchor each agreement, with effective_date and expiration_date defining the term. The royalty_percentage column records the percentage of production revenue owed to the lessor, ranging from 1.70 percent for LEA-2437 to 6.80 percent for LEA-2455. The bonus_payment_amount column captures upfront payments, with values such as 1,862 for LEA-2437 and 41,973 for LEA-2443. The lessor_name and lessee_name columns identify the parties to the agreement, while land_parcel_id and jurisdictional_statute_id tie the lease to its geographic and regulatory context.

Beyond these five core tables, three junction tables capture many-to-many relationships that arise when statutes, wells, and parcels are not bound by a single one-to-one mapping. The statutes_wells table links jurisdictional statutes to extraction wells, allowing a single statute to govern multiple wells and a single well to be subject to multiple statutes.

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

For example, statute 100 governs wells 1 and 2, while statute 103 governs wells 4 and 1. This cross-referencing reflects the reality that regulatory frameworks often overlap across well sites, and wells may be subject to multiple regulatory instruments over their lifecycle.

The wells_events table links extraction wells to resource extraction events, recording which wells produced which measurements.

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

Similarly, the parcels_wells table records the relationship between land parcels and the wells situated on them, and the parcels_agreements table links parcels to the lease agreements that govern activity on their surface.

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

The agreements_wells table completes the triad of junction tables by linking lease agreements to the extraction wells they cover, enabling queries that trace a lease from its lessor and lessee through the well it authorizes.

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

With these base tables and junction tables in place, the domain supports a suite of analytical views that join the data into actionable detail. Each view answers a specific operational question by combining records from multiple tables.

The view v_jurisdictional_statute_extraction_well_detail synthesizes statute records with the wells they govern through the statutes_wells junction table, producing a combined record that shows which wells fall under each statute's authority.

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

Reading the first row of this view, statute STA-2074 (id 100) governs well WEL-2588 (id 1), an active oil well operated by Baseline Model D. The second row shows the same statute governing well WEL-2590 (id 2), a gas well operated by Distributed Cluster that is currently plugged. This view answers the question of regulatory coverage: for any given statute, which wells are subject to its provisions?

The view v_jurisdictional_statute_jurisdictional_statute provides a self-join on the jurisdictional_statutes table, enabling the identification of statutes that reference or amend one another.

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

This view is particularly useful for tracing the evolution of regulatory frameworks. When a statute carries a status of amended or repealed, the self-referencing jurisdictional_statute_id column indicates which statute it modifies or replaces. Practitioners use this view to understand the lineage of regulatory requirements and to ensure that current operations comply with the most recent version of each statute.

The view v_extraction_well_land_parcel joins extraction wells to their parent land parcels, producing a combined record that shows each well alongside the parcel on which it is sited.

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

The first row of this view shows well WEL-2588 (id 1), an active oil well at a depth of 0.4 meters, situated on parcel PAR-2364 (id 1000) in Extended Model county, owned by Sarah Villanueva and zoned baseline-zoning-85. The second row shows well WEL-2590 (id 2), a plugged gas well at 0.02 meters depth, on parcel PAR-2368 (id 1001) in Pilot Cluster A county, owned by Brian Hamilton and zoned pilot-zoning-86. This view answers the question of spatial attribution: for any well, what is the full geographic and ownership context?

The view v_extraction_well_extraction_well performs a self-join on the extraction_wells table, enabling comparisons between wells and the identification of patterns such as wells operated by the same entity or wells of the same type on the same parcel.

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

This view supports operational analysis by allowing practitioners to group wells by operator_name, well_type, or status. For instance, comparing the active oil well WEL-2588 with the idle injection well WEL-2594 reveals the diversity of well types and operational states within the dataset.

The view v_extraction_well_resource_extraction_event_detail joins extraction wells to their associated resource extraction events, producing a combined record that shows each well alongside its production measurements.

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

The first row of this view shows well WEL-2588 (id 1) producing crude_oil in event EVE-2706, with a volume of 21.45 barrels and 6.20 thousand cubic feet at a pressure of 3.45 psi, measured on 2023-06-16. The second row shows well WEL-2590 (id 2) producing natural_gas in event EVE-2707, with a volume of 24.90 barrels and 9.40 thousand cubic feet at a pressure of 5.90 psi, measured on 2024-11-27. This view answers the question of production attribution: for any well, what has it produced, and under what conditions?

The view v_land_parcel_extraction_well_detail joins land parcels to the wells situated on them, producing a combined record that shows each parcel alongside its wells.

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

This view answers the question of parcel-level well inventory. For parcel PAR-2364 (id 1000), the view reveals well WEL-2588 (id 1), an active oil well. For parcel PAR-2368 (id 1001), it reveals well WEL-2590 (id 2), a plugged gas well. Practitioners use this view to assess the well density and operational diversity of each parcel.

The view v_land_parcel_lease_agreement_detail joins land parcels to the lease agreements that govern activity on their surface, producing a combined record that shows each parcel alongside its leases.

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

The first row of this view shows parcel PAR-2364 (id 1000) governed by lease LEA-2437 (id 1), with a royalty percentage of 1.70 and a bonus payment of 1,862, between lessor Compact Series and lessee Primary Framework A. The second row shows parcel PAR-2368 (id 1001) governed by lease LEA-2443 (id 2), with a royalty percentage of 3.40 and a bonus payment of 41,973, between lessor Legacy Assessment and lessee Composite Protocol. This view answers the question of lease attribution: for any parcel, what are the financial terms and parties governing its extraction activity?

The view v_land_parcel_jurisdictional_statute joins land parcels to the jurisdictional statutes that apply to them, producing a combined record that shows each parcel alongside its governing statute.

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

This view answers the question of regulatory applicability: for any parcel, which statute governs its surface and subsurface activity? The first row shows parcel PAR-2364 (id 1000) governed by statute STA-2074 (id 100) of the Pilot Cluster jurisdiction, which is active and covers seasonal-subject-29. The second row shows parcel PAR-2368 (id 1001) governed by statute STA-2078 (id 101) of the Baseline Review jurisdiction, which is amended and covers regional-subject-30.

The view v_resource_extraction_event_extraction_well joins resource extraction events to their source wells, producing a combined record that shows each event alongside the well that produced it.

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

The first row of this view shows event EVE-2706 (id 1), a crude_oil measurement of 21.45 barrels, produced by well WEL-2588 (id 1), an active oil well operated by Baseline Model D. The second row shows event EVE-2707 (id 2), a natural_gas measurement of 24.90 barrels, produced by well WEL-2590 (id 2), a plugged gas well operated by Distributed Cluster. This view answers the question of event-to-well attribution: for any extraction event, which well produced it, and what is the well's operational status?

The view v_resource_extraction_event_land_parcel joins resource extraction events to the land parcels where the producing wells are sited, producing a combined record that shows each event alongside its geographic context.

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

The first row of this view shows event EVE-2706 (id 1) occurring on parcel PAR-2364 (id 1000), owned by Sarah Villanueva in Extended Model county. The second row shows event EVE-2707 (id 2) occurring on parcel PAR-2368 (id 1001), owned by Brian Hamilton in Pilot Cluster A county. This view answers the question of event-level geography: for any extraction event, where on the surface did it occur, and who owns the land?

The view v_resource_extraction_event_jurisdictional_statute joins resource extraction events to the jurisdictional statutes that govern the activity, producing a combined record that shows each event alongside its regulatory framework.

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

The first row of this view shows event EVE-2706 (id 1) governed by statute STA-2074 (id 100) of the Pilot Cluster jurisdiction, which is active. The second row shows event EVE-2707 (id 2) governed by statute STA-2078 (id 101) of the Baseline Review jurisdiction, which is amended. This view answers the question of event-level compliance: for any extraction event, which statute applies, and is that statute currently in force?

The view v_lease_agreement_land_parcel joins lease agreements to the land parcels they govern, producing a combined record that shows each lease alongside its parcel.

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

The first row of this view shows lease LEA-2437 (id 1) governing parcel PAR-2364 (id 1000), with a royalty of 1.70 percent and a bonus payment of 1,862. The second row shows lease LEA-2443 (id 2) governing parcel PAR-2368 (id 1001), with a royalty of 3.40 percent and a bonus payment of 41,973. This view answers the question of lease-to-parcel mapping: for any lease, which parcel does it cover, and what are the financial terms?

The view v_lease_agreement_extraction_well_detail joins lease agreements to the extraction wells they authorize, producing a combined record that shows each lease alongside the wells it covers.

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

This view answers the question of lease-to-well authorization: for any lease, which wells does it authorize, and what is the operational status of those wells? The first row shows lease LEA-2437 (id 1) authorizing well WEL-2588 (id 1), an active oil well. The second row shows lease LEA-2443 (id 2) authorizing well WEL-2590 (id 2), a plugged gas well. Practitioners use this view to verify that wells are operating under valid lease terms.

The view v_lease_agreement_jurisdictional_statute joins lease agreements to the jurisdictional statutes that govern them, producing a combined record that shows each lease alongside its regulatory framework.

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

The first row of this view shows lease LEA-2437 (id 1) governed by statute STA-2074 (id 100) of the Pilot Cluster jurisdiction, which is active. The second row shows lease LEA-2443 (id 2) governed by statute STA-2078 (id 101) of the Baseline Review jurisdiction, which is amended. This view answers the question of lease-level regulatory compliance: for any lease, which statute applies, and is that statute currently in force?

The extraction governance domain is defined by the interlocking relationships between statutes, wells, parcels, events, and leases. No single table captures the full picture; instead, the junction tables and analytical views synthesize the data into actionable records. Practitioners who monitor compliance rely on views like v_resource_extraction_event_jurisdictional_statute to verify that each extraction event falls under an active statute. Operators who manage production use views like v_extraction_well_resource_extraction_event_detail to track the output of each well. Land managers who oversee tenure rely on views like v_land_parcel_lease_agreement_detail to ensure that every parcel has a valid lease in place. The data structures described in this chapter provide the foundation for these operations, linking regulatory authority to physical infrastructure, spatial ownership to commercial agreements, and individual measurements to the wells and parcels that produce them.