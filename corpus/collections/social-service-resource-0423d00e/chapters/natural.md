## The Social Services Ecosystem

Social service delivery operates as a network of organizations, resources, communication channels, and the people they serve. At its core, the system tracks how resources reach beneficiaries through hotlines, digital channels, and direct organizational relationships. Each entity in the ecosystem carries specific attributes that determine eligibility, accessibility, and operational constraints. A food pantry operating around the clock differs fundamentally from a confidential emergency shelter with restricted hours, and the data model captures these distinctions through structured records that link organizations to the services they provide, the hotlines through which people discover them, and the channels by which beneficiaries access them.

**Table `SocialServiceResource`**

| id | resourceIdentifier | resourceName | serviceCategory | isConfidential | isFree | operatingHours | organizationId |
|---|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | food_pantry | false | true | 24/7 | 1 |
| 2 | RES-2676 | Primary Series | emergency_shelter | true | false | business_hours | 2 |
| 3 | RES-2679 | Composite Assessment D | childcare | false | true | 24/7 | 3 |
| 4 | RES-2682 | Compact Survey | housing | true | false | business_hours | 4 |

Social service resources form the foundational layer of the delivery network. Each resource carries a unique identifier such as RES-2673 for the Adaptive Corridor food pantry, alongside a service category that determines its function within the ecosystem. Resources are classified into four categories: food_pantry, emergency_shelter, childcare, and housing. Two operational flags—whether a resource is confidential and whether it is free—shape how beneficiaries interact with it. The Adaptive Corridor (RES-2673) operates as a free, non-confidential food pantry with 24/7 availability, while the Primary Series emergency shelter (RES-2676) is confidential but not free, operating only during business hours. Every resource is assigned to an organization through the organizationId field, establishing the ownership relationship that governs accountability and reporting.

**Table `ServiceOrganization`**

| id | organizationIdentifier | organizationName | jurisdiction | isGovernmentAgency | websiteUrl |
|---|---|---|---|---|---|
| 1 | LDAP First Name Field | Staples Inc. | federal | National Beverage Corp. | https://github.com/chiphuyen/lazynlp |
| 2 | Goodyear Tire & Rubber | Oscar Health Inc. | state | Lockheed Martin | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 3 | LINK Interchange Network Ltd | Atlantic Richfield | local | Denver School of Science and Technology Inc. | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 4 | Alliant Energy Corp | Port Loko | community | Denver School of Science and Technology Inc. | https://www.nature.com/articles/nphoton.2014.41 |

Service organizations are the institutional backbone of the system. Four organizations appear in the data, each with a distinct jurisdictional scope—federal, state, local, and community—and a governance classification indicating whether it operates as a government agency. Staples Inc. (organization 1) functions at the federal level, while Oscar Health Inc. (organization 2) operates at the state level under Lockheed Martin governance. Atlantic Richfield (organization 3) and Port Loko (organization 4) serve local and community jurisdictions respectively, both under the Denver School of Science and Technology Inc. governance umbrella. Each organization maintains a website URL and an internal identifier that serves as the foreign key linking it to resources, hotlines, incidents, and access channels.

**Table `Hotline`**

| id | phoneNumber | smsKeyword | hotlineType | isAvailable247 | isConfidential | organizationId |
|---|---|---|---|---|---|---|
| 1000 | PHO-2092 | integrated-sms-16 | mental_health | false | false | 1 |
| 1001 | PHO-2093 | seasonal-sms-17 | substance_abuse | true | true | 2 |
| 1002 | PHO-2094 | regional-sms-18 | human_trafficking | false | false | 3 |
| 1003 | PHO-2095 | legacy-sms-19 | sexual_assault | true | true | 4 |

Hotlines serve as the primary discovery and intake mechanism through which beneficiaries connect with services. Each hotline record contains a phone number identifier, an SMS keyword for text-based contact, and a hotline type that categorizes the crisis or support domain: mental_health, substance_abuse, human_trafficking, and sexual_assault. Availability and confidentiality flags determine operational scope. The hotline PHO-2093 (ID 1001) provides seasonal-sms-17 contact for substance abuse services, operates 24/7, and maintains confidentiality. In contrast, PHO-2092 (ID 1000) handles mental health crises with integrated-sms-16 but is not available around the clock and is not confidential. Every hotline is tied to an organization, creating a direct line of organizational responsibility for crisis response.

**Table `Incident`**

| id | incidentIdentifier | incidentType | reportedDateTime | isConfirmed | severityLevel | hotlineId | organizationId |
|---|---|---|---|---|---|---|---|
| 1 | INC-2635 | human_trafficking | 2024-11-12T22:18:00 | true | low | 1000 | 1 |
| 2 | INC-2641 | sexual_assault | 2025-04-23T05:35:00 | false | medium | 1001 | 2 |
| 3 | INC-2647 | substance_abuse | 2022-09-07T12:52:00 | true | high | 1002 | 3 |
| 4 | INC-2653 | mental_health_crisis | 2023-02-18T19:09:00 | false | critical | 1003 | 4 |

Incidents represent documented events that trigger service interventions. Each incident carries a unique identifier such as INC-2635, a type classification, a reported date-time stamp, a confirmation status, and a severity level ranging from low to critical. The incident INC-2635 was reported on 2024-11-12 at 22:18 as a human_trafficking case with low severity and confirmed status, linked to hotline 1000 and organization 1. By contrast, INC-2653 (ID 4) represents a critical-severity mental_health_crisis reported on 2023-02-18 that remains unconfirmed, associated with hotline 1003 and organization 4. The hotlineId field creates a direct bridge between the incident and the intake channel through which it was reported.

**Table `Beneficiary`**

| id | beneficiaryIdentifier | primaryLanguage | immigrationStatus | needsAssistance | requiresInterpreter | hotlineId | incidentId |
|---|---|---|---|---|---|---|---|
| 100 | BEN-2039 | english | refugee | false | true | 1000 | 1 |
| 101 | BEN-2044 | spanish | asylum_seeker | true | false | 1001 | 2 |
| 102 | BEN-2049 | arabic | immigrant | false | true | 1002 | 3 |
| 103 | BEN-2054 | other | citizen | true | false | 1003 | 4 |

Beneficiaries are the individuals receiving services, each identified by a code such as BEN-2039 and characterized by demographic and operational attributes. The primary_language field captures the beneficiary's preferred language—english, spanish, arabic, or other—while immigration_status records their legal standing as refugee, asylum_seeker, immigrant, or citizen. Two boolean flags, needs_assistance and requires_interpreter, indicate service requirements. Beneficiary BEN-2039 is an English-speaking refugee who does not currently need assistance but requires an interpreter. Beneficiary BEN-2044, a Spanish-speaking asylum seeker, does need assistance but does not require interpreter services. Each beneficiary is linked to a specific hotline and incident, anchoring their service journey to a documented event.

**Table `AccessChannel`**

| channelId | channelIdentifier | channelType | urlOrEndpoint | supportsMultilingual | isFree | organizationId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1000 | CHA-2292 | website | https://bugs.launchpad.net/openstack-manuals/+bug/1341342 | false | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | CHA-2294 | mobile_app | https://www.mfsa.com.mt/financial-services-register/ | true | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | CHA-2296 | interactive_kiosk | https://grants.nih.gov/grants/guide/pa-files/PAR-18-251.html | false | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | CHA-2298 | telephone | https://bugs.launchpad.net/trove/+bug/1366175 | true | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Access channels represent the digital and physical interfaces through which beneficiaries engage with services. Four channel types exist: website, mobile_app, interactive_kiosk, and telephone. Each channel has a URL or endpoint, a multilingual support flag, a free-access flag, and creation timestamps. Channel CHA-2292 (ID 1000) is a website hosted at a Launchpad bug tracker URL, does not support multilingual content, and is free. Channel CHA-2294 (ID 1001) is a mobile application that supports multilingual access but is not free, hosted on a Maltese financial services domain. Every access channel is assigned to an organization, establishing which entity maintains and operates each interface.

The relational structure extends beyond these core entities through junction tables that capture many-to-many relationships and cross-domain associations.

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

These junction tables enable the system to model complex relationships that cannot be captured through simple foreign keys. A single social service resource may serve multiple beneficiaries and be accessible through multiple channels simultaneously. A hotline may be associated with multiple incidents and linked to multiple resources. These many-to-many associations are essential for understanding the full scope of service delivery, where a single food pantry might serve hundreds of beneficiaries through both a website and a mobile app, all coordinated by a single organization.

The view layer transforms these raw relationships into actionable detail records, each answering a specific operational question about the ecosystem.

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

This view answers the question of which beneficiaries are connected to which social service resources, joining the resource and beneficiary tables through their relationship records. A row in this view might show that beneficiary BEN-2039 is linked to the Adaptive Corridor food pantry (RES-2673), revealing the direct service connection between an individual and a resource. The view surfaces the beneficiary's language, immigration status, and interpreter needs alongside the resource's category, confidentiality setting, and operating hours, enabling case managers to assess whether a resource's characteristics align with a beneficiary's requirements.

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

This view maps social service resources to their parent organizations, answering the question of which organization is responsible for each resource. A row might show that the Adaptive Corridor (RES-2673, food_pantry) is managed by organization 1 (Staples Inc., federal jurisdiction). This relationship is critical for accountability, budgeting, and reporting, as it establishes the organizational chain of custody for every resource in the system.

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

This view reveals how social service resources are made accessible to the public through various channels. A row might connect the Adaptive Corridor food pantry (RES-2673) to a website channel (CHA-2292), showing that beneficiaries can discover and engage with this resource through a free, non-multilingual web interface. The view combines resource attributes with channel characteristics, enabling administrators to evaluate whether the available access methods adequately serve the resource's target population.

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

This view inverts the perspective, presenting resources organized by their parent organization. A row might show that organization 1 (Staples Inc.) manages the Adaptive Corridor food pantry (RES-2673), providing a consolidated view of an organization's resource portfolio. This perspective supports organizational planning, allowing administrators to see the full range of services their organization provides across categories, confidentiality levels, and operating hours.

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

This view connects hotlines to their managing organizations, answering which organization operates each crisis line. A row might show that hotline PHO-2093 (ID 1001, substance_abuse, available 24/7, confidential) is operated by organization 2 (Oscar Health Inc., state jurisdiction). This view is essential for understanding organizational capacity for crisis response and for ensuring that hotline operations align with organizational mission and jurisdictional authority.

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

This view presents hotlines from the organization's perspective, showing which hotlines each organization manages. A row might indicate that organization 1 (Staples Inc.) operates hotline PHO-2092 (ID 1000, mental_health, not 24/7, not confidential). This organizational view supports resource allocation decisions, staffing requirements, and performance monitoring across an organization's hotline portfolio.

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

This view links incidents to their originating hotlines, answering which hotline reported each incident. A row might show that incident INC-2635 (human_trafficking, low severity, confirmed) was reported through hotline PHO-2092 (ID 1000, mental_health). This connection is vital for tracking intake effectiveness, measuring hotline performance, and understanding which crisis lines generate the most referrals and of what types.

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

This view reveals the relationship between hotlines and the social service resources they can refer to. A row might connect hotline PHO-2093 (ID 1001, substance_abuse) to a specific resource, showing the downstream service pathway that a hotline operator can recommend to a caller. This view supports training, referral protocol development, and the mapping of crisis response to long-term service provision.

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

This view presents incidents organized by their originating hotline, answering which incidents each hotline has processed. A row might show that hotline PHO-2092 (ID 1000) is associated with incident INC-2635 (human_trafficking, low severity). This perspective enables hotline performance analysis, workload distribution assessment, and the identification of hotlines that handle particularly severe or complex cases.

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

This view connects incidents to the beneficiaries involved, answering which beneficiary is associated with each documented incident. A row might show that incident INC-2635 (human_trafficking, reported 2024-11-12) is linked to beneficiary BEN-2039 (English-speaking refugee, requires interpreter). This view is critical for case management, enabling service coordinators to see the full context of an incident including the beneficiary's language needs, immigration status, and assistance requirements.

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

This view maps incidents to their responsible organizations, answering which organization is accountable for each documented incident. A row might show that incident INC-2635 (human_trafficking) is managed by organization 1 (Staples Inc., federal jurisdiction). This relationship supports organizational reporting, compliance tracking, and the assignment of follow-up actions to the appropriate institutional entity.

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

This view presents the service connections from the beneficiary's perspective, showing which resources each beneficiary is linked to. A row might indicate that beneficiary BEN-2039 (English-speaking refugee) is connected to the Adaptive Corridor food pantry (RES-2673, food_pantry, free, 24/7). This view supports personalized service planning, allowing coordinators to see the full set of resources available to a specific individual and assess whether those resources meet the beneficiary's language, accessibility, and assistance needs.

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

This view connects beneficiaries to the hotlines they have used, answering which hotline each beneficiary contacted. A row might show that beneficiary BEN-2039 contacted hotline PHO-2092 (ID 1000, mental_health). This view is essential for understanding the service journey, tracking which hotlines serve which populations, and evaluating whether beneficiaries are being directed to the most appropriate crisis lines for their needs.

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

This view links beneficiaries to their associated incidents, answering which incident each beneficiary is connected to. A row might show that beneficiary BEN-2039 is associated with incident INC-2635 (human_trafficking, low severity, confirmed). This view provides a consolidated record of a beneficiary's documented encounters with the system, supporting longitudinal case management and the tracking of service outcomes over time.

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

This view reveals how access channels connect to social service resources, answering which resources are available through each channel. A row might show that website channel CHA-2292 (free, non-multilingual) provides access to a specific resource. This view supports digital strategy planning, enabling administrators to evaluate whether their channels adequately cover the resources they need to promote and whether channel features like multilingual support match the needs of the resources' target populations.

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

This view maps access channels to their managing organizations, answering which organization operates each channel. A row might show that channel CHA-2292 (website) is operated by organization 1 (Staples Inc., federal jurisdiction). This view supports IT governance, budget allocation for digital infrastructure, and the alignment of channel capabilities with organizational mission and technical capacity.

The social services data model captures a complex, multi-layered ecosystem where organizations provide resources, hotlines serve as intake points, incidents document service triggers, beneficiaries receive care, and access channels enable discovery and engagement. The relationships between these entities are not hierarchical but networked: a single resource may be managed by one organization, accessible through multiple channels, and serve many beneficiaries who arrived via different hotlines and incidents. The junction tables ensure that these many-to-many relationships are preserved without data duplication, while the detail views provide the joined perspectives that practitioners need to answer operational questions about accountability, accessibility, and service delivery effectiveness. Understanding this structure allows administrators to trace a beneficiary's journey from initial hotline contact through incident documentation to resource assignment, while simultaneously understanding which organization is responsible, which channel facilitated access, and what service category the resource belongs to.