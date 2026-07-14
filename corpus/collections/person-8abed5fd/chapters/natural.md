# Organizational Governance and Strategic Planning

Modern enterprises operate within a complex web of interlocking relationships: individuals hold professional roles within organizations, those roles anchor specific strategic initiatives, and every initiative spans geographic markets and industry sectors. Understanding this ecosystem requires a disciplined view of how people, positions, projects, and markets relate to one another. The records in this domain capture exactly those relationships, providing a structured ledger of who does what, where, and for whom.

At the foundation sit the people who carry out the work. The `persons` table records each individual's contact details, years of experience, and their current professional role and organizational affiliation. Consider Theodore Mcgrath, who brings seven years of experience to the organization and can be reached at primary-email-70 or via compact-phone-26. He is assigned to professional role 100 within organization 100. Account Name, with ten years of experience, occupies role 101 at organization 101. Saipan International Airport — a fictional entity in this dataset — holds thirteen years of experience under role 102 at organization 102. Norma Fisher rounds out the roster with sixteen years of experience, role 103, and organization 103.

**Table `persons`**

| person_id | full_name | email_address | phone | years_of_experience | professional_role_id | organization_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | primary-email-70 | compact-phone-26 | 7 | 100 | 100 |
| 2 | Account Name | adaptive-email-71 | composite-phone-27 | 10 | 101 | 101 |
| 3 | Saipan International Airport | distributed-email-72 | primary-phone-28 | 13 | 102 | 102 |
| 4 | Norma Fisher | baseline-email-73 | adaptive-phone-29 | 16 | 103 | 103 |

Every person in the system is linked to an organization, and every organization maintains its own identity and strategic posture. The `organizations` table captures the institutional side of the picture: each organization carries a unique identifier, a human-readable name, a website, mission and vision statements, and a designated council member. Extended Review (org_id 790471) operates under the mission statement compact-mission-14 and the vision composite-vision-87, with Theodore Mcgrath serving as its council member. Pilot Initiative A (org_id 1717) pursues composite-mission-15 and primary-vision-88, with Account Name as its council member. Baseline Model (org_id 69437) is guided by primary-mission-16 and adaptive-vision-89, while Distributed Cluster (org_id m16) follows adaptive-mission-17 and distributed-vision-90, with Norma Fisher as its council member.

**Table `organizations`**

| id | org_id | org_name | website | mission_statement | vision_statement | person_id | has_council_member_person_id | industry_sector_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 790471 | Extended Review | https://bugs.launchpad.net/murano/+bug/1294080 | compact-mission-14 | composite-vision-87 | 1 | 1 | 1 |
| 101 | 1717 | Pilot Initiative A | https://bugs.launchpad.net/murano/+bug/1294080 | composite-mission-15 | primary-vision-88 | 2 | 2 | 2 |
| 102 | 69437 | Baseline Model | https://www.nature.com/articles/nphoton.2008.245 | primary-mission-16 | adaptive-vision-89 | 3 | 3 | 3 |
| 103 | m16 | Distributed Cluster | https://bugs.launchpad.net/trove/+bug/1347114 | adaptive-mission-17 | distributed-vision-90 | 4 | 4 | 4 |

Organizations are further classified by industry sector, a dimension that determines regulatory context, competitive landscape, and strategic priorities. The industry sector linkage is recorded directly on the organization record, meaning each organization belongs to exactly one sector within this model.

Professional roles form the connective tissue between individuals and the strategic work they perform. The `professional_roles` table defines each role with a title, department assignment, start date, a description of responsibilities, a reporting chain, and — critically — the strategic initiative to which the role contributes. Distributed Standard (role 100) sits in department adaptive-departme-89, began on 2022-09-05, carries integrated-responsi-58 as its responsibility description, reports through integrated-reportin-82, and is tied to strategic initiative 100. Adaptive Framework D (role 101) operates in distributed-departme-90, started 2023-02-16, encompasses seasonal-responsi-59, reports via seasonal-reportin-83, and anchors initiative 101. Primary Protocol (role 102) belongs to baseline-departme-91, commenced 2024-07-27, holds regional-responsi-60, reports through regional-reportin-84, and connects to initiative 102. Composite Programme (role 103) resides in pilot-departme-92, began 2025-12-11, carries legacy-responsi-61, reports via legacy-reportin-85, and is associated with initiative 103.

**Table `professional_roles`**

| professional_role_id | role_title | department | start_date | responsibilities | reporting_to | person_id | organization_id | strategic_initiative_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Distributed Standard | adaptive-departme-89 | 2022-09-05 | integrated-responsi-58 | integrated-reportin-82 | 1 | 100 | 100 | 2025-01-01 00:14:00 |
| 101 | Adaptive Framework D | distributed-departme-90 | 2023-02-16 | seasonal-responsi-59 | seasonal-reportin-83 | 2 | 101 | 101 | 2025-02-06 03:14:00 |
| 102 | Primary Protocol | baseline-departme-91 | 2024-07-27 | regional-responsi-60 | regional-reportin-84 | 3 | 102 | 102 | 2025-03-11 06:14:00 |
| 103 | Composite Programme | pilot-departme-92 | 2025-12-11 | legacy-responsi-61 | legacy-reportin-85 | 4 | 103 | 103 | 2025-04-16 09:14:00 |

Strategic initiatives represent the forward-looking projects that drive organizational change. The `strategic_initiatives` table records each initiative's name, target region, current status, a descriptive summary, and its links to the professional role that owns it, the geographic market it serves, and the industry sector it targets. Baseline Corridor D (initiative_id compta) targets extended-target-87, is currently in planned status, and is described as an Extended Survey. Distributed Series (initiative_id f209107c-8fcd-11eb-924d-9cd76263cbd0) targets integrated-target-88, is active, and described as Pilot Corridor A. Adaptive Assessment (initiative_id 8928495) targets seasonal-target-89, is completed, and described as Baseline Series. Primary Survey A (initiative_id 392495) targets regional-target-90, is cancelled, and described as Distributed Assessment.

**Table `strategic_initiatives`**

| id | initiative_id | initiative_name | target_region | status | description | professional_role_id | geographic_market_id | industry_sector_id |
|---|---|---|---|---|---|---|---|---|
| 100 | compta | Baseline Corridor D | extended-target-87 | planned | Extended Survey | 100 | 1 | 1 |
| 101 | f209107c-8fcd-11eb-924d-9cd76263cbd0 | Distributed Series | integrated-target-88 | active | Pilot Corridor A | 101 | 2 | 2 |
| 102 | 8928495 | Adaptive Assessment | seasonal-target-89 | completed | Baseline Series | 102 | 3 | 3 |
| 103 | 392495 | Primary Survey A | regional-target-90 | cancelled | Distributed Assessment | 103 | 4 | 4 |

Geographic markets define the territorial scope of each initiative. The `geographic_markets` table captures the region name, a country code, and the market type — domestic, international, or emerging. Distributed Assessment (market_id 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3) is classified as domestic and covers region Distributed Assessment. Adaptive Survey D (market_id 1889766) is international, covering the region Adaptive Survey D. Primary Corridor (market_id eb7b0b58-8fd1-11eb-924d-9cd76263cbd0) is an emerging market covering the region Primary Corridor. Composite Series (market_id 8928496) is domestic, covering the region Composite Series.

**Table `geographic_markets`**

| id | market_id | region_name | country_code | market_type | strategic_initiative_id | industry_sector_id |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | domestic | 100 | 1 |
| 2 | 1889766 | Adaptive Survey D | lu_tax_code_template_m_I_2 | international | 101 | 2 |
| 3 | eb7b0b58-8fd1-11eb-924d-9cd76263cbd0 | Primary Corridor | default_chart_a_account_57 | emerging | 102 | 3 |
| 4 | 8928496 | Composite Series | 727045 | domestic | 103 | 4 |

Industry sectors provide the classification framework through which organizations and initiatives are understood. The `industry_sectors` table records each sector's name, a classification code, and its links to the organization and strategic initiative it serves. Distributed Survey (sector_id 7119771) carries classification code IVC10Iind and is associated with organization 100 and initiative 100. Adaptive Corridor D (sector_id 726049) uses classification code id_17, linked to organization 101 and initiative 101. Primary Series (sector_id 103175) has classification code 57e4c59a-8fcd-11eb-924d-9cd76263cbd0, tied to organization 102 and initiative 102. Composite Assessment (sector_id 9125631) carries classification code 5082984, connected to organization 103 and initiative 103.

**Table `industry_sectors`**

| industry_sector_id | sector_id | sector_name | classification_code | organization_id | strategic_initiative_id |
|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | IVC10Iind | 100 | 100 |
| 2 | 726049 | Adaptive Corridor D | id_17 | 101 | 101 |
| 3 | 103175 | Primary Series | 57e4c59a-8fcd-11eb-924d-9cd76263cbd0 | 102 | 102 |
| 4 | 9125631 | Composite Assessment | 5082984 | 103 | 103 |

## The Professional Role as Organizational Anchor

The professional role is the central entity in this domain. It binds a person to an organization, assigns them to a department, and anchors them to a strategic initiative. The view `v_person_professional_role` brings together the person's identity and experience with the role's title, department, start date, responsibilities, and reporting chain. In this joined view, Theodore Mcgrath appears with seven years of experience, assigned to the role Distributed Standard in department adaptive-departme-89, with responsibilities described as integrated-responsi-58 and reporting through integrated-reportin-82. Account Name, with ten years of experience, holds the role Adaptive Framework D in distributed-departme-90, carrying seasonal-responsi-59 and reporting via seasonal-reportin-83.

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

The reverse perspective — `v_professional_role_person` — starts from the role and surfaces the person who fills it. This view answers the question: given a professional role, who occupies it and what is their background? Distributed Standard is occupied by Theodore Mcgrath, who has seven years of experience. Adaptive Framework D is held by Account Name with ten years of experience. Primary Protocol is filled by Saipan International Airport, who brings thirteen years of experience. Composite Programme is held by Norma Fisher, with sixteen years of experience.

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

## Organizational Affiliation and Council Membership

The view `v_person_organization` joins person records with their organizational home, surfacing the organization's name, website, mission, vision, and council member designation. Theodore Mcgrath is affiliated with Extended Review, whose website is https://bugs.launchpad.net/murano/+bug/1294080, mission is compact-mission-14, and vision is composite-vision-87. Account Name belongs to Pilot Initiative A, with mission composite-mission-15 and vision primary-vision-88. Saipan International Airport is with Baseline Model, guided by primary-mission-16 and adaptive-vision-89. Norma Fisher is at Distributed Cluster, which follows adaptive-mission-17 and distributed-vision-90.

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

The view `v_organization_person` inverts this relationship, starting from the organization and listing the person associated with it. Extended Review (org_id 790471) is associated with Theodore Mcgrath, who also serves as the council member. Pilot Initiative A (org_id 1717) is linked to Account Name, who serves as council member. Baseline Model (org_id 69437) is connected to Saipan International Airport, who is the council member. Distributed Cluster (org_id m16) is tied to Norma Fisher, who holds the council member position.

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

## Industry Sector Classification

Organizations are classified into industry sectors, and the view `v_organization_industry_sector` makes this classification explicit by joining the organization record with its sector. Extended Review falls under Distributed Survey (sector_id 7119771), classified under code IVC10Iind. Pilot Initiative A is in Adaptive Corridor D (sector_id 726049), with classification code id_17. Baseline Model belongs to Primary Series (sector_id 103175), carrying classification code 57e4c59a-8fcd-11eb-924d-9cd76263cbd0. Distributed Cluster is classified as Composite Assessment (sector_id 9125631), with code 5082984.

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

The reverse view, `v_industry_sector_organization`, starts from the sector and identifies the organization it classifies. Distributed Survey encompasses Extended Review. Adaptive Corridor D encompasses Pilot Initiative A. Primary Series encompasses Baseline Model. Composite Assessment encompasses Distributed Cluster. This perspective is useful when analyzing sector-level trends or regulatory requirements that apply to all organizations within a given classification.

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

## Strategic Initiatives and Their Professional Anchors

Strategic initiatives are the vehicles through which organizations execute their vision. The view `v_professional_role_strategic_initiative` connects each professional role to the strategic initiative it supports, revealing the operational chain from individual responsibility to organizational objective. Distributed Standard (role 100) supports Baseline Corridor D (initiative_id compta), which targets extended-target-87 and is in planned status. Adaptive Framework D (role 101) supports Distributed Series (initiative_id f209107c-8fcd-11eb-924d-9cd76263cbd0), targeting integrated-target-88 and currently active. Primary Protocol (role 102) supports Adaptive Assessment (initiative_id 8928495), targeting seasonal-target-89 and marked as completed. Composite Programme (role 103) supports Primary Survey A (initiative_id 392495), targeting regional-target-90 and cancelled.

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

The inverted view, `v_strategic_initiative_professional_role`, starts from the initiative and surfaces the role that owns it. Baseline Corridor D is owned by Distributed Standard, which began on 2022-09-05 and carries integrated-responsi-58 as its responsibility description. Distributed Series is owned by Adaptive Framework D, started 2023-02-16, with seasonal-responsi-59. Adaptive Assessment is owned by Primary Protocol, commenced 2024-07-27, holding regional-responsi-60. Primary Survey A is owned by Composite Programme, which began 2025-12-11 and carries legacy-responsi-61.

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

## Geographic Market Coverage

Every strategic initiative operates within a defined geographic market. The view `v_strategic_initiative_geographic_market` links each initiative to its market, showing the region name, country code, and market type. Baseline Corridor D operates in the Distributed Assessment market (market_id 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3), classified as domestic, covering the region Distributed Assessment. Distributed Series targets the Adaptive Survey D market (market_id 1889766), classified as international, covering the region Adaptive Survey D. Adaptive Assessment serves the Primary Corridor market (market_id eb7b0b58-8fd1-11eb-924d-9cd76263cbd0), an emerging market covering the region Primary Corridor. Primary Survey A covers the Composite Series market (market_id 8928496), classified as domestic, covering the region Composite Series.

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

The reverse view, `v_geographic_market_strategic_initiative`, starts from the market and identifies the initiative it serves. The Distributed Assessment market serves Baseline Corridor D. The Adaptive Survey D market serves Distributed Series. The Primary Corridor market serves Adaptive Assessment. The Composite Series market serves Primary Survey A. This perspective is valuable for market analysts who need to understand which initiatives are active in a given territory and what the market classification implies for strategy.

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

## Industry Sector Alignment with Initiatives

Strategic initiatives are also aligned with industry sectors, ensuring that each project operates within the appropriate regulatory and competitive context. The view `v_strategic_initiative_industry_sector` joins the initiative with its sector, surfacing the sector name and classification code. Baseline Corridor D is aligned with Distributed Survey (sector_id 7119771), classification code IVC10Iind. Distributed Series aligns with Adaptive Corridor D (sector_id 726049), code id_17. Adaptive Assessment aligns with Primary Series (sector_id 103175), code 57e4c59a-8fcd-11eb-924d-9cd76263cbd0. Primary Survey A aligns with Composite Assessment (sector_id 9125631), code 5082984.

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

The inverted view, `v_industry_sector_strategic_initiative`, starts from the sector and identifies the initiative it supports. Distributed Survey supports Baseline Corridor D. Adaptive Corridor D supports Distributed Series. Primary Series supports Adaptive Assessment. Composite Assessment supports Primary Survey A. This view is useful for sector-level planning, where one needs to understand which initiatives are driving change within a given industry classification.

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

## Geographic Market and Industry Sector Overlap

The final join view, `v_geographic_market_industry_sector`, connects geographic markets with industry sectors, revealing the intersection of territorial scope and industry classification. The Distributed Assessment market (domestic) overlaps with Distributed Survey (sector_id 7119771). The Adaptive Survey D market (international) overlaps with Adaptive Corridor D (sector_id 726049). The Primary Corridor market (emerging) overlaps with Primary Series (sector_id 103175). The Composite Series market (domestic) overlaps with Composite Assessment (sector_id 9125631). This intersection is critical for understanding where market-specific strategies must be adapted to sector-specific requirements.

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

## Synthesis

The domain presents a coherent model of organizational governance: people hold roles within organizations, roles anchor strategic initiatives, and initiatives operate within geographic markets and industry sectors. Each entity carries its own identity and metadata, but the true value emerges from the joins that connect them. The professional role is the linchpin — it is the point at which individual capability meets organizational structure and strategic direction. Geographic markets and industry sectors provide the contextual framing, ensuring that initiatives are grounded in both territorial reality and sector-specific knowledge. Together, these records form a complete picture of who is doing what, where, and for which organization — a necessary foundation for any enterprise seeking to understand and manage its strategic operations.

## Data appendix

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
