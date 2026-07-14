## Ontology-Grounded Relational Modelling in the GST Tax Administration Domain

The Goods and Services Tax (GST) administration ecosystem in India presents a multi-layered data landscape where traders, jurisdictions, tax registrations, supplies, and credits interlock to form a coherent fiscal graph. At the conceptual level, the domain ontology distinguishes several entity types: `traders` (legal or natural persons engaged in commerce), `jurisdictions` (geographic or administrative territories with regulatory authority), `tax_registrations` (time-bound authorisations linking a trader to a jurisdiction), `taxable_supplies` (individual transactions of goods or services), `input_tax_credits` (offsets against tax liability arising from prior supplies), `training_centres` (capacity-building institutions), `government_missions` (policy programmes), and `government_agencies` (executive bodies). Each entity type materialises as a relational table whose columns encode attributes and whose foreign keys encode cardinality-bounded relationships. The following sections walk through the schema from first principles, showing how the ontology's classes, properties, and constraints become tables, columns, and joins.

**Table `tax_registrations`**

| registration_id | issue_date | expiry_date | status | turnover_threshold | state_of_registration | application_submission_date | is_exempted | trader_id | jurisdiction_code | input_tax_credit_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 8.95 | composite-state-51 | 2023-06-12T17:51:00 | true | 1 | 5917299 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 778572 | 2024-07-12 | 2024-03-08 | pending | 11.90 | primary-state-52 | 2024-11-23T00:08:00 | false | 2 | id_25 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 14.85 | adaptive-state-53 | 2025-04-07T07:25:00 | true | 3 | 7731856 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 17.80 | distributed-state-54 | 2022-09-18T14:42:00 | false | 4 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `tax_registrations` table is the central hub of the fiscal graph. Its primary key `registration_id` is a natural integer identifier (values such as `2106693`, `778572`, `8387538`, `4277008`). A registration is a time-bound artefact: `issue_date` and `expiry_date` delimit its validity window, while `status` captures one of four lifecycle states—`active`, `pending`, `cancelled`, or `provisional`. The boolean `is_exempted` flag (e.g. `true` for registration `2106693`) signals whether the holder enjoys exemption. The `turnover_threshold` column (e.g. `8.95`) and `state_of_registration` (e.g. `composite-state-51`) describe the regulatory context. Three foreign keys anchor the registration to other entities: `trader_id` references `traders.id`, `jurisdiction_code` references `jurisdictions.jurisdiction_code`, and `input_tax_credit_id` references `input_tax_credits.id`. Each registration therefore represents a many-to-one association from the perspective of the trader and jurisdiction, while the one-to-one link to `input_tax_credits` reflects the design choice of embedding the credit reference directly in the registration row. Audit columns `created_at` and `updated_at` record the temporal provenance of each row.

**Table `traders`**

| id | trader_id | legal_name | pan_number | contact_email | contact_mobile | annual_aggregate_turnover | is_special_category_state | registration_status | registration_id | jurisdiction_code | taxable_supply_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | Christopher Wilson | Joshua Torres | 13.20 | true | registered | 2106693 | 5917299 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2986247 | Primary Cluster | PAN-2565 | Charles Larsen | Susan Levy | 16.40 | false | not_registered | 778572 | id_25 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | Mary Alvarez | Dana Nguyen | 19.60 | true | liable | 8387538 | 7731856 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 392491 | Compact Initiative | PAN-2577 | April Snyder | Roberta Anderson | 22.80 | false | registered | 4277008 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `traders` table stores the commercial actors. Its surrogate primary key `id` (integer values `1` through `4`) is paired with a business-facing `trader_id` (e.g. `2002007020080`, `2986247`, `98a02b9c-8fcd-11eb-924d-9cd76263cbd0`). Descriptive attributes include `legal_name` (e.g. `Adaptive Model`, `Primary Cluster`, `Composite Review D`), `pan_number` (e.g. `PAN-2559`), and contact details (`contact_email`, `contact_mobile`). The numeric `annual_aggregate_turnover` (e.g. `13.20`, `16.40`) and the boolean `is_special_category_state` (e.g. `true` for trader `1`) encode fiscal classification. The column `registration_status` (values `registered`, `not_registered`, `liable`) provides a quick lookup into the trader's compliance posture. Three foreign keys connect the trader to the wider graph: `registration_id` references `tax_registrations.registration_id`, `jurisdiction_code` references `jurisdictions.jurisdiction_code`, and `taxable_supply_id` references `taxable_supplies.id`. The design permits a trader to be associated with a single registration, a single jurisdiction, and a single supply in this normalised view, though the views below demonstrate how richer associations are reconstructed.

**Table `jurisdictions`**

| jurisdiction_code | jurisdiction_name | jurisdiction_type | is_special_category | turnover_threshold | trader_id | registration_id |
|---|---|---|---|---|---|---|
| 5917299 | Pilot Cluster | State | true | 8.95 | 1 | 2106693 |
| id_25 | Baseline Review | Union Territory | false | 11.90 | 2 | 778572 |
| 7731856 | Distributed Initiative A | State | true | 14.85 | 3 | 8387538 |
| 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory | false | 17.80 | 4 | 4277008 |

`jurisdictions` captures the territorial dimension of GST administration. The primary key `jurisdiction_code` is a heterogeneous identifier—integers like `5917299`, UUIDs like `7c692762-8fcd-11eb-924d-9cd76263cbd0`, and opaque strings like `id_25` all appear. The `jurisdiction_name` (e.g. `Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`) and `jurisdiction_type` (either `State` or `Union Territory`) classify the territory. The boolean `is_special_category` (e.g. `true` for `5917299`) mirrors the trader-level flag, enabling cross-entity comparison. The `turnover_threshold` (e.g. `8.95`) aligns with the registration-level threshold, suggesting a policy rule that ties jurisdictional turnover bands to registration eligibility. Foreign keys `trader_id` and `registration_id` reference `traders.id` and `tax_registrations.registration_id` respectively, establishing a bidirectional bridge: a jurisdiction knows which traders and registrations fall under its purview, and the registration and trader tables know which jurisdiction governs them.

**Table `taxable_supplies`**

| id | supply_id | supply_date | supply_type | is_exempted | value | tax_rate | trader_id | received_by_trader_id | jurisdiction_code | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 | goods | true | 19.95 | 22.45 | 1 | 1 | 5917299 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2839510 | 2024-11-04 | services | false | 21.90 | 26.90 | 2 | 2 | id_25 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030100 | 2025-04-15 | both | true | 23.85 | 31.35 | 3 | 3 | 7731856 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 3001009030060 | 2022-09-26 | goods | false | 25.80 | 35.80 | 4 | 4 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `taxable_supplies` table records individual commercial transactions. Its surrogate key `id` (integers `1`–`4`) is paired with a business-facing `supply_id` (e.g. `57e47252-8fcd-11eb-924d-9cd76263cbd0`, `2839510`, `3001009030100`). The `supply_date` (e.g. `2023-06-20`, `2024-11-04`) anchors the transaction in time. The `supply_type` column distinguishes `goods`, `services`, or `both`. The boolean `is_exempted` (e.g. `true` for supply `1`) and the numeric `value` (e.g. `19.95`, `21.90`) describe the transaction's fiscal character, while `tax_rate` (e.g. `22.45`, `26.90`) encodes the applicable GST rate. Two foreign keys reference `traders.id`—`trader_id` identifies the supplying party and `received_by_trader_id` identifies the recipient—making this table a natural bridge between two trader entities. The `jurisdiction_code` foreign key ties the supply to a territorial authority. This design captures the bilateral nature of a supply: every transaction involves a giver and a receiver, each a trader.

**Table `input_tax_credits`**

| id | credit_id | credit_amount | credit_date | status | linked_supply_id | trader_id | taxable_supply_id | registration_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | available | 974924 | 1 | 1 | 2106693 |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | utilized | 5082985 | 2 | 2 | 778572 |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | expired | ChIJpfaaVfpt5kcRJ6dswRM-WVY | 3 | 3 | 8387538 |
| 103 | 2933471 | 27.32 | 2023-02-16 | available | analytical-thinking | 4 | 4 | 4277008 |

`input_tax_credits` models the mechanism by which a trader offsets tax paid on inputs against tax collected on outputs. The surrogate key `id` (values `100`–`103`) is paired with a business-facing `credit_id` (e.g. `7119786`, `gd_fp_ne_acc1`, `ChIJd13ymnZu5kcRXM7jx5boJBs`). The `credit_amount` (e.g. `2,821`, `105,297`, `16,949`, `27.32`) quantifies the offset. The `credit_date` (e.g. `2024-11-10`, `2025-04-21`) records when the credit arose. The `status` column takes values `available`, `utilized`, or `expired`, reflecting the credit's lifecycle. The `linked_supply_id` column (e.g. `974924`, `5082985`) references `taxable_supplies.id`, establishing the causal link: a credit originates from a prior supply. Three additional foreign keys—`trader_id`, `taxable_supply_id`, and `registration_id`—tie the credit to the trader who holds it, the supply that generated it, and the registration under which it is claimed. This multi-reference design ensures that every credit can be traced back to the trader, the originating supply, and the regulatory registration.

**Table `training_centres`**

| training_centre_id | centre_id | centre_name | centre_type | inauguration_date | location | capacity | government_agency_id | government_mission_id |
|---|---|---|---|---|---|---|---|---|
| 100 | BJewellGraham | Regional Cluster | GST | 2025-04-14 | extended-location-99 | 32 | 100 | 100 |
| 101 | 4447025 | Seasonal Review D | Pradhan Mantri Kaushal Kendra | 2022-09-25 | integrated-location-100 | 41 | 101 | 101 |
| 102 | 209220 | Integrated Initiative | Yoga | 2023-02-09 | seasonal-location-101 | 50 | 102 | 102 |
| 103 | 9568439 | Extended Model | GST | 2024-07-20 | regional-location-102 | 59 | 103 | 103 |

The `training_centres` table captures the capacity-building infrastructure supporting GST administration. Its primary key `training_centre_id` (integers `100`–`103`) is paired with a business-facing `centre_id` (e.g. `BJewellGraham`, `4447025`). The `centre_name` (e.g. `Regional Cluster`, `Seasonal Review D`, `Integrated Initiative`) and `centre_type` (e.g. `GST`, `Pradhan Mantri Kaushal Kendra`, `Yoga`) classify the institution. The `inauguration_date` (e.g. `2025-04-14`, `2022-09-25`) records when the centre opened, while `location` (e.g. `extended-location-99`, `integrated-location-100`) and `capacity` (e.g. `32`, `41`, `50`, `59`) describe its physical and operational scope. Two foreign keys anchor the centre to the government ecosystem: `government_agency_id` references `government_agencies` and `government_mission_id` references `government_missions`. This design reflects the organizational reality that a training centre is operated by an agency under the umbrella of a mission.

**Table `government_missions`**

| id | mission_id | mission_name | launch_date | anniversary_year | objective | government_agency_id | training_centre_id |
|---|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 2022-05-17 | 32 | distributed-objectiv-36 | 100 | 100 |
| 101 | 82869 | Pilot Protocol A | 2023-10-01 | 43 | baseline-objectiv-37 | 101 | 101 |
| 102 | 8928505 | Baseline Programme | 2024-03-12 | 54 | pilot-objectiv-38 | 102 | 102 |
| 103 | 4716411 | Distributed Standard | 2025-08-23 | 65 | extended-objectiv-39 | 103 | 103 |

`government_missions` encodes the policy programmes that drive GST-related initiatives. Each mission is identified by a primary key (not shown in the sample but referenced by `training_centres.government_mission_id` and `government_agencies.government_mission_id`). Missions carry descriptive attributes such as `mission_name`, `mission_type`, `start_date`, and `end_date`. The foreign key `government_agency_id` references `government_agencies`, establishing that a mission is executed by one or more agencies. This table sits at the apex of the government hierarchy, with agencies reporting into missions and training centres operating under both.

**Table `government_agencies`**

| id | agency_id | agency_name | ministry | established_date | government_mission_id | training_centre_id | registration_id |
|---|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 2024-03-27 | 100 | 100 | 2106693 |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 2025-08-11 | 101 | 101 | 778572 |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 2022-01-22 | 102 | 102 | 8387538 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 2023-06-06 | 103 | 103 | 4277008 |

`government_agencies` represents the executive bodies responsible for implementing GST policy. Each agency is identified by a primary key (referenced by `training_centres.government_agency_id` and `government_missions.government_agency_id`). Agencies carry attributes such as `agency_name`, `agency_type`, and `established_date`. The foreign key `government_mission_id` references `government_missions`, indicating that an agency operates under a specific mission. This table forms the operational layer of the government hierarchy, bridging policy (missions) to execution (training centres and tax registrations).

With the base tables defined, we now turn to the views—materialised joins that reconstruct domain facts from the normalised schema. Each view answers a specific analytical question by combining columns from two or more tables.

**View `tax_registration_trader_view`**

```sql
CREATE VIEW tax_registration_trader_view AS
SELECT a.registration_id, a.issue_date, a.expiry_date, a.status, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM tax_registrations a JOIN traders b ON a.trader_id = b.id;
```

| registration_id | issue_date | expiry_date | status | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 1 | 2002007020080 | Adaptive Model |
| 778572 | 2024-07-12 | 2024-03-08 | pending | 2 | 2986247 | Primary Cluster |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 4 | 392491 | Compact Initiative |

This view joins `tax_registrations` to `traders` on `registration.trader_id = trader.id`, answering the question: "Which trader holds which registration, and what are the registration's temporal and fiscal attributes?" A row such as registration `2106693` linked to trader `1` (`Adaptive Model`, PAN `PAN-2559`) with `turnover_threshold` `8.95` and `status` `active` illustrates a compliant, active registration. The view collapses the two tables into a single fact: a trader's registration identity, its validity window, and the trader's commercial profile.

**View `tax_registration_jurisdiction_view`**

```sql
CREATE VIEW tax_registration_jurisdiction_view AS
SELECT a.registration_id, a.issue_date, a.expiry_date, a.status, b.jurisdiction_code AS jurisdiction_jurisdiction_code, b.jurisdiction_name AS jurisdiction_jurisdiction_name, b.jurisdiction_type AS jurisdiction_jurisdiction_type
FROM tax_registrations a JOIN jurisdictions b ON a.jurisdiction_code = b.jurisdiction_code;
```

| registration_id | issue_date | expiry_date | status | jurisdiction_jurisdiction_code | jurisdiction_jurisdiction_name | jurisdiction_jurisdiction_type |
|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 5917299 | Pilot Cluster | State |
| 778572 | 2024-07-12 | 2024-03-08 | pending | id_25 | Baseline Review | Union Territory |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 7731856 | Distributed Initiative A | State |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory |

By joining `tax_registrations` to `jurisdictions` on `registration.jurisdiction_code = jurisdiction.jurisdiction_code`, this view answers: "Under which jurisdiction does a registration operate, and what are the territorial regulatory parameters?" Registration `2106693` under jurisdiction `5917299` (`Pilot Cluster`, type `State`, `is_special_category` `true`) with `turnover_threshold` `8.95` shows a registration in a special-category state. The view aligns the registration's `turnover_threshold` with the jurisdiction's own threshold, enabling direct comparison and policy validation.

**View `tax_registration_input_tax_credit_view`**

```sql
CREATE VIEW tax_registration_input_tax_credit_view AS
SELECT a.registration_id, a.issue_date, a.expiry_date, a.status, b.id AS credit_id, b.credit_id AS credit_credit_id, b.credit_amount AS credit_credit_amount
FROM tax_registrations a JOIN input_tax_credits b ON a.input_tax_credit_id = b.id;
```

| registration_id | issue_date | expiry_date | status | credit_id | credit_credit_id | credit_credit_amount |
|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 100 | 7119786 | 2,821 |
| 778572 | 2024-07-12 | 2024-03-08 | pending | 101 | gd_fp_ne_acc1 | 105,297 |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 103 | 2933471 | 27.32 |

This view joins `tax_registrations` to `input_tax_credits` on `registration.input_tax_credit_id = credit.id`, answering: "What credit is associated with a registration, and what is its status and value?" Registration `2106693` linked to credit `100` (`credit_amount` `2,821`, `status` `available`, `credit_date` `2024-11-10`) demonstrates an active credit available for offset. The view surfaces the credit's lifecycle state alongside the registration's status, enabling auditors to verify that credits are properly aligned with active registrations.

**View `trader_tax_registration_view`**

```sql
CREATE VIEW trader_tax_registration_view AS
SELECT a.id, a.trader_id, a.legal_name, a.pan_number, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM traders a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| id | trader_id | legal_name | pan_number | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | 2106693 | 2023-02-01 | 2023-10-24 |
| 2 | 2986247 | Primary Cluster | PAN-2565 | 778572 | 2024-07-12 | 2024-03-08 |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | 8387538 | 2025-12-23 | 2025-08-19 |
| 4 | 392491 | Compact Initiative | PAN-2577 | 4277008 | 2022-05-07 | 2022-01-03 |

This view reverses the perspective of `tax_registration_trader_view`, joining `traders` to `tax_registrations` on `trader.registration_id = registration.registration_id`. It answers: "What registration is a trader currently holding, and what are the registration's attributes?" Trader `1` (`Adaptive Model`) linked to registration `2106693` (`status` `active`, `is_exempted` `true`) with `issue_date` `2023-02-01` and `expiry_date` `2023-10-24` provides a trader-centric view of the registration lifecycle. This orientation is useful for trader-facing dashboards that display registration status alongside trader identity.

**View `trader_jurisdiction_view`**

```sql
CREATE VIEW trader_jurisdiction_view AS
SELECT a.id, a.trader_id, a.legal_name, a.pan_number, b.jurisdiction_code AS jurisdiction_jurisdiction_code, b.jurisdiction_name AS jurisdiction_jurisdiction_name, b.jurisdiction_type AS jurisdiction_jurisdiction_type
FROM traders a JOIN jurisdictions b ON a.jurisdiction_code = b.jurisdiction_code;
```

| id | trader_id | legal_name | pan_number | jurisdiction_jurisdiction_code | jurisdiction_jurisdiction_name | jurisdiction_jurisdiction_type |
|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | 5917299 | Pilot Cluster | State |
| 2 | 2986247 | Primary Cluster | PAN-2565 | id_25 | Baseline Review | Union Territory |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | 7731856 | Distributed Initiative A | State |
| 4 | 392491 | Compact Initiative | PAN-2577 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory |

Joining `traders` to `jurisdictions` on `trader.jurisdiction_code = jurisdiction.jurisdiction_code`, this view answers: "Which jurisdiction governs a trader, and what are the territorial characteristics?" Trader `1` (`Adaptive Model`, `annual_aggregate_turnover` `13.20`, `is_special_category_state` `true`) under jurisdiction `5917299` (`Pilot Cluster`, type `State`, `is_special_category` `true`) shows alignment between the trader's special-category flag and the jurisdiction's classification. The view enables compliance checks by comparing the trader's `is_special_category_state` with the jurisdiction's `is_special_category`.

**View `trader_taxable_supply_view`**

```sql
CREATE VIEW trader_taxable_supply_view AS
SELECT a.id, a.trader_id, a.legal_name, a.pan_number, b.id AS supply_id, b.supply_id AS supply_supply_id, b.supply_date AS supply_supply_date
FROM traders a JOIN taxable_supplies b ON a.taxable_supply_id = b.id;
```

| id | trader_id | legal_name | pan_number | supply_id | supply_supply_id | supply_supply_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 |
| 2 | 2986247 | Primary Cluster | PAN-2565 | 2 | 2839510 | 2024-11-04 |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | 3 | 3001009030100 | 2025-04-15 |
| 4 | 392491 | Compact Initiative | PAN-2577 | 4 | 3001009030060 | 2022-09-26 |

This view joins `traders` to `taxable_supplies` on `trader.id = supply.trader_id`, answering: "What supplies has a trader made, and what are their fiscal characteristics?" Trader `1` linked to supply `1` (`supply_type` `goods`, `is_exempted` `true`, `value` `19.95`, `tax_rate` `22.45`, `supply_date` `2023-06-20`) illustrates a taxable supply of goods. The view surfaces the supply's value and tax rate alongside the trader's identity, enabling revenue analysis at the trader level.

**View `jurisdiction_trader_view`**

```sql
CREATE VIEW jurisdiction_trader_view AS
SELECT a.jurisdiction_code, a.jurisdiction_name, a.jurisdiction_type, a.is_special_category, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM jurisdictions a JOIN traders b ON a.trader_id = b.id;
```

| jurisdiction_code | jurisdiction_name | jurisdiction_type | is_special_category | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 5917299 | Pilot Cluster | State | true | 1 | 2002007020080 | Adaptive Model |
| id_25 | Baseline Review | Union Territory | false | 2 | 2986247 | Primary Cluster |
| 7731856 | Distributed Initiative A | State | true | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory | false | 4 | 392491 | Compact Initiative |

By joining `jurisdictions` to `traders` on `jurisdiction.trader_id = trader.id`, this view answers: "Which traders fall under a jurisdiction's authority?" Jurisdiction `5917299` (`Pilot Cluster`, type `State`) linked to trader `1` (`Adaptive Model`, `annual_aggregate_turnover` `13.20`) provides a jurisdiction-centric view of its trader population. This orientation is useful for territorial revenue reporting and compliance monitoring.

**View `jurisdiction_tax_registration_view`**

```sql
CREATE VIEW jurisdiction_tax_registration_view AS
SELECT a.jurisdiction_code, a.jurisdiction_name, a.jurisdiction_type, a.is_special_category, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM jurisdictions a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| jurisdiction_code | jurisdiction_name | jurisdiction_type | is_special_category | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 5917299 | Pilot Cluster | State | true | 2106693 | 2023-02-01 | 2023-10-24 |
| id_25 | Baseline Review | Union Territory | false | 778572 | 2024-07-12 | 2024-03-08 |
| 7731856 | Distributed Initiative A | State | true | 8387538 | 2025-12-23 | 2025-08-19 |
| 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory | false | 4277008 | 2022-05-07 | 2022-01-03 |

This view joins `jurisdictions` to `tax_registrations` on `jurisdiction.registration_id = registration.registration_id`, answering: "Which registrations operate under a jurisdiction?" Jurisdiction `5917299` linked to registration `2106693` (`status` `active`, `is_exempted` `true`, `turnover_threshold` `8.95`) shows the registrations under its purview. The view enables jurisdiction-level aggregation of registration statistics.

**View `taxable_supply_trader_view`**

```sql
CREATE VIEW taxable_supply_trader_view AS
SELECT a.id, a.supply_id, a.supply_date, a.supply_type, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM taxable_supplies a JOIN traders b ON a.trader_id = b.id;
```

| id | supply_id | supply_date | supply_type | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 | goods | 1 | 2002007020080 | Adaptive Model |
| 2 | 2839510 | 2024-11-04 | services | 2 | 2986247 | Primary Cluster |
| 3 | 3001009030100 | 2025-04-15 | both | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 4 | 3001009030060 | 2022-09-26 | goods | 4 | 392491 | Compact Initiative |

Joining `taxable_supplies` to `traders` on `supply.trader_id = trader.id`, this view answers: "Which trader made a given supply, and what are the trader's attributes?" Supply `1` (`supply_type` `goods`, `value` `19.95`, `tax_rate` `22.45`) linked to trader `1` (`Adaptive Model`, `legal_name` `Adaptive Model`, `pan_number` `PAN-2559`) provides a supply-centric view of the trader. This orientation is useful for supply-level audits that require trader context.

**View `taxable_supply_jurisdiction_view`**

```sql
CREATE VIEW taxable_supply_jurisdiction_view AS
SELECT a.id, a.supply_id, a.supply_date, a.supply_type, b.jurisdiction_code AS jurisdiction_jurisdiction_code, b.jurisdiction_name AS jurisdiction_jurisdiction_name, b.jurisdiction_type AS jurisdiction_jurisdiction_type
FROM taxable_supplies a JOIN jurisdictions b ON a.jurisdiction_code = b.jurisdiction_code;
```

| id | supply_id | supply_date | supply_type | jurisdiction_jurisdiction_code | jurisdiction_jurisdiction_name | jurisdiction_jurisdiction_type |
|---|---|---|---|---|---|---|
| 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 | goods | 5917299 | Pilot Cluster | State |
| 2 | 2839510 | 2024-11-04 | services | id_25 | Baseline Review | Union Territory |
| 3 | 3001009030100 | 2025-04-15 | both | 7731856 | Distributed Initiative A | State |
| 4 | 3001009030060 | 2022-09-26 | goods | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory |

This view joins `taxable_supplies` to `jurisdictions` on `supply.jurisdiction_code = jurisdiction.jurisdiction_code`, answering: "Under which jurisdiction was a supply made?" Supply `1` (`supply_type` `goods`, `value` `19.95`) under jurisdiction `5917299` (`Pilot Cluster`, type `State`) shows the territorial context of the transaction. The view enables territorial revenue analysis by aggregating supply values by jurisdiction.

**View `input_tax_credit_trader_view`**

```sql
CREATE VIEW input_tax_credit_trader_view AS
SELECT a.id, a.credit_id, a.credit_amount, a.credit_date, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM input_tax_credits a JOIN traders b ON a.trader_id = b.id;
```

| id | credit_id | credit_amount | credit_date | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | 1 | 2002007020080 | Adaptive Model |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | 2 | 2986247 | Primary Cluster |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 103 | 2933471 | 27.32 | 2023-02-16 | 4 | 392491 | Compact Initiative |

Joining `input_tax_credits` to `traders` on `credit.trader_id = trader.id`, this view answers: "Which trader holds a given credit, and what are the credit's attributes?" Credit `100` (`credit_amount` `2,821`, `status` `available`, `credit_date` `2024-11-10`) linked to trader `1` (`Adaptive Model`, `pan_number` `PAN-2559`) provides a credit-centric view of the trader. This orientation is useful for credit reconciliation and trader-level credit balance reporting.

**View `input_tax_credit_taxable_supply_view`**

```sql
CREATE VIEW input_tax_credit_taxable_supply_view AS
SELECT a.id, a.credit_id, a.credit_amount, a.credit_date, b.id AS supply_id, b.supply_id AS supply_supply_id, b.supply_date AS supply_supply_date
FROM input_tax_credits a JOIN taxable_supplies b ON a.taxable_supply_id = b.id;
```

| id | credit_id | credit_amount | credit_date | supply_id | supply_supply_id | supply_supply_date |
|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | 2 | 2839510 | 2024-11-04 |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | 3 | 3001009030100 | 2025-04-15 |
| 103 | 2933471 | 27.32 | 2023-02-16 | 4 | 3001009030060 | 2022-09-26 |

This view joins `input_tax_credits` to `taxable_supplies` on `credit.linked_supply_id = supply.id`, answering: "Which supply generated a given credit?" Credit `100` (`credit_amount` `2,821`, `status` `available`) linked to supply `1` (`supply_type` `goods`, `value` `19.95`, `tax_rate` `22.45`) demonstrates the causal link between a supply and its resulting credit. The view enables supply-level credit tracing, essential for audit trails.

**View `input_tax_credit_tax_registration_view`**

```sql
CREATE VIEW input_tax_credit_tax_registration_view AS
SELECT a.id, a.credit_id, a.credit_amount, a.credit_date, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM input_tax_credits a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| id | credit_id | credit_amount | credit_date | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | 2106693 | 2023-02-01 | 2023-10-24 |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | 778572 | 2024-07-12 | 2024-03-08 |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | 8387538 | 2025-12-23 | 2025-08-19 |
| 103 | 2933471 | 27.32 | 2023-02-16 | 4277008 | 2022-05-07 | 2022-01-03 |

Joining `input_tax_credits` to `tax_registrations` on `credit.registration_id = registration.registration_id`, this view answers: "Under which registration is a credit claimed?" Credit `100` (`credit_amount` `2,821`, `status` `available`) linked to registration `2106693` (`status` `active`, `is_exempted` `true`) shows the registration context of the credit. The view ensures that credits are properly aligned with active registrations, a key compliance check.

**View `training_centre_government_agency_view`**

```sql
CREATE VIEW training_centre_government_agency_view AS
SELECT a.training_centre_id, a.centre_id, a.centre_name, a.centre_type, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM training_centres a JOIN government_agencies b ON a.government_agency_id = b.id;
```

| training_centre_id | centre_id | centre_name | centre_type | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | BJewellGraham | Regional Cluster | GST | 100 | U.S. Steel | FSG Social Impact Advisors |
| 101 | 4447025 | Seasonal Review D | Pradhan Mantri Kaushal Kendra | 101 | Nikola Corporation | Whirlpool Corporation |
| 102 | 209220 | Integrated Initiative | Yoga | 102 | Oberthur Technologies | Education Writers Association |
| 103 | 9568439 | Extended Model | GST | 103 | General Telephone & Electronics | Switch Card Services Ltd. |

This view joins `training_centres` to `government_agencies` on `centre.government_agency_id = agency.id`, answering: "Which agency operates a given training centre?" Centre `100` (`centre_name` `Regional Cluster`, `centre_type` `GST`, `capacity` `32`) operated by agency `100` provides an agency-centric view of its training infrastructure. The view enables agency-level capacity planning and resource allocation.

**View `training_centre_government_mission_view`**

```sql
CREATE VIEW training_centre_government_mission_view AS
SELECT a.training_centre_id, a.centre_id, a.centre_name, a.centre_type, b.id AS mission_id, b.mission_id AS mission_mission_id, b.mission_name AS mission_mission_name
FROM training_centres a JOIN government_missions b ON a.government_mission_id = b.id;
```

| training_centre_id | centre_id | centre_name | centre_type | mission_id | mission_mission_id | mission_mission_name |
|---|---|---|---|---|---|---|
| 100 | BJewellGraham | Regional Cluster | GST | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework |
| 101 | 4447025 | Seasonal Review D | Pradhan Mantri Kaushal Kendra | 101 | 82869 | Pilot Protocol A |
| 102 | 209220 | Integrated Initiative | Yoga | 102 | 8928505 | Baseline Programme |
| 103 | 9568439 | Extended Model | GST | 103 | 4716411 | Distributed Standard |

Joining `training_centres` to `government_missions` on `centre.government_mission_id = mission.id`, this view answers: "Which mission does a training centre support?" Centre `100` (`centre_name` `Regional Cluster`, `inauguration_date` `2025-04-14`) linked to mission `100` shows the mission context of the centre. The view enables mission-level reporting on training infrastructure deployment.

**View `government_mission_government_agency_view`**

```sql
CREATE VIEW government_mission_government_agency_view AS
SELECT a.id, a.mission_id, a.mission_name, a.launch_date, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM government_missions a JOIN government_agencies b ON a.government_agency_id = b.id;
```

| id | mission_id | mission_name | launch_date | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 2022-05-17 | 100 | U.S. Steel | FSG Social Impact Advisors |
| 101 | 82869 | Pilot Protocol A | 2023-10-01 | 101 | Nikola Corporation | Whirlpool Corporation |
| 102 | 8928505 | Baseline Programme | 2024-03-12 | 102 | Oberthur Technologies | Education Writers Association |
| 103 | 4716411 | Distributed Standard | 2025-08-23 | 103 | General Telephone & Electronics | Switch Card Services Ltd. |

This view joins `government_missions` to `government_agencies` on `mission.id = agency.government_mission_id`, answering: "Which agencies execute a given mission?" Mission `100` linked to agency `100` provides a mission-centric view of its executing agencies. The view enables mission-level oversight of agency performance.

**View `government_mission_training_centre_view`**

```sql
CREATE VIEW government_mission_training_centre_view AS
SELECT a.id, a.mission_id, a.mission_name, a.launch_date, b.training_centre_id AS centre_training_centre_id, b.centre_id AS centre_centre_id, b.centre_name AS centre_centre_name
FROM government_missions a JOIN training_centres b ON a.training_centre_id = b.training_centre_id;
```

| id | mission_id | mission_name | launch_date | centre_training_centre_id | centre_centre_id | centre_centre_name |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 2022-05-17 | 100 | BJewellGraham | Regional Cluster |
| 101 | 82869 | Pilot Protocol A | 2023-10-01 | 101 | 4447025 | Seasonal Review D |
| 102 | 8928505 | Baseline Programme | 2024-03-12 | 102 | 209220 | Integrated Initiative |
| 103 | 4716411 | Distributed Standard | 2025-08-23 | 103 | 9568439 | Extended Model |

Joining `government_missions` to `training_centres` on `mission.id = centre.government_mission_id`, this view answers: "Which training centres support a given mission?" Mission `100` linked to centre `100` (`centre_name` `Regional Cluster`, `capacity` `32`) shows the training infrastructure supporting the mission. The view enables mission-level capacity assessment.

**View `government_agency_government_mission_view`**

```sql
CREATE VIEW government_agency_government_mission_view AS
SELECT a.id, a.agency_id, a.agency_name, a.ministry, b.id AS mission_id, b.mission_id AS mission_mission_id, b.mission_name AS mission_mission_name
FROM government_agencies a JOIN government_missions b ON a.government_mission_id = b.id;
```

| id | agency_id | agency_name | ministry | mission_id | mission_mission_id | mission_mission_name |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 101 | 82869 | Pilot Protocol A |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 102 | 8928505 | Baseline Programme |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 103 | 4716411 | Distributed Standard |

This view joins `government_agencies` to `government_missions` on `agency.government_mission_id = mission.id`, answering: "Which mission does an agency belong to?" Agency `100` linked to mission `100` provides an agency-centric view of its parent mission. The view enables agency-level mission alignment verification.

**View `government_agency_training_centre_view`**

```sql
CREATE VIEW government_agency_training_centre_view AS
SELECT a.id, a.agency_id, a.agency_name, a.ministry, b.training_centre_id AS centre_training_centre_id, b.centre_id AS centre_centre_id, b.centre_name AS centre_centre_name
FROM government_agencies a JOIN training_centres b ON a.training_centre_id = b.training_centre_id;
```

| id | agency_id | agency_name | ministry | centre_training_centre_id | centre_centre_id | centre_centre_name |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 100 | BJewellGraham | Regional Cluster |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 101 | 4447025 | Seasonal Review D |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 102 | 209220 | Integrated Initiative |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 103 | 9568439 | Extended Model |

Joining `government_agencies` to `training_centres` on `agency.id = centre.government_agency_id`, this view answers: "Which training centres does an agency operate?" Agency `100` linked to centre `100` (`centre_name` `Regional Cluster`, `centre_type` `GST`, `capacity` `32`) shows the agency's training portfolio. The view enables agency-level training resource management.

**View `government_agency_tax_registration_view`**

```sql
CREATE VIEW government_agency_tax_registration_view AS
SELECT a.id, a.agency_id, a.agency_name, a.ministry, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM government_agencies a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| id | agency_id | agency_name | ministry | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 2106693 | 2023-02-01 | 2023-10-24 |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 778572 | 2024-07-12 | 2024-03-08 |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 8387538 | 2025-12-23 | 2025-08-19 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 4277008 | 2022-05-07 | 2022-01-03 |

This view joins `government_agencies` to `tax_registrations` through the government hierarchy, answering: "Which tax registrations fall under an agency's purview?" Agency `100` linked to registration `2106693` (`status` `active`, `is_exempted` `true`) demonstrates the agency's regulatory reach. The view enables agency-level compliance monitoring across the registration population.

The schema above demonstrates a disciplined normalisation strategy: each entity type occupies its own table, foreign keys encode many-to-one or one-to-one relationships, and views reconstruct the richer associations needed for analytical queries. The GST domain's complexity—traders operating across jurisdictions, supplies generating credits, agencies executing missions through training centres—is captured through a combination of direct foreign keys and view-based joins. This approach preserves data integrity at the base table level while providing flexible, question-oriented access patterns through the views. The result is a schema that is both grounded in the domain ontology and optimised for the analytical workloads of tax administration.