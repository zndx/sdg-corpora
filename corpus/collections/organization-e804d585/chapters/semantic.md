The gambling compliance ecosystem tracks how organizations conduct regulated games of chance, how the proceeds from those games are held in dedicated funds, how those funds flow into political campaigns, and which statutes govern each link in the chain. Five base tables capture this lifecycle in normalized form, and ten materialized views reassemble the facts for reporting. The tables are `organizations`, `gambling_activities`, `gambling_funds`, `campaigns`, and `regulatory_statutes`.

**Table `organizations`**

| organization_id | organization_name | registration_status | organization_type | contact_phone_number | website_url | gambling_activity_id |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | registered_with_secretary_of_state | fraternal | Theodore Mcgrath | https://github.com/chiphuyen/lazynlp | 100 |
| 2 | Oscar Health Inc. | irs_nonprofit_designation | religious | Peter Mcdowell | https://bugs.launchpad.net/ironic/+bug/1346406 | 101 |
| 3 | Atlantic Richfield | unregistered | veterans | Collin Lopez | http://en.wikipedia.org/wiki/Hyla_femoralis | 102 |
| 4 | Port Loko | registered_with_secretary_of_state | other_nonprofit | Steve Martin | https://www.nature.com/articles/nphoton.2014.41 | 103 |

The `organizations` table anchors the domain. Each row represents a legal entity that is permitted to run a gambling activity. The primary key is `organization_id`; the second column, `organization_name`, carries the human-readable label such as `Staples Inc.` or `Oscar Health Inc.`. Registration status is captured in `registration_status`, whose domain values include `registered_with_secretary_of_state`, `irs_nonprofit_designation`, and `unregistered`. The `organization_type` column classifies the entity as `fraternal`, `religious`, `veterans`, or `other_nonprofit`. Contact information lives in `contact_phone_number` (which, in this dataset, stores names like `Theodore Mcgrath` and `Peter Mcdowell`) and `website_url` (a full HTTPS or HTTP URL). The foreign key `gambling_activity_id` points into `gambling_activities.id`, establishing that every organization is associated with exactly one gambling activity. In the sample data, `Staples Inc.` (row 1) is linked to activity `100`, `Oscar Health Inc.` (row 2) to activity `101`, and so on through `Port Loko` (row 4) linked to activity `103`.

**Table `gambling_activities`**

| id | activity_id | activity_name | is_consideration_required | legal_status | start_date | end_date | organization_id | gambling_fund_id | regulatory_statute_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | raffle | false | lawful | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 100 | 1 |
| 101 | 4180957 | drawing | true | unlawful | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 101 | 2 |
| 102 | 168545 | pull-tab | false | pending_review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 102 | 3 |
| 103 | default_chart_a_account_53 | tipboard | true | lawful | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 103 | 4 |

The `gambling_activities` table describes the regulated games themselves. Its surrogate primary key is `id`, while the business-level identifier `activity_id` carries values such as `8843761` for a raffle or `default_chart_a_account_53` for a tipboard. The `activity_name` column holds the human-readable label (`raffle`, `drawing`, `pull-tab`, `tipboard`). Boolean flag `is_consideration_required` indicates whether participants must pay to enter; `legal_status` classifies the activity as `lawful`, `unlawful`, or `pending_review`. Temporal boundaries are stored in `start_date` and `end_date` as ISO-8601 timestamps. Three foreign keys complete the row: `organization_id` references `organizations.organization_id`, `gambling_fund_id` references `gambling_funds.id`, and `regulatory_statute_id` references `regulatory_statutes.regulatory_statute_id`. For instance, row 100 (the raffle run by `Staples Inc.`) has `gambling_fund_id = 100` and `regulatory_statute_id = 1`, tying the activity to a specific fund and statute.

**Table `gambling_funds`**

| id | fund_id | fund_amount | currency_code | source_activity_id | restriction_status | gambling_activity_id | campaign_id |
|---|---|---|---|---|---|---|---|
| 100 | 3158147 | 11.11 | gd_fp_eu_acc3 | gd_taxc_1113 | restricted_from_political_use | 100 | 1 |
| 101 | 6510 | 29.24 | managing-resources | 8843764 | unrestricted | 101 | 2 |
| 102 | lu_tax_code_template_m_I | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 69423 | pending_allocation | 102 | 3 |
| 103 | 3990185 | 22.35 | 10445649 | 4716393 | restricted_from_political_use | 103 | 4 |

Proceeds from gambling activities are held in `gambling_funds`. The surrogate primary key `id` aligns with the `gambling_fund_id` in `gambling_activities`, so row 100 in this table corresponds to the fund backing the raffle. The business identifier `fund_id` carries values like `3158147` or `lu_tax_code_template_m_I`. The monetary amount is stored in `fund_amount` (e.g., `11.11`, `29.24`). The `currency_code` column uses opaque codes such as `gd_fp_eu_acc3` or `managing-resources`. The `source_activity_id` column references the original gambling activity that generated the funds (e.g., `gd_taxc_1113` or `8843764`). `restriction_status` constrains how the money may be spent: `restricted_from_political_use`, `unrestricted`, or `pending_allocation`. Two foreign keys link the fund forward and backward: `gambling_activity_id` points back to `gambling_activities.id`, and `campaign_id` points forward to `campaigns.campaign_id`. Row 100, for example, has `gambling_activity_id = 100` and `campaign_id = 1`.

**Table `campaigns`**

| campaign_id | campaign_name | candidate_name | office_sought | ballot_question | status | gambling_fund_id | regulatory_statute_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Framework | Composite Series | integrated-office-52 | distributed-ballot-96 | active | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Legacy Protocol | Compact Assessment A | seasonal-office-53 | baseline-ballot-97 | inactive | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Regional Programme A | Legacy Survey | regional-office-54 | pilot-ballot-98 | completed | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Seasonal Standard | Regional Corridor | legacy-office-55 | extended-ballot-99 | active | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Political campaigns receive allocations from gambling funds. The `campaigns` table stores one row per campaign, keyed by `campaign_id`. The `campaign_name` column holds labels such as `Compact Framework` or `Legacy Protocol A`. The `candidate_name` and `office_sought` columns describe the person and the political office; `ballot_question` carries an opaque identifier like `distributed-ballot-96`. The `status` column tracks lifecycle state (`active`, `inactive`, `completed`). Timestamps `created_at` and `updated_at` record when the campaign was opened and last modified. Two foreign keys anchor the campaign: `gambling_fund_id` references `gambling_funds.id`, and `regulatory_statute_id` references `regulatory_statutes.regulatory_statute_id`. Campaign 1 (`Compact Framework`) is linked to fund 100 and statute 1.

**Table `regulatory_statutes`**

| regulatory_statute_id | statute_id | statute_title | jurisdiction | effective_date | restriction_type | gambling_activity_id | campaign_id |
|---|---|---|---|---|---|---|---|
| 1 | 3744010 | Extended Framework | regional-jurisdic-30 | 2023-02-14 | prohibits_gambling_funds_for_political_use | 100 | 1 |
| 2 | 10238287 | Pilot Protocol A | legacy-jurisdic-31 | 2024-07-25 | defines_raffle_criteria | 101 | 2 |
| 3 | 6926373 | Baseline Programme | compact-jurisdic-32 | 2025-12-09 | authorizes_nonprofit_gambling | 102 | 3 |
| 4 | 4364 | Distributed Standard | composite-jurisdic-33 | 2022-05-20 | prohibits_gambling_funds_for_political_use | 103 | 4 |

The `regulatory_statutes` table codifies the legal framework. Its primary key is `regulatory_statute_id`; the business-level `statute_id` carries values like `3744010` or `4364`. The `statute_title` column holds human-readable names (`Extended Framework`, `Pilot Protocol A`). `jurisdiction` identifies the governing body (e.g., `regional-jurisdic-30`). The `effective_date` column records when the statute took effect. The `restriction_type` column specifies the nature of the constraint: `prohibits_gambling_funds_for_political_use`, `defines_raffle_criteria`, or `authorizes_nonprofit_gambling`. Two foreign keys tie the statute to the operational domain: `gambling_activity_id` references `gambling_activities.id`, and `campaign_id` references `campaigns.campaign_id`. Statute 1 (`Extended Framework`) applies to activity 100 and campaign 1.

The five tables form a directed chain of foreign keys. `organizations.gambling_activity_id → gambling_activities.id` links each entity to its regulated game. `gambling_activities.organization_id → organizations.organization_id` provides the reverse link. `gambling_activities.gambling_fund_id → gambling_funds.id` and `gambling_funds.gambling_activity_id → gambling_activities.id` create a bidirectional link between activities and their proceeds. `gambling_funds.campaign_id → campaigns.campaign_id` and `campaigns.gambling_fund_id → gambling_funds.id` connect funds to the political campaigns they finance. Finally, `gambling_activities.regulatory_statute_id → regulatory_statutes.regulatory_statute_id`, `campaigns.regulatory_statute_id → regulatory_statutes.regulatory_statute_id`, and the reverse references in `regulatory_statutes` bind every operational fact to its governing statute. The result is a star-like topology with `gambling_activities` and `regulatory_statutes` acting as central hubs.

**View `organization_gambling_activity_view`**

```sql
CREATE VIEW organization_gambling_activity_view AS
SELECT a.organization_id, a.organization_name, a.registration_status, a.organization_type, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM organizations a JOIN gambling_activities b ON a.gambling_activity_id = b.id;
```

| organization_id | organization_name | registration_status | organization_type | activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | registered_with_secretary_of_state | fraternal | 100 | 8843761 | raffle |
| 2 | Oscar Health Inc. | irs_nonprofit_designation | religious | 101 | 4180957 | drawing |
| 3 | Atlantic Richfield | unregistered | veterans | 102 | 168545 | pull-tab |
| 4 | Port Loko | registered_with_secretary_of_state | other_nonprofit | 103 | default_chart_a_account_53 | tipboard |

The view `organization_gambling_activity_view` answers the question "which gambling activity does each organization run?" It joins `organizations` to `gambling_activities` on `organizations.gambling_activity_id = gambling_activities.id` and projects the organization columns alongside the activity's surrogate `id` and business `activity_id`. The result for `Staples Inc.` shows `activity_activity_id = 8843761` and `activity_activity_name = raffle`, confirming that the fraternal organization operates a lawful raffle. `Oscar Health Inc.` is paired with `drawing` (activity `4180957`), `Atlantic Richfield` with `pull-tab` (activity `168545`), and `Port Loko` with `tipboard` (activity `default_chart_a_account_53`).

**View `gambling_activity_organization_view`**

```sql
CREATE VIEW gambling_activity_organization_view AS
SELECT a.id, a.activity_id, a.activity_name, a.is_consideration_required, b.organization_id AS organization_organization_id, b.organization_name AS organization_organization_name, b.registration_status AS organization_registration_status
FROM gambling_activities a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | activity_id | activity_name | is_consideration_required | organization_organization_id | organization_organization_name | organization_registration_status |
|---|---|---|---|---|---|---|
| 100 | 8843761 | raffle | false | 1 | Staples Inc. | registered_with_secretary_of_state |
| 101 | 4180957 | drawing | true | 2 | Oscar Health Inc. | irs_nonprofit_designation |
| 102 | 168545 | pull-tab | false | 3 | Atlantic Richfield | unregistered |
| 103 | default_chart_a_account_53 | tipboard | true | 4 | Port Loko | registered_with_secretary_of_state |

The view `gambling_activity_organization_view` reverses the perspective: "which organization runs each gambling activity?" It performs the same join but presents the activity as the driving row. Each row pairs an activity name with its sponsoring organization, enabling compliance officers to audit which entities are authorized to conduct each type of game.

**View `gambling_activity_gambling_fund_view`**

```sql
CREATE VIEW gambling_activity_gambling_fund_view AS
SELECT a.id, a.activity_id, a.activity_name, a.is_consideration_required, b.id AS fund_id, b.fund_id AS fund_fund_id, b.fund_amount AS fund_fund_amount
FROM gambling_activities a JOIN gambling_funds b ON a.gambling_fund_id = b.id;
```

| id | activity_id | activity_name | is_consideration_required | fund_id | fund_fund_id | fund_fund_amount |
|---|---|---|---|---|---|---|
| 100 | 8843761 | raffle | false | 100 | 3158147 | 11.11 |
| 101 | 4180957 | drawing | true | 101 | 6510 | 29.24 |
| 102 | 168545 | pull-tab | false | 102 | lu_tax_code_template_m_I | 12.72 |
| 103 | default_chart_a_account_53 | tipboard | true | 103 | 3990185 | 22.35 |

The view `gambling_activity_gambling_fund_view` answers "what fund is associated with each gambling activity?" It joins `gambling_activities` to `gambling_funds` on `gambling_activities.gambling_fund_id = gambling_funds.id`. For activity 100 (the raffle), the view surfaces fund 100 with `fund_amount = 11.11` and `restriction_status = restricted_from_political_use`, indicating that the proceeds from this lawful raffle are ring-fenced and cannot be diverted to political purposes. Activity 101 (the drawing) maps to fund 101 with `fund_amount = 29.24` and `restriction_status = unrestricted`, meaning those proceeds face no spending restriction.

**View `gambling_activity_regulatory_statute_view`**

```sql
CREATE VIEW gambling_activity_regulatory_statute_view AS
SELECT a.id, a.activity_id, a.activity_name, a.is_consideration_required, b.regulatory_statute_id AS statute_regulatory_statute_id, b.statute_id AS statute_statute_id, b.statute_title AS statute_statute_title
FROM gambling_activities a JOIN regulatory_statutes b ON a.regulatory_statute_id = b.regulatory_statute_id;
```

| id | activity_id | activity_name | is_consideration_required | statute_regulatory_statute_id | statute_statute_id | statute_statute_title |
|---|---|---|---|---|---|---|
| 100 | 8843761 | raffle | false | 1 | 3744010 | Extended Framework |
| 101 | 4180957 | drawing | true | 2 | 10238287 | Pilot Protocol A |
| 102 | 168545 | pull-tab | false | 3 | 6926373 | Baseline Programme |
| 103 | default_chart_a_account_53 | tipboard | true | 4 | 4364 | Distributed Standard |

The view `gambling_activity_regulatory_statute_view` answers "which statute governs each gambling activity?" It joins `gambling_activities` to `regulatory_statutes` on `gambling_activities.regulatory_statute_id = regulatory_statutes.regulatory_statute_id`. The raffle (activity 100) is governed by statute 1 (`Extended Framework`), whose `restriction_type` is `prohibits_gambling_funds_for_political_use`. The drawing (activity 101) falls under statute 2 (`Pilot Protocol A`), which `defines_raffle_criteria`. The pull-tab (activity 102) is covered by statute 3 (`Baseline Programme`), which `authorizes_nonprofit_gambling`. The tipboard (activity 103) is subject to statute 4 (`Distributed Standard`), again `prohibits_gambling_funds_for_political_use`.

**View `gambling_fund_gambling_activity_view`**

```sql
CREATE VIEW gambling_fund_gambling_activity_view AS
SELECT a.id, a.fund_id, a.fund_amount, a.currency_code, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM gambling_funds a JOIN gambling_activities b ON a.gambling_activity_id = b.id;
```

| id | fund_id | fund_amount | currency_code | activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|---|
| 100 | 3158147 | 11.11 | gd_fp_eu_acc3 | 100 | 8843761 | raffle |
| 101 | 6510 | 29.24 | managing-resources | 101 | 4180957 | drawing |
| 102 | lu_tax_code_template_m_I | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 102 | 168545 | pull-tab |
| 103 | 3990185 | 22.35 | 10445649 | 103 | default_chart_a_account_53 | tipboard |

The view `gambling_fund_gambling_activity_view` reverses the fund-to-activity link: "which gambling activity generated each fund?" It joins `gambling_funds` to `gambling_activities` on `gambling_funds.gambling_activity_id = gambling_activities.id`. Fund 100 traces back to activity 100 (raffle), fund 101 to activity 101 (drawing), and so on. This view is useful for fund auditors who need to verify that every fund has a legitimate source activity.

**View `gambling_fund_campaign_view`**

```sql
CREATE VIEW gambling_fund_campaign_view AS
SELECT a.id, a.fund_id, a.fund_amount, a.currency_code, b.campaign_id AS campaign_campaign_id, b.campaign_name AS campaign_campaign_name, b.candidate_name AS campaign_candidate_name
FROM gambling_funds a JOIN campaigns b ON a.campaign_id = b.campaign_id;
```

| id | fund_id | fund_amount | currency_code | campaign_campaign_id | campaign_campaign_name | campaign_candidate_name |
|---|---|---|---|---|---|---|
| 100 | 3158147 | 11.11 | gd_fp_eu_acc3 | 1 | Compact Framework | Composite Series |
| 101 | 6510 | 29.24 | managing-resources | 2 | Legacy Protocol | Compact Assessment A |
| 102 | lu_tax_code_template_m_I | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | Regional Programme A | Legacy Survey |
| 103 | 3990185 | 22.35 | 10445649 | 4 | Seasonal Standard | Regional Corridor |

The view `gambling_fund_campaign_view` answers "which campaign receives funds from each gambling fund?" It joins `gambling_funds` to `campaigns` on `gambling_funds.campaign_id = campaigns.campaign_id`. Fund 100 feeds campaign 1 (`Compact Framework`), fund 101 feeds campaign 2 (`Legacy Protocol A`), fund 102 feeds campaign 3 (`Regional Programme A`), and fund 103 feeds campaign 4 (`Seasonal Standard`). The view lets regulators trace the flow of money from regulated games through to political campaigns.

**View `campaign_gambling_fund_view`**

```sql
CREATE VIEW campaign_gambling_fund_view AS
SELECT a.campaign_id, a.campaign_name, a.candidate_name, a.office_sought, b.id AS fund_id, b.fund_id AS fund_fund_id, b.fund_amount AS fund_fund_amount
FROM campaigns a JOIN gambling_funds b ON a.gambling_fund_id = b.id;
```

| campaign_id | campaign_name | candidate_name | office_sought | fund_id | fund_fund_id | fund_fund_amount |
|---|---|---|---|---|---|---|
| 1 | Compact Framework | Composite Series | integrated-office-52 | 100 | 3158147 | 11.11 |
| 2 | Legacy Protocol | Compact Assessment A | seasonal-office-53 | 101 | 6510 | 29.24 |
| 3 | Regional Programme A | Legacy Survey | regional-office-54 | 102 | lu_tax_code_template_m_I | 12.72 |
| 4 | Seasonal Standard | Regional Corridor | legacy-office-55 | 103 | 3990185 | 22.35 |

The view `campaign_gambling_fund_view` reverses the perspective: "which gambling fund finances each campaign?" It joins `campaigns` to `gambling_funds` on `campaigns.gambling_fund_id = gambling_funds.id`. Campaign 1 (`Compact Framework`) is financed by fund 100, campaign 2 (`Legacy Protocol A`) by fund 101, and so forth. This view supports campaign finance reporting by showing the gambling-derived funding source for each active, inactive, or completed campaign.

**View `campaign_regulatory_statute_view`**

```sql
CREATE VIEW campaign_regulatory_statute_view AS
SELECT a.campaign_id, a.campaign_name, a.candidate_name, a.office_sought, b.regulatory_statute_id AS statute_regulatory_statute_id, b.statute_id AS statute_statute_id, b.statute_title AS statute_statute_title
FROM campaigns a JOIN regulatory_statutes b ON a.regulatory_statute_id = b.regulatory_statute_id;
```

| campaign_id | campaign_name | candidate_name | office_sought | statute_regulatory_statute_id | statute_statute_id | statute_statute_title |
|---|---|---|---|---|---|---|
| 1 | Compact Framework | Composite Series | integrated-office-52 | 1 | 3744010 | Extended Framework |
| 2 | Legacy Protocol | Compact Assessment A | seasonal-office-53 | 2 | 10238287 | Pilot Protocol A |
| 3 | Regional Programme A | Legacy Survey | regional-office-54 | 3 | 6926373 | Baseline Programme |
| 4 | Seasonal Standard | Regional Corridor | legacy-office-55 | 4 | 4364 | Distributed Standard |

The view `campaign_regulatory_statute_view` answers "which statute governs each campaign?" It joins `campaigns` to `regulatory_statutes` on `campaigns.regulatory_statute_id = regulatory_statutes.regulatory_statute_id`. Campaign 1 is governed by statute 1 (`Extended Framework`), campaign 2 by statute 2 (`Pilot Protocol A`), campaign 3 by statute 3 (`Baseline Programme`), and campaign 4 by statute 4 (`Distributed Standard`). This view enables compliance checks to ensure that every campaign operates within the bounds of its applicable statute.

**View `regulatory_statute_gambling_activity_view`**

```sql
CREATE VIEW regulatory_statute_gambling_activity_view AS
SELECT a.regulatory_statute_id, a.statute_id, a.statute_title, a.jurisdiction, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM regulatory_statutes a JOIN gambling_activities b ON a.gambling_activity_id = b.id;
```

| regulatory_statute_id | statute_id | statute_title | jurisdiction | activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | Extended Framework | regional-jurisdic-30 | 100 | 8843761 | raffle |
| 2 | 10238287 | Pilot Protocol A | legacy-jurisdic-31 | 101 | 4180957 | drawing |
| 3 | 6926373 | Baseline Programme | compact-jurisdic-32 | 102 | 168545 | pull-tab |
| 4 | 4364 | Distributed Standard | composite-jurisdic-33 | 103 | default_chart_a_account_53 | tipboard |

The view `regulatory_statute_gambling_activity_view` answers "which gambling activities are subject to each statute?" It joins `regulatory_statutes` to `gambling_activities` on `regulatory_statutes.gambling_activity_id = gambling_activities.id`. Statute 1 (`Extended Framework`) applies to activity 100 (raffle), statute 2 (`Pilot Protocol A`) to activity 101 (drawing), statute 3 (`Baseline Programme`) to activity 102 (pull-tab), and statute 4 (`Distributed Standard`) to activity 103 (tipboard). This view is essential for statute-level impact analysis.

**View `regulatory_statute_campaign_view`**

```sql
CREATE VIEW regulatory_statute_campaign_view AS
SELECT a.regulatory_statute_id, a.statute_id, a.statute_title, a.jurisdiction, b.campaign_id AS campaign_campaign_id, b.campaign_name AS campaign_campaign_name, b.candidate_name AS campaign_candidate_name
FROM regulatory_statutes a JOIN campaigns b ON a.campaign_id = b.campaign_id;
```

| regulatory_statute_id | statute_id | statute_title | jurisdiction | campaign_campaign_id | campaign_campaign_name | campaign_candidate_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | Extended Framework | regional-jurisdic-30 | 1 | Compact Framework | Composite Series |
| 2 | 10238287 | Pilot Protocol A | legacy-jurisdic-31 | 2 | Legacy Protocol | Compact Assessment A |
| 3 | 6926373 | Baseline Programme | compact-jurisdic-32 | 3 | Regional Programme A | Legacy Survey |
| 4 | 4364 | Distributed Standard | composite-jurisdic-33 | 4 | Seasonal Standard | Regional Corridor |

The view `regulatory_statute_campaign_view` answers "which campaigns fall under each statute?" It joins `regulatory_statutes` to `campaigns` on `regulatory_statutes.campaign_id = campaigns.campaign_id`. Statute 1 governs campaign 1, statute 2 governs campaign 2, statute 3 governs campaign 3, and statute 4 governs campaign 4. This view provides a statute-centric compliance dashboard, showing the full set of campaigns that must adhere to each regulatory provision.

The materialized views collectively form a bidirectional mesh over the five base tables. Each view isolates a single join path, projecting only the columns needed to answer a specific compliance question. The join keys are the foreign keys declared in the base tables, so the views are deterministic and can be refreshed incrementally. Together, the tables and views support three audit dimensions: entity-level (which organization runs which activity), financial-level (which fund finances which campaign), and legal-level (which statute governs which activity and campaign). The normalized design prevents redundancy — an organization's name appears in exactly one row of `organizations`, a statute's title in exactly one row of `regulatory_statutes` — while the views reconstruct the denormalized facts required for reporting without duplicating storage.