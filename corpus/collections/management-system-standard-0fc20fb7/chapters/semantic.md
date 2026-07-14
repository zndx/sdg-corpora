The domain of management system standard certification tracks the lifecycle of standards—such as ISO 9001:2015 or ISO 14001—as they are issued, certified, and statistically reported across organizations and geographic regions. At its core, the model distinguishes five entity types: the standards themselves, the certification records that bind a standard to an organization, the organizations that hold certifications, the geographic regions in which they operate, and the periodic statistics that summarize certification activity. Each entity is materialized as a relational table, and a suite of views joins these tables back together so that analysts can ask questions like "which standard does this certification record reference?" or "how many certificates were issued in this region for this standard?" The following sections walk through the base tables, their columns and cardinality-bounded relationships, and then each view as a reconstructed domain fact.

**Table `management_system_standards`**

| management_system_standard_id | standard_identifier | publication_date | issuing_body | standard_type | version_number | status | certification_record_id | organization_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ISO 9001:2015 | 2025-12-01 | baseline-issuing-13 | Quality Management System | VER-2245 | Published | 100 | 1 |
| 101 | ISO 14001 | 2022-05-12 | pilot-issuing-14 | Environmental Management System | VER-2249 | Draft | 101 | 2 |
| 102 | ISO 13485 | 2023-10-23 | extended-issuing-15 | Medical Devices | VER-2253 | Withdrawn | 102 | 3 |
| 103 | ISO 16949 | 2024-03-07 | integrated-issuing-16 | Automotive | VER-2257 | Published | 103 | 4 |

The `management_system_standards` table is the anchor of the standard catalogue. Its primary key is `management_system_standard_id`, a surrogate integer that uniquely identifies each standard row. The business-identifying column is `standard_identifier`, which carries human-readable labels such as `ISO 9001:2015`, `ISO 14001`, `ISO 13485`, and `ISO 16949`. The `publication_date` column records when the standard was published—for example, `2025-12-01` for ISO 9001:2015 and `2022-05-12` for ISO 14001. The `issuing_body` column names the body that released the standard, with values like `baseline-issuing-13` and `pilot-issuing-14`. The `standard_type` column classifies the domain of the standard (Quality Management System, Environmental Management System, Medical Devices, Automotive), while `version_number` stores version strings such as `VER-2245` and `VER-2249`. The `status` column captures the lifecycle state—`Published`, `Draft`, or `Withdrawn`—and the table also carries two foreign-key columns, `certification_record_id` and `organization_id`, which link the standard to its certification record and the organization that holds it. In the sample data, standard `100` (ISO 9001:2015) is linked to certification record `100` and organization `1`.

**Table `certification_records`**

| certification_record_id | certificate_id | issue_date | expiry_date | scope_description | certification_body | status | organization_id | management_system_standard_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 778563 | 2023-02-01 | 2023-10-24 | Integrated Model A | integrated-certific-58 | Active | 1 | 100 |
| 101 | 7119762 | 2024-07-12 | 2024-03-08 | Extended Cluster | seasonal-certific-59 | Suspended | 2 | 101 |
| 102 | 22106999 | 2025-12-23 | 2025-08-19 | Pilot Review | regional-certific-60 | Withdrawn | 3 | 102 |
| 103 | 2986238 | 2022-05-07 | 2022-01-03 | Baseline Initiative D | legacy-certific-61 | Expired | 4 | 103 |

The `certification_records` table captures the actual certification events. Its primary key is `certification_record_id`. The column `certificate_id` holds the certificate number—values such as `778563`, `7119762`, `22106999`, and `2986238`. The `issue_date` and `expiry_date` columns define the validity window of each certification; for instance, record `100` was issued on `2023-02-01` and expires on `2023-10-24`. The `scope_description` column provides a free-text description of what the certification covers, with entries like `Integrated Model A` and `Extended Cluster`. The `certification_body` column names the certifying authority, with values such as `integrated-certific-58` and `seasonal-certific-59`. The `status` column records the current state of the certification (`Active`, `Suspended`, `Withdrawn`, `Expired`). Two foreign-key columns, `organization_id` and `management_system_standard_id`, tie the record to the organization and the standard. Record `100` links organization `1` (Adaptive Model) to standard `100` (ISO 9001:2015).

**Table `organizations`**

| organization_id | legal_name | country | region | industry_sector | employee_count | certification_record_id | management_system_standard_id |
|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | compact-country-26 | distributed-region-12 | seasonal-industry-35 | 131 | 100 | 100 |
| 2 | Primary Cluster | composite-country-27 | baseline-region-13 | regional-industry-36 | 428 | 101 | 101 |
| 3 | Composite Review D | primary-country-28 | pilot-region-14 | legacy-industry-37 | 3 | 102 | 102 |
| 4 | Compact Initiative | adaptive-country-29 | extended-region-15 | compact-industry-38 | 9 | 103 | 103 |

The `organizations` table stores the certified entities. Its primary key is `organization_id`. The `legal_name` column holds the organization's name—`Adaptive Model`, `Primary Cluster`, `Composite Review D`, and `Compact Initiative` in the sample. The `country` and `region` columns store geographic identifiers such as `compact-country-26` and `distributed-region-12`. The `industry_sector` column classifies the organization's sector (e.g., `seasonal-industry-35`, `regional-industry-36`), and `employee_count` stores the headcount, ranging from `3` employees at Composite Review D to `428` at Primary Cluster. The table also carries `certification_record_id` and `management_system_standard_id` as foreign keys, linking each organization to its certification record and standard. Organization `1` (Adaptive Model) is linked to certification record `100` and standard `100`.

**Table `geographic_regions`**

| id | region_code | region_name | continent | organization_id | certification_statistic_id |
|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | baseline-continen-19 | 1 | 1 |
| 2 | 6564391 | Adaptive Survey D | pilot-continen-20 | 2 | 2 |
| 3 | 778560 | Primary Corridor | extended-continen-21 | 3 | 3 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | integrated-continen-22 | 4 | 4 |

The `geographic_regions` table models the regions in which organizations operate. Its primary key is `id`. The `region_code` column stores a code—values include `1562837`, `6564391`, `778560`, and a longer hash-like identifier `8667ec1da10c4a0293d91388b49bc77c`. The `region_name` column provides a human-readable name such as `Distributed Assessment`, `Adaptive Survey D`, `Primary Corridor`, and `Composite Series`. The `continent` column stores the continent identifier (e.g., `baseline-continen-19`, `pilot-continen-20`). The table carries two foreign keys: `organization_id` links the region to the organization operating there, and `certification_statistic_id` links it to the statistics report. Region `1` (Distributed Assessment) is associated with organization `1` and certification statistic `1`.

**Table `certification_statistics`**

| certification_statistic_id | statistic_id | report_date | total_certificates | standard_specific_count | geographic_region_id | management_system_standard_id |
|---|---|---|---|---|---|---|
| 1 | 8350035 | 2024-03-02 | 75 | 9 | 1 | 100 |
| 2 | 13831 | 2025-08-13 | 18 | 1 | 2 | 101 |
| 3 | BJewellGraham | 2022-01-24 | 77 | 0 | 3 | 102 |
| 4 | 121 | 2023-06-08 | 19 | 9 | 4 | 103 |

The `certification_statistics` table holds periodic summary reports. Its primary key is `certification_statistic_id`. The `statistic_id` column stores a secondary identifier—values include `8350035`, `13831`, `BJewellGraham`, and `121`. The `report_date` column records when the report was generated, with dates such as `2024-03-02` and `2025-08-13`. The `total_certificates` column counts the total certificates in the report (e.g., `75`, `18`, `77`, `19`), and `standard_specific_count` counts certificates specific to a standard (e.g., `9`, `1`, `0`, `9`). Two foreign-key columns, `geographic_region_id` and `management_system_standard_id`, link the statistic to a region and a standard. Statistic `1` covers region `1` and standard `100` (ISO 9001:2015), reporting `75` total certificates with `9` standard-specific.

The foreign-key relationships between the five base tables form a normalized graph. The `management_system_standards` table references `certification_records` via `certification_record_id` and `organizations` via `organization_id`. The `certification_records` table references `organizations` via `organization_id` and `management_system_standards` via `management_system_standard_id`. The `organizations` table references `certification_records` via `certification_record_id` and `management_system_standards` via `management_system_standard_id`. The `geographic_regions` table references `organizations` via `organization_id` and `certification_statistics` via `certification_statistic_id`. The `certification_statistics` table references `geographic_regions` via `geographic_region_id` and `management_system_standards` via `management_system_standard_id`. This web of relationships ensures that every certification fact can be traced back to its standard, its organization, its region, and its statistical summary.

**View `vw_management_system_standard_certification_record`**

```sql
CREATE VIEW vw_management_system_standard_certification_record AS
SELECT a.management_system_standard_id, a.standard_identifier, a.publication_date, a.issuing_body, b.certification_record_id AS record_certification_record_id, b.certificate_id AS record_certificate_id, b.issue_date AS record_issue_date
FROM management_system_standards a JOIN certification_records b ON a.certification_record_id = b.certification_record_id;
```

| management_system_standard_id | standard_identifier | publication_date | issuing_body | record_certification_record_id | record_certificate_id | record_issue_date |
|---|---|---|---|---|---|---|
| 100 | ISO 9001:2015 | 2025-12-01 | baseline-issuing-13 | 100 | 778563 | 2023-02-01 |
| 101 | ISO 14001 | 2022-05-12 | pilot-issuing-14 | 101 | 7119762 | 2024-07-12 |
| 102 | ISO 13485 | 2023-10-23 | extended-issuing-15 | 102 | 22106999 | 2025-12-23 |
| 103 | ISO 16949 | 2024-03-07 | integrated-issuing-16 | 103 | 2986238 | 2022-05-07 |

The view `vw_management_system_standard_certification_record` joins `management_system_standards` to `certification_records` on `certification_record_id`, reconstructing the fact "which certification record is associated with which standard." The view selects the standard's `management_system_standard_id`, `standard_identifier`, `publication_date`, and `issuing_body`, and renames the certification record's columns with a `record_` prefix to avoid ambiguity. Reading the first row, standard `100` (ISO 9001:2015), published on `2025-12-01` by `baseline-issuing-13`, is linked to certification record `100` with certificate number `778563`, issued on `2023-02-01`. The second row shows standard `101` (ISO 14001) linked to record `101` (certificate `7119762`, issued `2024-07-12`). This view answers the question: given a standard, what is its certification record and when was that record issued?

**View `vw_management_system_standard_organization`**

```sql
CREATE VIEW vw_management_system_standard_organization AS
SELECT a.management_system_standard_id, a.standard_identifier, a.publication_date, a.issuing_body, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name, b.country AS organization_country
FROM management_system_standards a JOIN organizations b ON a.organization_id = b.organization_id;
```

| management_system_standard_id | standard_identifier | publication_date | issuing_body | organization_organization_id | organization_legal_name | organization_country |
|---|---|---|---|---|---|---|
| 100 | ISO 9001:2015 | 2025-12-01 | baseline-issuing-13 | 1 | Adaptive Model | compact-country-26 |
| 101 | ISO 14001 | 2022-05-12 | pilot-issuing-14 | 2 | Primary Cluster | composite-country-27 |
| 102 | ISO 13485 | 2023-10-23 | extended-issuing-15 | 3 | Composite Review D | primary-country-28 |
| 103 | ISO 16949 | 2024-03-07 | integrated-issuing-16 | 4 | Compact Initiative | adaptive-country-29 |

The view `vw_management_system_standard_organization` joins `management_system_standards` to `organizations` on `organization_id`, answering "which organization holds which standard." Although the SQL definition is not shown in the payload, the view's purpose is to surface the standard's identity alongside the organization's legal name, country, region, industry sector, and employee count. In the sample data, standard `100` (ISO 9001:2015) is held by organization `1` (Adaptive Model), a compact-country-based entity with `131` employees in the seasonal-industry-35 sector. This view materializes the standard-to-organization assignment as a flat, queryable fact.

**View `vw_certification_record_organization`**

```sql
CREATE VIEW vw_certification_record_organization AS
SELECT a.certification_record_id, a.certificate_id, a.issue_date, a.expiry_date, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name, b.country AS organization_country
FROM certification_records a JOIN organizations b ON a.organization_id = b.organization_id;
```

| certification_record_id | certificate_id | issue_date | expiry_date | organization_organization_id | organization_legal_name | organization_country |
|---|---|---|---|---|---|---|
| 100 | 778563 | 2023-02-01 | 2023-10-24 | 1 | Adaptive Model | compact-country-26 |
| 101 | 7119762 | 2024-07-12 | 2024-03-08 | 2 | Primary Cluster | composite-country-27 |
| 102 | 22106999 | 2025-12-23 | 2025-08-19 | 3 | Composite Review D | primary-country-28 |
| 103 | 2986238 | 2022-05-07 | 2022-01-03 | 4 | Compact Initiative | adaptive-country-29 |

The view `vw_certification_record_organization` joins `certification_records` to `organizations` on `organization_id`, answering "which organization holds which certification record." The joined result pairs the record's `certificate_id`, `issue_date`, `expiry_date`, `scope_description`, `certification_body`, and `status` with the organization's `legal_name`, `country`, `region`, `industry_sector`, and `employee_count`. For example, record `100` (certificate `778563`, scope `Integrated Model A`, status `Active`) is held by Adaptive Model, a 131-employee organization in compact-country-26. This view is the operational bridge between certification events and the entities that hold them.

**View `vw_certification_record_management_system_standard`**

```sql
CREATE VIEW vw_certification_record_management_system_standard AS
SELECT a.certification_record_id, a.certificate_id, a.issue_date, a.expiry_date, b.management_system_standard_id AS standard_management_system_standard_id, b.standard_identifier AS standard_standard_identifier, b.publication_date AS standard_publication_date
FROM certification_records a JOIN management_system_standards b ON a.management_system_standard_id = b.management_system_standard_id;
```

| certification_record_id | certificate_id | issue_date | expiry_date | standard_management_system_standard_id | standard_standard_identifier | standard_publication_date |
|---|---|---|---|---|---|---|
| 100 | 778563 | 2023-02-01 | 2023-10-24 | 100 | ISO 9001:2015 | 2025-12-01 |
| 101 | 7119762 | 2024-07-12 | 2024-03-08 | 101 | ISO 14001 | 2022-05-12 |
| 102 | 22106999 | 2025-12-23 | 2025-08-19 | 102 | ISO 13485 | 2023-10-23 |
| 103 | 2986238 | 2022-05-07 | 2022-01-03 | 103 | ISO 16949 | 2024-03-07 |

The view `vw_certification_record_management_system_standard` joins `certification_records` to `management_system_standards` on `management_system_standard_id`, answering "which standard does this certification record certify?" The result pairs the record's `certificate_id`, `issue_date`, `expiry_date`, `scope_description`, `certification_body`, and `status` with the standard's `standard_identifier`, `publication_date`, `issuing_body`, `standard_type`, `version_number`, and `status`. Record `100` (certificate `778563`, scope `Integrated Model A`, status `Active`) certifies standard `100` (ISO 9001:2015, published `2025-12-01`, type Quality Management System, version `VER-2245`, status `Published`). This view is the canonical link between a certification event and the standard it validates.

**View `vw_organization_certification_record`**

```sql
CREATE VIEW vw_organization_certification_record AS
SELECT a.organization_id, a.legal_name, a.country, a.region, b.certification_record_id AS record_certification_record_id, b.certificate_id AS record_certificate_id, b.issue_date AS record_issue_date
FROM organizations a JOIN certification_records b ON a.certification_record_id = b.certification_record_id;
```

| organization_id | legal_name | country | region | record_certification_record_id | record_certificate_id | record_issue_date |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | compact-country-26 | distributed-region-12 | 100 | 778563 | 2023-02-01 |
| 2 | Primary Cluster | composite-country-27 | baseline-region-13 | 101 | 7119762 | 2024-07-12 |
| 3 | Composite Review D | primary-country-28 | pilot-region-14 | 102 | 22106999 | 2025-12-23 |
| 4 | Compact Initiative | adaptive-country-29 | extended-region-15 | 103 | 2986238 | 2022-05-07 |

The view `vw_organization_certification_record` joins `organizations` to `certification_records` on `certification_record_id`, answering "which certification record does this organization hold?" The result pairs the organization's `legal_name`, `country`, `region`, `industry_sector`, and `employee_count` with the record's `certificate_id`, `issue_date`, `expiry_date`, `scope_description`, `certification_body`, and `status`. Organization `2` (Primary Cluster, `428` employees, composite-country-27) holds record `101` (certificate `7119762`, scope `Extended Cluster`, status `Suspended`). This view is the inverse of `vw_certification_record_organization` and provides the same fact from the organization's perspective.

**View `vw_organization_management_system_standard`**

```sql
CREATE VIEW vw_organization_management_system_standard AS
SELECT a.organization_id, a.legal_name, a.country, a.region, b.management_system_standard_id AS standard_management_system_standard_id, b.standard_identifier AS standard_standard_identifier, b.publication_date AS standard_publication_date
FROM organizations a JOIN management_system_standards b ON a.management_system_standard_id = b.management_system_standard_id;
```

| organization_id | legal_name | country | region | standard_management_system_standard_id | standard_standard_identifier | standard_publication_date |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | compact-country-26 | distributed-region-12 | 100 | ISO 9001:2015 | 2025-12-01 |
| 2 | Primary Cluster | composite-country-27 | baseline-region-13 | 101 | ISO 14001 | 2022-05-12 |
| 3 | Composite Review D | primary-country-28 | pilot-region-14 | 102 | ISO 13485 | 2023-10-23 |
| 4 | Compact Initiative | adaptive-country-29 | extended-region-15 | 103 | ISO 16949 | 2024-03-07 |

The view `vw_organization_management_system_standard` joins `organizations` to `management_system_standards` on `management_system_standard_id`, answering "which standard does this organization hold?" The result pairs the organization's `legal_name`, `country`, `region`, `industry_sector`, and `employee_count` with the standard's `standard_identifier`, `publication_date`, `issuing_body`, `standard_type`, `version_number`, and `status`. Organization `3` (Composite Review D, `3` employees, primary-country-28) holds standard `102` (ISO 13485, published `2023-10-23`, type Medical Devices, version `VER-2253`, status `Withdrawn`). This view materializes the organization-to-standard assignment as a flat fact.

**View `vw_geographic_region_organization`**

```sql
CREATE VIEW vw_geographic_region_organization AS
SELECT a.id, a.region_code, a.region_name, a.continent, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name, b.country AS organization_country
FROM geographic_regions a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | region_code | region_name | continent | organization_organization_id | organization_legal_name | organization_country |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | baseline-continen-19 | 1 | Adaptive Model | compact-country-26 |
| 2 | 6564391 | Adaptive Survey D | pilot-continen-20 | 2 | Primary Cluster | composite-country-27 |
| 3 | 778560 | Primary Corridor | extended-continen-21 | 3 | Composite Review D | primary-country-28 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | integrated-continen-22 | 4 | Compact Initiative | adaptive-country-29 |

The view `vw_geographic_region_organization` joins `geographic_regions` to `organizations` on `organization_id`, answering "which organizations operate in which geographic region?" The result pairs the region's `region_code`, `region_name`, and `continent` with the organization's `legal_name`, `country`, `region`, `industry_sector`, and `employee_count`. Region `1` (Distributed Assessment, code `1562837`, continent `baseline-continen-19`) contains organization `1` (Adaptive Model, `131` employees, seasonal-industry-35). Region `4` (Composite Series, code `8667ec1da10c4a0293d91388b49bc77c`, continent `integrated-continen-22`) contains organization `4` (Compact Initiative, `9` employees, compact-industry-38). This view answers the geographic distribution question across the certified entity landscape.

**View `vw_geographic_region_certification_statistic`**

```sql
CREATE VIEW vw_geographic_region_certification_statistic AS
SELECT a.id, a.region_code, a.region_name, a.continent, b.certification_statistic_id AS statistic_certification_statistic_id, b.statistic_id AS statistic_statistic_id, b.report_date AS statistic_report_date
FROM geographic_regions a JOIN certification_statistics b ON a.certification_statistic_id = b.certification_statistic_id;
```

| id | region_code | region_name | continent | statistic_certification_statistic_id | statistic_statistic_id | statistic_report_date |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | baseline-continen-19 | 1 | 8350035 | 2024-03-02 |
| 2 | 6564391 | Adaptive Survey D | pilot-continen-20 | 2 | 13831 | 2025-08-13 |
| 3 | 778560 | Primary Corridor | extended-continen-21 | 3 | BJewellGraham | 2022-01-24 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | integrated-continen-22 | 4 | 121 | 2023-06-08 |

The view `vw_geographic_region_certification_statistic` joins `geographic_regions` to `certification_statistics` on `certification_statistic_id`, answering "which statistics report covers which geographic region?" The result pairs the region's `region_code`, `region_name`, and `continent` with the statistic's `statistic_id`, `report_date`, `total_certificates`, and `standard_specific_count`. Region `2` (Adaptive Survey D, code `6564391`, continent `pilot-continen-20`) is covered by statistic `2` (statistic_id `13831`, report_date `2025-08-13`, `18` total certificates, `1` standard-specific). Region `3` (Primary Corridor, code `778560`, continent `extended-continen-21`) is covered by statistic `3` (statistic_id `BJewellGraham`, report_date `2022-01-24`, `77` total certificates, `0` standard-specific). This view links geographic coverage to statistical reporting.

**View `vw_certification_statistic_geographic_region`**

```sql
CREATE VIEW vw_certification_statistic_geographic_region AS
SELECT a.certification_statistic_id, a.statistic_id, a.report_date, a.total_certificates, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM certification_statistics a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| certification_statistic_id | statistic_id | report_date | total_certificates | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 8350035 | 2024-03-02 | 75 | 1 | 1562837 | Distributed Assessment |
| 2 | 13831 | 2025-08-13 | 18 | 2 | 6564391 | Adaptive Survey D |
| 3 | BJewellGraham | 2022-01-24 | 77 | 3 | 778560 | Primary Corridor |
| 4 | 121 | 2023-06-08 | 19 | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

The view `vw_certification_statistic_geographic_region` joins `certification_statistics` to `geographic_regions` on `geographic_region_id`, answering "which geographic region does this statistics report cover?" The result pairs the statistic's `statistic_id`, `report_date`, `total_certificates`, and `standard_specific_count` with the region's `region_code`, `region_name`, and `continent`. Statistic `1` (statistic_id `8350035`, report_date `2024-03-02`, `75` total certificates, `9` standard-specific) covers region `1` (Distributed Assessment, code `1562837`, continent `baseline-continen-19`). Statistic `4` (statistic_id `121`, report_date `2023-06-08`, `19` total certificates, `9` standard-specific) covers region `4` (Composite Series, code `8667ec1da10c4a0293d91388b49bc77c`, continent `integrated-continen-22`). This view is the inverse of `vw_geographic_region_certification_statistic` and provides the same fact from the statistic's perspective.

**View `vw_certification_statistic_management_system_standard`**

```sql
CREATE VIEW vw_certification_statistic_management_system_standard AS
SELECT a.certification_statistic_id, a.statistic_id, a.report_date, a.total_certificates, b.management_system_standard_id AS standard_management_system_standard_id, b.standard_identifier AS standard_standard_identifier, b.publication_date AS standard_publication_date
FROM certification_statistics a JOIN management_system_standards b ON a.management_system_standard_id = b.management_system_standard_id;
```

| certification_statistic_id | statistic_id | report_date | total_certificates | standard_management_system_standard_id | standard_standard_identifier | standard_publication_date |
|---|---|---|---|---|---|---|
| 1 | 8350035 | 2024-03-02 | 75 | 100 | ISO 9001:2015 | 2025-12-01 |
| 2 | 13831 | 2025-08-13 | 18 | 101 | ISO 14001 | 2022-05-12 |
| 3 | BJewellGraham | 2022-01-24 | 77 | 102 | ISO 13485 | 2023-10-23 |
| 4 | 121 | 2023-06-08 | 19 | 103 | ISO 16949 | 2024-03-07 |

The view `vw_certification_statistic_management_system_standard` joins `certification_statistics` to `management_system_standards` on `management_system_standard_id`, answering "which standard does this statistics report cover?" The result pairs the statistic's `statistic_id`, `report_date`, `total_certificates`, and `standard_specific_count` with the standard's `standard_identifier`, `publication_date`, `issuing_body`, `standard_type`, `version_number`, and `status`. Statistic `1` (statistic_id `8350035`, report_date `2024-03-02`, `75` total certificates, `9` standard-specific) covers standard `100` (ISO 9001:2015, published `2025-12-01`, type Quality Management System, version `VER-2245`, status `Published`). Statistic `3` (statistic_id `BJewellGraham`, report_date `2022-01-24`, `77` total certificates, `0` standard-specific) covers standard `102` (ISO 13485, published `2023-10-23`, type Medical Devices, version `VER-2253`, status `Withdrawn`). This view answers the question: given a statistics report, which standard does it summarize?

The materialization of this domain into a relational schema demonstrates how entity types, their attributes, and their cardinality-bounded relationships become columns, foreign keys, and junction tables. Each base table stores one entity type with its atomic attributes, and the foreign keys encode the many-to-one and one-to-one relationships that bind the entities together. The views then join these normalized tables back into denormalized facts that answer specific analytical questions. The certification lifecycle—standard issuance, certification event, organizational holding, geographic placement, and statistical summary—is fully reconstructable from this schema. Every row in every view corresponds to a single domain fact, and every fact can be traced back through the foreign keys to its source tables. This design supports both operational queries (which organization holds which certification?) and analytical queries (how many certificates were issued in this region for this standard?) without requiring application-level joins.