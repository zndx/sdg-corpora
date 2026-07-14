## The Architecture of Media Ownership and Distribution

The modern media landscape is defined by layered organizational structures that span print, broadcast, and digital channels. At the core of this ecosystem are media groups—parent organizations that own publications, operate delivery platforms, and maintain subsidiaries. These entities do not exist in isolation; they are connected through a web of ownership, distribution agreements, and advertising partnerships. Understanding how these pieces fit together requires examining the records that document each relationship, from the founding of a media group to the circulation numbers of its individual publications.

**Table `publications`**

| publication_id | title | language | frequency | status | circulation_count | online_page_views | unique_visitors | group_id | delivery_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Initiative | composite-language-45 | regional-frequenc-36 | active | 21 | 4.20 | 10 | 10449530 | 1 |
| 2 | Legacy Model | primary-language-46 | legacy-frequenc-37 | discontinued | 5 | 8.40 | 16 | 8189483 | 2 |
| 3 | Regional Cluster A | adaptive-language-47 | compact-frequenc-38 | active | 15 | 12.60 | 22 | 3718658437 | 3 |
| 4 | Seasonal Review | distributed-language-48 | composite-frequenc-39 | discontinued | 5 | 16.80 | 28 | IVC0 | 4 |

Publications form the content layer of the media ecosystem. Each record captures a title, its language configuration, publication frequency, and operational status. The "Compact Initiative" (publication_id 1) operates under a composite language framework with regional frequency and maintains an active status, recording a circulation count of 21, 4.20 online page views, and 10 unique visitors. Its counterpart, the "Legacy Model" (publication_id 2), carries a primary language designation, legacy frequency, and a discontinued status, with a circulation of 5, 8.40 page views, and 16 unique visitors. The "Regional Cluster A" (publication_id 3) uses an adaptive language setting with compact frequency, remains active, and achieves 15 in circulation alongside 12.60 page views and 22 unique visitors. Finally, the "Seasonal Review" (publication_id 4) employs a distributed language model with composite frequency, is discontinued, and reports 5 in circulation, 16.80 page views, and 28 unique visitors. Each publication is linked to a parent media group and a delivery platform, anchoring it within the broader organizational structure.

**Table `media_groups`**

| group_id | group_name | headquarters_location | founding_year | market_share | total_audience | total_page_views | total_unique_visitors | subsidiary_id | delivery_platform_id |
|---|---|---|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | composite-headquar-63 | 43 | 7.45 | 0 | 14.20 | 5 | 1 | 1 |
| 8189483 | Distributed Series | primary-headquar-64 | 48 | 10.90 | 14013 | 16.40 | 6579 | 2 | 2 |
| 3718658437 | Adaptive Assessment | adaptive-headquar-65 | 53 | 14.35 | 108 | 18.60 | 130 | 3 | 3 |
| IVC0 | Primary Survey A | distributed-headquar-66 | 58 | 17.80 | 10 | 20.80 | 2 | 4 | 4 |

Media groups serve as the organizational umbrella under which publications and subsidiaries operate. The "Baseline Corridor D" (group_id 10449530) was established at year 43, commands a 7.45 market share, and reports zero total audience despite 14.20 total page views and 5 unique visitors. "Distributed Series" (group_id 8189483), founded at year 48, holds a 10.90 market share with a total audience of 14,013, 16.40 total page views, and 6,579 unique visitors. "Adaptive Assessment" (group_id 3718658437), founded at year 53, leads with a 14.35 market share, an audience of 108, 18.60 page views, and 130 unique visitors. "Primary Survey A" (group_id IVC0), the newest at year 58, commands the largest market share at 17.80, with a total audience of 10, 20.80 page views, and 2 unique visitors. Each group maintains a headquarters location, a subsidiary, and a delivery platform, creating a vertical chain of ownership.

**Table `delivery_platforms`**

| id | platform_id | platform_name | platform_type | access_method | active_status | monthly_visitors | monthly_page_views | publication_id | group_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | composite-platform-33 | extended-access-99 | false | 18 | 12.95 | 1 | 10449530 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | primary-platform-34 | integrated-access-100 | true | 28 | 14.90 | 2 | 8189483 |
| 3 | 4716417 | Adaptive Cluster | adaptive-platform-35 | seasonal-access-101 | false | 38 | 16.85 | 3 | 3718658437 |
| 4 | 10966228 | Primary Review A | distributed-platform-36 | regional-access-102 | true | 48 | 18.80 | 4 | IVC0 |

Delivery platforms provide the distribution infrastructure through which content reaches audiences. The "Baseline Initiative D" (id 1, platform_id state_uk_28) uses a composite platform type with extended access and is currently inactive, recording 18 monthly visitors and 12.95 monthly page views. The "Distributed Model" (id 2, platform_id e6ce01fe-8fc3-11eb-924d-9cd76263cbd0) operates on a primary platform type with integrated access and is active, achieving 28 monthly visitors and 14.90 monthly page views. The "Adaptive Cluster" (id 3, platform_id 4716417) employs an adaptive platform type with seasonal access, is inactive, and reports 38 monthly visitors and 16.85 monthly page views. The "Primary Review A" (id 4, platform_id 10966228) runs on a distributed platform type with regional access, is active, and records 48 monthly visitors and 18.80 monthly page views. Each platform is associated with a specific publication and media group, forming the distribution backbone of the organization.

**Table `subsidiaries`**

| subsidiary_id | subsidiary_name | ownership_percentage | business_type | operational_status | location | group_id | delivery_platform_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Adaptive Corridor | 6.95 | primary-business-46 | active | extended-location-99 | 10449530 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Primary Series | 8.90 | adaptive-business-47 | inactive | integrated-location-100 | 8189483 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Composite Assessment D | 10.85 | distributed-business-48 | active | seasonal-location-101 | 3718658437 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Compact Survey | 12.80 | baseline-business-49 | inactive | regional-location-102 | IVC0 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Subsidiaries represent the operational arms of media groups, each with defined ownership percentages, business types, and geographic locations. The "Adaptive Corridor" (subsidiary_id 1) holds a 6.95 ownership stake, operates as a primary business type, maintains active status, and is located in an extended location; it was created on 2025-01-01 and last updated on 2025-01-02. The "Primary Series" (subsidiary_id 2) carries an 8.90 ownership percentage, functions as an adaptive business, is inactive, and resides in an integrated location, with a creation date of 2025-02-06 and an update on 2025-02-09. The "Composite Assessment D" (subsidiary_id 3) holds 10.85 ownership, operates as a distributed business, is active, and is based in a seasonal location, created on 2025-03-11 and updated on 2025-03-16. The "Compact Survey" (subsidiary_id 4) maintains a 12.80 ownership percentage, runs as a baseline business, is inactive, and is located in a regional location, with creation on 2025-04-16 and the most recent update on 2025-04-23. Each subsidiary is tied to a parent media group and a delivery platform.

**Table `advertising_networks`**

| advertising_network_id | network_id | network_name | network_type | coverage_area | active_status | monthly_impressions | subsidiary_id | publication_id |
|---|---|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Seasonal Programme | integrated-network-10 | extended-coverage-87 | false | 25 | 1 | 1 |
| 2 | 7441146 | Integrated Standard | seasonal-network-11 | integrated-coverage-88 | true | 32 | 2 | 2 |
| 3 | 8387535 | Extended Framework D | regional-network-12 | seasonal-coverage-89 | false | 39 | 3 | 3 |
| 4 | 6589 | Pilot Protocol | legacy-network-13 | regional-coverage-90 | true | 46 | 4 | 4 |

Advertising networks monetize content by placing impressions across publications and subsidiaries. The "Seasonal Programme" (advertising_network_id 1, network_id e6196808-8fd1-11eb-924d-9cd76263cbd0) is an integrated network type with extended coverage, is inactive, and generated 25 monthly impressions, linked to subsidiary 1 and publication 1. The "Integrated Standard" (advertising_network_id 2, network_id 7441146) operates as a seasonal network with integrated coverage, is active, and recorded 32 monthly impressions, connecting subsidiary 2 and publication 2. The "Extended Framework D" (advertising_network_id 3, network_id 8387535) is a regional network with seasonal coverage, is inactive, and achieved 39 monthly impressions, associated with subsidiary 3 and publication 3. The "Pilot Protocol" (advertising_network_id 4, network_id 6589) functions as a legacy network with regional coverage, is active, and produced 46 monthly impressions, tied to subsidiary 4 and publication 4.

**Table `radio_channels`**

| id | channel_id | channel_name | frequency | language | operational_status | audience_size | joint_venture_id | publication_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1562831 | Adaptive Corridor | regional-frequenc-36 | composite-language-45 | active | 16 | 100 | 1 |
| 1001 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | legacy-frequenc-37 | primary-language-46 | inactive | 21 | 101 | 2 |
| 1002 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | compact-frequenc-38 | adaptive-language-47 | active | 26 | 102 | 3 |
| 1003 | 4447006 | Compact Survey | composite-frequenc-39 | distributed-language-48 | inactive | 31 | 103 | 4 |

Radio channels extend the media portfolio into broadcast territory. The "Adaptive Corridor" (id 1000, channel_id 1562831) broadcasts on a regional frequency in composite language, is active, and reaches an audience of 16, operating under joint venture 100 and linked to publication 1. The "Primary Series" (id 1001, channel_id df2de334-8fcc-11eb-924d-9cd76263cbd0) uses a legacy frequency in primary language, is inactive, and serves an audience of 21, under joint venture 101 and publication 2. The "Composite Assessment D" (id 1002, channel_id ae409270-8fcd-11eb-924d-9cd76263cbd0) operates on a compact frequency in adaptive language, is active, and reaches 26 audience members, under joint venture 102 and publication 3. The "Compact Survey" (id 1003, channel_id 4447006) broadcasts on a composite frequency in distributed language, is inactive, and serves an audience of 31, under joint venture 103 and publication 4.

**Table `joint_ventures`**

| id | venture_id | venture_name | ownership_structure | business_type | operational_status | location | group_id |
|---|---|---|---|---|---|---|---|
| 100 | 1889765 | Integrated Programme A | integrated-ownershi-46 | primary-business-46 | active | extended-location-99 | 10449530 |
| 101 | 1996924 | Extended Standard | seasonal-ownershi-47 | adaptive-business-47 | inactive | integrated-location-100 | 8189483 |
| 102 | 1250194 | Pilot Framework | regional-ownershi-48 | distributed-business-48 | active | seasonal-location-101 | 3718658437 |
| 103 | 1450646 | Baseline Protocol D | legacy-ownershi-49 | baseline-business-49 | inactive | regional-location-102 | IVC0 |

Joint ventures represent collaborative broadcasting arrangements that link radio channels to specific operational entities. The venture identifiers 100 through 103 each anchor a single radio channel, creating a one-to-one mapping between joint ventures and broadcast operations. These ventures serve as the organizational container for radio channel activity, and their linkage to publications establishes the cross-platform reach of each media group's broadcast portfolio.

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

The groups_publications table documents the explicit association between media groups and their publications, serving as the junction table that formalizes which publication belongs to which parent organization. This relationship is the foundation upon which all higher-level analytical views are built, ensuring that every publication can be traced back to its owning media group.

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

The ventures_channels table records the relationship between joint ventures and radio channels, providing the structural link that allows broadcast operations to be aggregated under their parent ventures. Like groups_publications, this junction table enables the construction of detailed views that combine venture-level and channel-level information.

### Cross-Referential Views

The true analytical power of the database emerges in its views, which join base tables to answer specific operational questions. Each view represents a particular lens through which stakeholders can examine the media ecosystem.

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

This view answers the question: which media group owns each publication? By joining publications with their parent groups, it reveals the organizational hierarchy. For instance, the "Compact Initiative" is owned by "Baseline Corridor D" (group_id 10449530), while the "Regional Cluster A" belongs to "Adaptive Assessment" (group_id 3718658437). This mapping is essential for understanding content ownership and for aggregating performance metrics at the group level.

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

This view links each publication to its distribution channel, answering: through which platform does each publication reach its audience? The "Compact Initiative" is distributed via the "Baseline Initiative D" platform (id 1), which is currently inactive. In contrast, the "Seasonal Review" uses the "Primary Review A" platform (id 4), which is active and records 48 monthly visitors. This relationship is critical for assessing distribution health and identifying underperforming channels.

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

This view provides a consolidated picture of each media group alongside its associated publications, answering: what is the performance profile of each group's content portfolio? A row combining "Baseline Corridor D" with the "Compact Initiative" shows a group with 7.45 market share overseeing a publication with 21 in circulation and 10 unique visitors. Another row pairing "Adaptive Assessment" with "Regional Cluster A" reveals a group with 14.35 market share managing a publication with 15 in circulation and 22 unique visitors. This view enables direct comparison of group-level and publication-level metrics.

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

This view connects media groups to their operational subsidiaries, answering: which subsidiary operates under each media group? The "Baseline Corridor D" group is linked to the "Adaptive Corridor" subsidiary (6.95 ownership, active status), while "Adaptive Assessment" is connected to "Composite Assessment D" (10.85 ownership, active status). This relationship clarifies the operational structure and ownership distribution within each group.

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

This view maps media groups to their delivery platforms, answering: which distribution infrastructure does each group control? "Baseline Corridor D" operates the "Baseline Initiative D" platform (inactive, 18 monthly visitors), whereas "Primary Survey A" runs the "Primary Review A" platform (active, 48 monthly visitors). This view is essential for evaluating the distribution capabilities and audience reach of each media group.

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

This view reverses the perspective, showing which publications are distributed through each platform. The "Baseline Initiative D" platform delivers the "Compact Initiative" publication, while the "Distributed Model" platform carries the "Legacy Model." This inversion is useful for platform-level analysis, such as determining which publications drive the most traffic through a given distribution channel.

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

This view links delivery platforms to their parent media groups, answering: which media group controls each distribution platform? The "Baseline Initiative D" platform belongs to "Baseline Corridor D," and the "Adaptive Cluster" platform is controlled by "Adaptive Assessment." This relationship is fundamental for understanding the vertical integration between content creation, distribution, and organizational ownership.

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

This view presents each subsidiary alongside its parent media group, answering: which group does each subsidiary serve? The "Adaptive Corridor" subsidiary operates under "Baseline Corridor D," and the "Compact Survey" subsidiary serves "Primary Survey A." This view supports operational audits and ownership verification across the corporate structure.

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

This view connects subsidiaries to their associated delivery platforms, answering: which distribution platform does each subsidiary utilize? The "Adaptive Corridor" subsidiary uses platform id 1 ("Baseline Initiative D"), while the "Compact Survey" subsidiary uses platform id 4 ("Primary Review A"). This relationship is important for assessing the alignment between operational units and their distribution infrastructure.

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

This view maps advertising networks to their associated subsidiaries, answering: which subsidiary is linked to each advertising network? The "Seasonal Programme" network is tied to the "Adaptive Corridor" subsidiary, and the "Pilot Protocol" network connects to the "Compact Survey" subsidiary. This view supports revenue attribution and advertising performance analysis at the subsidiary level.

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

This view links advertising networks to their associated publications, answering: which publication does each advertising network monetize? The "Seasonal Programme" network serves the "Compact Initiative" publication, while the "Extended Framework D" network covers the "Regional Cluster A." This relationship is critical for understanding the advertising revenue pipeline from network to content.

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

This view connects radio channels to their parent joint ventures, answering: which joint venture operates each radio channel? The "Adaptive Corridor" radio channel (id 1000) operates under joint venture 100, and the "Compact Survey" channel (id 1003) is managed by joint venture 103. This view provides clarity on the governance structure of broadcast operations.

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

This view links radio channels to their associated publications, answering: which publication is each radio channel connected to? The "Adaptive Corridor" radio channel is linked to the "Compact Initiative" publication, and the "Primary Series" radio channel connects to the "Legacy Model." This cross-platform relationship demonstrates how broadcast and print/digital content are integrated within the media portfolio.

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

This view combines joint venture information with radio channel details, answering: what is the full profile of each joint venture's broadcast operation? A row showing joint venture 100 with the "Adaptive Corridor" channel reveals a regional frequency, composite language, active status, and an audience of 16. Another row pairing joint venture 103 with the "Compact Survey" channel shows a composite frequency, distributed language, inactive status, and an audience of 31. This view supports comprehensive evaluation of broadcast performance across joint ventures.

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

This view connects joint ventures to their parent media groups, answering: which media group is associated with each joint venture? By tracing the relationships through radio channels and publications, this view reveals the organizational scope of each joint venture. For example, joint venture 100, which operates the "Adaptive Corridor" radio channel linked to the "Compact Initiative" publication, ultimately connects to the "Baseline Corridor D" media group. This view is essential for understanding the full reach of joint venture arrangements across the media ecosystem.

### Synthesis

The media ownership and distribution ecosystem is a tightly integrated network of content creators, distribution channels, operational subsidiaries, and advertising partners. Each entity—from the smallest publication to the largest media group—exists within a web of relationships that can be traced through the database's tables and views. The base tables capture the fundamental records: publications with their circulation and audience metrics, media groups with their market positions, delivery platforms with their distribution capabilities, subsidiaries with their ownership stakes, advertising networks with their impression counts, radio channels with their audience sizes, and joint ventures with their broadcast operations. The junction tables formalize the associations between groups and publications and between ventures and channels. The views then synthesize these records into actionable insights, answering specific questions about ownership, distribution, monetization, and cross-platform integration. Together, they provide a complete operational picture of a media organization, enabling stakeholders to understand not just what exists, but how every piece connects to every other piece.