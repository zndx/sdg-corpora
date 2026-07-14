## Observatories, Telescopes, and the Governance of Astronomical Research

Modern astronomical research depends on a complex ecosystem of physical infrastructure, scientific instrumentation, coordinated observation campaigns, and the administrative and financial structures that sustain them. An observatory facility provides the land, buildings, and environmental conditions necessary for ground-based astronomy. Within each facility, telescopes serve as the primary instruments, each configured for specific observation modes and linked to broader survey programs. These surveys, in turn, are managed by organizations that negotiate agreements with funding agencies and land owners. Understanding how these entities interconnect is essential for anyone involved in planning, operating, or auditing astronomical research programs.

The foundation of this ecosystem is the observatory facility itself. Each facility occupies a defined parcel of land, carries a unique identifier, and exists in a particular operational state.

**Table `observatory_facilities`**

| id | facility_id | facility_name | location | land_area_acres | land_ownership_type | operational_status | established_date | managing_organization_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 4.95 | government_owned | active | 2024-03-27 | 1 |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 7.90 | leased | inactive | 2025-08-11 | 2 |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 10.85 | association_owned | planned | 2022-01-22 | 3 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 13.80 | government_owned | active | 2023-06-06 | 4 |

Consider the facility with identifier 1000, known as Integrated Protocol A, located at extended-location-99. It spans 4.95 acres under government ownership and has been active since March 2024, managed by organization 1. By contrast, facility 1001, Extended Programme, sits on 7.90 leased acres at integrated-location-100 and is currently inactive as of August 2025. Facility 1002, Pilot Standard, occupies 10.85 association-owned acres at seasonal-location-101 and remains in a planned state since January 2022. The fourth facility, Baseline Framework D, covers 13.80 government-owned acres at regional-location-102 and has been active since June 2023. The land ownership types—government_owned, leased, and association_owned—reflect the diverse legal arrangements under which observatory land is held.

Telescopes represent the scientific instruments deployed at these facilities. Each telescope carries a distinct aperture, a classification, a primary instrument, and an observation mode that determines the portion of the electromagnetic spectrum it targets.

**Table `telescopes`**

| id | telescope_id | telescope_name | aperture_meters | telescope_class | primary_instrument | observation_mode | community_access_percentage | funding_consortium | observatory_facility_id | astronomical_survey_id | managing_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | mike1452 | Adaptive Assessment | 1.70 | extended-telescop-33 | legacy-primary-79 | optical | 10.95 | regional-funding-66 | 1000 | 1 | 1 |
| 101 | 7441142 | Primary Survey | 3.40 | integrated-telescop-34 | compact-primary-80 | infrared | 14.90 | legacy-funding-67 | 1001 | 2 | 2 |
| 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D | 5.10 | seasonal-telescop-35 | composite-primary-81 | radio | 18.85 | compact-funding-68 | 1002 | 3 | 3 |
| 103 | 10207145 | Compact Series | 6.80 | regional-telescop-36 | primary-primary-82 | optical | 22.80 | composite-funding-69 | 1003 | 4 | 4 |

Telescope 100, named mike1452, is the Adaptive Assessment instrument with a 1.70-meter aperture. Classified as extended-telescop-33, it operates in optical mode and carries the legacy-primary-79 instrument. It is assigned to facility 1000, participates in survey 1, and is managed by organization 1. Its community access percentage stands at 10.95, and its funding consortium is regional-funding-66. Telescope 101, the Primary Survey, boasts a 3.40-meter aperture, operates in infrared mode with the compact-primary-80 instrument, and is located at facility 1001 under survey 2 and organization 2. Telescope 102, Composite Corridor D, has a 5.10-meter aperture, uses radio observation mode with the composite-primary-81 instrument, and resides at facility 1002 under survey 3 and organization 3. Telescope 103, Compact Series, carries the largest aperture at 6.80 meters, operates in optical mode with the primary-primary-82 instrument, and is stationed at facility 1003 under survey 4 and organization 4. The community access percentages range from 10.95 to 22.80, indicating varying degrees of open access for external researchers.

Astronomical surveys are the coordinated observation campaigns that telescopes support. Each survey has a defined time window, an allocation of observing nights per year, a primary scientific objective, and a status reflecting its progress.

**Table `astronomical_surveys`**

| astronomical_survey_id | survey_id | survey_name | start_date | end_date | nights_allocated_per_year | primary_objective | status | telescope_id | funding_agency_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | Composite Protocol | 2022-09-05 | 2022-09-01 | 21 | primary-primary-58 | planned | 100 | 1 |
| 2 | 726059 | Compact Programme A | 2023-02-16 | 2023-02-12 | 31 | adaptive-primary-59 | active | 101 | 2 |
| 3 | 32814 | Legacy Standard | 2024-07-27 | 2024-07-23 | 41 | distributed-primary-60 | completed | 102 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | 2025-12-11 | 2025-12-07 | 51 | baseline-primary-61 | planned | 103 | 4 |

Survey 1, the Composite Protocol, ran from September 5 to September 1, 2022, with 21 nights allocated per year and the primary-primary-58 objective. It is in a planned state and is associated with telescope 100 and funding agency 1. Survey 2, Compact Programme A, spans February 16 to February 12, 2023, allocates 31 nights per year, pursues the adaptive-primary-59 objective, is active, and links to telescope 101 and funding agency 2. Survey 3, Legacy Standard, covers July 27 to July 23, 2024, with 41 nights allocated, the distributed-primary-60 objective, a completed status, and connections to telescope 102 and funding agency 3. Survey 4, Regional Framework, is scheduled for December 11 to December 7, 2025, allocates 51 nights per year, targets the baseline-primary-61 objective, remains planned, and connects to telescope 103 and funding agency 4. The progression of allocated nights—from 21 to 51—suggests an expansion in observational capacity over time.

Managing organizations serve as the administrative backbone of the observatory network. Each organization has a name, a type, an agreement period, an oversight level, and a conflict-of-interest disclosure flag.

**Table `managing_organizations`**

| id | org_id | org_name | org_type | agreement_start_date | agreement_end_date | oversight_level | conflict_of_interest_disclosure | funding_agency_id | land_owner_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | academic | 2025-04-16 | 2024-07-08 | full | false | 1 | 1 |
| 2 | 1717 | Pilot Initiative A | not_for_profit | 2022-09-27 | 2025-12-19 | partial | true | 2 | 2 |
| 3 | 69437 | Baseline Model | industrial | 2023-02-11 | 2022-05-03 | none | false | 3 | 3 |
| 4 | m16 | Distributed Cluster | consortium | 2024-07-22 | 2023-10-14 | full | true | 4 | 4 |

Organization 1, Extended Review, is an academic entity with full oversight. Its agreement runs from April 16, 2025, to July 8, 2024, and it has not disclosed a conflict of interest. It is linked to funding agency 1 and land owner 1. Organization 2, Pilot Initiative A, is a not-for-profit with partial oversight, an agreement from September 27, 2022, to December 19, 2025, and has disclosed a conflict of interest. It connects to funding agency 2 and land owner 2. Organization 3, Baseline Model, is an industrial entity with no oversight, an agreement from February 11, 2023, to May 3, 2022, and no conflict disclosure. It is tied to funding agency 3 and land owner 3. Organization 4, Distributed Cluster, is a consortium with full oversight, an agreement from July 22, 2024, to October 14, 2023, and has disclosed a conflict of interest. It links to funding agency 4 and land owner 4. The oversight levels—full, partial, and none—indicate the degree of administrative control each organization exercises.

Funding agencies provide the financial resources that sustain both managing organizations and the facilities they oversee. Each agency has a name, a type, a division, a program code, and a defined oversight responsibility.

**Table `funding_agencies`**

| id | agency_id | agency_name | agency_type | division | program_code | oversight_responsibility |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | federal | integrated-division-16 | 191 | technical |
| 2 | Nikola Corporation | Whirlpool Corporation | state | seasonal-division-17 | 1186082 | programmatic |
| 3 | Oberthur Technologies | Education Writers Association | international | regional-division-18 | 3990187 | financial |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | federal | legacy-division-19 | flexible-thinking | administrative |

Agency 1, FSG Social Impact Advisors, is a federal entity in the integrated-division-16, operating under program code 191 with technical oversight responsibility. Agency 2, Whirlpool Corporation, is a state entity in seasonal-division-17, under program code 1186082 with programmatic oversight. Agency 3, Education Writers Association, is an international entity in regional-division-18, under program code 3990187 with financial oversight. Agency 4, Switch Card Services Ltd., is a federal entity in legacy-division-19, under program code flexible-thinking with administrative oversight. The diversity of agency types—federal, state, and international—reflects the multi-tiered funding landscape.

Land owners hold the legal title to the parcels on which observatory facilities are built. Each land owner has a name, a type, a land area, a lease rate, and a lease purpose restriction.

**Table `land_owners`**

| id | owner_id | owner_name | owner_type | land_area_acres | lease_rate_per_year | lease_purpose_restriction | managing_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Craig Childs | government | 4.95 | 2.70 | pilot-lease-74 | 1 |
| 2 | Kerry West | Kimberly Smith | indigenous_nation | 7.90 | 4.40 | extended-lease-75 | 2 |
| 3 | Peter Montgomery | Michelle Kelley | association | 10.85 | 6.10 | integrated-lease-76 | 3 |
| 4 | Susan Wagner | Jorge Sullivan | private | 13.80 | 7.80 | seasonal-lease-77 | 4 |

Land owner 1, Brian Hamilton, is a government entity holding 4.95 acres at a lease rate of 2.70 per year under the pilot-lease-74 restriction, managed by organization 1. Land owner 2, Kerry West, is an indigenous nation holding 7.90 acres at 4.40 per year under extended-lease-75, managed by organization 2. Land owner 3, Peter Montgomery, is an association holding 10.85 acres at 6.10 per year under integrated-lease-76, managed by organization 3. Land owner 4, Susan Wagner, is a private entity holding 13.80 acres at 7.80 per year under seasonal-lease-77, managed by organization 4. The lease rates increase with land area, ranging from 2.70 to 7.80 per year, and the owner types span government, indigenous nation, association, and private categories.

The relationship between facilities and telescopes is captured in a dedicated junction table, recording which telescopes are deployed at which facilities.

**Table `facilities_telescopes`**

| observatory_facility_id | telescope_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

This table establishes the physical placement of each telescope within an observatory facility. Telescope 100 is deployed at facility 1000, telescope 101 at facility 1001, telescope 102 at facility 1002, and telescope 103 at facility 1003. Each facility hosts exactly one telescope in the current dataset, forming a one-to-one mapping between facilities and their primary instruments.

The relationship between managing organizations and facilities is recorded in a separate junction table, documenting which organization administers which facility.

**Table `organizations_facilities`**

| managing_organization_id | observatory_facility_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

This table links each managing organization to the facility it oversees. Organization 1 manages facility 1000, organization 2 manages facility 1001, organization 3 manages facility 1002, and organization 4 manages facility 1003. The one-to-one mapping here mirrors the facility-telescope relationship, indicating a tightly coupled administrative structure where each facility has a single designated managing organization.

Funding agencies and managing organizations are connected through a junction table that records which agency funds which organization.

**Table `agencies_organizations`**

| funding_agency_id | managing_organization_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table establishes the financial sponsorship chain. Funding agency 1 sponsors managing organization 1, agency 2 sponsors organization 2, agency 3 sponsors organization 3, and agency 4 sponsors organization 4. Each managing organization receives funding from exactly one agency, creating a clear line of financial accountability from the funding source to the administrative body.

The relationship between funding agencies and facilities is also directly recorded, providing an alternative view of financial responsibility.

**Table `agencies_facilities`**

| funding_agency_id | observatory_facility_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

This table links funding agencies directly to the facilities they support. Agency 1 funds facility 1000, agency 2 funds facility 1001, agency 3 funds facility 1002, and agency 4 funds facility 1003. This direct linkage bypasses the managing organization layer, offering a streamlined view of which financial entity underwrites which physical infrastructure.

Land owners and facilities are connected through a junction table that records which owner holds the title to which facility's land.

**Table `owners_facilities`**

| land_owner_id | observatory_facility_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

This table documents the land tenure arrangement. Land owner 1 holds the title to facility 1000, owner 2 to facility 1001, owner 3 to facility 1002, and owner 4 to facility 1003. As with the other junction tables, the mapping is one-to-one, ensuring that each facility has a single, unambiguous land owner.

The view vw_observatory_facility_telescope_detail joins facility and telescope records to provide a comprehensive profile of each facility-instrument pairing.

**View `vw_observatory_facility_telescope_detail`**

```sql
CREATE VIEW vw_observatory_facility_telescope_detail AS
SELECT a.id, a.facility_id, a.facility_name, b.id AS telescope_id, b.telescope_id AS telescope_telescope_id, b.telescope_name AS telescope_telescope_name
FROM observatory_facilities a
  JOIN facilities_telescopes j ON j.observatory_facility_id = a.id
  JOIN telescopes b ON b.id = j.telescope_id;
```

| id | facility_id | facility_name | telescope_id | telescope_telescope_id | telescope_telescope_name |
|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | 100 | mike1452 | Adaptive Assessment |
| 1000 | 69447 | Integrated Protocol A | 101 | 7441142 | Primary Survey |
| 1001 | 1040 | Extended Programme | 101 | 7441142 | Primary Survey |
| 1001 | 1040 | Extended Programme | 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D |
| 1002 | 2986228 | Pilot Standard | 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D |
| 1002 | 2986228 | Pilot Standard | 103 | 10207145 | Compact Series |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 103 | 10207145 | Compact Series |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 100 | mike1452 | Adaptive Assessment |

This view answers the question: what telescope is deployed at each observatory facility, and what are the combined specifications? For the row corresponding to facility 1000 (Integrated Protocol A), the view reveals that telescope mike1452, with a 1.70-meter aperture operating in optical mode, is stationed there. The telescope participates in survey 1 and is managed by organization 1. For facility 1003 (Baseline Framework D), the view shows telescope 10207145 (Compact Series) with a 6.80-meter aperture in optical mode, linked to survey 4 and organization 4. This view is essential for facility managers who need to understand the full instrument profile at their site.

The view vw_observatory_facility_managing_organization joins facility records with their managing organizations to clarify administrative responsibility.

**View `vw_observatory_facility_managing_organization`**

```sql
CREATE VIEW vw_observatory_facility_managing_organization AS
SELECT a.id, a.facility_id, a.facility_name, a.location, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM observatory_facilities a JOIN managing_organizations b ON a.managing_organization_id = b.id;
```

| id | facility_id | facility_name | location | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 1 | 790471 | Extended Review |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 2 | 1717 | Pilot Initiative A |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 3 | 69437 | Baseline Model |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 4 | m16 | Distributed Cluster |

This view answers: which organization manages each facility, and what are the terms of that management? For facility 1000, the view shows that Extended Review (an academic organization with full oversight) manages the site, with an agreement period from April 16, 2025, to July 8, 2024, and no conflict-of-interest disclosure. For facility 1001, Pilot Initiative A (a not-for-profit with partial oversight) is the managing organization, with a disclosed conflict of interest and an agreement running from September 27, 2022, to December 19, 2025. This view supports governance audits and contract management.

The view vw_telescope_observatory_facility joins telescope records with their host facilities to provide an instrument-centric perspective.

**View `vw_telescope_observatory_facility`**

```sql
CREATE VIEW vw_telescope_observatory_facility AS
SELECT a.id, a.telescope_id, a.telescope_name, a.aperture_meters, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM telescopes a JOIN observatory_facilities b ON a.observatory_facility_id = b.id;
```

| id | telescope_id | telescope_name | aperture_meters | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 100 | mike1452 | Adaptive Assessment | 1.70 | 1000 | 69447 | Integrated Protocol A |
| 101 | 7441142 | Primary Survey | 3.40 | 1001 | 1040 | Extended Programme |
| 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D | 5.10 | 1002 | 2986228 | Pilot Standard |
| 103 | 10207145 | Compact Series | 6.80 | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view answers: at which facility is each telescope located, and what are the facility's characteristics? For telescope 100 (Adaptive Assessment), the view shows it is housed at facility 1000 (Integrated Protocol A), which spans 4.95 acres under government ownership and is active. For telescope 102 (Composite Corridor D), the view places it at facility 1002 (Pilot Standard), a seasonal-location site of 10.85 association-owned acres in a planned state. This view is useful for instrument planners who need to assess the environmental and operational context of each telescope.

The view vw_telescope_astronomical_survey joins telescope records with their associated surveys to clarify scientific objectives.

**View `vw_telescope_astronomical_survey`**

```sql
CREATE VIEW vw_telescope_astronomical_survey AS
SELECT a.id, a.telescope_id, a.telescope_name, a.aperture_meters, b.astronomical_survey_id AS survey_astronomical_survey_id, b.survey_id AS survey_survey_id, b.survey_name AS survey_survey_name
FROM telescopes a JOIN astronomical_surveys b ON a.astronomical_survey_id = b.astronomical_survey_id;
```

| id | telescope_id | telescope_name | aperture_meters | survey_astronomical_survey_id | survey_survey_id | survey_survey_name |
|---|---|---|---|---|---|---|
| 100 | mike1452 | Adaptive Assessment | 1.70 | 1 | 21005921 | Composite Protocol |
| 101 | 7441142 | Primary Survey | 3.40 | 2 | 726059 | Compact Programme A |
| 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D | 5.10 | 3 | 32814 | Legacy Standard |
| 103 | 10207145 | Compact Series | 6.80 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

This view answers: which survey does each telescope support, and what are the survey's parameters? For telescope 100, the view shows it supports survey 1 (Composite Protocol), which allocated 21 nights per year, pursued the primary-primary-58 objective, and is in a planned state. For telescope 103, the view links it to survey 4 (Regional Framework), which allocated 51 nights per year, targets the baseline-primary-61 objective, and remains planned. This view helps survey coordinators understand the instrument resources available for each campaign.

The view vw_telescope_managing_organization joins telescope records with their managing organizations to trace administrative oversight from instrument to organization.

**View `vw_telescope_managing_organization`**

```sql
CREATE VIEW vw_telescope_managing_organization AS
SELECT a.id, a.telescope_id, a.telescope_name, a.aperture_meters, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM telescopes a JOIN managing_organizations b ON a.managing_organization_id = b.id;
```

| id | telescope_id | telescope_name | aperture_meters | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | mike1452 | Adaptive Assessment | 1.70 | 1 | 790471 | Extended Review |
| 101 | 7441142 | Primary Survey | 3.40 | 2 | 1717 | Pilot Initiative A |
| 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D | 5.10 | 3 | 69437 | Baseline Model |
| 103 | 10207145 | Compact Series | 6.80 | 4 | m16 | Distributed Cluster |

This view answers: which organization is responsible for managing each telescope? For telescope 100, the view shows organization 1 (Extended Review, academic, full oversight) is the managing body. For telescope 102, the view shows organization 3 (Baseline Model, industrial, no oversight) is responsible. This view is critical for accountability, as it links the scientific instrument directly to the administrative entity overseeing its operations.

The view vw_astronomical_survey_telescope joins survey records with their associated telescopes to provide a survey-centric instrument inventory.

**View `vw_astronomical_survey_telescope`**

```sql
CREATE VIEW vw_astronomical_survey_telescope AS
SELECT a.astronomical_survey_id, a.survey_id, a.survey_name, a.start_date, b.id AS telescope_id, b.telescope_id AS telescope_telescope_id, b.telescope_name AS telescope_telescope_name
FROM astronomical_surveys a JOIN telescopes b ON a.telescope_id = b.id;
```

| astronomical_survey_id | survey_id | survey_name | start_date | telescope_id | telescope_telescope_id | telescope_telescope_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | Composite Protocol | 2022-09-05 | 100 | mike1452 | Adaptive Assessment |
| 2 | 726059 | Compact Programme A | 2023-02-16 | 101 | 7441142 | Primary Survey |
| 3 | 32814 | Legacy Standard | 2024-07-27 | 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | 2025-12-11 | 103 | 10207145 | Compact Series |

This view answers: which telescopes are assigned to each survey, and what are their specifications? For survey 1 (Composite Protocol), the view shows telescope 100 (Adaptive Assessment) with a 1.70-meter aperture in optical mode. For survey 3 (Legacy Standard), the view links it to telescope 102 (Composite Corridor D) with a 5.10-meter aperture in radio mode. This view supports survey planning by revealing the instrument capabilities available for each campaign.

The view vw_astronomical_survey_funding_agency joins survey records with their funding agencies to trace financial sponsorship of observation campaigns.

**View `vw_astronomical_survey_funding_agency`**

```sql
CREATE VIEW vw_astronomical_survey_funding_agency AS
SELECT a.astronomical_survey_id, a.survey_id, a.survey_name, a.start_date, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM astronomical_surveys a JOIN funding_agencies b ON a.funding_agency_id = b.id;
```

| astronomical_survey_id | survey_id | survey_name | start_date | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | Composite Protocol | 2022-09-05 | 1 | U.S. Steel | FSG Social Impact Advisors |
| 2 | 726059 | Compact Programme A | 2023-02-16 | 2 | Nikola Corporation | Whirlpool Corporation |
| 3 | 32814 | Legacy Standard | 2024-07-27 | 3 | Oberthur Technologies | Education Writers Association |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | 2025-12-11 | 4 | General Telephone & Electronics | Switch Card Services Ltd. |

This view answers: which funding agency underwrites each astronomical survey? For survey 1 (Composite Protocol), the view shows funding agency 1 (FSG Social Impact Advisors, federal, technical oversight). For survey 4 (Regional Framework), the view links it to funding agency 4 (Switch Card Services Ltd., federal, administrative oversight). This view is essential for financial reporting and budget reconciliation.

The view vw_managing_organization_observatory_facility_detail joins managing organizations with their facilities to provide an organization-centric facility portfolio.

**View `vw_managing_organization_observatory_facility_detail`**

```sql
CREATE VIEW vw_managing_organization_observatory_facility_detail AS
SELECT a.id, a.org_id, a.org_name, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM managing_organizations a
  JOIN organizations_facilities j ON j.managing_organization_id = a.id
  JOIN observatory_facilities b ON b.id = j.observatory_facility_id;
```

| id | org_id | org_name | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 1000 | 69447 | Integrated Protocol A |
| 1 | 790471 | Extended Review | 1001 | 1040 | Extended Programme |
| 2 | 1717 | Pilot Initiative A | 1001 | 1040 | Extended Programme |
| 2 | 1717 | Pilot Initiative A | 1002 | 2986228 | Pilot Standard |
| 3 | 69437 | Baseline Model | 1002 | 2986228 | Pilot Standard |
| 3 | 69437 | Baseline Model | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | m16 | Distributed Cluster | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | m16 | Distributed Cluster | 1000 | 69447 | Integrated Protocol A |

This view answers: which facilities does each managing organization oversee, and what are the facility characteristics? For organization 1 (Extended Review), the view shows it manages facility 1000 (Integrated Protocol A), a 4.95-acre government-owned active site. For organization 4 (Distributed Cluster), the view shows it manages facility 1003 (Baseline Framework D), a 13.80-acre government-owned active site. This view supports organizational capacity planning and resource allocation.

The view vw_managing_organization_funding_agency joins managing organizations with their funding agencies to clarify the financial sponsorship chain.

**View `vw_managing_organization_funding_agency`**

```sql
CREATE VIEW vw_managing_organization_funding_agency AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM managing_organizations a JOIN funding_agencies b ON a.funding_agency_id = b.id;
```

| id | org_id | org_name | org_type | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | academic | 1 | U.S. Steel | FSG Social Impact Advisors |
| 2 | 1717 | Pilot Initiative A | not_for_profit | 2 | Nikola Corporation | Whirlpool Corporation |
| 3 | 69437 | Baseline Model | industrial | 3 | Oberthur Technologies | Education Writers Association |
| 4 | m16 | Distributed Cluster | consortium | 4 | General Telephone & Electronics | Switch Card Services Ltd. |

This view answers: which funding agency sponsors each managing organization? For organization 1 (Extended Review), the view shows funding agency 1 (FSG Social Impact Advisors, federal, technical oversight). For organization 3 (Baseline Model), the view links it to funding agency 3 (Education Writers Association, international, financial oversight). This view is vital for understanding the flow of funds from agency to organization.

The view vw_managing_organization_land_owner joins managing organizations with their land owners to document land tenure arrangements from the organization's perspective.

**View `vw_managing_organization_land_owner`**

```sql
CREATE VIEW vw_managing_organization_land_owner AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.id AS owner_id, b.owner_id AS owner_owner_id, b.owner_name AS owner_owner_name
FROM managing_organizations a JOIN land_owners b ON a.land_owner_id = b.id;
```

| id | org_id | org_name | org_type | owner_id | owner_owner_id | owner_owner_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | academic | 1 | Brian Hamilton | Craig Childs |
| 2 | 1717 | Pilot Initiative A | not_for_profit | 2 | Kerry West | Kimberly Smith |
| 3 | 69437 | Baseline Model | industrial | 3 | Peter Montgomery | Michelle Kelley |
| 4 | m16 | Distributed Cluster | consortium | 4 | Susan Wagner | Jorge Sullivan |

This view answers: which land owner is associated with each managing organization? For organization 1 (Extended Review), the view shows land owner 1 (Brian Hamilton, government, 4.95 acres at 2.70 per year). For organization 4 (Distributed Cluster), the view links it to land owner 4 (Susan Wagner, private, 13.80 acres at 7.80 per year). This view supports lease management and land-use compliance.

The view vw_funding_agency_managing_organization_detail joins funding agencies with their managed organizations to provide an agency-centric sponsorship portfolio.

**View `vw_funding_agency_managing_organization_detail`**

```sql
CREATE VIEW vw_funding_agency_managing_organization_detail AS
SELECT a.id, a.agency_id, a.agency_name, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM funding_agencies a
  JOIN agencies_organizations j ON j.funding_agency_id = a.id
  JOIN managing_organizations b ON b.id = j.managing_organization_id;
```

| id | agency_id | agency_name | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | 1 | 790471 | Extended Review |
| 1 | U.S. Steel | FSG Social Impact Advisors | 2 | 1717 | Pilot Initiative A |
| 2 | Nikola Corporation | Whirlpool Corporation | 2 | 1717 | Pilot Initiative A |
| 2 | Nikola Corporation | Whirlpool Corporation | 3 | 69437 | Baseline Model |
| 3 | Oberthur Technologies | Education Writers Association | 3 | 69437 | Baseline Model |
| 3 | Oberthur Technologies | Education Writers Association | 4 | m16 | Distributed Cluster |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | 4 | m16 | Distributed Cluster |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | 1 | 790471 | Extended Review |

This view answers: which managing organizations does each funding agency sponsor, and what are the organizational characteristics? For agency 1 (FSG Social Impact Advisors), the view shows it sponsors organization 1 (Extended Review, academic, full oversight). For agency 4 (Switch Card Services Ltd.), the view links it to organization 4 (Distributed Cluster, consortium, full oversight). This view helps funding agencies monitor their portfolio of sponsored organizations.

The view vw_funding_agency_observatory_facility_detail joins funding agencies with the facilities they fund to provide an agency-centric infrastructure portfolio.

**View `vw_funding_agency_observatory_facility_detail`**

```sql
CREATE VIEW vw_funding_agency_observatory_facility_detail AS
SELECT a.id, a.agency_id, a.agency_name, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM funding_agencies a
  JOIN agencies_facilities j ON j.funding_agency_id = a.id
  JOIN observatory_facilities b ON b.id = j.observatory_facility_id;
```

| id | agency_id | agency_name | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | 1000 | 69447 | Integrated Protocol A |
| 1 | U.S. Steel | FSG Social Impact Advisors | 1001 | 1040 | Extended Programme |
| 2 | Nikola Corporation | Whirlpool Corporation | 1001 | 1040 | Extended Programme |
| 2 | Nikola Corporation | Whirlpool Corporation | 1002 | 2986228 | Pilot Standard |
| 3 | Oberthur Technologies | Education Writers Association | 1002 | 2986228 | Pilot Standard |
| 3 | Oberthur Technologies | Education Writers Association | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | 1000 | 69447 | Integrated Protocol A |

This view answers: which facilities does each funding agency support, and what are their operational characteristics? For agency 1 (FSG Social Impact Advisors), the view shows it funds facility 1000 (Integrated Protocol A), an active government-owned site of 4.95 acres. For agency 3 (Education Writers Association), the view links it to facility 1002 (Pilot Standard), a planned association-owned site of 10.85 acres. This view is essential for agencies evaluating the impact of their financial contributions.

The view vw_land_owner_managing_organization joins land owners with their managing organizations to document the administrative relationships governing land use.

**View `vw_land_owner_managing_organization`**

```sql
CREATE VIEW vw_land_owner_managing_organization AS
SELECT a.id, a.owner_id, a.owner_name, a.owner_type, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM land_owners a JOIN managing_organizations b ON a.managing_organization_id = b.id;
```

| id | owner_id | owner_name | owner_type | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Craig Childs | government | 1 | 790471 | Extended Review |
| 2 | Kerry West | Kimberly Smith | indigenous_nation | 2 | 1717 | Pilot Initiative A |
| 3 | Peter Montgomery | Michelle Kelley | association | 3 | 69437 | Baseline Model |
| 4 | Susan Wagner | Jorge Sullivan | private | 4 | m16 | Distributed Cluster |

This view answers: which managing organization administers the land held by each land owner? For land owner 1 (Brian Hamilton, government), the view shows organization 1 (Extended Review, academic) as the administering body. For land owner 3 (Peter Montgomery, association), the view links it to organization 3 (Baseline Model, industrial). This view supports lease administration and land-use coordination.

The view vw_land_owner_observatory_facility_detail joins land owners with the facilities built on their land to provide a land-owner-centric infrastructure inventory.

**View `vw_land_owner_observatory_facility_detail`**

```sql
CREATE VIEW vw_land_owner_observatory_facility_detail AS
SELECT a.id, a.owner_id, a.owner_name, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM land_owners a
  JOIN owners_facilities j ON j.land_owner_id = a.id
  JOIN observatory_facilities b ON b.id = j.observatory_facility_id;
```

| id | owner_id | owner_name | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| 1 | Brian Hamilton | Craig Childs | 1000 | 69447 | Integrated Protocol A |
| 1 | Brian Hamilton | Craig Childs | 1001 | 1040 | Extended Programme |
| 2 | Kerry West | Kimberly Smith | 1001 | 1040 | Extended Programme |
| 2 | Kerry West | Kimberly Smith | 1002 | 2986228 | Pilot Standard |
| 3 | Peter Montgomery | Michelle Kelley | 1002 | 2986228 | Pilot Standard |
| 3 | Peter Montgomery | Michelle Kelley | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | Susan Wagner | Jorge Sullivan | 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | Susan Wagner | Jorge Sullivan | 1000 | 69447 | Integrated Protocol A |

This view answers: which facilities are built on the land held by each land owner, and what are their characteristics? For land owner 1 (Brian Hamilton), the view shows facility 1000 (Integrated Protocol A), an active government-owned site of 4.95 acres. For land owner 4 (Susan Wagner), the view links it to facility 1003 (Baseline Framework D), an active government-owned site of 13.80 acres. This view is critical for land owners assessing the use and value of their property.

The observatory ecosystem described here—spanning physical facilities, scientific instruments, observation campaigns, administrative organizations, financial sponsors, and land tenure arrangements—forms a tightly integrated network. Each entity is connected through explicit relationships that can be queried through the provided views, enabling stakeholders at every level to trace responsibility, track resources, and plan operations. The one-to-one mappings observed in the current dataset suggest a streamlined operational model, though the underlying structure supports more complex many-to-many relationships as the network expands. Understanding these relationships is fundamental to effective governance, financial accountability, and scientific productivity in ground-based astronomy.