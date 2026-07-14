# The Architecture of Financial Services Oversight

The Australian financial services ecosystem operates through a layered regulatory framework where licensed entities, authorised representatives, investment schemes, and retail products intersect under the supervision of issuing authorities. At the core of this architecture sits the financial licence—a formal authorisation granted by a regulatory body that permits its holder to conduct designated financial activities. Each licence anchors a network of managed investment schemes, authorised representatives, and financial products, all of which must comply with disclosure obligations and risk-management standards. When disputes arise, complaint records are logged and escalated to external ombudsman bodies for independent resolution. This chapter documents the entities, relationships, and analytical views that together constitute the operational record of this domain.

## Licensed Entities and Investment Schemes

The foundation of the regulatory structure is the `financial_licences` table, which records every licence issued by a regulatory authority. Each licence carries a unique identifier, a licence number such as `LIC-2307`, the name of the licence holder—Stephanie Collins, Robert Watts, Cheryl Bradley, or William Nicholson—the issuing authority (for example, `extended-issuing-33` or `regional-issuing-36`), a status indicating whether the licence is `active`, `suspended`, or `cancelled`, and a compliance date marking the most recent regulatory review.

**Table `financial_licences`**

| id | licence_number | licence_holder | issuing_authority | status | compliance_date |
|---|---|---|---|---|---|
| 1000 | LIC-2307 | Stephanie Collins | extended-issuing-33 | active | 2022-05-02 |
| 1001 | LIC-2308 | Robert Watts | integrated-issuing-34 | suspended | 2023-10-13 |
| 1002 | LIC-2309 | Cheryl Bradley | seasonal-issuing-35 | cancelled | 2024-03-24 |
| 1003 | LIC-2310 | William Nicholson | regional-issuing-36 | active | 2025-08-08 |

Managed investment schemes are established under these licences and tracked in the `managed_investment_schemes` table. Each scheme carries a scheme identifier like `SCH-2216` and a descriptive name such as `Integrated Framework A` or `Pilot Programme`. The responsible entity—recorded as identifiers like `compact-responsi-98` or `adaptive-responsi-101`—is the party legally accountable for the scheme's administration. The `is_unlisted` flag distinguishes publicly listed schemes from private arrangements, while the `establishment_date` records when the scheme commenced operations. Every scheme is linked to exactly one financial licence through the `financial_licence_id` foreign key, ensuring that each scheme operates under a single authorised umbrella.

**Table `managed_investment_schemes`**

| managed_investment_scheme_id | scheme_identifier | scheme_name | responsible_entity | is_unlisted | establishment_date | financial_licence_id |
|---|---|---|---|---|---|---|
| 1000 | SCH-2216 | Integrated Framework A | compact-responsi-98 | false | 2024-07-11 | 1000 |
| 1001 | SCH-2217 | Extended Protocol | composite-responsi-99 | true | 2025-12-22 | 1001 |
| 1002 | SCH-2218 | Pilot Programme | primary-responsi-100 | false | 2022-05-06 | 1002 |
| 1003 | SCH-2219 | Baseline Standard D | adaptive-responsi-101 | true | 2023-10-17 | 1003 |

The view `v_managed_investment_scheme_financial_licence` joins these two tables to present each scheme alongside its governing licence. This view answers the question: which licence authorises which scheme, and what is the current regulatory standing of that licence? For instance, the scheme `SCH-2216` (Integrated Framework A) is governed by licence `LIC-2307` held by Stephanie Collins, which is currently `active`. By contrast, `SCH-2217` (Extended Protocol) is tied to licence `LIC-2308` held by Robert Watts, whose status is `suspended`—a detail that would trigger immediate compliance review.

The view `v_managed_investment_scheme_financial_product_detail` extends this linkage further by incorporating financial product information. It reveals not only which licence governs a scheme but also what products the scheme distributes. A row in this view might show that `SCH-2218` (Pilot Programme) offers a `bond` product (`PRO-2687`) with a `high` risk rating and an issue price of `43.48`, all under the authority of licence `LIC-2309` held by Cheryl Bradley, whose licence is `cancelled`.

## Authorised Representatives and Their Scope

Authorised representatives are individuals or entities empowered to act on behalf of a licence holder. The `authorised_representatives` table records each representative's unique identifier (such as `2106720` or `6969429`, alongside codes like `developing-talent`), their name (Susan Levy, Debra Diaz, Stephanie Sutton, Robert Clark), the date they received authorisation, their remuneration rate (ranging from `14.45` to `21.80`), a contact email address, and the financial licence they serve.

**Table `authorised_representatives`**

| id | representative_id | representative_name | authorisation_date | remuneration_rate | contact_email | financial_licence_id |
|---|---|---|---|---|---|---|
| 1000 | 2106720 | Susan Levy | 2024-07-25 | 14.45 | Christopher Wilson | 1000 |
| 1001 | 6969429 | Debra Diaz | 2025-12-09 | 16.90 | Charles Larsen | 1001 |
| 1002 | developing-talent | Stephanie Sutton | 2022-05-20 | 19.35 | Mary Alvarez | 1002 |
| 1003 | 5917300 | Robert Clark | 2023-10-04 | 21.80 | April Snyder | 1003 |

The many-to-many relationships between licences and representatives are captured through the `licences_representatives` junction table, while `representatives_products` and `representatives_schemes` track which specific products and schemes each representative is authorised to advise on. The `products_representatives` table provides an alternative perspective on the same relationship, listing products alongside their authorised representatives.

The view `v_financial_licence_authorised_representative_detail` joins licences with their representatives, answering which individuals are authorised under each licence. A representative like Susan Levy (`2106720`) with a remuneration rate of `14.45` is shown alongside licence `LIC-2307` and its holder Stephanie Collins. The view `v_authorised_representative_financial_licence` presents the same relationship from the representative's perspective, anchoring each representative to their issuing licence.

The view `v_authorised_representative_financial_product_detail` reveals which financial products each representative is authorised to discuss. For example, a representative under licence `LIC-2308` might be linked to the `share` product `PRO-2681` with a `medium` risk rating. The view `v_authorised_representative_managed_investment_scheme_detail` similarly maps representatives to the schemes they service, enabling compliance officers to verify that every scheme has adequate authorised coverage.

## Financial Products and Disclosure Obligations

Financial products represent the investment vehicles offered to retail and institutional clients. The `financial_products` table records each product's type (`unit`, `share`, `bond`, or `derivative`), its product code (`PRO-2675`, `PRO-2681`, `PRO-2687`, `PRO-2693`), its issue price, minimum investment threshold, risk rating (`low`, `medium`, `high`, or `very_high`), the managed investment scheme it belongs to, and the product disclosure statement it references.

**Table `financial_products`**

| id | product_type | product_code | issue_price | minimum_investment | risk_rating | managed_investment_scheme_id | product_disclosure_statement_id |
|---|---|---|---|---|---|---|---|
| 1 | unit | PRO-2675 | 30.51 | 20.20 | low | 1000 | 1 |
| 2 | share | PRO-2681 | 12.72 | 23.40 | medium | 1001 | 2 |
| 3 | bond | PRO-2687 | 43.48 | 26.60 | high | 1002 | 3 |
| 4 | derivative | PRO-2693 | 22.35 | 29.80 | very_high | 1003 | 4 |

Every financial product must be accompanied by a product disclosure statement (PDS), recorded in the `product_disclosure_statements` table. Each PDS carries a unique identifier (such as `9125623` or the UUID `5f8fcc36-8fcd-11eb-924d-9cd76263cbd0`), an issue date, a validity period (`valid_until_date`), total fees charged (ranging from `906.39` to `8,263`), a categorisation of significant risks (e.g., `baseline-signific-19`, `pilot-signific-20`), and references to both the associated financial product and the governing financial licence.

**Table `product_disclosure_statements`**

| id | pds_id | issue_date | valid_until_date | total_fees | significant_risks | financial_product_id | financial_licence_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01 | 2024-07-19 | 8,258 | baseline-signific-19 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2087758 | 2024-07-12 | 2025-12-03 | 8,263 | pilot-signific-20 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 2022-05-14 | 1,740 | extended-signific-21 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 7441146 | 2022-05-07 | 2023-10-25 | 906.39 | integrated-signific-22 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The view `v_financial_product_product_disclosure_statement` joins products with their PDS documents, enabling auditors to verify that every product has a current, valid disclosure statement. A row might show that the `derivative` product `PRO-2693` (risk rating `very_high`, issue price `22.35`) is covered by PDS `7441146`, issued on `2022-05-07` with total fees of `906.39` and significant risks categorised as `integrated-signific-22`.

The view `v_product_disclosure_statement_financial_product` presents the same linkage from the PDS perspective, confirming which product each disclosure statement serves. The view `v_product_disclosure_statement_financial_licence` extends this by including the licence under which the product operates, allowing regulators to trace the full chain from disclosure document through product to licence holder.

The view `v_financial_product_managed_investment_scheme` connects products back to their parent schemes, answering which scheme distributes which product. For example, the `unit` product `PRO-2675` (issue price `30.51`, minimum investment `20.20`, risk rating `low`) is distributed by scheme `SCH-2216` (Integrated Framework A).

## Investor Records and Scheme Participation

Investors are the end participants in the financial ecosystem. The `investors` table records each investor's identifier (numeric IDs `1` through `4`, or names like `Adaptive Framework`, `Primary Protocol`, `Composite Programme D`, `Compact Standard`), their registration date, total amount invested (ranging from `16.20` to `22.80`), a contact phone number associated with a person (Joe Tsai, Stephanie Collins, Tasha Rodriguez, Walter Pratt), and a reference to their complaint record.

**Table `investors`**

| investor_id | investor_name | registration_date | total_invested | contact_phone | complaint_record_id |
|---|---|---|---|---|---|
| 1 | Adaptive Framework | 2023-06-19 | 16.20 | Joe Tsai | 1000 |
| 2 | Primary Protocol | 2024-11-03 | 18.40 | Stephanie Collins | 1001 |
| 3 | Composite Programme D | 2025-04-14 | 20.60 | Tasha Rodriguez | 1002 |
| 4 | Compact Standard | 2022-09-25 | 22.80 | Walter Pratt | 1003 |

The `investors_schemes` table records which schemes each investor participates in, while `statements_investors` links investors to the product disclosure statements they have acknowledged. The `investors_representatives` table captures which representatives have advised or served each investor.

The view `v_investor_managed_investment_scheme_detail` joins investors with the schemes they hold, providing a clear picture of portfolio composition. An investor such as `Adaptive Framework`, registered on `2023-06-19` with total invested of `16.20`, might be shown participating in scheme `SCH-2216` (Integrated Framework A). The view `v_investor_authorised_representative_detail` maps investors to the representatives who have advised them, enabling firms to track client-adviser relationships for compliance and suitability assessments.

The view `v_product_disclosure_statement_investor_detail` joins PDS documents with the investors who have received them, answering the critical compliance question: which investors have been provided with which disclosure statements? This view is essential for demonstrating that investors received adequate product information before committing capital.

## Complaint Management and Ombudsman Resolution

When investors experience disputes, the `complaint_records` table captures the details of each formal complaint. The table records the complaint identifier, the investor involved, the nature and severity of the complaint, the date it was lodged, its current status, and any resolution actions taken.

**Table `complaint_records`**

| id | complaint_id | lodged_date | status | resolution_date | escalated_to | investor_id | authorised_representative_id | external_ombudsman_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 8189480 | 2024-07-11T18:06:00 | pending | 2024-07-05 | Financial Ombudsman Service | 1 | 1000 | 1 |
| 1001 | 575197 | 2025-12-22T01:23:00 | acknowledged | 2025-12-16 | ASIC | 2 | 1001 | 2 |
| 1002 | 13862 | 2022-05-06T08:40:00 | resolved | 2022-05-27 | Financial Ombudsman Service | 3 | 1002 | 3 |
| 1003 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | 2023-10-17T15:57:00 | escalated | 2023-10-11 | ASIC | 4 | 1003 | 4 |

External ombudsman bodies provide independent dispute resolution. The `external_ombudsmans` table records each ombudsman organisation, its jurisdiction, contact details, and the categories of disputes it handles. The `ombudsmans_records` table links specific complaint records to the ombudsman body assigned to handle them.

The view `v_investor_complaint_record` joins investors with their complaint records, providing a complete picture of each investor's dispute history. A row might show that investor `Primary Protocol` has a complaint lodged on a specific date with a particular status and outcome. The view `v_complaint_record_investor` presents the same relationship from the complaint's perspective.

The view `v_complaint_record_authorised_representative` links complaints to the authorised representatives involved, enabling firms to identify patterns in adviser conduct. The view `v_complaint_record_external_ombudsman` connects complaints to the ombudsman bodies handling them, providing visibility into the external resolution process.

The view `v_external_ombudsman_complaint_record_detail` joins ombudsman organisations with their assigned complaint records, answering which ombudsman is handling which disputes and what the outcomes have been. This view is critical for regulatory reporting and for identifying systemic issues that may require intervention.

## Cross-Referential Analysis

The remaining junction tables—`schemes_products`, `licences_representatives`, `representatives_products`, `representatives_schemes`, `products_representatives`, `statements_investors`, `investors_schemes`, `investors_representatives`, and `ombudsmans_records`—provide the granular linkage layer that enables complex queries across the domain. These tables ensure that no entity exists in isolation: every scheme is tied to a licence, every product to a scheme and a disclosure statement, every representative to a licence and specific products, every investor to schemes and representatives, and every complaint to an ombudsman body.

The comprehensive views built on these relationships—such as `v_financial_product_authorised_representative_detail`, which connects products to the representatives authorised to discuss them, and `v_financial_licence_authorised_representative_detail`, which maps licences to their authorised representatives—serve as the primary analytical interfaces for compliance officers, auditors, and regulators. Each view answers a specific operational question by joining the appropriate tables and presenting the result in a single, queryable structure.

## Synthesis

The financial services domain is characterised by dense interdependencies: licences authorise schemes, schemes distribute products, products require disclosure statements, representatives act on behalf of licences, investors participate in schemes, and complaints trigger ombudsman review. The tables and views documented in this chapter capture every facet of these relationships, from the foundational licence record through to the final ombudsman resolution. Practitioners rely on these records to demonstrate regulatory compliance, assess risk exposure, manage client relationships, and resolve disputes. The integrity of the entire ecosystem depends on the accuracy and completeness of these records.

## Data appendix

**Table `external_ombudsmans`**

| external_ombudsman_id | ombudsman_name | contact_phone | contact_email | jurisdiction | established_date |
|---|---|---|---|---|---|
| 1 | Extended Framework | Joe Tsai | Christopher Wilson | regional-jurisdic-30 | 2024-03-27 |
| 2 | Pilot Protocol A | Stephanie Collins | Charles Larsen | legacy-jurisdic-31 | 2025-08-11 |
| 3 | Baseline Programme | Tasha Rodriguez | Mary Alvarez | compact-jurisdic-32 | 2022-01-22 |
| 4 | Distributed Standard | Walter Pratt | April Snyder | composite-jurisdic-33 | 2023-06-06 |

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
