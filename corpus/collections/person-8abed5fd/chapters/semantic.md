The domain under examination is a corporate governance and strategic-planning ontology, where people, organizations, professional roles, strategic initiatives, geographic markets, and industry sectors are modelled as first-class entity types. Each entity type materialises as a base table in a normalised relational schema. The tables are linked by foreign-key columns that encode cardinality-bounded relationships — for example, a person holds at most one professional role within a single organisation, while a strategic initiative may span multiple geographic markets and industry sectors. The schema also provides a set of materialised views that re-join these normalised tables so that analysts can query domain facts without writing joins by hand. The following sections walk through each base table, explain how its columns arise from the ontology, and then interpret every view as a reconstructed domain fact.

## Base Tables and Their Ontological Origins

The `persons` table is the leaf node of the people hierarchy. It stores one row per individual and carries a surrogate primary key `person_id`, a human-readable `full_name`, contact attributes `email_address` and `phone`, a numeric `years_of_experience`, and two foreign keys — `professional_role_id` and `organization_id` — that bind the person to their role and employer respectively. The first row, for instance, records `Theodore Mcgrath` (`person_id = 1`) with seven years of experience, whose role and organisation are both referenced by the value `100`. The second row, `Account Name` (`person_id = 2`), has ten years of experience and is linked to role `101` and organisation `101`. The third row is anomalous in its naming: `Saipan International Airport` (`person_id = 3`) carries thirteen years of experience and references role `102` and organisation `102`, suggesting that the dataset conflates person and organisation names in synthetic data. The fourth row, `Norma Fisher` (`person_id = 4`), has sixteen years of experience and points to role `103` and organisation `103`.

**Table `persons`**

| person_id | full_name | email_address | phone | years_of_experience | professional_role_id | organization_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | primary-email-70 | compact-phone-26 | 7 | 100 | 100 |
| 2 | Account Name | adaptive-email-71 | composite-phone-27 | 10 | 101 | 101 |
| 3 | Saipan International Airport | distributed-email-72 | primary-phone-28 | 13 | 102 | 102 |
| 4 | Norma Fisher | baseline-email-73 | adaptive-phone-29 | 16 | 103 | 103 |

The `organizations` table stores one row per legal entity or business unit. Its surrogate key is `id`, while `org_id` carries a business-level identifier (e.g. `790471` for the first row). The remaining columns — `org_name`, `website`, `mission_statement`, `vision_statement` — are descriptive attributes. Two foreign keys, `person_id` and `has_council_member_person_id`, point back to `persons`, encoding a one-to-one or one-to-few relationship between an organisation and its principal person and council member. The `industry_sector_id` column links the organisation to its sector. Row `100` describes `Extended Review` (`org_id = 790471`) with a mission statement `compact-mission-14` and vision `composite-vision-87`, associated with person `1` and sector `1`. Row `103` describes `Distributed Cluster` (`org_id = m16`) with mission `adaptive-mission-17` and vision `distributed-vision-90`, linked to person `4` and sector `4`.

**Table `organizations`**

| id | org_id | org_name | website | mission_statement | vision_statement | person_id | has_council_member_person_id | industry_sector_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 790471 | Extended Review | https://bugs.launchpad.net/murano/+bug/1294080 | compact-mission-14 | composite-vision-87 | 1 | 1 | 1 |
| 101 | 1717 | Pilot Initiative A | https://bugs.launchpad.net/murano/+bug/1294080 | composite-mission-15 | primary-vision-88 | 2 | 2 | 2 |
| 102 | 69437 | Baseline Model | https://www.nature.com/articles/nphoton.2008.245 | primary-mission-16 | adaptive-vision-89 | 3 | 3 | 3 |
| 103 | m16 | Distributed Cluster | https://bugs.launchpad.net/trove/+bug/1347114 | adaptive-mission-17 | distributed-vision-90 | 4 | 4 | 4 |

The `professional_roles` table captures the employment relationship between a person and an organisation, enriched with role metadata. Its primary key is `professional_role_id`. The columns `role_title`, `department`, `start_date`, `responsibilities`, and `reporting_to` describe the role itself, while `person_id`, `organization_id`, and `strategic_initiative_id` are foreign keys that bind the role to its holder, its host organisation, and the strategic initiative it supports. The first row, `Distributed Standard` (`professional_role_id = 100`), was created on `2025-01-01 00:14:00`, started on `2022-09-05`, and is associated with person `1`, organisation `100`, and strategic initiative `100`. The fourth row, `Composite Programme` (`professional_role_id = 103`), started on `2025-12-11` and is linked to person `4`, organisation `103`, and strategic initiative `103`.

**Table `professional_roles`**

| professional_role_id | role_title | department | start_date | responsibilities | reporting_to | person_id | organization_id | strategic_initiative_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Distributed Standard | adaptive-departme-89 | 2022-09-05 | integrated-responsi-58 | integrated-reportin-82 | 1 | 100 | 100 | 2025-01-01 00:14:00 |
| 101 | Adaptive Framework D | distributed-departme-90 | 2023-02-16 | seasonal-responsi-59 | seasonal-reportin-83 | 2 | 101 | 101 | 2025-02-06 03:14:00 |
| 102 | Primary Protocol | baseline-departme-91 | 2024-07-27 | regional-responsi-60 | regional-reportin-84 | 3 | 102 | 102 | 2025-03-11 06:14:00 |
| 103 | Composite Programme | pilot-departme-92 | 2025-12-11 | legacy-responsi-61 | legacy-reportin-85 | 4 | 103 | 103 | 2025-04-16 09:14:00 |

The `strategic_initiatives` table records corporate programmes. Its surrogate key is `id`, and `initiative_id` carries a business identifier (e.g. `compta` for the first row). The columns `initiative_name`, `target_region`, `status`, and `description` are descriptive. The foreign keys `professional_role_id`, `geographic_market_id`, and `industry_sector_id` bind the initiative to a role, a market, and a sector. Row `100` is named `Baseline Corridor D`, has status `planned`, and is linked to role `100`, market `1`, and sector `1`. Row `101`, `Distributed Series`, has status `active` and references role `101`, market `2`, and sector `2`.

**Table `strategic_initiatives`**

| id | initiative_id | initiative_name | target_region | status | description | professional_role_id | geographic_market_id | industry_sector_id |
|---|---|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | extended-target-87 | planned | Extended Survey | 100 | 1 | 1 |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | integrated-target-88 | active | Pilot Corridor A | 101 | 2 | 2 |
| 102 | 8928495 | Adaptive Assessment | seasonal-target-89 | completed | Baseline Series | 102 | 3 | 3 |
| 103 | 392495 | Primary Survey A | regional-target-90 | cancelled | Distributed Assessment | 103 | 4 | 4 |

The `geographic_markets` table stores market definitions. Its surrogate key is `id`, and `market_id` carries a UUID-style business identifier. The columns `region_name`, `country_code`, and `market_type` (e.g. `domestic`, `international`, `emerging`) describe the market. Foreign keys `strategic_initiative_id` and `industry_sector_id` link the market to an initiative and a sector. Row `1` has region `Distributed Assessment`, market type `domestic`, and is linked to initiative `100` and sector `1`. Row `2` has region `Adaptive Survey D`, market type `international`, and is linked to initiative `101` and sector `2`.

**Table `geographic_markets`**

| id | market_id | region_name | country_code | market_type | strategic_initiative_id | industry_sector_id |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | domestic | 100 | 1 |
| 2 | 1889766 | Adaptive Survey D | lu_tax_code_template_m_I_2 | international | 101 | 2 |
| 3 | eb7b0b58-8fd1-11eb-924d-9cd76263cbd0 | Primary Corridor | default_chart_a_account_57 | emerging | 102 | 3 |
| 4 | 8928496 | Composite Series | 727045 | domestic | 103 | 4 |

The `industry_sectors` table stores sector classifications. Its surrogate key is `industry_sector_id`, and `sector_id` carries a business identifier. The columns `sector_name` and `classification_code` describe the sector. Foreign keys `organization_id` and `strategic_initiative_id` link the sector to an organisation and an initiative. Row `1` is named `Distributed Survey` with classification code `IVC10Iind`, linked to organisation `100` and initiative `100`. Row `4` is named `Composite Assessment` with classification code `5082984`, linked to organisation `103` and initiative `103`.

**Table `industry_sectors`**

| industry_sector_id | sector_id | sector_name | classification_code | organization_id | strategic_initiative_id |
|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | IVC10Iind | 100 | 100 |
| 2 | 726049 | Adaptive Corridor D | id_17 | 101 | 101 |
| 3 | 103175 | Primary Series | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 102 | 102 |
| 4 | 9125631 | Composite Assessment | 5082984 | 103 | 103 |

## Foreign-Key Topology and Cardinality

The foreign-key graph forms a star-like topology centred on `professional_roles` and `strategic_initiatives`. The `persons` table points to `professional_roles` via `professional_role_id` and to `organizations` via `organization_id`. The `organizations` table points back to `persons` via `person_id` and `has_council_member_person_id`, and forward to `industry_sectors` via `industry_sector_id`. The `professional_roles` table points to `persons`, `organizations`, and `strategic_initiatives`. The `strategic_initiatives` table points to `professional_roles`, `geographic_markets`, and `industry_sectors`. The `geographic_markets` table points to `strategic_initiatives` and `industry_sectors`. The `industry_sectors` table points to `organizations` and `strategic_initiatives`. This bidirectional linking ensures that every entity can be reached from any other through at most two hops, which is the hallmark of a well-normalised star schema.

## Materialised Views as Reconstructed Domain Facts

Each view in the schema is a pre-joined query that answers a specific analytical question. The following sections interpret every view by reading concrete rows as evidence.

### Person-to-Role Mapping

The view `v_person_professional_role` joins `persons` to `professional_roles` on `persons.professional_role_id = professional_roles.professional_role_id`. It answers the question: "What role does each person hold?" The first row of the view would show `Theodore Mcgrath` holding the role `Distributed Standard` in department `adaptive-departme-89`, with responsibilities `integrated-responsi-58`. The second row would show `Account Name` holding `Adaptive Framework D` in department `distributed-departme-90`.

**View `v_person_professional_role`**

```sql
CREATE VIEW v_person_professional_role AS
SELECT a.person_id, a.full_name, a.email_address, a.phone, b.professional_role_id AS role_professional_role_id, b.role_title AS role_role_title, b.department AS role_department
FROM persons a JOIN professional_roles b ON a.professional_role_id = b.professional_role_id;
```

| person_id | full_name | email_address | phone | role_professional_role_id | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | primary-email-70 | compact-phone-26 | 100 | Distributed Standard | adaptive-departme-89 |
| 2 | Account Name | adaptive-email-71 | composite-phone-27 | 101 | Adaptive Framework D | distributed-departme-90 |
| 3 | Saipan International Airport | distributed-email-72 | primary-phone-28 | 102 | Primary Protocol | baseline-departme-91 |
| 4 | Norma Fisher | baseline-email-73 | adaptive-phone-29 | 103 | Composite Programme | pilot-departme-92 |

### Person-to-Organisation Mapping

The view `v_person_organization` joins `persons` to `organizations` on `persons.organization_id = organizations.id`. It answers: "Which organisation does each person belong to?" The first row would show `Theodore Mcgrath` employed by `Extended Review` (`org_id = 790471`), whose mission is `compact-mission-14`. The second row would show `Account Name` employed by `Pilot Initiative A` (`org_id = 1717`).

**View `v_person_organization`**

```sql
CREATE VIEW v_person_organization AS
SELECT a.person_id, a.full_name, a.email_address, a.phone, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM persons a JOIN organizations b ON a.organization_id = b.id;
```

| person_id | full_name | email_address | phone | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | primary-email-70 | compact-phone-26 | 100 | 790471 | Extended Review |
| 2 | Account Name | adaptive-email-71 | composite-phone-27 | 101 | 1717 | Pilot Initiative A |
| 3 | Saipan International Airport | distributed-email-72 | primary-phone-28 | 102 | 69437 | Baseline Model |
| 4 | Norma Fisher | baseline-email-73 | adaptive-phone-29 | 103 | m16 | Distributed Cluster |

### Organisation-to-Person Mapping

The view `v_organization_person` joins `organizations` to `persons` on `organizations.person_id = persons.person_id`. It answers the inverse question: "Which person is associated with each organisation?" The first row would show `Extended Review` associated with `Theodore Mcgrath` (`person_id = 1`), and the fourth row would show `Distributed Cluster` associated with `Norma Fisher` (`person_id = 4`).

**View `v_organization_person`**

```sql
CREATE VIEW v_organization_person AS
SELECT a.id, a.org_id, a.org_name, a.website, b.person_id AS person_person_id, b.full_name AS person_full_name, b.email_address AS person_email_address
FROM organizations a JOIN persons b ON a.person_id = b.person_id;
```

| id | org_id | org_name | website | person_person_id | person_full_name | person_email_address |
|---|---|---|---|---|---|---|
| 100 | 790471 | Extended Review | https://bugs.launchpad.net/murano/+bug/1294080 | 1 | Theodore Mcgrath | primary-email-70 |
| 101 | 1717 | Pilot Initiative A | https://bugs.launchpad.net/murano/+bug/1294080 | 2 | Account Name | adaptive-email-71 |
| 102 | 69437 | Baseline Model | https://www.nature.com/articles/nphoton.2008.245 | 3 | Saipan International Airport | distributed-email-72 |
| 103 | m16 | Distributed Cluster | https://bugs.launchpad.net/trove/+bug/1347114 | 4 | Norma Fisher | baseline-email-73 |

### Organisation-to-Sector Mapping

The view `v_organization_industry_sector` joins `organizations` to `industry_sectors` on `organizations.industry_sector_id = industry_sectors.industry_sector_id`. It answers: "In which sector does each organisation operate?" The first row would show `Extended Review` operating in sector `Distributed Survey` (`sector_id = 7119771`) with classification code `IVC10Iind`. The fourth row would show `Distributed Cluster` operating in sector `Composite Assessment` (`sector_id = 9125631`).

**View `v_organization_industry_sector`**

```sql
CREATE VIEW v_organization_industry_sector AS
SELECT a.id, a.org_id, a.org_name, a.website, b.industry_sector_id AS sector_industry_sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM organizations a JOIN industry_sectors b ON a.industry_sector_id = b.industry_sector_id;
```

| id | org_id | org_name | website | sector_industry_sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|---|
| 100 | 790471 | Extended Review | https://bugs.launchpad.net/murano/+bug/1294080 | 1 | 7119771 | Distributed Survey |
| 101 | 1717 | Pilot Initiative A | https://bugs.launchpad.net/murano/+bug/1294080 | 2 | 726049 | Adaptive Corridor D |
| 102 | 69437 | Baseline Model | https://www.nature.com/articles/nphoton.2008.245 | 3 | 103175 | Primary Series |
| 103 | m16 | Distributed Cluster | https://bugs.launchpad.net/trove/+bug/1347114 | 4 | 9125631 | Composite Assessment |

### Role-to-Person Mapping

The view `v_professional_role_person` joins `professional_roles` to `persons` on `professional_roles.person_id = persons.person_id`. It answers: "Who holds each professional role?" The first row would show role `Distributed Standard` held by `Theodore Mcgrath`, and the third row would show role `Primary Protocol` held by `Saipan International Airport`.

**View `v_professional_role_person`**

```sql
CREATE VIEW v_professional_role_person AS
SELECT a.professional_role_id, a.role_title, a.department, a.start_date, b.person_id AS person_person_id, b.full_name AS person_full_name, b.email_address AS person_email_address
FROM professional_roles a JOIN persons b ON a.person_id = b.person_id;
```

| professional_role_id | role_title | department | start_date | person_person_id | person_full_name | person_email_address |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | adaptive-departme-89 | 2022-09-05 | 1 | Theodore Mcgrath | primary-email-70 |
| 101 | Adaptive Framework D | distributed-departme-90 | 2023-02-16 | 2 | Account Name | adaptive-email-71 |
| 102 | Primary Protocol | baseline-departme-91 | 2024-07-27 | 3 | Saipan International Airport | distributed-email-72 |
| 103 | Composite Programme | pilot-departme-92 | 2025-12-11 | 4 | Norma Fisher | baseline-email-73 |

### Role-to-Organisation Mapping

The view `v_professional_role_organization` joins `professional_roles` to `organizations` on `professional_roles.organization_id = organizations.id`. It answers: "Which organisation employs the holder of each role?" The first row would show role `Distributed Standard` employed by `Extended Review` (`org_id = 790471`), and the fourth row would show role `Composite Programme` employed by `Distributed Cluster` (`org_id = m16`).

**View `v_professional_role_organization`**

```sql
CREATE VIEW v_professional_role_organization AS
SELECT a.professional_role_id, a.role_title, a.department, a.start_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM professional_roles a JOIN organizations b ON a.organization_id = b.id;
```

| professional_role_id | role_title | department | start_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | adaptive-departme-89 | 2022-09-05 | 100 | 790471 | Extended Review |
| 101 | Adaptive Framework D | distributed-departme-90 | 2023-02-16 | 101 | 1717 | Pilot Initiative A |
| 102 | Primary Protocol | baseline-departme-91 | 2024-07-27 | 102 | 69437 | Baseline Model |
| 103 | Composite Programme | pilot-departme-92 | 2025-12-11 | 103 | m16 | Distributed Cluster |

### Role-to-Initiative Mapping

The view `v_professional_role_strategic_initiative` joins `professional_roles` to `strategic_initiatives` on `professional_roles.strategic_initiative_id = strategic_initiatives.id`. It answers: "Which strategic initiative does each role support?" The first row would show role `Distributed Standard` supporting initiative `Baseline Corridor D` (`initiative_id = compta`) with status `planned`. The second row would show role `Adaptive Framework D` supporting initiative `Distributed Series` (`initiative_id = f209107c-8fcd-11eb-924d-9cd76263cbd0`) with status `active`.

**View `v_professional_role_strategic_initiative`**

```sql
CREATE VIEW v_professional_role_strategic_initiative AS
SELECT a.professional_role_id, a.role_title, a.department, a.start_date, b.id AS initiative_id, b.initiative_id AS initiative_initiative_id, b.initiative_name AS initiative_initiative_name
FROM professional_roles a JOIN strategic_initiatives b ON a.strategic_initiative_id = b.id;
```

| professional_role_id | role_title | department | start_date | initiative_id | initiative_initiative_id | initiative_initiative_name |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | adaptive-departme-89 | 2022-09-05 | 100 | compta | Baseline Corridor D |
| 101 | Adaptive Framework D | distributed-departme-90 | 2023-02-16 | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 102 | Primary Protocol | baseline-departme-91 | 2024-07-27 | 102 | 8928495 | Adaptive Assessment |
| 103 | Composite Programme | pilot-departme-92 | 2025-12-11 | 103 | 392495 | Primary Survey A |

### Initiative-to-Role Mapping

The view `v_strategic_initiative_professional_role` joins `strategic_initiatives` to `professional_roles` on `strategic_initiatives.professional_role_id = professional_roles.professional_role_id`. It answers the inverse: "Which role is associated with each strategic initiative?" The first row would show initiative `Baseline Corridor D` linked to role `Distributed Standard` in department `adaptive-departme-89`. The third row would show initiative `Adaptive Assessment` linked to role `Primary Protocol` in department `baseline-departme-91`.

**View `v_strategic_initiative_professional_role`**

```sql
CREATE VIEW v_strategic_initiative_professional_role AS
SELECT a.id, a.initiative_id, a.initiative_name, a.target_region, b.professional_role_id AS role_professional_role_id, b.role_title AS role_role_title, b.department AS role_department
FROM strategic_initiatives a JOIN professional_roles b ON a.professional_role_id = b.professional_role_id;
```

| id | initiative_id | initiative_name | target_region | role_professional_role_id | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | extended-target-87 | 100 | Distributed Standard | adaptive-departme-89 |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | integrated-target-88 | 101 | Adaptive Framework D | distributed-departme-90 |
| 102 | 8928495 | Adaptive Assessment | seasonal-target-89 | 102 | Primary Protocol | baseline-departme-91 |
| 103 | 392495 | Primary Survey A | regional-target-90 | 103 | Composite Programme | pilot-departme-92 |

### Initiative-to-Market Mapping

The view `v_strategic_initiative_geographic_market` joins `strategic_initiatives` to `geographic_markets` on `strategic_initiatives.geographic_market_id = geographic_markets.id`. It answers: "Which geographic markets does each initiative target?" The first row would show initiative `Baseline Corridor D` targeting market `Distributed Assessment` (`market_id = 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`) of type `domestic`. The second row would show initiative `Distributed Series` targeting market `Adaptive Survey D` (`market_id = 1889766`) of type `international`.

**View `v_strategic_initiative_geographic_market`**

```sql
CREATE VIEW v_strategic_initiative_geographic_market AS
SELECT a.id, a.initiative_id, a.initiative_name, a.target_region, b.id AS market_id, b.market_id AS market_market_id, b.region_name AS market_region_name
FROM strategic_initiatives a JOIN geographic_markets b ON a.geographic_market_id = b.id;
```

| id | initiative_id | initiative_name | target_region | market_id | market_market_id | market_region_name |
|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | extended-target-87 | 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | integrated-target-88 | 2 | 1889766 | Adaptive Survey D |
| 102 | 8928495 | Adaptive Assessment | seasonal-target-89 | 3 | eb7b0b58-8fd1-11eb-924d-9cd76263cbd0 | Primary Corridor |
| 103 | 392495 | Primary Survey A | regional-target-90 | 4 | 8928496 | Composite Series |

### Initiative-to-Sector Mapping

The view `v_strategic_initiative_industry_sector` joins `strategic_initiatives` to `industry_sectors` on `strategic_initiatives.industry_sector_id = industry_sectors.industry_sector_id`. It answers: "In which sector does each initiative operate?" The first row would show initiative `Baseline Corridor D` operating in sector `Distributed Survey` (`sector_id = 7119771`). The fourth row would show initiative `Primary Survey A` operating in sector `Composite Assessment` (`sector_id = 9125631`).

**View `v_strategic_initiative_industry_sector`**

```sql
CREATE VIEW v_strategic_initiative_industry_sector AS
SELECT a.id, a.initiative_id, a.initiative_name, a.target_region, b.industry_sector_id AS sector_industry_sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM strategic_initiatives a JOIN industry_sectors b ON a.industry_sector_id = b.industry_sector_id;
```

| id | initiative_id | initiative_name | target_region | sector_industry_sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | extended-target-87 | 1 | 7119771 | Distributed Survey |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | integrated-target-88 | 2 | 726049 | Adaptive Corridor D |
| 102 | 8928495 | Adaptive Assessment | seasonal-target-89 | 3 | 103175 | Primary Series |
| 103 | 392495 | Primary Survey A | regional-target-90 | 4 | 9125631 | Composite Assessment |

### Market-to-Initiative Mapping

The view `v_geographic_market_strategic_initiative` joins `geographic_markets` to `strategic_initiatives` on `geographic_markets.strategic_initiative_id = strategic_initiatives.id`. It answers the inverse: "Which initiative targets each geographic market?" The first row would show market `Distributed Assessment` targeted by initiative `Baseline Corridor D` with status `planned`. The third row would show market `Primary Corridor` targeted by initiative `Adaptive Assessment` with status `completed`.

**View `v_geographic_market_strategic_initiative`**

```sql
CREATE VIEW v_geographic_market_strategic_initiative AS
SELECT a.id, a.market_id, a.region_name, a.country_code, b.id AS initiative_id, b.initiative_id AS initiative_initiative_id, b.initiative_name AS initiative_initiative_name
FROM geographic_markets a JOIN strategic_initiatives b ON a.strategic_initiative_id = b.id;
```

| id | market_id | region_name | country_code | initiative_id | initiative_initiative_id | initiative_initiative_name |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 100 | compta | Baseline Corridor D |
| 2 | 1889766 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 3 | eb7b0b58-8fd1-11eb-924d-9cd76263cbd0 | Primary Corridor | default_chart_a_account_57 | 102 | 8928495 | Adaptive Assessment |
| 4 | 8928496 | Composite Series | 727045 | 103 | 392495 | Primary Survey A |

### Market-to-Sector Mapping

The view `v_geographic_market_industry_sector` joins `geographic_markets` to `industry_sectors` on `geographic_markets.industry_sector_id = industry_sectors.industry_sector_id`. It answers: "Which sector does each geographic market serve?" The first row would show market `Distributed Assessment` serving sector `Distributed Survey` (`sector_id = 7119771`). The fourth row would show market `Composite Series` serving sector `Composite Assessment` (`sector_id = 9125631`).

**View `v_geographic_market_industry_sector`**

```sql
CREATE VIEW v_geographic_market_industry_sector AS
SELECT a.id, a.market_id, a.region_name, a.country_code, b.industry_sector_id AS sector_industry_sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM geographic_markets a JOIN industry_sectors b ON a.industry_sector_id = b.industry_sector_id;
```

| id | market_id | region_name | country_code | sector_industry_sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 7119771 | Distributed Survey |
| 2 | 1889766 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 2 | 726049 | Adaptive Corridor D |
| 3 | eb7b0b58-8fd1-11eb-924d-9cd76263cbd0 | Primary Corridor | default_chart_a_account_57 | 3 | 103175 | Primary Series |
| 4 | 8928496 | Composite Series | 727045 | 4 | 9125631 | Composite Assessment |

### Sector-to-Organisation Mapping

The view `v_industry_sector_organization` joins `industry_sectors` to `organizations` on `industry_sectors.organization_id = organizations.id`. It answers: "Which organisations operate in each sector?" The first row would show sector `Distributed Survey` containing organisation `Extended Review` (`org_id = 790471`). The third row would show sector `Primary Series` containing organisation `Baseline Model` (`org_id = 69437`).

**View `v_industry_sector_organization`**

```sql
CREATE VIEW v_industry_sector_organization AS
SELECT a.industry_sector_id, a.sector_id, a.sector_name, a.classification_code, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM industry_sectors a JOIN organizations b ON a.organization_id = b.id;
```

| industry_sector_id | sector_id | sector_name | classification_code | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | IVC10Iind | 100 | 790471 | Extended Review |
| 2 | 726049 | Adaptive Corridor D | id_17 | 101 | 1717 | Pilot Initiative A |
| 3 | 103175 | Primary Series | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 102 | 69437 | Baseline Model |
| 4 | 9125631 | Composite Assessment | 5082984 | 103 | m16 | Distributed Cluster |

### Sector-to-Initiative Mapping

The view `v_industry_sector_strategic_initiative` joins `industry_sectors` to `strategic_initiatives` on `industry_sectors.strategic_initiative_id = strategic_initiatives.id`. It answers: "Which strategic initiatives operate in each sector?" The first row would show sector `Distributed Survey` hosting initiative `Baseline Corridor D` (`initiative_id = compta`). The second row would show sector `Adaptive Corridor D` (`sector_id = 726049`) hosting initiative `Distributed Series` (`initiative_id = f209107c-8fcd-11eb-924d-9cd76263cbd0`).

**View `v_industry_sector_strategic_initiative`**

```sql
CREATE VIEW v_industry_sector_strategic_initiative AS
SELECT a.industry_sector_id, a.sector_id, a.sector_name, a.classification_code, b.id AS initiative_id, b.initiative_id AS initiative_initiative_id, b.initiative_name AS initiative_initiative_name
FROM industry_sectors a JOIN strategic_initiatives b ON a.strategic_initiative_id = b.id;
```

| industry_sector_id | sector_id | sector_name | classification_code | initiative_id | initiative_initiative_id | initiative_initiative_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | IVC10Iind | 100 | compta | Baseline Corridor D |
| 2 | 726049 | Adaptive Corridor D | id_17 | 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series |
| 3 | 103175 | Primary Series | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 102 | 8928495 | Adaptive Assessment |
| 4 | 9125631 | Composite Assessment | 5082984 | 103 | 392495 | Primary Survey A |

## Closing Synthesis

The schema models a corporate governance domain through six base tables whose foreign keys form a tightly connected star topology. The `persons` and `organizations` tables serve as the leaf entities, while `professional_roles` and `strategic_initiatives` act as hub entities that bridge people, organisations, markets, and sectors. The `geographic_markets` and `industry_sectors` tables provide the contextual dimensions of place and classification. The fifteen materialised views each answer a specific analytical question by joining two base tables along a single foreign-key edge, allowing analysts to query domain facts — such as "which role does Theodore Mcgrath hold?" or "which markets does the initiative Baseline Corridor D target?" — without writing joins manually. The normalised design ensures that each fact is stored exactly once, while the views provide denormalised access paths that mirror the natural questions domain experts ask.