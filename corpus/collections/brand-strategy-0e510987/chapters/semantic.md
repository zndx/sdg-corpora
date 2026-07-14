The marketing and brand management domain is modelled as a layered architecture in which strategic intent flows downward through campaigns and content, while brand identity and its tangible expressions form a parallel lattice of associations. At the apex sits the brand strategy, a declarative record that anchors every subsequent artefact. Campaigns inherit from strategy, content inherits from campaign, and digital properties—responsive websites, mobile applications, and e-commerce stores—exist as peer deliverables that are independently tracked but contextually aligned to the same strategic objectives. Brand identity and print material occupy a separate but intersecting graph, connected to brand strategy through a many-to-many junction and to each other through a second junction table. The relational schema materialises this layered design with ten base tables and six materialised views that reconstruct the domain facts at query time.

## Brand Strategy as the Root Entity

The `BrandStrategy` table is the root of the strategic hierarchy. Each row represents a distinct brand positioning effort and is identified by the surrogate key `strategyId`. The business-facing column `brandName` carries human-readable identifiers such as "The College-Ready Promise", "General Foods", "Navistar International", and "Root Inc.". The column `positioningStatement` stores a compact code describing the strategic posture—values like `compact-position-74`, `composite-position-75`, `primary-position-76`, and `adaptive-position-77`—while `targetAudience` holds a corresponding audience descriptor (`legacy-target-25`, `compact-target-26`, `composite-target-27`, `primary-target-28`). The lifecycle of a strategy is captured in the `status` column, which enumerates the states `draft`, `approved`, `implemented`, and `archived`. Temporal provenance is recorded in `createdDate` and `lastModified`, both stored as ISO-8601 timestamps; for example, strategy 2 ("General Foods") was created on `2025-04-03T05:47:00` and last modified on `2023-10-16T11:53:00`.

**Table `BrandStrategy`**

| strategyId | brandName | positioningStatement | targetAudience | status | createdDate | lastModified |
|---|---|---|---|---|---|---|
| 1 | The College-Ready Promise | compact-position-74 | legacy-target-25 | draft | 2024-11-19T22:30:00 | 2022-05-05T04:36:00 |
| 2 | General Foods | composite-position-75 | compact-target-26 | approved | 2025-04-03T05:47:00 | 2023-10-16T11:53:00 |
| 3 | Navistar International | primary-position-76 | composite-target-27 | implemented | 2022-09-14T12:04:00 | 2024-03-27T18:10:00 |
| 4 | Root Inc. | adaptive-position-77 | primary-target-28 | archived | 2023-02-25T19:21:00 | 2025-08-11T01:27:00 |

The primary key `strategyId` is referenced as a foreign key in `CampaignStrategy`, establishing the first cardinality-bounded relationship in the model: one brand strategy may be associated with zero or more campaigns, but each campaign belongs to exactly one strategy.

## Campaign Strategy and Content Strategy

The `CampaignStrategy` table materialises the tactical layer. Its primary key `campaignId` is a large integer identifier (e.g., `7021001070100` for "Compact Framework", `1437599` for "Legacy Protocol", `2106708` for "Regional Programme A", `4985162` for "Seasonal Standard"). The column `campaignName` holds the human-readable label, while `startDate` and `endDate` define the campaign window. The `budget` column stores a decimal value (ranging from `17.12` to `35.45` in the sample data), and `status` enumerates `planning`, `active`, `completed`, and `cancelled`. The `channel` column distinguishes `online`, `offline`, and `omnichannel` deployments. Performance expectations are captured in `targetEngagementRate` (values such as `19.70`, `22.40`, `25.10`, `27.80`). The foreign key `strategyId` links each campaign back to its parent `BrandStrategy`; for instance, campaign `7021001070100` references `strategyId = 1` ("The College-Ready Promise"). Audit timestamps `createdAt` and `updatedAt` record creation and modification events.

**Table `CampaignStrategy`**

| campaignId | campaignName | startDate | endDate | budget | status | channel | targetEngagementRate | strategyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 7021001070100 | Compact Framework | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 35.45 | planning | online | 19.70 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1437599 | Legacy Protocol | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 18.47 | active | offline | 22.40 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2106708 | Regional Programme A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 26.25 | completed | omnichannel | 25.10 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4985162 | Seasonal Standard | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 17.12 | cancelled | online | 27.80 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `ContentStrategy` table sits one level deeper in the hierarchy. Its surrogate primary key `id` is a small integer (1000–1003 in the sample), while the business identifier `contentId` carries heterogeneous formats: plain integers (`790491`, `69447`), ISBN-style strings (`978-0-7295-3929-6`), and UUIDs (`50515872-8fb2-11eb-924d-9cd76263cbd0`). The column `contentTitle` provides the human-readable name, and `contentType` classifies the asset as `blog`, `email`, `social`, or `video`. The `publishDate` column stores an ISO-8601 timestamp, `status` enumerates `draft`, `review`, `published`, and `archived`, and `conversionRate` captures a performance metric (e.g., `10.95`, `14.90`, `18.85`, `22.80`). The column `platform` holds a platform descriptor such as `distributed-platform-48`, `baseline-platform-49`, `pilot-platform-50`, or `extended-platform-51`. The foreign key `strategyCampaignId` references `CampaignStrategy.campaignId`, binding each content item to its parent campaign; content row 1000 (`contentId = 790491`, title "Primary Programme A", type `blog`) is linked to campaign `7021001070100`.

**Table `ContentStrategy`**

| id | contentId | contentTitle | contentType | publishDate | status | conversionRate | platform | strategyCampaignId |
|---|---|---|---|---|---|---|---|---|
| 1000 | 790491 | Primary Programme A | blog | 2023-06-06T17:03:00 | draft | 10.95 | distributed-platform-48 | 7021001070100 |
| 1001 | 978-0-7295-3929-6 | Composite Standard | email | 2024-11-17T00:20:00 | review | 14.90 | baseline-platform-49 | 1437599 |
| 1002 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | Compact Framework | social | 2025-04-01T07:37:00 | published | 18.85 | pilot-platform-50 | 2106708 |
| 1003 | 69447 | Legacy Protocol D | video | 2022-09-12T14:54:00 | archived | 22.80 | extended-platform-51 | 4985162 |

## Digital Asset Deliverables

Three tables model the digital property layer. The `ResponsiveWebsite` table stores website properties with `websiteId` as the primary key, which in this schema holds a URL value (e.g., `http://ankrolab.com`, `https://bugs.launchpad.net/keystone/+bug/1440185`, `https://elephant.art/`, `http://twitter.com/annhealthcare/status/423315405965635584`). The column `domainName` carries a human-readable label such as "Regional Protocol", "Seasonal Programme D", "Integrated Standard", and "Extended Framework". The `launchDate` column stores a date value, `conversionRate` captures a decimal metric, and `trafficSource` classifies the primary acquisition channel as `organic`, `paid`, `social`, or `referral`. The boolean column `mobileOptimized` indicates responsive design capability, and `cmsPlatform` stores the content management system identifier (e.g., `baseline-cms-13`, `pilot-cms-14`, `extended-cms-15`, `integrated-cms-16`).

**Table `ResponsiveWebsite`**

| websiteId | domainName | launchDate | conversionRate | trafficSource | mobileOptimized | cmsPlatform |
|---|---|---|---|---|---|---|
| http://ankrolab.com | Regional Protocol | 2022-05-17 | 10.95 | organic | true | baseline-cms-13 |
| https://bugs.launchpad.net/keystone/+bug/1440185 | Seasonal Programme D | 2023-10-01 | 14.90 | paid | false | pilot-cms-14 |
| https://elephant.art/ | Integrated Standard | 2024-03-12 | 18.85 | social | true | extended-cms-15 |
| http://twitter.com/annhealthcare/status/423315405965635584 | Extended Framework | 2025-08-23 | 22.80 | referral | false | integrated-cms-16 |

The `MobileApp` table models mobile applications. Its primary key `appId` is a small integer (100–103). The column `appName` holds names like "Pilot Cluster", "Baseline Review", "Distributed Initiative A", and "Adaptive Model". The `platform` column classifies the target as `iOS`, `Android`, or `cross-platform`. The `launchDate` column stores a date, `loadTime` captures a decimal performance metric (e.g., `8.45`, `12.90`, `17.35`, `21.80`), and `activeUsers` stores an integer count (21, 25, 29, 33). The `status` column enumerates `beta`, `live`, and `deprecated`.

**Table `MobileApp`**

| appId | appName | platform | launchDate | loadTime | activeUsers | status |
|---|---|---|---|---|---|---|
| 100 | Pilot Cluster | iOS | 2022-05-17 | 8.45 | 21 | beta |
| 101 | Baseline Review | Android | 2023-10-01 | 12.90 | 25 | live |
| 102 | Distributed Initiative A | cross-platform | 2024-03-12 | 17.35 | 29 | deprecated |
| 103 | Adaptive Model | iOS | 2025-08-23 | 21.80 | 33 | beta |

The `EcommerceWebsite` table models online stores. Its surrogate primary key `id` is a small integer (1–4), while the business identifier `ecommerceId` carries heterogeneous formats: integers (`328`, `16620628`, `4060650`) and a UUID (`18ba4c46-8fc8-11eb-924d-9cd76263cbd0`). The column `storeName` holds names such as "Distributed Standard", "Adaptive Framework D", "Primary Protocol", and "Composite Programme". The `conversionRate` column stores a decimal metric, `paymentGateway` classifies the payment processor (e.g., `extended-payment-63`, `integrated-payment-64`, `seasonal-payment-65`, `regional-payment-66`), and `inventorySystem` stores the inventory platform identifier (e.g., `regional-inventor-18`, `legacy-inventor-19`, `compact-inventor-20`, `composite-inventor-21`). The boolean column `socialIntegration` indicates whether social features are enabled, and `lastAuditDate` records the most recent compliance audit date.

**Table `EcommerceWebsite`**

| id | ecommerceId | storeName | conversionRate | paymentGateway | inventorySystem | socialIntegration | lastAuditDate |
|---|---|---|---|---|---|---|---|
| 1 | 328 | Distributed Standard | 10.95 | extended-payment-63 | regional-inventor-18 | false | 2023-10-23 |
| 2 | 16620628 | Adaptive Framework D | 14.90 | integrated-payment-64 | legacy-inventor-19 | true | 2024-03-07 |
| 3 | 18ba4c46-8fc8-11eb-924d-9cd76263cbd0 | Primary Protocol | 18.85 | seasonal-payment-65 | compact-inventor-20 | false | 2025-08-18 |
| 4 | 4060650 | Composite Programme | 22.80 | regional-payment-66 | composite-inventor-21 | true | 2022-01-02 |

## Brand Identity and Print Material

The `BrandIdentity` table captures the brand's visual and messaging identity assets. Its structure and relationships are mediated through the junction table `BrandStrategyBrandIdentity`, which implements a many-to-many association between `BrandStrategy` and `BrandIdentity`. Each row in `BrandStrategyBrandIdentity` contains a foreign key to `BrandStrategy.strategyId` and a foreign key to `BrandIdentity` (the specific column name for the identity reference is defined in the junction table). This design allows a single brand strategy to be associated with multiple identity variants, and a single identity to be deployed across multiple strategies.

**Table `BrandIdentity`**

| identityId | brandName | logoUrl | primaryColor | secondaryColor | fontFamily | version | strategyId |
|---|---|---|---|---|---|---|---|
| 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 | Brown | Black | regional-font-96 | seasonal-version-71 | 1 |
| d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 | Purple | Indigo | legacy-font-97 | regional-version-72 | 2 |
| 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp | Silver | Grey | compact-font-98 | legacy-version-73 | 3 |
| 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 | No Hair | Red | composite-font-99 | compact-version-74 | 4 |

**Table `BrandStrategyBrandIdentity`**

| strategyId | identityId |
|---|---|
| 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 |
| 1 | d87f6fa90b894eb8be0b031dcc4d667a |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a |
| 2 | 3744023 |
| 3 | 3744023 |
| 3 | 103179 |
| 4 | 103179 |
| 4 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 |

The `PrintMaterial` table stores physical marketing artefacts. Its relationship to `BrandIdentity` is mediated through the junction table `BrandIdentityPrintMaterial`, which implements a many-to-many association. Each row in `BrandIdentityPrintMaterial` contains a foreign key to `BrandIdentity` and a foreign key to `PrintMaterial`, allowing a single identity to be expressed across multiple print formats and a single print format to carry multiple identity variants.

**Table `PrintMaterial`**

| materialId | materialType | printDate | quantity | paperType | finish | status | identityId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 1 | businessCard | 2022-05-12 | 9 | seasonal-paper-53 | matte | designed | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | 2025-01-01 00:14:00 |
| 2 | brochure | 2023-10-23 | 8 | regional-paper-54 | glossy | printed | d87f6fa90b894eb8be0b031dcc4d667a | 2025-02-06 03:14:00 |
| 3 | billboard | 2024-03-07 | 0 | legacy-paper-55 | embossed | distributed | 3744023 | 2025-03-11 06:14:00 |
| 4 | annualReport | 2025-08-18 | 12 | compact-paper-56 | matte | designed | 103179 | 2025-04-16 09:14:00 |

**Table `BrandIdentityPrintMaterial`**

| identityId | materialId |
|---|---|
| 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | 1 |
| 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | 2 |
| d87f6fa90b894eb8be0b031dcc4d667a | 2 |
| d87f6fa90b894eb8be0b031dcc4d667a | 3 |
| 3744023 | 3 |
| 3744023 | 4 |
| 103179 | 4 |
| 103179 | 1 |

## Materialised Views

The six views reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question by denormalising the relationships that the base schema keeps separate.

The view `v_brand_strategy_brand_identity_detail` joins `BrandStrategy` with `BrandIdentity` through the `BrandStrategyBrandIdentity` junction table. It answers the question: "Which brand identity assets are associated with each brand strategy?" A row in this view would present the strategy's `brandName` and `positioningStatement` alongside the identity's attributes, enabling a analyst to see the full association in a single row. For example, strategy 1 ("The College-Ready Promise") with positioning statement `compact-position-74` would appear alongside its linked identity records, providing a consolidated view of the strategic-identity mapping.

**View `v_brand_strategy_brand_identity_detail`**

```sql
CREATE VIEW v_brand_strategy_brand_identity_detail AS
SELECT a.strategyId, a.brandName, a.positioningStatement, b.identityId AS identity_identityId, b.brandName AS identity_brandName, b.logoUrl AS identity_logoUrl
FROM BrandStrategy a
  JOIN BrandStrategyBrandIdentity j ON j.strategyId = a.strategyId
  JOIN BrandIdentity b ON b.identityId = j.identityId;
```

| strategyId | brandName | positioningStatement | identity_identityId | identity_brandName | identity_logoUrl |
|---|---|---|---|---|---|
| 1 | The College-Ready Promise | compact-position-74 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 |
| 1 | The College-Ready Promise | compact-position-74 | d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 |
| 2 | General Foods | composite-position-75 | d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 |
| 2 | General Foods | composite-position-75 | 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp |
| 3 | Navistar International | primary-position-76 | 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp |
| 3 | Navistar International | primary-position-76 | 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 |
| 4 | Root Inc. | adaptive-position-77 | 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 |
| 4 | Root Inc. | adaptive-position-77 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 |

The view `v_campaign_strategy_brand_strategy` joins `CampaignStrategy` with `BrandStrategy` on the `strategyId` foreign key. It answers: "Which brand strategy does each campaign belong to, and what are the campaign's operational details?" A row in this view would present the campaign's `campaignName`, `startDate`, `endDate`, `budget`, `status`, and `channel` alongside the parent strategy's `brandName` and `positioningStatement`. For instance, campaign `7021001070100` ("Compact Framework", budget `35.45`, channel `online`, status `planning`) would appear with its parent strategy's brand name "The College-Ready Promise" and positioning statement `compact-position-74`, allowing a planner to assess campaign alignment at a glance.

**View `v_campaign_strategy_brand_strategy`**

```sql
CREATE VIEW v_campaign_strategy_brand_strategy AS
SELECT a.campaignId, a.campaignName, a.startDate, a.endDate, b.strategyId AS strategy_strategyId, b.brandName AS strategy_brandName, b.positioningStatement AS strategy_positioningStatement
FROM CampaignStrategy a JOIN BrandStrategy b ON a.strategyId = b.strategyId;
```

| campaignId | campaignName | startDate | endDate | strategy_strategyId | strategy_brandName | strategy_positioningStatement |
|---|---|---|---|---|---|---|
| 7021001070100 | Compact Framework | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | The College-Ready Promise | compact-position-74 |
| 1437599 | Legacy Protocol | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | General Foods | composite-position-75 |
| 2106708 | Regional Programme A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | Navistar International | primary-position-76 |
| 4985162 | Seasonal Standard | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | Root Inc. | adaptive-position-77 |

The view `v_content_strategy_campaign_strategy` joins `ContentStrategy` with `CampaignStrategy` on the `strategyCampaignId` foreign key. It answers: "Which campaign is each content item supporting, and what are the content's performance metrics?" A row in this view would present the content's `contentTitle`, `contentType`, `publishDate`, `status`, and `conversionRate` alongside the parent campaign's `campaignName`, `channel`, and `targetEngagementRate`. For example, content row 1000 ("Primary Programme A", type `blog`, conversion rate `10.95`) would appear with its parent campaign `7021001070100` ("Compact Framework", channel `online`, target engagement rate `19.70`), enabling a content manager to evaluate whether content performance meets campaign targets.

**View `v_content_strategy_campaign_strategy`**

```sql
CREATE VIEW v_content_strategy_campaign_strategy AS
SELECT a.id, a.contentId, a.contentTitle, a.contentType, b.campaignId AS strategy_campaignId, b.campaignName AS strategy_campaignName, b.startDate AS strategy_startDate
FROM ContentStrategy a JOIN CampaignStrategy b ON a.strategyCampaignId = b.campaignId;
```

| id | contentId | contentTitle | contentType | strategy_campaignId | strategy_campaignName | strategy_startDate |
|---|---|---|---|---|---|---|
| 1000 | 790491 | Primary Programme A | blog | 7021001070100 | Compact Framework | 2022-09-05T20:24:00 |
| 1001 | 978-0-7295-3929-6 | Composite Standard | email | 1437599 | Legacy Protocol | 2023-02-16T03:41:00 |
| 1002 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | Compact Framework | social | 2106708 | Regional Programme A | 2024-07-27T10:58:00 |
| 1003 | 69447 | Legacy Protocol D | video | 4985162 | Seasonal Standard | 2025-12-11T17:15:00 |

The view `v_brand_identity_brand_strategy` joins `BrandIdentity` with `BrandStrategy` through the `BrandStrategyBrandIdentity` junction table, essentially the inverse of `v_brand_strategy_brand_identity_detail`. It answers: "From the identity's perspective, which brand strategies is this identity deployed across?" This view is useful for identity governance, allowing a brand manager to see all strategies that reference a given identity asset.

**View `v_brand_identity_brand_strategy`**

```sql
CREATE VIEW v_brand_identity_brand_strategy AS
SELECT a.identityId, a.brandName, a.logoUrl, a.primaryColor, b.strategyId AS strategy_strategyId, b.brandName AS strategy_brandName, b.positioningStatement AS strategy_positioningStatement
FROM BrandIdentity a JOIN BrandStrategy b ON a.strategyId = b.strategyId;
```

| identityId | brandName | logoUrl | primaryColor | strategy_strategyId | strategy_brandName | strategy_positioningStatement |
|---|---|---|---|---|---|---|
| 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 | Brown | 1 | The College-Ready Promise | compact-position-74 |
| d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 | Purple | 2 | General Foods | composite-position-75 |
| 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp | Silver | 3 | Navistar International | primary-position-76 |
| 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 | No Hair | 4 | Root Inc. | adaptive-position-77 |

The view `v_brand_identity_print_material_detail` joins `BrandIdentity` with `PrintMaterial` through the `BrandIdentityPrintMaterial` junction table. It answers: "Which print materials express this brand identity?" A row in this view would present the identity's attributes alongside the print material's details, enabling a creative director to review the full set of physical artefacts that carry a given identity.

**View `v_brand_identity_print_material_detail`**

```sql
CREATE VIEW v_brand_identity_print_material_detail AS
SELECT a.identityId, a.brandName, a.logoUrl, b.materialId AS material_materialId, b.materialType AS material_materialType, b.printDate AS material_printDate
FROM BrandIdentity a
  JOIN BrandIdentityPrintMaterial j ON j.identityId = a.identityId
  JOIN PrintMaterial b ON b.materialId = j.materialId;
```

| identityId | brandName | logoUrl | material_materialId | material_materialType | material_printDate |
|---|---|---|---|---|---|
| 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 | 1 | businessCard | 2022-05-12 |
| 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 | 2 | brochure | 2023-10-23 |
| d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 | 2 | brochure | 2023-10-23 |
| d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 | 3 | billboard | 2024-03-07 |
| 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp | 3 | billboard | 2024-03-07 |
| 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp | 4 | annualReport | 2025-08-18 |
| 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 | 4 | annualReport | 2025-08-18 |
| 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 | 1 | businessCard | 2022-05-12 |

The view `v_print_material_brand_identity` joins `PrintMaterial` with `BrandIdentity` through the `BrandIdentityPrintMaterial` junction table, providing the inverse perspective of `v_brand_identity_print_material_detail`. It answers: "From the print material's perspective, which brand identities does this material carry?" This view supports print production planning by showing all identity variants associated with a given print format.

**View `v_print_material_brand_identity`**

```sql
CREATE VIEW v_print_material_brand_identity AS
SELECT a.materialId, a.materialType, a.printDate, a.quantity, b.identityId AS identity_identityId, b.brandName AS identity_brandName, b.logoUrl AS identity_logoUrl
FROM PrintMaterial a JOIN BrandIdentity b ON a.identityId = b.identityId;
```

| materialId | materialType | printDate | quantity | identity_identityId | identity_brandName | identity_logoUrl |
|---|---|---|---|---|---|---|
| 1 | businessCard | 2022-05-12 | 9 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | The College-Ready Promise | https://www.nature.com/articles/nnano.2008.196 |
| 2 | brochure | 2023-10-23 | 8 | d87f6fa90b894eb8be0b031dcc4d667a | General Foods | https://www.chiltern.gov.uk/planning/localplan1997 |
| 3 | billboard | 2024-03-07 | 0 | 3744023 | Navistar International | https://www.investopedia.com/terms/h/hodl.asp |
| 4 | annualReport | 2025-08-18 | 12 | 103179 | Root Inc. | https://bugs.launchpad.net/kolla/+bug/1676751 |

## Synthesis

The schema models a marketing domain as two intersecting graphs. The first graph is a strict hierarchy: `BrandStrategy` → `CampaignStrategy` → `ContentStrategy`, with foreign keys enforcing that each campaign belongs to one strategy and each content item belongs to one campaign. The second graph is a many-to-many lattice: `BrandStrategy` ↔ `BrandIdentity` ↔ `PrintMaterial`, mediated by the junction tables `BrandStrategyBrandIdentity` and `BrandIdentityPrintMaterial`. The digital asset tables (`ResponsiveWebsite`, `MobileApp`, `EcommerceWebsite`) exist as peer entities that are independently tracked but contextually aligned to the strategic layer. The six views materialise the most common analytical joins, denormalising the hierarchy and lattice into flat result sets that answer specific business questions without requiring the application layer to construct joins. This design separates the concerns of data integrity (enforced by the base tables and foreign keys) from data presentation (provided by the views), following a standard relational pattern for enterprise data modelling.