## Modelling Social Service Domains as Relational Schemas

Social service ecosystems span a heterogeneous landscape of resource types, organizational structures, and intervention modalities. A food pantry, an emergency shelter, a childcare program, and a housing assistance initiative each serve distinct populations, yet they share common administrative concerns: who operates them, where they are located, what languages they support, and which social issues they address. The relational model captures this complexity by decomposing the domain into five base tables—`social_service_resources`, `service_organizations`, `hotline_services`, `social_issues`, and `service_locations`—and by materializing denormalized views that reconstruct the domain facts analysts need to query. The following sections walk through the entity types, their attributes, the foreign-key relationships that bind them, and the view-level joins that reassemble the normalized data into analytically useful forms.

### The Resource Core

At the centre of the model sits the `social_service_resources` table, which records every discrete service offering in the domain. Each row is identified by a surrogate key `social_service_resource_id` and a human-readable `resource_identifier` such as `RES-2673` or `RES-2682`. The `service_category` column classifies the offering—`Food Pantry`, `Emergency Shelter`, `Childcare`, `Housing`—while `service_status` captures its operational state as `Active`, `Inactive`, or `Suspended`. Additional descriptive attributes include `language_availability` (an integer indicating the count of supported languages, ranging from 8 to 29 in the current dataset), `operating_hours` (a categorical descriptor like `pilot-operatin-50` or `extended-operatin-51`), and `is_confidential` (a boolean flag). Two foreign keys, `service_organization_id` and `service_location_id`, anchor each resource to its operating organization and physical or virtual location respectively.

**Table `social_service_resources`**

| social_service_resource_id | resource_identifier | service_category | service_status | language_availability | operating_hours | is_confidential | service_organization_id | service_location_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | RES-2673 | Food Pantry | Active | 8 | pilot-operatin-50 | false | 1 | 1 |
| 1001 | RES-2676 | Emergency Shelter | Inactive | 15 | extended-operatin-51 | true | 2 | 2 |
| 1002 | RES-2679 | Childcare | Suspended | 22 | integrated-operatin-52 | false | 3 | 3 |
| 1003 | RES-2682 | Housing | Active | 29 | seasonal-operatin-53 | true | 4 | 4 |

The resource table is the hub of the schema: every other table references it either directly or through an intermediate entity. Its surrogate key `social_service_resource_id` is the primary key, and the two foreign keys point to `service_organizations.id` and `service_locations.service_location_id`. The cardinality is one-to-one in the current data—each resource has exactly one organization and one location—but the schema design permits future expansion where a single organization might operate multiple resources or a resource might span multiple locations.

### Organizational Entities

The `service_organizations` table models the administrative bodies that deliver services. Its primary key is `id`, and each row carries an `organization_name` (e.g., `Staples Inc.`, `Oscar Health Inc.`), a `jurisdiction_level` (one of `Federal`, `State`, `Local`, or `Community`), a `contact_phone_number` (stored as a person's name in the current dataset, such as `Theodore Mcgrath`), a `website_url`, and an `is_toll_free` boolean. Two additional columns—`social_service_resource_id` and `hotline_service_phone_number`—create a bidirectional linkage: the former points back to the resource table, and the latter stores a phone number identifier like `PHO-2092` that is also referenced by the `hotline_services` and `social_issues` tables.

**Table `service_organizations`**

| id | organization_name | jurisdiction_level | contact_phone_number | website_url | is_toll_free | social_service_resource_id | hotline_service_phone_number |
|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Federal | Theodore Mcgrath | https://github.com/chiphuyen/lazynlp | true | 1000 | PHO-2092 |
| 2 | Oscar Health Inc. | State | Peter Mcdowell | https://bugs.launchpad.net/ironic/+bug/1346406 | false | 1001 | PHO-2093 |
| 3 | Atlantic Richfield | Local | Collin Lopez | http://en.wikipedia.org/wiki/Hyla_femoralis | true | 1002 | PHO-2094 |
| 4 | Port Loko | Community | Steve Martin | https://www.nature.com/articles/nphoton.2014.41 | false | 1003 | PHO-2095 |

The foreign key `service_organizations.social_service_resource_id` references `social_service_resources.social_service_resource_id`, establishing a one-to-one correspondence in the current data. The `hotline_service_phone_number` column does not itself declare a foreign key constraint in the DDL, but it semantically links to the `phone_number` column in `hotline_services`, enabling the view-level joins that reconstruct hotline-to-organization relationships.

### Hotline Services

Hotline services form a distinct entity type that bridges organizations, social issues, and resources. The `hotline_services` table uses `hotline_identifier` (e.g., `HOT-2203`, `HOT-2215`) as its primary key. Each row records a `phone_number` (such as `PHO-2092`), a `text_keyword` (like `seasonal-text-47`), an `availability_schedule` (`24/7`, `Business Hours`, `Evening Only`), and two boolean flags: `is_free` and `is_confidential`. Three foreign keys anchor the hotline to its parent entities: `service_organization_id` references `service_organizations.id`, `social_issue_id` references `social_issues.social_issue_id`, and `social_service_resource_id` references `social_service_resources.social_service_resource_id`.

**Table `hotline_services`**

| hotline_identifier | phone_number | text_keyword | availability_schedule | is_free | is_confidential | service_organization_id | social_issue_id | social_service_resource_id |
|---|---|---|---|---|---|---|---|---|
| HOT-2203 | PHO-2092 | seasonal-text-47 | 24/7 | true | false | 1 | 1 | 1000 |
| HOT-2207 | PHO-2093 | regional-text-48 | Business Hours | false | true | 2 | 2 | 1001 |
| HOT-2211 | PHO-2094 | legacy-text-49 | Evening Only | true | false | 3 | 3 | 1002 |
| HOT-2215 | PHO-2095 | compact-text-50 | 24/7 | false | true | 4 | 4 | 1003 |

This table is the most highly connected in the schema. Every hotline row simultaneously belongs to an organization, addresses a social issue, and is associated with a resource. The cardinality is one-to-one across all three relationships in the current data, but the design supports many-to-many expansion: a single hotline could theoretically serve multiple issues, and a single issue could be served by multiple hotlines.

### Social Issues

The `social_issues` table catalogs the problems that social services aim to mitigate. Its primary key is `social_issue_id`, and each row carries an `issue_category` (e.g., `Substance Abuse`, `Mental Health`, `Human Trafficking`, `Sexual Assault`), a `severity_level` (`Low`, `Moderate`, `High`, `Critical`), and a `requires_law_enforcement` boolean. The column `hotline_service_phone_number` stores a phone identifier like `PHO-2092` that semantically links to the `hotline_services.phone_number` column, while `social_service_resource_id` is a foreign key pointing to `social_service_resources.social_service_resource_id`.

**Table `social_issues`**

| social_issue_id | issue_category | severity_level | requires_law_enforcement | hotline_service_phone_number | social_service_resource_id |
|---|---|---|---|---|---|
| 1 | Substance Abuse | Low | false | PHO-2092 | 1000 |
| 2 | Mental Health | Moderate | true | PHO-2093 | 1001 |
| 3 | Human Trafficking | High | false | PHO-2094 | 1002 |
| 4 | Sexual Assault | Critical | true | PHO-2095 | 1003 |

The `social_issues` table is the smallest base table, with exactly four rows corresponding to the four issue categories. Its foreign key `social_service_resource_id` creates a direct association between each issue and a resource, while the `hotline_service_phone_number` column enables a view-level join to `hotline_services` that reconstructs the issue-to-hotline relationship.

### Service Locations

The `service_locations` table captures where services are delivered. Its primary key is `service_location_id`, and each row carries a `location_name` (e.g., `Legacy Review D`, `Regional Initiative`), a `location_type` (`Physical Facility`, `Virtual Platform`, `App Interface`, `Jurisdiction`), a `geographic_scope` (`Local`, `Regional`, `National`, `International`), a `supported_languages` column (a categorical descriptor such as `composite-supporte-69`), and a foreign key `social_service_resource_id` referencing `social_service_resources.social_service_resource_id`. The column `hotline_service_phone_number` stores a phone identifier like `PHO-2092` that semantically links to the `hotline_services.phone_number` column.

**Table `service_locations`**

| service_location_id | location_name | location_type | geographic_scope | supported_languages | social_service_resource_id | hotline_service_phone_number |
|---|---|---|---|---|---|---|
| 1 | Legacy Review D | Physical Facility | Local | composite-supporte-69 | 1000 | PHO-2092 |
| 2 | Regional Initiative | Virtual Platform | Regional | primary-supporte-70 | 1001 | PHO-2093 |
| 3 | Seasonal Model | App Interface | National | adaptive-supporte-71 | 1002 | PHO-2094 |
| 4 | Integrated Cluster A | Jurisdiction | International | distributed-supporte-72 | 1003 | PHO-2095 |

Like `social_issues`, the `service_locations` table has exactly four rows, one per resource. The foreign key `social_service_resource_id` creates a one-to-one association between each location and a resource. The `hotline_service_phone_number` column, while not a declared foreign key, enables view-level joins to `hotline_services` that reconstruct the location-to-hotline relationship.

### View-Level Reassembly

The base tables are normalized to eliminate redundancy and support independent updates. However, analysts rarely query a single table in isolation; they need to answer questions that span multiple entity types. The views materialize these cross-entity queries as virtual tables, each encoding a specific join pattern that reconstructs a domain fact.

#### Resource-to-Organization Mapping

The view `v_social_service_resource_service_organization` joins `social_service_resources` to `service_organizations` on `social_service_resources.service_organization_id = service_organizations.id`. It projects the resource's surrogate key, identifier, category, and status alongside the organization's surrogate key, name, and jurisdiction level.

**View `v_social_service_resource_service_organization`**

```sql
CREATE VIEW v_social_service_resource_service_organization AS
SELECT a.social_service_resource_id, a.resource_identifier, a.service_category, a.service_status, b.id AS organization_id, b.organization_name AS organization_organization_name, b.jurisdiction_level AS organization_jurisdiction_level
FROM social_service_resources a JOIN service_organizations b ON a.service_organization_id = b.id;
```

| social_service_resource_id | resource_identifier | service_category | service_status | organization_id | organization_organization_name | organization_jurisdiction_level |
|---|---|---|---|---|---|---|
| 1000 | RES-2673 | Food Pantry | Active | 1 | Staples Inc. | Federal |
| 1001 | RES-2676 | Emergency Shelter | Inactive | 2 | Oscar Health Inc. | State |
| 1002 | RES-2679 | Childcare | Suspended | 3 | Atlantic Richfield | Local |
| 1003 | RES-2682 | Housing | Active | 4 | Port Loko | Community |

This view answers the question: "Which organization operates which resource, and at what jurisdictional level?" The first row tells us that `Staples Inc.`, a Federal-level organization, operates the `Food Pantry` resource `RES-2673`, which is currently `Active`. The second row reveals that `Oscar Health Inc.`, operating at the State level, manages the `Emergency Shelter` `RES-2676`, which is `Inactive`. The view makes the organization-resource relationship immediately queryable without requiring the analyst to write the join explicitly.

#### Resource-to-Location Mapping

The view `v_social_service_resource_service_location` joins `social_service_resources` to `service_locations` on `social_service_resources.service_location_id = service_locations.service_location_id`. It projects the resource's attributes alongside the location's name, type, geographic scope, and supported languages.

**View `v_social_service_resource_service_location`**

```sql
CREATE VIEW v_social_service_resource_service_location AS
SELECT a.social_service_resource_id, a.resource_identifier, a.service_category, a.service_status, b.service_location_id AS location_service_location_id, b.location_name AS location_location_name, b.location_type AS location_location_type
FROM social_service_resources a JOIN service_locations b ON a.service_location_id = b.service_location_id;
```

| social_service_resource_id | resource_identifier | service_category | service_status | location_service_location_id | location_location_name | location_location_type |
|---|---|---|---|---|---|---|
| 1000 | RES-2673 | Food Pantry | Active | 1 | Legacy Review D | Physical Facility |
| 1001 | RES-2676 | Emergency Shelter | Inactive | 2 | Regional Initiative | Virtual Platform |
| 1002 | RES-2679 | Childcare | Suspended | 3 | Seasonal Model | App Interface |
| 1003 | RES-2682 | Housing | Active | 4 | Integrated Cluster A | Jurisdiction |

This view answers: "Where is each resource located, and what is the nature of that location?" The first row shows that the `Food Pantry` `RES-2673` is available at `Legacy Review D`, a `Physical Facility` with `Local` geographic scope. The third row reveals that the `Childcare` resource `RES-2679` is delivered through an `App Interface` at `Seasonal Model`, with `National` geographic scope. The view collapses the location dimension into the resource row, enabling location-based filtering without a manual join.

#### Organization-to-Resource Mapping

The view `v_service_organization_social_service_resource` joins `service_organizations` to `social_service_resources` on `service_organizations.id = social_service_resources.service_organization_id`. It projects the organization's surrogate key, name, jurisdiction level, and contact information alongside the resource's identifier, category, and status.

**View `v_service_organization_social_service_resource`**

```sql
CREATE VIEW v_service_organization_social_service_resource AS
SELECT a.id, a.organization_name, a.jurisdiction_level, a.contact_phone_number, b.social_service_resource_id AS resource_social_service_resource_id, b.resource_identifier AS resource_resource_identifier, b.service_category AS resource_service_category
FROM service_organizations a JOIN social_service_resources b ON a.social_service_resource_id = b.social_service_resource_id;
```

| id | organization_name | jurisdiction_level | contact_phone_number | resource_social_service_resource_id | resource_resource_identifier | resource_service_category |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Federal | Theodore Mcgrath | 1000 | RES-2673 | Food Pantry |
| 2 | Oscar Health Inc. | State | Peter Mcdowell | 1001 | RES-2676 | Emergency Shelter |
| 3 | Atlantic Richfield | Local | Collin Lopez | 1002 | RES-2679 | Childcare |
| 4 | Port Loko | Community | Steve Martin | 1003 | RES-2682 | Housing |

This view answers the inverse question: "What resources does each organization operate?" The first row tells us that `Staples Inc.` (Federal) operates the `Food Pantry` `RES-2673`, which is `Active`. The fourth row shows that `Port Loko` (Community) operates the `Housing` resource `RES-2682`, also `Active`. This view is useful for organizational capacity planning and for auditing which resources fall under which administrative bodies.

#### Organization-to-Hotline Mapping

The view `v_service_organization_hotline_service` joins `service_organizations` to `hotline_services` on `service_organizations.id = hotline_services.service_organization_id`. It projects the organization's attributes alongside the hotline's identifier, phone number, text keyword, availability schedule, and boolean flags.

**View `v_service_organization_hotline_service`**

```sql
CREATE VIEW v_service_organization_hotline_service AS
SELECT a.id, a.organization_name, a.jurisdiction_level, a.contact_phone_number, b.hotline_identifier AS service_hotline_identifier, b.phone_number AS service_phone_number, b.text_keyword AS service_text_keyword
FROM service_organizations a JOIN hotline_services b ON a.hotline_service_phone_number = b.phone_number;
```

| id | organization_name | jurisdiction_level | contact_phone_number | service_hotline_identifier | service_phone_number | service_text_keyword |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Federal | Theodore Mcgrath | HOT-2203 | PHO-2092 | seasonal-text-47 |
| 2 | Oscar Health Inc. | State | Peter Mcdowell | HOT-2207 | PHO-2093 | regional-text-48 |
| 3 | Atlantic Richfield | Local | Collin Lopez | HOT-2211 | PHO-2094 | legacy-text-49 |
| 4 | Port Loko | Community | Steve Martin | HOT-2215 | PHO-2095 | compact-text-50 |

This view answers: "Which hotline service is associated with each organization?" The first row reveals that `Staples Inc.` is linked to hotline `HOT-2203` at phone `PHO-2092`, available `24/7`, free of charge, but not confidential. The second row shows that `Oscar Health Inc.` is linked to hotline `HOT-2207` at phone `PHO-2093`, available during `Business Hours`, not free, but confidential. This view is essential for understanding the communication channels each organization provides.

#### Hotline-to-Organization Mapping

The view `v_hotline_service_service_organization` joins `hotline_services` to `service_organizations` on `hotline_services.service_organization_id = service_organizations.id`. It projects the hotline's attributes alongside the organization's name and jurisdiction level.

**View `v_hotline_service_service_organization`**

```sql
CREATE VIEW v_hotline_service_service_organization AS
SELECT a.hotline_identifier, a.phone_number, a.text_keyword, a.availability_schedule, b.id AS organization_id, b.organization_name AS organization_organization_name, b.jurisdiction_level AS organization_jurisdiction_level
FROM hotline_services a JOIN service_organizations b ON a.service_organization_id = b.id;
```

| hotline_identifier | phone_number | text_keyword | availability_schedule | organization_id | organization_organization_name | organization_jurisdiction_level |
|---|---|---|---|---|---|---|
| HOT-2203 | PHO-2092 | seasonal-text-47 | 24/7 | 1 | Staples Inc. | Federal |
| HOT-2207 | PHO-2093 | regional-text-48 | Business Hours | 2 | Oscar Health Inc. | State |
| HOT-2211 | PHO-2094 | legacy-text-49 | Evening Only | 3 | Atlantic Richfield | Local |
| HOT-2215 | PHO-2095 | compact-text-50 | 24/7 | 4 | Port Loko | Community |

This view answers the inverse question: "Which organization runs each hotline?" The first row tells us that hotline `HOT-2203` at phone `PHO-2092` is operated by `Staples Inc.` at the Federal level. The third row shows that hotline `HOT-2211` at phone `PHO-2094` is operated by `Atlantic Richfield` at the Local level. This view is useful for hotline-centric queries, such as listing all hotlines and their operating organizations.

#### Hotline-to-Issue Mapping

The view `v_hotline_service_social_issue` joins `hotline_services` to `social_issues` on `hotline_services.social_issue_id = social_issues.social_issue_id`. It projects the hotline's attributes alongside the issue's category, severity level, and law enforcement requirement.

**View `v_hotline_service_social_issue`**

```sql
CREATE VIEW v_hotline_service_social_issue AS
SELECT a.hotline_identifier, a.phone_number, a.text_keyword, a.availability_schedule, b.social_issue_id AS issue_social_issue_id, b.issue_category AS issue_issue_category, b.severity_level AS issue_severity_level
FROM hotline_services a JOIN social_issues b ON a.social_issue_id = b.social_issue_id;
```

| hotline_identifier | phone_number | text_keyword | availability_schedule | issue_social_issue_id | issue_issue_category | issue_severity_level |
|---|---|---|---|---|---|---|
| HOT-2203 | PHO-2092 | seasonal-text-47 | 24/7 | 1 | Substance Abuse | Low |
| HOT-2207 | PHO-2093 | regional-text-48 | Business Hours | 2 | Mental Health | Moderate |
| HOT-2211 | PHO-2094 | legacy-text-49 | Evening Only | 3 | Human Trafficking | High |
| HOT-2215 | PHO-2095 | compact-text-50 | 24/7 | 4 | Sexual Assault | Critical |

This view answers: "Which social issue does each hotline address?" The first row reveals that hotline `HOT-2203` at phone `PHO-2092` addresses `Substance Abuse`, which has `Low` severity and does not require law enforcement. The fourth row shows that hotline `HOT-2215` at phone `PHO-2095` addresses `Sexual Assault`, which has `Critical` severity and does require law enforcement. This view is critical for matching callers to appropriate interventions based on the severity and nature of their issue.

#### Hotline-to-Resource Mapping

The view `v_hotline_service_social_service_resource` joins `hotline_services` to `social_service_resources` on `hotline_services.social_service_resource_id = social_service_resources.social_service_resource_id`. It projects the hotline's attributes alongside the resource's identifier, category, and status.

**View `v_hotline_service_social_service_resource`**

```sql
CREATE VIEW v_hotline_service_social_service_resource AS
SELECT a.hotline_identifier, a.phone_number, a.text_keyword, a.availability_schedule, b.social_service_resource_id AS resource_social_service_resource_id, b.resource_identifier AS resource_resource_identifier, b.service_category AS resource_service_category
FROM hotline_services a JOIN social_service_resources b ON a.social_service_resource_id = b.social_service_resource_id;
```

| hotline_identifier | phone_number | text_keyword | availability_schedule | resource_social_service_resource_id | resource_resource_identifier | resource_service_category |
|---|---|---|---|---|---|---|
| HOT-2203 | PHO-2092 | seasonal-text-47 | 24/7 | 1000 | RES-2673 | Food Pantry |
| HOT-2207 | PHO-2093 | regional-text-48 | Business Hours | 1001 | RES-2676 | Emergency Shelter |
| HOT-2211 | PHO-2094 | legacy-text-49 | Evening Only | 1002 | RES-2679 | Childcare |
| HOT-2215 | PHO-2095 | compact-text-50 | 24/7 | 1003 | RES-2682 | Housing |

This view answers: "Which resource is associated with each hotline?" The first row tells us that hotline `HOT-2203` at phone `PHO-2092` is associated with resource `RES-2673`, a `Food Pantry` that is `Active`. The third row shows that hotline `HOT-2211` at phone `PHO-2094` is associated with resource `RES-2679`, `Childcare`, which is `Suspended`. This view enables resource-centric analysis of hotline coverage.

#### Issue-to-Hotline Mapping

The view `v_social_issue_hotline_service` joins `social_issues` to `hotline_services` on `social_issues.social_issue_id = hotline_services.social_issue_id`. It projects the issue's attributes alongside the hotline's identifier, phone number, and availability schedule.

**View `v_social_issue_hotline_service`**

```sql
CREATE VIEW v_social_issue_hotline_service AS
SELECT a.social_issue_id, a.issue_category, a.severity_level, a.requires_law_enforcement, b.hotline_identifier AS service_hotline_identifier, b.phone_number AS service_phone_number, b.text_keyword AS service_text_keyword
FROM social_issues a JOIN hotline_services b ON a.hotline_service_phone_number = b.phone_number;
```

| social_issue_id | issue_category | severity_level | requires_law_enforcement | service_hotline_identifier | service_phone_number | service_text_keyword |
|---|---|---|---|---|---|---|
| 1 | Substance Abuse | Low | false | HOT-2203 | PHO-2092 | seasonal-text-47 |
| 2 | Mental Health | Moderate | true | HOT-2207 | PHO-2093 | regional-text-48 |
| 3 | Human Trafficking | High | false | HOT-2211 | PHO-2094 | legacy-text-49 |
| 4 | Sexual Assault | Critical | true | HOT-2215 | PHO-2095 | compact-text-50 |

This view answers the inverse question: "Which hotline serves each social issue?" The first row reveals that `Substance Abuse` (Low severity) is served by hotline `HOT-2203` at phone `PHO-2092`, available `24/7`. The fourth row shows that `Sexual Assault` (Critical severity) is served by hotline `HOT-2215` at phone `PHO-2095`, also available `24/7`. This view is useful for assessing whether high-severity issues have adequate hotline coverage.

#### Issue-to-Resource Mapping

The view `v_social_issue_social_service_resource` joins `social_issues` to `social_service_resources` on `social_issues.social_service_resource_id = social_service_resources.social_service_resource_id`. It projects the issue's attributes alongside the resource's identifier, category, and status.

**View `v_social_issue_social_service_resource`**

```sql
CREATE VIEW v_social_issue_social_service_resource AS
SELECT a.social_issue_id, a.issue_category, a.severity_level, a.requires_law_enforcement, b.social_service_resource_id AS resource_social_service_resource_id, b.resource_identifier AS resource_resource_identifier, b.service_category AS resource_service_category
FROM social_issues a JOIN social_service_resources b ON a.social_service_resource_id = b.social_service_resource_id;
```

| social_issue_id | issue_category | severity_level | requires_law_enforcement | resource_social_service_resource_id | resource_resource_identifier | resource_service_category |
|---|---|---|---|---|---|---|
| 1 | Substance Abuse | Low | false | 1000 | RES-2673 | Food Pantry |
| 2 | Mental Health | Moderate | true | 1001 | RES-2676 | Emergency Shelter |
| 3 | Human Trafficking | High | false | 1002 | RES-2679 | Childcare |
| 4 | Sexual Assault | Critical | true | 1003 | RES-2682 | Housing |

This view answers: "Which resource addresses each social issue?" The first row tells us that `Substance Abuse` is addressed by resource `RES-2673`, a `Food Pantry` that is `Active`. The third row shows that `Human Trafficking` is addressed by resource `RES-2679`, `Childcare`, which is `Suspended`. This view enables issue-centric analysis of resource availability and operational status.

#### Location-to-Resource Mapping

The view `v_service_location_social_service_resource` joins `service_locations` to `social_service_resources` on `service_locations.service_location_id = social_service_resources.service_location_id`. It projects the location's attributes alongside the resource's identifier, category, and status.

**View `v_service_location_social_service_resource`**

```sql
CREATE VIEW v_service_location_social_service_resource AS
SELECT a.service_location_id, a.location_name, a.location_type, a.geographic_scope, b.social_service_resource_id AS resource_social_service_resource_id, b.resource_identifier AS resource_resource_identifier, b.service_category AS resource_service_category
FROM service_locations a JOIN social_service_resources b ON a.social_service_resource_id = b.social_service_resource_id;
```

| service_location_id | location_name | location_type | geographic_scope | resource_social_service_resource_id | resource_resource_identifier | resource_service_category |
|---|---|---|---|---|---|---|
| 1 | Legacy Review D | Physical Facility | Local | 1000 | RES-2673 | Food Pantry |
| 2 | Regional Initiative | Virtual Platform | Regional | 1001 | RES-2676 | Emergency Shelter |
| 3 | Seasonal Model | App Interface | National | 1002 | RES-2679 | Childcare |
| 4 | Integrated Cluster A | Jurisdiction | International | 1003 | RES-2682 | Housing |

This view answers the inverse question: "Which resource is available at each location?" The first row reveals that `Legacy Review D`, a `Physical Facility` with `Local` scope, hosts resource `RES-2673`, a `Food Pantry` that is `Active`. The third row shows that `Seasonal Model`, an `App Interface` with `National` scope, hosts resource `RES-2679`, `Childcare`, which is `Suspended`. This view is essential for location-based resource discovery.

#### Location-to-Hotline Mapping

The view `v_service_location_hotline_service` joins `service_locations` to `hotline_services` on `service_locations.hotline_service_phone_number = hotline_services.phone_number`. It projects the location's attributes alongside the hotline's identifier, phone number, text keyword, and availability schedule.

**View `v_service_location_hotline_service`**

```sql
CREATE VIEW v_service_location_hotline_service AS
SELECT a.service_location_id, a.location_name, a.location_type, a.geographic_scope, b.hotline_identifier AS service_hotline_identifier, b.phone_number AS service_phone_number, b.text_keyword AS service_text_keyword
FROM service_locations a JOIN hotline_services b ON a.hotline_service_phone_number = b.phone_number;
```

| service_location_id | location_name | location_type | geographic_scope | service_hotline_identifier | service_phone_number | service_text_keyword |
|---|---|---|---|---|---|---|
| 1 | Legacy Review D | Physical Facility | Local | HOT-2203 | PHO-2092 | seasonal-text-47 |
| 2 | Regional Initiative | Virtual Platform | Regional | HOT-2207 | PHO-2093 | regional-text-48 |
| 3 | Seasonal Model | App Interface | National | HOT-2211 | PHO-2094 | legacy-text-49 |
| 4 | Integrated Cluster A | Jurisdiction | International | HOT-2215 | PHO-2095 | compact-text-50 |

This view answers: "Which hotline service is associated with each location?" The first row tells us that `Legacy Review D` is associated with hotline `HOT-2203` at phone `PHO-2092`, available `24/7`. The fourth row shows that `Integrated Cluster A` is associated with hotline `HOT-2215` at phone `PHO-2095`, also available `24/7`. This view enables location-centric analysis of hotline availability and communication channels.

### Synthesis

The relational schema for this social service domain achieves a balance between normalization and queryability. The five base tables decompose the domain into atomic entity types—resources, organizations, hotlines, issues, and locations—each with its own primary key and a small set of descriptive attributes. Foreign keys and semantic column references (such as `hotline_service_phone_number` and `hotline_service_phone_number`) create a web of relationships that can be traversed in either direction. The twelve views materialize the most common join patterns as virtual tables, allowing analysts to answer cross-entity questions—such as "which organization operates which resource at which location, and what hotline serves the associated social issue"—without writing explicit joins. The result is a schema that is both structurally sound, with clear entity boundaries and referential integrity, and analytically practical, with pre-joined views that reconstruct the domain facts needed for reporting and decision-making.