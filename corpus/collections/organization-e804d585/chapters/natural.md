The governance of charitable and nonprofit gambling spans a network of organizations, activities, financial instruments, political campaigns, and regulatory statutes. Each entity carries identifiers, status flags, and temporal markers that together form an auditable chain from the moment an organization proposes a raffle through the allocation of proceeds and the application of jurisdictional law. Practitioners in compliance, audit, and policy analysis rely on these records to trace accountability, verify that funds remain within permitted boundaries, and confirm that every activity has a corresponding legal basis. The domain is structured around five core record types—organizations, gambling activities, gambling funds, campaigns, and regulatory statutes—alongside a set of joined views that surface the relationships between them.

## Organizations and Their Registration

Organizations seeking to conduct gambling-related activities must first establish their legal standing. The records capture the entity's name, its registration status, its organizational type, and contact information.

**Table `organizations`**

| organization_id | organization_name | registration_status | organization_type | contact_phone_number | website_url | gambling_activity_id |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | registered_with_secretary_of_state | fraternal | Theodore Mcgrath | https://github.com/chiphuyen/lazynlp | 100 |
| 2 | Oscar Health Inc. | irs_nonprofit_designation | religious | Peter Mcdowell | https://bugs.launchpad.net/ironic/+bug/1346406 | 101 |
| 3 | Atlantic Richfield | unregistered | veterans | Collin Lopez | http://en.wikipedia.org/wiki/Hyla_femoralis | 102 |
| 4 | Port Loko | registered_with_secretary_of_state | other_nonprofit | Steve Martin | https://www.nature.com/articles/nphoton.2014.41 | 103 |

Staples Inc. holds a registration status of `registered_with_secretary_of_state` and is classified as a fraternal organization, with Theodore Mcgrath listed as the contact and a website hosted at `https://github.com/chiphuyen/lazynlp`. Oscar Health Inc. carries an `irs_nonprofit_designation` and is categorized as religious, represented by Peter Mcdowell. Atlantic Richfield is marked `unregistered` and falls under the veterans type, with Collin Lopez as the contact. Port Loko, classified as `other_nonprofit`, is registered with the secretary of state and lists Steve Martin as its contact. Each organization is linked to a gambling activity through the `gambling_activity_id` column, establishing the first link in the accountability chain.

## Gambling Activities and Their Lifecycle

A gambling activity is the operational unit through which an organization conducts raffles, drawings, pull-tabs, or tipboards. The activity record carries a unique `activity_id`, a human-readable `activity_name`, a boolean flag indicating whether consideration is required, a `legal_status`, and a date range that defines the activity's validity window.

**Table `gambling_activities`**

| id | activity_id | activity_name | is_consideration_required | legal_status | start_date | end_date | organization_id | gambling_fund_id | regulatory_statute_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | raffle | false | lawful | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 100 | 1 |
| 101 | 4180957 | drawing | true | unlawful | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 101 | 2 |
| 102 | 168545 | pull-tab | false | pending_review | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 102 | 3 |
| 103 | default_chart_a_account_53 | tipboard | true | lawful | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 103 | 4 |

The raffle (activity ID `8843761`) operated by Staples Inc. is marked `lawful` and does not require consideration, running from 2022-09-05 back to 2022-09-01. The drawing (activity ID `4180957`) run by Oscar Health Inc. is classified as `unlawful` and does require consideration, with a window spanning 2023-02-16 to 2023-02-12. Atlantic Richfield's pull-tab (activity ID `168545`) is under `pending_review` and requires no consideration, dated 2024-07-27 through 2024-07-23. Port Loko's tipboard (activity ID `default_chart_a_account_53`) is `lawful`, requires consideration, and is scheduled from 2025-12-11 to 2025-12-07. The `organization_id` column ties each activity back to its sponsoring entity, while `gambling_fund_id` and `regulatory_statute_id` point to the financial and legal frameworks governing the activity.

## Gambling Funds and Their Restrictions

Proceeds from gambling activities flow into gambling funds, which are tracked by amount, currency, and restriction status. The fund record captures the `fund_id`, the `fund_amount`, a `currency_code`, the `source_activity_id` from which the funds originated, and a `restriction_status` that determines how the money may be deployed.

**Table `gambling_funds`**

| id | fund_id | fund_amount | currency_code | source_activity_id | restriction_status | gambling_activity_id | campaign_id |
|---|---|---|---|---|---|---|---|
| 100 | 3158147 | 11.11 | gd_fp_eu_acc3 | gd_taxc_1113 | restricted_from_political_use | 100 | 1 |
| 101 | 6510 | 29.24 | managing-resources | 8843764 | unrestricted | 101 | 2 |
| 102 | lu_tax_code_template_m_I | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 69423 | pending_allocation | 102 | 3 |
| 103 | 3990185 | 22.35 | 10445649 | 4716393 | restricted_from_political_use | 103 | 4 |

Fund `3158147` holds an amount of `11.11` in the currency code `gd_fp_eu_acc3`, sourced from activity `gd_taxc_1113`, and carries the restriction `restricted_from_political_use`. Fund `6510` contains `29.24` in the currency code `managing-resources`, sourced from activity `8843764`, and is marked `unrestricted`. Fund `lu_tax_code_template_m_I` holds `12.72` in currency code `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, sourced from activity `69423`, with a `pending_allocation` status. Fund `3990185` contains `22.35` in currency code `10445649`, sourced from activity `4716393`, and is `restricted_from_political_use`. The `gambling_activity_id` column links each fund to its originating activity, and the `campaign_id` column connects it to the political campaign that may draw from it.

## Campaigns and Their Operational Status

Political campaigns that receive or allocate gambling funds are recorded with a `campaign_id`, a `campaign_name`, the `candidate_name`, the `office_sought`, a `ballot_question`, and a `status` indicating whether the campaign is active, inactive, or completed. Timestamps for creation and updates provide an audit trail.

**Table `campaigns`**

| campaign_id | campaign_name | candidate_name | office_sought | ballot_question | status | gambling_fund_id | regulatory_statute_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Framework | Composite Series | integrated-office-52 | distributed-ballot-96 | active | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Legacy Protocol | Compact Assessment A | seasonal-office-53 | baseline-ballot-97 | inactive | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Regional Programme A | Legacy Survey | regional-office-54 | pilot-ballot-98 | completed | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Seasonal Standard | Regional Corridor | legacy-office-55 | extended-ballot-99 | active | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The Compact Framework campaign, led by Composite Series for the integrated-office-52 position on the distributed-ballot-96 measure, is currently `active`, created on 2025-01-01 and last updated on 2025-01-02. The Legacy Protocol campaign, with Compact Assessment A seeking seasonal-office-53 on baseline-ballot-97, is `inactive`, created on 2025-02-06 and updated on 2025-02-09. Regional Programme A, run by Legacy Survey for regional-office-54 on pilot-ballot-98, is `completed`, with a creation date of 2025-03-11 and an update on 2025-03-16. The Seasonal Standard campaign, featuring Regional Corridor for legacy-office-55 on extended-ballot-99, is `active`, created on 2025-04-16 and updated on 2025-04-23. Each campaign references a `gambling_fund_id` and a `regulatory_statute_id`, anchoring it to both financial and legal records.

## Regulatory Statutes and Their Jurisdictional Scope

Regulatory statutes define the legal boundaries within which gambling activities and their associated funds must operate. Each statute carries a `statute_id`, a `statute_title`, a `jurisdiction`, an `effective_date`, and a `restriction_type` that describes the nature of the legal constraint.

**Table `regulatory_statutes`**

| regulatory_statute_id | statute_id | statute_title | jurisdiction | effective_date | restriction_type | gambling_activity_id | campaign_id |
|---|---|---|---|---|---|---|---|
| 1 | 3744010 | Extended Framework | regional-jurisdic-30 | 2023-02-14 | prohibits_gambling_funds_for_political_use | 100 | 1 |
| 2 | 10238287 | Pilot Protocol A | legacy-jurisdic-31 | 2024-07-25 | defines_raffle_criteria | 101 | 2 |
| 3 | 6926373 | Baseline Programme | compact-jurisdic-32 | 2025-12-09 | authorizes_nonprofit_gambling | 102 | 3 |
| 4 | 4364 | Distributed Standard | composite-jurisdic-33 | 2022-05-20 | prohibits_gambling_funds_for_political_use | 103 | 4 |

The Extended Framework (statute ID `3744010`) applies to regional-jurisdic-30, took effect on 2023-02-14, and carries the restriction type `prohibits_gambling_funds_for_political_use`. Pilot Protocol A (statute ID `10238287`) governs legacy-jurisdic-31, became effective on 2024-07-25, and `defines_raffle_criteria`. The Baseline Programme (statute ID `6926373`) covers compact-jurisdic-32, effective 2025-12-09, and `authorizes_nonprofit_gambling`. The Distributed Standard (statute ID `4364`) applies to composite-jurisdic-33, effective 2022-05-20, and also `prohibits_gambling_funds_for_political_use`. The `gambling_activity_id` and `campaign_id` columns tie each statute to the specific activities and campaigns it regulates.

## Organization–Activity Relationships

The joined view between organizations and gambling activities surfaces which entity sponsors which activity, answering the question of organizational accountability for each gambling operation.

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

Staples Inc., a registered fraternal organization, sponsors the raffle (activity ID `8843761`). Oscar Health Inc., an IRS-designated religious nonprofit, sponsors the drawing (activity ID `4180957`). Atlantic Richfield, an unregistered veterans organization, sponsors the pull-tab (activity ID `168545`). Port Loko, a registered other-nonprofit, sponsors the tipboard (activity ID `default_chart_a_account_53`). This view makes it straightforward to audit which organizations are conducting which activities and to verify that each activity has a registered sponsor.

## Activity–Organization Relationships

The reverse join, from gambling activities back to organizations, answers the complementary question: given an activity, which organization is responsible for it?

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

The raffle (activity ID `8843761`) is traceable to Staples Inc., a registered fraternal entity. The drawing (activity ID `4180957`) maps to Oscar Health Inc., an IRS nonprofit with religious classification. The pull-tab (activity ID `168545`) belongs to Atlantic Richfield, which remains unregistered. The tipboard (activity ID `default_chart_a_account_53`) is operated by Port Loko, a registered other-nonprofit. This perspective is useful for investigators who begin with an activity and need to identify the responsible party.

## Activity–Fund Relationships

The join between gambling activities and gambling funds reveals the financial flow from activity to fund, answering how much money each activity generates and under what restrictions.

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

The raffle (activity ID `8843761`) feeds into fund `3158147` with an amount of `11.11`, restricted from political use. The drawing (activity ID `4180957`) feeds into fund `6510` with `29.24`, which is unrestricted. The pull-tab (activity ID `168545`) feeds into fund `lu_tax_code_template_m_I` with `12.72`, pending allocation. The tipboard (activity ID `default_chart_a_account_53`) feeds into fund `3990185` with `22.35`, restricted from political use. This view is essential for financial auditors tracking whether proceeds are properly segregated and whether restrictions are being honored.

## Activity–Statute Relationships

The join between gambling activities and regulatory statutes surfaces the legal framework governing each activity, answering which statute applies to which operation.

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

The raffle (activity ID `8843761`) is governed by the Extended Framework (statute ID `3744010`), which prohibits gambling funds for political use. The drawing (activity ID `4180957`) falls under Pilot Protocol A (statute ID `10238287`), which defines raffle criteria. The pull-tab (activity ID `168545`) is regulated by the Baseline Programme (statute ID `6926373`), which authorizes nonprofit gambling. The tipboard (activity ID `default_chart_a_account_53`) is subject to the Distributed Standard (statute ID `4364`), which also prohibits gambling funds for political use. Compliance officers use this view to verify that every activity has a corresponding, applicable statute.

## Fund–Activity Relationships

The reverse join from gambling funds back to activities answers the question: given a fund, which activity generated its proceeds?

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

Fund `3158147` traces its proceeds to the raffle (activity ID `8843761`). Fund `6510` traces to the drawing (activity ID `4180957`). Fund `lu_tax_code_template_m_I` traces to the pull-tab (activity ID `168545`). Fund `3990185` traces to the tipboard (activity ID `default_chart_a_account_53`). This perspective supports forensic accounting, where an auditor starts with a fund and needs to reconstruct its origin.

## Fund–Campaign Relationships

The join between gambling funds and campaigns reveals which campaigns draw from which funds, answering the critical question of fund allocation to political purposes.

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

Fund `3158147` is allocated to the Compact Framework campaign (campaign ID `1`). Fund `6510` is allocated to the Legacy Protocol campaign (campaign ID `2`). Fund `lu_tax_code_template_m_I` is allocated to Regional Programme A (campaign ID `3`). Fund `3990185` is allocated to the Seasonal Standard campaign (campaign ID `4`). This view is central to detecting violations of statutes that prohibit gambling funds for political use.

## Campaign–Fund Relationships

The reverse join from campaigns back to gambling funds answers: given a campaign, which fund(s) does it draw from?

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

The Compact Framework campaign (campaign ID `1`) draws from fund `3158147`. The Legacy Protocol campaign (campaign ID `2`) draws from fund `6510`. Regional Programme A (campaign ID `3`) draws from fund `lu_tax_code_template_m_I`. The Seasonal Standard campaign (campaign ID `4`) draws from fund `3990185`. This view allows campaign auditors to verify that the funds they receive are properly documented and that the source activities are lawful.

## Campaign–Statute Relationships

The join between campaigns and regulatory statutes surfaces the legal framework applicable to each campaign's use of gambling funds.

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

The Compact Framework campaign (campaign ID `1`) is governed by the Extended Framework (statute ID `3744010`), which prohibits gambling funds for political use. The Legacy Protocol campaign (campaign ID `2`) falls under Pilot Protocol A (statute ID `10238287`), which defines raffle criteria. Regional Programme A (campaign ID `3`) is regulated by the Baseline Programme (statute ID `6926373`), which authorizes nonprofit gambling. The Seasonal Standard campaign (campaign ID `4`) is subject to the Distributed Standard (statute ID `4364`), which also prohibits gambling funds for political use. This view enables legal reviewers to confirm that every campaign's financial activities are covered by an applicable statute.

## Statute–Activity Relationships

The reverse join from regulatory statutes back to gambling activities answers: given a statute, which activities does it regulate?

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

The Extended Framework (statute ID `3744010`) regulates the raffle (activity ID `8843761`). Pilot Protocol A (statute ID `10238287`) regulates the drawing (activity ID `4180957`). The Baseline Programme (statute ID `6926373`) regulates the pull-tab (activity ID `168545`). The Distributed Standard (statute ID `4364`) regulates the tipboard (activity ID `default_chart_a_account_53`). Regulators use this view to assess the scope of each statute and to identify any activities that may fall outside its coverage.

## Statute–Campaign Relationships

The reverse join from regulatory statutes back to campaigns answers: given a statute, which campaigns does it govern?

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

The Extended Framework (statute ID `3744010`) governs the Compact Framework campaign (campaign ID `1`). Pilot Protocol A (statute ID `10238287`) governs the Legacy Protocol campaign (campaign ID `2`). The Baseline Programme (statute ID `6926373`) governs Regional Programme A (campaign ID `3`). The Distributed Standard (statute ID `4364`) governs the Seasonal Standard campaign (campaign ID `4`). This view supports regulatory oversight by mapping each statute to the campaigns it constrains, ensuring that no campaign operates without a legal framework.

## Synthesis

The domain of gambling activity governance is a tightly coupled system of five record types and ten relational views. Organizations sponsor activities; activities generate funds; funds are allocated to campaigns; and statutes impose legal constraints on every link in the chain. The base tables provide the atomic facts—names, amounts, dates, statuses—while the views surface the relationships that practitioners need to audit, investigate, and enforce. A compliance officer can start from any point in the network—an organization, an activity, a fund, a campaign, or a statute—and traverse the joined views to reconstruct the full chain of accountability. The data, though fictional in its specific values, illustrates the structural patterns that real-world gambling governance relies upon: clear registration, documented proceeds, restricted allocations, and statutory oversight.