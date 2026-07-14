Legal advertising compliance sits at the intersection of marketing practice and professional regulation. Every advertisement published by a lawyer or law firm must satisfy a web of rules, disclaimers, and claims that vary by jurisdiction, media type, and the nature of the content itself. The schema under discussion captures this ecosystem as a set of normalized base tables linked by foreign keys, with a layer of pre-joined views that reconstruct domain facts for reporting and audit. The domain revolves around five core entities — advertising rules, advertisements, lawyers, legal claims, and disclaimers — plus a requirement catalogue and a many-to-many bridge table. Each entity is modelled as a relational table whose columns encode both attributes and foreign-key references to other entities. The views then reassemble these normalized pieces into readable, fact-level rows.

## Base Tables and Their Attributes

The schema's backbone is the `advertising_rules` table, which stores the regulatory framework against which every advertisement is evaluated. Each row represents a single rule, identified by a surrogate `advertising_rule_id` and a human-readable `rule_number` such as `RUL-2640`. The `rule_title` column carries a descriptive label — `Integrated Assessment A`, `Extended Survey`, `Pilot Corridor`, `Baseline Series D` — while `effective_date` records when the rule came into force and `status` captures its current lifecycle state (`active`, `vacant`, `superseded`). The `section_identifier` column (e.g., `SEC-2022` through `SEC-2025`) ties the rule to a regulatory section, and `advertisement_id` provides a direct link back to the advertisement the rule governs.

**Table `advertising_rules`**

| advertising_rule_id | rule_number | rule_title | effective_date | status | section_identifier | advertisement_id |
|---|---|---|---|---|---|---|
| 100 | RUL-2640 | Integrated Assessment A | 2023-02-14T13:27:00 | active | SEC-2022 | 1 |
| 101 | RUL-2647 | Extended Survey | 2024-07-25T20:44:00 | vacant | SEC-2023 | 2 |
| 102 | RUL-2654 | Pilot Corridor | 2025-12-09T03:01:00 | superseded | SEC-2024 | 3 |
| 103 | RUL-2661 | Baseline Series D | 2022-05-20T10:18:00 | active | SEC-2025 | 4 |

The `advertisements` table is the central fact table of the schema. Each row represents a single advertisement, identified by `id` and `ad_identifier` (e.g., `AD-2371`, `AD-2378`). The `media_type` column distinguishes between `newspaper`, `magazine`, `brochure`, and `flyer` — the channels through which the advertisement reaches the public. `publication_date` records when the ad went live, while `compliance_status` flags whether the ad is `compliant`, `deceptive`, `misleading`, or `manipulative`. The `language` column uses codes like `composite-language-45` to `distributed-language-48` to indicate the linguistic variant. Financial aspects are captured in `fee_offered` (a decimal such as `29.24` or `35.45`) and `fee_validity_days` (ranging from `45` to `69`). Crucially, `advertisements` carries five foreign-key columns — `lawyer_id`, `advertising_rule_id`, `legal_claim_id`, and `disclaimer_id` — that anchor each ad to its responsible lawyer, governing rule, associated legal claim, and required disclaimer.

**Table `advertisements`**

| id | ad_identifier | media_type | publication_date | compliance_status | language | fee_offered | fee_validity_days | lawyer_id | advertising_rule_id | legal_claim_id | disclaimer_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | AD-2371 | newspaper | 2025-12-01 | compliant | composite-language-45 | 29.24 | 45 | 100 | 100 | 1000 | 1 |
| 2 | AD-2378 | magazine | 2022-05-12 | deceptive | primary-language-46 | 22.35 | 53 | 101 | 101 | 1001 | 2 |
| 3 | AD-2385 | brochure | 2023-10-23 | misleading | adaptive-language-47 | 33.06 | 61 | 102 | 102 | 1002 | 3 |
| 4 | AD-2392 | flyer | 2024-03-07 | manipulative | distributed-language-48 | 35.45 | 69 | 103 | 103 | 1003 | 4 |

The `lawyers` table profiles the attorneys responsible for advertisements. Each row is keyed by `id` and carries a `bar_membership_number` (e.g., `BAR-2764`, `BAR-2766`), a `lawyer_name` such as `Baseline Model D` or `Distributed Cluster`, and a `firm_name` like `Legacy Review D` or `Regional Initiative`. The `office_location` column uses codes such as `composite-office-99` and `primary-office-100`. Certification status is recorded in `certification_status` (`board_certified`, `specialist`, `expert`, `not_certified`), while `is_outof_state` is a boolean flag indicating cross-jurisdiction practice. The `practice_areas` column holds values like `legacy-practice-43` and `compact-practice-44`. The table also includes a self-referencing `lawyer_id` column and an `advertisement_id` column linking the lawyer to their advertisement, plus `provides_referral_to_lawyer_id` for inter-lawyer referral relationships.

**Table `lawyers`**

| id | bar_membership_number | lawyer_name | firm_name | office_location | certification_status | is_outof_state | practice_areas | lawyer_id | advertisement_id | provides_referral_to_lawyer_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BAR-2764 | Baseline Model D | Legacy Review D | composite-office-99 | board_certified | false | legacy-practice-43 | 100 | 1 | 100 |
| 101 | BAR-2766 | Distributed Cluster | Regional Initiative | primary-office-100 | specialist | true | compact-practice-44 | 101 | 2 | 101 |
| 102 | BAR-2768 | Adaptive Review | Seasonal Model | adaptive-office-101 | expert | false | composite-practice-45 | 102 | 3 | 102 |
| 103 | BAR-2770 | Primary Initiative A | Integrated Cluster A | distributed-office-102 | not_certified | true | primary-practice-46 | 103 | 4 | 103 |

Legal claims — the substantive assertions made within advertisements — are stored in the `legal_claims` table. Each row is identified by `legal_claim_id` (e.g., `1000`, `1001`) and contains the `claim_text` (such as `pilot-claim-56` or `extended-claim-57`). The `claim_type` column categorizes claims as `success_prediction`, `past_result`, `skill_comparison`, or `fee_statement`. Boolean flags `is_verifiable` and `is_misleading` encode truthfulness assessments, while `requires_disclaimer` indicates whether a disclaimer is mandatory. The `disclaimer_text` column (e.g., `adaptive-disclaim-89`) provides a textual reference, and `advertisement_id` and `advertising_rule_id` link the claim to its parent ad and governing rule.

**Table `legal_claims`**

| legal_claim_id | claim_text | claim_type | is_verifiable | is_misleading | requires_disclaimer | disclaimer_text | advertisement_id | advertising_rule_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | pilot-claim-56 | success_prediction | true | false | true | adaptive-disclaim-89 | 1 | 100 |
| 1001 | extended-claim-57 | past_result | false | true | false | distributed-disclaim-90 | 2 | 101 |
| 1002 | integrated-claim-58 | skill_comparison | true | false | true | baseline-disclaim-91 | 3 | 102 |
| 1003 | seasonal-claim-59 | fee_statement | false | true | false | pilot-disclaim-92 | 4 | 103 |

Disclaimers are stored in their own table to support reuse across advertisements and rules. The `disclaimers` table is keyed by `id` and contains `disclaimer_text` (e.g., `adaptive-disclaim-89`, `distributed-disclaim-90`), `disclaimer_type` (such as `not_employee`, `dramatization`, `actor`, `fee_disclosure`), and `prominence_level` (`prominent`, `legible`, `intelligible`). The `is_mandatory` boolean indicates whether the disclaimer must appear, while `advertisement_id` and `advertising_rule_id` tie the disclaimer to its context. The `created_at` timestamp (e.g., `2025-01-01 00:14:00`) records when the disclaimer was registered.

**Table `disclaimers`**

| id | disclaimer_text | disclaimer_type | prominence_level | is_mandatory | advertisement_id | advertising_rule_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | adaptive-disclaim-89 | not_employee | prominent | true | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | distributed-disclaim-90 | dramatization | legible | false | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | baseline-disclaim-91 | actor | intelligible | true | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | pilot-disclaim-92 | fee_disclosure | prominent | false | 4 | 103 | 2025-04-16 09:14:00 |

The `advertising_requirements` table enumerates the specific content and formatting obligations that apply to advertisements. Each row is identified by `advertising_requirement_id` (e.g., `1000`, `1001`) and carries `requirement_text` (such as `distributed-requirem-12` or `baseline-requirem-13`). The `requirement_category` column classifies requirements as `required_content`, `prohibited_content`, `formatting`, or `disclosure`. The `is_safe_harbor` boolean indicates whether compliance with the requirement provides legal protection, and `applies_to_media` restricts the requirement to `all`, `written`, `spoken`, or `electronic` media. Foreign-key columns `advertising_rule_id` and `advertisement_id` link each requirement to its governing rule and target advertisement.

**Table `advertising_requirements`**

| advertising_requirement_id | requirement_text | requirement_category | is_safe_harbor | applies_to_media | advertising_rule_id | advertisement_id |
|---|---|---|---|---|---|---|
| 1000 | distributed-requirem-12 | required_content | false | all | 100 | 1 |
| 1001 | baseline-requirem-13 | prohibited_content | true | written | 101 | 2 |
| 1002 | pilot-requirem-14 | formatting | false | spoken | 102 | 3 |
| 1003 | extended-requirem-15 | disclosure | true | electronic | 103 | 4 |

The `rules_requirements` table serves as a junction table, resolving the many-to-many relationship between advertising rules and advertising requirements. A single advertising rule may impose multiple requirements, and a single requirement type may apply across multiple rules. Each row in `rules_requirements` represents one such pairing, effectively materializing the cross-reference that the relational model keeps implicit through foreign keys. This junction table is the canonical place to query which requirements are bound to which rules, independent of any specific advertisement.

**Table `rules_requirements`**

| advertising_rule_id | advertising_requirement_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

## Views as Reconstructed Domain Facts

The schema provides a rich set of pre-joined views that reconstruct domain facts from the normalized tables. Each view answers a specific analytical question by joining two or more base tables along their foreign-key relationships.

The `advertising_rule_advertising_requirement_detail_view` joins `advertising_rules` to `advertising_requirements` through the shared `advertising_rule_id` column. This view answers the question: "What requirements does each advertising rule impose?" For example, rule `RUL-2640` (rule_id `100`) is associated with requirement `distributed-requirem-12` (requirement_id `1000`), which falls under the `required_content` category and applies to `all` media types. The view makes it possible to audit a rule's full requirement set in a single row set.

**View `advertising_rule_advertising_requirement_detail_view`**

```sql
CREATE VIEW advertising_rule_advertising_requirement_detail_view AS
SELECT a.advertising_rule_id, a.rule_number, a.rule_title, b.advertising_requirement_id AS requirement_advertising_requirement_id, b.requirement_text AS requirement_requirement_text, b.requirement_category AS requirement_requirement_category
FROM advertising_rules a
  JOIN rules_requirements j ON j.advertising_rule_id = a.advertising_rule_id
  JOIN advertising_requirements b ON b.advertising_requirement_id = j.advertising_requirement_id;
```

| advertising_rule_id | rule_number | rule_title | requirement_advertising_requirement_id | requirement_requirement_text | requirement_requirement_category |
|---|---|---|---|---|---|
| 100 | RUL-2640 | Integrated Assessment A | 1000 | distributed-requirem-12 | required_content |
| 100 | RUL-2640 | Integrated Assessment A | 1001 | baseline-requirem-13 | prohibited_content |
| 101 | RUL-2647 | Extended Survey | 1001 | baseline-requirem-13 | prohibited_content |
| 101 | RUL-2647 | Extended Survey | 1002 | pilot-requirem-14 | formatting |
| 102 | RUL-2654 | Pilot Corridor | 1002 | pilot-requirem-14 | formatting |
| 102 | RUL-2654 | Pilot Corridor | 1003 | extended-requirem-15 | disclosure |
| 103 | RUL-2661 | Baseline Series D | 1003 | extended-requirem-15 | disclosure |
| 103 | RUL-2661 | Baseline Series D | 1000 | distributed-requirem-12 | required_content |

The `advertising_rule_advertisement_view` joins `advertising_rules` to `advertisements` on `advertising_rule_id`. This view answers: "Which advertisements are governed by which rules?" Row `100` in the view shows that rule `RUL-2640` (`Integrated Assessment A`, status `active`) governs advertisement `AD-2371` in the `newspaper` medium, published on `2025-12-01` with a `compliant` status. The view provides a rule-centric perspective on ad coverage.

**View `advertising_rule_advertisement_view`**

```sql
CREATE VIEW advertising_rule_advertisement_view AS
SELECT a.advertising_rule_id, a.rule_number, a.rule_title, a.effective_date, b.id AS advertisement_id, b.ad_identifier AS advertisement_ad_identifier, b.media_type AS advertisement_media_type
FROM advertising_rules a JOIN advertisements b ON a.advertisement_id = b.id;
```

| advertising_rule_id | rule_number | rule_title | effective_date | advertisement_id | advertisement_ad_identifier | advertisement_media_type |
|---|---|---|---|---|---|---|
| 100 | RUL-2640 | Integrated Assessment A | 2023-02-14T13:27:00 | 1 | AD-2371 | newspaper |
| 101 | RUL-2647 | Extended Survey | 2024-07-25T20:44:00 | 2 | AD-2378 | magazine |
| 102 | RUL-2654 | Pilot Corridor | 2025-12-09T03:01:00 | 3 | AD-2385 | brochure |
| 103 | RUL-2661 | Baseline Series D | 2022-05-20T10:18:00 | 4 | AD-2392 | flyer |

The `advertisement_lawyer_view` joins `advertisements` to `lawyers` on `lawyer_id`. This view answers: "Which lawyer is responsible for which advertisement?" For instance, advertisement `AD-2371` is associated with lawyer `Baseline Model D` (bar number `BAR-2764`), who practices at `Legacy Review D` in `composite-office-99` and holds `board_certified` status. The view is essential for attribution and accountability tracking.

**View `advertisement_lawyer_view`**

```sql
CREATE VIEW advertisement_lawyer_view AS
SELECT a.id, a.ad_identifier, a.media_type, a.publication_date, b.id AS lawyer_id, b.bar_membership_number AS lawyer_bar_membership_number, b.lawyer_name AS lawyer_lawyer_name
FROM advertisements a JOIN lawyers b ON a.lawyer_id = b.id;
```

| id | ad_identifier | media_type | publication_date | lawyer_id | lawyer_bar_membership_number | lawyer_lawyer_name |
|---|---|---|---|---|---|---|
| 1 | AD-2371 | newspaper | 2025-12-01 | 100 | BAR-2764 | Baseline Model D |
| 2 | AD-2378 | magazine | 2022-05-12 | 101 | BAR-2766 | Distributed Cluster |
| 3 | AD-2385 | brochure | 2023-10-23 | 102 | BAR-2768 | Adaptive Review |
| 4 | AD-2392 | flyer | 2024-03-07 | 103 | BAR-2770 | Primary Initiative A |

The `advertisement_advertising_rule_view` joins `advertisements` to `advertising_rules` on `advertising_rule_id`. This view answers: "What rule governs each advertisement?" Row `AD-2371` is governed by rule `RUL-2640` (`Integrated Assessment A`), effective `2023-02-14`, with status `active`. This view provides an advertisement-centric compliance perspective.

**View `advertisement_advertising_rule_view`**

```sql
CREATE VIEW advertisement_advertising_rule_view AS
SELECT a.id, a.ad_identifier, a.media_type, a.publication_date, b.advertising_rule_id AS rule_advertising_rule_id, b.rule_number AS rule_rule_number, b.rule_title AS rule_rule_title
FROM advertisements a JOIN advertising_rules b ON a.advertising_rule_id = b.advertising_rule_id;
```

| id | ad_identifier | media_type | publication_date | rule_advertising_rule_id | rule_rule_number | rule_rule_title |
|---|---|---|---|---|---|---|
| 1 | AD-2371 | newspaper | 2025-12-01 | 100 | RUL-2640 | Integrated Assessment A |
| 2 | AD-2378 | magazine | 2022-05-12 | 101 | RUL-2647 | Extended Survey |
| 3 | AD-2385 | brochure | 2023-10-23 | 102 | RUL-2654 | Pilot Corridor |
| 4 | AD-2392 | flyer | 2024-03-07 | 103 | RUL-2661 | Baseline Series D |

The `advertisement_legal_claim_view` joins `advertisements` to `legal_claims` on `advertisement_id`. This view answers: "What legal claims does each advertisement contain?" Advertisement `AD-2371` contains claim `pilot-claim-56` of type `success_prediction`, which is marked as `verifiable` (`true`) and `not misleading` (`false`), and `requires_disclaimer` (`true`). The view surfaces the claim-level content of each ad for compliance review.

**View `advertisement_legal_claim_view`**

```sql
CREATE VIEW advertisement_legal_claim_view AS
SELECT a.id, a.ad_identifier, a.media_type, a.publication_date, b.legal_claim_id AS claim_legal_claim_id, b.claim_text AS claim_claim_text, b.claim_type AS claim_claim_type
FROM advertisements a JOIN legal_claims b ON a.legal_claim_id = b.legal_claim_id;
```

| id | ad_identifier | media_type | publication_date | claim_legal_claim_id | claim_claim_text | claim_claim_type |
|---|---|---|---|---|---|---|
| 1 | AD-2371 | newspaper | 2025-12-01 | 1000 | pilot-claim-56 | success_prediction |
| 2 | AD-2378 | magazine | 2022-05-12 | 1001 | extended-claim-57 | past_result |
| 3 | AD-2385 | brochure | 2023-10-23 | 1002 | integrated-claim-58 | skill_comparison |
| 4 | AD-2392 | flyer | 2024-03-07 | 1003 | seasonal-claim-59 | fee_statement |

The `advertisement_disclaimer_view` joins `advertisements` to `disclaimers` on `advertisement_id`. This view answers: "What disclaimers accompany each advertisement?" Advertisement `AD-2371` carries disclaimer `adaptive-disclaim-89` of type `not_employee` with `prominent` prominence level and `is_mandatory` set to `true`. This view is critical for verifying that required disclaimers are present and properly classified.

**View `advertisement_disclaimer_view`**

```sql
CREATE VIEW advertisement_disclaimer_view AS
SELECT a.id, a.ad_identifier, a.media_type, a.publication_date, b.id AS disclaimer_id, b.disclaimer_text AS disclaimer_disclaimer_text, b.disclaimer_type AS disclaimer_disclaimer_type
FROM advertisements a JOIN disclaimers b ON a.disclaimer_id = b.id;
```

| id | ad_identifier | media_type | publication_date | disclaimer_id | disclaimer_disclaimer_text | disclaimer_disclaimer_type |
|---|---|---|---|---|---|---|
| 1 | AD-2371 | newspaper | 2025-12-01 | 1 | adaptive-disclaim-89 | not_employee |
| 2 | AD-2378 | magazine | 2022-05-12 | 2 | distributed-disclaim-90 | dramatization |
| 3 | AD-2385 | brochure | 2023-10-23 | 3 | baseline-disclaim-91 | actor |
| 4 | AD-2392 | flyer | 2024-03-07 | 4 | pilot-disclaim-92 | fee_disclosure |

The `lawyer_lawyer_view` is a self-join on the `lawyers` table, leveraging the `provides_referral_to_lawyer_id` column. This view answers: "Which lawyers refer clients to which other lawyers?" For example, lawyer `Baseline Model D` (id `100`) has `provides_referral_to_lawyer_id` set to `100`, indicating a self-referral or a referral loop. The view exposes the referral network among practitioners.

**View `lawyer_lawyer_view`**

```sql
CREATE VIEW lawyer_lawyer_view AS
SELECT a.id, a.bar_membership_number, a.lawyer_name, a.firm_name, b.id AS lawyer_id, b.bar_membership_number AS lawyer_bar_membership_number, b.lawyer_name AS lawyer_lawyer_name
FROM lawyers a JOIN lawyers b ON a.lawyer_id = b.id;
```

| id | bar_membership_number | lawyer_name | firm_name | lawyer_id | lawyer_bar_membership_number | lawyer_lawyer_name |
|---|---|---|---|---|---|---|
| 100 | BAR-2764 | Baseline Model D | Legacy Review D | 100 | BAR-2764 | Baseline Model D |
| 101 | BAR-2766 | Distributed Cluster | Regional Initiative | 101 | BAR-2766 | Distributed Cluster |
| 102 | BAR-2768 | Adaptive Review | Seasonal Model | 102 | BAR-2768 | Adaptive Review |
| 103 | BAR-2770 | Primary Initiative A | Integrated Cluster A | 103 | BAR-2770 | Primary Initiative A |

The `lawyer_advertisement_view` joins `lawyers` to `advertisements` on `advertisement_id`. This view answers: "Which advertisements does each lawyer publish?" Lawyer `Baseline Model D` (id `100`) is linked to advertisement `AD-2371` in the `newspaper` medium. The view provides a lawyer-centric portfolio of their published advertisements.

**View `lawyer_advertisement_view`**

```sql
CREATE VIEW lawyer_advertisement_view AS
SELECT a.id, a.bar_membership_number, a.lawyer_name, a.firm_name, b.id AS advertisement_id, b.ad_identifier AS advertisement_ad_identifier, b.media_type AS advertisement_media_type
FROM lawyers a JOIN advertisements b ON a.advertisement_id = b.id;
```

| id | bar_membership_number | lawyer_name | firm_name | advertisement_id | advertisement_ad_identifier | advertisement_media_type |
|---|---|---|---|---|---|---|
| 100 | BAR-2764 | Baseline Model D | Legacy Review D | 1 | AD-2371 | newspaper |
| 101 | BAR-2766 | Distributed Cluster | Regional Initiative | 2 | AD-2378 | magazine |
| 102 | BAR-2768 | Adaptive Review | Seasonal Model | 3 | AD-2385 | brochure |
| 103 | BAR-2770 | Primary Initiative A | Integrated Cluster A | 4 | AD-2392 | flyer |

The `legal_claim_advertisement_view` joins `legal_claims` to `advertisements` on `advertisement_id`. This view answers: "Which advertisements contain each legal claim?" Claim `pilot-claim-56` (type `success_prediction`) appears in advertisement `AD-2371`. The view provides a claim-centric perspective, useful for tracking how often a particular claim type appears across the ad inventory.

**View `legal_claim_advertisement_view`**

```sql
CREATE VIEW legal_claim_advertisement_view AS
SELECT a.legal_claim_id, a.claim_text, a.claim_type, a.is_verifiable, b.id AS advertisement_id, b.ad_identifier AS advertisement_ad_identifier, b.media_type AS advertisement_media_type
FROM legal_claims a JOIN advertisements b ON a.advertisement_id = b.id;
```

| legal_claim_id | claim_text | claim_type | is_verifiable | advertisement_id | advertisement_ad_identifier | advertisement_media_type |
|---|---|---|---|---|---|---|
| 1000 | pilot-claim-56 | success_prediction | true | 1 | AD-2371 | newspaper |
| 1001 | extended-claim-57 | past_result | false | 2 | AD-2378 | magazine |
| 1002 | integrated-claim-58 | skill_comparison | true | 3 | AD-2385 | brochure |
| 1003 | seasonal-claim-59 | fee_statement | false | 4 | AD-2392 | flyer |

The `legal_claim_advertising_rule_view` joins `legal_claims` to `advertising_rules` on `advertising_rule_id`. This view answers: "Which advertising rules govern advertisements containing specific legal claims?" Claim `pilot-claim-56` is governed by rule `RUL-2640` (`Integrated Assessment A`). The view connects claim-level content to the regulatory framework that constrains it.

**View `legal_claim_advertising_rule_view`**

```sql
CREATE VIEW legal_claim_advertising_rule_view AS
SELECT a.legal_claim_id, a.claim_text, a.claim_type, a.is_verifiable, b.advertising_rule_id AS rule_advertising_rule_id, b.rule_number AS rule_rule_number, b.rule_title AS rule_rule_title
FROM legal_claims a JOIN advertising_rules b ON a.advertising_rule_id = b.advertising_rule_id;
```

| legal_claim_id | claim_text | claim_type | is_verifiable | rule_advertising_rule_id | rule_rule_number | rule_rule_title |
|---|---|---|---|---|---|---|
| 1000 | pilot-claim-56 | success_prediction | true | 100 | RUL-2640 | Integrated Assessment A |
| 1001 | extended-claim-57 | past_result | false | 101 | RUL-2647 | Extended Survey |
| 1002 | integrated-claim-58 | skill_comparison | true | 102 | RUL-2654 | Pilot Corridor |
| 1003 | seasonal-claim-59 | fee_statement | false | 103 | RUL-2661 | Baseline Series D |

The `disclaimer_advertisement_view` joins `disclaimers` to `advertisements` on `advertisement_id`. This view answers: "Which advertisements use each disclaimer?" Disclaimer `adaptive-disclaim-89` (type `not_employee`, prominence `prominent`) is used in advertisement `AD-2371`. The view provides a disclaimer-centric audit trail.

**View `disclaimer_advertisement_view`**

```sql
CREATE VIEW disclaimer_advertisement_view AS
SELECT a.id, a.disclaimer_text, a.disclaimer_type, a.prominence_level, b.id AS advertisement_id, b.ad_identifier AS advertisement_ad_identifier, b.media_type AS advertisement_media_type
FROM disclaimers a JOIN advertisements b ON a.advertisement_id = b.id;
```

| id | disclaimer_text | disclaimer_type | prominence_level | advertisement_id | advertisement_ad_identifier | advertisement_media_type |
|---|---|---|---|---|---|---|
| 1 | adaptive-disclaim-89 | not_employee | prominent | 1 | AD-2371 | newspaper |
| 2 | distributed-disclaim-90 | dramatization | legible | 2 | AD-2378 | magazine |
| 3 | baseline-disclaim-91 | actor | intelligible | 3 | AD-2385 | brochure |
| 4 | pilot-disclaim-92 | fee_disclosure | prominent | 4 | AD-2392 | flyer |

The `disclaimer_advertising_rule_view` joins `disclaimers` to `advertising_rules` on `advertising_rule_id`. This view answers: "Which advertising rules mandate which disclaimers?" Disclaimer `adaptive-disclaim-89` is associated with rule `RUL-2640`. The view reveals the rule-to-disclaimer mapping, supporting compliance audits at the regulatory level.

**View `disclaimer_advertising_rule_view`**

```sql
CREATE VIEW disclaimer_advertising_rule_view AS
SELECT a.id, a.disclaimer_text, a.disclaimer_type, a.prominence_level, b.advertising_rule_id AS rule_advertising_rule_id, b.rule_number AS rule_rule_number, b.rule_title AS rule_rule_title
FROM disclaimers a JOIN advertising_rules b ON a.advertising_rule_id = b.advertising_rule_id;
```

| id | disclaimer_text | disclaimer_type | prominence_level | rule_advertising_rule_id | rule_rule_number | rule_rule_title |
|---|---|---|---|---|---|---|
| 1 | adaptive-disclaim-89 | not_employee | prominent | 100 | RUL-2640 | Integrated Assessment A |
| 2 | distributed-disclaim-90 | dramatization | legible | 101 | RUL-2647 | Extended Survey |
| 3 | baseline-disclaim-91 | actor | intelligible | 102 | RUL-2654 | Pilot Corridor |
| 4 | pilot-disclaim-92 | fee_disclosure | prominent | 103 | RUL-2661 | Baseline Series D |

The `advertising_requirement_advertising_rule_view` joins `advertising_requirements` to `advertising_rules` on `advertising_rule_id`. This view answers: "Which advertising rules are subject to each requirement?" Requirement `distributed-requirem-12` (category `required_content`, safe harbor `false`) applies to rule `RUL-2640`. The view provides a requirement-centric view of rule coverage.

**View `advertising_requirement_advertising_rule_view`**

```sql
CREATE VIEW advertising_requirement_advertising_rule_view AS
SELECT a.advertising_requirement_id, a.requirement_text, a.requirement_category, a.is_safe_harbor, b.advertising_rule_id AS rule_advertising_rule_id, b.rule_number AS rule_rule_number, b.rule_title AS rule_rule_title
FROM advertising_requirements a JOIN advertising_rules b ON a.advertising_rule_id = b.advertising_rule_id;
```

| advertising_requirement_id | requirement_text | requirement_category | is_safe_harbor | rule_advertising_rule_id | rule_rule_number | rule_rule_title |
|---|---|---|---|---|---|---|
| 1000 | distributed-requirem-12 | required_content | false | 100 | RUL-2640 | Integrated Assessment A |
| 1001 | baseline-requirem-13 | prohibited_content | true | 101 | RUL-2647 | Extended Survey |
| 1002 | pilot-requirem-14 | formatting | false | 102 | RUL-2654 | Pilot Corridor |
| 1003 | extended-requirem-15 | disclosure | true | 103 | RUL-2661 | Baseline Series D |

The `advertising_requirement_advertisement_view` joins `advertising_requirements` to `advertisements` on `advertisement_id`. This view answers: "Which advertisements must satisfy each requirement?" Requirement `distributed-requirem-12` applies to advertisement `AD-2371`. The view provides an advertisement-centric compliance checklist, listing all requirements that each ad must meet.

**View `advertising_requirement_advertisement_view`**

```sql
CREATE VIEW advertising_requirement_advertisement_view AS
SELECT a.advertising_requirement_id, a.requirement_text, a.requirement_category, a.is_safe_harbor, b.id AS advertisement_id, b.ad_identifier AS advertisement_ad_identifier, b.media_type AS advertisement_media_type
FROM advertising_requirements a JOIN advertisements b ON a.advertisement_id = b.id;
```

| advertising_requirement_id | requirement_text | requirement_category | is_safe_harbor | advertisement_id | advertisement_ad_identifier | advertisement_media_type |
|---|---|---|---|---|---|---|
| 1000 | distributed-requirem-12 | required_content | false | 1 | AD-2371 | newspaper |
| 1001 | baseline-requirem-13 | prohibited_content | true | 2 | AD-2378 | magazine |
| 1002 | pilot-requirem-14 | formatting | false | 3 | AD-2385 | brochure |
| 1003 | extended-requirem-15 | disclosure | true | 4 | AD-2392 | flyer |

## Synthesis

The schema models legal advertising compliance as a network of interrelated entities, each captured in its own normalized table. Foreign keys in `advertisements` — pointing to `lawyers`, `advertising_rules`, `legal_claims`, and `disclaimers` — establish the primary relationships that bind the domain together. The `advertising_requirements` table and the `rules_requirements` junction table together encode the regulatory obligations that rules impose and that advertisements must satisfy. The fifteen views then reconstruct these relationships in readable form, each answering a distinct question about the compliance landscape. Together, the base tables and views provide a complete, queryable representation of how legal advertisements are governed, attributed, and audited — from the rule that constrains them, through the lawyer who publishes them, to the claims and disclaimers they contain.