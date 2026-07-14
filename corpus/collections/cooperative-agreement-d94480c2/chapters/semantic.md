## Ontology-Grounded Relational Modelling in the Assistive Communication Domain

The domain under examination concerns the coordination of assistive communication technologies across organizational, individual, and goal-oriented dimensions. Cooperative agreements serve as the temporal anchors of this ecosystem, defining bounded periods during which organizations commit to shared objectives. Within each agreement window, organizations deploy assistive technologies to help individuals achieve communication goals, often in concert with conferences that disseminate best practices. The relational schema captures this multi-layered structure through a set of base tables whose foreign keys encode the ontology's class relationships, while a suite of materialized views reconstructs the domain facts that analysts query in their natural, denormalized form.

**Table `cooperative_agreements`**

| cooperative_agreement_id | agreement_identifier | start_date | end_date | status | description | communication_goal_id | created_at |
|---|---|---|---|---|---|---|---|
| 100 | AGR-2715 | 2022-05-02 | 2022-05-08 | active | Seasonal Assessment | 1 | 2025-01-01 00:14:00 |
| 101 | AGR-2716 | 2023-10-13 | 2023-10-19 | expired | Integrated Survey | 2 | 2025-02-06 03:14:00 |
| 102 | AGR-2717 | 2024-03-24 | 2024-03-03 | terminated | Extended Corridor D | 3 | 2025-03-11 06:14:00 |
| 103 | AGR-2718 | 2025-08-08 | 2025-08-14 | active | Pilot Series | 4 | 2025-04-16 09:14:00 |

The `cooperative_agreements` table is the temporal backbone of the schema. Each row represents a discrete agreement identified by a human-readable code such as `AGR-2715` or `AGR-2718`, spanning a `start_date` and `end_date` pair that defines its validity window. The `status` column—taking values like `active`, `expired`, or `terminated`—records the lifecycle phase of the agreement, while the `description` field provides a brief label such as "Seasonal Assessment" or "Pilot Series." The `communication_goal_id` column is a foreign key pointing to the `communication_goals` table, establishing a direct link between each agreement and the specific communication objective it is designed to advance. The `created_at` timestamp records when the agreement record was first materialized in the system. This table is the only base table that does not receive a foreign key from any other table, positioning it as a root entity in the ontology.

**Table `organizations`**

| id | organization_identifier | organization_name | legal_status | headquarters_location | website_url | cooperative_agreement_id | individual_id | conference_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Goodyear Tire & Rubber | Litton Industries | non-profit | adaptive-headquar-83 | https://www.gavi.org/covax-vaccine-roll-out/ukraine | 100 | 1 | 1 |
| 101 | American Express Co | Hinduja Group | for-profit | distributed-headquar-84 | https://ecocyc.org/gene?orgid=ECOLI&id=EG12036 | 101 | 2 | 2 |
| 102 | Litton Industries | Post Office Limited | ngo | baseline-headquar-85 | https://bugs.launchpad.net/openstack-manuals/+bug/1346438 | 102 | 3 | 3 |
| 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 | non-profit | pilot-headquar-86 | http://cms.trust.org/item/20200130211305-pdsuk | 103 | 4 | 4 |

The `organizations` table models the institutional actors in the domain. Each organization carries a unique `id` surrogate key alongside a business-readable `organization_identifier` (for instance, `Goodyear Tire & Rubber` or `American Express Co`) and a formal `organization_name` such as `Litton Industries` or `Hinduja Group`. The `legal_status` column distinguishes between `non-profit`, `for-profit`, and `ngo` entities, while `headquarters_location` stores a coded location reference like `adaptive-headquar-83` or `distributed-headquar-84`. The `website_url` column holds the organization's web address, and three foreign key columns—`cooperative_agreement_id`, `individual_id`, and `conference_id`—tie each organization to its associated agreement, its primary contact individual, and the conference it participates in. The presence of these three FK columns means that an organization row simultaneously anchors three distinct ontology relationships: to an agreement, to a person, and to an event.

**Table `individuals`**

| individual_id | individual_identifier | first_name | last_name | role | needs_complex_communication | organization_id | assistive_technology_id |
|---|---|---|---|---|---|---|---|
| 1 | IND-2713 | Ta-Nehisi Coates | Clay Bennett | user | true | 100 | 1 |
| 2 | IND-2715 | William Welch | Jason Schmidt | practitioner | false | 101 | 2 |
| 3 | IND-2717 | Jennifer Quinn | April Snyder | family_member | true | 102 | 3 |
| 4 | IND-2719 | Elizabeth Woods | Stephanie Sutton | speech_language_pathologist | false | 103 | 4 |

Individuals represent the human actors who use, prescribe, or study assistive communication technologies. The `individuals` table assigns each person a surrogate `individual_id` and a readable `individual_identifier` such as `IND-2713`. The `first_name` and `last_name` columns store the person's name—for example, `Ta-Nehisi Coates` and `Clay Bennett`—while the `role` column classifies them as a `user`, `practitioner`, `family_member`, or `speech_language_pathologist`. The boolean column `needs_complex_communication` indicates whether the individual requires sophisticated assistive tools. Two foreign keys, `organization_id` and `assistive_technology_id`, link each individual to their affiliated organization and to the assistive technology they are associated with, respectively.

**Table `assistive_technologies`**

| assistive_technology_id | technology_identifier | product_name | technology_type | manufacturer | availability_status | organization_id | individual_id | communication_goal_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | TEC-2714 | Primary Review A | aac_device | Senseonics Holdings Inc. | available | 100 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | TEC-2720 | Composite Initiative | software | Gazprom Neft | discontinued | 101 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | TEC-2726 | Compact Model | hardware | Advance Auto Parts | prototype | 102 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | TEC-2732 | Legacy Cluster D | system | LDAP First Name Field | available | 103 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `assistive_technologies` table captures the products and systems deployed in the domain. Each technology row carries a surrogate `assistive_technology_id`, a `technology_identifier` like `TEC-2714`, and a `product_name` such as `Primary Review A` or `Legacy Cluster D`. The `technology_type` column classifies the product as an `aac_device`, `software`, `hardware`, or `system`, while `manufacturer` records the producing entity—for instance, `Senseonics Holdings Inc.` or `LDAP First Name Field`. The `availability_status` column takes values including `available`, `discontinued`, and `prototype`. Three foreign keys (`organization_id`, `individual_id`, and `communication_goal_id`) connect each technology to its sponsoring organization, its end user, and the communication goal it serves. The `created_at` and `updated_at` timestamps track the technology's lifecycle.

**Table `communication_goals`**

| communication_goal_id | goal_identifier | goal_description | target_audience | priority_level | organization_id | assistive_technology_id | individual_id |
|---|---|---|---|---|---|---|---|
| 1 | GOA-2381 | Seasonal Initiative | users | 42 | 100 | 1 | 1 |
| 2 | GOA-2387 | Integrated Model | practitioners | 50 | 101 | 2 | 2 |
| 3 | GOA-2393 | Extended Cluster D | manufacturers | 58 | 102 | 3 | 3 |
| 4 | GOA-2399 | Pilot Review | general_public | 66 | 103 | 4 | 4 |

Communication goals encode the objectives that drive the entire coordination effort. Each goal has a surrogate `communication_goal_id`, a `goal_identifier` such as `GOA-2381`, and a `goal_description` like "Seasonal Initiative" or "Pilot Review." The `target_audience` column specifies who the goal is aimed at—`users`, `practitioners`, `manufacturers`, or `general_public`—while `priority_level` stores a numeric priority score (42, 50, 58, 66 in the sample data). Three foreign keys (`organization_id`, `assistive_technology_id`, and `individual_id`) tie each goal to the organization pursuing it, the technology enabling it, and the individual it is designed for.

**Table `conferences`**

| conference_id | conference_identifier | conference_name | start_date | end_date | frequency | location | organization_id | individual_id | communication_goal_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CON-2543 | Integrated Programme A | 2022-05-02 | 2022-05-08 | biennial | baseline-location-97 | 100 | 1 | 1 |
| 2 | CON-2545 | Extended Standard | 2023-10-13 | 2023-10-19 | annual | pilot-location-98 | 101 | 2 | 2 |
| 3 | CON-2547 | Pilot Framework | 2024-03-24 | 2024-03-03 | quarterly | extended-location-99 | 102 | 3 | 3 |
| 4 | CON-2549 | Baseline Protocol D | 2025-08-08 | 2025-08-14 | biennial | integrated-location-100 | 103 | 4 | 4 |

Conferences represent the events through which knowledge and practices are shared. The `conferences` table assigns each event a `conference_id`, a `conference_identifier` such as `CON-2543`, and a `conference_name` like "Integrated Programme A." The `start_date` and `end_date` columns define the event's temporal span, while `frequency` records whether it is `biennial`, `annual`, or `quarterly`. The `location` column stores a coded venue reference such as `baseline-location-97`. Three foreign keys (`organization_id`, `individual_id`, and `communication_goal_id`) link each conference to its organizing institution, a key participant, and the communication goal it addresses.

**Table `agreements_organizations`**

| cooperative_agreement_id | organization_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `agreements_organizations` table serves as a junction (many-to-many resolution) table between `cooperative_agreements` and `organizations`. In the ontology, an agreement can involve multiple organizations and an organization can participate in multiple agreements; the junction table materializes this relationship by storing pairs of `cooperative_agreement_id` and `organization_id` values. This normalization prevents data redundancy and allows the schema to support flexible, reconfigurable partnerships without altering the base table structures.

With the base tables defined, the schema provides a comprehensive set of materialized views that join these tables into domain-meaningful projections. Each view answers a specific analytical question by denormalizing the normalized data.

**View `v_cooperative_agreement_organization_detail`**

```sql
CREATE VIEW v_cooperative_agreement_organization_detail AS
SELECT a.cooperative_agreement_id, a.agreement_identifier, a.start_date, b.id AS organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM cooperative_agreements a
  JOIN agreements_organizations j ON j.cooperative_agreement_id = a.cooperative_agreement_id
  JOIN organizations b ON b.id = j.organization_id;
```

| cooperative_agreement_id | agreement_identifier | start_date | organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|
| 100 | AGR-2715 | 2022-05-02 | 100 | Goodyear Tire & Rubber | Litton Industries |
| 100 | AGR-2715 | 2022-05-02 | 101 | American Express Co | Hinduja Group |
| 101 | AGR-2716 | 2023-10-13 | 101 | American Express Co | Hinduja Group |
| 101 | AGR-2716 | 2023-10-13 | 102 | Litton Industries | Post Office Limited |
| 102 | AGR-2717 | 2024-03-24 | 102 | Litton Industries | Post Office Limited |
| 102 | AGR-2717 | 2024-03-24 | 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 |
| 103 | AGR-2718 | 2025-08-08 | 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 |
| 103 | AGR-2718 | 2025-08-08 | 100 | Goodyear Tire & Rubber | Litton Industries |

The view `v_cooperative_agreement_organization_detail` joins `cooperative_agreements` with `agreements_organizations` and `organizations` to produce a detailed record of which organization is associated with which agreement. Reading a concrete row: agreement `AGR-2715` ("Seasonal Assessment") is linked to the organization `Goodyear Tire & Rubber` (identifier `Litton Industries`), with the agreement's `active` status and date range `2022-05-02` through `2022-05-08` fully visible alongside the organization's `non-profit` legal status and headquarters at `adaptive-headquar-83`. This view answers the question "Which organizations are involved in which cooperative agreements, and what are the details of both sides of that relationship?"

**View `v_cooperative_agreement_communication_goal`**

```sql
CREATE VIEW v_cooperative_agreement_communication_goal AS
SELECT a.cooperative_agreement_id, a.agreement_identifier, a.start_date, a.end_date, b.communication_goal_id AS goal_communication_goal_id, b.goal_identifier AS goal_goal_identifier, b.goal_description AS goal_goal_description
FROM cooperative_agreements a JOIN communication_goals b ON a.communication_goal_id = b.communication_goal_id;
```

| cooperative_agreement_id | agreement_identifier | start_date | end_date | goal_communication_goal_id | goal_goal_identifier | goal_goal_description |
|---|---|---|---|---|---|---|
| 100 | AGR-2715 | 2022-05-02 | 2022-05-08 | 1 | GOA-2381 | Seasonal Initiative |
| 101 | AGR-2716 | 2023-10-13 | 2023-10-19 | 2 | GOA-2387 | Integrated Model |
| 102 | AGR-2717 | 2024-03-24 | 2024-03-03 | 3 | GOA-2393 | Extended Cluster D |
| 103 | AGR-2718 | 2025-08-08 | 2025-08-14 | 4 | GOA-2399 | Pilot Review |

The view `v_cooperative_agreement_communication_goal` joins `cooperative_agreements` with `communication_goals` on the `communication_goal_id` foreign key. A representative row shows agreement `AGR-2716` ("Integrated Survey", status `expired`) paired with communication goal `GOA-2387` ("Integrated Model", target audience `practitioners`, priority level `50`). This view answers "What communication goal is each cooperative agreement designed to advance?"

**View `v_organization_cooperative_agreement`**

```sql
CREATE VIEW v_organization_cooperative_agreement AS
SELECT a.id, a.organization_identifier, a.organization_name, a.legal_status, b.cooperative_agreement_id AS agreement_cooperative_agreement_id, b.agreement_identifier AS agreement_agreement_identifier, b.start_date AS agreement_start_date
FROM organizations a JOIN cooperative_agreements b ON a.cooperative_agreement_id = b.cooperative_agreement_id;
```

| id | organization_identifier | organization_name | legal_status | agreement_cooperative_agreement_id | agreement_agreement_identifier | agreement_start_date |
|---|---|---|---|---|---|---|
| 100 | Goodyear Tire & Rubber | Litton Industries | non-profit | 100 | AGR-2715 | 2022-05-02 |
| 101 | American Express Co | Hinduja Group | for-profit | 101 | AGR-2716 | 2023-10-13 |
| 102 | Litton Industries | Post Office Limited | ngo | 102 | AGR-2717 | 2024-03-24 |
| 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 | non-profit | 103 | AGR-2718 | 2025-08-08 |

The view `v_organization_cooperative_agreement` joins `organizations` with `cooperative_agreements` via the `cooperative_agreement_id` foreign key stored in the `organizations` table. A sample row reveals that organization `American Express Co` (identifier `Hinduja Group`, legal status `for-profit`) is associated with agreement `AGR-2716` ("Integrated Survey"). This view answers "Which cooperative agreement is each organization currently bound to?"

**View `v_organization_individual`**

```sql
CREATE VIEW v_organization_individual AS
SELECT a.id, a.organization_identifier, a.organization_name, a.legal_status, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM organizations a JOIN individuals b ON a.individual_id = b.individual_id;
```

| id | organization_identifier | organization_name | legal_status | individual_individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|---|
| 100 | Goodyear Tire & Rubber | Litton Industries | non-profit | 1 | IND-2713 | Ta-Nehisi Coates |
| 101 | American Express Co | Hinduja Group | for-profit | 2 | IND-2715 | William Welch |
| 102 | Litton Industries | Post Office Limited | ngo | 3 | IND-2717 | Jennifer Quinn |
| 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 | non-profit | 4 | IND-2719 | Elizabeth Woods |

The view `v_organization_individual` joins `organizations` with `individuals` through the `individual_id` foreign key in `organizations`. A concrete example: organization `Litton Industries` (identifier `Post Office Limited`, ngo status) is linked to individual `IND-2717` (Jennifer Quinn, April Snyder, role `family_member`). This view answers "Which individual is associated with each organization?"

**View `v_organization_conference`**

```sql
CREATE VIEW v_organization_conference AS
SELECT a.id, a.organization_identifier, a.organization_name, a.legal_status, b.conference_id AS conference_conference_id, b.conference_identifier AS conference_conference_identifier, b.conference_name AS conference_conference_name
FROM organizations a JOIN conferences b ON a.conference_id = b.conference_id;
```

| id | organization_identifier | organization_name | legal_status | conference_conference_id | conference_conference_identifier | conference_conference_name |
|---|---|---|---|---|---|---|
| 100 | Goodyear Tire & Rubber | Litton Industries | non-profit | 1 | CON-2543 | Integrated Programme A |
| 101 | American Express Co | Hinduja Group | for-profit | 2 | CON-2545 | Extended Standard |
| 102 | Litton Industries | Post Office Limited | ngo | 3 | CON-2547 | Pilot Framework |
| 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 | non-profit | 4 | CON-2549 | Baseline Protocol D |

The view `v_organization_conference` joins `organizations` with `conferences` via the `conference_id` foreign key in `organizations`. A sample row shows organization `Internationals Network For Public Schools Inc` (identifier `Schlumberger Industries Identif d'Encarteur PR050`, non-profit) connected to conference `CON-2549` ("Baseline Protocol D", frequency `biennial`, location `integrated-location-100`). This view answers "Which conference is each organization participating in?"

**View `v_individual_organization`**

```sql
CREATE VIEW v_individual_organization AS
SELECT a.individual_id, a.individual_identifier, a.first_name, a.last_name, b.id AS organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM individuals a JOIN organizations b ON a.organization_id = b.id;
```

| individual_id | individual_identifier | first_name | last_name | organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | IND-2713 | Ta-Nehisi Coates | Clay Bennett | 100 | Goodyear Tire & Rubber | Litton Industries |
| 2 | IND-2715 | William Welch | Jason Schmidt | 101 | American Express Co | Hinduja Group |
| 3 | IND-2717 | Jennifer Quinn | April Snyder | 102 | Litton Industries | Post Office Limited |
| 4 | IND-2719 | Elizabeth Woods | Stephanie Sutton | 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 |

The view `v_individual_organization` joins `individuals` with `organizations` through the `organization_id` foreign key in `individuals`. A representative row displays individual `IND-2713` (Ta-Nehisi Coates, Clay Bennett, role `user`, `needs_complex_communication = true`) affiliated with organization `Goodyear Tire & Rubber` (identifier `Litton Industries`). This view answers "Which organization does each individual belong to?"

**View `v_individual_assistive_technology`**

```sql
CREATE VIEW v_individual_assistive_technology AS
SELECT a.individual_id, a.individual_identifier, a.first_name, a.last_name, b.assistive_technology_id AS technology_assistive_technology_id, b.technology_identifier AS technology_technology_identifier, b.product_name AS technology_product_name
FROM individuals a JOIN assistive_technologies b ON a.assistive_technology_id = b.assistive_technology_id;
```

| individual_id | individual_identifier | first_name | last_name | technology_assistive_technology_id | technology_technology_identifier | technology_product_name |
|---|---|---|---|---|---|---|
| 1 | IND-2713 | Ta-Nehisi Coates | Clay Bennett | 1 | TEC-2714 | Primary Review A |
| 2 | IND-2715 | William Welch | Jason Schmidt | 2 | TEC-2720 | Composite Initiative |
| 3 | IND-2717 | Jennifer Quinn | April Snyder | 3 | TEC-2726 | Compact Model |
| 4 | IND-2719 | Elizabeth Woods | Stephanie Sutton | 4 | TEC-2732 | Legacy Cluster D |

The view `v_individual_assistive_technology` joins `individuals` with `assistive_technologies` via the `assistive_technology_id` foreign key in `individuals`. A concrete row shows individual `IND-2715` (William Welch, Jason Schmidt, role `practitioner`, `needs_complex_communication = false`) associated with technology `TEC-2720` ("Composite Initiative", type `software`, manufacturer `Gazprom Neft`, status `discontinued`). This view answers "Which assistive technology is each individual using or prescribed?"

**View `v_assistive_technology_organization`**

```sql
CREATE VIEW v_assistive_technology_organization AS
SELECT a.assistive_technology_id, a.technology_identifier, a.product_name, a.technology_type, b.id AS organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM assistive_technologies a JOIN organizations b ON a.organization_id = b.id;
```

| assistive_technology_id | technology_identifier | product_name | technology_type | organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | TEC-2714 | Primary Review A | aac_device | 100 | Goodyear Tire & Rubber | Litton Industries |
| 2 | TEC-2720 | Composite Initiative | software | 101 | American Express Co | Hinduja Group |
| 3 | TEC-2726 | Compact Model | hardware | 102 | Litton Industries | Post Office Limited |
| 4 | TEC-2732 | Legacy Cluster D | system | 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 |

The view `v_assistive_technology_organization` joins `assistive_technologies` with `organizations` through the `organization_id` foreign key in `assistive_technologies`. A sample row reveals technology `TEC-2714` ("Primary Review A", type `aac_device`, manufacturer `Senseonics Holdings Inc.`, status `available`) sponsored by organization `Goodyear Tire & Rubber` (identifier `Litton Industries`). This view answers "Which organization sponsors or provides each assistive technology?"

**View `v_assistive_technology_individual`**

```sql
CREATE VIEW v_assistive_technology_individual AS
SELECT a.assistive_technology_id, a.technology_identifier, a.product_name, a.technology_type, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM assistive_technologies a JOIN individuals b ON a.individual_id = b.individual_id;
```

| assistive_technology_id | technology_identifier | product_name | technology_type | individual_individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|---|
| 1 | TEC-2714 | Primary Review A | aac_device | 1 | IND-2713 | Ta-Nehisi Coates |
| 2 | TEC-2720 | Composite Initiative | software | 2 | IND-2715 | William Welch |
| 3 | TEC-2726 | Compact Model | hardware | 3 | IND-2717 | Jennifer Quinn |
| 4 | TEC-2732 | Legacy Cluster D | system | 4 | IND-2719 | Elizabeth Woods |

The view `v_assistive_technology_individual` joins `assistive_technologies` with `individuals` via the `individual_id` foreign key in `assistive_technologies`. A representative row shows technology `TEC-2726` ("Compact Model", type `hardware`, manufacturer `Advance Auto Parts`, status `prototype`) used by individual `IND-2717` (Jennifer Quinn, April Snyder, role `family_member`). This view answers "Which individual is the end user of each assistive technology?"

**View `v_assistive_technology_communication_goal`**

```sql
CREATE VIEW v_assistive_technology_communication_goal AS
SELECT a.assistive_technology_id, a.technology_identifier, a.product_name, a.technology_type, b.communication_goal_id AS goal_communication_goal_id, b.goal_identifier AS goal_goal_identifier, b.goal_description AS goal_goal_description
FROM assistive_technologies a JOIN communication_goals b ON a.communication_goal_id = b.communication_goal_id;
```

| assistive_technology_id | technology_identifier | product_name | technology_type | goal_communication_goal_id | goal_goal_identifier | goal_goal_description |
|---|---|---|---|---|---|---|
| 1 | TEC-2714 | Primary Review A | aac_device | 1 | GOA-2381 | Seasonal Initiative |
| 2 | TEC-2720 | Composite Initiative | software | 2 | GOA-2387 | Integrated Model |
| 3 | TEC-2726 | Compact Model | hardware | 3 | GOA-2393 | Extended Cluster D |
| 4 | TEC-2732 | Legacy Cluster D | system | 4 | GOA-2399 | Pilot Review |

The view `v_assistive_technology_communication_goal` joins `assistive_technologies` with `communication_goals` through the `communication_goal_id` foreign key in `assistive_technologies`. A concrete example: technology `TEC-2732` ("Legacy Cluster D", type `system`, manufacturer `LDAP First Name Field`, status `available`) is aligned with communication goal `GOA-2399` ("Pilot Review", target audience `general_public`, priority level `66`). This view answers "Which communication goal does each assistive technology serve?"

**View `v_communication_goal_organization`**

```sql
CREATE VIEW v_communication_goal_organization AS
SELECT a.communication_goal_id, a.goal_identifier, a.goal_description, a.target_audience, b.id AS organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM communication_goals a JOIN organizations b ON a.organization_id = b.id;
```

| communication_goal_id | goal_identifier | goal_description | target_audience | organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | GOA-2381 | Seasonal Initiative | users | 100 | Goodyear Tire & Rubber | Litton Industries |
| 2 | GOA-2387 | Integrated Model | practitioners | 101 | American Express Co | Hinduja Group |
| 3 | GOA-2393 | Extended Cluster D | manufacturers | 102 | Litton Industries | Post Office Limited |
| 4 | GOA-2399 | Pilot Review | general_public | 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 |

The view `v_communication_goal_organization` joins `communication_goals` with `organizations` via the `organization_id` foreign key in `communication_goals`. A sample row displays communication goal `GOA-2381` ("Seasonal Initiative", target audience `users`, priority level `42`) pursued by organization `Goodyear Tire & Rubber` (identifier `Litton Industries`). This view answers "Which organization is responsible for each communication goal?"

**View `v_communication_goal_assistive_technology`**

```sql
CREATE VIEW v_communication_goal_assistive_technology AS
SELECT a.communication_goal_id, a.goal_identifier, a.goal_description, a.target_audience, b.assistive_technology_id AS technology_assistive_technology_id, b.technology_identifier AS technology_technology_identifier, b.product_name AS technology_product_name
FROM communication_goals a JOIN assistive_technologies b ON a.assistive_technology_id = b.assistive_technology_id;
```

| communication_goal_id | goal_identifier | goal_description | target_audience | technology_assistive_technology_id | technology_technology_identifier | technology_product_name |
|---|---|---|---|---|---|---|
| 1 | GOA-2381 | Seasonal Initiative | users | 1 | TEC-2714 | Primary Review A |
| 2 | GOA-2387 | Integrated Model | practitioners | 2 | TEC-2720 | Composite Initiative |
| 3 | GOA-2393 | Extended Cluster D | manufacturers | 3 | TEC-2726 | Compact Model |
| 4 | GOA-2399 | Pilot Review | general_public | 4 | TEC-2732 | Legacy Cluster D |

The view `v_communication_goal_assistive_technology` joins `communication_goals` with `assistive_technologies` through the `assistive_technology_id` foreign key in `communication_goals`. A representative row shows communication goal `GOA-2387` ("Integrated Model", target audience `practitioners`, priority level `50`) enabled by technology `TEC-2720` ("Composite Initiative", type `software`). This view answers "Which assistive technology enables each communication goal?"

**View `v_communication_goal_individual`**

```sql
CREATE VIEW v_communication_goal_individual AS
SELECT a.communication_goal_id, a.goal_identifier, a.goal_description, a.target_audience, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM communication_goals a JOIN individuals b ON a.individual_id = b.individual_id;
```

| communication_goal_id | goal_identifier | goal_description | target_audience | individual_individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|---|
| 1 | GOA-2381 | Seasonal Initiative | users | 1 | IND-2713 | Ta-Nehisi Coates |
| 2 | GOA-2387 | Integrated Model | practitioners | 2 | IND-2715 | William Welch |
| 3 | GOA-2393 | Extended Cluster D | manufacturers | 3 | IND-2717 | Jennifer Quinn |
| 4 | GOA-2399 | Pilot Review | general_public | 4 | IND-2719 | Elizabeth Woods |

The view `v_communication_goal_individual` joins `communication_goals` with `individuals` via the `individual_id` foreign key in `communication_goals`. A concrete row reveals communication goal `GOA-2393` ("Extended Cluster D", target audience `manufacturers`, priority level `58`) designed for individual `IND-2719` (Elizabeth Woods, Stephanie Sutton, role `speech_language_pathologist`). This view answers "Which individual is the target beneficiary of each communication goal?"

**View `v_conference_organization`**

```sql
CREATE VIEW v_conference_organization AS
SELECT a.conference_id, a.conference_identifier, a.conference_name, a.start_date, b.id AS organization_id, b.organization_identifier AS organization_organization_identifier, b.organization_name AS organization_organization_name
FROM conferences a JOIN organizations b ON a.organization_id = b.id;
```

| conference_id | conference_identifier | conference_name | start_date | organization_id | organization_organization_identifier | organization_organization_name |
|---|---|---|---|---|---|---|
| 1 | CON-2543 | Integrated Programme A | 2022-05-02 | 100 | Goodyear Tire & Rubber | Litton Industries |
| 2 | CON-2545 | Extended Standard | 2023-10-13 | 101 | American Express Co | Hinduja Group |
| 3 | CON-2547 | Pilot Framework | 2024-03-24 | 102 | Litton Industries | Post Office Limited |
| 4 | CON-2549 | Baseline Protocol D | 2025-08-08 | 103 | Internationals Network For Public Schools Inc | Schlumberger Industries Identif d'Encarteur PR050 |

The view `v_conference_organization` joins `conferences` with `organizations` through the `organization_id` foreign key in `conferences`. A sample row shows conference `CON-2543` ("Integrated Programme A", frequency `biennial`, location `baseline-location-97`) organized by organization `Goodyear Tire & Rubber` (identifier `Litton Industries`). This view answers "Which organization organizes or hosts each conference?"

**View `v_conference_individual`**

```sql
CREATE VIEW v_conference_individual AS
SELECT a.conference_id, a.conference_identifier, a.conference_name, a.start_date, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM conferences a JOIN individuals b ON a.individual_id = b.individual_id;
```

| conference_id | conference_identifier | conference_name | start_date | individual_individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|---|
| 1 | CON-2543 | Integrated Programme A | 2022-05-02 | 1 | IND-2713 | Ta-Nehisi Coates |
| 2 | CON-2545 | Extended Standard | 2023-10-13 | 2 | IND-2715 | William Welch |
| 3 | CON-2547 | Pilot Framework | 2024-03-24 | 3 | IND-2717 | Jennifer Quinn |
| 4 | CON-2549 | Baseline Protocol D | 2025-08-08 | 4 | IND-2719 | Elizabeth Woods |

The view `v_conference_individual` joins `conferences` with `individuals` via the `individual_id` foreign key in `conferences`. A representative row displays conference `CON-2545` ("Extended Standard", frequency `annual`, location `pilot-location-98`) with participant individual `IND-2715` (William Welch, Jason Schmidt, role `practitioner`). This view answers "Which individual participates in each conference?"

**View `v_conference_communication_goal`**

```sql
CREATE VIEW v_conference_communication_goal AS
SELECT a.conference_id, a.conference_identifier, a.conference_name, a.start_date, b.communication_goal_id AS goal_communication_goal_id, b.goal_identifier AS goal_goal_identifier, b.goal_description AS goal_goal_description
FROM conferences a JOIN communication_goals b ON a.communication_goal_id = b.communication_goal_id;
```

| conference_id | conference_identifier | conference_name | start_date | goal_communication_goal_id | goal_goal_identifier | goal_goal_description |
|---|---|---|---|---|---|---|
| 1 | CON-2543 | Integrated Programme A | 2022-05-02 | 1 | GOA-2381 | Seasonal Initiative |
| 2 | CON-2545 | Extended Standard | 2023-10-13 | 2 | GOA-2387 | Integrated Model |
| 3 | CON-2547 | Pilot Framework | 2024-03-24 | 3 | GOA-2393 | Extended Cluster D |
| 4 | CON-2549 | Baseline Protocol D | 2025-08-08 | 4 | GOA-2399 | Pilot Review |

The view `v_conference_communication_goal` joins `conferences` with `communication_goals` through the `communication_goal_id` foreign key in `conferences`. A concrete example: conference `CON-2547` ("Pilot Framework", frequency `quarterly`, location `extended-location-99`) addresses communication goal `GOA-2393` ("Extended Cluster D", target audience `manufacturers`, priority level `58`). This view answers "Which communication goal is each conference designed to advance?"

The schema as a whole embodies a disciplined normalization strategy: each entity type occupies its own table with a surrogate primary key, and relationships are expressed through explicit foreign key columns or junction tables. The `cooperative_agreements` table anchors the temporal dimension, while `organizations`, `individuals`, `assistive_technologies`, `communication_goals`, and `conferences` each model a distinct ontology class. The foreign keys—such as `cooperative_agreement_id` in `organizations`, `organization_id` in `individuals` and `assistive_technologies`, and `communication_goal_id` in `cooperative_agreements` and `assistive_technologies`—encode the cardinality-bounded relationships that the ontology defines. The junction table `agreements_organizations` resolves the many-to-many relationship between agreements and organizations that cannot be captured by a single foreign key column.

The materialized views then reconstruct the domain facts that analysts need in practice. Rather than requiring users to write multi-table joins every time they query, the views pre-compute the denormalized result sets. Each view answers a specific analytical question—linking agreements to organizations, individuals to technologies, conferences to goals—by joining the relevant base tables on their foreign keys. The result is a schema that is both rigorously normalized for data integrity and conveniently denormalized for analytical access, faithfully reflecting the ontology's class hierarchy and relationship structure in relational form.