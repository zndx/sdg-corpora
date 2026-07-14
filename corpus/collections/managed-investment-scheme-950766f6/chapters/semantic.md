## The Financial Services Domain as a Normalised Relational Model

The financial services regulatory domain is modelled as a collection of eight core entity types—managed investment schemes, financial licences, authorised representatives, financial products, product disclosure statements, investors, complaint records, and external ombudsmen—interconnected through a network of junction tables that resolve many-to-many relationships into first normal form. The resulting schema enforces referential integrity via foreign keys while preserving the flexibility to express the complex, overlapping associations that characterise real-world financial regulation: a single licence may underpin multiple schemes and representatives; a product may carry multiple disclosure statements; an investor may engage with multiple schemes through multiple representatives; and complaints may traverse the entire chain from investor to ombudsman. This chapter walks through the entity types, their attributes, the junction tables that bind them, and the materialised views that reconstruct domain facts from the normalised grain.

### Core Entity Types and Their Attributes

The anchor of the schema is the `managed_investment_schemes` table, which captures each pooled investment vehicle as a row. Its primary key `managed_investment_scheme_id` is a surrogate integer, while the business identifier `scheme_identifier` carries human-readable codes such as `SCH-2216` and `SCH-2217`. The `scheme_name` column stores descriptive labels like *Integrated Framework A* and *Pilot Programme*, and the `responsible_entity` column names the legal entity overseeing the scheme—`compact-responsi-98`, `composite-responsi-99`, and so on. A boolean flag `is_unlisted` distinguishes listed from unlisted schemes, and `establishment_date` records the date the scheme was created. Crucially, the column `financial_licence_id` is a foreign key pointing to `financial_licences.id`, encoding the one-to-many relationship that a licence may authorise multiple schemes.

**Table `managed_investment_schemes`**

| managed_investment_scheme_id | scheme_identifier | scheme_name | responsible_entity | is_unlisted | establishment_date | financial_licence_id |
|---|---|---|---|---|---|---|
| 1000 | SCH-2216 | Integrated Framework A | compact-responsi-98 | false | 2024-07-11 | 1000 |
| 1001 | SCH-2217 | Extended Protocol | composite-responsi-99 | true | 2025-12-22 | 1001 |
| 1002 | SCH-2218 | Pilot Programme | primary-responsi-100 | false | 2022-05-06 | 1002 |
| 1003 | SCH-2219 | Baseline Standard D | adaptive-responsi-101 | true | 2023-10-17 | 1003 |

The `financial_licences` table sits at the top of the regulatory hierarchy. Its primary key `id` is a surrogate integer, while `licence_number` (e.g. `LIC-2307`, `LIC-2308`) is the public identifier. The `licence_holder` column names the individual or entity holding the licence—Stephanie Collins, Robert Watts, Cheryl Bradley, William Nicholson—and `issuing_authority` records the regulator, such as `extended-issuing-33` or `regional-issuing-36`. The `status` column constrains to `active`, `suspended`, or `cancelled`, and `compliance_date` captures the last compliance audit date.

**Table `financial_licences`**

| id | licence_number | licence_holder | issuing_authority | status | compliance_date |
|---|---|---|---|---|---|
| 1000 | LIC-2307 | Stephanie Collins | extended-issuing-33 | active | 2022-05-02 |
| 1001 | LIC-2308 | Robert Watts | integrated-issuing-34 | suspended | 2023-10-13 |
| 1002 | LIC-2309 | Cheryl Bradley | seasonal-issuing-35 | cancelled | 2024-03-24 |
| 1003 | LIC-2310 | William Nicholson | regional-issuing-36 | active | 2025-08-08 |

Authorised representatives are the individuals empowered to provide financial product advice under a licence. The `authorised_representatives` table stores their surrogate key `id`, a business identifier `representative_id` (e.g. `2106720`, `6969429`, `developing-talent`), and the display name `representative_name` (Susan Levy, Debra Diaz, Stephanie Sutton, Robert Clark). The `authorisation_date` records when the representative was authorised, `remuneration_rate` stores a numeric rate (14.45, 16.90, 19.35, 21.80), and `contact_email` stores a contact name rather than an email address (Christopher Wilson, Charles Larsen, Mary Alvarez, April Snyder). The foreign key `financial_licence_id` ties each representative to their sponsoring licence.

**Table `authorised_representatives`**

| id | representative_id | representative_name | authorisation_date | remuneration_rate | contact_email | financial_licence_id |
|---|---|---|---|---|---|---|
| 1000 | 2106720 | Susan Levy | 2024-07-25 | 14.45 | Christopher Wilson | 1000 |
| 1001 | 6969429 | Debra Diaz | 2025-12-09 | 16.90 | Charles Larsen | 1001 |
| 1002 | developing-talent | Stephanie Sutton | 2022-05-20 | 19.35 | Mary Alvarez | 1002 |
| 1003 | 5917300 | Robert Clark | 2023-10-04 | 21.80 | April Snyder | 1003 |

Financial products are the investable instruments themselves. The `financial_products` table uses a surrogate primary key `id` and a `product_type` column constrained to `unit`, `share`, `bond`, or `derivative`. The `product_code` column carries codes such as `PRO-2675` and `PRO-2681`. Pricing and risk attributes include `issue_price` (30.51, 12.72, 43.48, 22.35), `minimum_investment` (20.20, 23.40, 26.60, 29.80), and `risk_rating` (low, medium, high, very_high). Two foreign keys anchor the product to its parent scheme (`managed_investment_scheme_id`) and to its disclosure document (`product_disclosure_statement_id`).

**Table `financial_products`**

| id | product_type | product_code | issue_price | minimum_investment | risk_rating | managed_investment_scheme_id | product_disclosure_statement_id |
|---|---|---|---|---|---|---|---|
| 1 | unit | PRO-2675 | 30.51 | 20.20 | low | 1000 | 1 |
| 2 | share | PRO-2681 | 12.72 | 23.40 | medium | 1001 | 2 |
| 3 | bond | PRO-2687 | 43.48 | 26.60 | high | 1002 | 3 |
| 4 | derivative | PRO-2693 | 22.35 | 29.80 | very_high | 1003 | 4 |

Product disclosure statements (PDS) are the regulatory documents that accompany every financial product. The `product_disclosure_statements` table uses a surrogate primary key `id` and a business identifier `pds_id` that may be numeric (`9125623`, `2087758`) or UUID-formatted (`5f8fcc36-8fcd-11eb-924d-9cd76263cbd0`). The `issue_date` and `valid_until_date` columns define the statement's validity window, `total_fees` stores the aggregate fees (8,258, 8,263, 1,740, 906.39), and `significant_risks` carries a risk classification code such as `baseline-signific-19` or `pilot-signific-20`. Foreign keys `financial_product_id` and `financial_licence_id` link the statement to its product and to the licence under which it was issued. Timestamps `created_at` and `updated_at` track the document's lifecycle.

**Table `product_disclosure_statements`**

| id | pds_id | issue_date | valid_until_date | total_fees | significant_risks | financial_product_id | financial_licence_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01 | 2024-07-19 | 8,258 | baseline-signific-19 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2087758 | 2024-07-12 | 2025-12-03 | 8,263 | pilot-signific-20 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 2022-05-14 | 1,740 | extended-signific-21 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 7441146 | 2022-05-07 | 2023-10-25 | 906.39 | integrated-signific-22 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Investors are the end participants. The `investors` table uses `investor_id` as its primary key (1, 2, 3, 4) and stores `investor_name` (Adaptive Framework, Primary Protocol, Composite Programme D, Compact Standard), `registration_date`, `total_invested` (16.20, 18.40, 20.60, 22.80), `contact_phone` (Joe Tsai, Stephanie Collins, Tasha Rodriguez, Walter Pratt), and a foreign key `complaint_record_id` pointing to the `complaint_records` table.

**Table `investors`**

| investor_id | investor_name | registration_date | total_invested | contact_phone | complaint_record_id |
|---|---|---|---|---|---|
| 1 | Adaptive Framework | 2023-06-19 | 16.20 | Joe Tsai | 1000 |
| 2 | Primary Protocol | 2024-11-03 | 18.40 | Stephanie Collins | 1001 |
| 3 | Composite Programme D | 2025-04-14 | 20.60 | Tasha Rodriguez | 1002 |
| 4 | Compact Standard | 2022-09-25 | 22.80 | Walter Pratt | 1003 |

Complaint records capture formal grievances. The `complaint_records` table stores complaint metadata including the complainant's name, the date of the complaint, the product or scheme in dispute, the outcome, and the assigned ombudsman reference.

**Table `complaint_records`**

| id | complaint_id | lodged_date | status | resolution_date | escalated_to | investor_id | authorised_representative_id | external_ombudsman_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 8189480 | 2024-07-11T18:06:00 | pending | 2024-07-05 | Financial Ombudsman Service | 1 | 1000 | 1 |
| 1001 | 575197 | 2025-12-22T01:23:00 | acknowledged | 2025-12-16 | ASIC | 2 | 1001 | 2 |
| 1002 | 13862 | 2022-05-06T08:40:00 | resolved | 2022-05-27 | Financial Ombudsman Service | 3 | 1002 | 3 |
| 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 | escalated | 2023-10-11 | ASIC | 4 | 1003 | 4 |

External ombudsmen are the independent dispute-resolution bodies. The `external_ombudsmans` table stores the ombudsman's name, jurisdiction, contact details, and the date they were appointed.

**Table `external_ombudsmans`**

| external_ombudsman_id | ombudsman_name | contact_phone | contact_email | jurisdiction | established_date |
|---|---|---|---|---|---|
| 1 | Extended Framework | Joe Tsai | Christopher Wilson | regional-jurisdic-30 | 2024-03-27 |
| 2 | Pilot Protocol A | Stephanie Collins | Charles Larsen | legacy-jurisdic-31 | 2025-08-11 |
| 3 | Baseline Programme | Tasha Rodriguez | Mary Alvarez | compact-jurisdic-32 | 2022-01-22 |
| 4 | Distributed Standard | Walter Pratt | April Snyder | composite-jurisdic-33 | 2023-06-06 |

### Junction Tables and Many-to-Many Relationships

The eight core tables alone cannot express the full topology of the domain. A financial product may be offered under multiple schemes, a representative may be authorised across multiple licences, an investor may hold positions in multiple schemes, and a complaint may involve multiple parties. These many-to-many relationships are resolved through nine junction tables, each containing at least two foreign keys that reference the primary keys of the participating entity tables.

The `schemes_products` junction table links `managed_investment_schemes` to `financial_products`, allowing a scheme to offer multiple products and a product to be available across multiple schemes. The `licences_representatives` table links `financial_licences` to `authorised_representatives`, supporting the scenario where a representative may hold authorisation under multiple licences. The `representatives_products` and `products_representatives` tables both link `authorised_representatives` to `financial_products`, providing bidirectional navigation paths for queries that need to traverse from representative to product or from product to representative.

**Table `schemes_products`**

| managed_investment_scheme_id | financial_product_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `licences_representatives`**

| financial_licence_id | authorised_representative_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `representatives_products`**

| authorised_representative_id | financial_product_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `products_representatives`**

| financial_product_id | authorised_representative_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `representatives_schemes` table links `authorised_representatives` to `managed_investment_schemes`, capturing which representatives are authorised to advise on which schemes. The `statements_investors` table links `product_disclosure_statements` to `investors`, recording which investors have received or acknowledged which disclosure statements. The `investors_schemes` table links `investors` to `managed_investment_schemes`, capturing the investment relationships between investors and schemes. The `investors_representatives` table links `investors` to `authorised_representatives`, recording which representative advised or served which investor.

**Table `representatives_schemes`**

| authorised_representative_id | managed_investment_scheme_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `statements_investors`**

| product_disclosure_statement_id | investor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `investors_schemes`**

| investor_id | managed_investment_scheme_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `investors_representatives`**

| investor_id | authorised_representative_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Finally, the `ombudsmans_records` table links `external_ombudsmans` to `complaint_records`, enabling an ombudsman to handle multiple complaints and a complaint to be associated with multiple ombudsmen in complex multi-jurisdictional cases.

**Table `ombudsmans_records`**

| external_ombudsman_id | complaint_record_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

### Materialised Views: Reconstructing Domain Facts

The junction tables and foreign keys provide a normalised foundation, but analysts and auditors need denormalised views that answer specific business questions. Each view is a `SELECT` statement that joins the relevant tables and presents a coherent slice of the domain.

The view `v_managed_investment_scheme_financial_licence` joins `managed_investment_schemes` to `financial_licences` on `financial_licence_id`, answering the question "which licence underpins which scheme?" A row such as `SCH-2216` → *Integrated Framework A* → `LIC-2307` → Stephanie Collins → *active* tells a compliance officer that the scheme is currently active under a valid licence.

**View `v_managed_investment_scheme_financial_licence`**

```sql
CREATE VIEW v_managed_investment_scheme_financial_licence AS
SELECT a.managed_investment_scheme_id, a.scheme_identifier, a.scheme_name, a.responsible_entity, b.id AS licence_id, b.licence_number AS licence_licence_number, b.licence_holder AS licence_licence_holder
FROM managed_investment_schemes a JOIN financial_licences b ON a.financial_licence_id = b.id;
```

| managed_investment_scheme_id | scheme_identifier | scheme_name | responsible_entity | licence_id | licence_licence_number | licence_licence_holder |
|---|---|---|---|---|---|---|
| 1000 | SCH-2216 | Integrated Framework A | compact-responsi-98 | 1000 | LIC-2307 | Stephanie Collins |
| 1001 | SCH-2217 | Extended Protocol | composite-responsi-99 | 1001 | LIC-2308 | Robert Watts |
| 1002 | SCH-2218 | Pilot Programme | primary-responsi-100 | 1002 | LIC-2309 | Cheryl Bradley |
| 1003 | SCH-2219 | Baseline Standard D | adaptive-responsi-101 | 1003 | LIC-2310 | William Nicholson |

The view `v_managed_investment_scheme_financial_product_detail` joins `managed_investment_schemes` to `financial_products` through the `schemes_products` junction table, answering "which products are offered by which scheme?" A row showing `SCH-2216` → *Integrated Framework A* → `unit` → `PRO-2675` → issue price 30.51 → risk *low* gives a product manager a complete picture of a scheme's offering.

**View `v_managed_investment_scheme_financial_product_detail`**

```sql
CREATE VIEW v_managed_investment_scheme_financial_product_detail AS
SELECT a.managed_investment_scheme_id, a.scheme_identifier, a.scheme_name, b.id AS product_id, b.product_type AS product_product_type, b.product_code AS product_product_code
FROM managed_investment_schemes a
  JOIN schemes_products j ON j.managed_investment_scheme_id = a.managed_investment_scheme_id
  JOIN financial_products b ON b.id = j.financial_product_id;
```

| managed_investment_scheme_id | scheme_identifier | scheme_name | product_id | product_product_type | product_product_code |
|---|---|---|---|---|---|
| 1000 | SCH-2216 | Integrated Framework A | 1 | unit | PRO-2675 |
| 1000 | SCH-2216 | Integrated Framework A | 2 | share | PRO-2681 |
| 1001 | SCH-2217 | Extended Protocol | 2 | share | PRO-2681 |
| 1001 | SCH-2217 | Extended Protocol | 3 | bond | PRO-2687 |
| 1002 | SCH-2218 | Pilot Programme | 3 | bond | PRO-2687 |
| 1002 | SCH-2218 | Pilot Programme | 4 | derivative | PRO-2693 |
| 1003 | SCH-2219 | Baseline Standard D | 4 | derivative | PRO-2693 |
| 1003 | SCH-2219 | Baseline Standard D | 1 | unit | PRO-2675 |

The view `v_financial_licence_authorised_representative_detail` joins `financial_licences` to `authorised_representatives` via `licences_representatives`, answering "which representatives are authorised under which licence?" A row such as `LIC-2307` → Stephanie Collins → `2106720` → Susan Levy → authorisation date 2024-07-25 → remuneration rate 14.45 provides a licence holder with a roster of their authorised team.

**View `v_financial_licence_authorised_representative_detail`**

```sql
CREATE VIEW v_financial_licence_authorised_representative_detail AS
SELECT a.id, a.licence_number, a.licence_holder, b.id AS representative_id, b.representative_id AS representative_representative_id, b.representative_name AS representative_representative_name
FROM financial_licences a
  JOIN licences_representatives j ON j.financial_licence_id = a.id
  JOIN authorised_representatives b ON b.id = j.authorised_representative_id;
```

| id | licence_number | licence_holder | representative_id | representative_representative_id | representative_representative_name |
|---|---|---|---|---|---|
| 1000 | LIC-2307 | Stephanie Collins | 1000 | 2106720 | Susan Levy |
| 1000 | LIC-2307 | Stephanie Collins | 1001 | 6969429 | Debra Diaz |
| 1001 | LIC-2308 | Robert Watts | 1001 | 6969429 | Debra Diaz |
| 1001 | LIC-2308 | Robert Watts | 1002 | developing-talent | Stephanie Sutton |
| 1002 | LIC-2309 | Cheryl Bradley | 1002 | developing-talent | Stephanie Sutton |
| 1002 | LIC-2309 | Cheryl Bradley | 1003 | 5917300 | Robert Clark |
| 1003 | LIC-2310 | William Nicholson | 1003 | 5917300 | Robert Clark |
| 1003 | LIC-2310 | William Nicholson | 1000 | 2106720 | Susan Levy |

The view `v_authorised_representative_financial_licence` performs the same join in the opposite direction, answering "under which licence does each representative operate?" A row showing `2106720` → Susan Levy → `LIC-2307` → Stephanie Collins → *active* → compliance date 2022-05-02 lets a representative verify their regulatory standing.

**View `v_authorised_representative_financial_licence`**

```sql
CREATE VIEW v_authorised_representative_financial_licence AS
SELECT a.id, a.representative_id, a.representative_name, a.authorisation_date, b.id AS licence_id, b.licence_number AS licence_licence_number, b.licence_holder AS licence_licence_holder
FROM authorised_representatives a JOIN financial_licences b ON a.financial_licence_id = b.id;
```

| id | representative_id | representative_name | authorisation_date | licence_id | licence_licence_number | licence_licence_holder |
|---|---|---|---|---|---|---|
| 1000 | 2106720 | Susan Levy | 2024-07-25 | 1000 | LIC-2307 | Stephanie Collins |
| 1001 | 6969429 | Debra Diaz | 2025-12-09 | 1001 | LIC-2308 | Robert Watts |
| 1002 | developing-talent | Stephanie Sutton | 2022-05-20 | 1002 | LIC-2309 | Cheryl Bradley |
| 1003 | 5917300 | Robert Clark | 2023-10-04 | 1003 | LIC-2310 | William Nicholson |

The view `v_authorised_representative_financial_product_detail` joins `authorised_representatives` to `financial_products` through `representatives_products`, answering "which products can each representative advise on?" A row such as `2106720` → Susan Levy → `unit` → `PRO-2675` → issue price 30.51 → risk *low* defines the scope of a representative's advisory permissions.

**View `v_authorised_representative_financial_product_detail`**

```sql
CREATE VIEW v_authorised_representative_financial_product_detail AS
SELECT a.id, a.representative_id, a.representative_name, b.id AS product_id, b.product_type AS product_product_type, b.product_code AS product_product_code
FROM authorised_representatives a
  JOIN representatives_products j ON j.authorised_representative_id = a.id
  JOIN financial_products b ON b.id = j.financial_product_id;
```

| id | representative_id | representative_name | product_id | product_product_type | product_product_code |
|---|---|---|---|---|---|
| 1000 | 2106720 | Susan Levy | 1 | unit | PRO-2675 |
| 1000 | 2106720 | Susan Levy | 2 | share | PRO-2681 |
| 1001 | 6969429 | Debra Diaz | 2 | share | PRO-2681 |
| 1001 | 6969429 | Debra Diaz | 3 | bond | PRO-2687 |
| 1002 | developing-talent | Stephanie Sutton | 3 | bond | PRO-2687 |
| 1002 | developing-talent | Stephanie Sutton | 4 | derivative | PRO-2693 |
| 1003 | 5917300 | Robert Clark | 4 | derivative | PRO-2693 |
| 1003 | 5917300 | Robert Clark | 1 | unit | PRO-2675 |

The view `v_authorised_representative_managed_investment_scheme_detail` joins `authorised_representatives` to `managed_investment_schemes` through `representatives_schemes`, answering "which schemes can each representative advise on?" A row showing `2106720` → Susan Levy → `SCH-2216` → *Integrated Framework A* → responsible entity `compact-responsi-98` → unlisted `false` → establishment date 2024-07-11 gives a compliance officer a complete picture of a representative's scheme-level authorisations.

**View `v_authorised_representative_managed_investment_scheme_detail`**

```sql
CREATE VIEW v_authorised_representative_managed_investment_scheme_detail AS
SELECT a.id, a.representative_id, a.representative_name, b.managed_investment_scheme_id AS scheme_managed_investment_scheme_id, b.scheme_identifier AS scheme_scheme_identifier, b.scheme_name AS scheme_scheme_name
FROM authorised_representatives a
  JOIN representatives_schemes j ON j.authorised_representative_id = a.id
  JOIN managed_investment_schemes b ON b.managed_investment_scheme_id = j.managed_investment_scheme_id;
```

| id | representative_id | representative_name | scheme_managed_investment_scheme_id | scheme_scheme_identifier | scheme_scheme_name |
|---|---|---|---|---|---|
| 1000 | 2106720 | Susan Levy | 1000 | SCH-2216 | Integrated Framework A |
| 1000 | 2106720 | Susan Levy | 1001 | SCH-2217 | Extended Protocol |
| 1001 | 6969429 | Debra Diaz | 1001 | SCH-2217 | Extended Protocol |
| 1001 | 6969429 | Debra Diaz | 1002 | SCH-2218 | Pilot Programme |
| 1002 | developing-talent | Stephanie Sutton | 1002 | SCH-2218 | Pilot Programme |
| 1002 | developing-talent | Stephanie Sutton | 1003 | SCH-2219 | Baseline Standard D |
| 1003 | 5917300 | Robert Clark | 1003 | SCH-2219 | Baseline Standard D |
| 1003 | 5917300 | Robert Clark | 1000 | SCH-2216 | Integrated Framework A |

The view `v_financial_product_managed_investment_scheme` joins `financial_products` to `managed_investment_schemes` through `schemes_products`, answering "which scheme offers which product?" A row such as `unit` → `PRO-2675` → issue price 30.51 → risk *low* → `SCH-2216` → *Integrated Framework A* → responsible entity `compact-responsi-98` provides a product catalog view.

**View `v_financial_product_managed_investment_scheme`**

```sql
CREATE VIEW v_financial_product_managed_investment_scheme AS
SELECT a.id, a.product_type, a.product_code, a.issue_price, b.managed_investment_scheme_id AS scheme_managed_investment_scheme_id, b.scheme_identifier AS scheme_scheme_identifier, b.scheme_name AS scheme_scheme_name
FROM financial_products a JOIN managed_investment_schemes b ON a.managed_investment_scheme_id = b.managed_investment_scheme_id;
```

| id | product_type | product_code | issue_price | scheme_managed_investment_scheme_id | scheme_scheme_identifier | scheme_scheme_name |
|---|---|---|---|---|---|---|
| 1 | unit | PRO-2675 | 30.51 | 1000 | SCH-2216 | Integrated Framework A |
| 2 | share | PRO-2681 | 12.72 | 1001 | SCH-2217 | Extended Protocol |
| 3 | bond | PRO-2687 | 43.48 | 1002 | SCH-2218 | Pilot Programme |
| 4 | derivative | PRO-2693 | 22.35 | 1003 | SCH-2219 | Baseline Standard D |

The view `v_financial_product_authorised_representative_detail` joins `financial_products` to `authorised_representatives` through `products_representatives`, answering "which representatives are authorised for which product?" A row showing `unit` → `PRO-2675` → issue price 30.51 → risk *low* → `2106720` → Susan Levy → remuneration rate 14.45 defines the product-representative mapping.

**View `v_financial_product_authorised_representative_detail`**

```sql
CREATE VIEW v_financial_product_authorised_representative_detail AS
SELECT a.id, a.product_type, a.product_code, b.id AS representative_id, b.representative_id AS representative_representative_id, b.representative_name AS representative_representative_name
FROM financial_products a
  JOIN products_representatives j ON j.financial_product_id = a.id
  JOIN authorised_representatives b ON b.id = j.authorised_representative_id;
```

| id | product_type | product_code | representative_id | representative_representative_id | representative_representative_name |
|---|---|---|---|---|---|
| 1 | unit | PRO-2675 | 1000 | 2106720 | Susan Levy |
| 1 | unit | PRO-2675 | 1001 | 6969429 | Debra Diaz |
| 2 | share | PRO-2681 | 1001 | 6969429 | Debra Diaz |
| 2 | share | PRO-2681 | 1002 | developing-talent | Stephanie Sutton |
| 3 | bond | PRO-2687 | 1002 | developing-talent | Stephanie Sutton |
| 3 | bond | PRO-2687 | 1003 | 5917300 | Robert Clark |
| 4 | derivative | PRO-2693 | 1003 | 5917300 | Robert Clark |
| 4 | derivative | PRO-2693 | 1000 | 2106720 | Susan Levy |

The view `v_financial_product_product_disclosure_statement` joins `financial_products` to `product_disclosure_statements` on `product_disclosure_statement_id`, answering "which disclosure statement accompanies which product?" A row such as `unit` → `PRO-2675` → issue price 30.51 → risk *low* → `9125623` → issue date 2023-02-01 → valid until 2024-07-19 → total fees 8,258 → risks `baseline-signific-19` gives a regulator a complete compliance snapshot.

**View `v_financial_product_product_disclosure_statement`**

```sql
CREATE VIEW v_financial_product_product_disclosure_statement AS
SELECT a.id, a.product_type, a.product_code, a.issue_price, b.id AS statement_id, b.pds_id AS statement_pds_id, b.issue_date AS statement_issue_date
FROM financial_products a JOIN product_disclosure_statements b ON a.product_disclosure_statement_id = b.id;
```

| id | product_type | product_code | issue_price | statement_id | statement_pds_id | statement_issue_date |
|---|---|---|---|---|---|---|
| 1 | unit | PRO-2675 | 30.51 | 1 | 9125623 | 2023-02-01 |
| 2 | share | PRO-2681 | 12.72 | 2 | 2087758 | 2024-07-12 |
| 3 | bond | PRO-2687 | 43.48 | 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 |
| 4 | derivative | PRO-2693 | 22.35 | 4 | 7441146 | 2022-05-07 |

The view `v_product_disclosure_statement_financial_product` performs the same join in the opposite direction, answering "which product does each disclosure statement cover?" A row showing `9125623` → issue date 2023-02-01 → valid until 2024-07-19 → total fees 8,258 → risks `baseline-signific-19` → `unit` → `PRO-2675` → issue price 30.51 → risk *low* lets a document manager trace from statement to product.

**View `v_product_disclosure_statement_financial_product`**

```sql
CREATE VIEW v_product_disclosure_statement_financial_product AS
SELECT a.id, a.pds_id, a.issue_date, a.valid_until_date, b.id AS product_id, b.product_type AS product_product_type, b.product_code AS product_product_code
FROM product_disclosure_statements a JOIN financial_products b ON a.financial_product_id = b.id;
```

| id | pds_id | issue_date | valid_until_date | product_id | product_product_type | product_product_code |
|---|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01 | 2024-07-19 | 1 | unit | PRO-2675 |
| 2 | 2087758 | 2024-07-12 | 2025-12-03 | 2 | share | PRO-2681 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 2022-05-14 | 3 | bond | PRO-2687 |
| 4 | 7441146 | 2022-05-07 | 2023-10-25 | 4 | derivative | PRO-2693 |

The view `v_product_disclosure_statement_financial_licence` joins `product_disclosure_statements` to `financial_licences` on `financial_licence_id`, answering "under which licence was each disclosure statement issued?" A row such as `9125623` → issue date 2023-02-01 → valid until 2024-07-19 → total fees 8,258 → risks `baseline-signific-19` → `LIC-2307` → Stephanie Collins → *active* → compliance date 2022-05-02 provides a licence-level compliance audit trail.

**View `v_product_disclosure_statement_financial_licence`**

```sql
CREATE VIEW v_product_disclosure_statement_financial_licence AS
SELECT a.id, a.pds_id, a.issue_date, a.valid_until_date, b.id AS licence_id, b.licence_number AS licence_licence_number, b.licence_holder AS licence_licence_holder
FROM product_disclosure_statements a JOIN financial_licences b ON a.financial_licence_id = b.id;
```

| id | pds_id | issue_date | valid_until_date | licence_id | licence_licence_number | licence_licence_holder |
|---|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01 | 2024-07-19 | 1000 | LIC-2307 | Stephanie Collins |
| 2 | 2087758 | 2024-07-12 | 2025-12-03 | 1001 | LIC-2308 | Robert Watts |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 2022-05-14 | 1002 | LIC-2309 | Cheryl Bradley |
| 4 | 7441146 | 2022-05-07 | 2023-10-25 | 1003 | LIC-2310 | William Nicholson |

The view `v_product_disclosure_statement_investor_detail` joins `product_disclosure_statements` to `investors` through `statements_investors`, answering "which investors have received which disclosure statements?" A row showing `9125623` → issue date 2023-02-01 → total fees 8,258 → risks `baseline-signific-19` → investor 1 → *Adaptive Framework* → registration date 2023-06-19 → total invested 16.20 → contact Joe Tsai confirms investor acknowledgment.

**View `v_product_disclosure_statement_investor_detail`**

```sql
CREATE VIEW v_product_disclosure_statement_investor_detail AS
SELECT a.id, a.pds_id, a.issue_date, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name, b.registration_date AS investor_registration_date
FROM product_disclosure_statements a
  JOIN statements_investors j ON j.product_disclosure_statement_id = a.id
  JOIN investors b ON b.investor_id = j.investor_id;
```

| id | pds_id | issue_date | investor_investor_id | investor_investor_name | investor_registration_date |
|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01 | 1 | Adaptive Framework | 2023-06-19 |
| 1 | 9125623 | 2023-02-01 | 2 | Primary Protocol | 2024-11-03 |
| 2 | 2087758 | 2024-07-12 | 2 | Primary Protocol | 2024-11-03 |
| 2 | 2087758 | 2024-07-12 | 3 | Composite Programme D | 2025-04-14 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 3 | Composite Programme D | 2025-04-14 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 4 | Compact Standard | 2022-09-25 |
| 4 | 7441146 | 2022-05-07 | 4 | Compact Standard | 2022-09-25 |
| 4 | 7441146 | 2022-05-07 | 1 | Adaptive Framework | 2023-06-19 |

The view `v_investor_managed_investment_scheme_detail` joins `investors` to `managed_investment_schemes` through `investors_schemes`, answering "which schemes does each investor participate in?" A row such as investor 1 → *Adaptive Framework* → registration date 2023-06-19 → total invested 16.20 → contact Joe Tsai → `SCH-2216` → *Integrated Framework A* → responsible entity `compact-responsi-98` → unlisted `false` → establishment date 2024-07-11 gives an investor relations team a complete portfolio view.

**View `v_investor_managed_investment_scheme_detail`**

```sql
CREATE VIEW v_investor_managed_investment_scheme_detail AS
SELECT a.investor_id, a.investor_name, a.registration_date, b.managed_investment_scheme_id AS scheme_managed_investment_scheme_id, b.scheme_identifier AS scheme_scheme_identifier, b.scheme_name AS scheme_scheme_name
FROM investors a
  JOIN investors_schemes j ON j.investor_id = a.investor_id
  JOIN managed_investment_schemes b ON b.managed_investment_scheme_id = j.managed_investment_scheme_id;
```

| investor_id | investor_name | registration_date | scheme_managed_investment_scheme_id | scheme_scheme_identifier | scheme_scheme_name |
|---|---|---|---|---|---|
| 1 | Adaptive Framework | 2023-06-19 | 1000 | SCH-2216 | Integrated Framework A |
| 1 | Adaptive Framework | 2023-06-19 | 1001 | SCH-2217 | Extended Protocol |
| 2 | Primary Protocol | 2024-11-03 | 1001 | SCH-2217 | Extended Protocol |
| 2 | Primary Protocol | 2024-11-03 | 1002 | SCH-2218 | Pilot Programme |
| 3 | Composite Programme D | 2025-04-14 | 1002 | SCH-2218 | Pilot Programme |
| 3 | Composite Programme D | 2025-04-14 | 1003 | SCH-2219 | Baseline Standard D |
| 4 | Compact Standard | 2022-09-25 | 1003 | SCH-2219 | Baseline Standard D |
| 4 | Compact Standard | 2022-09-25 | 1000 | SCH-2216 | Integrated Framework A |

The view `v_investor_authorised_representative_detail` joins `investors` to `authorised_representatives` through `investors_representatives`, answering "which representative serves each investor?" A row showing investor 1 → *Adaptive Framework* → registration date 2023-06-19 → total invested 16.20 → contact Joe Tsai → `2106720` → Susan Levy → authorisation date 2024-07-25 → remuneration rate 14.45 → contact Christopher Wilson defines the investor-representative relationship.

**View `v_investor_authorised_representative_detail`**

```sql
CREATE VIEW v_investor_authorised_representative_detail AS
SELECT a.investor_id, a.investor_name, a.registration_date, b.id AS representative_id, b.representative_id AS representative_representative_id, b.representative_name AS representative_representative_name
FROM investors a
  JOIN investors_representatives j ON j.investor_id = a.investor_id
  JOIN authorised_representatives b ON b.id = j.authorised_representative_id;
```

| investor_id | investor_name | registration_date | representative_id | representative_representative_id | representative_representative_name |
|---|---|---|---|---|---|
| 1 | Adaptive Framework | 2023-06-19 | 1000 | 2106720 | Susan Levy |
| 1 | Adaptive Framework | 2023-06-19 | 1001 | 6969429 | Debra Diaz |
| 2 | Primary Protocol | 2024-11-03 | 1001 | 6969429 | Debra Diaz |
| 2 | Primary Protocol | 2024-11-03 | 1002 | developing-talent | Stephanie Sutton |
| 3 | Composite Programme D | 2025-04-14 | 1002 | developing-talent | Stephanie Sutton |
| 3 | Composite Programme D | 2025-04-14 | 1003 | 5917300 | Robert Clark |
| 4 | Compact Standard | 2022-09-25 | 1003 | 5917300 | Robert Clark |
| 4 | Compact Standard | 2022-09-25 | 1000 | 2106720 | Susan Levy |

The view `v_investor_complaint_record` joins `investors` to `complaint_records` on `complaint_record_id`, answering "which complaint is associated with each investor?" A row such as investor 1 → *Adaptive Framework* → registration date 2023-06-19 → total invested 16.20 → contact Joe Tsai → complaint record 1000 → complainant name → complaint date → product in dispute → outcome provides a complaint tracking view.

**View `v_investor_complaint_record`**

```sql
CREATE VIEW v_investor_complaint_record AS
SELECT a.investor_id, a.investor_name, a.registration_date, a.total_invested, b.id AS record_id, b.complaint_id AS record_complaint_id, b.lodged_date AS record_lodged_date
FROM investors a JOIN complaint_records b ON a.complaint_record_id = b.id;
```

| investor_id | investor_name | registration_date | total_invested | record_id | record_complaint_id | record_lodged_date |
|---|---|---|---|---|---|---|
| 1 | Adaptive Framework | 2023-06-19 | 16.20 | 1000 | 8189480 | 2024-07-11T18:06:00 |
| 2 | Primary Protocol | 2024-11-03 | 18.40 | 1001 | 575197 | 2025-12-22T01:23:00 |
| 3 | Composite Programme D | 2025-04-14 | 20.60 | 1002 | 13862 | 2022-05-06T08:40:00 |
| 4 | Compact Standard | 2022-09-25 | 22.80 | 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 |

The view `v_complaint_record_investor` performs the same join in the opposite direction, answering "which investor filed each complaint?" A row showing complaint record 1000 → complainant name → complaint date → product in dispute → outcome → investor 1 → *Adaptive Framework* → registration date 2023-06-19 → total invested 16.20 → contact Joe Tsai gives a complaints officer a complete picture of the complainant.

**View `v_complaint_record_investor`**

```sql
CREATE VIEW v_complaint_record_investor AS
SELECT a.id, a.complaint_id, a.lodged_date, a.status, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name, b.registration_date AS investor_registration_date
FROM complaint_records a JOIN investors b ON a.investor_id = b.investor_id;
```

| id | complaint_id | lodged_date | status | investor_investor_id | investor_investor_name | investor_registration_date |
|---|---|---|---|---|---|---|
| 1000 | 8189480 | 2024-07-11T18:06:00 | pending | 1 | Adaptive Framework | 2023-06-19 |
| 1001 | 575197 | 2025-12-22T01:23:00 | acknowledged | 2 | Primary Protocol | 2024-11-03 |
| 1002 | 13862 | 2022-05-06T08:40:00 | resolved | 3 | Composite Programme D | 2025-04-14 |
| 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 | escalated | 4 | Compact Standard | 2022-09-25 |

The view `v_complaint_record_authorised_representative` joins `complaint_records` to `authorised_representatives` through the junction tables, answering "which representative is associated with each complaint?" A row such as complaint record 1000 → complainant name → complaint date → product in dispute → outcome → `2106720` → Susan Levy → authorisation date 2024-07-25 → remuneration rate 14.45 → contact Christopher Wilson identifies the representative under scrutiny.

**View `v_complaint_record_authorised_representative`**

```sql
CREATE VIEW v_complaint_record_authorised_representative AS
SELECT a.id, a.complaint_id, a.lodged_date, a.status, b.id AS representative_id, b.representative_id AS representative_representative_id, b.representative_name AS representative_representative_name
FROM complaint_records a JOIN authorised_representatives b ON a.authorised_representative_id = b.id;
```

| id | complaint_id | lodged_date | status | representative_id | representative_representative_id | representative_representative_name |
|---|---|---|---|---|---|---|
| 1000 | 8189480 | 2024-07-11T18:06:00 | pending | 1000 | 2106720 | Susan Levy |
| 1001 | 575197 | 2025-12-22T01:23:00 | acknowledged | 1001 | 6969429 | Debra Diaz |
| 1002 | 13862 | 2022-05-06T08:40:00 | resolved | 1002 | developing-talent | Stephanie Sutton |
| 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 | escalated | 1003 | 5917300 | Robert Clark |

The view `v_complaint_record_external_ombudsman` joins `complaint_records` to `external_ombudsmans` through `ombudsmans_records`, answering "which ombudsman is handling each complaint?" A row showing complaint record 1000 → complainant name → complaint date → product in dispute → outcome → ombudsman name → jurisdiction → contact details → appointment date provides a dispute resolution tracking view.

**View `v_complaint_record_external_ombudsman`**

```sql
CREATE VIEW v_complaint_record_external_ombudsman AS
SELECT a.id, a.complaint_id, a.lodged_date, a.status, b.external_ombudsman_id AS ombudsman_external_ombudsman_id, b.ombudsman_name AS ombudsman_ombudsman_name, b.contact_phone AS ombudsman_contact_phone
FROM complaint_records a JOIN external_ombudsmans b ON a.external_ombudsman_id = b.external_ombudsman_id;
```

| id | complaint_id | lodged_date | status | ombudsman_external_ombudsman_id | ombudsman_ombudsman_name | ombudsman_contact_phone |
|---|---|---|---|---|---|---|
| 1000 | 8189480 | 2024-07-11T18:06:00 | pending | 1 | Extended Framework | Joe Tsai |
| 1001 | 575197 | 2025-12-22T01:23:00 | acknowledged | 2 | Pilot Protocol A | Stephanie Collins |
| 1002 | 13862 | 2022-05-06T08:40:00 | resolved | 3 | Baseline Programme | Tasha Rodriguez |
| 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 | escalated | 4 | Distributed Standard | Walter Pratt |

The view `v_external_ombudsman_complaint_record_detail` joins `external_ombudsmans` to `complaint_records` through `ombudsmans_records`, answering "which complaints is each ombudsman handling?" A row such as ombudsman name → jurisdiction → contact details → appointment date → complaint record 1000 → complainant name → complaint date → product in dispute → outcome gives an ombudsman's office a workload overview.

**View `v_external_ombudsman_complaint_record_detail`**

```sql
CREATE VIEW v_external_ombudsman_complaint_record_detail AS
SELECT a.external_ombudsman_id, a.ombudsman_name, a.contact_phone, b.id AS record_id, b.complaint_id AS record_complaint_id, b.lodged_date AS record_lodged_date
FROM external_ombudsmans a
  JOIN ombudsmans_records j ON j.external_ombudsman_id = a.external_ombudsman_id
  JOIN complaint_records b ON b.id = j.complaint_record_id;
```

| external_ombudsman_id | ombudsman_name | contact_phone | record_id | record_complaint_id | record_lodged_date |
|---|---|---|---|---|---|
| 1 | Extended Framework | Joe Tsai | 1000 | 8189480 | 2024-07-11T18:06:00 |
| 1 | Extended Framework | Joe Tsai | 1001 | 575197 | 2025-12-22T01:23:00 |
| 2 | Pilot Protocol A | Stephanie Collins | 1001 | 575197 | 2025-12-22T01:23:00 |
| 2 | Pilot Protocol A | Stephanie Collins | 1002 | 13862 | 2022-05-06T08:40:00 |
| 3 | Baseline Programme | Tasha Rodriguez | 1002 | 13862 | 2022-05-06T08:40:00 |
| 3 | Baseline Programme | Tasha Rodriguez | 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 |
| 4 | Distributed Standard | Walter Pratt | 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 |
| 4 | Distributed Standard | Walter Pratt | 1000 | 8189480 | 2024-07-11T18:06:00 |

### Synthesis

The schema models the financial services domain as a graph of eight entity types connected by nine junction tables, with foreign keys enforcing the cardinality constraints that a licence underpins multiple schemes and representatives, a product belongs to one scheme but may carry multiple disclosure statements, and an investor may engage with multiple schemes through multiple representatives. The 19 materialised views reconstruct the most common analytical queries from this normalised grain, each view answering a specific business question by joining the relevant tables and presenting a denormalised row that combines identifiers, attributes, and status flags into a single readable fact. The result is a schema that is both rigorous enough to enforce regulatory constraints and flexible enough to express the complex, overlapping relationships that characterise financial services compliance.