## The Donation Management Domain

Charitable giving organizations manage a complex ecosystem of donors, gifts, designations, and communications. At the center of this ecosystem sits the donation record—a single transaction that connects a giver to a purpose, potentially honoring someone, directing funds to a specific program, and triggering notifications to interested parties. The domain captures every facet of this process: who gave, how much, when, whether the gift was anonymous or memorial, which fund received the money, and what follow-up communications were requested. The following sections describe the entities, their attributes, and the analytical views that bring them together into actionable information.

**Table `dono_donors`**

| donor_id | donor_name | street_address | city | state | zip_code | email_address | is_anonymous | donation_id | contact_request_id |
|---|---|---|---|---|---|---|---|---|---|
| 3012833 | Regional Framework | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | primary-email-70 | true | 1 | 1 |
| 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | adaptive-email-71 | false | 2 | 2 |
| 4793488 | Integrated Programme | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | distributed-email-72 | true | 3 | 3 |
| 3717626 | Extended Standard | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | baseline-email-73 | false | 4 | 4 |

The donor table stores the identity and contact information for every individual or organization that contributes. Each donor receives a unique identifier—`donor_id`—which serves as the primary key for all downstream references. The `donor_name` field holds the public-facing name, such as "Regional Framework" or "Seasonal Protocol D." Physical address data is captured across four columns: `street_address`, `city`, `state`, and `zip_code`, enabling postal correspondence and geographic analysis. The `email_address` column provides the electronic contact point, while `is_anonymous` is a boolean flag that, when true, suppresses the donor's identity from public-facing records. In the current dataset, donors with identifiers `3012833` and `4793488` are marked anonymous, whereas `05c8953a-8fc7-11eb-924d-9cd76263cbd0` and `3717626` are public. The table also carries `donation_id` and `contact_request_id` columns that link each donor to their most recent donation and their most recent contact request, respectively, creating a direct bridge to the transaction and engagement records.

**Table `dono_donations`**

| donation_id | amount | is_anonymous | is_memorial | is_honor | donation_date | donor_id | honoree_id | fund_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 13.49 | true | false | true | 2022-01-26 | 3012833 | 1 | 1 |
| 2 | 25.47 | false | true | false | 2023-06-10 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | 2 | 2 |
| 3 | 19.72 | true | false | true | 2024-11-21 | 4793488 | 3 | 3 |
| 4 | 12.74 | false | true | false | 2025-04-05 | 3717626 | 4 | 4 |

Donations form the transactional core of the domain. Each row in the donations table represents a single gift, identified by `donation_id` and characterized by its `amount`—a decimal value such as 13.49, 25.47, 19.72, or 12.74 in the current records. The `is_anonymous` flag on the donation itself may differ from the donor's anonymous status, allowing a non-anonymous donor to give privately or an anonymous donor to have their gift attributed. The `is_memorial` and `is_honor` booleans distinguish the nature of the designation: a memorial gift honors someone who has passed, while an honor gift celebrates someone still living. The `donation_date` records when the gift was received. Foreign keys `donor_id`, `honoree_id`, and `fund_id` connect the transaction to the donor, the honoree, and the receiving fund, respectively. In the sample data, donation 1 is anonymous and an honor gift to honoree 1 in fund 1, while donation 2 is a memorial gift to honoree 2 in fund 2.

**Table `dono_honorees`**

| honoree_id | honoree_name | is_memorial | donation_id | notification_contact_id |
|---|---|---|---|---|
| 1 | Baseline Standard D | false | 1 | 1 |
| 2 | Distributed Framework | true | 2 | 2 |
| 3 | Adaptive Protocol | false | 3 | 3 |
| 4 | Primary Programme A | true | 4 | 4 |

Honorees represent the individuals or entities being recognized through memorial or honor gifts. The `honoree_id` is the primary key, and `honoree_name` holds the name—such as "Baseline Standard D" or "Distributed Framework." The `is_memorial` column mirrors the donation's memorial flag, indicating whether the recognition is posthumous. The `donation_id` foreign key ties the honoree back to the specific gift that triggered the recognition, and `notification_contact_id` links to the person who should be notified about the gift. This creates a chain: a donor gives, the gift designates an honoree, and a notification contact receives word of the gesture.

**Table `dono_notification_contacts`**

| id | contact_id | contact_name | street_address | city | state | zip_code | relationship | honoree_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Susan Wagner | Kenneth Smith | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | Spouse | 1 |
| 2 | Theodore Mcgrath | Michelle Kelley | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | Sibling | 2 |
| 3 | Editorial Status | Kimberly Myers | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | Parent | 3 |
| 4 | Peter Mcdowell | Tasha Rodriguez | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | Child | 4 |

Notification contacts are the people who should be informed when a gift is made in their honor or memory. Each contact has a surrogate `id` primary key and a `contact_id` that may carry a separate system identifier. The `contact_name` field stores the full name—Susan Wagner, Theodore Mcgrath, Editorial Status, and Peter Mcdowell appear in the current records. Address information is captured in `street_address`, `city`, `state`, and `zip_code`, while the `relationship` column describes the contact's connection to the honoree: Spouse, Sibling, Parent, or Child. The `honoree_id` foreign key establishes which honoree this contact is associated with, completing the notification chain from gift to recipient.

**Table `dono_funds`**

| id | fund_id | fund_name | fund_description | donation_id |
|---|---|---|---|---|
| 1 | 3158147 | Seasonal Programme | Adaptive Cluster | 1 |
| 2 | 6510 | Integrated Standard | Primary Review | 2 |
| 3 | lu_tax_code_template_m_I | Extended Framework D | Composite Initiative D | 3 |
| 4 | 3990185 | Pilot Protocol | Compact Model | 4 |

Funds represent the programs, initiatives, or designations that receive donated money. Each fund has a surrogate `id`, a `fund_id` that may serve as an external identifier, a `fund_name` such as "Seasonal Programme" or "Integrated Standard," and a `fund_description` providing additional context like "Adaptive Cluster" or "Primary Review." The `donation_id` foreign key links each fund record to the donation it received, enabling traceability from fund back to the specific transaction that credited it.

**Table `dono_contact_requests`**

| contact_request_id | request_id | discuss_deferred_giving | volunteer_time | join_newsletter | donor_id |
|---|---|---|---|---|---|
| 1 | 2087732 | true | true | false | 3012833 |
| 2 | 575213 | false | false | true | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 |
| 3 | 103167 | true | true | false | 4793488 |
| 4 | 611510 | false | false | true | 3717626 |

Contact requests capture a donor's expressed interest in further engagement with the organization. The `contact_request_id` is the primary key, and `request_id` may carry an external identifier. Three boolean columns record the donor's preferences: `discuss_deferred_giving` indicates interest in planned or deferred giving options, `volunteer_time` signals willingness to volunteer, and `join_newsletter` records a request to be added to the mailing list. In the current data, donors with identifiers `3012833` and `4793488` expressed interest in both deferred giving and volunteering but not the newsletter, while donors `05c8953a-8fc7-11eb-924d-9cd76263cbd0` and `3717626` requested the newsletter but not the other engagements. The `donor_id` foreign key ties the request to the requesting donor.

### Analytical Views

The domain provides a set of joined views that combine base tables to answer specific operational questions. Each view presents a particular relational perspective, bringing together entities that are otherwise separated across tables.

**View `v_donor_donation`**

```sql
CREATE VIEW v_donor_donation AS
SELECT a.donor_id, a.donor_name, a.street_address, a.city, b.donation_id AS donation_donation_id, b.amount AS donation_amount, b.is_anonymous AS donation_is_anonymous
FROM dono_donors a JOIN dono_donations b ON a.donation_id = b.donation_id;
```

| donor_id | donor_name | street_address | city | donation_donation_id | donation_amount | donation_is_anonymous |
|---|---|---|---|---|---|---|
| 3012833 | Regional Framework | composite-street-15 | integrated-city-34 | 1 | 13.49 | true |
| 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | 2 | 25.47 | false |
| 4793488 | Integrated Programme | adaptive-street-17 | regional-city-36 | 3 | 19.72 | true |
| 3717626 | Extended Standard | distributed-street-18 | legacy-city-37 | 4 | 12.74 | false |

The donor-donation view answers the question: what has each donor given? It joins the donor table with the donations table, producing rows that pair donor identity with transaction details. A row for donor `3012833` (Regional Framework) would show an anonymous honor gift of 13.49 dated 2022-01-26, while a row for donor `05c8953a-8fc7-11eb-924d-9cd76263cbd0` (Seasonal Protocol D) would show a public memorial gift of 25.47 dated 2023-06-10. This view supports donor history reports and giving pattern analysis.

**View `v_donor_contact_request`**

```sql
CREATE VIEW v_donor_contact_request AS
SELECT a.donor_id, a.donor_name, a.street_address, a.city, b.contact_request_id AS request_contact_request_id, b.request_id AS request_request_id, b.discuss_deferred_giving AS request_discuss_deferred_giving
FROM dono_donors a JOIN dono_contact_requests b ON a.contact_request_id = b.contact_request_id;
```

| donor_id | donor_name | street_address | city | request_contact_request_id | request_request_id | request_discuss_deferred_giving |
|---|---|---|---|---|---|---|
| 3012833 | Regional Framework | composite-street-15 | integrated-city-34 | 1 | 2087732 | true |
| 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | 2 | 575213 | false |
| 4793488 | Integrated Programme | adaptive-street-17 | regional-city-36 | 3 | 103167 | true |
| 3717626 | Extended Standard | distributed-street-18 | legacy-city-37 | 4 | 611510 | false |

This view joins donors with their contact requests, answering: which donors have expressed engagement preferences and what are those preferences? A row for donor `3012833` would show `discuss_deferred_giving` as true, `volunteer_time` as true, and `join_newsletter` as false, while a row for donor `05c8953a-8fc7-11eb-924d-9cd76263cbd0` would show the opposite pattern on all three flags. Staff use this view to prioritize outreach and match donor interests to appropriate programs.

**View `v_donation_donor`**

```sql
CREATE VIEW v_donation_donor AS
SELECT a.donation_id, a.amount, a.is_anonymous, a.is_memorial, b.donor_id AS donor_donor_id, b.donor_name AS donor_donor_name, b.street_address AS donor_street_address
FROM dono_donations a JOIN dono_donors b ON a.donor_id = b.donor_id;
```

| donation_id | amount | is_anonymous | is_memorial | donor_donor_id | donor_donor_name | donor_street_address |
|---|---|---|---|---|---|---|
| 1 | 13.49 | true | false | 3012833 | Regional Framework | composite-street-15 |
| 2 | 25.47 | false | true | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | primary-street-16 |
| 3 | 19.72 | true | false | 4793488 | Integrated Programme | adaptive-street-17 |
| 4 | 12.74 | false | true | 3717626 | Extended Standard | distributed-street-18 |

The donation-donor view presents the same relationship from the transaction's perspective: for each donation, who is the donor? This inversion is useful when starting from a gift record and needing to identify the giver. A row for donation 1 would resolve to donor `3012833` (Regional Framework), and a row for donation 2 would resolve to donor `05c8953a-8fc7-11eb-924d-9cd76263cbd0` (Seasonal Protocol D).

**View `v_donation_honoree`**

```sql
CREATE VIEW v_donation_honoree AS
SELECT a.donation_id, a.amount, a.is_anonymous, a.is_memorial, b.honoree_id AS honoree_honoree_id, b.honoree_name AS honoree_honoree_name, b.is_memorial AS honoree_is_memorial
FROM dono_donations a JOIN dono_honorees b ON a.honoree_id = b.honoree_id;
```

| donation_id | amount | is_anonymous | is_memorial | honoree_honoree_id | honoree_honoree_name | honoree_is_memorial |
|---|---|---|---|---|---|---|
| 1 | 13.49 | true | false | 1 | Baseline Standard D | false |
| 2 | 25.47 | false | true | 2 | Distributed Framework | true |
| 3 | 19.72 | true | false | 3 | Adaptive Protocol | false |
| 4 | 12.74 | false | true | 4 | Primary Programme A | true |

This view joins donations with honorees, answering: which honoree is associated with each donation? A row for donation 1 would show honoree "Baseline Standard D" with `is_memorial` as false, indicating an honor gift. A row for donation 2 would show honoree "Distributed Framework" with `is_memorial` as true, indicating a memorial gift. This view supports the generation of honor and memorial notification letters.

**View `v_donation_fund`**

```sql
CREATE VIEW v_donation_fund AS
SELECT a.donation_id, a.amount, a.is_anonymous, a.is_memorial, b.id AS fund_id, b.fund_id AS fund_fund_id, b.fund_name AS fund_fund_name
FROM dono_donations a JOIN dono_funds b ON a.fund_id = b.id;
```

| donation_id | amount | is_anonymous | is_memorial | fund_id | fund_fund_id | fund_fund_name |
|---|---|---|---|---|---|---|
| 1 | 13.49 | true | false | 1 | 3158147 | Seasonal Programme |
| 2 | 25.47 | false | true | 2 | 6510 | Integrated Standard |
| 3 | 19.72 | true | false | 3 | lu_tax_code_template_m_I | Extended Framework D |
| 4 | 12.74 | false | true | 4 | 3990185 | Pilot Protocol |

The donation-fund view links each donation to its receiving fund. A row for donation 1 would show fund "Seasonal Programme" with description "Adaptive Cluster," while a row for donation 2 would show fund "Integrated Standard" with description "Primary Review." This view is essential for fund-level reporting and financial reconciliation.

**View `v_honoree_donation`**

```sql
CREATE VIEW v_honoree_donation AS
SELECT a.honoree_id, a.honoree_name, a.is_memorial, a.notification_contact_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount, b.is_anonymous AS donation_is_anonymous
FROM dono_honorees a JOIN dono_donations b ON a.donation_id = b.donation_id;
```

| honoree_id | honoree_name | is_memorial | notification_contact_id | donation_donation_id | donation_amount | donation_is_anonymous |
|---|---|---|---|---|---|---|
| 1 | Baseline Standard D | false | 1 | 1 | 13.49 | true |
| 2 | Distributed Framework | true | 2 | 2 | 25.47 | false |
| 3 | Adaptive Protocol | false | 3 | 3 | 19.72 | true |
| 4 | Primary Programme A | true | 4 | 4 | 12.74 | false |

Presenting the honoree-to-donation relationship, this view answers: what donation is associated with each honoree? A row for honoree "Baseline Standard D" would resolve to donation 1, amount 13.49, while a row for honoree "Distributed Framework" would resolve to donation 2, amount 25.47. This perspective is useful for honoree-centric reports and acknowledgment tracking.

**View `v_honoree_notification_contact`**

```sql
CREATE VIEW v_honoree_notification_contact AS
SELECT a.honoree_id, a.honoree_name, a.is_memorial, a.donation_id, b.id AS contact_id, b.contact_id AS contact_contact_id, b.contact_name AS contact_contact_name
FROM dono_honorees a JOIN dono_notification_contacts b ON a.notification_contact_id = b.id;
```

| honoree_id | honoree_name | is_memorial | donation_id | contact_id | contact_contact_id | contact_contact_name |
|---|---|---|---|---|---|---|
| 1 | Baseline Standard D | false | 1 | 1 | Susan Wagner | Kenneth Smith |
| 2 | Distributed Framework | true | 2 | 2 | Theodore Mcgrath | Michelle Kelley |
| 3 | Adaptive Protocol | false | 3 | 3 | Editorial Status | Kimberly Myers |
| 4 | Primary Programme A | true | 4 | 4 | Peter Mcdowell | Tasha Rodriguez |

This view joins honorees with their notification contacts, answering: who should be notified for each honoree? A row for honoree "Baseline Standard D" would show notification contact Susan Wagner with relationship "Spouse," while a row for honoree "Distributed Framework" would show Theodore Mcgrath with relationship "Sibling." This view drives the automated notification workflow.

**View `v_notification_contact_honoree`**

```sql
CREATE VIEW v_notification_contact_honoree AS
SELECT a.id, a.contact_id, a.contact_name, a.street_address, b.honoree_id AS honoree_honoree_id, b.honoree_name AS honoree_honoree_name, b.is_memorial AS honoree_is_memorial
FROM dono_notification_contacts a JOIN dono_honorees b ON a.honoree_id = b.honoree_id;
```

| id | contact_id | contact_name | street_address | honoree_honoree_id | honoree_honoree_name | honoree_is_memorial |
|---|---|---|---|---|---|---|
| 1 | Susan Wagner | Kenneth Smith | composite-street-15 | 1 | Baseline Standard D | false |
| 2 | Theodore Mcgrath | Michelle Kelley | primary-street-16 | 2 | Distributed Framework | true |
| 3 | Editorial Status | Kimberly Myers | adaptive-street-17 | 3 | Adaptive Protocol | false |
| 4 | Peter Mcdowell | Tasha Rodriguez | distributed-street-18 | 4 | Primary Programme A | true |

The notification contact-to-honoree view inverts the relationship, answering: which honoree is this contact associated with? A row for contact Susan Wagner would resolve to honoree "Baseline Standard D," and a row for contact Peter Mcdowell would resolve to honoree "Primary Programme A." This perspective supports contact management and relationship auditing.

**View `v_fund_donation`**

```sql
CREATE VIEW v_fund_donation AS
SELECT a.id, a.fund_id, a.fund_name, a.fund_description, b.donation_id AS donation_donation_id, b.amount AS donation_amount, b.is_anonymous AS donation_is_anonymous
FROM dono_funds a JOIN dono_donations b ON a.donation_id = b.donation_id;
```

| id | fund_id | fund_name | fund_description | donation_donation_id | donation_amount | donation_is_anonymous |
|---|---|---|---|---|---|---|
| 1 | 3158147 | Seasonal Programme | Adaptive Cluster | 1 | 13.49 | true |
| 2 | 6510 | Integrated Standard | Primary Review | 2 | 25.47 | false |
| 3 | lu_tax_code_template_m_I | Extended Framework D | Composite Initiative D | 3 | 19.72 | true |
| 4 | 3990185 | Pilot Protocol | Compact Model | 4 | 12.74 | false |

This view joins funds with their donations, answering: which donations credited each fund? A row for fund "Seasonal Programme" would show donation 1, amount 13.49, while a row for fund "Pilot Protocol" would show donation 4, amount 12.74. This view enables fund-level aggregation and budget tracking.

**View `v_contact_request_donor`**

```sql
CREATE VIEW v_contact_request_donor AS
SELECT a.contact_request_id, a.request_id, a.discuss_deferred_giving, a.volunteer_time, b.donor_id AS donor_donor_id, b.donor_name AS donor_donor_name, b.street_address AS donor_street_address
FROM dono_contact_requests a JOIN dono_donors b ON a.donor_id = b.donor_id;
```

| contact_request_id | request_id | discuss_deferred_giving | volunteer_time | donor_donor_id | donor_donor_name | donor_street_address |
|---|---|---|---|---|---|---|
| 1 | 2087732 | true | true | 3012833 | Regional Framework | composite-street-15 |
| 2 | 575213 | false | false | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | primary-street-16 |
| 3 | 103167 | true | true | 4793488 | Integrated Programme | adaptive-street-17 |
| 4 | 611510 | false | false | 3717626 | Extended Standard | distributed-street-18 |

The contact request-to-donor view answers: which donor made each contact request? A row for contact request with `request_id` 2087732 would resolve to donor `3012833` (Regional Framework), while a row for `request_id` 575213 would resolve to donor `05c8953a-8fc7-11eb-924d-9cd76263cbd0` (Seasonal Protocol D). This view supports engagement pipeline management and follow-up scheduling.

### Synthesis

The donation management domain models a complete giving lifecycle: a donor makes a contribution that may honor or memorialize someone, directs funds to a specific program, and optionally requests further engagement. The base tables capture each entity in isolation—donors, transactions, honorees, contacts, funds, and requests—while the joined views synthesize these entities into the relational perspectives that operational staff actually need. Whether answering "what has this donor given?" or "who should be notified about this honor gift?", the domain's structure provides a consistent, queryable foundation for managing the full spectrum of charitable giving operations.