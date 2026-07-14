The domain under examination is a sustainability funding ecosystem in which grant awards, sustainability projects, water harvesting systems, facilities, community organizations, corporate sponsors, and municipalities are interrelated through a network of cardinality-bounded relationships. Each real-world entity is materialized as a relational table whose columns encode both the entity's intrinsic attributes and its foreign-key links to other entities. The schema is deliberately normalized: primary facts live in base tables, many-to-many associations are resolved through a junction table, and denormalized views reassemble the normalized pieces into domain-relevant perspectives. This chapter walks through the entity types, their attributes, the foreign-key topology, and the view-level joins that reconstruct the original domain facts.

## Base Tables and Entity Types

The schema contains eight base tables. Seven are entity tables and one is a junction table. The entity tables are `grant_awards`, `sustainability_projects`, `water_harvesting_systems`, `facilities`, `community_organizations`, `corporate_sponsors`, and `municipalities`. The junction table `projects_systems` resolves a many-to-many relationship between sustainability projects and water harvesting systems.

**Table `grant_awards`**

| id | grant_amount | grant_currency | award_date | grant_program_name | grant_status | grant_reference_id | community_organization_id | corporate_sponsor_id | sustainability_project_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | Adaptive Model | pending | 89130 | 1000 | 1 | 1 |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | Primary Cluster | approved | 2618575 | 1001 | 2 | 2 |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | Composite Review D | disbursed | 627 | 1002 | 3 | 3 |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | Compact Initiative | completed | 0000000000000 | 1003 | 4 | 4 |

The `grant_awards` table captures the financial instrument at the center of the ecosystem. Its surrogate key `id` (values 1 through 4) identifies individual awards. The monetary dimension is stored in `grant_amount` (e.g., `11.88`, `14.31`) alongside `grant_currency`, which holds coded values such as `regional-grant-60` and `legacy-grant-61`. The `award_date` column records timestamps like `2025-12-01T23:33:00`, while `grant_program_name` (e.g., `Adaptive Model`, `Primary Cluster`) and `grant_status` (e.g., `pending`, `approved`, `disbursed`, `completed`) describe the programmatic context and lifecycle stage. The `grant_reference_id` column stores opaque identifiers such as `89130` and `2618575`. Crucially, three foreign-key columns — `community_organization_id`, `corporate_sponsor_id`, and `sustainability_project_id` — bind each grant to its beneficiary organization, its funding sponsor, and the project it finances. Row 1, for instance, links grant `id = 1` to `community_organization_id = 1000`, `corporate_sponsor_id = 1`, and `sustainability_project_id = 1`.

**Table `sustainability_projects`**

| id | project_name | project_description | project_status | start_date | end_date | project_location | facility_id | community_organization_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | planned | 2022-09-05 | 2022-09-01 | regional-project-48 | 1000 | 1000 |
| 2 | Legacy Corridor | Compact Review A | in_progress | 2023-02-16 | 2023-02-12 | legacy-project-49 | 1001 | 1001 |
| 3 | Regional Series A | Legacy Initiative | completed | 2024-07-27 | 2024-07-23 | compact-project-50 | 1002 | 1002 |
| 4 | Seasonal Assessment | Regional Model | failed | 2025-12-11 | 2025-12-07 | composite-project-51 | 1003 | 1003 |

The `sustainability_projects` table models the operational initiatives that consume grant funding. Its surrogate key `id` (1–4) identifies projects. Descriptive attributes include `project_name` (`Compact Survey`, `Legacy Corridor`), `project_description` (`Composite Cluster`, `Compact Review A`), and `project_status` (`planned`, `in_progress`, `completed`, `failed`). Temporal bounds are captured by `start_date` and `end_date`, while `project_location` stores coded location identifiers such as `regional-project-48`. Two foreign-key columns anchor each project: `facility_id` points to the physical site (e.g., `1000`), and `community_organization_id` points to the managing organization (e.g., `1000`).

**Table `water_harvesting_systems`**

| water_harvesting_system_id | system_type | capacity_liters | installation_date | material_type | system_status | manufacturer | facility_id | corporate_sponsor_id |
|---|---|---|---|---|---|---|---|---|
| 100 | extended-system-69 | 5.45 | 2022-01-10 | adaptive-material-71 | installed | Standard Chartered | 1000 | 1 |
| 101 | integrated-system-70 | 8.90 | 2023-06-21 | distributed-material-72 | operational | General Motors | 1001 | 2 |
| 102 | seasonal-system-71 | 12.35 | 2024-11-05 | baseline-material-73 | maintenance_required | Column Name cannot be empty | 1002 | 3 |
| 103 | regional-system-72 | 15.80 | 2025-04-16 | pilot-material-74 | decommissioned | Financial Information Service Co. Ltd. | 1003 | 4 |

Water harvesting systems are the physical infrastructure layer. The primary key is `water_harvesting_system_id` (values 100–103), a natural identifier rather than a surrogate. Attributes include `system_type` (`extended-system-69`, `integrated-system-70`), `capacity_liters` (ranging from `5.45` to `15.80`), `installation_date`, `material_type` (`adaptive-material-71`, `distributed-material-72`), and `system_status` (`installed`, `operational`, `maintenance_required`, `decommissioned`). The `manufacturer` column names entities such as `Standard Chartered` and `General Motors`. Foreign keys `facility_id` (e.g., `1000`) and `corporate_sponsor_id` (e.g., `1`) tie each system to its installation site and its financial backer.

**Table `facilities`**

| facility_id | facility_name | facility_address | facility_type | construction_year | roof_completion_date | facility_status | community_organization_id | water_harvesting_system_id | municipality_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 14 | 2023-06-17 | active | 1000 | 100 | 1000 | 2025-01-01 00:14:00 |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 21 | 2024-11-01 | inactive | 1001 | 101 | 1001 | 2025-02-06 03:14:00 |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 28 | 2025-04-12 | under_construction | 1002 | 102 | 1002 | 2025-03-11 06:14:00 |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 35 | 2022-09-23 | active | 1003 | 103 | 1003 | 2025-04-16 09:14:00 |

Facilities represent the physical sites where projects and systems are deployed. The surrogate key `facility_id` (1000–1003) identifies sites. Descriptive columns include `facility_name` (`Integrated Protocol A`, `Extended Programme`), `facility_address`, `facility_type` (`legacy-facility-73`, `compact-facility-74`), `construction_year` (14–35), `roof_completion_date`, and `facility_status` (`active`, `inactive`, `under_construction`). The `created_at` timestamp (e.g., `2025-01-01 00:14:00`) records when the facility record was created. Foreign-key columns `community_organization_id`, `water_harvesting_system_id`, and `municipality_id` link each facility to its managing organization, its associated water system, and its governing municipality.

**Table `community_organizations`**

| id | organization_name | organization_type | registration_number | founding_date | membership_count | organization_status | facility_id | grant_award_id | sustainability_project_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 2023-06-24 | 242 | active | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 2024-11-08 | 77 | dissolved | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 2025-04-19 | 601 | suspended | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 2022-09-03 | 300 | active | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Community organizations are the non-profit or civic entities that manage projects and receive grants. The surrogate key `id` (1000–1003) identifies organizations. Attributes include `organization_name` (`Staples Inc.`, `Oscar Health Inc.`), `organization_type` (`Gulf Oil`, `FSG Social Impact Advisors`), `registration_number` (`REG-2136`, `REG-2142`), `founding_date`, `membership_count` (242, 77, 601, 300), and `organization_status` (`active`, `dissolved`, `suspended`). The `created_at` and `updated_at` columns track record lifecycle. Foreign keys `facility_id`, `grant_award_id`, and `sustainability_project_id` connect each organization to its operational site, the grants it receives, and the projects it runs.

**Table `corporate_sponsors`**

| id | company_name | company_type | headquarters_location | industry_sector | sponsorship_program_name | total_funding_distributed | grant_award_id | water_harvesting_system_id | community_organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | seasonal-industry-35 | Integrated Cluster A | 13.20 | 1 | 100 | 1000 |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | regional-industry-36 | Extended Review | 16.40 | 2 | 101 | 1001 |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | legacy-industry-37 | Pilot Initiative | 19.60 | 3 | 102 | 1002 |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | compact-industry-38 | Baseline Model D | 22.80 | 4 | 103 | 1003 |

Corporate sponsors are the for-profit entities that fund water harvesting systems and grant awards. The surrogate key `id` (1–4) identifies sponsors. Attributes include `company_name` (`Feedback Rating`, `Virgin Group`), `company_type` (`Greater Houston Community Foundation`, `Poshmark Inc.`), `headquarters_location` (`composite-headquar-63`, `primary-headquar-64`), `industry_sector` (`seasonal-industry-35`, `regional-industry-36`), `sponsorship_program_name` (`Integrated Cluster A`, `Extended Review`), and `total_funding_distributed` (13.20–22.80). Foreign-key columns `grant_award_id`, `water_harvesting_system_id`, and `community_organization_id` link each sponsor to the grants it underwrites, the systems it funds, and the organizations it partners with.

**Table `municipalities`**

| municipality_id | municipality_name | municipality_code | state_province | country | population | area_sq_km | facility_id |
|---|---|---|---|---|---|---|---|
| 1000 | Compact Model | 8843744 | primary-state-28 | compact-country-26 | 42 | 15.45 | 1000 |
| 1001 | Legacy Cluster | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | adaptive-state-29 | composite-country-27 | 49 | 17.90 | 1001 |
| 1002 | Regional Review A | 3012833 | distributed-state-30 | primary-country-28 | 56 | 20.35 | 1002 |
| 1003 | Seasonal Initiative | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | baseline-state-31 | adaptive-country-29 | 63 | 22.80 | 1003 |

Municipalities represent the local government jurisdictions overseeing facilities. The table provides the geographic and administrative context for the facility layer.

**Table `projects_systems`**

| sustainability_project_id | water_harvesting_system_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `projects_systems` junction table resolves the many-to-many relationship between `sustainability_projects` and `water_harvesting_systems`. In a normalized design, a single project may deploy multiple water systems, and a single system may serve multiple projects. The junction table contains foreign keys referencing both entity tables, ensuring referential integrity while preserving the cardinality flexibility that a single foreign key column cannot express.

## Foreign-Key Topology and Cardinality

The foreign-key graph forms a hub-and-spoke pattern centered on `grant_awards` and `facilities`. The `grant_awards` table acts as a financial hub: each row references exactly one `community_organization`, one `corporate_sponsor`, and one `sustainability_project`. Conversely, each organization, sponsor, and project may appear in zero or many grant rows — a one-to-many relationship from the referenced entity to the grant. The `facilities` table serves as the physical hub: each facility references one `community_organization`, one `water_harvesting_system`, and one `municipality`. The reverse direction is many-to-one from the perspective of the referenced entities — a single organization may manage multiple facilities, a single municipality may contain multiple facilities.

The `community_organizations` table participates in three foreign-key relationships: it is referenced by `grant_awards` (as `community_organization_id`), by `sustainability_projects` (as `community_organization_id`), and by `facilities` (as `community_organization_id`). It also references `facilities`, `grant_awards`, and `sustainability_projects` through its own foreign-key columns. This bidirectional participation reflects the organizational role as both a manager and a managed entity.

The `corporate_sponsors` table similarly participates bidirectionally: it is referenced by `grant_awards` and `water_harvesting_systems`, and it references `grant_awards`, `water_harvesting_systems`, and `community_organizations`. This dual role captures the sponsor's function as both funder and partner.

## Views as Denormalized Projections

Views in this schema are not mere aliases; they are deliberate denormalizations that reassemble normalized tables into domain-relevant perspectives. Each view performs a join across two or more base tables, producing a flat result that answers a specific analytical question.

**View `grant_award_community_organization_view`**

```sql
CREATE VIEW grant_award_community_organization_view AS
SELECT a.id, a.grant_amount, a.grant_currency, a.award_date, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM grant_awards a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| id | grant_amount | grant_currency | award_date | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | 1000 | Staples Inc. | Gulf Oil |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | 1002 | Atlantic Richfield | McDonnell Douglas |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | 1003 | Port Loko | Alliant Energy Corp |

This view joins `grant_awards` to `community_organizations` on `grant_awards.community_organization_id = community_organizations.id`. It answers the question: "Which community organization receives which grant?" Row 1 of the result would show grant `id = 1` with `grant_amount = 11.88` alongside `organization_name = Staples Inc.` and `membership_count = 242`. The join reconstructs the financial-to-organizational link that is stored as a foreign key in the normalized schema.

**View `grant_award_corporate_sponsor_view`**

```sql
CREATE VIEW grant_award_corporate_sponsor_view AS
SELECT a.id, a.grant_amount, a.grant_currency, a.award_date, b.id AS sponsor_id, b.company_name AS sponsor_company_name, b.company_type AS sponsor_company_type
FROM grant_awards a JOIN corporate_sponsors b ON a.corporate_sponsor_id = b.id;
```

| id | grant_amount | grant_currency | award_date | sponsor_id | sponsor_company_name | sponsor_company_type |
|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | 1 | Feedback Rating | Greater Houston Community Foundation |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | 2 | Virgin Group | Poshmark Inc. |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | 4 | Link Title | LDAP First Name Field |

This view joins `grant_awards` to `corporate_sponsors` on `grant_awards.corporate_sponsor_id = corporate_sponsors.id`. It answers: "Which corporate sponsor funds which grant?" A representative row would pair grant `id = 1` (`grant_amount = 11.88`, `grant_program_name = Adaptive Model`) with `company_name = Feedback Rating` and `total_funding_distributed = 13.20`. The view collapses the sponsor's financial profile into the grant's row, enabling budget-level analysis without a runtime join.

**View `grant_award_sustainability_project_view`**

```sql
CREATE VIEW grant_award_sustainability_project_view AS
SELECT a.id, a.grant_amount, a.grant_currency, a.award_date, b.id AS project_id, b.project_name AS project_project_name, b.project_description AS project_project_description
FROM grant_awards a JOIN sustainability_projects b ON a.sustainability_project_id = b.id;
```

| id | grant_amount | grant_currency | award_date | project_id | project_project_name | project_project_description |
|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | 1 | Compact Survey | Composite Cluster |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | 2 | Legacy Corridor | Compact Review A |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | 3 | Regional Series A | Legacy Initiative |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | 4 | Seasonal Assessment | Regional Model |

This view joins `grant_awards` to `sustainability_projects` on `grant_awards.sustainability_project_id = sustainability_projects.id`. It answers: "Which grant finances which project?" Row 1 would show grant `id = 1` (`grant_amount = 11.88`, `grant_status = pending`) alongside `project_name = Compact Survey`, `project_status = planned`, and `project_location = regional-project-48`. The join materializes the financial-to-operational linkage that is otherwise implicit in the foreign key.

**View `sustainability_project_facility_view`**

```sql
CREATE VIEW sustainability_project_facility_view AS
SELECT a.id, a.project_name, a.project_description, a.project_status, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM sustainability_projects a JOIN facilities b ON a.facility_id = b.facility_id;
```

| id | project_name | project_description | project_status | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | planned | 1000 | Integrated Protocol A | legacy-facility-91 |
| 2 | Legacy Corridor | Compact Review A | in_progress | 1001 | Extended Programme | compact-facility-92 |
| 3 | Regional Series A | Legacy Initiative | completed | 1002 | Pilot Standard | composite-facility-93 |
| 4 | Seasonal Assessment | Regional Model | failed | 1003 | Baseline Framework D | primary-facility-94 |

This view joins `sustainability_projects` to `facilities` on `sustainability_projects.facility_id = facilities.facility_id`. It answers: "At which facility is each sustainability project deployed?" A representative row would pair `project_name = Compact Survey` with `facility_name = Integrated Protocol A`, `facility_type = legacy-facility-73`, and `facility_status = active`. The view collapses the project-to-site relationship into a single row, enabling site-level project inventories.

**View `sustainability_project_community_organization_view`**

```sql
CREATE VIEW sustainability_project_community_organization_view AS
SELECT a.id, a.project_name, a.project_description, a.project_status, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM sustainability_projects a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| id | project_name | project_description | project_status | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | planned | 1000 | Staples Inc. | Gulf Oil |
| 2 | Legacy Corridor | Compact Review A | in_progress | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | Regional Series A | Legacy Initiative | completed | 1002 | Atlantic Richfield | McDonnell Douglas |
| 4 | Seasonal Assessment | Regional Model | failed | 1003 | Port Loko | Alliant Energy Corp |

This view joins `sustainability_projects` to `community_organizations` on `sustainability_projects.community_organization_id = community_organizations.id`. It answers: "Which organization manages which project?" Row 1 would show `project_name = Compact Survey` alongside `organization_name = Staples Inc.`, `organization_type = Gulf Oil`, and `membership_count = 242`. The join reconstructs the management relationship that is stored as a foreign key in both the project and the organization tables.

**View `sustainability_project_water_harvesting_system_detail_view`**

```sql
CREATE VIEW sustainability_project_water_harvesting_system_detail_view AS
SELECT a.id, a.project_name, a.project_description, b.water_harvesting_system_id AS system_water_harvesting_system_id, b.system_type AS system_system_type, b.capacity_liters AS system_capacity_liters
FROM sustainability_projects a
  JOIN projects_systems j ON j.sustainability_project_id = a.id
  JOIN water_harvesting_systems b ON b.water_harvesting_system_id = j.water_harvesting_system_id;
```

| id | project_name | project_description | system_water_harvesting_system_id | system_system_type | system_capacity_liters |
|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | 100 | extended-system-69 | 5.45 |
| 1 | Compact Survey | Composite Cluster | 101 | integrated-system-70 | 8.90 |
| 2 | Legacy Corridor | Compact Review A | 101 | integrated-system-70 | 8.90 |
| 2 | Legacy Corridor | Compact Review A | 102 | seasonal-system-71 | 12.35 |
| 3 | Regional Series A | Legacy Initiative | 102 | seasonal-system-71 | 12.35 |
| 3 | Regional Series A | Legacy Initiative | 103 | regional-system-72 | 15.80 |
| 4 | Seasonal Assessment | Regional Model | 103 | regional-system-72 | 15.80 |
| 4 | Seasonal Assessment | Regional Model | 100 | extended-system-69 | 5.45 |

This view joins `sustainability_projects` to `water_harvesting_systems` through the `projects_systems` junction table, or directly if a foreign key exists. It answers: "Which water harvesting systems are associated with each sustainability project?" A representative row would pair `project_name = Compact Survey` with `system_type = extended-system-69`, `capacity_liters = 5.45`, and `manufacturer = Standard Chartered`. The join materializes the project-to-infrastructure linkage, which is critical for capacity planning and maintenance scheduling.

**View `water_harvesting_system_facility_view`**

```sql
CREATE VIEW water_harvesting_system_facility_view AS
SELECT a.water_harvesting_system_id, a.system_type, a.capacity_liters, a.installation_date, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM water_harvesting_systems a JOIN facilities b ON a.facility_id = b.facility_id;
```

| water_harvesting_system_id | system_type | capacity_liters | installation_date | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 100 | extended-system-69 | 5.45 | 2022-01-10 | 1000 | Integrated Protocol A | legacy-facility-91 |
| 101 | integrated-system-70 | 8.90 | 2023-06-21 | 1001 | Extended Programme | compact-facility-92 |
| 102 | seasonal-system-71 | 12.35 | 2024-11-05 | 1002 | Pilot Standard | composite-facility-93 |
| 103 | regional-system-72 | 15.80 | 2025-04-16 | 1003 | Baseline Framework D | primary-facility-94 |

This view joins `water_harvesting_systems` to `facilities` on `water_harvesting_systems.facility_id = facilities.facility_id`. It answers: "At which facility is each water harvesting system installed?" Row 1 would show `system_type = extended-system-69` (`capacity_liters = 5.45`, `system_status = installed`) alongside `facility_name = Integrated Protocol A` and `facility_status = active`. The view collapses the system-to-site relationship, enabling facility-level infrastructure audits.

**View `water_harvesting_system_corporate_sponsor_view`**

```sql
CREATE VIEW water_harvesting_system_corporate_sponsor_view AS
SELECT a.water_harvesting_system_id, a.system_type, a.capacity_liters, a.installation_date, b.id AS sponsor_id, b.company_name AS sponsor_company_name, b.company_type AS sponsor_company_type
FROM water_harvesting_systems a JOIN corporate_sponsors b ON a.corporate_sponsor_id = b.id;
```

| water_harvesting_system_id | system_type | capacity_liters | installation_date | sponsor_id | sponsor_company_name | sponsor_company_type |
|---|---|---|---|---|---|---|
| 100 | extended-system-69 | 5.45 | 2022-01-10 | 1 | Feedback Rating | Greater Houston Community Foundation |
| 101 | integrated-system-70 | 8.90 | 2023-06-21 | 2 | Virgin Group | Poshmark Inc. |
| 102 | seasonal-system-71 | 12.35 | 2024-11-05 | 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 |
| 103 | regional-system-72 | 15.80 | 2025-04-16 | 4 | Link Title | LDAP First Name Field |

This view joins `water_harvesting_systems` to `corporate_sponsors` on `water_harvesting_systems.corporate_sponsor_id = corporate_sponsors.id`. It answers: "Which corporate sponsor funds which water harvesting system?" A representative row would pair `system_type = extended-system-69` with `company_name = Feedback Rating` and `sponsorship_program_name = Integrated Cluster A`. The join reconstructs the funding relationship that is stored as a foreign key in the system table.

**View `facility_community_organization_view`**

```sql
CREATE VIEW facility_community_organization_view AS
SELECT a.facility_id, a.facility_name, a.facility_address, a.facility_type, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM facilities a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| facility_id | facility_name | facility_address | facility_type | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 1000 | Staples Inc. | Gulf Oil |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 1002 | Atlantic Richfield | McDonnell Douglas |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 1003 | Port Loko | Alliant Energy Corp |

This view joins `facilities` to `community_organizations` on `facilities.community_organization_id = community_organizations.id`. It answers: "Which organization manages which facility?" Row 1 would show `facility_name = Integrated Protocol A` alongside `organization_name = Staples Inc.` and `organization_status = active`. The view materializes the management relationship, enabling organizational capacity analysis across the facility portfolio.

**View `facility_water_harvesting_system_view`**

```sql
CREATE VIEW facility_water_harvesting_system_view AS
SELECT a.facility_id, a.facility_name, a.facility_address, a.facility_type, b.water_harvesting_system_id AS system_water_harvesting_system_id, b.system_type AS system_system_type, b.capacity_liters AS system_capacity_liters
FROM facilities a JOIN water_harvesting_systems b ON a.water_harvesting_system_id = b.water_harvesting_system_id;
```

| facility_id | facility_name | facility_address | facility_type | system_water_harvesting_system_id | system_system_type | system_capacity_liters |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 100 | extended-system-69 | 5.45 |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 101 | integrated-system-70 | 8.90 |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 102 | seasonal-system-71 | 12.35 |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 103 | regional-system-72 | 15.80 |

This view joins `facilities` to `water_harvesting_systems` on `facilities.water_harvesting_system_id = water_harvesting_systems.water_harvesting_system_id`. It answers: "Which water harvesting system is installed at each facility?" A representative row would pair `facility_name = Integrated Protocol A` with `system_type = extended-system-69` (`capacity_liters = 5.45`, `manufacturer = Standard Chartered`). The join collapses the facility-to-system linkage into a single row, enabling infrastructure-level reporting.

**View `facility_municipality_view`**

```sql
CREATE VIEW facility_municipality_view AS
SELECT a.facility_id, a.facility_name, a.facility_address, a.facility_type, b.municipality_id AS municipality_municipality_id, b.municipality_name AS municipality_municipality_name, b.municipality_code AS municipality_municipality_code
FROM facilities a JOIN municipalities b ON a.municipality_id = b.municipality_id;
```

| facility_id | facility_name | facility_address | facility_type | municipality_municipality_id | municipality_municipality_name | municipality_municipality_code |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 1000 | Compact Model | 8843744 |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 1001 | Legacy Cluster | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 1002 | Regional Review A | 3012833 |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 1003 | Seasonal Initiative | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 |

This view joins `facilities` to `municipalities` on `facilities.municipality_id = municipalities.municipality_id`. It answers: "In which municipality is each facility located?" Row 1 would show `facility_name = Integrated Protocol A` alongside the municipality's identifying attributes. The view materializes the geographic governance relationship, enabling jurisdiction-level facility inventories.

**View `community_organization_facility_view`**

```sql
CREATE VIEW community_organization_facility_view AS
SELECT a.id, a.organization_name, a.organization_type, a.registration_number, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM community_organizations a JOIN facilities b ON a.facility_id = b.facility_id;
```

| id | organization_name | organization_type | registration_number | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 1000 | Integrated Protocol A | legacy-facility-91 |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 1001 | Extended Programme | compact-facility-92 |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 1002 | Pilot Standard | composite-facility-93 |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 1003 | Baseline Framework D | primary-facility-94 |

This view joins `community_organizations` to `facilities` on `community_organizations.id = facilities.community_organization_id`. It answers: "Which facilities are managed by each community organization?" A representative row would show `organization_name = Staples Inc.` alongside `facility_name = Integrated Protocol A` and `facility_type = legacy-facility-73`. The join reconstructs the organizational portfolio, enabling workload and resource allocation analysis.

**View `community_organization_grant_award_view`**

```sql
CREATE VIEW community_organization_grant_award_view AS
SELECT a.id, a.organization_name, a.organization_type, a.registration_number, b.id AS award_id, b.grant_amount AS award_grant_amount, b.grant_currency AS award_grant_currency
FROM community_organizations a JOIN grant_awards b ON a.grant_award_id = b.id;
```

| id | organization_name | organization_type | registration_number | award_id | award_grant_amount | award_grant_currency |
|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 1 | 11.88 | regional-grant-60 |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 2 | 14.31 | legacy-grant-61 |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 3 | 18.47 | compact-grant-62 |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 4 | 14.58 | composite-grant-63 |

This view joins `community_organizations` to `grant_awards` on `community_organizations.id = grant_awards.community_organization_id`. It answers: "Which grants does each community organization receive?" Row 1 would pair `organization_name = Staples Inc.` with `grant_amount = 11.88`, `grant_program_name = Adaptive Model`, and `grant_status = pending`. The view materializes the financial inflow relationship, enabling budget forecasting at the organizational level.

**View `community_organization_sustainability_project_view`**

```sql
CREATE VIEW community_organization_sustainability_project_view AS
SELECT a.id, a.organization_name, a.organization_type, a.registration_number, b.id AS project_id, b.project_name AS project_project_name, b.project_description AS project_project_description
FROM community_organizations a JOIN sustainability_projects b ON a.sustainability_project_id = b.id;
```

| id | organization_name | organization_type | registration_number | project_id | project_project_name | project_project_description |
|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 1 | Compact Survey | Composite Cluster |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 2 | Legacy Corridor | Compact Review A |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 3 | Regional Series A | Legacy Initiative |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 4 | Seasonal Assessment | Regional Model |

This view joins `community_organizations` to `sustainability_projects` on `community_organizations.id = sustainability_projects.community_organization_id`. It answers: "Which projects does each community organization run?" A representative row would show `organization_name = Staples Inc.` alongside `project_name = Compact Survey` and `project_status = planned`. The join reconstructs the operational portfolio, enabling project pipeline analysis.

**View `corporate_sponsor_grant_award_view`**

```sql
CREATE VIEW corporate_sponsor_grant_award_view AS
SELECT a.id, a.company_name, a.company_type, a.headquarters_location, b.id AS award_id, b.grant_amount AS award_grant_amount, b.grant_currency AS award_grant_currency
FROM corporate_sponsors a JOIN grant_awards b ON a.grant_award_id = b.id;
```

| id | company_name | company_type | headquarters_location | award_id | award_grant_amount | award_grant_currency |
|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | 1 | 11.88 | regional-grant-60 |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | 2 | 14.31 | legacy-grant-61 |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | 3 | 18.47 | compact-grant-62 |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | 4 | 14.58 | composite-grant-63 |

This view joins `corporate_sponsors` to `grant_awards` on `corporate_sponsors.id = grant_awards.corporate_sponsor_id`. It answers: "Which grants does each corporate sponsor fund?" Row 1 would pair `company_name = Feedback Rating` with `grant_amount = 11.88` and `grant_program_name = Adaptive Model`. The view materializes the sponsorship-to-grant linkage, enabling funding commitment tracking.

**View `corporate_sponsor_water_harvesting_system_view`**

```sql
CREATE VIEW corporate_sponsor_water_harvesting_system_view AS
SELECT a.id, a.company_name, a.company_type, a.headquarters_location, b.water_harvesting_system_id AS system_water_harvesting_system_id, b.system_type AS system_system_type, b.capacity_liters AS system_capacity_liters
FROM corporate_sponsors a JOIN water_harvesting_systems b ON a.water_harvesting_system_id = b.water_harvesting_system_id;
```

| id | company_name | company_type | headquarters_location | system_water_harvesting_system_id | system_system_type | system_capacity_liters |
|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | 100 | extended-system-69 | 5.45 |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | 101 | integrated-system-70 | 8.90 |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | 102 | seasonal-system-71 | 12.35 |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | 103 | regional-system-72 | 15.80 |

This view joins `corporate_sponsors` to `water_harvesting_systems` on `corporate_sponsors.id = water_harvesting_systems.corporate_sponsor_id`. It answers: "Which water harvesting systems does each corporate sponsor fund?" A representative row would show `company_name = Feedback Rating` alongside `system_type = extended-system-69` (`capacity_liters = 5.45`, `manufacturer = Standard Chartered`). The join reconstructs the infrastructure funding relationship, enabling capital expenditure analysis.

**View `corporate_sponsor_community_organization_view`**

```sql
CREATE VIEW corporate_sponsor_community_organization_view AS
SELECT a.id, a.company_name, a.company_type, a.headquarters_location, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM corporate_sponsors a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| id | company_name | company_type | headquarters_location | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | 1000 | Staples Inc. | Gulf Oil |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | 1002 | Atlantic Richfield | McDonnell Douglas |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | 1003 | Port Loko | Alliant Energy Corp |

This view joins `corporate_sponsors` to `community_organizations` on `corporate_sponsors.community_organization_id = community_organizations.id`. It answers: "Which community organizations does each corporate sponsor partner with?" Row 1 would pair `company_name = Feedback Rating` with `organization_name = Staples Inc.` and `membership_count = 242`. The view materializes the partnership relationship, enabling stakeholder mapping.

**View `municipality_facility_view`**

```sql
CREATE VIEW municipality_facility_view AS
SELECT a.municipality_id, a.municipality_name, a.municipality_code, a.state_province, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM municipalities a JOIN facilities b ON a.facility_id = b.facility_id;
```

| municipality_id | municipality_name | municipality_code | state_province | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 1000 | Compact Model | 8843744 | primary-state-28 | 1000 | Integrated Protocol A | legacy-facility-91 |
| 1001 | Legacy Cluster | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | adaptive-state-29 | 1001 | Extended Programme | compact-facility-92 |
| 1002 | Regional Review A | 3012833 | distributed-state-30 | 1002 | Pilot Standard | composite-facility-93 |
| 1003 | Seasonal Initiative | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | baseline-state-31 | 1003 | Baseline Framework D | primary-facility-94 |

This view joins `municipalities` to `facilities` on `municipalities.municipality_id = facilities.municipality_id`. It answers: "Which facilities are located in each municipality?" A representative row would show the municipality's identifying attributes alongside `facility_name = Integrated Protocol A` and `facility_status = active`. The join reconstructs the geographic governance relationship, enabling jurisdiction-level infrastructure reporting.

## Closing Synthesis

The schema models a sustainability funding ecosystem as a network of seven entity tables and one junction table, connected by a web of foreign-key relationships that encode cardinality-bounded associations. Each base table stores intrinsic attributes as columns and inter-entity links as foreign keys. The views perform controlled denormalization: each join reassembles the normalized pieces into a flat, domain-relevant perspective that answers a specific analytical question. The result is a schema that is both normalized for data integrity and denormalized for analytical convenience — a pattern that balances the competing demands of transactional correctness and query simplicity. The concrete values in the data — grant amounts like `11.88`, system capacities like `5.45` liters, organization names like `Staples Inc.` — are not incidental; they are the domain facts that the schema's structure exists to preserve, relate, and surface.