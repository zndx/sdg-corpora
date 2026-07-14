# Certification and Training Governance: Managing Approvals, Audits, and Trade Credentials

The modern training and certification ecosystem operates as a tightly coupled network of organisations, trainers, schemes, and regulatory oversight mechanisms. At its core, the system tracks three interlocking domains: individual trade credentials (registration cards), professional trainer authorisations, and provider-level approvals that govern which training organisations may deliver accredited programmes. Each domain carries its own lifecycle — issuance, renewal, suspension, revocation — and each is subject to audit, pricing, and categorical classification. Understanding how these records relate is essential for practitioners who administer certifications, conduct compliance reviews, or analyse training programme coverage.

## Trade Registration Cards and Their Categories

The foundation of the credentialing system is the registration card, a document issued to individual tradespeople that certifies their eligibility to perform regulated work. Cards carry a type — `New`, `Reprint`, or `Replacement` — and are bound by an issue date and an expiry date. The holder's name, trade category, and a VAT-excluded price complete the record.

**Table `registration_cards`**

| card_id | card_type | issue_date | expiry_date | holder_name | trade_category | vat_excluded_price |
|---|---|---|---|---|---|---|
| 17788643 | New | 2023-02-01 | 2023-10-24 | Kimberly Maynard | integrated-trade-46 | 8,627 |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | Reprint | 2024-07-12 | 2024-03-08 | Jeremy Parks | seasonal-trade-47 | 0.18 |
| 1336192 | Replacement | 2025-12-23 | 2025-08-19 | Brandon Long | regional-trade-48 | 289.59 |
| 5917278 | New | 2022-05-07 | 2022-01-03 | Norma Fisher | legacy-trade-49 | 442.51 |

Consider card `17788643`, a New card issued to Kimberly Maynard on 2023-02-01 for the `integrated-trade-46` category, priced at 8,627 and expiring on 2023-10-24. By contrast, card `ChIJ20iLSYBt5kcRqH2vq_dd6GU` is a Reprint issued to Jeremy Parks for `seasonal-trade-47` at a nominal price of 0.18. The price range is wide: from fractions of a unit to thousands, reflecting the diversity of trade categories and card types.

Cards are classified into registration categories, which define the regulatory framework under which a cardholder operates.

**Table `registration_categories`**

| id | category_id | category_name | category_code | is_additional |
|---|---|---|---|---|
| 100 | state_et_9 | Legacy Programme D | 9125615 | true |
| 101 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 575219 | false |
| 102 | 1186099 | Seasonal Framework | 10445627 | true |
| 103 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 05bb4466-8fc7-11eb-924d-9cd76263cbd0 | false |

Category `state_et_9`, named "Legacy Programme D" with code `9125615`, is flagged as an additional category (`is_additional = true`), suggesting it sits alongside a primary classification. Category `c744c896-8fcc-11eb-924d-9cd76263cbd0`, the "Regional Standard" with code `575219`, is not additional, indicating it serves as a primary classification. The categorical system uses both numeric codes and UUIDs, reflecting a hybrid identifier strategy that accommodates legacy and modern registration systems.

The relationship between cards and categories is mediated through two junction tables: `cards_categories` and `categories_cards`. These bidirectional link tables allow a single card to be associated with multiple categories and a single category to encompass multiple cards, supporting the many-to-many nature of trade classification.

**Table `cards_categories`**

| card_id | registration_category_id |
|---|---|
| 17788643 | 100 |
| 17788643 | 101 |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | 101 |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | 102 |
| 1336192 | 102 |
| 1336192 | 103 |
| 5917278 | 103 |
| 5917278 | 100 |

**Table `categories_cards`**

| registration_category_id | card_id |
|---|---|
| 100 | 17788643 |
| 100 | ChIJ20iLSYBt5kcRqH2vq_dd6GU |
| 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU |
| 101 | 1336192 |
| 102 | 1336192 |
| 102 | 5917278 |
| 103 | 5917278 |
| 103 | 17788643 |

## Trainer Approvals and Training Schemes

Trainer approvals authorise individuals to deliver accredited training programmes. Each approval record carries an approval type — `New`, `Renewal`, or `AdditionalScheme` — a grant date, an expiry date, a VAT-excluded price, and a reference to the trainer.

**Table `trainer_approvals`**

| trainer_approval_id | approval_id | approval_type | grant_date | expiry_date | vat_excluded_price | trainer_id |
|---|---|---|---|---|---|---|
| 1 | 17629497 | New | 2022-05-11 | 2023-10-24 | 8,627 | 1000 |
| 2 | 3355765 | Renewal | 2023-10-22 | 2024-03-08 | 0.18 | 1001 |
| 3 | 18175211 | AdditionalScheme | 2024-03-06 | 2025-08-19 | 289.59 | 1002 |
| 4 | 6564391 | New | 2025-08-17 | 2022-01-03 | 442.51 | 1003 |

Approval `1` (internal ID), with external approval number `17629497`, is a New approval granted to trainer `1000` on 2022-05-11, expiring 2023-10-24, at a price of 8,627. Approval `2` is a Renewal for trainer `1001`, granted on 2023-10-22 at a minimal price of 0.18. The `AdditionalScheme` type on approval `3` indicates that trainer `1002` has been authorised to deliver a scheme beyond their original scope.

Training schemes define the actual programmes that trainers deliver. Each scheme has a code, a name, a type (such as `National Water Hygiene`, `SHEA`, `BESC`, or `SCO`), and a boolean flag indicating whether it involves smart metering.

**Table `training_schemes`**

| id | scheme_code | scheme_name | scheme_type | is_smart_metering |
|---|---|---|---|---|
| 1 | 2839520 | Integrated Framework A | National Water Hygiene | true |
| 2 | 209233 | Extended Protocol | SHEA | false |
| 3 | L660 | Pilot Programme | BESC | true |
| 4 | 8650 | Baseline Standard D | SCO | false |

Scheme `1` (code `2839520`), "Integrated Framework A", is a National Water Hygiene programme that includes smart metering. Scheme `2` (code `209233`), "Extended Protocol", is a SHEA programme without smart metering. The scheme types represent distinct regulatory domains, and the smart metering flag is a critical operational attribute for programmes involving energy-related competencies.

The linkage between trainer approvals and training schemes is established through two junction tables: `approvals_schemes` and `schemes_approvals`. A trainer approval may cover multiple schemes, and a scheme may be delivered by multiple approved trainers.

**Table `approvals_schemes`**

| trainer_approval_id | training_scheme_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `schemes_approvals`**

| training_scheme_id | trainer_approval_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Provider Approvals and Audits

Provider approvals govern which training organisations are authorised to deliver accredited training. Each approval is tied to a specific organisation and carries a status — `Active`, `Pending`, `Suspended`, or `Revoked` — along with grant and expiry dates and a price.

**Table `provider_approvals`**

| id | approval_id | approval_status | grant_date | expiry_date | vat_excluded_price | organisation_id |
|---|---|---|---|---|---|---|
| 1000 | 17629497 | Active | 2022-05-11 | 2023-10-24 | 8,627 | Austria Card |
| 1001 | 3355765 | Pending | 2023-10-22 | 2024-03-08 | 0.18 | American International Group |
| 1002 | 18175211 | Suspended | 2024-03-06 | 2025-08-19 | 289.59 | GitHub Inc. |
| 1003 | 6564391 | Revoked | 2025-08-17 | 2022-01-03 | 442.51 | Staples Inc. |

Approval `1000` is Active for the organisation "Austria Card", granted on 2022-05-11 and expiring 2023-10-24, at a price of 8,627. Approval `1001` is Pending for "American International Group", granted on 2023-10-22. Approval `1002` is Suspended for "GitHub Inc.", and approval `1003` is Revoked for "Staples Inc." The status field is the primary indicator of a provider's current standing in the system.

Provider audits are the compliance mechanism that underpins the approval lifecycle. Each audit records an audit date, type (such as `Annual` or `Smart Metering Technical`), a result (`Pass`, `Fail`, or `Conditional`), and a price, and is linked to a specific provider approval.

**Table `provider_audits`**

| id | audit_id | audit_date | audit_type | audit_result | vat_excluded_price | provider_approval_id |
|---|---|---|---|---|---|---|
| 1 | bjackman | 2025-12-04T23:33:00 | Annual | Pass | 8,627 | 1000 |
| 2 | 69430 | 2022-05-15T06:50:00 | Smart Metering Technical | Fail | 0.18 | 1001 |
| 3 | 10238266 | 2023-10-26T13:07:00 | Annual | Conditional | 289.59 | 1002 |
| 4 | 6969437 | 2024-03-10T20:24:00 | Smart Metering Technical | Pass | 442.51 | 1003 |

Audit `bjackman` (ID `1`) is an Annual audit of provider approval `1000` conducted on 2025-12-04, resulting in a Pass. Audit `69430` (ID `2`) is a Smart Metering Technical audit of provider approval `1001` on 2022-05-15, resulting in a Fail. Audit `10238266` (ID `3`) is a Conditional Annual audit of provider approval `1002` on 2023-10-26. The audit results directly influence the status of the associated provider approval: a Fail may trigger suspension or revocation, while a Conditional result may impose remediation requirements.

The relationship between provider approvals and audits is captured in the `approvals_audits` junction table, which allows a single approval to be subject to multiple audits over its lifecycle.

**Table `approvals_audits`**

| provider_approval_id | provider_audit_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

## Training Organisations and Their Personnel

Training organisations are the legal entities that hold provider approvals and employ or contract trainers. The system tracks the relationship between organisations and their trainers through the `organisations_trainers` junction table, and the relationship between organisations and their provider approvals through `organisations_approvals`.

**Table `training_organisations`**

| organisation_id | organisation_name | registration_number | contact_email | contact_phone |
|---|---|---|---|---|
| Austria Card | Viet Children's Aegis | REG-2136 | Christopher Wilson | Joe Tsai |
| American International Group | Switch Card Services Ltd. | REG-2142 | Charles Larsen | Stephanie Collins |
| GitHub Inc. | Virgin Group | REG-2148 | Mary Alvarez | Tasha Rodriguez |
| Staples Inc. | Whirlpool Corporation | REG-2154 | April Snyder | Walter Pratt |

**Table `trainers`**

| id | trainer_id | first_name | last_name | email_address | is_approved | organisation_id |
|---|---|---|---|---|---|---|
| 1000 | 9568455 | Stephanie Collins | Paul Allen | primary-email-70 | true | Austria Card |
| 1001 | 4985167 | Janice Johnston | Heather Beasley | adaptive-email-71 | false | American International Group |
| 1002 | 103168 | Upal Saha | Audrey Taylor | distributed-email-72 | true | GitHub Inc. |
| 1003 | 4060633 | Katherine Snyder | Susan Wagner | baseline-email-73 | false | Staples Inc. |

**Table `organisations_approvals`**

| organisation_id | provider_approval_id |
|---|---|
| Austria Card | 1000 |
| Austria Card | 1001 |
| American International Group | 1001 |
| American International Group | 1002 |
| GitHub Inc. | 1002 |
| GitHub Inc. | 1003 |
| Staples Inc. | 1003 |
| Staples Inc. | 1000 |

**Table `organisations_trainers`**

| organisation_id | trainer_id |
|---|---|
| Austria Card | 1000 |
| Austria Card | 1001 |
| American International Group | 1001 |
| American International Group | 1002 |
| GitHub Inc. | 1002 |
| GitHub Inc. | 1003 |
| Staples Inc. | 1003 |
| Staples Inc. | 1000 |

**Table `trainers_approvals`**

| trainer_id | trainer_approval_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

These junction tables form the organisational backbone of the system. An organisation may hold multiple provider approvals across different regulatory domains, and each approval may be associated with a distinct set of trainers. The `trainers_approvals` table records which trainers are associated with which approvals, creating a traceable chain from individual practitioner through approval to scheme delivery.

## Detail Views and Operational Relationships

The system provides a suite of detail views that join base tables and junction tables into coherent, queryable records. Each view answers a specific operational question by assembling related entities into a single result set.

The `registration_card_registration_category_detail_view` joins registration cards with their categories, answering the question: "What categories apply to each registration card?" A row from this view would show card `17788643` (holder: Kimberly Maynard, type: New) alongside its associated category, enabling auditors to verify that a cardholder's trade classification matches their regulatory requirements.

**View `registration_card_registration_category_detail_view`**

```sql
CREATE VIEW registration_card_registration_category_detail_view AS
SELECT a.card_id, a.card_type, a.issue_date, b.id AS category_id, b.category_id AS category_category_id, b.category_name AS category_category_name
FROM registration_cards a
  JOIN cards_categories j ON j.card_id = a.card_id
  JOIN registration_categories b ON b.id = j.registration_category_id;
```

| card_id | card_type | issue_date | category_id | category_category_id | category_category_name |
|---|---|---|---|---|---|
| 17788643 | New | 2023-02-01 | 100 | state_et_9 | Legacy Programme D |
| 17788643 | New | 2023-02-01 | 101 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | Reprint | 2024-07-12 | 101 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| ChIJ20iLSYBt5kcRqH2vq_dd6GU | Reprint | 2024-07-12 | 102 | 1186099 | Seasonal Framework |
| 1336192 | Replacement | 2025-12-23 | 102 | 1186099 | Seasonal Framework |
| 1336192 | Replacement | 2025-12-23 | 103 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |
| 5917278 | New | 2022-05-07 | 103 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |
| 5917278 | New | 2022-05-07 | 100 | state_et_9 | Legacy Programme D |

The inverse perspective is provided by `registration_category_registration_card_detail_view`, which answers: "Which cards fall under each registration category?" This view is useful for category-level reporting, such as determining how many cards are active under the "Legacy Programme D" category.

**View `registration_category_registration_card_detail_view`**

```sql
CREATE VIEW registration_category_registration_card_detail_view AS
SELECT a.id, a.category_id, a.category_name, b.card_id AS card_card_id, b.card_type AS card_card_type, b.issue_date AS card_issue_date
FROM registration_categories a
  JOIN categories_cards j ON j.registration_category_id = a.id
  JOIN registration_cards b ON b.card_id = j.card_id;
```

| id | category_id | category_name | card_card_id | card_card_type | card_issue_date |
|---|---|---|---|---|---|
| 100 | state_et_9 | Legacy Programme D | 17788643 | New | 2023-02-01 |
| 100 | state_et_9 | Legacy Programme D | ChIJ20iLSYBt5kcRqH2vq_dd6GU | Reprint | 2024-07-12 |
| 101 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | ChIJ20iLSYBt5kcRqH2vq_dd6GU | Reprint | 2024-07-12 |
| 101 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 1336192 | Replacement | 2025-12-23 |
| 102 | 1186099 | Seasonal Framework | 1336192 | Replacement | 2025-12-23 |
| 102 | 1186099 | Seasonal Framework | 5917278 | New | 2022-05-07 |
| 103 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 5917278 | New | 2022-05-07 |
| 103 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 17788643 | New | 2023-02-01 |

For trainer governance, `trainer_approval_training_scheme_detail_view` joins trainer approvals with the schemes they cover, answering: "What schemes is each trainer approved to deliver?" A row would show trainer approval `1` (approval type: New, trainer ID: 1000) alongside its associated training scheme, such as "Integrated Framework A" (National Water Hygiene, smart metering enabled).

**View `trainer_approval_training_scheme_detail_view`**

```sql
CREATE VIEW trainer_approval_training_scheme_detail_view AS
SELECT a.trainer_approval_id, a.approval_id, a.approval_type, b.id AS scheme_id, b.scheme_code AS scheme_scheme_code, b.scheme_name AS scheme_scheme_name
FROM trainer_approvals a
  JOIN approvals_schemes j ON j.trainer_approval_id = a.trainer_approval_id
  JOIN training_schemes b ON b.id = j.training_scheme_id;
```

| trainer_approval_id | approval_id | approval_type | scheme_id | scheme_scheme_code | scheme_scheme_name |
|---|---|---|---|---|---|
| 1 | 17629497 | New | 1 | 2839520 | Integrated Framework A |
| 1 | 17629497 | New | 2 | 209233 | Extended Protocol |
| 2 | 3355765 | Renewal | 2 | 209233 | Extended Protocol |
| 2 | 3355765 | Renewal | 3 | L660 | Pilot Programme |
| 3 | 18175211 | AdditionalScheme | 3 | L660 | Pilot Programme |
| 3 | 18175211 | AdditionalScheme | 4 | 8650 | Baseline Standard D |
| 4 | 6564391 | New | 4 | 8650 | Baseline Standard D |
| 4 | 6564391 | New | 1 | 2839520 | Integrated Framework A |

The `trainer_approval_trainer_view` joins trainer approvals with trainer identity records, answering: "Which trainer holds each approval?" This view is essential for identity verification and for linking approval records to personnel files.

**View `trainer_approval_trainer_view`**

```sql
CREATE VIEW trainer_approval_trainer_view AS
SELECT a.trainer_approval_id, a.approval_id, a.approval_type, a.grant_date, b.id AS trainer_id, b.trainer_id AS trainer_trainer_id, b.first_name AS trainer_first_name
FROM trainer_approvals a JOIN trainers b ON a.trainer_id = b.id;
```

| trainer_approval_id | approval_id | approval_type | grant_date | trainer_id | trainer_trainer_id | trainer_first_name |
|---|---|---|---|---|---|---|
| 1 | 17629497 | New | 2022-05-11 | 1000 | 9568455 | Stephanie Collins |
| 2 | 3355765 | Renewal | 2023-10-22 | 1001 | 4985167 | Janice Johnston |
| 3 | 18175211 | AdditionalScheme | 2024-03-06 | 1002 | 103168 | Upal Saha |
| 4 | 6564391 | New | 2025-08-17 | 1003 | 4060633 | Katherine Snyder |

The `training_scheme_trainer_approval_detail_view` provides the scheme-centric perspective, answering: "Which trainer approvals cover this scheme?" This is the inverse of the scheme-to-approval relationship and is useful for capacity planning — determining how many approved trainers exist for a given scheme.

**View `training_scheme_trainer_approval_detail_view`**

```sql
CREATE VIEW training_scheme_trainer_approval_detail_view AS
SELECT a.id, a.scheme_code, a.scheme_name, b.trainer_approval_id AS approval_trainer_approval_id, b.approval_id AS approval_approval_id, b.approval_type AS approval_approval_type
FROM training_schemes a
  JOIN schemes_approvals j ON j.training_scheme_id = a.id
  JOIN trainer_approvals b ON b.trainer_approval_id = j.trainer_approval_id;
```

| id | scheme_code | scheme_name | approval_trainer_approval_id | approval_approval_id | approval_approval_type |
|---|---|---|---|---|---|
| 1 | 2839520 | Integrated Framework A | 1 | 17629497 | New |
| 1 | 2839520 | Integrated Framework A | 2 | 3355765 | Renewal |
| 2 | 209233 | Extended Protocol | 2 | 3355765 | Renewal |
| 2 | 209233 | Extended Protocol | 3 | 18175211 | AdditionalScheme |
| 3 | L660 | Pilot Programme | 3 | 18175211 | AdditionalScheme |
| 3 | L660 | Pilot Programme | 4 | 6564391 | New |
| 4 | 8650 | Baseline Standard D | 4 | 6564391 | New |
| 4 | 8650 | Baseline Standard D | 1 | 17629497 | New |

Provider-level detail views follow a similar pattern. The `provider_approval_training_scheme_detail_view` joins provider approvals with training schemes, answering: "What schemes does an approved provider deliver?" A row would show provider approval `1000` (status: Active, organisation: Austria Card) alongside its associated schemes.

**View `provider_approval_training_scheme_detail_view`**

```sql
CREATE VIEW provider_approval_training_scheme_detail_view AS
SELECT a.id, a.approval_id, a.approval_status, b.id AS scheme_id, b.scheme_code AS scheme_scheme_code, b.scheme_name AS scheme_scheme_name
FROM provider_approvals a
  JOIN approvals_schemes j ON j.provider_approval_id = a.id
  JOIN training_schemes b ON b.id = j.training_scheme_id;
```

| id | approval_id | approval_status | scheme_id | scheme_scheme_code | scheme_scheme_name |
|---|---|---|---|---|---|
| 1000 | 17629497 | Active | 1 | 2839520 | Integrated Framework A |
| 1000 | 17629497 | Active | 2 | 209233 | Extended Protocol |
| 1001 | 3355765 | Pending | 2 | 209233 | Extended Protocol |
| 1001 | 3355765 | Pending | 3 | L660 | Pilot Programme |
| 1002 | 18175211 | Suspended | 3 | L660 | Pilot Programme |
| 1002 | 18175211 | Suspended | 4 | 8650 | Baseline Standard D |
| 1003 | 6564391 | Revoked | 4 | 8650 | Baseline Standard D |
| 1003 | 6564391 | Revoked | 1 | 2839520 | Integrated Framework A |

The `provider_approval_training_organisation_view` joins provider approvals with their parent organisations, answering: "Which organisation holds each provider approval?" This view is critical for organisational accountability, linking each approval to its legal entity.

**View `provider_approval_training_organisation_view`**

```sql
CREATE VIEW provider_approval_training_organisation_view AS
SELECT a.id, a.approval_id, a.approval_status, a.grant_date, b.organisation_id AS organisation_organisation_id, b.organisation_name AS organisation_organisation_name, b.registration_number AS organisation_registration_number
FROM provider_approvals a JOIN training_organisations b ON a.organisation_id = b.organisation_id;
```

| id | approval_id | approval_status | grant_date | organisation_organisation_id | organisation_organisation_name | organisation_registration_number |
|---|---|---|---|---|---|---|
| 1000 | 17629497 | Active | 2022-05-11 | Austria Card | Viet Children's Aegis | REG-2136 |
| 1001 | 3355765 | Pending | 2023-10-22 | American International Group | Switch Card Services Ltd. | REG-2142 |
| 1002 | 18175211 | Suspended | 2024-03-06 | GitHub Inc. | Virgin Group | REG-2148 |
| 1003 | 6564391 | Revoked | 2025-08-17 | Staples Inc. | Whirlpool Corporation | REG-2154 |

The `provider_approval_provider_audit_detail_view` joins provider approvals with their audits, answering: "What audits has each provider approval undergone?" A row would show provider approval `1000` alongside audit `bjackman` (type: Annual, result: Pass, date: 2025-12-04), providing a complete audit trail for compliance review.

**View `provider_approval_provider_audit_detail_view`**

```sql
CREATE VIEW provider_approval_provider_audit_detail_view AS
SELECT a.id, a.approval_id, a.approval_status, b.id AS audit_id, b.audit_id AS audit_audit_id, b.audit_date AS audit_audit_date
FROM provider_approvals a
  JOIN approvals_audits j ON j.provider_approval_id = a.id
  JOIN provider_audits b ON b.id = j.provider_audit_id;
```

| id | approval_id | approval_status | audit_id | audit_audit_id | audit_audit_date |
|---|---|---|---|---|---|
| 1000 | 17629497 | Active | 1 | bjackman | 2025-12-04T23:33:00 |
| 1000 | 17629497 | Active | 2 | 69430 | 2022-05-15T06:50:00 |
| 1001 | 3355765 | Pending | 2 | 69430 | 2022-05-15T06:50:00 |
| 1001 | 3355765 | Pending | 3 | 10238266 | 2023-10-26T13:07:00 |
| 1002 | 18175211 | Suspended | 3 | 10238266 | 2023-10-26T13:07:00 |
| 1002 | 18175211 | Suspended | 4 | 6969437 | 2024-03-10T20:24:00 |
| 1003 | 6564391 | Revoked | 4 | 6969437 | 2024-03-10T20:24:00 |
| 1003 | 6564391 | Revoked | 1 | bjackman | 2025-12-04T23:33:00 |

The `provider_audit_provider_approval_view` provides the audit-centric perspective, answering: "Which provider approval does each audit relate to?" This is useful for audit-level reporting and for tracing the impact of audit outcomes on approval status.

**View `provider_audit_provider_approval_view`**

```sql
CREATE VIEW provider_audit_provider_approval_view AS
SELECT a.id, a.audit_id, a.audit_date, a.audit_type, b.id AS approval_id, b.approval_id AS approval_approval_id, b.approval_status AS approval_approval_status
FROM provider_audits a JOIN provider_approvals b ON a.provider_approval_id = b.id;
```

| id | audit_id | audit_date | audit_type | approval_id | approval_approval_id | approval_approval_status |
|---|---|---|---|---|---|---|
| 1 | bjackman | 2025-12-04T23:33:00 | Annual | 1000 | 17629497 | Active |
| 2 | 69430 | 2022-05-15T06:50:00 | Smart Metering Technical | 1001 | 3355765 | Pending |
| 3 | 10238266 | 2023-10-26T13:07:00 | Annual | 1002 | 18175211 | Suspended |
| 4 | 6969437 | 2024-03-10T20:24:00 | Smart Metering Technical | 1003 | 6564391 | Revoked |

The `training_organisation_provider_approval_detail_view` joins training organisations with their provider approvals, answering: "What provider approvals does each organisation hold?" An organisation like "American International Group" may hold multiple approvals across different regulatory domains, and this view surfaces that full portfolio.

**View `training_organisation_provider_approval_detail_view`**

```sql
CREATE VIEW training_organisation_provider_approval_detail_view AS
SELECT a.organisation_id, a.organisation_name, a.registration_number, b.id AS approval_id, b.approval_id AS approval_approval_id, b.approval_status AS approval_approval_status
FROM training_organisations a
  JOIN organisations_approvals j ON j.organisation_id = a.organisation_id
  JOIN provider_approvals b ON b.id = j.provider_approval_id;
```

| organisation_id | organisation_name | registration_number | approval_id | approval_approval_id | approval_approval_status |
|---|---|---|---|---|---|
| Austria Card | Viet Children's Aegis | REG-2136 | 1000 | 17629497 | Active |
| Austria Card | Viet Children's Aegis | REG-2136 | 1001 | 3355765 | Pending |
| American International Group | Switch Card Services Ltd. | REG-2142 | 1001 | 3355765 | Pending |
| American International Group | Switch Card Services Ltd. | REG-2142 | 1002 | 18175211 | Suspended |
| GitHub Inc. | Virgin Group | REG-2148 | 1002 | 18175211 | Suspended |
| GitHub Inc. | Virgin Group | REG-2148 | 1003 | 6564391 | Revoked |
| Staples Inc. | Whirlpool Corporation | REG-2154 | 1003 | 6564391 | Revoked |
| Staples Inc. | Whirlpool Corporation | REG-2154 | 1000 | 17629497 | Active |

The `training_organisation_trainer_detail_view` joins training organisations with their trainers, answering: "Which trainers are associated with each organisation?" This view supports workforce management and capacity analysis at the organisational level.

**View `training_organisation_trainer_detail_view`**

```sql
CREATE VIEW training_organisation_trainer_detail_view AS
SELECT a.organisation_id, a.organisation_name, a.registration_number, b.id AS trainer_id, b.trainer_id AS trainer_trainer_id, b.first_name AS trainer_first_name
FROM training_organisations a
  JOIN organisations_trainers j ON j.organisation_id = a.organisation_id
  JOIN trainers b ON b.id = j.trainer_id;
```

| organisation_id | organisation_name | registration_number | trainer_id | trainer_trainer_id | trainer_first_name |
|---|---|---|---|---|---|
| Austria Card | Viet Children's Aegis | REG-2136 | 1000 | 9568455 | Stephanie Collins |
| Austria Card | Viet Children's Aegis | REG-2136 | 1001 | 4985167 | Janice Johnston |
| American International Group | Switch Card Services Ltd. | REG-2142 | 1001 | 4985167 | Janice Johnston |
| American International Group | Switch Card Services Ltd. | REG-2142 | 1002 | 103168 | Upal Saha |
| GitHub Inc. | Virgin Group | REG-2148 | 1002 | 103168 | Upal Saha |
| GitHub Inc. | Virgin Group | REG-2148 | 1003 | 4060633 | Katherine Snyder |
| Staples Inc. | Whirlpool Corporation | REG-2154 | 1003 | 4060633 | Katherine Snyder |
| Staples Inc. | Whirlpool Corporation | REG-2154 | 1000 | 9568455 | Stephanie Collins |

Finally, the `trainer_trainer_approval_detail_view` joins trainers with their approvals, answering: "What approvals does each trainer hold?" This view is the primary tool for individual practitioner governance, showing the complete set of authorisations held by a given trainer.

**View `trainer_trainer_approval_detail_view`**

```sql
CREATE VIEW trainer_trainer_approval_detail_view AS
SELECT a.id, a.trainer_id, a.first_name, b.trainer_approval_id AS approval_trainer_approval_id, b.approval_id AS approval_approval_id, b.approval_type AS approval_approval_type
FROM trainers a
  JOIN trainers_approvals j ON j.trainer_id = a.id
  JOIN trainer_approvals b ON b.trainer_approval_id = j.trainer_approval_id;
```

| id | trainer_id | first_name | approval_trainer_approval_id | approval_approval_id | approval_approval_type |
|---|---|---|---|---|---|
| 1000 | 9568455 | Stephanie Collins | 1 | 17629497 | New |
| 1000 | 9568455 | Stephanie Collins | 2 | 3355765 | Renewal |
| 1001 | 4985167 | Janice Johnston | 2 | 3355765 | Renewal |
| 1001 | 4985167 | Janice Johnston | 3 | 18175211 | AdditionalScheme |
| 1002 | 103168 | Upal Saha | 3 | 18175211 | AdditionalScheme |
| 1002 | 103168 | Upal Saha | 4 | 6564391 | New |
| 1003 | 4060633 | Katherine Snyder | 4 | 6564391 | New |
| 1003 | 4060633 | Katherine Snyder | 1 | 17629497 | New |

## Synthesis

The certification and training governance system is built on a foundation of interlocking records that span individual credentials, professional authorisations, organisational approvals, and compliance audits. Registration cards certify trade eligibility; trainer approvals authorise programme delivery; provider approvals govern organisational standing; and provider audits enforce compliance. The junction tables — `cards_categories`, `approvals_schemes`, `approvals_audits`, `organisations_approvals`, `organisations_trainers`, and `trainers_approvals` — create the many-to-many relationships that reflect the complexity of real-world training ecosystems. The detail views assemble these relationships into actionable records, enabling practitioners to answer specific operational questions about cardholder classifications, trainer scheme coverage, provider audit histories, and organisational portfolios. Together, these tables and views form a coherent operational dataset that supports the full lifecycle of training and certification governance.

## Data appendix

**View `training_scheme_provider_approval_detail_view`**

```sql
CREATE VIEW training_scheme_provider_approval_detail_view AS
SELECT a.id, a.scheme_code, a.scheme_name, b.id AS approval_id, b.approval_id AS approval_approval_id, b.approval_status AS approval_approval_status
FROM training_schemes a
  JOIN schemes_approvals j ON j.training_scheme_id = a.id
  JOIN provider_approvals b ON b.id = j.provider_approval_id;
```

| id | scheme_code | scheme_name | approval_id | approval_approval_id | approval_approval_status |
|---|---|---|---|---|---|
| 1 | 2839520 | Integrated Framework A | 1000 | 17629497 | Active |
| 1 | 2839520 | Integrated Framework A | 1001 | 3355765 | Pending |
| 2 | 209233 | Extended Protocol | 1001 | 3355765 | Pending |
| 2 | 209233 | Extended Protocol | 1002 | 18175211 | Suspended |
| 3 | L660 | Pilot Programme | 1002 | 18175211 | Suspended |
| 3 | L660 | Pilot Programme | 1003 | 6564391 | Revoked |
| 4 | 8650 | Baseline Standard D | 1003 | 6564391 | Revoked |
| 4 | 8650 | Baseline Standard D | 1000 | 17629497 | Active |

**View `trainer_training_organisation_view`**

```sql
CREATE VIEW trainer_training_organisation_view AS
SELECT a.id, a.trainer_id, a.first_name, a.last_name, b.organisation_id AS organisation_organisation_id, b.organisation_name AS organisation_organisation_name, b.registration_number AS organisation_registration_number
FROM trainers a JOIN training_organisations b ON a.organisation_id = b.organisation_id;
```

| id | trainer_id | first_name | last_name | organisation_organisation_id | organisation_organisation_name | organisation_registration_number |
|---|---|---|---|---|---|---|
| 1000 | 9568455 | Stephanie Collins | Paul Allen | Austria Card | Viet Children's Aegis | REG-2136 |
| 1001 | 4985167 | Janice Johnston | Heather Beasley | American International Group | Switch Card Services Ltd. | REG-2142 |
| 1002 | 103168 | Upal Saha | Audrey Taylor | GitHub Inc. | Virgin Group | REG-2148 |
| 1003 | 4060633 | Katherine Snyder | Susan Wagner | Staples Inc. | Whirlpool Corporation | REG-2154 |
