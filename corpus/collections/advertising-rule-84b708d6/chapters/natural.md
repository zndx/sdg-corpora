## Legal Advertising Compliance: Records, Rules, and Oversight

Legal advertising sits at the intersection of commercial speech and professional ethics. Every advertisement published by a lawyer must satisfy a layered set of requirements: the medium dictates formatting, the content triggers specific claim types, and disclaimers may be mandatory depending on what is asserted. Regulatory bodies track these relationships through a structured set of records—advertising rules that define what is permissible, advertisements that capture what was actually published, lawyers who bear responsibility, legal claims that form the substance of the message, and disclaimers that mitigate potential misinterpretation. The following chapter documents the entities, processes, and operational relationships that govern this compliance ecosystem.

**Table `advertising_rules`**

| advertising_rule_id | rule_number | rule_title | effective_date | status | section_identifier | advertisement_id |
|---|---|---|---|---|---|---|
| 100 | RUL-2640 | Integrated Assessment A | 2023-02-14T13:27:00 | active | SEC-2022 | 1 |
| 101 | RUL-2647 | Extended Survey | 2024-07-25T20:44:00 | vacant | SEC-2023 | 2 |
| 102 | RUL-2654 | Pilot Corridor | 2025-12-09T03:01:00 | superseded | SEC-2024 | 3 |
| 103 | RUL-2661 | Baseline Series D | 2022-05-20T10:18:00 | active | SEC-2025 | 4 |

Advertising rules form the regulatory backbone of the system. Each rule carries a unique identifier, a human-readable rule number such as RUL-2640, and a descriptive title like Integrated Assessment A. Rules are assigned an effective date and a status—active, vacant, or superseded—that reflects their current standing. The section identifier, for example SEC-2022, ties each rule to a broader regulatory framework. Critically, every rule references an advertisement via the advertisement_id column, anchoring the abstract regulation to a concrete published piece. Rule 100, for instance, is active and linked to advertisement 1, while rule 102 carries a superseded status and points to advertisement 3. This linkage ensures that compliance evaluation can always trace back from a rule to the specific advertisement it governs.

**Table `advertisements`**

| id | ad_identifier | media_type | publication_date | compliance_status | language | fee_offered | fee_validity_days | lawyer_id | advertising_rule_id | legal_claim_id | disclaimer_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | AD-2371 | newspaper | 2025-12-01 | compliant | composite-language-45 | 29.24 | 45 | 100 | 100 | 1000 | 1 |
| 2 | AD-2378 | magazine | 2022-05-12 | deceptive | primary-language-46 | 22.35 | 53 | 101 | 101 | 1001 | 2 |
| 3 | AD-2385 | brochure | 2023-10-23 | misleading | adaptive-language-47 | 33.06 | 61 | 102 | 102 | 1002 | 3 |
| 4 | AD-2392 | flyer | 2024-03-07 | manipulative | distributed-language-48 | 35.45 | 69 | 103 | 103 | 1003 | 4 |

Advertisements are the primary objects of compliance review. Each record captures the ad's identifier, its media type—newspaper, magazine, brochure, or flyer—and the publication date. The compliance_status field records the regulator's assessment, ranging from compliant to deceptive, misleading, or manipulative. Advertisements also carry metadata about language used (composite-language-45, primary-language-46, and so on), the fee offered to prospective clients, and the validity period of that fee offer in days. Each advertisement is associated with a lawyer through lawyer_id, an advertising rule through advertising_rule_id, a legal claim through legal_claim_id, and a disclaimer through disclaimer_id. Advertisement AD-2371, for example, appeared in a newspaper on 2025-12-01, was assessed as compliant, offered a fee of 29.24 valid for 45 days, and was linked to lawyer 100, rule 100, claim 1000, and disclaimer 1.

**Table `lawyers`**

| id | bar_membership_number | lawyer_name | firm_name | office_location | certification_status | is_outof_state | practice_areas | lawyer_id | advertisement_id | provides_referral_to_lawyer_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BAR-2764 | Baseline Model D | Legacy Review D | composite-office-99 | board_certified | false | legacy-practice-43 | 100 | 1 | 100 |
| 101 | BAR-2766 | Distributed Cluster | Regional Initiative | primary-office-100 | specialist | true | compact-practice-44 | 101 | 2 | 101 |
| 102 | BAR-2768 | Adaptive Review | Seasonal Model | adaptive-office-101 | expert | false | composite-practice-45 | 102 | 3 | 102 |
| 103 | BAR-2770 | Primary Initiative A | Integrated Cluster A | distributed-office-102 | not_certified | true | primary-practice-46 | 103 | 4 | 103 |

Lawyers are the accountable parties in this compliance framework. Each lawyer record includes a bar membership number such as BAR-2764, a name, a firm name, and an office location. The certification_status field indicates whether the lawyer is board_certified, a specialist, an expert, or not_certified. The is_outof_state flag distinguishes practitioners who operate across state lines, which carries additional regulatory implications. Practice areas are catalogued as well, with values like legacy-practice-43 and compact-practice-44. The lawyer table also contains a self-referential lawyer_id column and an advertisement_id column that ties each lawyer to a specific advertisement, alongside a provides_referral_to_lawyer_id field that captures referral relationships between practitioners. Lawyer 100, Baseline Model D of Legacy Review D, is board_certified, operates in-state, and practices legacy-practice-43.

**Table `legal_claims`**

| legal_claim_id | claim_text | claim_type | is_verifiable | is_misleading | requires_disclaimer | disclaimer_text | advertisement_id | advertising_rule_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | pilot-claim-56 | success_prediction | true | false | true | adaptive-disclaim-89 | 1 | 100 |
| 1001 | extended-claim-57 | past_result | false | true | false | distributed-disclaim-90 | 2 | 101 |
| 1002 | integrated-claim-58 | skill_comparison | true | false | true | baseline-disclaim-91 | 3 | 102 |
| 1003 | seasonal-claim-59 | fee_statement | false | true | false | pilot-disclaim-92 | 4 | 103 |

Legal claims are the substantive assertions made within advertisements. Each claim has a unique identifier, a claim_text such as pilot-claim-56, and a claim_type that categorizes the nature of the assertion—success_prediction, past_result, skill_comparison, or fee_statement. Boolean flags indicate whether a claim is verifiable and whether it is misleading. The requires_disclaimer flag signals whether the claim type mandates a disclaimer, and the disclaimer_text field provides the specific disclaimer language. Each claim is linked to an advertisement and an advertising rule. Claim 1000, a success_prediction type, is marked as verifiable and not misleading, requires a disclaimer, and is associated with advertisement 1 and rule 100.

**Table `disclaimers`**

| id | disclaimer_text | disclaimer_type | prominence_level | is_mandatory | advertisement_id | advertising_rule_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | adaptive-disclaim-89 | not_employee | prominent | true | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | distributed-disclaim-90 | dramatization | legible | false | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | baseline-disclaim-91 | actor | intelligible | true | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | pilot-disclaim-92 | fee_disclosure | prominent | false | 4 | 103 | 2025-04-16 09:14:00 |

Disclaimers serve as mitigating disclosures that accompany advertisements. Each disclaimer record contains the disclaimer_text, a disclaimer_type such as not_employee, dramatization, actor, or fee_disclosure, and a prominence_level that describes how visibly the disclaimer must appear—prominent, legible, or intelligible. The is_mandatory flag indicates whether the disclaimer is required by regulation. Each disclaimer is tied to an advertisement and an advertising rule, and includes a created_at timestamp. Disclaimer 1, with text adaptive-disclaim-89, is of type not_employee, must be displayed prominently, is mandatory, and was created on 2025-01-01.

**Table `advertising_requirements`**

| advertising_requirement_id | requirement_text | requirement_category | is_safe_harbor | applies_to_media | advertising_rule_id | advertisement_id |
|---|---|---|---|---|---|---|
| 1000 | distributed-requirem-12 | required_content | false | all | 100 | 1 |
| 1001 | baseline-requirem-13 | prohibited_content | true | written | 101 | 2 |
| 1002 | pilot-requirem-14 | formatting | false | spoken | 102 | 3 |
| 1003 | extended-requirem-15 | disclosure | true | electronic | 103 | 4 |

Advertising requirements define the specific obligations that advertisements must satisfy. Each requirement has a unique identifier, a requirement_text, and a requirement_category that classifies it as required_content, prohibited_content, formatting, or disclosure. The is_safe_harbor flag indicates whether compliance with this requirement provides regulatory safe harbor protection. The applies_to_media field specifies which media types the requirement governs—written, spoken, electronic, or all. Each requirement references an advertising rule and an advertisement. Requirement 1000, for example, is a required_content obligation that applies to all media, does not provide safe harbor, and is associated with rule 100 and advertisement 1.

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

The rules_requirements table establishes the many-to-many relationship between advertising rules and advertising requirements. A single rule may impose multiple requirements, and a single requirement may apply across multiple rules. This junction table ensures that compliance evaluation can enumerate all obligations associated with any given rule.

The following views synthesize these base records into analytical perspectives that answer specific compliance questions.

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

This view joins advertising rules with their associated advertising requirements, answering the question: what specific obligations does each rule impose? For rule 100 (RUL-2640, Integrated Assessment A), the view reveals requirement 1000 (distributed-requirem-12), a required_content obligation that applies to all media. The joined result allows a compliance officer to see at a glance which requirements flow from which rules, enabling systematic audit trails.

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

By linking advertising rules to advertisements, this view answers: which advertisements are governed by which rules? Rule 100 governs advertisement 1 (AD-2371), rule 101 governs advertisement 2 (AD-2378), and so on through the full set. This mapping is essential for determining whether an advertisement's compliance_status aligns with the requirements of its governing rule.

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

This view connects advertisements to the lawyers who published them, answering: which lawyer is responsible for which advertisement? Advertisement 1 (AD-2371) was published by lawyer 100 (Baseline Model D, BAR-2764), and advertisement 4 (AD-2392) was published by lawyer 103 (Primary Initiative A, BAR-2770). The joined record includes the lawyer's certification status, firm, and practice areas, providing full context for accountability.

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

This view pairs each advertisement with its governing advertising rule, answering: what regulatory framework applies to each advertisement? Advertisement 1 falls under rule 100 (RUL-2640, effective 2023-02-14, status active), while advertisement 3 falls under rule 102 (RUL-2654, effective 2025-12-09, status superseded). The view enables quick assessment of whether an advertisement is governed by a currently active rule or one that has been superseded.

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

This view links advertisements to the legal claims they contain, answering: what claims does each advertisement make, and are those claims problematic? Advertisement 1 contains claim 1000 (pilot-claim-56), a success_prediction type that is verifiable and not misleading. Advertisement 2 contains claim 1001 (extended-claim-57), a past_result type that is not verifiable and is marked as misleading. This view is critical for identifying advertisements that contain problematic claims.

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

This view associates advertisements with their disclaimers, answering: what disclaimers accompany each advertisement, and are they mandatory? Advertisement 1 carries disclaimer 1 (adaptive-disclaim-89), a not_employee type that is prominent and mandatory. Advertisement 2 carries disclaimer 2 (distributed-disclaim-90), a dramatization type that is legible but not mandatory. The prominence_level and is_mandatory fields allow compliance officers to verify that disclaimers meet regulatory standards.

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

This view captures self-referential relationships among lawyers, answering: which lawyers have internal relationships within the registry? Each lawyer appears alongside their own record, with the provides_referral_to_lawyer_id field indicating referral relationships. Lawyer 100 refers to lawyer 100, lawyer 101 refers to lawyer 101, and so on. This self-referential structure supports tracking of referral networks and potential conflicts of interest.

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

This view connects lawyers to their advertisements, answering: which advertisements has each lawyer published? Lawyer 100 (Baseline Model D) published advertisement 1 (AD-2371), a newspaper ad with compliant status. Lawyer 103 (Primary Initiative A) published advertisement 4 (AD-2392), a flyer with manipulative status. The joined record includes the lawyer's bar membership number, firm, certification status, and practice areas alongside the advertisement's media type, publication date, and compliance assessment.

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

This view links legal claims to their parent advertisements, answering: which advertisement contains each claim? Claim 1000 (pilot-claim-56) appears in advertisement 1, claim 1001 (extended-claim-57) appears in advertisement 2, and so on. The joined result includes the claim's type, verifiability, and misleading status alongside the advertisement's media type and compliance assessment, enabling cross-referencing between claim characteristics and overall ad compliance.

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

This view connects legal claims to the advertising rules that govern them, answering: which rule governs each claim? Claim 1000 is governed by rule 100 (RUL-2640), claim 1001 by rule 101 (RUL-2647), and so on. The joined record includes the rule's status and effective date alongside the claim's type and verifiability, allowing regulators to assess whether claims comply with the requirements of their governing rules.

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

This view associates disclaimers with their parent advertisements, answering: which disclaimer accompanies each advertisement? Disclaimer 1 (adaptive-disclaim-89) accompanies advertisement 1, disclaimer 2 (distributed-disclaim-90) accompanies advertisement 2, and so on. The joined result includes the disclaimer's type, prominence level, and mandatory status alongside the advertisement's media type and compliance assessment.

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

This view links disclaimers to the advertising rules that require them, answering: which rule mandates each disclaimer? Disclaimer 1 is governed by rule 100, disclaimer 2 by rule 101, and so on. The joined record includes the rule's status and effective date alongside the disclaimer's type and mandatory flag, enabling verification that disclaimers align with their governing rules.

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

This view connects advertising requirements to their governing rules, answering: which rule imposes each requirement? Requirement 1000 (distributed-requirem-12) is imposed by rule 100, requirement 1001 (baseline-requirem-13) by rule 101, and so on. The joined result includes the rule's status and section identifier alongside the requirement's category and safe harbor status, providing a complete picture of regulatory obligations.

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

This view links advertising requirements to the advertisements they govern, answering: which requirements apply to each advertisement? Requirement 1000 applies to advertisement 1, requirement 1001 to advertisement 2, and so on. The joined record includes the requirement's category and media applicability alongside the advertisement's media type and compliance status, enabling direct comparison between what is required and what was published.