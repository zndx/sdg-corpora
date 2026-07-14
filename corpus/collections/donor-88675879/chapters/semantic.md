The donation management domain captures the full lifecycle of charitable giving: a donor initiates a contribution, optionally designates an honoree, allocates the gift to a fund, and may request future engagement. The relational model normalizes this workflow across six base tables, each anchoring a distinct entity type, while a suite of ten views materializes the most common analytical joins as flat, query-ready surfaces. Understanding the schema requires tracing how entity attributes become columns, how cardinality-bounded relationships become foreign keys and junction tables, and how each view reconstructs a domain fact from the normalized grain.

## Base Tables and Entity Types

The schema's backbone is the `dono_donors` table, which stores the canonical donor profile. Each row is identified by `donor_id` and carries the donor's `donor_name`, full `street_address`, `city`, `state`, `zip_code`, and `email_address`. A boolean `is_anonymous` flag controls whether the donor's identity is suppressed in public-facing outputs. The table also embeds two foreign-key columns — `donation_id` and `contact_request_id` — that point into the donations and contact-request streams, respectively. In the sample data, donor `3012833` named "Regional Framework" resides at `composite-street-15` in `integrated-city-34`, is marked anonymous, and is linked to donation `1` and contact request `1`. By contrast, donor `05c8953a-8fc7-11eb-924d-9cd76263cbd0` ("Seasonal Protocol D") is non-anonymous and associated with donation `2` and contact request `2`.

**Table `dono_donors`**

| donor_id | donor_name | street_address | city | state | zip_code | email_address | is_anonymous | donation_id | contact_request_id |
|---|---|---|---|---|---|---|---|---|---|
| 3012833 | Regional Framework | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | primary-email-70 | true | 1 | 1 |
| 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | adaptive-email-71 | false | 2 | 2 |
| 4793488 | Integrated Programme | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | distributed-email-72 | true | 3 | 3 |
| 3717626 | Extended Standard | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | baseline-email-73 | false | 4 | 4 |

The `dono_donations` table records each monetary gift. Its primary key is `donation_id`, and the core attribute is `amount`, stored as a decimal (e.g., `13.49`, `25.47`, `19.72`, `12.74`). Three boolean flags — `is_anonymous`, `is_memorial`, and `is_honor` — classify the gift's visibility and purpose. The `donation_date` column captures the transaction timestamp. Three foreign keys anchor the donation to its context: `donor_id` references `dono_donors`, `honoree_id` references `dono_honorees`, and `fund_id` references `dono_funds`. Donation `1` of `13.49` is anonymous and honor-designated but not memorial, given by donor `3012833` to honoree `1` under fund `1`.

**Table `dono_donations`**

| donation_id | amount | is_anonymous | is_memorial | is_honor | donation_date | donor_id | honoree_id | fund_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 13.49 | true | false | true | 2022-01-26 | 3012833 | 1 | 1 |
| 2 | 25.47 | false | true | false | 2023-06-10 | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 | 2 | 2 |
| 3 | 19.72 | true | false | true | 2024-11-21 | 4793488 | 3 | 3 |
| 4 | 12.74 | false | true | false | 2025-04-05 | 3717626 | 4 | 4 |

Honorees are captured in `dono_honorees`, a table whose rows represent individuals or entities being recognized by a donation. The primary key is `honoree_id`, and the `honoree_name` column stores the recognized party's name (e.g., "Baseline Standard D", "Distributed Framework"). The `is_memorial` boolean distinguishes memorial recognitions from honor recognitions. A `donation_id` foreign key ties the honoree back to the gift that triggered the recognition, and `notification_contact_id` points to the `dono_notification_contacts` table for follow-up communication. Honoree `1` ("Baseline Standard D") is non-memorial and linked to donation `1` and notification contact `1`.

**Table `dono_honorees`**

| honoree_id | honoree_name | is_memorial | donation_id | notification_contact_id |
|---|---|---|---|---|
| 1 | Baseline Standard D | false | 1 | 1 |
| 2 | Distributed Framework | true | 2 | 2 |
| 3 | Adaptive Protocol | false | 3 | 3 |
| 4 | Primary Programme A | true | 4 | 4 |

Notification contacts are stored in `dono_notification_contacts`. Each row represents a person who should be notified about a recognition. The table uses `id` as its primary key and `contact_id` as a secondary identifier. The `contact_name` column holds the person's name (e.g., "Susan Wagner", "Theodore Mcgrath"), and the usual address fields (`street_address`, `city`, `state`, `zip_code`) are present. The `relationship` column records the relationship of the contact to the honoree — values in the sample include "Spouse", "Sibling", "Parent", and "Child". The `honoree_id` foreign key links the contact to the honoree they should be notified about. Contact `1` ("Susan Wagner") is the spouse of honoree `1`.

**Table `dono_notification_contacts`**

| id | contact_id | contact_name | street_address | city | state | zip_code | relationship | honoree_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Susan Wagner | Kenneth Smith | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | Spouse | 1 |
| 2 | Theodore Mcgrath | Michelle Kelley | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | Sibling | 2 |
| 3 | Editorial Status | Kimberly Myers | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | Parent | 3 |
| 4 | Peter Mcdowell | Tasha Rodriguez | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | Child | 4 |

Funds are cataloged in `dono_funds`, which defines the charitable buckets into which donations are allocated. The table's primary key is `id`, with a secondary `fund_id` column. The `fund_name` and `fund_description` columns describe the fund (e.g., "Seasonal Programme" with description "Adaptive Cluster", "Integrated Standard" with description "Primary Review"). A `donation_id` foreign key ties each fund row to the specific donation it received. Fund `1` ("Seasonal Programme") received donation `1`.

**Table `dono_funds`**

| id | fund_id | fund_name | fund_description | donation_id |
|---|---|---|---|---|
| 1 | 3158147 | Seasonal Programme | Adaptive Cluster | 1 |
| 2 | 6510 | Integrated Standard | Primary Review | 2 |
| 3 | lu_tax_code_template_m_I | Extended Framework D | Composite Initiative D | 3 |
| 4 | 3990185 | Pilot Protocol | Compact Model | 4 |

Contact requests are recorded in `dono_contact_requests`, capturing a donor's preferences for future engagement. The primary key is `contact_request_id`, and `request_id` serves as a secondary identifier. Three boolean columns — `discuss_deferred_giving`, `volunteer_time`, and `join_newsletter` — encode the donor's interests. The `donor_id` foreign key links the request to the requesting donor. Contact request `1` (request ID `2087732`) from donor `3012833` indicates interest in both deferred giving discussions and volunteering, but not the newsletter.

**Table `dono_contact_requests`**

| contact_request_id | request_id | discuss_deferred_giving | volunteer_time | join_newsletter | donor_id |
|---|---|---|---|---|---|
| 1 | 2087732 | true | true | false | 3012833 |
| 2 | 575213 | false | false | true | 05c8953a-8fc7-11eb-924d-9cd76263cbd0 |
| 3 | 103167 | true | true | false | 4793488 |
| 4 | 611510 | false | false | true | 3717626 |

## Views and Materialized Joins

Each view in the schema is a named join that reconstructs a domain fact from the normalized base tables. The views fall into two categories: donor-centric views that pair a donor with a related entity, and donation-centric views that pair a donation with its honoree, fund, or donor.

The view `v_donor_donation` joins `dono_donors` to `dono_donations` on `donor_id`, producing a flat row that answers "what did this donor give, and under what flags?" Reading the first row: donor `3012833` ("Regional Framework") made donation `1` for `13.49`, which is anonymous and honor-designated.

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

The view `v_donor_contact_request` joins `dono_donors` to `dono_contact_requests` on `donor_id`, answering "what engagement preferences did this donor express?" The first row shows donor `3012833` requested discussion of deferred giving (`true`), offered to volunteer (`true`), and declined the newsletter (`false`).

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

The view `v_donation_donor` performs the inverse join of `v_donor_donation`, pairing each donation with its donor's profile. This view answers "who gave this donation, and what is their contact information?" The first row reveals that donation `1` of `13.49` came from donor `3012833` ("Regional Framework") at `composite-street-15`, `integrated-city-34`, with email `primary-email-70`.

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

The view `v_donation_honoree` joins `dono_donations` to `dono_honorees` on `donation_id`, answering "which honoree is this donation recognizing?" The first row shows donation `1` recognizes honoree `1` ("Baseline Standard D"), which is not a memorial. The second row shows donation `2` recognizes honoree `2` ("Distributed Framework"), which is memorial (`is_memorial = true`).

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

The view `v_donation_fund` joins `dono_donations` to `dono_funds` on `donation_id`, answering "which fund received this donation?" The first row maps donation `1` to fund `1` ("Seasonal Programme", description "Adaptive Cluster"). The third row maps donation `3` to fund `3` ("Extended Framework D", description "Composite Initiative D").

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

The view `v_honoree_donation` joins `dono_honorees` to `dono_donations` on `donation_id`, answering "which donation triggered this honoree recognition?" The first row shows honoree `1` ("Baseline Standard D") was recognized by donation `1` of `13.49`. The fourth row shows honoree `4` ("Primary Programme A") was recognized by donation `4` of `12.74`, which is a memorial gift.

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

The view `v_honoree_notification_contact` joins `dono_honorees` to `dono_notification_contacts` on `honoree_id`, answering "who should be notified about this honoree recognition?" The first row shows honoree `1` should trigger notification to contact `1` ("Susan Wagner"), who is the spouse. The second row shows honoree `2` should trigger notification to contact `2` ("Theodore Mcgrath"), who is the sibling.

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

The view `v_notification_contact_honoree` performs the inverse join of `v_honoree_notification_contact`, pairing each notification contact with the honoree they should be notified about. The first row shows contact `1` ("Susan Wagner") should be notified about honoree `1` ("Baseline Standard D"). The fourth row shows contact `4` ("Peter Mcdowell") should be notified about honoree `4` ("Primary Programme A"), and the relationship is "Child".

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

The view `v_fund_donation` joins `dono_funds` to `dono_donations` on `donation_id`, answering "which donation was allocated to this fund?" The first row shows fund `1` ("Seasonal Programme") received donation `1` of `13.49`. The fourth row shows fund `4` ("Pilot Protocol", description "Compact Model") received donation `4` of `12.74`.

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

The view `v_contact_request_donor` joins `dono_contact_requests` to `dono_donors` on `donor_id`, answering "which donor made this contact request, and what are their preferences?" The first row shows contact request `1` (request ID `2087732`) was made by donor `3012833` ("Regional Framework"), who wants to discuss deferred giving and volunteer but not join the newsletter. The second row shows contact request `2` (request ID `575213`) was made by donor `05c8953a-8fc7-11eb-924d-9cd76263cbd0` ("Seasonal Protocol D"), who wants to join the newsletter but not discuss deferred giving or volunteer.

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

## Synthesis

The donation schema models a domain where a single gift can simultaneously carry multiple dimensions of meaning: it has a monetary value, an anonymous or public identity, a memorial or honor designation, a recipient honoree, a destination fund, and a donor who may also express future engagement preferences. The six base tables normalize these dimensions into entity-specific grains — donors, donations, honorees, notification contacts, funds, and contact requests — linked by foreign keys that enforce referential integrity. The ten views then materialize the most common analytical perspectives as flat, denormalized surfaces, each answering a specific question about the domain by joining exactly two base tables. Together, the base tables and views provide a complete relational representation of the charitable giving workflow, from gift initiation through recognition and follow-up.