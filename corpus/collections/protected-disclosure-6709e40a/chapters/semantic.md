## Domain Modelling and Relational Materialisation

The protected-disclosure ecosystem captures the lifecycle of institutional accountability: a person reports misconduct, the report is classified and triaged, an investigation is launched and staffed, and the consequences—ranging from corrective action to resource reallocation—are recorded. The ontology underlying this domain distinguishes six entity types—`whistleblowers`, `protected_disclosures`, `improper_conducts`, `investigations`, `investigators`, and `college_resources`—plus a many-to-many association between investigations and investigators. Each entity materialises as a relational table whose columns encode the ontology's attributes and whose foreign keys encode the cardinality-bounded relationships. Views then reassemble the normalised facts into domain-level narratives.

**Table `protected_disclosures`**

| disclosure_id | disclosure_date | disclosure_method | is_good_faith | subject_matter | retaliation_status | whistleblower_id | investigation_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | email | true | seasonal-subject-29 | none | 1 | 100 | 2025-01-01 00:14:00 |
| 1250217 | 2022-01-13T02:50:00 | phone | false | regional-subject-30 | reported | 2 | 101 | 2025-02-06 03:14:00 |
| 4447022 | 2023-06-24T09:07:00 | in-person | true | legacy-subject-31 | investigating | 3 | 102 | 2025-03-11 06:14:00 |
| 1437596 | 2024-11-08T16:24:00 | written | false | compact-subject-32 | substantiated | 4 | 103 | 2025-04-16 09:14:00 |

The `protected_disclosures` table is the central event table. Each row records a single disclosure event with a surrogate `disclosure_id` (e.g. `195359`), a timestamped `disclosure_date` (`2025-08-02T19:33:00`), and a `disclosure_method` drawn from the finite set {`email`, `phone`, `in-person`, `written`}. The boolean `is_good_faith` flag (`true` for disclosure `195359`, `false` for `1250217`) captures the reporter's stated intent. The `subject_matter` column holds categorical labels such as `seasonal-subject-29` or `regional-subject-30`, while `retaliation_status` tracks the post-report trajectory through the ordered states {`none`, `reported`, `investigating`, `substantiated`}. Two foreign keys anchor the disclosure to its actors and outcomes: `whistleblower_id` references `whistleblowers(whistleblower_id)`, and `investigation_id` references `investigations(id)`. The `created_at` column (`2025-01-01 00:14:00`) records ingestion time.

**Table `whistleblowers`**

| whistleblower_id | person_id | role | campus_affiliation | contact_email | contact_phone | protection_status | disclosure_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | student | Davenport | Christopher Wilson | Joe Tsai | active | 195359 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Maria Rodriguez | employee | West | Charles Larsen | Stephanie Collins | inactive | 1250217 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Sarah Villanueva | faculty | Florida | Mary Alvarez | Tasha Rodriguez | active | 4447022 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Susan Wagner | affiliate | Davenport | April Snyder | Walter Pratt | inactive | 1437596 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `whistleblowers` table stores the reporting persons. Its primary key `whistleblower_id` (values `1` through `4`) is a surrogate; the human identity lives in `person_id` (e.g. `George Bernard Shaw`, `Maria Rodriguez`). The `role` column distinguishes `student`, `employee`, `faculty`, and `affiliate`, while `campus_affiliation` restricts to {`Davenport`, `West`, `Florida`}. Contact details are captured in `contact_email` and `contact_phone`. The `protection_status` enum {`active`, `inactive`} governs whether the whistleblower remains eligible for protective measures. A foreign key `disclosure_id` points back to `protected_disclosures(disclosure_id)`, enforcing the one-to-one cardinality that each whistleblower row corresponds to exactly one disclosure event in this dataset.

**Table `improper_conducts`**

| id | conduct_id | conduct_date | conduct_type | severity_level | is_criminal | description | disclosure_id | investigation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2986238 | 2025-12-12T23:21:00 | legal_violation | 29 | false | Extended Survey | 195359 | 100 |
| 2 | 3744007 | 2022-05-23T06:38:00 | misuse_of_resources | 40 | true | Pilot Corridor A | 1250217 | 101 |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 | economic_waste | 51 | false | Baseline Series | 4447022 | 102 |
| 4 | 10238282 | 2024-03-18T20:12:00 | safety_threat | 62 | true | Distributed Assessment | 1437596 | 103 |

`improper_conducts` records the alleged wrongdoing that triggered the disclosure. The surrogate `id` (sequential integers `1`–`4`) serves as the primary key, while `conduct_id` carries a business identifier (e.g. `2986238`, `3744007`, or a UUID such as `e5a1c32e-8fc3-11eb-924d-9cd76263cbd0`). The `conduct_date` (`2025-12-12T23:21:00`) timestamps the event. `conduct_type` enumerates {`legal_violation`, `misuse_of_resources`, `economic_waste`, `safety_threat`}, and `severity_level` is a numeric score (values `29`, `40`, `51`, `62`). The boolean `is_criminal` (`true` for conduct `2` and `4`) flags criminal referrals. A free-text `description` (e.g. `Extended Survey`, `Pilot Corridor A`) provides context. Foreign keys `disclosure_id` and `investigation_id` link the conduct to its originating disclosure and its assigned investigation.

**Table `investigations`**

| id | investigation_id | start_date | end_date | status | findings_summary | corrective_action_taken | disclosure_id | improper_conduct_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | pilot-findings-32 | true | 195359 | 1 |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | extended-findings-33 | false | 1250217 | 2 |
| 102 | 974942 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | integrated-findings-34 | true | 4447022 | 3 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | closed | seasonal-findings-35 | false | 1437596 | 4 |

The `investigations` table models the inquiry lifecycle. Its primary key `id` (values `100`–`103`) is a surrogate; the `investigation_id` column carries a Google Places-style identifier (e.g. `ChIJCbVGx_tt5kcRJYrXOupoDgA`). The `start_date` and `end_date` columns (`2022-09-05T20:24:00` and `2022-09-01T08:00:00` for investigation `100`) bracket the inquiry window. The `status` enum {`pending`, `active`, `completed`, `closed`} tracks progress, while `findings_summary` holds a categorical label such as `pilot-findings-32`. The boolean `corrective_action_taken` records whether remediation was enacted. Foreign keys `disclosure_id` and `improper_conduct_id` tie the investigation to its triggering disclosure and the specific conduct under review.

**Table `investigators`**

| investigator_id | person_id | role | assigned_campus | authorization_date | current_case_load | investigation_id |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | employee | Davenport | 2022-05-19T16:24:00 | 28 | 100 |
| 2 | Maria Rodriguez | faculty | West | 2023-10-03T23:41:00 | 34 | 101 |
| 3 | Sarah Villanueva | external | Florida | 2024-03-14T06:58:00 | 40 | 102 |
| 4 | Susan Wagner | employee | Davenport | 2025-08-25T13:15:00 | 46 | 103 |

`investigators` stores the personnel assigned to inquiries. The surrogate `investigator_id` (`1`–`4`) is the primary key. `person_id` carries the investigator's name (e.g. `Sarah Villanueva`, `Susan Wagner`), `role` distinguishes `employee`, `faculty`, and `external` contributors, and `assigned_campus` restricts to {`Davenport`, `West`, `Florida`}. The `authorization_date` (`2022-05-19T16:24:00`) records when the investigator was credentialed, and `current_case_load` (values `28`, `34`, `40`, `46`) tracks active assignments. The foreign key `investigation_id` links each investigator to a single investigation in this normalised design.

**Table `college_resources`**

| resource_id | resource_type | description | value | owner | improper_conduct_id |
|---|---|---|---|---|---|
| 1167 | cash | Extended Survey | 19.95 | Roger Graham | 1 |
| 2106708 | tangible_property | Pilot Corridor A | 21.90 | Corey Wood | 2 |
| 4180945 | intangible_property | Baseline Series | 23.85 | Jason Beltran | 3 |
| 10238270 | receivables | Distributed Assessment | 25.80 | Carlos Kennedy | 4 |

`college_resources` captures assets affected by or allocated to improper conduct. The `resource_id` (e.g. `1167`, `2106708`) is the primary key. `resource_type` enumerates {`cash`, `tangible_property`, `intangible_property`, `receivables`}, and `description` mirrors the conduct description (e.g. `Extended Survey`, `Baseline Series`). The `value` column holds a numeric amount (`19.95`, `21.90`, `23.85`, `25.80`), and `owner` names the responsible party (e.g. `Roger Graham`, `Carlos Kennedy`). The foreign key `improper_conduct_id` references `improper_conducts(id)`, establishing a one-to-many relationship: a single conduct may implicate multiple resources.

**Table `investigations_investigators`**

| investigation_id | investigator_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `investigations_investigators` junction table resolves the many-to-many relationship between `investigations` and `investigators` that the ontology requires but the individual entity tables cannot express alone. Each row pairs an `investigation_id` with an `investigator_id`, allowing a single investigation to be staffed by multiple investigators and a single investigator to serve on multiple investigations. This table is the relational materialisation of the `Investigates` association class in the domain ontology.

The base tables together form a star-like normalised schema centred on `protected_disclosures`. The foreign-key graph is: `protected_disclosures.whistleblower_id → whistleblowers.whistleblower_id`; `protected_disclosures.investigation_id → investigations.id`; `improper_conducts.disclosure_id → protected_disclosures.disclosure_id`; `improper_conducts.investigation_id → investigations.id`; `investigators.investigation_id → investigations.id`; `college_resources.improper_conduct_id → improper_conducts.id`; and the bidirectional links through `investigations_investigators`. This design eliminates redundancy while preserving every domain fact as a join.

**View `protected_disclosure_whistleblower_view`**

```sql
CREATE VIEW protected_disclosure_whistleblower_view AS
SELECT a.disclosure_id, a.disclosure_date, a.disclosure_method, a.is_good_faith, b.whistleblower_id AS whistleblower_whistleblower_id, b.person_id AS whistleblower_person_id, b.role AS whistleblower_role
FROM protected_disclosures a JOIN whistleblowers b ON a.whistleblower_id = b.whistleblower_id;
```

| disclosure_id | disclosure_date | disclosure_method | is_good_faith | whistleblower_whistleblower_id | whistleblower_person_id | whistleblower_role |
|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | email | true | 1 | George Bernard Shaw | student |
| 1250217 | 2022-01-13T02:50:00 | phone | false | 2 | Maria Rodriguez | employee |
| 4447022 | 2023-06-24T09:07:00 | in-person | true | 3 | Sarah Villanueva | faculty |
| 1437596 | 2024-11-08T16:24:00 | written | false | 4 | Susan Wagner | affiliate |

This view joins `protected_disclosures` to `whistleblowers` on `disclosure_id = whistleblower_id`, answering the question: *who reported each disclosure and under what circumstances?* Reading the row for disclosure `195359`, the view reveals that George Bernard Shaw, a `student` at `Davenport` with `active` protection status, filed the report via `email` in `good_faith` about `seasonal-subject-29`. The second row shows Maria Rodriguez, an `employee` at `West` with `inactive` status, reporting `regional-subject-30` by `phone` without a good-faith declaration. The view collapses the two-table relationship into a single fact: the reporter's identity, role, campus, and protection status are always co-located with the disclosure's method and subject matter.

**View `protected_disclosure_investigation_view`**

```sql
CREATE VIEW protected_disclosure_investigation_view AS
SELECT a.disclosure_id, a.disclosure_date, a.disclosure_method, a.is_good_faith, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.start_date AS investigation_start_date
FROM protected_disclosures a JOIN investigations b ON a.investigation_id = b.id;
```

| disclosure_id | disclosure_date | disclosure_method | is_good_faith | investigation_id | investigation_investigation_id | investigation_start_date |
|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | email | true | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 |
| 1250217 | 2022-01-13T02:50:00 | phone | false | 101 | 8843769 | 2023-02-16T03:41:00 |
| 4447022 | 2023-06-24T09:07:00 | in-person | true | 102 | 974942 | 2024-07-27T10:58:00 |
| 1437596 | 2024-11-08T16:24:00 | written | false | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 |

Joining `protected_disclosures` to `investigations` on `investigation_id`, this view answers: *what investigation was launched for each disclosure, and what is its current state?* For disclosure `4447022`, the view shows investigation `102` with status `completed`, findings `integrated-findings-34`, and `corrective_action_taken = true`. Disclosure `1437596` maps to investigation `103` (status `closed`, findings `seasonal-findings-35`, no corrective action). The view makes it possible to query, for example, which disclosures led to investigations that are still `pending` or `active`.

**View `whistleblower_protected_disclosure_view`**

```sql
CREATE VIEW whistleblower_protected_disclosure_view AS
SELECT a.whistleblower_id, a.person_id, a.role, a.campus_affiliation, b.disclosure_id AS disclosure_disclosure_id, b.disclosure_date AS disclosure_disclosure_date, b.disclosure_method AS disclosure_disclosure_method
FROM whistleblowers a JOIN protected_disclosures b ON a.disclosure_id = b.disclosure_id;
```

| whistleblower_id | person_id | role | campus_affiliation | disclosure_disclosure_id | disclosure_disclosure_date | disclosure_disclosure_method |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | student | Davenport | 195359 | 2025-08-02T19:33:00 | email |
| 2 | Maria Rodriguez | employee | West | 1250217 | 2022-01-13T02:50:00 | phone |
| 3 | Sarah Villanueva | faculty | Florida | 4447022 | 2023-06-24T09:07:00 | in-person |
| 4 | Susan Wagner | affiliate | Davenport | 1437596 | 2024-11-08T16:24:00 | written |

This is the inverse of the first view: it joins `whistleblowers` to `protected_disclosures` and answers *what did each whistleblower report?* The row for whistleblower `3` (Sarah Villanueva, `faculty` at `Florida`, `active`) shows the disclosure `4447022` filed on `2023-06-24` by `in-person` method, with subject `legacy-subject-31` and retaliation status `investigating`. The row for whistleblower `4` (Susan Wagner, `affiliate` at `Davenport`, `inactive`) shows disclosure `1437596` filed `2024-11-08` via `written` method, subject `compact-subject-32`, with retaliation status `substantiated`. This orientation is useful when auditing a specific person's reporting history.

**View `improper_conduct_protected_disclosure_view`**

```sql
CREATE VIEW improper_conduct_protected_disclosure_view AS
SELECT a.id, a.conduct_id, a.conduct_date, a.conduct_type, b.disclosure_id AS disclosure_disclosure_id, b.disclosure_date AS disclosure_disclosure_date, b.disclosure_method AS disclosure_disclosure_method
FROM improper_conducts a JOIN protected_disclosures b ON a.disclosure_id = b.disclosure_id;
```

| id | conduct_id | conduct_date | conduct_type | disclosure_disclosure_id | disclosure_disclosure_date | disclosure_disclosure_method |
|---|---|---|---|---|---|---|
| 1 | 2986238 | 2025-12-12T23:21:00 | legal_violation | 195359 | 2025-08-02T19:33:00 | email |
| 2 | 3744007 | 2022-05-23T06:38:00 | misuse_of_resources | 1250217 | 2022-01-13T02:50:00 | phone |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 | economic_waste | 4447022 | 2023-06-24T09:07:00 | in-person |
| 4 | 10238282 | 2024-03-18T20:12:00 | safety_threat | 1437596 | 2024-11-08T16:24:00 | written |

Joining `improper_conducts` to `protected_disclosures` on `disclosure_id`, this view answers: *what misconduct was alleged in each disclosure?* The row for conduct `id = 1` (type `legal_violation`, severity `29`, not criminal) links to disclosure `195359` about `seasonal-subject-29`. Conduct `id = 2` (type `misuse_of_resources`, severity `40`, `is_criminal = true`) links to disclosure `1250217` about `regional-subject-30`. The view surfaces the conduct's `description` (e.g. `Extended Survey`, `Pilot Corridor A`) alongside the disclosure's `subject_matter`, enabling cross-referencing of the alleged act with the report's framing.

**View `improper_conduct_investigation_view`**

```sql
CREATE VIEW improper_conduct_investigation_view AS
SELECT a.id, a.conduct_id, a.conduct_date, a.conduct_type, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.start_date AS investigation_start_date
FROM improper_conducts a JOIN investigations b ON a.investigation_id = b.id;
```

| id | conduct_id | conduct_date | conduct_type | investigation_id | investigation_investigation_id | investigation_start_date |
|---|---|---|---|---|---|---|
| 1 | 2986238 | 2025-12-12T23:21:00 | legal_violation | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 |
| 2 | 3744007 | 2022-05-23T06:38:00 | misuse_of_resources | 101 | 8843769 | 2023-02-16T03:41:00 |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 | economic_waste | 102 | 974942 | 2024-07-27T10:58:00 |
| 4 | 10238282 | 2024-03-18T20:12:00 | safety_threat | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 |

This view joins `improper_conducts` to `investigations` on `investigation_id`, answering: *which investigation is examining which misconduct?* Conduct `id = 1` (severity `29`, description `Extended Survey`) is under investigation `100` (status `pending`, findings `pilot-findings-32`, corrective action taken). Conduct `id = 4` (severity `62`, description `Distributed Assessment`, `is_criminal = true`) is under investigation `103` (status `closed`, findings `seasonal-findings-35`, no corrective action). The view is the natural query surface for risk-assessment dashboards that need to correlate severity levels with investigation outcomes.

**View `investigation_protected_disclosure_view`**

```sql
CREATE VIEW investigation_protected_disclosure_view AS
SELECT a.id, a.investigation_id, a.start_date, a.end_date, b.disclosure_id AS disclosure_disclosure_id, b.disclosure_date AS disclosure_disclosure_date, b.disclosure_method AS disclosure_disclosure_method
FROM investigations a JOIN protected_disclosures b ON a.disclosure_id = b.disclosure_id;
```

| id | investigation_id | start_date | end_date | disclosure_disclosure_id | disclosure_disclosure_date | disclosure_disclosure_method |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 195359 | 2025-08-02T19:33:00 | email |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1250217 | 2022-01-13T02:50:00 | phone |
| 102 | 974942 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 4447022 | 2023-06-24T09:07:00 | in-person |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1437596 | 2024-11-08T16:24:00 | written |

Joining `investigations` to `protected_disclosures` on `disclosure_id`, this view answers: *which disclosure triggered each investigation?* Investigation `101` (status `active`, findings `extended-findings-33`, no corrective action) was triggered by disclosure `1250217` (method `phone`, subject `regional-subject-30`, retaliation `reported`). Investigation `102` (status `completed`, findings `integrated-findings-34`, corrective action taken) was triggered by disclosure `4447022` (method `in-person`, subject `legacy-subject-31`, retaliation `investigating`). This orientation is useful for retrospective analysis of whether certain disclosure methods correlate with investigation outcomes.

**View `investigation_investigator_detail_view`**

```sql
CREATE VIEW investigation_investigator_detail_view AS
SELECT a.id, a.investigation_id, a.start_date, b.investigator_id AS investigator_investigator_id, b.person_id AS investigator_person_id, b.role AS investigator_role
FROM investigations a
  JOIN investigations_investigators j ON j.investigation_id = a.id
  JOIN investigators b ON b.investigator_id = j.investigator_id;
```

| id | investigation_id | start_date | investigator_investigator_id | investigator_person_id | investigator_role |
|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 1 | George Bernard Shaw | employee |
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2 | Maria Rodriguez | faculty |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2 | Maria Rodriguez | faculty |
| 101 | 8843769 | 2023-02-16T03:41:00 | 3 | Sarah Villanueva | external |
| 102 | 974942 | 2024-07-27T10:58:00 | 3 | Sarah Villanueva | external |
| 102 | 974942 | 2024-07-27T10:58:00 | 4 | Susan Wagner | employee |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 4 | Susan Wagner | employee |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 1 | George Bernard Shaw | employee |

This view joins `investigations` to `investigators` on `investigation_id`, answering: *who is investigating each case and what is their workload?* Investigation `100` (status `pending`, findings `pilot-findings-32`) is assigned to investigator `1` (George Bernard Shaw, `employee` at `Davenport`, case load `28`). Investigation `103` (status `closed`, findings `seasonal-findings-35`) is assigned to investigator `4` (Susan Wagner, `employee` at `Davenport`, case load `46`). The view surfaces the investigator's `authorization_date` alongside the investigation's timeline, enabling analysis of whether newer authorisations correlate with longer investigation durations.

**View `investigation_improper_conduct_view`**

```sql
CREATE VIEW investigation_improper_conduct_view AS
SELECT a.id, a.investigation_id, a.start_date, a.end_date, b.id AS conduct_id, b.conduct_id AS conduct_conduct_id, b.conduct_date AS conduct_conduct_date
FROM investigations a JOIN improper_conducts b ON a.improper_conduct_id = b.id;
```

| id | investigation_id | start_date | end_date | conduct_id | conduct_conduct_id | conduct_conduct_date |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 2986238 | 2025-12-12T23:21:00 |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 3744007 | 2022-05-23T06:38:00 |
| 102 | 974942 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 10238282 | 2024-03-18T20:12:00 |

Joining `investigations` to `improper_conducts` on `improper_conduct_id`, this view answers: *what specific misconduct is each investigation examining?* Investigation `101` (status `active`, findings `extended-findings-33`) examines conduct `id = 2` (type `misuse_of_resources`, severity `40`, `is_criminal = true`, description `Pilot Corridor A`). Investigation `102` (status `completed`, findings `integrated-findings-34`, corrective action taken) examines conduct `id = 3` (type `economic_waste`, severity `51`, not criminal, description `Baseline Series`). The view is the primary surface for compliance dashboards that need to display the conduct type and severity alongside the investigation's current status.

**View `investigator_investigation_view`**

```sql
CREATE VIEW investigator_investigation_view AS
SELECT a.investigator_id, a.person_id, a.role, a.assigned_campus, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.start_date AS investigation_start_date
FROM investigators a JOIN investigations b ON a.investigation_id = b.id;
```

| investigator_id | person_id | role | assigned_campus | investigation_id | investigation_investigation_id | investigation_start_date |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | employee | Davenport | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 |
| 2 | Maria Rodriguez | faculty | West | 101 | 8843769 | 2023-02-16T03:41:00 |
| 3 | Sarah Villanueva | external | Florida | 102 | 974942 | 2024-07-27T10:58:00 |
| 4 | Susan Wagner | employee | Davenport | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 |

This view joins `investigators` to `investigations` on `investigation_id`, answering: *what investigations is each investigator assigned to?* Investigator `2` (Maria Rodriguez, `faculty` at `West`, case load `34`) is assigned to investigation `101` (status `active`, findings `extended-findings-33`). Investigator `3` (Sarah Villanueva, `external` at `Florida`, case load `40`) is assigned to investigation `102` (status `completed`, findings `integrated-findings-34`). The view is useful for workload balancing: comparing `current_case_load` against the number of investigations returned by the join reveals whether the load metric is accurate.

**View `college_resource_improper_conduct_view`**

```sql
CREATE VIEW college_resource_improper_conduct_view AS
SELECT a.resource_id, a.resource_type, a.description, a.value, b.id AS conduct_id, b.conduct_id AS conduct_conduct_id, b.conduct_date AS conduct_conduct_date
FROM college_resources a JOIN improper_conducts b ON a.improper_conduct_id = b.id;
```

| resource_id | resource_type | description | value | conduct_id | conduct_conduct_id | conduct_conduct_date |
|---|---|---|---|---|---|---|
| 1167 | cash | Extended Survey | 19.95 | 1 | 2986238 | 2025-12-12T23:21:00 |
| 2106708 | tangible_property | Pilot Corridor A | 21.90 | 2 | 3744007 | 2022-05-23T06:38:00 |
| 4180945 | intangible_property | Baseline Series | 23.85 | 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 |
| 10238270 | receivables | Distributed Assessment | 25.80 | 4 | 10238282 | 2024-03-18T20:12:00 |

Joining `college_resources` to `improper_conducts` on `improper_conduct_id`, this view answers: *which college assets are implicated by each misconduct?* Resource `1167` (type `cash`, value `19.95`, owner `Roger Graham`) is linked to conduct `id = 1` (type `legal_violation`, description `Extended Survey`). Resource `10238270` (type `receivables`, value `25.80`, owner `Carlos Kennedy`) is linked to conduct `id = 4` (type `safety_threat`, description `Distributed Assessment`). The view surfaces the full resource profile—type, value, and owner—alongside the conduct's severity and criminal status, enabling financial-impact analysis of misconduct events.

The relational schema is a disciplined normalisation of the protected-disclosure ontology. Base tables encode entity attributes and one-to-many relationships as foreign keys; the junction table `investigations_investigators` resolves the many-to-many association; and the ten views reassemble the normalised facts into domain-level narratives—reporter-to-disclosure, disclosure-to-investigation, conduct-to-investigation, investigator-to-case, and resource-to-conduct. Each view answers a specific analytical question by joining exactly two tables, and the join predicate is always a foreign-key relationship defined in the base schema. This design ensures that every domain fact is stored once, referenced consistently, and reconstructable on demand through declarative joins.