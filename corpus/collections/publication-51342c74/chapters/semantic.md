# The Media Enterprise Schema: From Ontology to Relational Normalization

The domain under examination models the operational architecture of a fictional media conglomerate, where publishing assets, broadcast infrastructure, and advertising revenue streams are organized through a hierarchy of corporate entities. At the top of this hierarchy sit `media_groups` — the parent corporations that own subsidiaries, distribute publications, and partner in joint ventures. Each group operates across one or more `delivery_platforms`, which serve as the technical channels through which content reaches audiences. The content itself is catalogued as `publications`, each carrying circulation and web-traffic metrics that feed into the group's aggregate performance figures. Beneath the group level, `subsidiaries` represent the operational arms that manage day-to-day activities on specific platforms, while `advertising_networks` monetize the audience reach by linking ad campaigns to both subsidiaries and individual publications. Finally, `radio_channels` and `joint_ventures` model the broadcast dimension of the enterprise, where groups collaborate to operate radio frequencies. This chapter walks through how each of these entity types is modelled, how their attributes and cardinality-bounded relationships materialize as columns, foreign keys, and junction tables, and how the twelve materialized views reconstruct domain facts from the normalized base schema.

## The Core Entity Types and Their Attributes

The foundation of the schema consists of seven base tables, each corresponding to a distinct entity type in the domain ontology. The `publications` table captures the content assets of the enterprise. Each row represents a single publication, identified by a surrogate `publication_id` and described by a `title` such as "Compact Initiative" or "Seasonal Review", a `language` classification like `composite-language-45`, and a `frequency` descriptor such as `regional-frequenc-36`. The `status` column distinguishes between `active` and `discontinued` publications, while `circulation_count` records the print circulation (for example, 21 for "Compact Initiative"), and `online_page_views` and `unique_visitors` capture digital engagement metrics — 4.20 page views and 10 unique visitors for the first publication, rising to 16.80 page views and 28 unique visitors for "Seasonal Review".

**Table `publications`**

| publication_id | title | language | frequency | status | circulation_count | online_page_views | unique_visitors | group_id | delivery_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Initiative | composite-language-45 | regional-frequenc-36 | active | 21 | 4.20 | 10 | 10449530 | 1 |
| 2 | Legacy Model | primary-language-46 | legacy-frequenc-37 | discontinued | 5 | 8.40 | 16 | 8189483 | 2 |
| 3 | Regional Cluster A | adaptive-language-47 | compact-frequenc-38 | active | 15 | 12.60 | 22 | 3718658437 | 3 |
| 4 | Seasonal Review | distributed-language-48 | composite-frequenc-39 | discontinued | 5 | 16.80 | 28 | IVC0 | 4 |

The `media_groups` table models the parent corporations. Each group is identified by `group_id` — a value that doubles as a natural key in some rows (e.g., `10449530` for "Baseline Corridor D") and as a composite identifier in others (e.g., `IVC0` for "Primary Survey A"). The `group_name` provides a human-readable label, `headquarters_location` encodes the regional base (such as `composite-headquar-63`), and `founding_year` records the year of establishment (43, 48, 53, 58 across the four groups). The `market_share` column stores a decimal percentage (7.45 for "Baseline Corridor D", climbing to 17.80 for "Primary Survey A"), while `total_audience`, `total_page_views`, and `total_unique_visitors` aggregate the group's reach. Notably, "Baseline Corridor D" reports zero total audience despite having a publication, whereas "Distributed Series" reports 14,013 total audience members and 6,579 unique visitors.

**Table `media_groups`**

| group_id | group_name | headquarters_location | founding_year | market_share | total_audience | total_page_views | total_unique_visitors | subsidiary_id | delivery_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | composite-headquar-63 | 43 | 7.45 | 0 | 14.20 | 5 | 1 | 1 |
| 8189483 | Distributed Series | primary-headquar-64 | 48 | 10.90 | 14013 | 16.40 | 6579 | 2 | 2 |
| 3718658437 | Adaptive Assessment | adaptive-headquar-65 | 53 | 14.35 | 108 | 18.60 | 130 | 3 | 3 |
| IVC0 | Primary Survey A | distributed-headquar-66 | 58 | 17.80 | 10 | 20.80 | 2 | 4 | 4 |

The `delivery_platforms` table represents the technical distribution channels. Each platform carries a surrogate `id` (1 through 4), a `platform_id` that may be a short numeric string like `state_uk_28` or a UUID such as `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`, and a `platform_name` like "Baseline Initiative D". The `platform_type` (e.g., `composite-platform-33`), `access_method` (e.g., `extended-access-99`), and `active_status` (boolean `false` or `true`) describe the platform's characteristics. The `monthly_visitors` and `monthly_page_views` columns record traffic volumes — platform 4 ("Primary Review A") reaches 48 monthly visitors with 18.80 page views.

**Table `delivery_platforms`**

| id | platform_id | platform_name | platform_type | access_method | active_status | monthly_visitors | monthly_page_views | publication_id | group_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | composite-platform-33 | extended-access-99 | false | 18 | 12.95 | 1 | 10449530 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | primary-platform-34 | integrated-access-100 | true | 28 | 14.90 | 2 | 8189483 |
| 3 | 4716417 | Adaptive Cluster | adaptive-platform-35 | seasonal-access-101 | false | 38 | 16.85 | 3 | 3718658437 |
| 4 | 10966228 | Primary Review A | distributed-platform-36 | regional-access-102 | true | 48 | 18.80 | 4 | IVC0 |

The `subsidiaries` table captures the operational subsidiaries of each media group. Each subsidiary has a `subsidiary_id`, a `subsidiary_name` (e.g., "Adaptive Corridor", "Primary Series"), an `ownership_percentage` (ranging from 6.95 to 12.80), a `business_type` such as `primary-business-46`, and an `operational_status` of either `active` or `inactive`. The `location` field encodes the operational base (e.g., `extended-location-99`), and `created_at` / `updated_at` timestamps record the lifecycle — "Adaptive Corridor" was created on 2025-01-01 and last updated on 2025-01-02.

**Table `subsidiaries`**

| subsidiary_id | subsidiary_name | ownership_percentage | business_type | operational_status | location | group_id | delivery_platform_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Adaptive Corridor | 6.95 | primary-business-46 | active | extended-location-99 | 10449530 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Primary Series | 8.90 | adaptive-business-47 | inactive | integrated-location-100 | 8189483 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Composite Assessment D | 10.85 | distributed-business-48 | active | seasonal-location-101 | 3718658437 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Compact Survey | 12.80 | baseline-business-49 | inactive | regional-location-102 | IVC0 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `advertising_networks` table models the ad-tech layer. Each network has an `advertising_network_id`, a `network_id` (often a UUID), a `network_name` like "Seasonal Programme", a `network_type` (e.g., `integrated-network-10`), a `coverage_area` (e.g., `extended-coverage-87`), an `active_status`, and `monthly_impressions` (25 for the first network, rising to 46 for "Pilot Protocol").

**Table `advertising_networks`**

| advertising_network_id | network_id | network_name | network_type | coverage_area | active_status | monthly_impressions | subsidiary_id | publication_id |
|---|---|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-network-10 | extended-coverage-87 | false | 25 | 1 | 1 |
| 2 | 7441146 | Integrated Standard | seasonal-network-11 | integrated-coverage-88 | true | 32 | 2 | 2 |
| 3 | 8387535 | Extended Framework D | regional-network-12 | seasonal-coverage-89 | false | 39 | 3 | 3 |
| 4 | 6589 | Pilot Protocol | legacy-network-13 | regional-coverage-90 | true | 46 | 4 | 4 |

The `radio_channels` table captures broadcast assets. Each channel has a surrogate `id` (1000–1003), a `channel_id` (numeric or UUID), a `channel_name` (e.g., "Adaptive Corridor", "Primary Series"), a `frequency` classification, a `language`, an `operational_status`, and an `audience_size` (16 for the first channel, 31 for "Compact Survey").

**Table `radio_channels`**

| id | channel_id | channel_name | frequency | language | operational_status | audience_size | joint_venture_id | publication_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1562831 | Adaptive Corridor | regional-frequenc-36 | composite-language-45 | active | 16 | 100 | 1 |
| 1001 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | legacy-frequenc-37 | primary-language-46 | inactive | 21 | 101 | 2 |
| 1002 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | compact-frequenc-38 | adaptive-language-47 | active | 26 | 102 | 3 |
| 1003 | 4447006 | Compact Survey | composite-frequenc-39 | distributed-language-48 | inactive | 31 | 103 | 4 |

The `joint_ventures` table models collaborative ventures between media groups. Each venture has a `joint_venture_id` (100–103), a `venture_name`, a `venture_type`, an `operational_status`, `start_date` and `end_date` fields, and a `media_group_id` linking it to the sponsoring group.

**Table `joint_ventures`**

| id | venture_id | venture_name | ownership_structure | business_type | operational_status | location | group_id |
|---|---|---|---|---|---|---|---|
| 100 | 1889765 | Integrated Programme A | integrated-ownershi-46 | primary-business-46 | active | extended-location-99 | 10449530 |
| 101 | 1996924 | Extended Standard | seasonal-ownershi-47 | adaptive-business-47 | inactive | integrated-location-100 | 8189483 |
| 102 | 1250194 | Pilot Framework | regional-ownershi-48 | distributed-business-48 | active | seasonal-location-101 | 3718658437 |
| 103 | 1450646 | Baseline Protocol D | legacy-ownershi-49 | baseline-business-49 | inactive | regional-location-102 | IVC0 |

## Junction Tables and Many-to-Many Relationships

Not all relationships in this domain are one-to-many. Two junction tables resolve many-to-many associations that cannot be expressed through simple foreign keys. The `groups_publications` table links media groups to publications, allowing a single group to own multiple publications and a publication to be associated with multiple groups. Each row contains a `group_id` and a `publication_id`, forming a composite key that enforces referential integrity to both `media_groups` and `publications`.

**Table `groups_publications`**

| group_id | publication_id |
|---|---|
| 10449530 | 1 |
| 10449530 | 2 |
| 8189483 | 2 |
| 8189483 | 3 |
| 3718658437 | 3 |
| 3718658437 | 4 |
| IVC0 | 4 |
| IVC0 | 1 |

Similarly, the `ventures_channels` table links joint ventures to radio channels. Each row pairs a `joint_venture_id` with a `channel_id`, enabling a venture to operate multiple channels and a channel to be shared across ventures. This table's composite key references `joint_ventures` and `radio_channels`, respectively.

**Table `ventures_channels`**

| joint_venture_id | radio_channel_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

These junction tables are the relational manifestation of the ontology's n-ary relationships. In the conceptual model, a media group does not merely "have" publications — it participates in a many-to-many association that the `groups_publications` table materializes. The same logic applies to joint ventures and radio channels.

## Foreign-Key Topology and Referential Integrity

The foreign-key topology of this schema reveals a layered dependency structure. The `publications` table carries two foreign keys: `group_id` references `media_groups.group_id`, and `delivery_platform_id` references `delivery_platforms.id`. This means each publication is anchored to exactly one media group and one delivery platform. The `media_groups` table itself carries `subsidiary_id` (referencing `subsidiaries.subsidiary_id`) and `delivery_platform_id` (referencing `delivery_platforms.id`), creating a bidirectional link between groups and platforms through both the group and the publication layers.

The `delivery_platforms` table carries `publication_id` (referencing `publications.publication_id`) and `group_id` (referencing `media_groups.group_id`), forming a triangle of mutual references among publications, groups, and platforms. The `subsidiaries` table references both `media_groups.group_id` and `delivery_platforms.id`, anchoring each subsidiary to its parent group and its operational platform. The `advertising_networks` table references `subsidiaries.subsidiary_id` and `publications.publication_id`, tying ad campaigns to both the operational subsidiary and the content asset. Finally, `radio_channels` references `joint_ventures.joint_venture_id` and `publications.publication_id`, linking broadcast channels to their venture sponsor and their associated publication.

This topology ensures that every fact in the schema can be traced back to its originating entity through a chain of foreign keys. A row in `advertising_networks` can be joined to its `subsidiaries` parent, then to the `media_groups` grandparent, and simultaneously to its `publications` sibling — all through direct foreign-key paths.

## Materialized Views: Reconstructing Domain Facts

The twelve views in this schema are not mere convenience aliases; they are deliberate join projections that reconstruct domain facts from the normalized tables. Each view answers a specific analytical question by pulling together columns from two or more base tables.

### Publication-Centric Views

The view `v_publication_media_group` joins `publications` to `media_groups` on `group_id`, answering the question: "Which media group owns which publication, and what are the group's aggregate metrics?" A row from this view might show "Compact Initiative" (publication_id 1) owned by "Baseline Corridor D" (group_id 10449530), with the group reporting a market share of 7.45 and total audience of zero.

**View `v_publication_media_group`**

```sql
CREATE VIEW v_publication_media_group AS
SELECT a.publication_id, a.title, a.language, a.frequency, b.group_id AS group_group_id, b.group_name AS group_group_name, b.headquarters_location AS group_headquarters_location
FROM publications a JOIN media_groups b ON a.group_id = b.group_id;
```

| publication_id | title | language | frequency | group_group_id | group_group_name | group_headquarters_location |
|---|---|---|---|---|---|---|
| 1 | Compact Initiative | composite-language-45 | regional-frequenc-36 | 10449530 | Baseline Corridor D | composite-headquar-63 |
| 2 | Legacy Model | primary-language-46 | legacy-frequenc-37 | 8189483 | Distributed Series | primary-headquar-64 |
| 3 | Regional Cluster A | adaptive-language-47 | compact-frequenc-38 | 3718658437 | Adaptive Assessment | adaptive-headquar-65 |
| 4 | Seasonal Review | distributed-language-48 | composite-frequenc-39 | IVC0 | Primary Survey A | distributed-headquar-66 |

The view `v_publication_delivery_platform` joins `publications` to `delivery_platforms` on `delivery_platform_id`, answering: "Through which platform is each publication distributed?" For example, "Legacy Model" (publication_id 2) is distributed through platform 2 ("Distributed Model"), which has `active_status` true and reaches 28 monthly visitors.

**View `v_publication_delivery_platform`**

```sql
CREATE VIEW v_publication_delivery_platform AS
SELECT a.publication_id, a.title, a.language, a.frequency, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM publications a JOIN delivery_platforms b ON a.delivery_platform_id = b.id;
```

| publication_id | title | language | frequency | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1 | Compact Initiative | composite-language-45 | regional-frequenc-36 | 1 | state_uk_28 | Baseline Initiative D |
| 2 | Legacy Model | primary-language-46 | legacy-frequenc-37 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 3 | Regional Cluster A | adaptive-language-47 | compact-frequenc-38 | 3 | 4716417 | Adaptive Cluster |
| 4 | Seasonal Review | distributed-language-48 | composite-frequenc-39 | 4 | 10966228 | Primary Review A |

The view `v_delivery_platform_publication` performs the inverse join, answering: "Which publications are available on each delivery platform?" Platform 1 ("Baseline Initiative D") serves publication 1 ("Compact Initiative"), while platform 4 ("Primary Review A") serves publication 4 ("Seasonal Review").

**View `v_delivery_platform_publication`**

```sql
CREATE VIEW v_delivery_platform_publication AS
SELECT a.id, a.platform_id, a.platform_name, a.platform_type, b.publication_id AS publication_publication_id, b.title AS publication_title, b.language AS publication_language
FROM delivery_platforms a JOIN publications b ON a.publication_id = b.publication_id;
```

| id | platform_id | platform_name | platform_type | publication_publication_id | publication_title | publication_language |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | composite-platform-33 | 1 | Compact Initiative | composite-language-45 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | primary-platform-34 | 2 | Legacy Model | primary-language-46 |
| 3 | 4716417 | Adaptive Cluster | adaptive-platform-35 | 3 | Regional Cluster A | adaptive-language-47 |
| 4 | 10966228 | Primary Review A | distributed-platform-36 | 4 | Seasonal Review | distributed-language-48 |

### Media Group-Centric Views

The view `v_media_group_publication_detail` joins `media_groups` to `publications`, providing a group-level dashboard that pairs each group's aggregate metrics with its publication-level details. "Adaptive Assessment" (group_id 3718658437) appears alongside its publication "Regional Cluster A" (publication_id 3), which has a circulation of 15 and 22 unique visitors.

**View `v_media_group_publication_detail`**

```sql
CREATE VIEW v_media_group_publication_detail AS
SELECT a.group_id, a.group_name, a.headquarters_location, b.publication_id AS publication_publication_id, b.title AS publication_title, b.language AS publication_language
FROM media_groups a
  JOIN groups_publications j ON j.group_id = a.group_id
  JOIN publications b ON b.publication_id = j.publication_id;
```

| group_id | group_name | headquarters_location | publication_publication_id | publication_title | publication_language |
|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | composite-headquar-63 | 1 | Compact Initiative | composite-language-45 |
| 10449530 | Baseline Corridor D | composite-headquar-63 | 2 | Legacy Model | primary-language-46 |
| 8189483 | Distributed Series | primary-headquar-64 | 2 | Legacy Model | primary-language-46 |
| 8189483 | Distributed Series | primary-headquar-64 | 3 | Regional Cluster A | adaptive-language-47 |
| 3718658437 | Adaptive Assessment | adaptive-headquar-65 | 3 | Regional Cluster A | adaptive-language-47 |
| 3718658437 | Adaptive Assessment | adaptive-headquar-65 | 4 | Seasonal Review | distributed-language-48 |
| IVC0 | Primary Survey A | distributed-headquar-66 | 4 | Seasonal Review | distributed-language-48 |
| IVC0 | Primary Survey A | distributed-headquar-66 | 1 | Compact Initiative | composite-language-45 |

The view `v_media_group_subsidiary` joins `media_groups` to `subsidiaries` on `group_id`, answering: "Which subsidiary operates under which media group?" "Baseline Corridor D" (group_id 10449530) operates "Adaptive Corridor" (subsidiary_id 1) with 6.95% ownership, while "Primary Survey A" (group_id IVC0) operates "Compact Survey" (subsidiary_id 4) with 12.80% ownership.

**View `v_media_group_subsidiary`**

```sql
CREATE VIEW v_media_group_subsidiary AS
SELECT a.group_id, a.group_name, a.headquarters_location, a.founding_year, b.subsidiary_id AS subsidiary_subsidiary_id, b.subsidiary_name AS subsidiary_subsidiary_name, b.ownership_percentage AS subsidiary_ownership_percentage
FROM media_groups a JOIN subsidiaries b ON a.subsidiary_id = b.subsidiary_id;
```

| group_id | group_name | headquarters_location | founding_year | subsidiary_subsidiary_id | subsidiary_subsidiary_name | subsidiary_ownership_percentage |
|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | composite-headquar-63 | 43 | 1 | Adaptive Corridor | 6.95 |
| 8189483 | Distributed Series | primary-headquar-64 | 48 | 2 | Primary Series | 8.90 |
| 3718658437 | Adaptive Assessment | adaptive-headquar-65 | 53 | 3 | Composite Assessment D | 10.85 |
| IVC0 | Primary Survey A | distributed-headquar-66 | 58 | 4 | Compact Survey | 12.80 |

The view `v_media_group_delivery_platform` joins `media_groups` to `delivery_platforms`, answering: "Which delivery platform is associated with each media group?" "Baseline Corridor D" is linked to platform 1, and "Adaptive Assessment" to platform 3.

**View `v_media_group_delivery_platform`**

```sql
CREATE VIEW v_media_group_delivery_platform AS
SELECT a.group_id, a.group_name, a.headquarters_location, a.founding_year, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM media_groups a JOIN delivery_platforms b ON a.delivery_platform_id = b.id;
```

| group_id | group_name | headquarters_location | founding_year | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | composite-headquar-63 | 43 | 1 | state_uk_28 | Baseline Initiative D |
| 8189483 | Distributed Series | primary-headquar-64 | 48 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 3718658437 | Adaptive Assessment | adaptive-headquar-65 | 53 | 3 | 4716417 | Adaptive Cluster |
| IVC0 | Primary Survey A | distributed-headquar-66 | 58 | 4 | 10966228 | Primary Review A |

The view `v_delivery_platform_media_group` performs the inverse, answering: "Which media group operates through each delivery platform?" Platform 1 serves "Baseline Corridor D", and platform 2 serves "Distributed Series".

**View `v_delivery_platform_media_group`**

```sql
CREATE VIEW v_delivery_platform_media_group AS
SELECT a.id, a.platform_id, a.platform_name, a.platform_type, b.group_id AS group_group_id, b.group_name AS group_group_name, b.headquarters_location AS group_headquarters_location
FROM delivery_platforms a JOIN media_groups b ON a.group_id = b.group_id;
```

| id | platform_id | platform_name | platform_type | group_group_id | group_group_name | group_headquarters_location |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | composite-platform-33 | 10449530 | Baseline Corridor D | composite-headquar-63 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | primary-platform-34 | 8189483 | Distributed Series | primary-headquar-64 |
| 3 | 4716417 | Adaptive Cluster | adaptive-platform-35 | 3718658437 | Adaptive Assessment | adaptive-headquar-65 |
| 4 | 10966228 | Primary Review A | distributed-platform-36 | IVC0 | Primary Survey A | distributed-headquar-66 |

### Subsidiary-Centric Views

The view `v_subsidiary_media_group` joins `subsidiaries` to `media_groups`, providing a subsidiary-level report that includes the parent group's name and market share. "Primary Series" (subsidiary_id 2) operates under "Distributed Series" (group_id 8189483), which holds a 10.90% market share.

**View `v_subsidiary_media_group`**

```sql
CREATE VIEW v_subsidiary_media_group AS
SELECT a.subsidiary_id, a.subsidiary_name, a.ownership_percentage, a.business_type, b.group_id AS group_group_id, b.group_name AS group_group_name, b.headquarters_location AS group_headquarters_location
FROM subsidiaries a JOIN media_groups b ON a.group_id = b.group_id;
```

| subsidiary_id | subsidiary_name | ownership_percentage | business_type | group_group_id | group_group_name | group_headquarters_location |
|---|---|---|---|---|---|---|
| 1 | Adaptive Corridor | 6.95 | primary-business-46 | 10449530 | Baseline Corridor D | composite-headquar-63 |
| 2 | Primary Series | 8.90 | adaptive-business-47 | 8189483 | Distributed Series | primary-headquar-64 |
| 3 | Composite Assessment D | 10.85 | distributed-business-48 | 3718658437 | Adaptive Assessment | adaptive-headquar-65 |
| 4 | Compact Survey | 12.80 | baseline-business-49 | IVC0 | Primary Survey A | distributed-headquar-66 |

The view `v_subsidiary_delivery_platform` joins `subsidiaries` to `delivery_platforms`, answering: "On which platform does each subsidiary operate?" "Adaptive Corridor" (subsidiary_id 1) operates on platform 1, while "Composite Assessment D" (subsidiary_id 3) operates on platform 3.

**View `v_subsidiary_delivery_platform`**

```sql
CREATE VIEW v_subsidiary_delivery_platform AS
SELECT a.subsidiary_id, a.subsidiary_name, a.ownership_percentage, a.business_type, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM subsidiaries a JOIN delivery_platforms b ON a.delivery_platform_id = b.id;
```

| subsidiary_id | subsidiary_name | ownership_percentage | business_type | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1 | Adaptive Corridor | 6.95 | primary-business-46 | 1 | state_uk_28 | Baseline Initiative D |
| 2 | Primary Series | 8.90 | adaptive-business-47 | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 3 | Composite Assessment D | 10.85 | distributed-business-48 | 3 | 4716417 | Adaptive Cluster |
| 4 | Compact Survey | 12.80 | baseline-business-49 | 4 | 10966228 | Primary Review A |

### Advertising Network Views

The view `v_advertising_network_subsidiary` joins `advertising_networks` to `subsidiaries`, answering: "Which subsidiary is responsible for each advertising network?" "Seasonal Programme" (advertising_network_id 1) is managed by "Adaptive Corridor" (subsidiary_id 1), which has an ownership percentage of 6.95.

**View `v_advertising_network_subsidiary`**

```sql
CREATE VIEW v_advertising_network_subsidiary AS
SELECT a.advertising_network_id, a.network_id, a.network_name, a.network_type, b.subsidiary_id AS subsidiary_subsidiary_id, b.subsidiary_name AS subsidiary_subsidiary_name, b.ownership_percentage AS subsidiary_ownership_percentage
FROM advertising_networks a JOIN subsidiaries b ON a.subsidiary_id = b.subsidiary_id;
```

| advertising_network_id | network_id | network_name | network_type | subsidiary_subsidiary_id | subsidiary_subsidiary_name | subsidiary_ownership_percentage |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-network-10 | 1 | Adaptive Corridor | 6.95 |
| 2 | 7441146 | Integrated Standard | seasonal-network-11 | 2 | Primary Series | 8.90 |
| 3 | 8387535 | Extended Framework D | regional-network-12 | 3 | Composite Assessment D | 10.85 |
| 4 | 6589 | Pilot Protocol | legacy-network-13 | 4 | Compact Survey | 12.80 |

The view `v_advertising_network_publication` joins `advertising_networks` to `publications`, answering: "Which publication is associated with each advertising network?" "Integrated Standard" (advertising_network_id 2) is linked to "Legacy Model" (publication_id 2), which has a circulation of 5.

**View `v_advertising_network_publication`**

```sql
CREATE VIEW v_advertising_network_publication AS
SELECT a.advertising_network_id, a.network_id, a.network_name, a.network_type, b.publication_id AS publication_publication_id, b.title AS publication_title, b.language AS publication_language
FROM advertising_networks a JOIN publications b ON a.publication_id = b.publication_id;
```

| advertising_network_id | network_id | network_name | network_type | publication_publication_id | publication_title | publication_language |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-network-10 | 1 | Compact Initiative | composite-language-45 |
| 2 | 7441146 | Integrated Standard | seasonal-network-11 | 2 | Legacy Model | primary-language-46 |
| 3 | 8387535 | Extended Framework D | regional-network-12 | 3 | Regional Cluster A | adaptive-language-47 |
| 4 | 6589 | Pilot Protocol | legacy-network-13 | 4 | Seasonal Review | distributed-language-48 |

### Joint Venture and Radio Channel Views

The view `v_radio_channel_joint_venture` joins `radio_channels` to `joint_ventures`, answering: "Which joint venture operates each radio channel?" Channel 1000 ("Adaptive Corridor") is operated by joint venture 100, while channel 1003 ("Compact Survey") is operated by joint venture 103.

**View `v_radio_channel_joint_venture`**

```sql
CREATE VIEW v_radio_channel_joint_venture AS
SELECT a.id, a.channel_id, a.channel_name, a.frequency, b.id AS venture_id, b.venture_id AS venture_venture_id, b.venture_name AS venture_venture_name
FROM radio_channels a JOIN joint_ventures b ON a.joint_venture_id = b.id;
```

| id | channel_id | channel_name | frequency | venture_id | venture_venture_id | venture_venture_name |
|---|---|---|---|---|---|---|
| 1000 | 1562831 | Adaptive Corridor | regional-frequenc-36 | 100 | 1889765 | Integrated Programme A |
| 1001 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | legacy-frequenc-37 | 101 | 1996924 | Extended Standard |
| 1002 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | compact-frequenc-38 | 102 | 1250194 | Pilot Framework |
| 1003 | 4447006 | Compact Survey | composite-frequenc-39 | 103 | 1450646 | Baseline Protocol D |

The view `v_radio_channel_publication` joins `radio_channels` to `publications`, answering: "Which publication is associated with each radio channel?" Channel 1000 is associated with publication 1 ("Compact Initiative"), and channel 1003 with publication 4 ("Seasonal Review").

**View `v_radio_channel_publication`**

```sql
CREATE VIEW v_radio_channel_publication AS
SELECT a.id, a.channel_id, a.channel_name, a.frequency, b.publication_id AS publication_publication_id, b.title AS publication_title, b.language AS publication_language
FROM radio_channels a JOIN publications b ON a.publication_id = b.publication_id;
```

| id | channel_id | channel_name | frequency | publication_publication_id | publication_title | publication_language |
|---|---|---|---|---|---|---|
| 1000 | 1562831 | Adaptive Corridor | regional-frequenc-36 | 1 | Compact Initiative | composite-language-45 |
| 1001 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | legacy-frequenc-37 | 2 | Legacy Model | primary-language-46 |
| 1002 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | compact-frequenc-38 | 3 | Regional Cluster A | adaptive-language-47 |
| 1003 | 4447006 | Compact Survey | composite-frequenc-39 | 4 | Seasonal Review | distributed-language-48 |

The view `v_joint_venture_radio_channel_detail` joins `joint_ventures` to `radio_channels`, providing a venture-level dashboard that pairs each venture's details with its channel-level metrics. Joint venture 100 operates channel 1000 ("Adaptive Corridor"), which has an audience size of 16 and operates on a `regional-frequenc-36` frequency.

**View `v_joint_venture_radio_channel_detail`**

```sql
CREATE VIEW v_joint_venture_radio_channel_detail AS
SELECT a.id, a.venture_id, a.venture_name, b.id AS channel_id, b.channel_id AS channel_channel_id, b.channel_name AS channel_channel_name
FROM joint_ventures a
  JOIN ventures_channels j ON j.joint_venture_id = a.id
  JOIN radio_channels b ON b.id = j.radio_channel_id;
```

| id | venture_id | venture_name | channel_id | channel_channel_id | channel_channel_name |
|---|---|---|---|---|---|
| 100 | 1889765 | Integrated Programme A | 1000 | 1562831 | Adaptive Corridor |
| 100 | 1889765 | Integrated Programme A | 1001 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series |
| 101 | 1996924 | Extended Standard | 1001 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series |
| 101 | 1996924 | Extended Standard | 1002 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D |
| 102 | 1250194 | Pilot Framework | 1002 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D |
| 102 | 1250194 | Pilot Framework | 1003 | 4447006 | Compact Survey |
| 103 | 1450646 | Baseline Protocol D | 1003 | 4447006 | Compact Survey |
| 103 | 1450646 | Baseline Protocol D | 1000 | 1562831 | Adaptive Corridor |

The view `v_joint_venture_media_group` joins `joint_ventures` to `media_groups`, answering: "Which media group sponsors each joint venture?" Joint venture 100 is sponsored by the group referenced in its `media_group_id`, linking the collaborative venture back to its corporate parent.

**View `v_joint_venture_media_group`**

```sql
CREATE VIEW v_joint_venture_media_group AS
SELECT a.id, a.venture_id, a.venture_name, a.ownership_structure, b.group_id AS group_group_id, b.group_name AS group_group_name, b.headquarters_location AS group_headquarters_location
FROM joint_ventures a JOIN media_groups b ON a.group_id = b.group_id;
```

| id | venture_id | venture_name | ownership_structure | group_group_id | group_group_name | group_headquarters_location |
|---|---|---|---|---|---|---|
| 100 | 1889765 | Integrated Programme A | integrated-ownershi-46 | 10449530 | Baseline Corridor D | composite-headquar-63 |
| 101 | 1996924 | Extended Standard | seasonal-ownershi-47 | 8189483 | Distributed Series | primary-headquar-64 |
| 102 | 1250194 | Pilot Framework | regional-ownershi-48 | 3718658437 | Adaptive Assessment | adaptive-headquar-65 |
| 103 | 1450646 | Baseline Protocol D | legacy-ownershi-49 | IVC0 | Primary Survey A | distributed-headquar-66 |

## Synthesis

This schema models a media enterprise as a network of interlocking entities: groups own subsidiaries and publications, subsidiaries operate on delivery platforms, advertising networks monetize the combined reach, and joint ventures enable collaborative radio broadcasting. The foreign-key topology ensures that every fact — from a single publication's circulation count to a joint venture's audience size — can be traced through a chain of referential links back to its originating entity. The junction tables `groups_publications` and `ventures_channels` resolve the many-to-many relationships that cannot be expressed through simple foreign keys, while the twelve materialized views reconstruct domain-specific facts by joining the normalized tables back together. Each view answers a distinct analytical question, transforming the raw normalized data into actionable insights about ownership, distribution, monetization, and collaboration across the media enterprise.