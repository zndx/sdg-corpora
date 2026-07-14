## Modelling the Managed Investment Domain

The managed investment domain captures the regulatory and commercial relationships between authorised representatives, investment schemes, financial products, disclosure documents, investors, and the remuneration events that flow through the ecosystem. At its core, the domain is a network of entities bound by authorisation, ownership, and transactional links. The relational schema materialises this network through a set of base tables that store atomic facts, junction tables that resolve many-to-many associations, and a collection of pre-joined views that reconstruct domain-level narratives for reporting and compliance. Every table carries a surrogate primary key that serves as the stable record identifier across joins, while business identifiers such as ARSNs, product codes, and investor IDs are preserved as distinct columns to support external reconciliation.

**Table `managed_investment_schemes`**

| id | arsn | scheme_name | status | listing_status | responsible_entity | authorised_representative_id |
|---|---|---|---|---|---|---|
| 1 | extended-arsn-33 | Integrated Framework A | active | unlisted | compact-responsi-98 | 1 |
| 2 | integrated-arsn-34 | Extended Protocol | deregistered | listed | composite-responsi-99 | 2 |
| 3 | seasonal-arsn-35 | Pilot Programme | suspended | unlisted | primary-responsi-100 | 3 |
| 4 | regional-arsn-36 | Baseline Standard D | active | listed | adaptive-responsi-101 | 4 |

The `managed_investment_schemes` table is the central hub of the domain. Each row represents a registered investment scheme identified by a unique surrogate `id` and a business-level `arsn` — for example, `extended-arsn-33` for the scheme named `Integrated Framework A`. The `scheme_name` column holds human-readable labels, while `status` captures the operational state (`active`, `deregistered`, `suspended`) and `listing_status` indicates whether the scheme is listed on a public exchange. The `responsible_entity` column names the legal entity bearing fiduciary responsibility, such as `compact-responsi-98`. Crucially, the `authorised_representative_id` column is a foreign key into the `authorised_representatives` table, establishing a direct authorisation link: scheme 1 (`Integrated Framework A`) is authorised by representative 1 (Lisa Simmons), scheme 2 (`Extended Protocol`) by representative 2 (Valuan Torpedo), and so on. This single column is the primary bridge between the scheme and representative layers of the model.

**Table `authorised_representatives`**

| id | rep_id | rep_name | authorisation_date | authorisation_status | licensing_entity |
|---|---|---|---|---|---|
| 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons | 2024-07-25T18:42:00 | active | composite-licensin-27 |
| 2 | 10782192 | Valuan Torpedo | 2025-12-09T01:59:00 | suspended | primary-licensin-28 |
| 3 | b_VB-EC-6 | Chelsey Clark | 2022-05-20T08:16:00 | revoked | adaptive-licensin-29 |
| 4 | 575219 | Elizabeth Woods | 2023-10-04T15:33:00 | active | distributed-licensin-30 |

The `authorised_representatives` table stores the licensed entities and individuals authorised to act on behalf of schemes and investors. Each row carries a surrogate `id`, a business `rep_id` (such as `ChIJB6C6kjhu5kcReaUZDxXueds` for Lisa Simmons), a human-readable `rep_name`, an `authorisation_date` timestamp, an `authorisation_status` (`active`, `suspended`, `revoked`), and a `licensing_entity` that names the regulator or licensing body. The surrogate `id` is the target of the `authorised_representative_id` foreign keys found in `managed_investment_schemes`, `investors`, and `remuneration_events`, making this table the convergence point for all authorisation relationships. Representative 4, Elizabeth Woods, holds `active` status and is licensed by `distributed-licensin-30`, while representative 3, Chelsey Clark, has a `revoked` status under `adaptive-licensin-29`.

**Table `financial_products`**

| product_id | product_type | issue_price | management_fee | risk_rating | managed_investment_scheme_id | product_disclosure_statement_id |
|---|---|---|---|---|---|---|
| PRO-2172 | unit | 30.51 | 0.85 | low | 1 | 1 |
| PRO-2179 | share | 12.72 | 12.72 | medium | 2 | 2 |
| PRO-2186 | bond | 43.48 | 4.59 | high | 3 | 3 |
| PRO-2193 | derivative | 22.35 | 3.75 | low | 4 | 4 |

Financial products are the tradable instruments issued within schemes. The `financial_products` table uses `product_id` as its primary key — values like `PRO-2172` and `PRO-2179` — and classifies each product by `product_type` (`unit`, `share`, `bond`, `derivative`). Pricing and risk attributes include `issue_price` (e.g., `30.51` for the unit product), `management_fee` (e.g., `0.85`), and `risk_rating` (`low`, `medium`, `high`). Two foreign keys anchor the product to its parent scheme and its governing disclosure document: `managed_investment_scheme_id` references `managed_investment_schemes.id`, and `product_disclosure_statement_id` references `product_disclosure_statements.id`. Product `PRO-2172` belongs to scheme 1 (`Integrated Framework A`) and is governed by disclosure statement 1, while product `PRO-2186` (a bond) is tied to scheme 3 (`Pilot Programme`) and statement 3.

**Table `product_disclosure_statements`**

| id | pds_id | issue_date | version_number | regulatory_status | document_url | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01T13:51:00 | 16 | current | https://www.nature.com/articles/nphoton.2012.84 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2087758 | 2024-07-12T20:08:00 | 27 | superseded | https://bugs.launchpad.net/nova/+bug/1246276 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 | 38 | pending | http://eol.org/pages/333309/overview | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 7441146 | 2022-05-07T10:42:00 | 49 | current | https://ecocyc.org/gene?orgid=ECOLI&id=G7564 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `product_disclosure_statements` table holds the regulatory disclosure documents associated with financial products. Each row has a surrogate `id`, a business `pds_id` (which may be numeric like `9125623` or UUID-formatted like `5f8fcc36-8fcd-11eb-924d-9cd76263cbd0`), an `issue_date`, a `version_number` (ranging from 16 to 49 in the sample data), a `regulatory_status` (`current`, `superseded`, `pending`), a `document_url` pointing to the hosted PDF or HTML, and `created_at` / `updated_at` timestamps for audit tracking. Statement 1, issued on `2023-02-01` with version 16 and `current` status, is linked to product `PRO-2172` via the `product_disclosure_statement_id` foreign key in `financial_products`.

**Table `investors`**

| id | investor_id | investor_name | registration_date | account_status | total_investment | authorised_representative_id |
|---|---|---|---|---|---|---|
| 1 | 39800621 | Adaptive Framework | 2023-06-19T17:27:00 | active | 16.70 | 1 |
| 2 | 10238263 | Primary Protocol | 2024-11-03T00:44:00 | closed | 21.40 | 2 |
| 3 | Catatan | Composite Programme D | 2025-04-14T07:01:00 | pending | 26.10 | 3 |
| 4 | 4447007 | Compact Standard | 2022-09-25T14:18:00 | active | 30.80 | 4 |

Investors are the capital providers in the ecosystem. The `investors` table stores each investor with a surrogate `id`, a business `investor_id` (such as `39800621` or the string `Catatan`), an `investor_name` (e.g., `Adaptive Framework`), a `registration_date`, an `account_status` (`active`, `closed`, `pending`), a `total_investment` amount (ranging from `16.70` to `30.80`), and an `authorised_representative_id` foreign key. The authorisation link mirrors the scheme-level relationship: investor 1 (`Adaptive Framework`) is associated with representative 1 (Lisa Simmons), investor 2 (`Primary Protocol`) with representative 2 (Valuan Torpedo), and so forth. This column enables queries that trace which representative services which investors.

**Table `remuneration_events`**

| remuneration_event_id | event_id | event_date | amount | fee_type | currency | authorised_representative_id | investor_id |
|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 13.49 | upfront | seasonal-currency-71 | 1 | 1 |
| 2 | 168535 | 2022-09-26T22:38:00 | 25.47 | ongoing | regional-currency-72 | 2 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 19.72 | trail | legacy-currency-73 | 3 | 3 |
| 4 | 1186089 | 2024-07-21T12:12:00 | 12.74 | upfront | compact-currency-74 | 4 | 4 |

Remuneration events record the fees paid to authorised representatives for their services. The table uses `remuneration_event_id` as its primary key and stores an `event_id` (which may be numeric or UUID-formatted), an `event_date`, an `amount` (e.g., `13.49`, `25.47`), a `fee_type` (`upfront`, `ongoing`, `trail`), a `currency` (e.g., `seasonal-currency-71`), and two foreign keys: `authorised_representative_id` linking to the receiving representative and `investor_id` linking to the investor whose account generated the fee. Event 1 is an `upfront` fee of `13.49` paid to representative 1 for investor 1, while event 3 is a `trail` fee of `19.72` paid to representative 3 for investor 3. This table is the transactional core that connects representatives, investors, and the financial flows between them.

The base tables above capture one-to-many relationships directly through foreign key columns. However, the domain also contains many-to-many associations that require junction tables. The `schemes_investors` table resolves the relationship between investment schemes and investors, allowing an investor to participate in multiple schemes and a scheme to host multiple investors. Similarly, `representatives_schemes` links authorised representatives to the schemes they are authorised to manage, `representatives_products` links representatives to the financial products they are authorised to distribute, `statements_products` links disclosure statements to the products they govern, `statements_investors` links disclosure statements to the investors who have received or acknowledged them, and `investors_schemes` provides an additional junction layer between investors and schemes. These junction tables contain pairs of foreign keys that reference the surrogate primary keys of the participating base tables, enabling the database to represent complex many-to-many cardinality without data duplication.

**Table `schemes_investors`**

| managed_investment_scheme_id | investor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `representatives_schemes`**

| authorised_representative_id | managed_investment_scheme_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `representatives_products`**

| authorised_representative_id | product_id |
|---|---|
| 1 | PRO-2172 |
| 1 | PRO-2179 |
| 2 | PRO-2179 |
| 2 | PRO-2186 |
| 3 | PRO-2186 |
| 3 | PRO-2193 |
| 4 | PRO-2193 |
| 4 | PRO-2172 |

**Table `statements_products`**

| product_disclosure_statement_id | product_id |
|---|---|
| 1 | PRO-2172 |
| 1 | PRO-2179 |
| 2 | PRO-2179 |
| 2 | PRO-2186 |
| 3 | PRO-2186 |
| 3 | PRO-2193 |
| 4 | PRO-2193 |
| 4 | PRO-2172 |

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
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

With the base and junction tables in place, the view layer reconstructs domain-level facts by joining the normalised tables. Each view answers a specific analytical question by pulling together the relevant entities and their attributes into a denormalised result set.

**View `managed_investment_scheme_authorised_representative_view`**

```sql
CREATE VIEW managed_investment_scheme_authorised_representative_view AS
SELECT a.id, a.arsn, a.scheme_name, a.status, b.id AS representative_id, b.rep_id AS representative_rep_id, b.rep_name AS representative_rep_name
FROM managed_investment_schemes a JOIN authorised_representatives b ON a.authorised_representative_id = b.id;
```

| id | arsn | scheme_name | status | representative_id | representative_rep_id | representative_rep_name |
|---|---|---|---|---|---|---|
| 1 | extended-arsn-33 | Integrated Framework A | active | 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons |
| 2 | integrated-arsn-34 | Extended Protocol | deregistered | 2 | 10782192 | Valuan Torpedo |
| 3 | seasonal-arsn-35 | Pilot Programme | suspended | 3 | b_VB-EC-6 | Chelsey Clark |
| 4 | regional-arsn-36 | Baseline Standard D | active | 4 | 575219 | Elizabeth Woods |

The `managed_investment_scheme_authorised_representative_view` joins `managed_investment_schemes` with `authorised_representatives` on the `authorised_representative_id` foreign key, producing a flat record that pairs each scheme with its authorised representative. This view answers the question: "Which representative is authorised for each scheme?" A row from this view would show scheme 1 (`Integrated Framework A`, ARSN `extended-arsn-33`, status `active`) alongside representative 1 (Lisa Simmons, `ChIJB6C6kjhu5kcReaUZDxXueds`, status `active`, licensed by `composite-licensin-27`). The view is the foundation for compliance reporting that requires scheme-level authorisation details.

**View `managed_investment_scheme_investor_detail_view`**

```sql
CREATE VIEW managed_investment_scheme_investor_detail_view AS
SELECT a.id, a.arsn, a.scheme_name, b.id AS investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM managed_investment_schemes a
  JOIN schemes_investors j ON j.managed_investment_scheme_id = a.id
  JOIN investors b ON b.id = j.investor_id;
```

| id | arsn | scheme_name | investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|
| 1 | extended-arsn-33 | Integrated Framework A | 1 | 39800621 | Adaptive Framework |
| 1 | extended-arsn-33 | Integrated Framework A | 2 | 10238263 | Primary Protocol |
| 2 | integrated-arsn-34 | Extended Protocol | 2 | 10238263 | Primary Protocol |
| 2 | integrated-arsn-34 | Extended Protocol | 3 | Catatan | Composite Programme D |
| 3 | seasonal-arsn-35 | Pilot Programme | 3 | Catatan | Composite Programme D |
| 3 | seasonal-arsn-35 | Pilot Programme | 4 | 4447007 | Compact Standard |
| 4 | regional-arsn-36 | Baseline Standard D | 4 | 4447007 | Compact Standard |
| 4 | regional-arsn-36 | Baseline Standard D | 1 | 39800621 | Adaptive Framework |

The `managed_investment_scheme_investor_detail_view` joins `managed_investment_schemes` with `investors` through the junction tables (`schemes_investors` or `investors_schemes`), producing a denormalised record that shows which investors participate in which schemes. This view answers: "Which investors are invested in which schemes, and what are their account details?" A representative row would pair scheme 1 (`Integrated Framework A`) with investor 1 (`Adaptive Framework`, `active` status, total investment `16.70`), revealing the direct investor-scheme relationship with full account context.

**View `authorised_representative_managed_investment_scheme_detail_view`**

```sql
CREATE VIEW authorised_representative_managed_investment_scheme_detail_view AS
SELECT a.id, a.rep_id, a.rep_name, b.id AS scheme_id, b.arsn AS scheme_arsn, b.scheme_name AS scheme_scheme_name
FROM authorised_representatives a
  JOIN representatives_schemes j ON j.authorised_representative_id = a.id
  JOIN managed_investment_schemes b ON b.id = j.managed_investment_scheme_id;
```

| id | rep_id | rep_name | scheme_id | scheme_arsn | scheme_scheme_name |
|---|---|---|---|---|---|
| 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons | 1 | extended-arsn-33 | Integrated Framework A |
| 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons | 2 | integrated-arsn-34 | Extended Protocol |
| 2 | 10782192 | Valuan Torpedo | 2 | integrated-arsn-34 | Extended Protocol |
| 2 | 10782192 | Valuan Torpedo | 3 | seasonal-arsn-35 | Pilot Programme |
| 3 | b_VB-EC-6 | Chelsey Clark | 3 | seasonal-arsn-35 | Pilot Programme |
| 3 | b_VB-EC-6 | Chelsey Clark | 4 | regional-arsn-36 | Baseline Standard D |
| 4 | 575219 | Elizabeth Woods | 4 | regional-arsn-36 | Baseline Standard D |
| 4 | 575219 | Elizabeth Woods | 1 | extended-arsn-33 | Integrated Framework A |

The `authorised_representative_managed_investment_scheme_detail_view` is the inverse of the scheme-to-representative view: it starts from `authorised_representatives` and joins to `managed_investment_schemes`, answering "Which schemes does each representative authorise?" A row would show representative 4 (Elizabeth Woods, `active`, licensed by `distributed-licensin-30`) alongside scheme 4 (`Baseline Standard D`, ARSN `regional-arsn-36`, status `active`, listed). This perspective is useful for representative-level portfolio reporting.

**View `authorised_representative_financial_product_detail_view`**

```sql
CREATE VIEW authorised_representative_financial_product_detail_view AS
SELECT a.id, a.rep_id, a.rep_name, b.product_id AS product_product_id, b.product_type AS product_product_type, b.issue_price AS product_issue_price
FROM authorised_representatives a
  JOIN representatives_products j ON j.authorised_representative_id = a.id
  JOIN financial_products b ON b.product_id = j.product_id;
```

| id | rep_id | rep_name | product_product_id | product_product_type | product_issue_price |
|---|---|---|---|---|---|
| 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons | PRO-2172 | unit | 30.51 |
| 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons | PRO-2179 | share | 12.72 |
| 2 | 10782192 | Valuan Torpedo | PRO-2179 | share | 12.72 |
| 2 | 10782192 | Valuan Torpedo | PRO-2186 | bond | 43.48 |
| 3 | b_VB-EC-6 | Chelsey Clark | PRO-2186 | bond | 43.48 |
| 3 | b_VB-EC-6 | Chelsey Clark | PRO-2193 | derivative | 22.35 |
| 4 | 575219 | Elizabeth Woods | PRO-2193 | derivative | 22.35 |
| 4 | 575219 | Elizabeth Woods | PRO-2172 | unit | 30.51 |

The `authorised_representative_financial_product_detail_view` chains `authorised_representatives` through `representatives_products` to `financial_products`, answering "Which financial products is each representative authorised to distribute?" A row would pair representative 1 (Lisa Simmons) with product `PRO-2172` (a `unit` product, issue price `30.51`, `low` risk rating) from scheme 1. This view supports product-level compliance and distribution audits.

**View `financial_product_managed_investment_scheme_view`**

```sql
CREATE VIEW financial_product_managed_investment_scheme_view AS
SELECT a.product_id, a.product_type, a.issue_price, a.management_fee, b.id AS scheme_id, b.arsn AS scheme_arsn, b.scheme_name AS scheme_scheme_name
FROM financial_products a JOIN managed_investment_schemes b ON a.managed_investment_scheme_id = b.id;
```

| product_id | product_type | issue_price | management_fee | scheme_id | scheme_arsn | scheme_scheme_name |
|---|---|---|---|---|---|---|
| PRO-2172 | unit | 30.51 | 0.85 | 1 | extended-arsn-33 | Integrated Framework A |
| PRO-2179 | share | 12.72 | 12.72 | 2 | integrated-arsn-34 | Extended Protocol |
| PRO-2186 | bond | 43.48 | 4.59 | 3 | seasonal-arsn-35 | Pilot Programme |
| PRO-2193 | derivative | 22.35 | 3.75 | 4 | regional-arsn-36 | Baseline Standard D |

The `financial_product_managed_investment_scheme_view` joins `financial_products` with `managed_investment_schemes` on `managed_investment_scheme_id`, answering "Which scheme issues each financial product?" A row would show product `PRO-2186` (a `bond`, issue price `43.48`, `high` risk) issued by scheme 3 (`Pilot Programme`, ARSN `seasonal-arsn-35`, status `suspended`). This view is essential for product-scheme traceability and risk aggregation at the scheme level.

**View `financial_product_product_disclosure_statement_view`**

```sql
CREATE VIEW financial_product_product_disclosure_statement_view AS
SELECT a.product_id, a.product_type, a.issue_price, a.management_fee, b.id AS statement_id, b.pds_id AS statement_pds_id, b.issue_date AS statement_issue_date
FROM financial_products a JOIN product_disclosure_statements b ON a.product_disclosure_statement_id = b.id;
```

| product_id | product_type | issue_price | management_fee | statement_id | statement_pds_id | statement_issue_date |
|---|---|---|---|---|---|---|
| PRO-2172 | unit | 30.51 | 0.85 | 1 | 9125623 | 2023-02-01T13:51:00 |
| PRO-2179 | share | 12.72 | 12.72 | 2 | 2087758 | 2024-07-12T20:08:00 |
| PRO-2186 | bond | 43.48 | 4.59 | 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 |
| PRO-2193 | derivative | 22.35 | 3.75 | 4 | 7441146 | 2022-05-07T10:42:00 |

The `financial_product_product_disclosure_statement_view` joins `financial_products` with `product_disclosure_statements` on `product_disclosure_statement_id`, answering "Which disclosure statement governs each product?" A row would pair product `PRO-2179` (a `share`, issue price `12.72`, `medium` risk) with statement 2 (pds_id `2087758`, version 27, `superseded` status, issued `2024-07-12`). This view is critical for regulatory compliance checks that verify products have current, valid disclosure documents.

**View `product_disclosure_statement_financial_product_detail_view`**

```sql
CREATE VIEW product_disclosure_statement_financial_product_detail_view AS
SELECT a.id, a.pds_id, a.issue_date, b.product_id AS product_product_id, b.product_type AS product_product_type, b.issue_price AS product_issue_price
FROM product_disclosure_statements a
  JOIN statements_products j ON j.product_disclosure_statement_id = a.id
  JOIN financial_products b ON b.product_id = j.product_id;
```

| id | pds_id | issue_date | product_product_id | product_product_type | product_issue_price |
|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01T13:51:00 | PRO-2172 | unit | 30.51 |
| 1 | 9125623 | 2023-02-01T13:51:00 | PRO-2179 | share | 12.72 |
| 2 | 2087758 | 2024-07-12T20:08:00 | PRO-2179 | share | 12.72 |
| 2 | 2087758 | 2024-07-12T20:08:00 | PRO-2186 | bond | 43.48 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 | PRO-2186 | bond | 43.48 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 | PRO-2193 | derivative | 22.35 |
| 4 | 7441146 | 2022-05-07T10:42:00 | PRO-2193 | derivative | 22.35 |
| 4 | 7441146 | 2022-05-07T10:42:00 | PRO-2172 | unit | 30.51 |

The `product_disclosure_statement_financial_product_detail_view` is the inverse of the previous view: it starts from `product_disclosure_statements` and joins to `financial_products`, answering "Which products are governed by each disclosure statement?" A row would show statement 1 (pds_id `9125623`, version 16, `current`, URL `https://www.nature.com/articles/nphoton.2012.84`) governing product `PRO-2172` (a `unit` product, `low` risk). This perspective supports document-centric audits.

**View `product_disclosure_statement_investor_detail_view`**

```sql
CREATE VIEW product_disclosure_statement_investor_detail_view AS
SELECT a.id, a.pds_id, a.issue_date, b.id AS investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM product_disclosure_statements a
  JOIN statements_investors j ON j.product_disclosure_statement_id = a.id
  JOIN investors b ON b.id = j.investor_id;
```

| id | pds_id | issue_date | investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01T13:51:00 | 1 | 39800621 | Adaptive Framework |
| 1 | 9125623 | 2023-02-01T13:51:00 | 2 | 10238263 | Primary Protocol |
| 2 | 2087758 | 2024-07-12T20:08:00 | 2 | 10238263 | Primary Protocol |
| 2 | 2087758 | 2024-07-12T20:08:00 | 3 | Catatan | Composite Programme D |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 | 3 | Catatan | Composite Programme D |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 | 4 | 4447007 | Compact Standard |
| 4 | 7441146 | 2022-05-07T10:42:00 | 4 | 4447007 | Compact Standard |
| 4 | 7441146 | 2022-05-07T10:42:00 | 1 | 39800621 | Adaptive Framework |

The `product_disclosure_statement_investor_detail_view` joins `product_disclosure_statements` with `investors` through the `statements_investors` junction table, answering "Which investors have received or acknowledged each disclosure statement?" A row would pair statement 3 (pds_id `5f8fcc36-8fcd-11eb-924d-9cd76263cbd0`, version 38, `pending`) with investor 3 (`Catatan`, `Composite Programme D`, `pending` status). This view supports investor onboarding and disclosure acknowledgment tracking.

**View `investor_managed_investment_scheme_detail_view`**

```sql
CREATE VIEW investor_managed_investment_scheme_detail_view AS
SELECT a.id, a.investor_id, a.investor_name, b.id AS scheme_id, b.arsn AS scheme_arsn, b.scheme_name AS scheme_scheme_name
FROM investors a
  JOIN investors_schemes j ON j.investor_id = a.id
  JOIN managed_investment_schemes b ON b.id = j.managed_investment_scheme_id;
```

| id | investor_id | investor_name | scheme_id | scheme_arsn | scheme_scheme_name |
|---|---|---|---|---|---|
| 1 | 39800621 | Adaptive Framework | 1 | extended-arsn-33 | Integrated Framework A |
| 1 | 39800621 | Adaptive Framework | 2 | integrated-arsn-34 | Extended Protocol |
| 2 | 10238263 | Primary Protocol | 2 | integrated-arsn-34 | Extended Protocol |
| 2 | 10238263 | Primary Protocol | 3 | seasonal-arsn-35 | Pilot Programme |
| 3 | Catatan | Composite Programme D | 3 | seasonal-arsn-35 | Pilot Programme |
| 3 | Catatan | Composite Programme D | 4 | regional-arsn-36 | Baseline Standard D |
| 4 | 4447007 | Compact Standard | 4 | regional-arsn-36 | Baseline Standard D |
| 4 | 4447007 | Compact Standard | 1 | extended-arsn-33 | Integrated Framework A |

The `investor_managed_investment_scheme_detail_view` joins `investors` with `managed_investment_schemes` through the investor-scheme junction tables, answering "Which schemes does each investor participate in?" A row would show investor 4 (`Compact Standard`, `active`, total investment `30.80`) participating in scheme 4 (`Baseline Standard D`, ARSN `regional-arsn-36`, status `active`, listed). This view supports investor portfolio aggregation and concentration risk analysis.

**View `investor_authorised_representative_view`**

```sql
CREATE VIEW investor_authorised_representative_view AS
SELECT a.id, a.investor_id, a.investor_name, a.registration_date, b.id AS representative_id, b.rep_id AS representative_rep_id, b.rep_name AS representative_rep_name
FROM investors a JOIN authorised_representatives b ON a.authorised_representative_id = b.id;
```

| id | investor_id | investor_name | registration_date | representative_id | representative_rep_id | representative_rep_name |
|---|---|---|---|---|---|---|
| 1 | 39800621 | Adaptive Framework | 2023-06-19T17:27:00 | 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons |
| 2 | 10238263 | Primary Protocol | 2024-11-03T00:44:00 | 2 | 10782192 | Valuan Torpedo |
| 3 | Catatan | Composite Programme D | 2025-04-14T07:01:00 | 3 | b_VB-EC-6 | Chelsey Clark |
| 4 | 4447007 | Compact Standard | 2022-09-25T14:18:00 | 4 | 575219 | Elizabeth Woods |

The `investor_authorised_representative_view` joins `investors` with `authorised_representatives` on the `authorised_representative_id` foreign key, answering "Which representative services each investor?" A row would pair investor 2 (`Primary Protocol`, `closed` status, total investment `21.40`) with representative 2 (Valuan Torpedo, `suspended` status, licensed by `primary-licensin-28`). This view is useful for identifying investors whose representatives have lost authorisation status.

**View `remuneration_event_authorised_representative_view`**

```sql
CREATE VIEW remuneration_event_authorised_representative_view AS
SELECT a.remuneration_event_id, a.event_id, a.event_date, a.amount, b.id AS representative_id, b.rep_id AS representative_rep_id, b.rep_name AS representative_rep_name
FROM remuneration_events a JOIN authorised_representatives b ON a.authorised_representative_id = b.id;
```

| remuneration_event_id | event_id | event_date | amount | representative_id | representative_rep_id | representative_rep_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 13.49 | 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons |
| 2 | 168535 | 2022-09-26T22:38:00 | 25.47 | 2 | 10782192 | Valuan Torpedo |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 19.72 | 3 | b_VB-EC-6 | Chelsey Clark |
| 4 | 1186089 | 2024-07-21T12:12:00 | 12.74 | 4 | 575219 | Elizabeth Woods |

The `remuneration_event_authorised_representative_view` joins `remuneration_events` with `authorised_representatives` on `authorised_representative_id`, answering "Which representative received each remuneration event and what were the fee details?" A row would show event 2 (event_id `168535`, date `2022-09-26`, amount `25.47`, `ongoing` fee type, `regional-currency-72`) paid to representative 2 (Valuan Torpedo, `suspended`). This view supports fee reconciliation and representative compensation analysis.

**View `remuneration_event_investor_view`**

```sql
CREATE VIEW remuneration_event_investor_view AS
SELECT a.remuneration_event_id, a.event_id, a.event_date, a.amount, b.id AS investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM remuneration_events a JOIN investors b ON a.investor_id = b.id;
```

| remuneration_event_id | event_id | event_date | amount | investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 13.49 | 1 | 39800621 | Adaptive Framework |
| 2 | 168535 | 2022-09-26T22:38:00 | 25.47 | 2 | 10238263 | Primary Protocol |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 19.72 | 3 | Catatan | Composite Programme D |
| 4 | 1186089 | 2024-07-21T12:12:00 | 12.74 | 4 | 4447007 | Compact Standard |

The `remuneration_event_investor_view` joins `remuneration_events` with `investors` on `investor_id`, answering "Which investor account generated each remuneration event?" A row would pair event 4 (event_id `1186089`, date `2024-07-21`, amount `12.74`, `upfront` fee type, `compact-currency-74`) with investor 4 (`Compact Standard`, `active`, total investment `30.80`). This view supports investor-level fee attribution and cost analysis.

The schema design reflects a disciplined normalisation strategy: base tables store atomic facts with surrogate keys, foreign keys encode one-to-many relationships directly, and junction tables resolve many-to-many associations. The view layer then reconstructs the domain's relational fabric by joining these normalised components, each view answering a specific compliance, reporting, or analytical question. The result is a schema that is both storage-efficient — avoiding redundancy through proper normalisation — and query-accessible — providing pre-joined views that surface domain facts without requiring analysts to construct complex join paths manually. The fictional entities and values throughout the data serve as concrete anchors for understanding how the model maps to real-world managed investment operations.