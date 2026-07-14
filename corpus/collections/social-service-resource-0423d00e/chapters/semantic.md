Social services delivery is inherently multi-channel and multi-organizational: resources, hotlines, and digital access points are operated by distinct agencies, incidents are logged through hotlines, and beneficiaries interact with the system across multiple touchpoints. The relational model captures this complexity by separating entities into six base tables, linking them through five junction tables, and exposing six denormalized views that reconstruct the domain facts analysts need. Every table is keyed by a surrogate integer `id` (or `channelId` for `AccessChannel`), and every relationship is materialized as a foreign key column or a many-to-many junction table.

## Base tables and their attributes

The model centres on `SocialServiceResource`, the canonical catalogue of services. Each row carries a human-readable `resourceIdentifier` (e.g. `RES-2673`), a `resourceName` such as *Adaptive Corridor*, a `serviceCategory` drawn from the values `food_pantry`, `emergency_shelter`, `childcare`, and `housing`, and two boolean flags — `isConfidential` and `isFree` — that encode policy constraints. The `operatingHours` column stores either `24/7` or `business_hours`, and the `organizationId` foreign key ties the resource to its operating agency.

**Table `SocialServiceResource`**

| id | resourceIdentifier | resourceName | serviceCategory | isConfidential | isFree | operatingHours | organizationId |
|---|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | food_pantry | false | true | 24/7 | 1 |
| 2 | RES-2676 | Primary Series | emergency_shelter | true | false | business_hours | 2 |
| 3 | RES-2679 | Composite Assessment D | childcare | false | true | 24/7 | 3 |
| 4 | RES-2682 | Compact Survey | housing | true | false | business_hours | 4 |

`ServiceOrganization` is the other anchor entity. Its columns — `organizationIdentifier` (e.g. `LDAP First Name Field`), `organizationName` (e.g. *Staples Inc.*), `jurisdiction` (`federal`, `state`, `local`, `community`), `isGovernmentAgency`, and `websiteUrl` — describe the legal and operational identity of each provider. The surrogate `id` (1 through 4) is referenced by every other table that needs to attribute a row to an organization.

**Table `ServiceOrganization`**

| id | organizationIdentifier | organizationName | jurisdiction | isGovernmentAgency | websiteUrl |
|---|---|---|---|---|---|
| 1 | LDAP First Name Field | Staples Inc. | federal | National Beverage Corp. | https://github.com/chiphuyen/lazynlp |
| 2 | Goodyear Tire & Rubber | Oscar Health Inc. | state | Lockheed Martin | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 3 | LINK Interchange Network Ltd | Atlantic Richfield | local | Denver School of Science and Technology Inc. | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 4 | Alliant Energy Corp | Port Loko | community | Denver School of Science and Technology Inc. | https://www.nature.com/articles/nphoton.2014.41 |

`Hotline` represents telephone and SMS contact points. Columns include `phoneNumber` (prefixed with `PHO-`, e.g. `PHO-2092`), `smsKeyword` (e.g. `integrated-sms-16`), `hotlineType` (`mental_health`, `substance_abuse`, `human_trafficking`, `sexual_assault`), boolean flags `isAvailable247` and `isConfidential`, and the `organizationId` FK.

**Table `Hotline`**

| id | phoneNumber | smsKeyword | hotlineType | isAvailable247 | isConfidential | organizationId |
|---|---|---|---|---|---|---|
| 1000 | PHO-2092 | integrated-sms-16 | mental_health | false | false | 1 |
| 1001 | PHO-2093 | seasonal-sms-17 | substance_abuse | true | true | 2 |
| 1002 | PHO-2094 | regional-sms-18 | human_trafficking | false | false | 3 |
| 1003 | PHO-2095 | legacy-sms-19 | sexual_assault | true | true | 4 |

`Incident` records discrete events reported through hotlines. Its columns are `incidentIdentifier` (`INC-2635`), `incidentType` (mirroring hotline types plus `mental_health_crisis`), `reportedDateTime` in ISO-8601 format, `isConfirmed`, `severityLevel` (`low`, `medium`, `high`, `critical`), and two FK columns: `hotlineId` (pointing to `Hotline.id`) and `organizationId`.

**Table `Incident`**

| id | incidentIdentifier | incidentType | reportedDateTime | isConfirmed | severityLevel | hotlineId | organizationId |
|---|---|---|---|---|---|---|---|
| 1 | INC-2635 | human_trafficking | 2024-11-12T22:18:00 | true | low | 1000 | 1 |
| 2 | INC-2641 | sexual_assault | 2025-04-23T05:35:00 | false | medium | 1001 | 2 |
| 3 | INC-2647 | substance_abuse | 2022-09-07T12:52:00 | true | high | 1002 | 3 |
| 4 | INC-2653 | mental_health_crisis | 2023-02-18T19:09:00 | false | critical | 1003 | 4 |

`Beneficiary` stores the people who receive services. Columns include `beneficiaryIdentifier` (`BEN-2039`), `primaryLanguage` (`english`, `spanish`, `arabic`, `other`), `immigrationStatus` (`refugee`, `asylum_seeker`, `immigrant`, `citizen`), boolean flags `needsAssistance` and `requiresInterpreter`, and FK columns `hotlineId` and `incidentId`.

**Table `Beneficiary`**

| id | beneficiaryIdentifier | primaryLanguage | immigrationStatus | needsAssistance | requiresInterpreter | hotlineId | incidentId |
|---|---|---|---|---|---|---|---|
| 100 | BEN-2039 | english | refugee | false | true | 1000 | 1 |
| 101 | BEN-2044 | spanish | asylum_seeker | true | false | 1001 | 2 |
| 102 | BEN-2049 | arabic | immigrant | false | true | 1002 | 3 |
| 103 | BEN-2054 | other | citizen | true | false | 1003 | 4 |

`AccessChannel` captures digital and physical entry points such as websites, mobile apps, kiosks, and telephones. Its surrogate key is `channelId` (e.g. `1000`), and its columns are `channelIdentifier` (`CHA-2292`), `channelType` (`website`, `mobile_app`, `interactive_kiosk`, `telephone`), `urlOrEndpoint`, `supportsMultilingual`, `isFree`, `organizationId`, and timestamp columns `createdAt` and `updatedAt`.

**Table `AccessChannel`**

| channelId | channelIdentifier | channelType | urlOrEndpoint | supportsMultilingual | isFree | organizationId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1000 | CHA-2292 | website | https://bugs.launchpad.net/openstack-manuals/+bug/1341342 | false | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | CHA-2294 | mobile_app | https://www.mfsa.com.mt/financial-services-register/ | true | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | CHA-2296 | interactive_kiosk | https://grants.nih.gov/grants/guide/pa-files/PAR-18-251.html | false | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | CHA-2298 | telephone | https://bugs.launchpad.net/trove/+bug/1366175 | true | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Junction tables and many-to-many relationships

Not every relationship is one-to-many. A single social service resource can serve many beneficiaries and be reachable through many access channels; conversely, a beneficiary may use multiple resources and an access channel may promote multiple resources. These many-to-many relationships are modelled through five junction tables, each containing exactly two FK columns and no surrogate key of its own.

`SocialServiceResourceBeneficiary` links `SocialServiceResource` to `Beneficiary`. Its two columns — `socialServiceResourceId` and `beneficiaryId` — form a composite primary key, enforcing that each resource-beneficiary pair is recorded at most once.

**Table `SocialServiceResourceBeneficiary`**

| resourceId | beneficiaryId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

`SocialServiceResourceAccessChannel` links `SocialServiceResource` to `AccessChannel` via `socialServiceResourceId` and `accessChannelId`.

**Table `SocialServiceResourceAccessChannel`**

| resourceId | channelId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

`ServiceOrganizationSocialServiceResource` is a one-to-many bridge: each row's `serviceOrganizationId` references `ServiceOrganization.id` and its `socialServiceResourceId` references `SocialServiceResource.id`. In the current data every resource is operated by exactly one organization, so this table effectively mirrors the `organizationId` column already present on `SocialServiceResource`.

**Table `ServiceOrganizationSocialServiceResource`**

| organizationId | resourceId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

`ServiceOrganizationHotline` similarly links `ServiceOrganization` to `Hotline` through `serviceOrganizationId` and `hotlineId`.

**Table `ServiceOrganizationHotline`**

| organizationId | hotlineId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

`HotlineIncident` connects `Hotline` to `Incident` via `hotlineId` and `incidentId`. In the current dataset each incident references a hotline directly through the `hotlineId` column on `Incident`, so this junction table provides an alternative many-to-many path for cases where a hotline may log multiple incidents and an incident may be associated with multiple hotlines.

**Table `HotlineIncident`**

| hotlineId | incidentId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

`HotlineSocialServiceResource` links hotlines to the resources they promote or refer, through `hotlineId` and `socialServiceResourceId`.

**Table `HotlineSocialServiceResource`**

| hotlineId | resourceId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

`IncidentBeneficiary` connects incidents to the beneficiaries involved, via `incidentId` and `beneficiaryId`.

**Table `IncidentBeneficiary`**

| incidentId | beneficiaryId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

`BeneficiarySocialServiceResource` is a second resource-beneficiary bridge, providing an alternative many-to-many path alongside `SocialServiceResourceBeneficiary`.

**Table `BeneficiarySocialServiceResource`**

| beneficiaryId | resourceId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

`AccessChannelSocialServiceResource` is a second resource-access-channel bridge, alongside `SocialServiceResourceAccessChannel`.

**Table `AccessChannelSocialServiceResource`**

| channelId | resourceId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

## Views: reconstructing domain facts

The six base tables and five junction tables are normalized to third normal form. Analysts and downstream applications rarely need to join six tables by hand; instead, a set of materialized views presents pre-joined results. Each view answers a specific analytical question by pulling columns from two or three base tables.

### `v_social_service_resource_beneficiary_detail`

This view joins `SocialServiceResource` to `Beneficiary` through the `SocialServiceResourceBeneficiary` junction, producing one row per resource-beneficiary pairing. It answers the question: *which beneficiaries received which resources?* A sample row might show `resourceName = Adaptive Corridor` alongside `beneficiaryIdentifier = BEN-2039` and `primaryLanguage = english`, revealing that a refugee beneficiary accessed a food pantry service.

**View `v_social_service_resource_beneficiary_detail`**

```sql
CREATE VIEW v_social_service_resource_beneficiary_detail AS
SELECT a.id, a.resourceIdentifier, a.resourceName, b.id AS beneficiary_id, b.beneficiaryIdentifier AS beneficiary_beneficiaryIdentifier, b.primaryLanguage AS beneficiary_primaryLanguage
FROM SocialServiceResource a
  JOIN SocialServiceResourceBeneficiary j ON j.resourceId = a.id
  JOIN Beneficiary b ON b.id = j.beneficiaryId;
```

| id | resourceIdentifier | resourceName | beneficiary_id | beneficiary_beneficiaryIdentifier | beneficiary_primaryLanguage |
|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | 100 | BEN-2039 | english |
| 1 | RES-2673 | Adaptive Corridor | 101 | BEN-2044 | spanish |
| 2 | RES-2676 | Primary Series | 101 | BEN-2044 | spanish |
| 2 | RES-2676 | Primary Series | 102 | BEN-2049 | arabic |
| 3 | RES-2679 | Composite Assessment D | 102 | BEN-2049 | arabic |
| 3 | RES-2679 | Composite Assessment D | 103 | BEN-2054 | other |
| 4 | RES-2682 | Compact Survey | 103 | BEN-2054 | other |
| 4 | RES-2682 | Compact Survey | 100 | BEN-2039 | english |

### `v_social_service_resource_service_organization`

This view joins `SocialServiceResource` to `ServiceOrganization` via `ServiceOrganizationSocialServiceResource`, answering: *which organization operates which resource?* A row with `resourceName = Primary Series` and `organizationName = Oscar Health Inc.` paired with `jurisdiction = state` tells the reader that a state-level agency runs an emergency shelter.

**View `v_social_service_resource_service_organization`**

```sql
CREATE VIEW v_social_service_resource_service_organization AS
SELECT a.id, a.resourceIdentifier, a.resourceName, a.serviceCategory, b.id AS organization_id, b.organizationIdentifier AS organization_organizationIdentifier, b.organizationName AS organization_organizationName
FROM SocialServiceResource a JOIN ServiceOrganization b ON a.organizationId = b.id;
```

| id | resourceIdentifier | resourceName | serviceCategory | organization_id | organization_organizationIdentifier | organization_organizationName |
|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | food_pantry | 1 | LDAP First Name Field | Staples Inc. |
| 2 | RES-2676 | Primary Series | emergency_shelter | 2 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 3 | RES-2679 | Composite Assessment D | childcare | 3 | LINK Interchange Network Ltd | Atlantic Richfield |
| 4 | RES-2682 | Compact Survey | housing | 4 | Alliant Energy Corp | Port Loko |

### `v_social_service_resource_access_channel_detail`

This view joins `SocialServiceResource` to `AccessChannel` through `SocialServiceResourceAccessChannel`, answering: *through which channels can a beneficiary access a given resource?* A row might show `resourceName = Composite Assessment D` alongside `channelType = interactive_kiosk` and `urlOrEndpoint = https://grants.nih.gov/grants/guide/pa-files/PAR-18-251.html`, indicating that a childcare resource is accessible through a government-hosted kiosk.

**View `v_social_service_resource_access_channel_detail`**

```sql
CREATE VIEW v_social_service_resource_access_channel_detail AS
SELECT a.id, a.resourceIdentifier, a.resourceName, b.channelId AS channel_channelId, b.channelIdentifier AS channel_channelIdentifier, b.channelType AS channel_channelType
FROM SocialServiceResource a
  JOIN SocialServiceResourceAccessChannel j ON j.resourceId = a.id
  JOIN AccessChannel b ON b.channelId = j.channelId;
```

| id | resourceIdentifier | resourceName | channel_channelId | channel_channelIdentifier | channel_channelType |
|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | 1000 | CHA-2292 | website |
| 1 | RES-2673 | Adaptive Corridor | 1001 | CHA-2294 | mobile_app |
| 2 | RES-2676 | Primary Series | 1001 | CHA-2294 | mobile_app |
| 2 | RES-2676 | Primary Series | 1002 | CHA-2296 | interactive_kiosk |
| 3 | RES-2679 | Composite Assessment D | 1002 | CHA-2296 | interactive_kiosk |
| 3 | RES-2679 | Composite Assessment D | 1003 | CHA-2298 | telephone |
| 4 | RES-2682 | Compact Survey | 1003 | CHA-2298 | telephone |
| 4 | RES-2682 | Compact Survey | 1000 | CHA-2292 | website |

### `v_service_organization_social_service_resource_detail`

This view is the inverse of `v_social_service_resource_service_organization`: it presents `ServiceOrganization` as the driving table, with one row per resource operated by each organization. It answers: *what resources does a given organization provide?* A row with `organizationName = Staples Inc.` and `resourceName = Adaptive Corridor` shows that the federal agency operates a food pantry.

**View `v_service_organization_social_service_resource_detail`**

```sql
CREATE VIEW v_service_organization_social_service_resource_detail AS
SELECT a.id, a.organizationIdentifier, a.organizationName, b.id AS resource_id, b.resourceIdentifier AS resource_resourceIdentifier, b.resourceName AS resource_resourceName
FROM ServiceOrganization a
  JOIN ServiceOrganizationSocialServiceResource j ON j.organizationId = a.id
  JOIN SocialServiceResource b ON b.id = j.resourceId;
```

| id | organizationIdentifier | organizationName | resource_id | resource_resourceIdentifier | resource_resourceName |
|---|---|---|---|---|---|
| 1 | LDAP First Name Field | Staples Inc. | 1 | RES-2673 | Adaptive Corridor |
| 1 | LDAP First Name Field | Staples Inc. | 2 | RES-2676 | Primary Series |
| 2 | Goodyear Tire & Rubber | Oscar Health Inc. | 2 | RES-2676 | Primary Series |
| 2 | Goodyear Tire & Rubber | Oscar Health Inc. | 3 | RES-2679 | Composite Assessment D |
| 3 | LINK Interchange Network Ltd | Atlantic Richfield | 3 | RES-2679 | Composite Assessment D |
| 3 | LINK Interchange Network Ltd | Atlantic Richfield | 4 | RES-2682 | Compact Survey |
| 4 | Alliant Energy Corp | Port Loko | 4 | RES-2682 | Compact Survey |
| 4 | Alliant Energy Corp | Port Loko | 1 | RES-2673 | Adaptive Corridor |

### `v_service_organization_hotline_detail`

This view joins `ServiceOrganization` to `Hotline` via `ServiceOrganizationHotline`, answering: *which hotlines does each organization operate?* A row with `organizationName = Oscar Health Inc.` and `phoneNumber = PHO-2093` alongside `hotlineType = substance_abuse` and `isAvailable247 = true` reveals that a state agency runs a round-the-clock substance abuse hotline.

**View `v_service_organization_hotline_detail`**

```sql
CREATE VIEW v_service_organization_hotline_detail AS
SELECT a.id, a.organizationIdentifier, a.organizationName, b.id AS hotline_id, b.phoneNumber AS hotline_phoneNumber, b.smsKeyword AS hotline_smsKeyword
FROM ServiceOrganization a
  JOIN ServiceOrganizationHotline j ON j.organizationId = a.id
  JOIN Hotline b ON b.id = j.hotlineId;
```

| id | organizationIdentifier | organizationName | hotline_id | hotline_phoneNumber | hotline_smsKeyword |
|---|---|---|---|---|---|
| 1 | LDAP First Name Field | Staples Inc. | 1000 | PHO-2092 | integrated-sms-16 |
| 1 | LDAP First Name Field | Staples Inc. | 1001 | PHO-2093 | seasonal-sms-17 |
| 2 | Goodyear Tire & Rubber | Oscar Health Inc. | 1001 | PHO-2093 | seasonal-sms-17 |
| 2 | Goodyear Tire & Rubber | Oscar Health Inc. | 1002 | PHO-2094 | regional-sms-18 |
| 3 | LINK Interchange Network Ltd | Atlantic Richfield | 1002 | PHO-2094 | regional-sms-18 |
| 3 | LINK Interchange Network Ltd | Atlantic Richfield | 1003 | PHO-2095 | legacy-sms-19 |
| 4 | Alliant Energy Corp | Port Loko | 1003 | PHO-2095 | legacy-sms-19 |
| 4 | Alliant Energy Corp | Port Loko | 1000 | PHO-2092 | integrated-sms-16 |

### `v_hotline_service_organization`

This view presents `Hotline` as the driving table, joined to `ServiceOrganization`. It answers: *which organization operates a given hotline?* A row with `phoneNumber = PHO-2092` and `organizationName = Staples Inc.` tells the reader that the mental health hotline is operated by the federal agency.

**View `v_hotline_service_organization`**

```sql
CREATE VIEW v_hotline_service_organization AS
SELECT a.id, a.phoneNumber, a.smsKeyword, a.hotlineType, b.id AS organization_id, b.organizationIdentifier AS organization_organizationIdentifier, b.organizationName AS organization_organizationName
FROM Hotline a JOIN ServiceOrganization b ON a.organizationId = b.id;
```

| id | phoneNumber | smsKeyword | hotlineType | organization_id | organization_organizationIdentifier | organization_organizationName |
|---|---|---|---|---|---|---|
| 1000 | PHO-2092 | integrated-sms-16 | mental_health | 1 | LDAP First Name Field | Staples Inc. |
| 1001 | PHO-2093 | seasonal-sms-17 | substance_abuse | 2 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 1002 | PHO-2094 | regional-sms-18 | human_trafficking | 3 | LINK Interchange Network Ltd | Atlantic Richfield |
| 1003 | PHO-2095 | legacy-sms-19 | sexual_assault | 4 | Alliant Energy Corp | Port Loko |

### `v_hotline_incident_detail`

This view joins `Hotline` to `Incident` through `HotlineIncident`, answering: *what incidents were reported through a given hotline?* A row with `phoneNumber = PHO-2092`, `incidentIdentifier = INC-2635`, and `severityLevel = low` shows that a low-severity human trafficking incident was logged through the mental health hotline.

**View `v_hotline_incident_detail`**

```sql
CREATE VIEW v_hotline_incident_detail AS
SELECT a.id, a.phoneNumber, a.smsKeyword, b.id AS incident_id, b.incidentIdentifier AS incident_incidentIdentifier, b.incidentType AS incident_incidentType
FROM Hotline a
  JOIN HotlineIncident j ON j.hotlineId = a.id
  JOIN Incident b ON b.id = j.incidentId;
```

| id | phoneNumber | smsKeyword | incident_id | incident_incidentIdentifier | incident_incidentType |
|---|---|---|---|---|---|
| 1000 | PHO-2092 | integrated-sms-16 | 1 | INC-2635 | human_trafficking |
| 1000 | PHO-2092 | integrated-sms-16 | 2 | INC-2641 | sexual_assault |
| 1001 | PHO-2093 | seasonal-sms-17 | 2 | INC-2641 | sexual_assault |
| 1001 | PHO-2093 | seasonal-sms-17 | 3 | INC-2647 | substance_abuse |
| 1002 | PHO-2094 | regional-sms-18 | 3 | INC-2647 | substance_abuse |
| 1002 | PHO-2094 | regional-sms-18 | 4 | INC-2653 | mental_health_crisis |
| 1003 | PHO-2095 | legacy-sms-19 | 4 | INC-2653 | mental_health_crisis |
| 1003 | PHO-2095 | legacy-sms-19 | 1 | INC-2635 | human_trafficking |

### `v_hotline_social_service_resource_detail`

This view joins `Hotline` to `SocialServiceResource` via `HotlineSocialServiceResource`, answering: *which resources does a hotline promote or refer to?* A row with `phoneNumber = PHO-2093` and `resourceName = Primary Series` indicates that the substance abuse hotline refers callers to an emergency shelter.

**View `v_hotline_social_service_resource_detail`**

```sql
CREATE VIEW v_hotline_social_service_resource_detail AS
SELECT a.id, a.phoneNumber, a.smsKeyword, b.id AS resource_id, b.resourceIdentifier AS resource_resourceIdentifier, b.resourceName AS resource_resourceName
FROM Hotline a
  JOIN HotlineSocialServiceResource j ON j.hotlineId = a.id
  JOIN SocialServiceResource b ON b.id = j.resourceId;
```

| id | phoneNumber | smsKeyword | resource_id | resource_resourceIdentifier | resource_resourceName |
|---|---|---|---|---|---|
| 1000 | PHO-2092 | integrated-sms-16 | 1 | RES-2673 | Adaptive Corridor |
| 1000 | PHO-2092 | integrated-sms-16 | 2 | RES-2676 | Primary Series |
| 1001 | PHO-2093 | seasonal-sms-17 | 2 | RES-2676 | Primary Series |
| 1001 | PHO-2093 | seasonal-sms-17 | 3 | RES-2679 | Composite Assessment D |
| 1002 | PHO-2094 | regional-sms-18 | 3 | RES-2679 | Composite Assessment D |
| 1002 | PHO-2094 | regional-sms-18 | 4 | RES-2682 | Compact Survey |
| 1003 | PHO-2095 | legacy-sms-19 | 4 | RES-2682 | Compact Survey |
| 1003 | PHO-2095 | legacy-sms-19 | 1 | RES-2673 | Adaptive Corridor |

### `v_incident_hotline`

This view presents `Incident` as the driving table, joined to `Hotline`. It answers: *through which hotline was a given incident reported?* A row with `incidentIdentifier = INC-2641` and `phoneNumber = PHO-2093` alongside `incidentType = sexual_assault` and `isConfirmed = false` shows an unconfirmed sexual assault incident logged through a 24/7 confidential hotline.

**View `v_incident_hotline`**

```sql
CREATE VIEW v_incident_hotline AS
SELECT a.id, a.incidentIdentifier, a.incidentType, a.reportedDateTime, b.id AS hotline_id, b.phoneNumber AS hotline_phoneNumber, b.smsKeyword AS hotline_smsKeyword
FROM Incident a JOIN Hotline b ON a.hotlineId = b.id;
```

| id | incidentIdentifier | incidentType | reportedDateTime | hotline_id | hotline_phoneNumber | hotline_smsKeyword |
|---|---|---|---|---|---|---|
| 1 | INC-2635 | human_trafficking | 2024-11-12T22:18:00 | 1000 | PHO-2092 | integrated-sms-16 |
| 2 | INC-2641 | sexual_assault | 2025-04-23T05:35:00 | 1001 | PHO-2093 | seasonal-sms-17 |
| 3 | INC-2647 | substance_abuse | 2022-09-07T12:52:00 | 1002 | PHO-2094 | regional-sms-18 |
| 4 | INC-2653 | mental_health_crisis | 2023-02-18T19:09:00 | 1003 | PHO-2095 | legacy-sms-19 |

### `v_incident_beneficiary_detail`

This view joins `Incident` to `Beneficiary` through `IncidentBeneficiary`, answering: *which beneficiaries are associated with a given incident?* A row with `incidentIdentifier = INC-2647`, `beneficiaryIdentifier = BEN-2049`, and `immigrationStatus = immigrant` reveals that an immigrant beneficiary is linked to a high-severity substance abuse incident.

**View `v_incident_beneficiary_detail`**

```sql
CREATE VIEW v_incident_beneficiary_detail AS
SELECT a.id, a.incidentIdentifier, a.incidentType, b.id AS beneficiary_id, b.beneficiaryIdentifier AS beneficiary_beneficiaryIdentifier, b.primaryLanguage AS beneficiary_primaryLanguage
FROM Incident a
  JOIN IncidentBeneficiary j ON j.incidentId = a.id
  JOIN Beneficiary b ON b.id = j.beneficiaryId;
```

| id | incidentIdentifier | incidentType | beneficiary_id | beneficiary_beneficiaryIdentifier | beneficiary_primaryLanguage |
|---|---|---|---|---|---|
| 1 | INC-2635 | human_trafficking | 100 | BEN-2039 | english |
| 1 | INC-2635 | human_trafficking | 101 | BEN-2044 | spanish |
| 2 | INC-2641 | sexual_assault | 101 | BEN-2044 | spanish |
| 2 | INC-2641 | sexual_assault | 102 | BEN-2049 | arabic |
| 3 | INC-2647 | substance_abuse | 102 | BEN-2049 | arabic |
| 3 | INC-2647 | substance_abuse | 103 | BEN-2054 | other |
| 4 | INC-2653 | mental_health_crisis | 103 | BEN-2054 | other |
| 4 | INC-2653 | mental_health_crisis | 100 | BEN-2039 | english |

### `v_incident_service_organization`

This view joins `Incident` to `ServiceOrganization` (via the `organizationId` FK on `Incident`), answering: *which organization is responsible for a given incident?* A row with `incidentIdentifier = INC-2653` and `organizationName = Port Loko` alongside `severityLevel = critical` shows that a community-level agency is associated with a critical mental health crisis incident.

**View `v_incident_service_organization`**

```sql
CREATE VIEW v_incident_service_organization AS
SELECT a.id, a.incidentIdentifier, a.incidentType, a.reportedDateTime, b.id AS organization_id, b.organizationIdentifier AS organization_organizationIdentifier, b.organizationName AS organization_organizationName
FROM Incident a JOIN ServiceOrganization b ON a.organizationId = b.id;
```

| id | incidentIdentifier | incidentType | reportedDateTime | organization_id | organization_organizationIdentifier | organization_organizationName |
|---|---|---|---|---|---|---|
| 1 | INC-2635 | human_trafficking | 2024-11-12T22:18:00 | 1 | LDAP First Name Field | Staples Inc. |
| 2 | INC-2641 | sexual_assault | 2025-04-23T05:35:00 | 2 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 3 | INC-2647 | substance_abuse | 2022-09-07T12:52:00 | 3 | LINK Interchange Network Ltd | Atlantic Richfield |
| 4 | INC-2653 | mental_health_crisis | 2023-02-18T19:09:00 | 4 | Alliant Energy Corp | Port Loko |

### `v_beneficiary_social_service_resource_detail`

This view joins `Beneficiary` to `SocialServiceResource` through `BeneficiarySocialServiceResource`, answering: *which resources did a given beneficiary access?* A row with `beneficiaryIdentifier = BEN-2044`, `resourceName = Compact Survey`, and `serviceCategory = housing` indicates that an asylum seeker accessed a housing resource.

**View `v_beneficiary_social_service_resource_detail`**

```sql
CREATE VIEW v_beneficiary_social_service_resource_detail AS
SELECT a.id, a.beneficiaryIdentifier, a.primaryLanguage, b.id AS resource_id, b.resourceIdentifier AS resource_resourceIdentifier, b.resourceName AS resource_resourceName
FROM Beneficiary a
  JOIN BeneficiarySocialServiceResource j ON j.beneficiaryId = a.id
  JOIN SocialServiceResource b ON b.id = j.resourceId;
```

| id | beneficiaryIdentifier | primaryLanguage | resource_id | resource_resourceIdentifier | resource_resourceName |
|---|---|---|---|---|---|
| 100 | BEN-2039 | english | 1 | RES-2673 | Adaptive Corridor |
| 100 | BEN-2039 | english | 2 | RES-2676 | Primary Series |
| 101 | BEN-2044 | spanish | 2 | RES-2676 | Primary Series |
| 101 | BEN-2044 | spanish | 3 | RES-2679 | Composite Assessment D |
| 102 | BEN-2049 | arabic | 3 | RES-2679 | Composite Assessment D |
| 102 | BEN-2049 | arabic | 4 | RES-2682 | Compact Survey |
| 103 | BEN-2054 | other | 4 | RES-2682 | Compact Survey |
| 103 | BEN-2054 | other | 1 | RES-2673 | Adaptive Corridor |

### `v_beneficiary_hotline`

This view presents `Beneficiary` as the driving table, joined to `Hotline`. It answers: *which hotline did a given beneficiary contact?* A row with `beneficiaryIdentifier = BEN-2054`, `phoneNumber = PHO-2095`, and `hotlineType = sexual_assault` shows that a citizen beneficiary contacted a 24/7 confidential sexual assault hotline.

**View `v_beneficiary_hotline`**

```sql
CREATE VIEW v_beneficiary_hotline AS
SELECT a.id, a.beneficiaryIdentifier, a.primaryLanguage, a.immigrationStatus, b.id AS hotline_id, b.phoneNumber AS hotline_phoneNumber, b.smsKeyword AS hotline_smsKeyword
FROM Beneficiary a JOIN Hotline b ON a.hotlineId = b.id;
```

| id | beneficiaryIdentifier | primaryLanguage | immigrationStatus | hotline_id | hotline_phoneNumber | hotline_smsKeyword |
|---|---|---|---|---|---|---|
| 100 | BEN-2039 | english | refugee | 1000 | PHO-2092 | integrated-sms-16 |
| 101 | BEN-2044 | spanish | asylum_seeker | 1001 | PHO-2093 | seasonal-sms-17 |
| 102 | BEN-2049 | arabic | immigrant | 1002 | PHO-2094 | regional-sms-18 |
| 103 | BEN-2054 | other | citizen | 1003 | PHO-2095 | legacy-sms-19 |

### `v_beneficiary_incident`

This view joins `Beneficiary` to `Incident` through `IncidentBeneficiary`, answering: *which incidents is a given beneficiary involved in?* A row with `beneficiaryIdentifier = BEN-2039`, `incidentIdentifier = INC-2635`, and `incidentType = human_trafficking` reveals that a refugee beneficiary is linked to a confirmed low-severity human trafficking incident.

**View `v_beneficiary_incident`**

```sql
CREATE VIEW v_beneficiary_incident AS
SELECT a.id, a.beneficiaryIdentifier, a.primaryLanguage, a.immigrationStatus, b.id AS incident_id, b.incidentIdentifier AS incident_incidentIdentifier, b.incidentType AS incident_incidentType
FROM Beneficiary a JOIN Incident b ON a.incidentId = b.id;
```

| id | beneficiaryIdentifier | primaryLanguage | immigrationStatus | incident_id | incident_incidentIdentifier | incident_incidentType |
|---|---|---|---|---|---|---|
| 100 | BEN-2039 | english | refugee | 1 | INC-2635 | human_trafficking |
| 101 | BEN-2044 | spanish | asylum_seeker | 2 | INC-2641 | sexual_assault |
| 102 | BEN-2049 | arabic | immigrant | 3 | INC-2647 | substance_abuse |
| 103 | BEN-2054 | other | citizen | 4 | INC-2653 | mental_health_crisis |

### `v_access_channel_social_service_resource_detail`

This view joins `AccessChannel` to `SocialServiceResource` through `AccessChannelSocialServiceResource`, answering: *which resources are accessible through a given channel?* A row with `channelType = mobile_app`, `resourceName = Adaptive Corridor`, and `supportsMultilingual = true` shows that a multilingual mobile app provides access to a food pantry resource.

**View `v_access_channel_social_service_resource_detail`**

```sql
CREATE VIEW v_access_channel_social_service_resource_detail AS
SELECT a.channelId, a.channelIdentifier, a.channelType, b.id AS resource_id, b.resourceIdentifier AS resource_resourceIdentifier, b.resourceName AS resource_resourceName
FROM AccessChannel a
  JOIN AccessChannelSocialServiceResource j ON j.channelId = a.channelId
  JOIN SocialServiceResource b ON b.id = j.resourceId;
```

| channelId | channelIdentifier | channelType | resource_id | resource_resourceIdentifier | resource_resourceName |
|---|---|---|---|---|---|
| 1000 | CHA-2292 | website | 1 | RES-2673 | Adaptive Corridor |
| 1000 | CHA-2292 | website | 2 | RES-2676 | Primary Series |
| 1001 | CHA-2294 | mobile_app | 2 | RES-2676 | Primary Series |
| 1001 | CHA-2294 | mobile_app | 3 | RES-2679 | Composite Assessment D |
| 1002 | CHA-2296 | interactive_kiosk | 3 | RES-2679 | Composite Assessment D |
| 1002 | CHA-2296 | interactive_kiosk | 4 | RES-2682 | Compact Survey |
| 1003 | CHA-2298 | telephone | 4 | RES-2682 | Compact Survey |
| 1003 | CHA-2298 | telephone | 1 | RES-2673 | Adaptive Corridor |

### `v_access_channel_service_organization`

This view joins `AccessChannel` to `ServiceOrganization` via the `organizationId` FK on `AccessChannel`, answering: *which organization operates a given access channel?* A row with `channelType = website` and `organizationName = Atlantic Richfield` alongside `urlOrEndpoint = https://bugs.launchpad.net/openstack-manuals/+bug/1341342` shows that a local agency operates a website channel.

**View `v_access_channel_service_organization`**

```sql
CREATE VIEW v_access_channel_service_organization AS
SELECT a.channelId, a.channelIdentifier, a.channelType, a.urlOrEndpoint, b.id AS organization_id, b.organizationIdentifier AS organization_organizationIdentifier, b.organizationName AS organization_organizationName
FROM AccessChannel a JOIN ServiceOrganization b ON a.organizationId = b.id;
```

| channelId | channelIdentifier | channelType | urlOrEndpoint | organization_id | organization_organizationIdentifier | organization_organizationName |
|---|---|---|---|---|---|---|
| 1000 | CHA-2292 | website | https://bugs.launchpad.net/openstack-manuals/+bug/1341342 | 1 | LDAP First Name Field | Staples Inc. |
| 1001 | CHA-2294 | mobile_app | https://www.mfsa.com.mt/financial-services-register/ | 2 | Goodyear Tire & Rubber | Oscar Health Inc. |
| 1002 | CHA-2296 | interactive_kiosk | https://grants.nih.gov/grants/guide/pa-files/PAR-18-251.html | 3 | LINK Interchange Network Ltd | Atlantic Richfield |
| 1003 | CHA-2298 | telephone | https://bugs.launchpad.net/trove/+bug/1366175 | 4 | Alliant Energy Corp | Port Loko |

## Synthesis

The schema separates concerns cleanly: `SocialServiceResource`, `ServiceOrganization`, `Hotline`, `Incident`, `Beneficiary`, and `AccessChannel` each capture a distinct concept with its own attribute set, while junction tables (`SocialServiceResourceBeneficiary`, `SocialServiceResourceAccessChannel`, `ServiceOrganizationSocialServiceResource`, `ServiceOrganizationHotline`, `HotlineIncident`, `HotlineSocialServiceResource`, `IncidentBeneficiary`, `BeneficiarySocialServiceResource`, `AccessChannelSocialServiceResource`) model the many-to-many relationships that arise when resources serve multiple people, hotlines log multiple incidents, and channels promote multiple resources. The twelve views (`v_social_service_resource_beneficiary_detail`, `v_social_service_resource_service_organization`, `v_social_service_resource_access_channel_detail`, `v_service_organization_social_service_resource_detail`, `v_service_organization_hotline_detail`, `v_hotline_service_organization`, `v_hotline_incident_detail`, `v_hotline_social_service_resource_detail`, `v_incident_hotline`, `v_incident_beneficiary_detail`, `v_incident_service_organization`, `v_beneficiary_social_service_resource_detail`, `v_beneficiary_hotline`, `v_beneficiary_incident`, `v_access_channel_social_service_resource_detail`, `v_access_channel_service_organization`) each perform a specific join to answer a single analytical question, turning the normalized base tables into readable, domain-aligned facts without requiring the consumer to understand the underlying foreign-key topology.