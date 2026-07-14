## The Adopted Person Schema: From Ontology to Relational Normalization

The domain centres on a theological-administrative concept of spiritual adoption, where persons undergo a formal adoption process mediated by divine entities, sealed through ritual acts, and ultimately granted eternal inheritances. The relational model captures this lifecycle through six core entity tables, six many-to-many junction tables, and a suite of denormalized views that reconstruct domain facts for reporting. The primary entity, `adopted_persons`, anchors the entire schema. Each row represents a person who has entered the adoption process, carrying a natural-language identifier in `person_id` (such as `George Bernard Shaw` or `Maria Rodriguez`), a `justification_date` marking when the adoption was initiated, and an `adoption_status` that tracks progress through the workflow as `pending`, `sealed`, or `complete`. The column `spiritual_name` assigns a ceremonial name — `Mark Landry`, `Kimberly Smith`, `Timothy Hamilton`, or `Mother Teresa` — while `inheritance_status` records whether the person's inheritance is `partial` or `full`. A `redemption_day` timestamp anchors the person to a specific moment in the spiritual calendar. Two foreign keys, `adoption_spirit_id` and `adoption_seal_id`, bind each adopted person to their respective spirit and seal entities, establishing the primary relational spine of the model.

**Table `adopted_persons`**

| id | person_id | justification_date | adoption_status | spiritual_name | inheritance_status | redemption_day | adoption_spirit_id | adoption_seal_id |
|---|---|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | 2024-03-27T02:18:00 | pending | Mark Landry | partial | 2022-05-11T16:00:00 | 1 | 1000 |
| 101 | Maria Rodriguez | 2025-08-11T09:35:00 | sealed | Kimberly Smith | full | 2023-10-22T23:17:00 | 2 | 1001 |
| 102 | Sarah Villanueva | 2022-01-22T16:52:00 | complete | Timothy Hamilton | partial | 2024-03-06T06:34:00 | 3 | 1002 |
| 103 | Susan Wagner | 2023-06-06T23:09:00 | pending | Mother Teresa | full | 2025-08-17T13:51:00 | 4 | 1003 |

The `adoption_spirits` table defines the spiritual agents that mediate adoption. Each spirit carries a `spirit_id` that can be either a numeric identifier like `82872` or `1186104`, a UUID such as `55474a69-49cb-42df-8a71-5283e04141ed`, or a domain-specific string like `lu_tax_code_template_m_I_1`. The `bestowal_date` records when the spirit was conferred, `spirit_type` classifies it as either `adoption` or `guarantee`, and `function_description` provides a human-readable label — `Adaptive Assessment`, `Primary Survey`, `Composite Corridor D`, or `Compact Series`. The one-to-many relationship from `adoption_spirits` to `adopted_persons` is realised through the `adoption_spirit_id` foreign key in the adopted persons table, meaning each adopted person is associated with exactly one adoption spirit, while a single spirit may be referenced by multiple persons.

**Table `adoption_spirits`**

| id | spirit_id | bestowal_date | spirit_type | function_description |
|---|---|---|---|---|
| 1 | 82872 | 2022-05-12T04:36:00 | adoption | Adaptive Assessment |
| 2 | 55474a69-49cb-42df-8a71-5283e04141ed | 2023-10-23T11:53:00 | guarantee | Primary Survey |
| 3 | 1186104 | 2024-03-07T18:10:00 | adoption | Composite Corridor D |
| 4 | lu_tax_code_template_m_I_1 | 2025-08-18T01:27:00 | guarantee | Compact Series |

Divine privileges represent the rights and benefits conferred upon adopted persons. The `divine_privileges` table stores each privilege with a `privilege_id` (numeric values such as `338532`, `2106707`, `168536`, or `3706`), a `privilege_type` drawn from the set `access`, `provision`, `protection`, and `pity`, and a `scriptural_reference` like `primary-scriptur-34` or `adaptive-scriptur-35`. The `beneficiary_count` column quantifies how many persons hold the privilege, ranging from `0` for the `pity` privilege to `93` for `protection`. A foreign key `divine_father_id` links each privilege to its granting father entity. The cardinality here is one-to-many: each divine father can grant multiple privileges, but each privilege is granted by exactly one father.

**Table `divine_privileges`**

| id | privilege_id | privilege_type | scriptural_reference | beneficiary_count | divine_father_id |
|---|---|---|---|---|---|
| 1 | 338532 | access | primary-scriptur-34 | 12 | 100 |
| 2 | 2106707 | provision | adaptive-scriptur-35 | 24 | 101 |
| 3 | 168536 | protection | distributed-scriptur-36 | 93 | 102 |
| 4 | 3706 | pity | baseline-scriptur-37 | 0 | 103 |

The `divine_fathers` table defines the divine parent entities. Each row carries a `divine_father_id` (values `100` through `103`), a `father_id` that may be a UUID like `278d845c-8fc0-11eb-924d-9cd76263cbd0` or a numeric code such as `2986239`, a `divine_name` (e.g., `Compact Framework`, `Legacy Protocol`, `Regional Programme A`, `Seasonal Standard`), a `relationship_type` of either `adoptive` or `biological`, and a `covenant_status` of `active` or `sealed`. Timestamps `created_at` and `updated_at` track the lifecycle of each father record. The relationship from `divine_fathers` to `divine_privileges` is one-to-many, and the relationship to `adopted_persons` is mediated through the junction table `fathers_persons`, which allows a father to be associated with multiple persons and vice versa.

**Table `divine_fathers`**

| divine_father_id | father_id | divine_name | relationship_type | covenant_status | created_at | updated_at |
|---|---|---|---|---|---|---|
| 100 | 278d845c-8fc0-11eb-924d-9cd76263cbd0 | Compact Framework | adoptive | active | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2986239 | Legacy Protocol | biological | sealed | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 5082990 | Regional Programme A | adoptive | active | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 17565595 | Seasonal Standard | biological | sealed | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `adoption_seals` table captures the sealing ritual that formalises adoption. Each seal has an `adoption_seal_id` (values `1000` through `1003`), a `seal_id` that may be numeric (`10238285`, `2986247`), alphanumeric (`account_pymes_2405`), or a composite string (`IVC20Ndet10`), a `seal_date`, a `seal_type` of either `spirit` or `promise`, a `valid_until` timestamp, and a foreign key `eternal_inheritance_id` linking to the inheritance entity. The `created_at` and `updated_at` columns record modification history. The relationship from `adoption_seals` to `adopted_persons` is one-to-many via the `adoption_seal_id` foreign key in the adopted persons table, while the relationship to `eternal_inheritances` is also one-to-many through the `eternal_inheritance_id` foreign key.

**Table `adoption_seals`**

| adoption_seal_id | seal_id | seal_date | seal_type | valid_until | eternal_inheritance_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | 10238285 | 2025-04-23T15:21:00 | spirit | 2023-06-09T17:15:00 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 2986247 | 2022-09-07T22:38:00 | promise | 2024-11-20T00:32:00 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | account_pymes_2405 | 2023-02-18T05:55:00 | spirit | 2025-04-04T07:49:00 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | IVC20Ndet10 | 2024-07-02T12:12:00 | promise | 2022-09-15T14:06:00 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `eternal_inheritances` table defines the ultimate spiritual benefits. Each inheritance has an `eternal_inheritance_id` (values `100` through `103`), an `inheritance_id` that may be numeric (`10966232`, `9125627`) or a UUID (`922ad118-9bad-11eb-a8a2-19ed5c03f8d3`), an `inheritance_type` of either `salvation` or `promises`, a `distribution_date`, a `value_description` such as `Pilot Series`, `Baseline Assessment`, `Distributed Survey A`, or `Adaptive Corridor`, and a foreign key `adoption_seal_id` linking back to the seal. The cardinality is one-to-many from `adoption_seals` to `eternal_inheritances`: each seal may be associated with multiple inheritances, but each inheritance belongs to exactly one seal.

**Table `eternal_inheritances`**

| eternal_inheritance_id | inheritance_id | inheritance_type | distribution_date | value_description | adoption_seal_id |
|---|---|---|---|---|---|
| 100 | 10966232 | salvation | 2025-12-07T23:21:00 | Pilot Series | 1000 |
| 101 | 9125627 | promises | 2022-05-18T06:38:00 | Baseline Assessment | 1001 |
| 102 | 10445637 | salvation | 2023-10-02T13:55:00 | Distributed Survey A | 1002 |
| 103 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | promises | 2024-03-13T20:12:00 | Adaptive Corridor | 1003 |

Six junction tables resolve many-to-many relationships between the core entities and the general `persons` entity (which exists outside the scope of this schema but is referenced through these link tables). The `persons_privileges` table links persons to privileges, `spirits_persons` links persons to adoption spirits, `privileges_persons` provides an alternative linkage path between persons and privileges, `fathers_persons` links persons to divine fathers, `seals_persons` links persons to adoption seals, and `inheritances_persons` links persons to eternal inheritances. Each junction table follows the standard pattern of containing at least two foreign key columns — one referencing the core entity and one referencing the `persons` entity — thereby enabling a person to hold multiple privileges, be associated with multiple spirits, and so on, without violating first normal form.

**Table `persons_privileges`**

| adopted_person_id | divine_privilege_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `spirits_persons`**

| adoption_spirit_id | adopted_person_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `privileges_persons`**

| divine_privilege_id | adopted_person_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `fathers_persons`**

| divine_father_id | adopted_person_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |
**Table `seals_persons`**

| adoption_seal_id | adopted_person_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |
**Table `inheritances_persons`**

| eternal_inheritance_id | adopted_person_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The view `vw_adopted_person_adoption_spirit` joins `adopted_persons` to `adoption_spirits` on the `adoption_spirit_id` foreign key, producing a denormalised row that pairs each person with their mediating spirit. For example, the row for `Maria Rodriguez` (id `101`) appears alongside the spirit with `spirit_id` `55474a69-49cb-42df-8a71-5283e04141ed`, type `guarantee`, and function `Primary Survey`. This view answers the question: "Which adoption spirit is associated with each adopted person, and what is that spirit's classification?"

**View `vw_adopted_person_adoption_spirit`**

```sql
CREATE VIEW vw_adopted_person_adoption_spirit AS
SELECT a.id, a.person_id, a.justification_date, a.adoption_status, b.id AS spirit_id, b.spirit_id AS spirit_spirit_id, b.bestowal_date AS spirit_bestowal_date
FROM adopted_persons a JOIN adoption_spirits b ON a.adoption_spirit_id = b.id;
```

| id | person_id | justification_date | adoption_status | spirit_id | spirit_spirit_id | spirit_bestowal_date |
|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | 2024-03-27T02:18:00 | pending | 1 | 82872 | 2022-05-12T04:36:00 |
| 101 | Maria Rodriguez | 2025-08-11T09:35:00 | sealed | 2 | 55474a69-49cb-42df-8a71-5283e04141ed | 2023-10-23T11:53:00 |
| 102 | Sarah Villanueva | 2022-01-22T16:52:00 | complete | 3 | 1186104 | 2024-03-07T18:10:00 |
| 103 | Susan Wagner | 2023-06-06T23:09:00 | pending | 4 | lu_tax_code_template_m_I_1 | 2025-08-18T01:27:00 |

The view `vw_adopted_person_divine_privilege_detail` joins `adopted_persons` to `divine_privileges`, connecting each person to the privileges they hold. A row might pair `Susan Wagner` (id `103`, status `pending`, spiritual name `Mother Teresa`) with the privilege of type `pity` (id `3706`, scriptural reference `baseline-scriptur-37`, beneficiary count `0`). This view answers: "What divine privileges are associated with each adopted person, and what are the details of those privileges?"

**View `vw_adopted_person_divine_privilege_detail`**

```sql
CREATE VIEW vw_adopted_person_divine_privilege_detail AS
SELECT a.id, a.person_id, a.justification_date, b.id AS privilege_id, b.privilege_id AS privilege_privilege_id, b.privilege_type AS privilege_privilege_type
FROM adopted_persons a
  JOIN persons_privileges j ON j.adopted_person_id = a.id
  JOIN divine_privileges b ON b.id = j.divine_privilege_id;
```

| id | person_id | justification_date | privilege_id | privilege_privilege_id | privilege_privilege_type |
|---|---|---|---|---|---|
| 100 | George Bernard Shaw | 2024-03-27T02:18:00 | 1 | 338532 | access |
| 100 | George Bernard Shaw | 2024-03-27T02:18:00 | 2 | 2106707 | provision |
| 101 | Maria Rodriguez | 2025-08-11T09:35:00 | 2 | 2106707 | provision |
| 101 | Maria Rodriguez | 2025-08-11T09:35:00 | 3 | 168536 | protection |
| 102 | Sarah Villanueva | 2022-01-22T16:52:00 | 3 | 168536 | protection |
| 102 | Sarah Villanueva | 2022-01-22T16:52:00 | 4 | 3706 | pity |
| 103 | Susan Wagner | 2023-06-06T23:09:00 | 4 | 3706 | pity |
| 103 | Susan Wagner | 2023-06-06T23:09:00 | 1 | 338532 | access |

The view `vw_adopted_person_adoption_seal` joins `adopted_persons` to `adoption_seals` on `adoption_seal_id`, producing rows that pair each person with their sealing act. For instance, `Sarah Villanueva` (id `102`, status `complete`, spiritual name `Timothy Hamilton`) is joined with seal `1002` (seal_id `account_pymes_2405`, type `spirit`, valid until `2025-04-04T07:49:00`). This view answers: "Which adoption seal formalises each person's adoption, and what are the seal's parameters?"

**View `vw_adopted_person_adoption_seal`**

```sql
CREATE VIEW vw_adopted_person_adoption_seal AS
SELECT a.id, a.person_id, a.justification_date, a.adoption_status, b.adoption_seal_id AS seal_adoption_seal_id, b.seal_id AS seal_seal_id, b.seal_date AS seal_seal_date
FROM adopted_persons a JOIN adoption_seals b ON a.adoption_seal_id = b.adoption_seal_id;
```

| id | person_id | justification_date | adoption_status | seal_adoption_seal_id | seal_seal_id | seal_seal_date |
|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | 2024-03-27T02:18:00 | pending | 1000 | 10238285 | 2025-04-23T15:21:00 |
| 101 | Maria Rodriguez | 2025-08-11T09:35:00 | sealed | 1001 | 2986247 | 2022-09-07T22:38:00 |
| 102 | Sarah Villanueva | 2022-01-22T16:52:00 | complete | 1002 | account_pymes_2405 | 2023-02-18T05:55:00 |
| 103 | Susan Wagner | 2023-06-06T23:09:00 | pending | 1003 | IVC20Ndet10 | 2024-07-02T12:12:00 |

The view `vw_adoption_spirit_adopted_person_detail` reverses the join direction, starting from `adoption_spirits` and joining to `adopted_persons`. A row might show the spirit `82872` (type `adoption`, function `Adaptive Assessment`, bestowal date `2022-05-12T04:36:00`) alongside the person `George Bernard Shaw` (id `100`, status `pending`, spiritual name `Mark Landry`). This view answers: "Which adopted persons are associated with each adoption spirit, enabling a spirit-centric query?"

**View `vw_adoption_spirit_adopted_person_detail`**

```sql
CREATE VIEW vw_adoption_spirit_adopted_person_detail AS
SELECT a.id, a.spirit_id, a.bestowal_date, b.id AS person_id, b.person_id AS person_person_id, b.justification_date AS person_justification_date
FROM adoption_spirits a
  JOIN spirits_persons j ON j.adoption_spirit_id = a.id
  JOIN adopted_persons b ON b.id = j.adopted_person_id;
```

| id | spirit_id | bestowal_date | person_id | person_person_id | person_justification_date |
|---|---|---|---|---|---|
| 1 | 82872 | 2022-05-12T04:36:00 | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |
| 1 | 82872 | 2022-05-12T04:36:00 | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 2 | 55474a69-49cb-42df-8a71-5283e04141ed | 2023-10-23T11:53:00 | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 2 | 55474a69-49cb-42df-8a71-5283e04141ed | 2023-10-23T11:53:00 | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 3 | 1186104 | 2024-03-07T18:10:00 | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 3 | 1186104 | 2024-03-07T18:10:00 | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 4 | lu_tax_code_template_m_I_1 | 2025-08-18T01:27:00 | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 4 | lu_tax_code_template_m_I_1 | 2025-08-18T01:27:00 | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |

The view `vw_divine_privilege_adopted_person_detail` joins `divine_privileges` to `adopted_persons`, presenting privileges alongside the persons who hold them. A representative row pairs the privilege of type `access` (id `338532`, scriptural reference `primary-scriptur-34`, beneficiary count `12`) with a person record. This view answers: "From the perspective of a divine privilege, which persons are its beneficiaries?"

**View `vw_divine_privilege_adopted_person_detail`**

```sql
CREATE VIEW vw_divine_privilege_adopted_person_detail AS
SELECT a.id, a.privilege_id, a.privilege_type, b.id AS person_id, b.person_id AS person_person_id, b.justification_date AS person_justification_date
FROM divine_privileges a
  JOIN privileges_persons j ON j.divine_privilege_id = a.id
  JOIN adopted_persons b ON b.id = j.adopted_person_id;
```

| id | privilege_id | privilege_type | person_id | person_person_id | person_justification_date |
|---|---|---|---|---|---|
| 1 | 338532 | access | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |
| 1 | 338532 | access | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 2 | 2106707 | provision | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 2 | 2106707 | provision | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 3 | 168536 | protection | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 3 | 168536 | protection | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 4 | 3706 | pity | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 4 | 3706 | pity | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |

The view `vw_divine_privilege_divine_father` joins `divine_privileges` to `divine_fathers` on `divine_father_id`, revealing which father grants which privilege. A row might show the privilege of type `provision` (id `2106707`, scriptural reference `adaptive-scriptur-35`, beneficiary count `24`) alongside the father `Legacy Protocol` (divine_father_id `101`, relationship_type `biological`, covenant_status `sealed`). This view answers: "Which divine father is the source of each privilege?"

**View `vw_divine_privilege_divine_father`**

```sql
CREATE VIEW vw_divine_privilege_divine_father AS
SELECT a.id, a.privilege_id, a.privilege_type, a.scriptural_reference, b.divine_father_id AS father_divine_father_id, b.father_id AS father_father_id, b.divine_name AS father_divine_name
FROM divine_privileges a JOIN divine_fathers b ON a.divine_father_id = b.divine_father_id;
```

| id | privilege_id | privilege_type | scriptural_reference | father_divine_father_id | father_father_id | father_divine_name |
|---|---|---|---|---|---|---|
| 1 | 338532 | access | primary-scriptur-34 | 100 | 278d845c-8fc0-11eb-924d-9cd76263cbd0 | Compact Framework |
| 2 | 2106707 | provision | adaptive-scriptur-35 | 101 | 2986239 | Legacy Protocol |
| 3 | 168536 | protection | distributed-scriptur-36 | 102 | 5082990 | Regional Programme A |
| 4 | 3706 | pity | baseline-scriptur-37 | 103 | 17565595 | Seasonal Standard |

The view `vw_divine_father_adopted_person_detail` joins `divine_fathers` to `adopted_persons`, connecting each father to the persons under their spiritual authority. A row might pair the father `Compact Framework` (divine_father_id `100`, relationship_type `adoptive`, covenant_status `active`) with the person `George Bernard Shaw`. This view answers: "Which adopted persons fall under the authority of each divine father?"

**View `vw_divine_father_adopted_person_detail`**

```sql
CREATE VIEW vw_divine_father_adopted_person_detail AS
SELECT a.divine_father_id, a.father_id, a.divine_name, b.id AS person_id, b.person_id AS person_person_id, b.justification_date AS person_justification_date
FROM divine_fathers a
  JOIN fathers_persons j ON j.divine_father_id = a.divine_father_id
  JOIN adopted_persons b ON b.id = j.adopted_person_id;
```

| divine_father_id | father_id | divine_name | person_id | person_person_id | person_justification_date |
|---|---|---|---|---|---|
| 100 | 278d845c-8fc0-11eb-924d-9cd76263cbd0 | Compact Framework | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |
| 100 | 278d845c-8fc0-11eb-924d-9cd76263cbd0 | Compact Framework | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 101 | 2986239 | Legacy Protocol | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 101 | 2986239 | Legacy Protocol | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 102 | 5082990 | Regional Programme A | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 102 | 5082990 | Regional Programme A | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 103 | 17565595 | Seasonal Standard | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 103 | 17565595 | Seasonal Standard | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |

The view `vw_adoption_seal_adopted_person_detail` joins `adoption_seals` to `adopted_persons`, presenting seals alongside the persons they seal. A representative row pairs seal `1000` (seal_id `10238285`, type `spirit`, seal_date `2025-04-23T15:21:00`) with the person `George Bernard Shaw` (id `100`, status `pending`). This view answers: "From the perspective of an adoption seal, which persons does it seal?"

**View `vw_adoption_seal_adopted_person_detail`**

```sql
CREATE VIEW vw_adoption_seal_adopted_person_detail AS
SELECT a.adoption_seal_id, a.seal_id, a.seal_date, b.id AS person_id, b.person_id AS person_person_id, b.justification_date AS person_justification_date
FROM adoption_seals a
  JOIN seals_persons j ON j.adoption_seal_id = a.adoption_seal_id
  JOIN adopted_persons b ON b.id = j.adopted_person_id;
```

| adoption_seal_id | seal_id | seal_date | person_id | person_person_id | person_justification_date |
|---|---|---|---|---|---|
| 1000 | 10238285 | 2025-04-23T15:21:00 | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |
| 1000 | 10238285 | 2025-04-23T15:21:00 | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 1001 | 2986247 | 2022-09-07T22:38:00 | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 1001 | 2986247 | 2022-09-07T22:38:00 | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 1002 | account_pymes_2405 | 2023-02-18T05:55:00 | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 1002 | account_pymes_2405 | 2023-02-18T05:55:00 | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 1003 | IVC20Ndet10 | 2024-07-02T12:12:00 | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 1003 | IVC20Ndet10 | 2024-07-02T12:12:00 | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |

The view `vw_adoption_seal_eternal_inheritance` joins `adoption_seals` to `eternal_inheritances` on `eternal_inheritance_id`, linking each seal to its associated inheritance. A row might show seal `1000` (seal_id `10238285`, type `spirit`) alongside inheritance `100` (inheritance_id `10966232`, type `salvation`, distribution_date `2025-12-07T23:21:00`, value `Pilot Series`). This view answers: "Which eternal inheritance is attached to each adoption seal?"

**View `vw_adoption_seal_eternal_inheritance`**

```sql
CREATE VIEW vw_adoption_seal_eternal_inheritance AS
SELECT a.adoption_seal_id, a.seal_id, a.seal_date, a.seal_type, b.eternal_inheritance_id AS inheritance_eternal_inheritance_id, b.inheritance_id AS inheritance_inheritance_id, b.inheritance_type AS inheritance_inheritance_type
FROM adoption_seals a JOIN eternal_inheritances b ON a.eternal_inheritance_id = b.eternal_inheritance_id;
```

| adoption_seal_id | seal_id | seal_date | seal_type | inheritance_eternal_inheritance_id | inheritance_inheritance_id | inheritance_inheritance_type |
|---|---|---|---|---|---|---|
| 1000 | 10238285 | 2025-04-23T15:21:00 | spirit | 100 | 10966232 | salvation |
| 1001 | 2986247 | 2022-09-07T22:38:00 | promise | 101 | 9125627 | promises |
| 1002 | account_pymes_2405 | 2023-02-18T05:55:00 | spirit | 102 | 10445637 | salvation |
| 1003 | IVC20Ndet10 | 2024-07-02T12:12:00 | promise | 103 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | promises |

The view `vw_eternal_inheritance_adopted_person_detail` joins `eternal_inheritances` to `adopted_persons` through the intermediate `adoption_seals` table, producing rows that connect each inheritance to the person who ultimately receives it. A representative row pairs inheritance `100` (type `salvation`, value `Pilot Series`) with the person `George Bernard Shaw` (id `100`, status `pending`, spiritual name `Mark Landry`). This view answers: "From the perspective of an eternal inheritance, which adopted person is its ultimate beneficiary?"

**View `vw_eternal_inheritance_adopted_person_detail`**

```sql
CREATE VIEW vw_eternal_inheritance_adopted_person_detail AS
SELECT a.eternal_inheritance_id, a.inheritance_id, a.inheritance_type, b.id AS person_id, b.person_id AS person_person_id, b.justification_date AS person_justification_date
FROM eternal_inheritances a
  JOIN inheritances_persons j ON j.eternal_inheritance_id = a.eternal_inheritance_id
  JOIN adopted_persons b ON b.id = j.adopted_person_id;
```

| eternal_inheritance_id | inheritance_id | inheritance_type | person_id | person_person_id | person_justification_date |
|---|---|---|---|---|---|
| 100 | 10966232 | salvation | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |
| 100 | 10966232 | salvation | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 101 | 9125627 | promises | 101 | Maria Rodriguez | 2025-08-11T09:35:00 |
| 101 | 9125627 | promises | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 102 | 10445637 | salvation | 102 | Sarah Villanueva | 2022-01-22T16:52:00 |
| 102 | 10445637 | salvation | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 103 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | promises | 103 | Susan Wagner | 2023-06-06T23:09:00 |
| 103 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | promises | 100 | George Bernard Shaw | 2024-03-27T02:18:00 |

The view `vw_eternal_inheritance_adoption_seal` joins `eternal_inheritances` to `adoption_seals` on `adoption_seal_id`, presenting each inheritance alongside its parent seal. A row might show inheritance `101` (inheritance_id `9125627`, type `promises`, distribution_date `2022-05-18T06:38:00`, value `Baseline Assessment`) alongside seal `1001` (seal_id `2986247`, type `promise`, seal_date `2022-09-07T22:38:00`). This view answers: "Which adoption seal is the parent of each eternal inheritance?"

**View `vw_eternal_inheritance_adoption_seal`**

```sql
CREATE VIEW vw_eternal_inheritance_adoption_seal AS
SELECT a.eternal_inheritance_id, a.inheritance_id, a.inheritance_type, a.distribution_date, b.adoption_seal_id AS seal_adoption_seal_id, b.seal_id AS seal_seal_id, b.seal_date AS seal_seal_date
FROM eternal_inheritances a JOIN adoption_seals b ON a.adoption_seal_id = b.adoption_seal_id;
```

| eternal_inheritance_id | inheritance_id | inheritance_type | distribution_date | seal_adoption_seal_id | seal_seal_id | seal_seal_date |
|---|---|---|---|---|---|---|
| 100 | 10966232 | salvation | 2025-12-07T23:21:00 | 1000 | 10238285 | 2025-04-23T15:21:00 |
| 101 | 9125627 | promises | 2022-05-18T06:38:00 | 1001 | 2986247 | 2022-09-07T22:38:00 |
| 102 | 10445637 | salvation | 2023-10-02T13:55:00 | 1002 | account_pymes_2405 | 2023-02-18T05:55:00 |
| 103 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | promises | 2024-03-13T20:12:00 | 1003 | IVC20Ndet10 | 2024-07-02T12:12:00 |

The schema implements a layered normalisation strategy. The six core entity tables are in at least third normal form, with each non-key attribute fully functionally dependent on its primary key and no transitive dependencies. The adoption lifecycle flows through the foreign keys: `adopted_persons.adoption_spirit_id` → `adoption_spirits.id`, `adopted_persons.adoption_seal_id` → `adoption_seals.adoption_seal_id`, `adoption_seals.eternal_inheritance_id` → `eternal_inheritances.eternal_inheritance_id`, and `divine_privileges.divine_father_id` → `divine_fathers.divine_father_id`. The six junction tables handle the many-to-many relationships between persons and the other entities, ensuring that a single person can hold multiple privileges, be associated with multiple spirits, and so on, without data redundancy. The twelve views provide denormalised projections that reconstruct domain facts for analytical queries, each answering a specific question by joining the appropriate pair of tables. Together, the base tables and views form a complete relational model of the spiritual adoption domain, supporting both transactional integrity through normalisation and analytical convenience through denormalised views.