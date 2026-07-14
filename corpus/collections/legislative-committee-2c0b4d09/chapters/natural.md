## The Architecture of Legislative Governance

Legislative governance operates as a structured ecosystem of committees, legislators, policy domains, and meeting venues, each maintaining its own record while participating in a network of operational relationships. A legislative committee serves as the primary organizational unit, carrying a unique identifier, a jurisdictional description, and a lifecycle status that tracks whether it is active, inactive, or dissolved. Within each committee, legislators assume defined roles—chair, vice-chair, member, or clerk—and are linked through a membership registry that captures the many-to-many nature of committee assignments. Policy domains define the regulatory scope of each committee's work, while meeting venues provide the physical or virtual locations where deliberations occur. Committee meetings bind these elements together in time, recording when a session is scheduled, its duration, and its outcome. The following sections describe each component and the analytical views that join them into actionable intelligence.

### Core Entities

The foundation of the system rests on five base tables that record the static and semi-static entities of the legislative domain.

**Table `legislative_committees`**

| id | committee_id | committee_name | jurisdiction_description | status | established_date | venue_id |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | Adaptive Corridor | active | 2024-03-27T14:30:00 | 2839523 |
| 2 | L785 | Compact Review A | Primary Series | inactive | 2025-08-11T21:47:00 | goh |
| 3 | 7119774 | Legacy Initiative | Composite Assessment D | dissolved | 2022-01-22T04:04:00 | 27d06ecf80b34272bb825aa8d4b0983f |
| 4 | 1186094 | Regional Model | Compact Survey | active | 2023-06-06T11:21:00 | L296 |

Each row in the legislative committees table represents a distinct governing body. The committee identifier, such as `PHR-98` for the Composite Cluster or `L785` for Compact Review A, serves as the primary key for all downstream relationships. The jurisdiction description—Adaptive Corridor, Primary Series, Composite Assessment D, Compact Survey—defines the scope of authority. The status column tracks the committee's lifecycle: the Composite Cluster (id 1) and Regional Model (id 4) are currently active, Compact Review A (id 2) is inactive, and Legacy Initiative (id 3) has been dissolved. The established_date records when each committee was formally constituted, ranging from January 2022 for the Legacy Initiative to August 2025 for Compact Review A. A venue_id column links each committee to a default meeting location.

**Table `legislators`**

| id | legislator_id | full_name | role | contact_email | contact_phone | legislative_committee_id |
|---|---|---|---|---|---|---|
| 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath | member | Christopher Wilson | Joe Tsai | 1 |
| 2 | 1996927 | Account Name | chair | Charles Larsen | Stephanie Collins | 2 |
| 3 | 20963968 | Saipan International Airport | vice-chair | Mary Alvarez | Tasha Rodriguez | 3 |
| 4 | 4843 | Norma Fisher | clerk | April Snyder | Walter Pratt | 4 |

The legislators table records individual participants in the legislative process. Each legislator carries a unique identifier—`ChIJyQkrS_pt5kcRgcBUZri0Wao` for Theodore Mcgrath, `1996927` for the entity recorded as Account Name, `20963968` for Saipan International Airport, and `4843` for Norma Fisher. The role column assigns each legislator a position within their committee: chair, vice-chair, member, or clerk. Contact information is stored in separate columns for email and phone, though in the current dataset these fields contain names rather than conventional contact details. The legislative_committee_id column directly associates each legislator with one of the four committees.

**Table `policy_domains`**

| domain_code | domain_name | regulatory_scope | enforcement_agency | legislative_committee_id | overlaps_with_domain_code | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 4716398 | Regional Protocol | legacy-regulato-85 | China Unionpay Co. Ltd | 1 | 4716398 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 605967 | Seasonal Programme D | compact-regulato-86 | Hamilton County Department of Education | 2 | 605967 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 16375765 | Integrated Standard | composite-regulato-87 | Petco Health and Wellness Company Inc. | 3 | 16375765 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 0471948470 | Extended Framework | primary-regulato-88 | Alexandria Real Estate Equities | 4 | 0471948470 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Policy domains define the regulatory territories that committees oversee. Each domain is identified by a domain_code—`4716398` for Regional Protocol, `605967` for Seasonal Programme D, `16375765` for Integrated Standard, and `0471948470` for Extended Framework. The domain_name provides a human-readable label, while regulatory_scope specifies the type of regulation (legacy-regulato-85, compact-regulato-86, composite-regulato-87, primary-regulato-88). The enforcement_agency column names the body responsible for implementation, such as China Unionpay Co. Ltd or Hamilton County Department of Education. Each domain is linked to a legislative_committee_id, establishing which committee holds primary jurisdiction. The overlaps_with_domain_code column references another domain, indicating regulatory overlap or shared jurisdiction. Timestamps for created_at and updated_at track the domain's administrative history.

**Table `meeting_venues`**

| venue_id | venue_name | street_address | city | state | zip_code | room_number | meeting_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 2839523 | Legacy Review D | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | ROO-2106 | 20967529 | 2025-01-01 00:14:00 |
| goh | Regional Initiative | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | ROO-2113 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2025-02-06 03:14:00 |
| 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | ROO-2120 | gd_acc_763000 | 2025-03-11 06:14:00 |
| L296 | Integrated Cluster A | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | ROO-2127 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-04-16 09:14:00 |

Meeting venues record the locations where committee sessions convene. Each venue has a venue_id, a venue_name (Legacy Review D, Regional Initiative, Seasonal Model, Integrated Cluster A), and a full address including street_address, city, state, and zip_code. The room_number column identifies the specific chamber or room within the venue. A meeting_id column links each venue record to a particular committee meeting, and created_at records when the venue record was established.

**Table `committee_meetings`**

| meeting_id | scheduled_date_time | duration_minutes | meeting_type | status | legislative_committee_id | venue_id |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | regular | scheduled | 1 | 2839523 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | special | ongoing | 2 | goh |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | emergency | completed | 3 | 27d06ecf80b34272bb825aa8d4b0983f |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | public_hearing | cancelled | 4 | L296 |

Committee meetings are the temporal events that bring committees, venues, and legislators together. Each meeting has a meeting_id, a scheduled_date_time, a duration in minutes, a meeting_type (regular, special, emergency, public_hearing), and a status (scheduled, ongoing, completed, cancelled). The legislative_committee_id identifies which committee convened, and the venue_id specifies where the meeting took place. Meeting durations range from 35 to 44 minutes across the four recorded sessions.

### Membership and Assignment Relationships

The connection between committees and legislators is not always direct. While the legislators table contains a legislative_committee_id column for direct assignment, the committees_legislators table provides a more flexible membership registry that supports many-to-many relationships.

**Table `committees_legislators`**

| legislative_committee_id | legislator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This junction table maps legislative_committee_id to legislator_id, allowing a single legislator to serve on multiple committees and a single committee to include multiple legislators. The current data shows that committee 1 (Composite Cluster) includes legislators 1 and 2; committee 2 (Compact Review A) includes legislators 2 and 3; committee 3 (Legacy Initiative) includes legislators 3 and 4; and committee 4 (Regional Model) includes legislators 4 and 1. This creates a circular assignment pattern where each legislator serves on exactly two committees, and each committee has exactly two members.

The policy domain assignments follow a similar one-to-one pattern in the current data: each of the four policy domains is linked to exactly one legislative committee, and each committee oversees exactly one domain.

**Table `committees_domains`**

| legislative_committee_id | domain_code |
|---|---|
| 1 | 4716398 |
| 1 | 605967 |
| 2 | 605967 |
| 2 | 16375765 |
| 3 | 16375765 |
| 3 | 0471948470 |
| 4 | 0471948470 |
| 4 | 4716398 |

This table formalizes the relationship between legislative committees and the policy domains they regulate. Each row pairs a legislative_committee_id with a domain_code, establishing which regulatory territory falls under a committee's purview. The current dataset shows a clean one-to-one mapping: committee 1 oversees domain 4716398 (Regional Protocol), committee 2 oversees domain 605967 (Seasonal Programme D), committee 3 oversees domain 16375765 (Integrated Standard), and committee 4 oversees domain 0471948470 (Extended Framework).

### Meeting Logistics

The meetings_legislators table records which legislators attended each committee meeting, completing the operational picture of who participated in which session, at which venue, and when.

**Table `meetings_legislators`**

| meeting_id | legislator_id |
|---|---|
| 20967529 | 1 |
| 20967529 | 2 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 3 |
| gd_acc_763000 | 3 |
| gd_acc_763000 | 4 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 4 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 1 |

This junction table links meeting_id to legislator_id, capturing attendance records for each session. Combined with the committee_meetings table, it enables reconstruction of the full meeting roster for any given session.

### Analytical Views

The system provides a set of analytical views that join the base tables into coherent narratives. Each view answers a specific operational question by combining data from multiple sources.

**View `v_legislative_committee_legislator_detail`**

```sql
CREATE VIEW v_legislative_committee_legislator_detail AS
SELECT a.id, a.committee_id, a.committee_name, b.id AS legislator_id, b.legislator_id AS legislator_legislator_id, b.full_name AS legislator_full_name
FROM legislative_committees a
  JOIN committees_legislators j ON j.legislative_committee_id = a.id
  JOIN legislators b ON b.id = j.legislator_id;
```

| id | committee_id | committee_name | legislator_id | legislator_legislator_id | legislator_full_name |
|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |
| 1 | PHR-98 | Composite Cluster | 2 | 1996927 | Account Name |
| 2 | L785 | Compact Review A | 2 | 1996927 | Account Name |
| 2 | L785 | Compact Review A | 3 | 20963968 | Saipan International Airport |
| 3 | 7119774 | Legacy Initiative | 3 | 20963968 | Saipan International Airport |
| 3 | 7119774 | Legacy Initiative | 4 | 4843 | Norma Fisher |
| 4 | 1186094 | Regional Model | 4 | 4843 | Norma Fisher |
| 4 | 1186094 | Regional Model | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |

This view joins legislative committees with their assigned legislators, producing a detailed roster that includes the committee's jurisdiction description, status, and established date alongside each legislator's full name, role, and contact information. For example, the first row would show the Composite Cluster committee (PHR-98, active, established 2024-03-27) with its member Theodore Mcgrath, while the second row would pair the same committee with legislator 2 (Account Name, chair). This view is the primary tool for answering which legislators serve on which committees and in what capacity.

**View `v_legislative_committee_policy_domain_detail`**

```sql
CREATE VIEW v_legislative_committee_policy_domain_detail AS
SELECT a.id, a.committee_id, a.committee_name, b.domain_code AS domain_domain_code, b.domain_name AS domain_domain_name, b.regulatory_scope AS domain_regulatory_scope
FROM legislative_committees a
  JOIN committees_domains j ON j.legislative_committee_id = a.id
  JOIN policy_domains b ON b.domain_code = j.domain_code;
```

| id | committee_id | committee_name | domain_domain_code | domain_domain_name | domain_regulatory_scope |
|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | 4716398 | Regional Protocol | legacy-regulato-85 |
| 1 | PHR-98 | Composite Cluster | 605967 | Seasonal Programme D | compact-regulato-86 |
| 2 | L785 | Compact Review A | 605967 | Seasonal Programme D | compact-regulato-86 |
| 2 | L785 | Compact Review A | 16375765 | Integrated Standard | composite-regulato-87 |
| 3 | 7119774 | Legacy Initiative | 16375765 | Integrated Standard | composite-regulato-87 |
| 3 | 7119774 | Legacy Initiative | 0471948470 | Extended Framework | primary-regulato-88 |
| 4 | 1186094 | Regional Model | 0471948470 | Extended Framework | primary-regulato-88 |
| 4 | 1186094 | Regional Model | 4716398 | Regional Protocol | legacy-regulato-85 |

By joining legislative committees with their associated policy domains, this view answers which regulatory territories each committee oversees. The first row would display the Composite Cluster committee alongside the Regional Protocol domain (code 4716398), with regulatory scope legacy-regulato-85 and enforcement by China Unionpay Co. Ltd. The second row would pair Compact Review A with Seasonal Programme D, enforced by Hamilton County Department of Education. This view is essential for understanding the regulatory jurisdiction of each committee.

**View `v_legislative_committee_meeting_venue`**

```sql
CREATE VIEW v_legislative_committee_meeting_venue AS
SELECT a.id, a.committee_id, a.committee_name, a.jurisdiction_description, b.venue_id AS venue_venue_id, b.venue_name AS venue_venue_name, b.street_address AS venue_street_address
FROM legislative_committees a JOIN meeting_venues b ON a.venue_id = b.venue_id;
```

| id | committee_id | committee_name | jurisdiction_description | venue_venue_id | venue_venue_name | venue_street_address |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | Composite Cluster | Adaptive Corridor | 2839523 | Legacy Review D | composite-street-15 |
| 2 | L785 | Compact Review A | Primary Series | goh | Regional Initiative | primary-street-16 |
| 3 | 7119774 | Legacy Initiative | Composite Assessment D | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 |
| 4 | 1186094 | Regional Model | Compact Survey | L296 | Integrated Cluster A | distributed-street-18 |

This view connects legislative committees with their meeting venues, providing the physical location details for each committee's sessions. The first row would show the Composite Cluster committee meeting at Legacy Review D, located at composite-street-15 in integrated-city-34, room ROO-2106. The second row would pair Compact Review A with Regional Initiative at primary-street-16, seasonal-city-35, room ROO-2113. This view supports logistical planning and facility management.

**View `v_legislator_legislative_committee`**

```sql
CREATE VIEW v_legislator_legislative_committee AS
SELECT a.id, a.legislator_id, a.full_name, a.role, b.id AS committee_id, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name
FROM legislators a JOIN legislative_committees b ON a.legislative_committee_id = b.id;
```

| id | legislator_id | full_name | role | committee_id | committee_committee_id | committee_committee_name |
|---|---|---|---|---|---|---|
| 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath | member | 1 | PHR-98 | Composite Cluster |
| 2 | 1996927 | Account Name | chair | 2 | L785 | Compact Review A |
| 3 | 20963968 | Saipan International Airport | vice-chair | 3 | 7119774 | Legacy Initiative |
| 4 | 4843 | Norma Fisher | clerk | 4 | 1186094 | Regional Model |

This view presents legislators alongside their committee assignments, answering the question of which committees each legislator serves on. Given the circular assignment pattern in the data, each legislator appears in two rows, reflecting their service on two different committees. For instance, legislator 1 (Theodore Mcgrath) would appear with both committee 1 (Composite Cluster) and committee 4 (Regional Model).

**View `v_policy_domain_legislative_committee`**

```sql
CREATE VIEW v_policy_domain_legislative_committee AS
SELECT a.domain_code, a.domain_name, a.regulatory_scope, a.enforcement_agency, b.id AS committee_id, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name
FROM policy_domains a JOIN legislative_committees b ON a.legislative_committee_id = b.id;
```

| domain_code | domain_name | regulatory_scope | enforcement_agency | committee_id | committee_committee_id | committee_committee_name |
|---|---|---|---|---|---|---|
| 4716398 | Regional Protocol | legacy-regulato-85 | China Unionpay Co. Ltd | 1 | PHR-98 | Composite Cluster |
| 605967 | Seasonal Programme D | compact-regulato-86 | Hamilton County Department of Education | 2 | L785 | Compact Review A |
| 16375765 | Integrated Standard | composite-regulato-87 | Petco Health and Wellness Company Inc. | 3 | 7119774 | Legacy Initiative |
| 0471948470 | Extended Framework | primary-regulato-88 | Alexandria Real Estate Equities | 4 | 1186094 | Regional Model |

This view joins policy domains with their overseeing legislative committees, providing a domain-centric perspective on governance structure. Each row pairs a domain_code and domain_name with the committee that regulates it. The first row would show Regional Protocol (4716398) overseen by the Composite Cluster committee, while the fourth row would show Extended Framework (0471948470) overseen by the Regional Model committee.

**View `v_policy_domain_policy_domain`**

```sql
CREATE VIEW v_policy_domain_policy_domain AS
SELECT a.domain_code, a.domain_name, a.regulatory_scope, a.enforcement_agency, b.domain_code AS domain_domain_code, b.domain_name AS domain_domain_name, b.regulatory_scope AS domain_regulatory_scope
FROM policy_domains a JOIN policy_domains b ON a.overlaps_with_domain_code = b.domain_code;
```

| domain_code | domain_name | regulatory_scope | enforcement_agency | domain_domain_code | domain_domain_name | domain_regulatory_scope |
|---|---|---|---|---|---|---|
| 4716398 | Regional Protocol | legacy-regulato-85 | China Unionpay Co. Ltd | 4716398 | Regional Protocol | legacy-regulato-85 |
| 605967 | Seasonal Programme D | compact-regulato-86 | Hamilton County Department of Education | 605967 | Seasonal Programme D | compact-regulato-86 |
| 16375765 | Integrated Standard | composite-regulato-87 | Petco Health and Wellness Company Inc. | 16375765 | Integrated Standard | composite-regulato-87 |
| 0471948470 | Extended Framework | primary-regulato-88 | Alexandria Real Estate Equities | 0471948470 | Extended Framework | primary-regulato-88 |

This self-referential view on policy domains reveals overlap relationships between regulatory territories. The overlaps_with_domain_code column in the base table creates a link from each domain to another, and this view makes those relationships explicit. In the current data, each domain overlaps with itself (the overlaps_with_domain_code matches the domain_code), suggesting a self-referential or identity relationship that may indicate domains that are entirely contained within or identical to another domain's scope.

**View `v_meeting_venue_committee_meeting`**

```sql
CREATE VIEW v_meeting_venue_committee_meeting AS
SELECT a.venue_id, a.venue_name, a.street_address, a.city, b.meeting_id AS meeting_meeting_id, b.scheduled_date_time AS meeting_scheduled_date_time, b.duration_minutes AS meeting_duration_minutes
FROM meeting_venues a JOIN committee_meetings b ON a.meeting_id = b.meeting_id;
```

| venue_id | venue_name | street_address | city | meeting_meeting_id | meeting_scheduled_date_time | meeting_duration_minutes |
|---|---|---|---|---|---|---|
| 2839523 | Legacy Review D | composite-street-15 | integrated-city-34 | 20967529 | 2023-10-18T21:03:00 | 35 |
| goh | Regional Initiative | primary-street-16 | seasonal-city-35 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 |
| 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 | regional-city-36 | gd_acc_763000 | 2025-08-13T11:37:00 | 41 |
| L296 | Integrated Cluster A | distributed-street-18 | legacy-city-37 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 |

This view joins meeting venues with their associated committee meetings, providing a venue-centric view of meeting scheduling. The first row would show Legacy Review D hosting meeting 20967529, scheduled for 2023-10-18 at 21:03, lasting 35 minutes, of type regular with status scheduled. The third row would show Seasonal Model hosting meeting gd_acc_763000 on 2025-08-13 at 11:37, lasting 41 minutes, of type emergency with status completed.

**View `v_committee_meeting_legislative_committee`**

```sql
CREATE VIEW v_committee_meeting_legislative_committee AS
SELECT a.meeting_id, a.scheduled_date_time, a.duration_minutes, a.meeting_type, b.id AS committee_id, b.committee_id AS committee_committee_id, b.committee_name AS committee_committee_name
FROM committee_meetings a JOIN legislative_committees b ON a.legislative_committee_id = b.id;
```

| meeting_id | scheduled_date_time | duration_minutes | meeting_type | committee_id | committee_committee_id | committee_committee_name |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | regular | 1 | PHR-98 | Composite Cluster |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | special | 2 | L785 | Compact Review A |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | emergency | 3 | 7119774 | Legacy Initiative |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | public_hearing | 4 | 1186094 | Regional Model |

This view connects committee meetings with their parent legislative committees, answering which committee convened each meeting. The first row would show meeting 20967529 (regular, scheduled, 35 minutes) convened by the Composite Cluster committee (PHR-98). The fourth row would show meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 (public_hearing, cancelled, 44 minutes) convened by the Regional Model committee (1186094).

**View `v_committee_meeting_meeting_venue`**

```sql
CREATE VIEW v_committee_meeting_meeting_venue AS
SELECT a.meeting_id, a.scheduled_date_time, a.duration_minutes, a.meeting_type, b.venue_id AS venue_venue_id, b.venue_name AS venue_venue_name, b.street_address AS venue_street_address
FROM committee_meetings a JOIN meeting_venues b ON a.venue_id = b.venue_id;
```

| meeting_id | scheduled_date_time | duration_minutes | meeting_type | venue_venue_id | venue_venue_name | venue_street_address |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | regular | 2839523 | Legacy Review D | composite-street-15 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | special | goh | Regional Initiative | primary-street-16 |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | emergency | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | adaptive-street-17 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | public_hearing | L296 | Integrated Cluster A | distributed-street-18 |

This view joins committee meetings with their venues, providing the location context for each session. The first row would pair meeting 20967529 with venue 2839523 (Legacy Review D), while the second row would pair meeting ChIJd13ymnZu5kcRXM7jx5boJBs with venue goh (Regional Initiative). This view is essential for understanding the geographic distribution of committee activities.

**View `v_committee_meeting_legislator_detail`**

```sql
CREATE VIEW v_committee_meeting_legislator_detail AS
SELECT a.meeting_id, a.scheduled_date_time, a.duration_minutes, b.id AS legislator_id, b.legislator_id AS legislator_legislator_id, b.full_name AS legislator_full_name
FROM committee_meetings a
  JOIN meetings_legislators j ON j.meeting_id = a.meeting_id
  JOIN legislators b ON b.id = j.legislator_id;
```

| meeting_id | scheduled_date_time | duration_minutes | legislator_id | legislator_legislator_id | legislator_full_name |
|---|---|---|---|---|---|
| 20967529 | 2023-10-18T21:03:00 | 35 | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |
| 20967529 | 2023-10-18T21:03:00 | 35 | 2 | 1996927 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | 2 | 1996927 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-02T04:20:00 | 38 | 3 | 20963968 | Saipan International Airport |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | 3 | 20963968 | Saipan International Airport |
| gd_acc_763000 | 2025-08-13T11:37:00 | 41 | 4 | 4843 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | 4 | 4843 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-24T18:54:00 | 44 | 1 | ChIJyQkrS_pt5kcRgcBUZri0Wao | Theodore Mcgrath |

This comprehensive view joins committee meetings with the legislators who attended, providing a complete picture of meeting participation. Each row would show a meeting's details (scheduled_date_time, duration, type, status) alongside the attending legislator's name and role. This view answers the question of which legislators were present at each session, supporting attendance tracking and quorum verification.

### Synthesis

The legislative governance system described here operates through a network of interlocking records: committees define organizational structure, legislators provide human agency, policy domains establish regulatory scope, venues supply physical infrastructure, and meetings instantiate the process in time. The base tables capture each entity in isolation, while the junction tables (committees_legislators, meetings_legislators, committees_domains) encode the relationships that give the system its operational character. The analytical views then reassemble these pieces into domain-specific narratives—rosters, jurisdiction maps, venue schedules, and attendance records—that support the practical work of legislative administration. The fictional entities in the current dataset, from the Composite Cluster committee to the Regional Protocol domain, illustrate how the system accommodates diverse organizational forms while maintaining a consistent relational structure.