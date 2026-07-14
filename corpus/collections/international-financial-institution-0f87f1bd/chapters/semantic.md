## Domain Modelling and Relational Materialization

The domain under examination concerns the governance of development finance: how international financial institutions (IFIs) fund projects, how accountability mechanisms monitor those projects, how affected communities experience the outcomes, and how policy reforms attempt to reshape the institutional landscape. Six base tables and twelve materialized views together encode this ecosystem in a normalized relational schema. The base tables capture entities and their attributes; the views materialize the join paths that reconstruct domain facts from the normalized tables.

**Table `international_financial_institutions`**

| id | institution_id | name | founding_year | governance_structure | primary_mission | accountability_mechanism_id | development_project_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | 43 | baseline-governan-19 | pilot-primary-20 | 1000 | 100 |
| 2 | 8189481 | Pilot Initiative A | 48 | pilot-governan-20 | extended-primary-21 | 1001 | 101 |
| 3 | 1437604 | Baseline Model | 53 | extended-governan-21 | integrated-primary-22 | 1002 | 102 |
| 4 | 884346 | Distributed Cluster | 58 | integrated-governan-22 | seasonal-primary-23 | 1003 | 103 |

The `international_financial_institutions` table is the anchor of the institutional dimension. Each row represents a single IFI, identified by a surrogate primary key `id` and a business-level `institution_id` (for example, `9424913` for *Extended Review* and `8189481` for *Pilot Initiative A*). The `name` column carries human-readable labels such as *Distributed Cluster* and *Baseline Model*. The `founding_year` column stores integer values in the range 43–58, while `governance_structure` and `primary_mission` hold categorical codes like `baseline-governan-19` and `pilot-primary-20`. The table also carries two foreign-key columns — `accountability_mechanism_id` and `development_project_id` — that point into the `accountability_mechanisms` and `development_projects` tables respectively. In the sample data, row 1 links IFI `9424913` to accountability mechanism `1000` and development project `100`, establishing a direct institutional-to-project linkage at the entity level.

**Table `accountability_mechanisms`**

| id | mechanism_id | mechanism_name | establishment_year | independence_level | scope_of_authority | current_status | international_financial_institution_id | development_project_id | affected_community_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2106718 | Legacy Programme D | 26 | extended-independ-33 | seasonal-scope-89 | pilot-current-74 | 1 | 100 | 1 |
| 1001 | 9085252 | Regional Standard | 31 | integrated-independ-34 | regional-scope-90 | extended-current-75 | 2 | 101 | 2 |
| 1002 | 2935 | Seasonal Framework | 36 | seasonal-independ-35 | legacy-scope-91 | integrated-current-76 | 3 | 102 | 3 |
| 1003 | TERIMA | Integrated Protocol A | 41 | regional-independ-36 | compact-scope-92 | seasonal-current-77 | 4 | 103 | 4 |

The `accountability_mechanisms` table models the oversight bodies that monitor development finance. Its surrogate key is `id`, while the business identifier `mechanism_id` carries values such as `2106718` (*Legacy Programme D*) and `TERIMA` (*Integrated Protocol A*). The `mechanism_name` column provides the human-readable name. The `establishment_year` column stores integers (26–41 in the sample), and `independence_level` encodes the degree of autonomy using codes like `extended-independ-33` and `regional-independ-36`. The `scope_of_authority` column uses codes such as `seasonal-scope-89` and `compact-scope-92`, while `current_status` holds values like `pilot-current-74` and `seasonal-current-77`. Three foreign-key columns — `international_financial_institution_id`, `development_project_id`, and `affected_community_id` — tie each mechanism to its sponsoring IFI, its monitored project, and the community it serves. Row 1000, for instance, links mechanism `2106718` to IFI `1`, project `100`, and community `1`.

**Table `development_projects`**

| id | project_id | project_name | project_type | location_country | funding_institution | start_date | end_date | total_budget | international_financial_institution_id | accountability_mechanism_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | primary-project-34 | adaptive-location-47 | primary-funding-64 | 2022-09-05 | 2022-09-01 | 29.99 | 1 | 1000 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | distributed-location-48 | adaptive-funding-65 | 2023-02-16 | 2023-02-12 | 10.72 | 2 | 1001 |
| 102 | 5006462 | Regional Series A | distributed-project-36 | baseline-location-49 | distributed-funding-66 | 2024-07-27 | 2024-07-23 | 29.43 | 3 | 1002 |
| 103 | 10207143 | Seasonal Assessment | baseline-project-37 | pilot-location-50 | baseline-funding-67 | 2025-12-11 | 2025-12-07 | 17.12 | 4 | 1003 |

The `development_projects` table captures individual development initiatives. The surrogate key `id` runs 100–103, while the business-level `project_id` carries values such as `1437597` (*Compact Survey*) and `df5a6648-8fd1-11eb-924d-9cd76263cbd0` (*Legacy Corridor*). The `project_type` column uses codes like `primary-project-34` and `adaptive-project-35`. The `location_country` column stores categorical location codes (e.g., `adaptive-location-47`), and `funding_institution` holds funding source codes such as `primary-funding-64`. The `start_date` and `end_date` columns store dates in ISO format — row 100 spans `2022-09-05` to `2022-09-01`, while row 103 spans `2025-12-11` to `2025-12-07`. The `total_budget` column stores decimal values ranging from 10.72 to 29.99. Two foreign-key columns — `international_financial_institution_id` and `accountability_mechanism_id` — link each project to its funding IFI and its monitoring mechanism. Row 100, for example, links project `1437597` to IFI `1` and mechanism `1000`.

**Table `affected_communities`**

| affected_community_id | community_id | community_name | region | population_size | vulnerability_index | primary_language | development_project_id | accountability_mechanism_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | distributed-region-12 | 35 | 10.45 | primary-primary-10 | 100 | 1000 |
| 2 | 5082990 | Composite Model | baseline-region-13 | 42 | 13.90 | adaptive-primary-11 | 101 | 1001 |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | pilot-region-14 | 49 | 17.35 | distributed-primary-12 | 102 | 1002 |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | extended-region-15 | 56 | 20.80 | baseline-primary-13 | 103 | 1003 |

The `affected_communities` table encodes the communities impacted by development projects. Its surrogate key is `affected_community_id`, while the business identifier `community_id` carries values such as `325466` (*Primary Initiative A*) and `dce14308-8fba-11eb-924d-9cd76263cbd0` (*Compact Cluster*). The `region` column stores codes like `distributed-region-12` and `pilot-region-14`. The `population_size` column holds small integers (35–56 in the sample), and `vulnerability_index` stores decimal values ranging from 10.45 to 20.80. The `primary_language` column uses codes such as `primary-primary-10` and `baseline-primary-13`. Two foreign-key columns — `development_project_id` and `accountability_mechanism_id` — link each community to the project affecting it and the mechanism overseeing it. Row 1 links community `325466` to project `100` and mechanism `1000`.

**Table `policy_reforms`**

| policy_reform_id | reform_id | reform_title | proposed_year | target_mechanism | reform_type | implementation_status | international_financial_institution_id | accountability_mechanism_id |
|---|---|---|---|---|---|---|---|---|
| 1 | state_uk_21 | Regional Model | 40 | legacy-target-73 | primary-reform-94 | distributed-implemen-72 | 1 | 1000 |
| 2 | 506005 | Seasonal Cluster D | 43 | compact-target-74 | adaptive-reform-95 | baseline-implemen-73 | 2 | 1001 |
| 3 | 392505 | Integrated Review | 46 | composite-target-75 | distributed-reform-96 | pilot-implemen-74 | 3 | 1002 |
| 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | Extended Initiative | 49 | primary-target-76 | baseline-reform-97 | extended-implemen-75 | 4 | 1003 |

The `policy_reforms` table captures reform initiatives aimed at reshaping institutional arrangements. Its surrogate key is `policy_reform_id`, while the business identifier `reform_id` carries values such as `state_uk_21` (*Regional Model*) and `b69ce49c-8fd1-11eb-924d-9cd76263cbd0` (*Extended Initiative*). The `proposed_year` column stores integers (40–49), and `target_mechanism` holds codes like `legacy-target-73` and `primary-target-76`. The `reform_type` column uses codes such as `primary-reform-94` and `baseline-reform-97`, while `implementation_status` stores codes like `distributed-implemen-72` and `extended-implemen-75`. Two foreign-key columns — `international_financial_institution_id` and `accountability_mechanism_id` — link each reform to the IFI it targets and the mechanism it seeks to change. Row 1 links reform `state_uk_21` to IFI `1` and mechanism `1000`.

**Table `projects_communities`**

| development_project_id | affected_community_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `projects_communities` table is a junction table that resolves the many-to-many relationship between development projects and affected communities. It contains two columns, `development_project_id` and `affected_community_id`, with no surrogate key of its own — the composite of both columns serves as the primary key. The sample data shows eight associations: project `100` affects communities `1` and `2`; project `101` affects communities `2` and `3`; project `102` affects communities `3` and `4`; and project `103` affects communities `4` and `1`. This table is the sole explicit many-to-many resolver in the schema; all other relationships are modelled as foreign keys embedded directly in the entity tables.

The foreign-key topology of the schema can be summarized as follows. The `international_financial_institutions` table carries foreign keys to `accountability_mechanisms` (`accountability_mechanism_id`) and `development_projects` (`development_project_id`). The `accountability_mechanisms` table carries foreign keys to `international_financial_institutions` (`international_financial_institution_id`), `development_projects` (`development_project_id`), and `affected_communities` (`affected_community_id`). The `development_projects` table carries foreign keys to `international_financial_institutions` (`international_financial_institution_id`) and `accountability_mechanisms` (`accountability_mechanism_id`). The `affected_communities` table carries foreign keys to `development_projects` (`development_project_id`) and `accountability_mechanisms` (`accountability_mechanism_id`). The `policy_reforms` table carries foreign keys to `international_financial_institutions` (`international_financial_institution_id`) and `accountability_mechanisms` (`accountability_mechanism_id`). The `projects_communities` junction table carries foreign keys to both `development_projects` and `affected_communities`. This creates a dense interconnection where every major entity type is reachable from every other through at most two hops.

The twelve views materialize the most common join paths, each answering a specific analytical question about the domain.

**View `vw_international_financial_institution_accountability_mechanism`**

```sql
CREATE VIEW vw_international_financial_institution_accountability_mechanism AS
SELECT a.id, a.institution_id, a.name, a.founding_year, b.id AS mechanism_id, b.mechanism_id AS mechanism_mechanism_id, b.mechanism_name AS mechanism_mechanism_name
FROM international_financial_institutions a JOIN accountability_mechanisms b ON a.accountability_mechanism_id = b.id;
```

| id | institution_id | name | founding_year | mechanism_id | mechanism_mechanism_id | mechanism_mechanism_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | 43 | 1000 | 2106718 | Legacy Programme D |
| 2 | 8189481 | Pilot Initiative A | 48 | 1001 | 9085252 | Regional Standard |
| 3 | 1437604 | Baseline Model | 53 | 1002 | 2935 | Seasonal Framework |
| 4 | 884346 | Distributed Cluster | 58 | 1003 | TERIMA | Integrated Protocol A |

This view joins `international_financial_institutions` to `accountability_mechanisms` on the matching foreign-key columns, reconstructing the institutional oversight relationship. It answers the question: *which accountability mechanism is associated with which international financial institution?* A row from this view would pair IFI `9424913` (Extended Review) with mechanism `2106718` (Legacy Programme D), revealing the oversight structure for that institution.

**View `vw_international_financial_institution_development_project`**

```sql
CREATE VIEW vw_international_financial_institution_development_project AS
SELECT a.id, a.institution_id, a.name, a.founding_year, b.id AS project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM international_financial_institutions a JOIN development_projects b ON a.development_project_id = b.id;
```

| id | institution_id | name | founding_year | project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | 43 | 100 | 1437597 | Compact Survey |
| 2 | 8189481 | Pilot Initiative A | 48 | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 3 | 1437604 | Baseline Model | 53 | 102 | 5006462 | Regional Series A |
| 4 | 884346 | Distributed Cluster | 58 | 103 | 10207143 | Seasonal Assessment |

This view joins `international_financial_institutions` to `development_projects`, reconstructing the funding relationship. It answers: *which development project is funded by which international financial institution?* A row would pair IFI `9424913` with project `1437597` (Compact Survey), showing the funding allocation for that project.

**View `vw_accountability_mechanism_international_financial_institution`**

```sql
CREATE VIEW vw_accountability_mechanism_international_financial_institution AS
SELECT a.id, a.mechanism_id, a.mechanism_name, a.establishment_year, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM accountability_mechanisms a JOIN international_financial_institutions b ON a.international_financial_institution_id = b.id;
```

| id | mechanism_id | mechanism_name | establishment_year | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1000 | 2106718 | Legacy Programme D | 26 | 1 | 9424913 | Extended Review |
| 1001 | 9085252 | Regional Standard | 31 | 2 | 8189481 | Pilot Initiative A |
| 1002 | 2935 | Seasonal Framework | 36 | 3 | 1437604 | Baseline Model |
| 1003 | TERIMA | Integrated Protocol A | 41 | 4 | 884346 | Distributed Cluster |

This view joins `accountability_mechanisms` to `international_financial_institutions`, presenting the same institutional oversight relationship from the mechanism's perspective. It answers: *which international financial institution sponsors this accountability mechanism?* A row would pair mechanism `2106718` (Legacy Programme D) with IFI `9424913` (Extended Review), emphasizing the mechanism's institutional anchor.

**View `vw_accountability_mechanism_development_project`**

```sql
CREATE VIEW vw_accountability_mechanism_development_project AS
SELECT a.id, a.mechanism_id, a.mechanism_name, a.establishment_year, b.id AS project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM accountability_mechanisms a JOIN development_projects b ON a.development_project_id = b.id;
```

| id | mechanism_id | mechanism_name | establishment_year | project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|---|
| 1000 | 2106718 | Legacy Programme D | 26 | 100 | 1437597 | Compact Survey |
| 1001 | 9085252 | Regional Standard | 31 | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 1002 | 2935 | Seasonal Framework | 36 | 102 | 5006462 | Regional Series A |
| 1003 | TERIMA | Integrated Protocol A | 41 | 103 | 10207143 | Seasonal Assessment |

This view joins `accountability_mechanisms` to `development_projects`, reconstructing the monitoring relationship. It answers: *which development project is monitored by this accountability mechanism?* A row would pair mechanism `2106718` (Legacy Programme D) with project `1437597` (Compact Survey), showing the scope of oversight.

**View `vw_accountability_mechanism_affected_community`**

```sql
CREATE VIEW vw_accountability_mechanism_affected_community AS
SELECT a.id, a.mechanism_id, a.mechanism_name, a.establishment_year, b.affected_community_id AS community_affected_community_id, b.community_id AS community_community_id, b.community_name AS community_community_name
FROM accountability_mechanisms a JOIN affected_communities b ON a.affected_community_id = b.affected_community_id;
```

| id | mechanism_id | mechanism_name | establishment_year | community_affected_community_id | community_community_id | community_community_name |
|---|---|---|---|---|---|---|
| 1000 | 2106718 | Legacy Programme D | 26 | 1 | 325466 | Primary Initiative A |
| 1001 | 9085252 | Regional Standard | 31 | 2 | 5082990 | Composite Model |
| 1002 | 2935 | Seasonal Framework | 36 | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 1003 | TERIMA | Integrated Protocol A | 41 | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |

This view joins `accountability_mechanisms` to `affected_communities`, reconstructing the community-level oversight relationship. It answers: *which affected community is overseen by this accountability mechanism?* A row would pair mechanism `2106718` (Legacy Programme D) with community `325466` (Primary Initiative A), revealing the community-level impact of the mechanism's work.

**View `vw_development_project_international_financial_institution`**

```sql
CREATE VIEW vw_development_project_international_financial_institution AS
SELECT a.id, a.project_id, a.project_name, a.project_type, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM development_projects a JOIN international_financial_institutions b ON a.international_financial_institution_id = b.id;
```

| id | project_id | project_name | project_type | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | primary-project-34 | 1 | 9424913 | Extended Review |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | 2 | 8189481 | Pilot Initiative A |
| 102 | 5006462 | Regional Series A | distributed-project-36 | 3 | 1437604 | Baseline Model |
| 103 | 10207143 | Seasonal Assessment | baseline-project-37 | 4 | 884346 | Distributed Cluster |

This view joins `development_projects` to `international_financial_institutions`, presenting the funding relationship from the project's perspective. It answers: *which international financial institution funds this development project?* A row would pair project `1437597` (Compact Survey) with IFI `9424913` (Extended Review), emphasizing the project's funding source.

**View `vw_development_project_affected_community_detail`**

```sql
CREATE VIEW vw_development_project_affected_community_detail AS
SELECT a.id, a.project_id, a.project_name, b.affected_community_id AS community_affected_community_id, b.community_id AS community_community_id, b.community_name AS community_community_name
FROM development_projects a
  JOIN projects_communities j ON j.development_project_id = a.id
  JOIN affected_communities b ON b.affected_community_id = j.affected_community_id;
```

| id | project_id | project_name | community_affected_community_id | community_community_id | community_community_name |
|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | 1 | 325466 | Primary Initiative A |
| 100 | 1437597 | Compact Survey | 2 | 5082990 | Composite Model |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2 | 5082990 | Composite Model |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 102 | 5006462 | Regional Series A | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 102 | 5006462 | Regional Series A | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |
| 103 | 10207143 | Seasonal Assessment | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |
| 103 | 10207143 | Seasonal Assessment | 1 | 325466 | Primary Initiative A |

This view joins `development_projects` to `affected_communities` through the `projects_communities` junction table, reconstructing the project-community impact relationship. It answers: *which affected communities are impacted by this development project?* A row would pair project `1437597` (Compact Survey) with community `325466` (Primary Initiative A), showing the community-level footprint of the project.

**View `vw_development_project_accountability_mechanism`**

```sql
CREATE VIEW vw_development_project_accountability_mechanism AS
SELECT a.id, a.project_id, a.project_name, a.project_type, b.id AS mechanism_id, b.mechanism_id AS mechanism_mechanism_id, b.mechanism_name AS mechanism_mechanism_name
FROM development_projects a JOIN accountability_mechanisms b ON a.accountability_mechanism_id = b.id;
```

| id | project_id | project_name | project_type | mechanism_id | mechanism_mechanism_id | mechanism_mechanism_name |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | primary-project-34 | 1000 | 2106718 | Legacy Programme D |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | 1001 | 9085252 | Regional Standard |
| 102 | 5006462 | Regional Series A | distributed-project-36 | 1002 | 2935 | Seasonal Framework |
| 103 | 10207143 | Seasonal Assessment | baseline-project-37 | 1003 | TERIMA | Integrated Protocol A |

This view joins `development_projects` to `accountability_mechanisms`, presenting the monitoring relationship from the project's perspective. It answers: *which accountability mechanism monitors this development project?* A row would pair project `1437597` (Compact Survey) with mechanism `2106718` (Legacy Programme D), emphasizing the oversight structure for that project.

**View `vw_affected_community_development_project`**

```sql
CREATE VIEW vw_affected_community_development_project AS
SELECT a.affected_community_id, a.community_id, a.community_name, a.region, b.id AS project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM affected_communities a JOIN development_projects b ON a.development_project_id = b.id;
```

| affected_community_id | community_id | community_name | region | project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | distributed-region-12 | 100 | 1437597 | Compact Survey |
| 2 | 5082990 | Composite Model | baseline-region-13 | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | pilot-region-14 | 102 | 5006462 | Regional Series A |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | extended-region-15 | 103 | 10207143 | Seasonal Assessment |

This view joins `affected_communities` to `development_projects` through the `projects_communities` junction table, presenting the impact relationship from the community's perspective. It answers: *which development project impacts this affected community?* A row would pair community `325466` (Primary Initiative A) with project `1437597` (Compact Survey), emphasizing the community's exposure to the project.

**View `vw_affected_community_accountability_mechanism`**

```sql
CREATE VIEW vw_affected_community_accountability_mechanism AS
SELECT a.affected_community_id, a.community_id, a.community_name, a.region, b.id AS mechanism_id, b.mechanism_id AS mechanism_mechanism_id, b.mechanism_name AS mechanism_mechanism_name
FROM affected_communities a JOIN accountability_mechanisms b ON a.accountability_mechanism_id = b.id;
```

| affected_community_id | community_id | community_name | region | mechanism_id | mechanism_mechanism_id | mechanism_mechanism_name |
|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | distributed-region-12 | 1000 | 2106718 | Legacy Programme D |
| 2 | 5082990 | Composite Model | baseline-region-13 | 1001 | 9085252 | Regional Standard |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | pilot-region-14 | 1002 | 2935 | Seasonal Framework |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | extended-region-15 | 1003 | TERIMA | Integrated Protocol A |

This view joins `affected_communities` to `accountability_mechanisms`, presenting the oversight relationship from the community's perspective. It answers: *which accountability mechanism oversees this affected community?* A row would pair community `325466` (Primary Initiative A) with mechanism `2106718` (Legacy Programme D), emphasizing the oversight structure for that community.

**View `vw_policy_reform_international_financial_institution`**

```sql
CREATE VIEW vw_policy_reform_international_financial_institution AS
SELECT a.policy_reform_id, a.reform_id, a.reform_title, a.proposed_year, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM policy_reforms a JOIN international_financial_institutions b ON a.international_financial_institution_id = b.id;
```

| policy_reform_id | reform_id | reform_title | proposed_year | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1 | state_uk_21 | Regional Model | 40 | 1 | 9424913 | Extended Review |
| 2 | 506005 | Seasonal Cluster D | 43 | 2 | 8189481 | Pilot Initiative A |
| 3 | 392505 | Integrated Review | 46 | 3 | 1437604 | Baseline Model |
| 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | Extended Initiative | 49 | 4 | 884346 | Distributed Cluster |

This view joins `policy_reforms` to `international_financial_institutions`, reconstructing the reform-target relationship. It answers: *which international financial institution is targeted by this policy reform?* A row would pair reform `state_uk_21` (Regional Model) with IFI `9424913` (Extended Review), showing the reform's institutional target.

**View `vw_policy_reform_accountability_mechanism`**

```sql
CREATE VIEW vw_policy_reform_accountability_mechanism AS
SELECT a.policy_reform_id, a.reform_id, a.reform_title, a.proposed_year, b.id AS mechanism_id, b.mechanism_id AS mechanism_mechanism_id, b.mechanism_name AS mechanism_mechanism_name
FROM policy_reforms a JOIN accountability_mechanisms b ON a.accountability_mechanism_id = b.id;
```

| policy_reform_id | reform_id | reform_title | proposed_year | mechanism_id | mechanism_mechanism_id | mechanism_mechanism_name |
|---|---|---|---|---|---|---|
| 1 | state_uk_21 | Regional Model | 40 | 1000 | 2106718 | Legacy Programme D |
| 2 | 506005 | Seasonal Cluster D | 43 | 1001 | 9085252 | Regional Standard |
| 3 | 392505 | Integrated Review | 46 | 1002 | 2935 | Seasonal Framework |
| 4 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | Extended Initiative | 49 | 1003 | TERIMA | Integrated Protocol A |

This view joins `policy_reforms` to `accountability_mechanisms`, reconstructing the reform-mechanism relationship. It answers: *which accountability mechanism is targeted by this policy reform?* A row would pair reform `state_uk_21` (Regional Model) with mechanism `2106718` (Legacy Programme D), showing the reform's mechanism-level target.

The schema design reflects a deliberate trade-off between normalization and query convenience. The six base tables are normalized to third normal form: each entity type has its own table, non-key attributes depend only on the primary key, and the single many-to-many relationship between projects and communities is resolved through the `projects_communities` junction table. The twelve views materialize the most common join paths, allowing analysts to query domain facts without writing joins explicitly. Each view corresponds to a single foreign-key hop (or a two-hop path through the junction table), ensuring that the view definition is both simple and semantically transparent. The foreign-key columns embedded in the entity tables create a dense interconnection graph: every major entity type is reachable from every other through at most two hops, which means that any cross-entity analytical question can be answered by joining at most two base tables or by querying a single view.