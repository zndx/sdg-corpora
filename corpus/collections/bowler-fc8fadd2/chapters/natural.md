## Tournament Operations and Compliance

Bowling tournament administration requires a structured pipeline that tracks participants from registration through rule compliance, prize allocation, and dispute resolution. The system records each bowler's declared and verified scoring averages, assigns them to specific tournaments, and enforces a rule framework that governs eligibility. When a bowler's participation is questioned, a formal disqualification letter initiates an appeal window, and the outcome of that appeal determines whether a prize—whether a scratch or handicap award—is ultimately honored. The following sections describe the entities, their relationships, and the analytical views that surface the operational state of any tournament cycle.

**Table `bowlers`**

| id | book_id | full_name | declared_average | verified_average | residential_address | tournament_id | disqualification_letter_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 5082964 | Theodore Mcgrath | 6.95 | 3.20 | compact-resident-62 | 100 | 1 | 2025-01-01 00:14:00 |
| 101 | 2986236 | Account Name | 9.90 | 6.40 | composite-resident-63 | 101 | 2 | 2025-02-06 03:14:00 |
| 102 | lu_tax_code_template_m12 | Saipan International Airport | 12.85 | 9.60 | primary-resident-64 | 102 | 3 | 2025-03-11 06:14:00 |
| 103 | L683 | Norma Fisher | 15.80 | 12.80 | adaptive-resident-65 | 103 | 4 | 2025-04-16 09:14:00 |

The bowler registry captures the core participant profile. Each row carries a numeric identifier, a book identifier that may be numeric or alphanumeric, and the bowler's full name. The declared average represents the self-reported scoring baseline, while the verified average reflects the official measurement after review. For example, Theodore Mcgrath (book 5082964) declared an average of 6.95 but was verified at 3.20, a substantial deviation that would influence prize eligibility. Account Name (book 2986236) declared 9.90 against a verified 6.40, and Norma Fisher (book L683) declared 15.80 against a verified 12.80. The residential address field stores a compacted location code such as compact-resident-62 or adaptive-resident-65. Each bowler record also carries a tournament reference and a disqualification letter reference, anchoring the participant to the broader tournament lifecycle. The created_at timestamp records when the registration was opened.

**Table `tournaments`**

| id | tournament_name | location | manager_name | manager_address | tournament_rule_id | prize_id | bowler_id |
|---|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | extended-manager-57 | 100 | 100 | 100 |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | integrated-manager-58 | 101 | 101 | 101 |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | seasonal-manager-59 | 102 | 102 | 102 |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | regional-manager-60 | 103 | 103 | 103 |

Tournaments form the organizational backbone of the system. Each tournament has a unique identifier, a descriptive name, a location code, and a manager with an associated address. The Legacy Cluster D (id 100) is managed by Extended Initiative at extended-manager-57, while the Regional Review (id 101) falls under Pilot Model A at integrated-manager-58. The Seasonal Initiative (id 102) is overseen by Baseline Cluster at seasonal-manager-59, and the Integrated Model A (id 103) is run by Distributed Review at regional-manager-60. Each tournament row also references a specific rule, a prize, and a bowler, establishing the three-way linkage that drives eligibility and award logic.

**Table `tournament_rules`**

| id | rule_code | rule_description | issuing_body | bowler_id | tournament_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | 2839520 | Integrated Series A | baseline-issuing-13 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | pilot-issuing-14 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | romeg_ul | Pilot Survey | extended-issuing-15 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | integrated-issuing-16 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The rule framework defines the regulatory structure under which each tournament operates. Rules are identified by a code that can be numeric, UUID-formatted, or alphanumeric. Rule 100 carries the code 2839520 and is described as Integrated Series A, issued by baseline-issuing-13. Rule 101 uses the UUID 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 and is labeled Extended Assessment, issued by pilot-issuing-14. Rule 102 bears the code romeg_ul, titled Pilot Survey, and originates from extended-issuing-15. Rule 103 carries the UUID 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3, named Baseline Corridor D, and is issued by integrated-issuing-16. Each rule records its issuing body, the associated bowler and tournament, and timestamps for creation and last update. The updated_at field consistently trails the created_at field by approximately one week, reflecting a standard review cycle.

**Table `disqualification_letters`**

| id | issue_date | appeal_deadline_days | appeal_address | appeal_fax | appeal_email | status | bowler_id | tournament_rule_id | tournament_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | baseline-appeal-13 | pilot-appeal-56 | pending_appeal | 100 | 100 | 100 |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | pilot-appeal-14 | extended-appeal-57 | appeal_received | 101 | 101 | 101 |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | extended-appeal-15 | integrated-appeal-58 | appeal_denied | 102 | 102 | 102 |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | integrated-appeal-16 | seasonal-appeal-59 | appeal_granted | 103 | 103 | 103 |

When a bowler's eligibility is challenged, the system generates a disqualification letter. Each letter carries an issue date, an appeal window measured in days, and contact details for the appeal process including an address, fax, and email. The status field tracks the current disposition: pending_appeal, appeal_received, appeal_denied, or appeal_granted. Letter 1, issued on 2023-02-01, provides a 36-day appeal window and is currently in pending_appeal status. Letter 2, dated 2024-07-12, allows 40 days and shows appeal_received. Letter 3, dated 2025-12-23, grants 44 days and carries appeal_denied. Letter 4, the earliest at 2022-05-07, allows 48 days and has reached appeal_granted. Each letter references the affected bowler, the governing tournament rule, and the tournament itself, creating a complete audit trail.

**Table `prizes`**

| prize_id | prize_type | prize_value | eligibility_status | bowler_id | tournament_id |
|---|---|---|---|---|---|
| 100 | scratch | 18.20 | eligible | 100 | 100 |
| 101 | handicap | 20.40 | disqualified | 101 | 101 |
| 102 | scratch | 22.60 | forfeited | 102 | 102 |
| 103 | handicap | 24.80 | eligible | 103 | 103 |

Prize records define the awards available within each tournament. The prize_type field distinguishes between scratch and handicap awards. Prize 100 is a scratch award valued at 18.20 with eligible status. Prize 101 is a handicap award valued at 20.40 but carries disqualified status. Prize 102 is a scratch award valued at 22.60 with forfeited status. Prize 103 is a handicap award valued at 24.80 and remains eligible. Each prize links to a specific bowler and tournament, ensuring that awards are tracked at the participant level.

**Table `appeals`**

| appeal_id | submission_date | postmark_date | is_written | outcome | disqualification_letter_id | bowler_id | tournament_id |
|---|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | upheld | 1 | 100 | 100 |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | overturned | 2 | 101 | 101 |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | pending | 3 | 102 | 102 |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | upheld | 4 | 103 | 103 |

The appeals table records the formal challenge process. Each appeal has a unique identifier, a submission timestamp, and a postmark date that may precede or follow the submission. The is_written flag indicates whether the appeal was submitted in written form. The outcome field captures one of three states: upheld, overturned, or pending. Appeal 1 was submitted on 2025-04-24 with a postmark of 2024-03-07, was not written, and resulted in upheld. Appeal 2 was submitted on 2022-09-08 with a postmark of 2025-08-18, was written, and was overturned. Appeal 3, submitted on 2023-02-19 with postmark 2022-01-02, was not written and remains pending. Appeal 4, submitted on 2024-07-03 with postmark 2023-06-13, was written and upheld. Each appeal references the originating disqualification letter, the bowler, and the tournament.

### Tournament and Bowler Pairings

The view v_bowler_tournament joins the bowler registry with the tournament roster, answering which bowler is registered for which tournament and at what scoring baseline. Row 100 shows Theodore Mcgrath (declared average 6.95, verified 3.20) assigned to tournament 100, Legacy Cluster D. Row 101 links Account Name (declared 9.90, verified 6.40) to tournament 101, Regional Review. Row 102 associates Saipan International Airport (declared 12.85, verified 9.60) with tournament 102, Seasonal Initiative. Row 103 connects Norma Fisher (declared 15.80, verified 12.80) to tournament 103, Integrated Model A. This view enables administrators to verify that every registered bowler has a corresponding tournament assignment and to compare declared versus verified averages across the field.

### Bowler Disqualification Tracking

The view v_bowler_disqualification_letter connects each bowler to their disqualification letter, surfacing the status and appeal window for every participant under review. Theodore Mcgrath (id 100) is linked to letter 1, issued 2023-02-01 with a 36-day appeal window and pending_appeal status. Account Name (id 101) is linked to letter 2, issued 2024-07-12 with a 40-day window and appeal_received status. Saipan International Airport (id 102) is linked to letter 3, issued 2025-12-23 with a 44-day window and appeal_denied status. Norma Fisher (id 103) is linked to letter 4, issued 2022-05-07 with a 48-day window and appeal_granted status. This view is the primary tool for compliance officers monitoring the disposition of all active disqualifications.

### Tournament Rule Assignment

The view v_tournament_tournament_rule pairs each tournament with its governing rule, clarifying the regulatory framework applied to each event. Tournament 100, Legacy Cluster D, operates under rule 100 (code 2839520, Integrated Series A, issued by baseline-issuing-13). Tournament 101, Regional Review, operates under rule 101 (code 72623baa-9bad-11eb-a8a2-19ed5c03f8d3, Extended Assessment, issued by pilot-issuing-14). Tournament 102, Seasonal Initiative, operates under rule 102 (code romeg_ul, Pilot Survey, issued by extended-issuing-15). Tournament 103, Integrated Model A, operates under rule 103 (code 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3, Baseline Corridor D, issued by integrated-issuing-16). This view ensures that rule changes propagate correctly and that each tournament's regulatory basis is auditable.

### Prize and Tournament Alignment

The view v_tournament_prize links each tournament to its designated prize, revealing the award type, value, and eligibility status. Tournament 100 is associated with prize 100, a scratch award of 18.20 with eligible status. Tournament 101 is associated with prize 101, a handicap award of 20.40 with disqualified status. Tournament 102 is associated with prize 102, a scratch award of 22.60 with forfeited status. Tournament 103 is associated with prize 103, a handicap award of 24.80 with eligible status. The eligibility_status field directly reflects the outcome of the disqualification and appeal process, making this view essential for financial reconciliation.

### Tournament-Bowler Cross-Reference

The view v_tournament_bowler provides a tournament-centric perspective on participant registration, listing each tournament alongside its assigned bowler. Tournament 100 (Legacy Cluster D) is assigned bowler 100 (Theodore Mcgrath). Tournament 101 (Regional Review) is assigned bowler 101 (Account Name). Tournament 102 (Seasonal Initiative) is assigned bowler 102 (Saipan International Airport). Tournament 103 (Integrated Model A) is assigned bowler 103 (Norma Fisher). This view supports roster verification and enables managers to confirm that every tournament has a registered participant and that the bowler's tournament reference is consistent.

### Rule-to-Bowler Compliance Mapping

The view v_tournament_rule_bowler joins the rule framework with the bowler registry, answering which bowler is subject to which rule. Rule 100 (Integrated Series A) applies to bowler 100 (Theodore Mcgrath). Rule 101 (Extended Assessment) applies to bowler 101 (Account Name). Rule 102 (Pilot Survey) applies to bowler 102 (Saipan International Airport). Rule 103 (Baseline Corridor D) applies to bowler 103 (Norma Fisher). This view is critical for compliance audits, as it surfaces the exact regulatory code governing each participant's eligibility.

### Rule-to-Tournament Association

The view v_tournament_rule_tournament maps each rule to the tournament it governs, confirming the rule-tournament linkage. Rule 100 governs tournament 100. Rule 101 governs tournament 101. Rule 102 governs tournament 102. Rule 103 governs tournament 103. This view validates that no rule is orphaned and that every tournament has an active regulatory assignment.

### Disqualification Letter to Bowler

The view v_disqualification_letter_bowler connects each disqualification letter to the bowler it affects, providing a clear mapping for notification and follow-up. Letter 1 targets bowler 100 (Theodore Mcgrath). Letter 2 targets bowler 101 (Account Name). Letter 3 targets bowler 102 (Saipan International Airport). Letter 4 targets bowler 103 (Norma Fisher). This view is used by the appeals office to generate correspondence and track response deadlines.

### Disqualification Letter to Rule

The view v_disqualification_letter_tournament_rule links each disqualification letter to the tournament rule that triggered it, establishing the regulatory basis for the disqualification. Letter 1 was issued under rule 100. Letter 2 was issued under rule 101. Letter 3 was issued under rule 102. Letter 4 was issued under rule 103. This view supports legal review by showing the exact rule citation for each disqualification.

### Disqualification Letter to Tournament

The view v_disqualification_letter_tournament associates each disqualification letter with its parent tournament, providing context for the dispute. Letter 1 relates to tournament 100 (Legacy Cluster D). Letter 2 relates to tournament 101 (Regional Review). Letter 3 relates to tournament 102 (Seasonal Initiative). Letter 4 relates to tournament 103 (Integrated Model A). This view enables tournament managers to assess the impact of disqualifications on their events.

### Prize to Bowler Allocation

The view v_prize_bowler maps each prize to the bowler it is awarded to, clarifying the participant-level award status. Prize 100 (scratch, 18.20, eligible) is allocated to bowler 100 (Theodore Mcgrath). Prize 101 (handicap, 20.40, disqualified) is allocated to bowler 101 (Account Name). Prize 102 (scratch, 22.60, forfeited) is allocated to bowler 102 (Saipan International Airport). Prize 103 (handicap, 24.80, eligible) is allocated to bowler 103 (Norma Fisher). This view is the primary reference for prize disbursement and financial reporting.

### Prize to Tournament Assignment

The view v_prize_tournament links each prize to its parent tournament, confirming the award structure for each event. Prize 100 belongs to tournament 100. Prize 101 belongs to tournament 101. Prize 102 belongs to tournament 102. Prize 103 belongs to tournament 103. This view ensures that prize records are not orphaned and that each tournament has a defined award.

### Appeal to Disqualification Letter

The view v_appeal_disqualification_letter connects each appeal to the disqualification letter it challenges, forming the core of the dispute resolution chain. Appeal 1 challenges letter 1 (pending_appeal, 36-day window). Appeal 2 challenges letter 2 (appeal_received, 40-day window). Appeal 3 challenges letter 3 (appeal_denied, 44-day window). Appeal 4 challenges letter 4 (appeal_granted, 48-day window). This view allows the appeals office to track the lifecycle of every challenge from submission through final disposition.

### Appeal to Bowler

The view v_appeal_bowler maps each appeal to the bowler who filed it, providing a participant-centric view of the dispute process. Appeal 1 was filed by bowler 100 (Theodore Mcgrath) and resulted in upheld. Appeal 2 was filed by bowler 101 (Account Name) and resulted in overturned. Appeal 3 was filed by bowler 102 (Saipan International Airport) and remains pending. Appeal 4 was filed by bowler 103 (Norma Fisher) and resulted in upheld. This view is useful for identifying patterns in appeal outcomes by participant.

### Appeal to Tournament

The view v_appeal_tournament links each appeal to the tournament it concerns, enabling tournament managers to assess the impact of disputes on their events. Appeal 1 concerns tournament 100 (Legacy Cluster D). Appeal 2 concerns tournament 101 (Regional Review). Appeal 3 concerns tournament 102 (Seasonal Initiative). Appeal 4 concerns tournament 103 (Integrated Model A). This view supports operational planning by surfacing which tournaments have active or resolved disputes.

### Synthesis

The tournament operations domain is defined by a tightly coupled set of records that track participants, events, rules, awards, and disputes. A bowler enters the system with a declared and verified average, is assigned to a tournament governed by a specific rule, and may receive a disqualification letter that triggers an appeal window. The appeal outcome determines whether the associated prize—scratch or handicap—is honored, forfeited, or remains under review. The views described above provide the analytical lenses through which administrators can verify registrations, audit compliance, reconcile prize allocations, and monitor the status of all active disputes. Every record in this system exists to ensure that tournament outcomes are transparent, auditable, and consistent with the published rules.

## Data appendix

**View `v_bowler_tournament`**

```sql
CREATE VIEW v_bowler_tournament AS
SELECT a.id, a.book_id, a.full_name, a.declared_average, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM bowlers a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | book_id | full_name | declared_average | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 100 | 5082964 | Theodore Mcgrath | 6.95 | 100 | Legacy Cluster D | extended-location-99 |
| 101 | 2986236 | Account Name | 9.90 | 101 | Regional Review | integrated-location-100 |
| 102 | lu_tax_code_template_m12 | Saipan International Airport | 12.85 | 102 | Seasonal Initiative | seasonal-location-101 |
| 103 | L683 | Norma Fisher | 15.80 | 103 | Integrated Model A | regional-location-102 |

**View `v_bowler_disqualification_letter`**

```sql
CREATE VIEW v_bowler_disqualification_letter AS
SELECT a.id, a.book_id, a.full_name, a.declared_average, b.id AS letter_id, b.issue_date AS letter_issue_date, b.appeal_deadline_days AS letter_appeal_deadline_days
FROM bowlers a JOIN disqualification_letters b ON a.disqualification_letter_id = b.id;
```

| id | book_id | full_name | declared_average | letter_id | letter_issue_date | letter_appeal_deadline_days |
|---|---|---|---|---|---|---|
| 100 | 5082964 | Theodore Mcgrath | 6.95 | 1 | 2023-02-01 | 36 |
| 101 | 2986236 | Account Name | 9.90 | 2 | 2024-07-12 | 40 |
| 102 | lu_tax_code_template_m12 | Saipan International Airport | 12.85 | 3 | 2025-12-23 | 44 |
| 103 | L683 | Norma Fisher | 15.80 | 4 | 2022-05-07 | 48 |

**View `v_tournament_tournament_rule`**

```sql
CREATE VIEW v_tournament_tournament_rule AS
SELECT a.id, a.tournament_name, a.location, a.manager_name, b.id AS rule_id, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description
FROM tournaments a JOIN tournament_rules b ON a.tournament_rule_id = b.id;
```

| id | tournament_name | location | manager_name | rule_id | rule_rule_code | rule_rule_description |
|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | 100 | 2839520 | Integrated Series A |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | 102 | romeg_ul | Pilot Survey |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D |

**View `v_tournament_prize`**

```sql
CREATE VIEW v_tournament_prize AS
SELECT a.id, a.tournament_name, a.location, a.manager_name, b.prize_id AS prize_prize_id, b.prize_type AS prize_prize_type, b.prize_value AS prize_prize_value
FROM tournaments a JOIN prizes b ON a.prize_id = b.prize_id;
```

| id | tournament_name | location | manager_name | prize_prize_id | prize_prize_type | prize_prize_value |
|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | 100 | scratch | 18.20 |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | 101 | handicap | 20.40 |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | 102 | scratch | 22.60 |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | 103 | handicap | 24.80 |

**View `v_tournament_bowler`**

```sql
CREATE VIEW v_tournament_bowler AS
SELECT a.id, a.tournament_name, a.location, a.manager_name, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM tournaments a JOIN bowlers b ON a.bowler_id = b.id;
```

| id | tournament_name | location | manager_name | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | 100 | 5082964 | Theodore Mcgrath |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | 101 | 2986236 | Account Name |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | 103 | L683 | Norma Fisher |

**View `v_tournament_rule_bowler`**

```sql
CREATE VIEW v_tournament_rule_bowler AS
SELECT a.id, a.rule_code, a.rule_description, a.issuing_body, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM tournament_rules a JOIN bowlers b ON a.bowler_id = b.id;
```

| id | rule_code | rule_description | issuing_body | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 100 | 2839520 | Integrated Series A | baseline-issuing-13 | 100 | 5082964 | Theodore Mcgrath |
| 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | pilot-issuing-14 | 101 | 2986236 | Account Name |
| 102 | romeg_ul | Pilot Survey | extended-issuing-15 | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | integrated-issuing-16 | 103 | L683 | Norma Fisher |

**View `v_tournament_rule_tournament`**

```sql
CREATE VIEW v_tournament_rule_tournament AS
SELECT a.id, a.rule_code, a.rule_description, a.issuing_body, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM tournament_rules a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | rule_code | rule_description | issuing_body | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 100 | 2839520 | Integrated Series A | baseline-issuing-13 | 100 | Legacy Cluster D | extended-location-99 |
| 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | pilot-issuing-14 | 101 | Regional Review | integrated-location-100 |
| 102 | romeg_ul | Pilot Survey | extended-issuing-15 | 102 | Seasonal Initiative | seasonal-location-101 |
| 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | integrated-issuing-16 | 103 | Integrated Model A | regional-location-102 |

**View `v_disqualification_letter_bowler`**

```sql
CREATE VIEW v_disqualification_letter_bowler AS
SELECT a.id, a.issue_date, a.appeal_deadline_days, a.appeal_address, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM disqualification_letters a JOIN bowlers b ON a.bowler_id = b.id;
```

| id | issue_date | appeal_deadline_days | appeal_address | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | 100 | 5082964 | Theodore Mcgrath |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | 101 | 2986236 | Account Name |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | 103 | L683 | Norma Fisher |

**View `v_disqualification_letter_tournament_rule`**

```sql
CREATE VIEW v_disqualification_letter_tournament_rule AS
SELECT a.id, a.issue_date, a.appeal_deadline_days, a.appeal_address, b.id AS rule_id, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description
FROM disqualification_letters a JOIN tournament_rules b ON a.tournament_rule_id = b.id;
```

| id | issue_date | appeal_deadline_days | appeal_address | rule_id | rule_rule_code | rule_rule_description |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | 100 | 2839520 | Integrated Series A |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | 102 | romeg_ul | Pilot Survey |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D |

**View `v_disqualification_letter_tournament`**

```sql
CREATE VIEW v_disqualification_letter_tournament AS
SELECT a.id, a.issue_date, a.appeal_deadline_days, a.appeal_address, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM disqualification_letters a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | issue_date | appeal_deadline_days | appeal_address | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | 100 | Legacy Cluster D | extended-location-99 |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | 101 | Regional Review | integrated-location-100 |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | 102 | Seasonal Initiative | seasonal-location-101 |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | 103 | Integrated Model A | regional-location-102 |

**View `v_prize_bowler`**

```sql
CREATE VIEW v_prize_bowler AS
SELECT a.prize_id, a.prize_type, a.prize_value, a.eligibility_status, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM prizes a JOIN bowlers b ON a.bowler_id = b.id;
```

| prize_id | prize_type | prize_value | eligibility_status | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 100 | scratch | 18.20 | eligible | 100 | 5082964 | Theodore Mcgrath |
| 101 | handicap | 20.40 | disqualified | 101 | 2986236 | Account Name |
| 102 | scratch | 22.60 | forfeited | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 103 | handicap | 24.80 | eligible | 103 | L683 | Norma Fisher |

**View `v_prize_tournament`**

```sql
CREATE VIEW v_prize_tournament AS
SELECT a.prize_id, a.prize_type, a.prize_value, a.eligibility_status, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM prizes a JOIN tournaments b ON a.tournament_id = b.id;
```

| prize_id | prize_type | prize_value | eligibility_status | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 100 | scratch | 18.20 | eligible | 100 | Legacy Cluster D | extended-location-99 |
| 101 | handicap | 20.40 | disqualified | 101 | Regional Review | integrated-location-100 |
| 102 | scratch | 22.60 | forfeited | 102 | Seasonal Initiative | seasonal-location-101 |
| 103 | handicap | 24.80 | eligible | 103 | Integrated Model A | regional-location-102 |

**View `v_appeal_disqualification_letter`**

```sql
CREATE VIEW v_appeal_disqualification_letter AS
SELECT a.appeal_id, a.submission_date, a.postmark_date, a.is_written, b.id AS letter_id, b.issue_date AS letter_issue_date, b.appeal_deadline_days AS letter_appeal_deadline_days
FROM appeals a JOIN disqualification_letters b ON a.disqualification_letter_id = b.id;
```

| appeal_id | submission_date | postmark_date | is_written | letter_id | letter_issue_date | letter_appeal_deadline_days |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | 1 | 2023-02-01 | 36 |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | 2 | 2024-07-12 | 40 |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | 3 | 2025-12-23 | 44 |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | 4 | 2022-05-07 | 48 |

**View `v_appeal_bowler`**

```sql
CREATE VIEW v_appeal_bowler AS
SELECT a.appeal_id, a.submission_date, a.postmark_date, a.is_written, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM appeals a JOIN bowlers b ON a.bowler_id = b.id;
```

| appeal_id | submission_date | postmark_date | is_written | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | 100 | 5082964 | Theodore Mcgrath |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | 101 | 2986236 | Account Name |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | 103 | L683 | Norma Fisher |

**View `v_appeal_tournament`**

```sql
CREATE VIEW v_appeal_tournament AS
SELECT a.appeal_id, a.submission_date, a.postmark_date, a.is_written, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM appeals a JOIN tournaments b ON a.tournament_id = b.id;
```

| appeal_id | submission_date | postmark_date | is_written | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | 100 | Legacy Cluster D | extended-location-99 |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | 101 | Regional Review | integrated-location-100 |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | 102 | Seasonal Initiative | seasonal-location-101 |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | 103 | Integrated Model A | regional-location-102 |
