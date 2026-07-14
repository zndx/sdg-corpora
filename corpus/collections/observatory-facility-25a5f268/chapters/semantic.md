## Ontology-Grounded Relational Modelling in the Observatory Domain

The observatory domain captures the interlocking relationships between physical infrastructure, scientific instruments, research programmes, and the organisational and financial ecosystems that sustain them. At its core, the domain revolves around six entity types: observatory facilities (physical sites), telescopes (instruments), astronomical surveys (research programmes), managing organisations (administrative bodies), funding agencies (financial sponsors), and land owners (property holders). Each entity type materialises as a base table whose columns encode both identifying attributes and cardinality-bounded relationships. The relational schema further decomposes many-to-many associations into junction tables, and reconstructs domain facts through a suite of twelve join views. This chapter walks through the modelling decisions, the column-level anatomy of each table, and the join logic that every view employs to answer a specific domain question.

### Base Tables and Entity Anatomy

The foundation of the schema consists of six base tables, each representing a distinct class in the underlying ontology. The `observatory_facilities` table stores physical site records. Its primary key `id` is a surrogate integer (1000–1003 in the sample), while `facility_id` carries a natural identifier that may be numeric, alphanumeric, or a UUID-like string such as `ChIJvSxSbfdv5kcRanVzI8RRu20`. The column `facility_name` holds descriptive labels like "Integrated Protocol A" or "Baseline Framework D". Location is captured in `location` with values such as `extended-location-99` and `regional-location-102`. The land footprint is recorded as `land_area_acres` (4.95 to 13.80 acres), `land_ownership_type` encodes the tenure model as a categorical string (`government_owned`, `leased`, `association_owned`), and `operational_status` tracks lifecycle state (`active`, `inactive`, `planned`). The `established_date` column stores the site commissioning date, and `managing_organization_id` is a foreign key pointing to the `managing_organizations` table, establishing a cardinality-bounded one-to-many relationship: each facility is managed by exactly one organisation, but an organisation may manage multiple facilities.

**Table `observatory_facilities`**

| id | facility_id | facility_name | location | land_area_acres | land_ownership_type | operational_status | established_date | managing_organization_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 69447 | Integrated Protocol A | extended-location-99 | 4.95 | government_owned | active | 2024-03-27 | 1 |
| 1001 | 1040 | Extended Programme | integrated-location-100 | 7.90 | leased | inactive | 2025-08-11 | 2 |
| 1002 | 2986228 | Pilot Standard | seasonal-location-101 | 10.85 | association_owned | planned | 2022-01-22 | 3 |
| 1003 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 13.80 | government_owned | active | 2023-06-06 | 4 |

The `telescopes` table models instruments. Its surrogate key `id` ranges from 100 to 103, and `telescope_id` carries the natural identifier, which in the sample includes a UUID (`a556311c-8fb2-11eb-924d-9cd76263cbd0`). The `telescope_name` column holds values like "Adaptive Assessment" and "Compact Series". The `aperture_meters` column is a numeric attribute (1.70 to 6.80 metres), `telescope_class` is a categorical classifier (`extended-telescop-33`, `integrated-telescop-34`, etc.), and `primary_instrument` stores the instrument type (`legacy-primary-79`, `compact-primary-80`). The `observation_mode` column distinguishes `optical`, `infrared`, and `radio` modalities. The `community_access_percentage` column (10.95 to 22.80) quantifies open-access policy, while `funding_consortium` stores a string label such as `regional-funding-66`. Three foreign keys anchor the telescope to the rest of the domain: `observatory_facility_id` links to `observatory_facilities`, `astronomical_survey_id` links to `astronomical_surveys`, and `managing_organization_id` links to `managing_organizations`.

**Table `telescopes`**

| id | telescope_id | telescope_name | aperture_meters | telescope_class | primary_instrument | observation_mode | community_access_percentage | funding_consortium | observatory_facility_id | astronomical_survey_id | managing_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | mike1452 | Adaptive Assessment | 1.70 | extended-telescop-33 | legacy-primary-79 | optical | 10.95 | regional-funding-66 | 1000 | 1 | 1 |
| 101 | 7441142 | Primary Survey | 3.40 | integrated-telescop-34 | compact-primary-80 | infrared | 14.90 | legacy-funding-67 | 1001 | 2 | 2 |
| 102 | a556311c-8fb2-11eb-924d-9cd76263cbd0 | Composite Corridor D | 5.10 | seasonal-telescop-35 | composite-primary-81 | radio | 18.85 | compact-funding-68 | 1002 | 3 | 3 |
| 103 | 10207145 | Compact Series | 6.80 | regional-telescop-36 | primary-primary-82 | optical | 22.80 | composite-funding-69 | 1003 | 4 | 4 |

The `astronomical_surveys` table captures research programme metadata. Its surrogate key `astronomical_survey_id` (1–4) pairs with the natural `survey_id`, which may be numeric (`21005921`) or UUID-formatted (`b83e028a-8fcd-11eb-924d-9cd76263cbd0`). The `survey_name` column holds labels such as "Composite Protocol" and "Regional Framework". Temporal attributes `start_date` and `end_date` define the programme window (e.g., `2022-09-05` to `2022-09-01`). The `nights_allocated_per_year` column is an integer (21 to 51), `primary_objective` stores a categorical code (`primary-primary-58`, `adaptive-primary-59`), and `status` tracks lifecycle state (`planned`, `active`, `completed`). The foreign key `telescope_id` links each survey to its host instrument, and `funding_agency_id` links to the `funding_agencies` table.

**Table `astronomical_surveys`**

| astronomical_survey_id | survey_id | survey_name | start_date | end_date | nights_allocated_per_year | primary_objective | status | telescope_id | funding_agency_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | Composite Protocol | 2022-09-05 | 2022-09-01 | 21 | primary-primary-58 | planned | 100 | 1 |
| 2 | 726059 | Compact Programme A | 2023-02-16 | 2023-02-12 | 31 | adaptive-primary-59 | active | 101 | 2 |
| 3 | 32814 | Legacy Standard | 2024-07-27 | 2024-07-23 | 41 | distributed-primary-60 | completed | 102 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | 2025-12-11 | 2025-12-07 | 51 | baseline-primary-61 | planned | 103 | 4 |

The `managing_organizations` table stores administrative entities. Its surrogate key `id` (1–4) pairs with `org_id`, a natural identifier that may be numeric (`790471`, `1717`) or short alphanumeric (`m16`). The `org_name` column holds values like "Extended Review" and "Distributed Cluster". The `org_type` column is categorical (`academic`, `not_for_profit`, `industrial`, `consortium`). Agreement dates `agreement_start_date` and `agreement_end_date` define the management contract window. The `oversight_level` column is categorical (`full`, `partial`, `none`), and `conflict_of_interest_disclosure` is a boolean (`true`/`false`). Two foreign keys anchor the organisation: `funding_agency_id` links to `funding_agencies`, and `land_owner_id` links to `land_owners`.

**Table `managing_organizations`**

| id | org_id | org_name | org_type | agreement_start_date | agreement_end_date | oversight_level | conflict_of_interest_disclosure | funding_agency_id | land_owner_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | academic | 2025-04-16 | 2024-07-08 | full | false | 1 | 1 |
| 2 | 1717 | Pilot Initiative A | not_for_profit | 2022-09-27 | 2025-12-19 | partial | true | 2 | 2 |
| 3 | 69437 | Baseline Model | industrial | 2023-02-11 | 2022-05-03 | none | false | 3 | 3 |
| 4 | m16 | Distributed Cluster | consortium | 2024-07-22 | 2023-10-14 | full | true | 4 | 4 |

The `funding_agencies` table records financial sponsors. Its surrogate key `id` (1–4) pairs with `agency_id`, which in the sample holds organisational names such as "U.S. Steel" and "Nikola Corporation". The `agency_name` column stores the formal name ("FSG Social Impact Advisors", "Whirlpool Corporation"). The `agency_type` column is categorical (`federal`, `state`, `international`), `division` is a categorical code (`integrated-division-16`, `seasonal-division-17`), `program_code` stores an alphanumeric identifier (`191`, `flexible-thinking`), and `oversight_responsibility` is categorical (`technical`, `programmatic`, `financial`, `administrative`).

**Table `funding_agencies`**

| id | agency_id | agency_name | agency_type | division | program_code | oversight_responsibility |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | FSG Social Impact Advisors | federal | integrated-division-16 | 191 | technical |
| 2 | Nikola Corporation | Whirlpool Corporation | state | seasonal-division-17 | 1186082 | programmatic |
| 3 | Oberthur Technologies | Education Writers Association | international | regional-division-18 | 3990187 | financial |
| 4 | General Telephone & Electronics | Switch Card Services Ltd. | federal | legacy-division-19 | flexible-thinking | administrative |

The `land_owners` table captures property holders. Its surrogate key `id` (1–4) pairs with `owner_id`, which holds person names ("Brian Hamilton", "Kerry West"). The `owner_name` column stores a secondary name ("Craig Childs", "Kimberly Smith"). The `owner_type` column is categorical (`government`, `indigenous_nation`, `association`, `private`). The `land_area_acres` column mirrors the facility's land area (4.95 to 13.80 acres), `lease_rate_per_year` is a numeric value (2.70 to 7.80), and `lease_purpose_restriction` stores a categorical code (`pilot-lease-74`, `extended-lease-75`). The foreign key `managing_organization_id` links each land owner to the organisation that manages the associated facility.

**Table `land_owners`**

| id | owner_id | owner_name | owner_type | land_area_acres | lease_rate_per_year | lease_purpose_restriction | managing_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Craig Childs | government | 4.95 | 2.70 | pilot-lease-74 | 1 |
| 2 | Kerry West | Kimberly Smith | indigenous_nation | 7.90 | 4.40 | extended-lease-75 | 2 |
| 3 | Peter Montgomery | Michelle Kelley | association | 10.85 | 6.10 | integrated-lease-76 | 3 |
| 4 | Susan Wagner | Jorge Sullivan | private | 13.80 | 7.80 | seasonal-lease-77 | 4 |

### Junction Tables and Many-to-Many Decomposition

Several domain relationships are many-to-many and therefore materialised as junction tables. The `facilities_telescopes` table resolves the relationship between observatory facilities and telescopes, allowing a single facility to host multiple telescopes and a telescope to be associated with multiple facilities across different contexts. The `organizations_facilities` table resolves the relationship between managing organisations and observatory facilities, supporting scenarios where a facility may be co-managed by multiple organisations or an organisation manages facilities across different regions.

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

The `agencies_organizations` table resolves the funding relationship between funding agencies and managing organisations, enabling a single agency to fund multiple organisations and an organisation to receive funding from multiple agencies. The `agencies_facilities` table directly links funding agencies to observatory facilities, capturing cases where funding flows from an agency to a facility without an intermediate organisational layer.

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

The `owners_facilities` table resolves the land ownership relationship between land owners and observatory facilities, allowing a single land owner to hold property for multiple facilities and a facility to be situated on land owned by multiple parties.

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

### View-Based Fact Reconstruction

The schema provides twelve views, each performing a specific join to reconstruct a domain fact from the normalised tables. Every view answers a concrete question by pulling columns from two or three base tables.

The view `vw_observatory_facility_telescope_detail` joins `observatory_facilities` with `telescopes` on `observatory_facility_id`, answering the question: "Which telescopes are installed at which facilities?" A sample row reveals that telescope "Adaptive Assessment" (aperture 1.70 m, optical mode) is located at facility "Integrated Protocol A" (4.95 acres, government-owned, active).

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

The view `vw_observatory_facility_managing_organization` joins `observatory_facilities` with `managing_organizations` on `managing_organization_id`, answering: "Which organisation manages which facility?" A sample row shows that "Extended Review" (academic, full oversight) manages facility "Integrated Protocol A" at `extended-location-99`.

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

The view `vw_telescope_observatory_facility` joins `telescopes` with `observatory_facilities` on `observatory_facility_id`, answering: "At which facility is each telescope located?" A sample row indicates that telescope "Primary Survey" (3.40 m, infrared) is located at facility "Extended Programme" (7.90 acres, leased, inactive).

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

The view `vw_telescope_astronomical_survey` joins `telescopes` with `astronomical_surveys` on `astronomical_survey_id`, answering: "Which survey is conducted on which telescope?" A sample row reveals that the "Composite Protocol" survey (21 nights/year, planned) is conducted on telescope "Adaptive Assessment" (1.70 m, optical).

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

The view `vw_telescope_managing_organization` joins `telescopes` with `managing_organizations` on `managing_organization_id`, answering: "Which organisation manages which telescope?" A sample row shows that "Pilot Initiative A" (not-for-profit, partial oversight) manages telescope "Primary Survey" (3.40 m, infrared).

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

The view `vw_astronomical_survey_telescope` joins `astronomical_surveys` with `telescopes` on `telescope_id`, answering: "Which telescope hosts each survey?" A sample row indicates that the "Compact Programme A" survey (31 nights/year, active) is hosted on telescope "Primary Survey" (3.40 m, infrared).

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

The view `vw_astronomical_survey_funding_agency` joins `astronomical_surveys` with `funding_agencies` on `funding_agency_id`, answering: "Which agency funds each survey?" A sample row reveals that the "Composite Protocol" survey is funded by "FSG Social Impact Advisors" (federal, technical oversight).

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

The view `vw_managing_organization_observatory_facility_detail` joins `managing_organizations` with `observatory_facilities` on `managing_organization_id`, answering: "Which facilities does each organisation manage?" A sample row shows that "Extended Review" (academic) manages facility "Integrated Protocol A" (4.95 acres, active).

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

The view `vw_managing_organization_funding_agency` joins `managing_organizations` with `funding_agencies` on `funding_agency_id`, answering: "Which agency funds each managing organisation?" A sample row reveals that "Extended Review" (academic) receives funding from "FSG Social Impact Advisors" (federal, technical oversight).

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

The view `vw_managing_organization_land_owner` joins `managing_organizations` with `land_owners` on `land_owner_id`, answering: "Which land owner is associated with each managing organisation?" A sample row shows that "Extended Review" (academic) is associated with land owner "Brian Hamilton" (government, 4.95 acres).

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

The view `vw_funding_agency_managing_organization_detail` joins `funding_agencies` with `managing_organizations` on `funding_agency_id`, answering: "Which organisations does each agency fund?" A sample row reveals that "FSG Social Impact Advisors" (federal) funds "Extended Review" (academic, full oversight).

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

The view `vw_funding_agency_observatory_facility_detail` joins `funding_agencies` with `managing_organizations` and then with `observatory_facilities` through a two-step join on `funding_agency_id` and `managing_organization_id`, answering: "Which facilities are ultimately funded by each agency?" A sample row indicates that "FSG Social Impact Advisors" funds "Extended Review", which manages facility "Integrated Protocol A" (4.95 acres, active).

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

The view `vw_land_owner_managing_organization` joins `land_owners` with `managing_organizations` on `managing_organization_id`, answering: "Which managing organisation is associated with each land owner?" A sample row shows that "Brian Hamilton" (government) is associated with "Extended Review" (academic).

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

The view `vw_land_owner_observatory_facility_detail` joins `land_owners` with `managing_organizations` and then with `observatory_facilities` through a two-step join on `managing_organization_id`, answering: "Which facilities are situated on land owned by each land owner?" A sample row reveals that "Brian Hamilton" (government, 4.95 acres) is associated with "Extended Review", which manages facility "Integrated Protocol A" (4.95 acres, government-owned, active).

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

### Synthesis

The relational schema for the observatory domain demonstrates a disciplined application of normalisation principles grounded in an underlying ontology. Six base tables encode the core entity types, each with a surrogate primary key, a natural identifier column, and a mix of scalar attributes and foreign keys. Cardinality-bounded relationships (one-to-many) are expressed directly as nullable foreign key columns within the child table, while many-to-many relationships are decomposed into dedicated junction tables. The twelve views layer join logic on top of this normalised foundation, each reconstructing a specific domain fact by pulling columns from two or three base tables. The result is a schema that is both analytically queryable—supporting ad-hoc joins across the full entity graph—and semantically faithful to the ontology from which it was derived.