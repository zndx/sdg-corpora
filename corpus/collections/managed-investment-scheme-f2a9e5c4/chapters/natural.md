Managed investment schemes form the backbone of regulated financial services, connecting authorised representatives, investors, and financial products through a structured ecosystem of disclosure, remuneration, and compliance. Each scheme carries a unique Australian Registered Scheme Number (ARSN) and operates under the oversight of a responsible entity, while its authorised representative manages day-to-day activities including product distribution and investor servicing. Financial products issued within these schemes carry distinct characteristics—unit, share, bond, or derivative classifications—each with associated pricing, fees, and risk ratings documented in product disclosure statements. Investors participate through these products, generating remuneration events that track the financial flows between representatives and the investors they serve. The integrity of this ecosystem depends on clear record-keeping across all entities and their interrelationships, from the initial authorisation of a representative through to the ongoing disclosure and compensation mechanisms that govern the scheme's operation.

## The Managed Investment Scheme

The managed investment scheme is the central organisational unit in this domain. Each scheme is identified by a unique internal record and an Australian Registered Scheme Number that serves as its regulatory identifier. Schemes exist in one of several operational states, and their listing status determines whether their products trade on a public exchange.

**Table `managed_investment_schemes`**

| id | arsn | scheme_name | status | listing_status | responsible_entity | authorised_representative_id |
|---|---|---|---|---|---|---|
| 1 | extended-arsn-33 | Integrated Framework A | active | unlisted | compact-responsi-98 | 1 |
| 2 | integrated-arsn-34 | Extended Protocol | deregistered | listed | composite-responsi-99 | 2 |
| 3 | seasonal-arsn-35 | Pilot Programme | suspended | unlisted | primary-responsi-100 | 3 |
| 4 | regional-arsn-36 | Baseline Standard D | active | listed | adaptive-responsi-101 | 4 |

The scheme named Integrated Framework A, carrying ARSN extended-arsn-33, operates in an active, unlisted state under the responsible entity compact-responsi-98. Its authorised representative is identified by the internal key 1. In contrast, the scheme Extended Protocol (integrated-arsn-34) holds a deregistered status and is listed, managed by the responsible entity composite-responsi-99 with representative 2. The Pilot Programme (seasonal-arsn-35) is suspended and unlisted, overseen by primary-responsi-100 and representative 3. Finally, Baseline Standard D (regional-arsn-36) remains active and listed under adaptive-responsi-101 with representative 4. These four schemes illustrate the range of operational states and listing configurations that practitioners must track when monitoring compliance and product availability.

## Authorised Representatives

Authorised representatives are the individuals or entities empowered to manage and distribute products within the schemes. Each representative holds a unique identifier, a name, an authorisation date, and a current authorisation status that reflects their standing with the licensing entity.

**Table `authorised_representatives`**

| id | rep_id | rep_name | authorisation_date | authorisation_status | licensing_entity |
|---|---|---|---|---|---|
| 1 | ChIJB6C6kjhu5kcReaUZDxXueds | Lisa Simmons | 2024-07-25T18:42:00 | active | composite-licensin-27 |
| 2 | 10782192 | Valuan Torpedo | 2025-12-09T01:59:00 | suspended | primary-licensin-28 |
| 3 | b_VB-EC-6 | Chelsey Clark | 2022-05-20T08:16:00 | revoked | adaptive-licensin-29 |
| 4 | 575219 | Elizabeth Woods | 2023-10-04T15:33:00 | active | distributed-licensin-30 |

Lisa Simmons (ChIJB6C6kjhu5kcReaUZDxXueds) was authorised on 2024-07-25 and maintains an active status under composite-licensin-27. Valuan Torpedo (10782192), authorised more recently on 2025-12-09, currently holds a suspended status under primary-licensin-28. Chelsey Clark (b_VB-EC-6) was authorised earliest, on 2022-05-20, but has since had their authorisation revoked by adaptive-licensin-29. Elizabeth Woods (575219), authorised on 2023-10-04, remains active under distributed-licensin-30. The authorisation statuses—active, suspended, and revoked—directly affect which schemes and products a representative may legally manage, making this field critical for compliance checks.

## Financial Products and Disclosure Statements

Financial products are the investment vehicles issued within managed investment schemes. Each product carries a type classification, an issue price, a management fee expressed as a percentage, and a risk rating. Products are linked to both the scheme within which they operate and the product disclosure statement that governs their disclosure obligations.

**Table `financial_products`**

| product_id | product_type | issue_price | management_fee | risk_rating | managed_investment_scheme_id | product_disclosure_statement_id |
|---|---|---|---|---|---|---|
| PRO-2172 | unit | 30.51 | 0.85 | low | 1 | 1 |
| PRO-2179 | share | 12.72 | 12.72 | medium | 2 | 2 |
| PRO-2186 | bond | 43.48 | 4.59 | high | 3 | 3 |
| PRO-2193 | derivative | 22.35 | 3.75 | low | 4 | 4 |

Product PRO-2172 is a unit-type product with an issue price of 30.51, a management fee of 0.85 percent, and a low risk rating, operating within scheme 1. Product PRO-2179 is a share with an issue price of 12.72, a notably high management fee of 12.72 percent, a medium risk rating, and operates within scheme 2. Product PRO-2186 is a bond priced at 43.48 with a management fee of 4.59 percent and a high risk rating, associated with scheme 3. Product PRO-2193 is a derivative with an issue price of 22.35, a management fee of 3.75 percent, and a low risk rating, linked to scheme 4. The wide variation in management fees—from 0.85 to 12.72 percent—underscores the importance of fee transparency in product disclosure.

Product disclosure statements formalise the regulatory documentation for each financial product. Each statement carries a unique identifier, an issue date, a version number, and a regulatory status indicating whether it is current, superseded, or pending.

**Table `product_disclosure_statements`**

| id | pds_id | issue_date | version_number | regulatory_status | document_url | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 9125623 | 2023-02-01T13:51:00 | 16 | current | https://www.nature.com/articles/nphoton.2012.84 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2087758 | 2024-07-12T20:08:00 | 27 | superseded | https://bugs.launchpad.net/nova/+bug/1246276 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23T03:25:00 | 38 | pending | http://eol.org/pages/333309/overview | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 7441146 | 2022-05-07T10:42:00 | 49 | current | https://ecocyc.org/gene?orgid=ECOLI&id=G7564 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Statement 9125623 was issued on 2023-02-01 at version 16 and holds a current regulatory status, with its document hosted at a nature.com URL. Statement 2087758, issued on 2024-07-12 at version 27, carries a superseded status and is archived at a Launchpad bug tracker URL. Statement 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0, issued on 2025-12-23 at version 38, is in a pending state and hosted at an Encyclopedia of Life page. Statement 7441146, issued on 2022-05-07 at version 49, is current and hosted at an EcoCyc gene reference URL. The version numbers and regulatory statuses enable practitioners to determine which disclosure document governs a given product at any point in time.

## Investors and Their Relationships

Investors are the participants who allocate capital through the managed investment scheme ecosystem. Each investor record includes a unique identifier, a name, a registration date, an account status, and a total investment amount. Investors are associated with an authorised representative who services their account.

**Table `investors`**

| id | investor_id | investor_name | registration_date | account_status | total_investment | authorised_representative_id |
|---|---|---|---|---|---|---|
| 1 | 39800621 | Adaptive Framework | 2023-06-19T17:27:00 | active | 16.70 | 1 |
| 2 | 10238263 | Primary Protocol | 2024-11-03T00:44:00 | closed | 21.40 | 2 |
| 3 | Catatan | Composite Programme D | 2025-04-14T07:01:00 | pending | 26.10 | 3 |
| 4 | 4447007 | Compact Standard | 2022-09-25T14:18:00 | active | 30.80 | 4 |

Adaptive Framework (39800621) registered on 2023-06-19 with an active account status and a total investment of 16.70, serviced by representative 1. Primary Protocol (10238263) registered on 2024-11-03 with a closed account status and a total investment of 21.40, serviced by representative 2. Catatan, identified as Composite Programme D, registered on 2025-04-14 with a pending account status and a total investment of 26.10, serviced by representative 3. Compact Standard (4447007) registered on 2022-09-25 with an active account status and the highest total investment of 30.80, serviced by representative 4. The account statuses—active, closed, and pending—determine whether an investor can transact within the scheme.

## Remuneration Events

Remuneration events capture the financial compensation flows between authorised representatives and investors. Each event records an event date, an amount, a fee type (upfront, ongoing, or trail), a currency, and the identifiers of the associated representative and investor.

**Table `remuneration_events`**

| remuneration_event_id | event_id | event_date | amount | fee_type | currency | authorised_representative_id | investor_id |
|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 13.49 | upfront | seasonal-currency-71 | 1 | 1 |
| 2 | 168535 | 2022-09-26T22:38:00 | 25.47 | ongoing | regional-currency-72 | 2 | 2 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 19.72 | trail | legacy-currency-73 | 3 | 3 |
| 4 | 1186089 | 2024-07-21T12:12:00 | 12.74 | upfront | compact-currency-74 | 4 | 4 |

Event 2002007020060 occurred on 2025-04-15 with an amount of 13.49 in the upfront fee type, denominated in seasonal-currency-71, linking representative 1 to investor 1. Event 168535 occurred on 2022-09-26 with an amount of 25.47 in the ongoing fee type, in regional-currency-72, linking representative 2 to investor 2. Event ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 occurred on 2023-02-10 with an amount of 19.72 in the trail fee type, in legacy-currency-73, linking representative 3 to investor 3. Event 1186089 occurred on 2024-07-21 with an amount of 12.74 in the upfront fee type, in compact-currency-74, linking representative 4 to investor 4. The fee types—upfront, ongoing, and trail—reflect different compensation structures that representatives may employ when servicing investors.

## Inter-Entity Relationships

The domain relies on several relationship tables that establish the connections between core entities. The schemes_investors table records which investors participate in which schemes, forming the primary link between capital providers and investment vehicles. The representatives_schemes table maps each authorised representative to the schemes they manage, ensuring that only authorised personnel oversee specific schemes. The representatives_products table connects representatives to the financial products they distribute, extending the authorisation scope beyond schemes to individual products.

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

The statements_products table links product disclosure statements to the financial products they govern, ensuring that every product has an associated disclosure document. The statements_investors table records which investors have received or been provided with specific disclosure statements, creating an audit trail for regulatory compliance. The investors_schemes table provides an additional mapping of investor-to-scheme participation, reinforcing the relationship captured in schemes_investors.

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

## View-Based Reporting

The domain provides a set of pre-joined views that consolidate information across multiple tables to answer specific operational questions. These views enable practitioners to query complex relationships without constructing multi-table joins manually.

The managed_investment_scheme_authorised_representative_view combines scheme-level data with representative details, answering which representative manages each scheme and what their current authorisation status is.

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

The managed_investment_scheme_investor_detail_view joins scheme information with investor records, revealing which investors participate in each scheme and their account statuses.

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

The authorised_representative_managed_investment_scheme_detail_view presents the reverse perspective, listing all schemes managed by a given representative along with the scheme's operational status and listing configuration.

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

The authorised_representative_financial_product_detail_view connects representatives to the financial products they distribute, including product type, pricing, and risk rating information.

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

The financial_product_managed_investment_scheme_view links each financial product to its parent scheme, providing the scheme name and ARSN alongside the product's issue price and management fee.

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

The financial_product_product_disclosure_statement_view joins products with their governing disclosure statements, showing the statement's issue date, version number, and regulatory status alongside the product's risk rating.

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

The product_disclosure_statement_financial_product_detail_view presents the disclosure statement as the primary entity, with all associated product details including product type, issue price, and management fee.

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

The product_disclosure_statement_investor_detail_view connects disclosure statements to investors, revealing which investors have been provided with specific disclosure documents and their account statuses.

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

The investor_managed_investment_scheme_detail_view presents the investor as the primary entity, with all associated scheme information including the scheme name, ARSN, and operational status.

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

The investor_authorised_representative_view links investors to their servicing authorised representatives, showing the representative's name, authorisation status, and licensing entity alongside the investor's total investment amount.

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

The remuneration_event_authorised_representative_view joins remuneration events with representative details, enabling analysis of compensation flows by representative, including the fee types and currencies involved.

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

The remuneration_event_investor_view joins remuneration events with investor details, allowing practitioners to track the total remuneration received from or paid to each investor across all events.

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

## Synthesis

The managed investment scheme ecosystem operates through a tightly interwoven set of records that track schemes, representatives, products, investors, and the financial flows between them. Each entity carries its own set of attributes—identifiers, statuses, dates, and monetary values—that together form a comprehensive picture of the regulatory and commercial landscape. The relationship tables and pre-joined views provide the connective tissue that allows practitioners to navigate this landscape efficiently, answering questions about which representative manages which scheme, which products carry which risk ratings, which investors hold which accounts, and what remuneration has been generated across the system. Understanding these relationships and the data they contain is essential for maintaining compliance, managing risk, and ensuring that all participants in the ecosystem operate within their authorised scope.