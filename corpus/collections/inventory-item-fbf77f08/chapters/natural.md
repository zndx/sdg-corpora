## Supply Chain and Fulfillment Operations

Modern distribution organizations manage a complex web of interconnected processes: procuring and storing merchandise, coordinating outbound shipments, maintaining customer relationships, and measuring the impact of promotional initiatives. The data model described here captures these operations across seven core tables and nine analytical views, providing both transactional records and cross-domain perspectives. At its foundation, the system tracks individual inventory items through their lifecycle—from receipt and storage to allocation and dispatch—while simultaneously recording the logistics of their movement, the accounts they serve, and the campaigns that drive demand.

**Table `inventory_items`**

| id | sku | item_type | quantity_on_hand | unit_cost | location_code | status | shipment_record_id |
|---|---|---|---|---|---|---|---|
| 1 | SKU-2021 | diamond | 7 | 10.72 | 9736909 | in_stock | 1 |
| 2 | SKU-2025 | jewelry | 4 | 29.99 | 9125640 | reserved | 2 |
| 3 | SKU-2029 | antique_radio | 6 | 18.47 | 1450633 | shipped | 3 |
| 4 | SKU-2033 | diamond | 6 | 43.48 | 21005921 | damaged | 4 |

The inventory_items table serves as the primary product ledger, recording each distinct stock-keeping unit with its physical and financial attributes. Every row identifies an item by a human-readable SKU code such as SKU-2021 or SKU-2033, classifies it by item_type (diamond, jewelry, antique_radio), and maintains a running count of quantity_on_hand at a specific location_code. The unit_cost field anchors the financial dimension, ranging from 10.72 for a diamond item to 43.48 for another SKU-2033 diamond entry. The status column tracks the current disposition of each item—values observed include in_stock, reserved, shipped, and damaged—providing an immediate snapshot of availability. Notably, each inventory record carries a shipment_record_id foreign key, establishing a direct linkage to the logistics layer that governs outbound movement.

**Table `shipment_records`**

| shipment_record_id | tracking_number | shipment_date | carrier_name | total_weight | shipping_method | status | customer_account_id |
|---|---|---|---|---|---|---|---|
| 1 | TRA-2505 | 2023-10-02T21:51:00 | Integrated Assessment A | 1.48 | express | pending | 100 |
| 2 | TRA-2511 | 2024-03-13T04:08:00 | Extended Survey | 1.65 | standard | dispatched | 101 |
| 3 | TRA-2517 | 2025-08-24T11:25:00 | Pilot Corridor | 1.25 | overnight | delivered | 102 |
| 4 | TRA-2523 | 2022-01-08T18:42:00 | Baseline Series D | 0.6000001 | express | returned | 103 |

Outbound logistics are captured in the shipment_records table, which documents every dispatch event with operational precision. Each shipment receives a unique tracking_number such as TRA-2505 or TRA-2523, is timestamped with a shipment_date, and is assigned to a carrier_name like Integrated Assessment A or Pilot Corridor. The total_weight field quantifies the physical burden of each dispatch, while the shipping_method column distinguishes between express, standard, and overnight service tiers. The status field—pending, dispatched, delivered, or returned—reflects the current stage of the shipment lifecycle. Each shipment record is tied to a customer_account_id, creating the critical bridge between fulfillment operations and the customer base.

**Table `customer_accounts`**

| id | customer_i_d | company_name | contact_email | credit_limit | account_status | registration_date | shipment_record_id | marketing_campaign_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Collin Lopez | Feedback Rating | Christopher Wilson | 12.95 | active | 2023-06-19 | 1 | 1 |
| 101 | Sarah Villanueva | Virgin Group | Charles Larsen | 16.90 | suspended | 2024-11-03 | 2 | 2 |
| 102 | Norma Fisher | United Technologies | Mary Alvarez | 20.85 | archived | 2025-04-14 | 3 | 3 |
| 103 | Sandra Reese | Link Title | April Snyder | 24.80 | active | 2022-09-25 | 4 | 4 |

The customer_accounts table maintains the commercial relationships that drive demand. Each account is identified by an internal id (100 through 103 in the sample data) and a customer_i_d field that stores the account holder's name, such as Collin Lopez or Sarah Villanueva. The company_name column records the organizational entity—Feedback Rating, Virgin Group, United Technologies, Link Title—while contact_email provides the communication channel. Financial controls are enforced through the credit_limit field, which ranges from 12.95 to 24.80 in the observed data, and the account_status column tracks whether an account is active, suspended, or archived. Registration_date anchors the customer relationship in time, and the table includes both a shipment_record_id and a marketing_campaign_id foreign key, embedding each account within the broader operational and promotional context.

**Table `marketing_campaigns`**

| marketing_campaign_id | campaign_i_d | campaign_name | start_date | end_date | budget | channel | status | inventory_item_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CAM-2016 | Compact Framework | 2022-09-05 | 2022-09-01 | 35.45 | email | planned | 1 | 2025-01-01 00:14:00 |
| 2 | CAM-2022 | Legacy Protocol | 2023-02-16 | 2023-02-12 | 18.47 | web | active | 2 | 2025-02-06 03:14:00 |
| 3 | CAM-2028 | Regional Programme A | 2024-07-27 | 2024-07-23 | 26.25 | print | completed | 3 | 2025-03-11 06:14:00 |
| 4 | CAM-2034 | Seasonal Standard | 2025-12-11 | 2025-12-07 | 17.12 | social | cancelled | 4 | 2025-04-16 09:14:00 |

Promotional activity is governed by the marketing_campaigns table, which records each campaign's scope, timing, and financial parameters. Campaigns are identified by a marketing_campaign_id and a campaign_i_d code such as CAM-2016 or CAM-2034. The campaign_name field—Compact Framework, Legacy Protocol, Regional Programme A, Seasonal Standard—provides a descriptive label, while start_date and end_date define the active window. The budget column quantifies the financial allocation, ranging from 17.12 to 35.45, and the channel field specifies the distribution medium: email, web, print, or social. The status column tracks campaign lifecycle stages including planned, active, completed, and cancelled. Each campaign record carries an inventory_item_id foreign key, linking promotional effort directly to the merchandise being promoted.

**Table `database_records`**

| database_record_id | record_i_d | table_name | last_modified | modified_by | record_hash | is_duplicate | inventory_item_id | customer_account_id |
|---|---|---|---|---|---|---|---|---|
| 1 | REC-2433 | Integrated Assessment A | 2022-05-05T04:36:00 | composite-modified-51 | compact-record-26 | false | 1 | 100 |
| 2 | REC-2438 | Extended Survey | 2023-10-16T11:53:00 | primary-modified-52 | composite-record-27 | true | 2 | 101 |
| 3 | REC-2443 | Pilot Corridor | 2024-03-27T18:10:00 | adaptive-modified-53 | primary-record-28 | false | 3 | 102 |
| 4 | REC-2448 | Baseline Series D | 2025-08-11T01:27:00 | distributed-modified-54 | adaptive-record-29 | true | 4 | 103 |

Data governance and integrity are managed through the database_records table, which logs metadata about every significant record modification across the system. Each entry carries a database_record_id, a record_i_d such as REC-2433, and a table_name field that identifies the source table—Integrated Assessment A, Extended Survey, Pilot Corridor, Baseline Series D. The last_modified timestamp and modified_by field (composite-modified-51, primary-modified-52, adaptive-modified-53, distributed-modified-54) provide an audit trail, while the record_hash field (compact-record-26, composite-record-27, primary-record-28, adaptive-record-29) supports integrity verification. The is_duplicate flag distinguishes unique records from potential duplicates, and the table includes both an inventory_item_id and a customer_account_id foreign key, anchoring each database record to its corresponding business entities.

**Table `records_items`**

| shipment_record_id | inventory_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The records_items table functions as a many-to-many junction between shipment records and inventory items, capturing the granular composition of each dispatch. A single shipment_record_id can appear multiple times, each row pairing it with a distinct inventory_item_id. For example, shipment record 1 contains inventory items 1 and 2, while shipment record 2 contains items 2 and 3. This structure reflects the reality that a single outbound shipment frequently carries multiple distinct products, and the junction table provides the explicit mapping needed for accurate inventory deduction and fulfillment verification.

**Table `campaigns_accounts`**

| marketing_campaign_id | customer_account_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The campaigns_accounts table establishes the relationship between marketing campaigns and customer accounts, documenting which promotional initiatives target which customer segments. This junction table enables the analysis of campaign effectiveness by linking promotional spend to the accounts reached, forming the basis for return-on-investment calculations and audience segmentation strategies.

### Analytical Views and Cross-Domain Perspectives

The system provides nine analytical views that join these base tables to answer specific operational questions. Each view materializes a particular cross-domain relationship, enabling practitioners to analyze the data from multiple angles without rewriting join logic.

**View `v_inventory_item_shipment_record`**

```sql
CREATE VIEW v_inventory_item_shipment_record AS
SELECT a.id, a.sku, a.item_type, a.quantity_on_hand, b.shipment_record_id AS record_shipment_record_id, b.tracking_number AS record_tracking_number, b.shipment_date AS record_shipment_date
FROM inventory_items a JOIN shipment_records b ON a.shipment_record_id = b.shipment_record_id;
```

| id | sku | item_type | quantity_on_hand | record_shipment_record_id | record_tracking_number | record_shipment_date |
|---|---|---|---|---|---|---|
| 1 | SKU-2021 | diamond | 7 | 1 | TRA-2505 | 2023-10-02T21:51:00 |
| 2 | SKU-2025 | jewelry | 4 | 2 | TRA-2511 | 2024-03-13T04:08:00 |
| 3 | SKU-2029 | antique_radio | 6 | 3 | TRA-2517 | 2025-08-24T11:25:00 |
| 4 | SKU-2033 | diamond | 6 | 4 | TRA-2523 | 2022-01-08T18:42:00 |

The v_inventory_item_shipment_record view joins inventory items with their associated shipment records, answering the question of which items have been dispatched and under what logistics conditions. A row from this view might show SKU-2021 (a diamond item with 7 units on hand at location 9736909) linked to shipment TRA-2505, which was sent via Integrated Assessment A using express shipping on 2023-10-02. This perspective is essential for reconciling inventory deductions with actual dispatch events and for auditing the accuracy of stock-level reporting.

**View `v_shipment_record_inventory_item_detail`**

```sql
CREATE VIEW v_shipment_record_inventory_item_detail AS
SELECT a.shipment_record_id, a.tracking_number, a.shipment_date, b.id AS item_id, b.sku AS item_sku, b.item_type AS item_item_type
FROM shipment_records a
  JOIN records_items j ON j.shipment_record_id = a.shipment_record_id
  JOIN inventory_items b ON b.id = j.inventory_item_id;
```

| shipment_record_id | tracking_number | shipment_date | item_id | item_sku | item_item_type |
|---|---|---|---|---|---|
| 1 | TRA-2505 | 2023-10-02T21:51:00 | 1 | SKU-2021 | diamond |
| 1 | TRA-2505 | 2023-10-02T21:51:00 | 2 | SKU-2025 | jewelry |
| 2 | TRA-2511 | 2024-03-13T04:08:00 | 2 | SKU-2025 | jewelry |
| 2 | TRA-2511 | 2024-03-13T04:08:00 | 3 | SKU-2029 | antique_radio |
| 3 | TRA-2517 | 2025-08-24T11:25:00 | 3 | SKU-2029 | antique_radio |
| 3 | TRA-2517 | 2025-08-24T11:25:00 | 4 | SKU-2033 | diamond |
| 4 | TRA-2523 | 2022-01-08T18:42:00 | 4 | SKU-2033 | diamond |
| 4 | TRA-2523 | 2022-01-08T18:42:00 | 1 | SKU-2021 | diamond |

The v_shipment_record_inventory_item_detail view provides a detailed breakdown of the items contained within each shipment, particularly useful when a single shipment carries multiple products. For instance, shipment TRA-2505 appears in this view with both SKU-2021 (diamond, in_stock) and SKU-2025 (jewelry, reserved), revealing the multi-item composition of a single dispatch. This view supports warehouse operations by providing pick-list detail and enables post-shipment audits of fulfillment accuracy.

**View `v_shipment_record_customer_account`**

```sql
CREATE VIEW v_shipment_record_customer_account AS
SELECT a.shipment_record_id, a.tracking_number, a.shipment_date, a.carrier_name, b.id AS account_id, b.customer_i_d AS account_customer_i_d, b.company_name AS account_company_name
FROM shipment_records a JOIN customer_accounts b ON a.customer_account_id = b.id;
```

| shipment_record_id | tracking_number | shipment_date | carrier_name | account_id | account_customer_i_d | account_company_name |
|---|---|---|---|---|---|---|
| 1 | TRA-2505 | 2023-10-02T21:51:00 | Integrated Assessment A | 100 | Collin Lopez | Feedback Rating |
| 2 | TRA-2511 | 2024-03-13T04:08:00 | Extended Survey | 101 | Sarah Villanueva | Virgin Group |
| 3 | TRA-2517 | 2025-08-24T11:25:00 | Pilot Corridor | 102 | Norma Fisher | United Technologies |
| 4 | TRA-2523 | 2022-01-08T18:42:00 | Baseline Series D | 103 | Sandra Reese | Link Title |

The v_shipment_record_customer_account view connects outbound logistics to the customers they serve, answering the question of which accounts have received which shipments. A representative row might show shipment TRA-2511 (sent via Extended Survey using standard shipping, status dispatched) linked to customer account 101 (Sarah Villanueva of Virgin Group, account status suspended). This view is critical for customer service operations, enabling agents to look up a customer's recent shipments and for logistics teams to analyze delivery patterns by account.

**View `v_customer_account_shipment_record`**

```sql
CREATE VIEW v_customer_account_shipment_record AS
SELECT a.id, a.customer_i_d, a.company_name, a.contact_email, b.shipment_record_id AS record_shipment_record_id, b.tracking_number AS record_tracking_number, b.shipment_date AS record_shipment_date
FROM customer_accounts a JOIN shipment_records b ON a.shipment_record_id = b.shipment_record_id;
```

| id | customer_i_d | company_name | contact_email | record_shipment_record_id | record_tracking_number | record_shipment_date |
|---|---|---|---|---|---|---|
| 100 | Collin Lopez | Feedback Rating | Christopher Wilson | 1 | TRA-2505 | 2023-10-02T21:51:00 |
| 101 | Sarah Villanueva | Virgin Group | Charles Larsen | 2 | TRA-2511 | 2024-03-13T04:08:00 |
| 102 | Norma Fisher | United Technologies | Mary Alvarez | 3 | TRA-2517 | 2025-08-24T11:25:00 |
| 103 | Sandra Reese | Link Title | April Snyder | 4 | TRA-2523 | 2022-01-08T18:42:00 |

The v_customer_account_shipment_record view presents the same relationship from the customer's perspective, organizing shipments under each account. This orientation is particularly valuable for account management and for generating customer-facing shipment histories. A row might show customer account 100 (Collin Lopez, Feedback Rating, credit limit 12.95, active status) associated with shipment TRA-2505 (express, pending status, weight 1.48). The bidirectional nature of this relationship—captured by both this view and the previous one—ensures that analysts can approach the data from either the logistics or the commercial angle.

**View `v_customer_account_marketing_campaign`**

```sql
CREATE VIEW v_customer_account_marketing_campaign AS
SELECT a.id, a.customer_i_d, a.company_name, a.contact_email, b.marketing_campaign_id AS campaign_marketing_campaign_id, b.campaign_i_d AS campaign_campaign_i_d, b.campaign_name AS campaign_campaign_name
FROM customer_accounts a JOIN marketing_campaigns b ON a.marketing_campaign_id = b.marketing_campaign_id;
```

| id | customer_i_d | company_name | contact_email | campaign_marketing_campaign_id | campaign_campaign_i_d | campaign_campaign_name |
|---|---|---|---|---|---|---|
| 100 | Collin Lopez | Feedback Rating | Christopher Wilson | 1 | CAM-2016 | Compact Framework |
| 101 | Sarah Villanueva | Virgin Group | Charles Larsen | 2 | CAM-2022 | Legacy Protocol |
| 102 | Norma Fisher | United Technologies | Mary Alvarez | 3 | CAM-2028 | Regional Programme A |
| 103 | Sandra Reese | Link Title | April Snyder | 4 | CAM-2034 | Seasonal Standard |

The v_customer_account_marketing_campaign view links customer accounts to the marketing campaigns that target them, enabling the analysis of campaign reach and audience composition. A row from this view might show customer account 100 (Collin Lopez, active status) associated with marketing campaign 1 (Compact Framework, email channel, budget 35.45, status planned). This perspective supports marketing analytics by revealing which customer segments are being targeted by which campaigns and at what budget levels.

**View `v_marketing_campaign_customer_account_detail`**

```sql
CREATE VIEW v_marketing_campaign_customer_account_detail AS
SELECT a.marketing_campaign_id, a.campaign_i_d, a.campaign_name, b.id AS account_id, b.customer_i_d AS account_customer_i_d, b.company_name AS account_company_name
FROM marketing_campaigns a
  JOIN campaigns_accounts j ON j.marketing_campaign_id = a.marketing_campaign_id
  JOIN customer_accounts b ON b.id = j.customer_account_id;
```

| marketing_campaign_id | campaign_i_d | campaign_name | account_id | account_customer_i_d | account_company_name |
|---|---|---|---|---|---|
| 1 | CAM-2016 | Compact Framework | 100 | Collin Lopez | Feedback Rating |
| 1 | CAM-2016 | Compact Framework | 101 | Sarah Villanueva | Virgin Group |
| 2 | CAM-2022 | Legacy Protocol | 101 | Sarah Villanueva | Virgin Group |
| 2 | CAM-2022 | Legacy Protocol | 102 | Norma Fisher | United Technologies |
| 3 | CAM-2028 | Regional Programme A | 102 | Norma Fisher | United Technologies |
| 3 | CAM-2028 | Regional Programme A | 103 | Sandra Reese | Link Title |
| 4 | CAM-2034 | Seasonal Standard | 103 | Sandra Reese | Link Title |
| 4 | CAM-2034 | Seasonal Standard | 100 | Collin Lopez | Feedback Rating |

The v_marketing_campaign_customer_account_detail view provides a detailed breakdown of the customer accounts reached by each marketing campaign, offering a granular view of campaign audience composition. For example, campaign 2 (Legacy Protocol, web channel, active status, budget 18.47) might be linked to customer account 101 (Sarah Villanueva, Virgin Group, suspended status, credit limit 16.90). This view enables marketing practitioners to assess the alignment between campaign targeting and account characteristics, supporting optimization of future promotional spend.

**View `v_marketing_campaign_inventory_item`**

```sql
CREATE VIEW v_marketing_campaign_inventory_item AS
SELECT a.marketing_campaign_id, a.campaign_i_d, a.campaign_name, a.start_date, b.id AS item_id, b.sku AS item_sku, b.item_type AS item_item_type
FROM marketing_campaigns a JOIN inventory_items b ON a.inventory_item_id = b.id;
```

| marketing_campaign_id | campaign_i_d | campaign_name | start_date | item_id | item_sku | item_item_type |
|---|---|---|---|---|---|---|
| 1 | CAM-2016 | Compact Framework | 2022-09-05 | 1 | SKU-2021 | diamond |
| 2 | CAM-2022 | Legacy Protocol | 2023-02-16 | 2 | SKU-2025 | jewelry |
| 3 | CAM-2028 | Regional Programme A | 2024-07-27 | 3 | SKU-2029 | antique_radio |
| 4 | CAM-2034 | Seasonal Standard | 2025-12-11 | 4 | SKU-2033 | diamond |

The v_marketing_campaign_inventory_item view connects marketing campaigns to the inventory items they promote, answering the question of which products are being featured in which campaigns. A row might show campaign 3 (Regional Programme A, print channel, completed status, budget 26.25) linked to inventory item 3 (SKU-2029, antique_radio, 6 units on hand, unit cost 18.47, shipped status). This view is essential for coordinating promotional calendars with inventory availability and for analyzing the relationship between campaign spend and product movement.

**View `v_database_record_inventory_item`**

```sql
CREATE VIEW v_database_record_inventory_item AS
SELECT a.database_record_id, a.record_i_d, a.table_name, a.last_modified, b.id AS item_id, b.sku AS item_sku, b.item_type AS item_item_type
FROM database_records a JOIN inventory_items b ON a.inventory_item_id = b.id;
```

| database_record_id | record_i_d | table_name | last_modified | item_id | item_sku | item_item_type |
|---|---|---|---|---|---|---|
| 1 | REC-2433 | Integrated Assessment A | 2022-05-05T04:36:00 | 1 | SKU-2021 | diamond |
| 2 | REC-2438 | Extended Survey | 2023-10-16T11:53:00 | 2 | SKU-2025 | jewelry |
| 3 | REC-2443 | Pilot Corridor | 2024-03-27T18:10:00 | 3 | SKU-2029 | antique_radio |
| 4 | REC-2448 | Baseline Series D | 2025-08-11T01:27:00 | 4 | SKU-2033 | diamond |

The v_database_record_inventory_item view joins database governance records with the inventory items they reference, providing an audit trail that connects data integrity metadata to specific products. A row might show database record REC-2433 (table: Integrated Assessment A, last modified 2022-05-05, modified by composite-modified-51, record hash compact-record-26, not a duplicate) linked to inventory item 1 (SKU-2021, diamond, 7 units on hand). This view supports data governance teams by revealing which inventory records have been modified, when, and by whom, enabling compliance verification and change tracking.

**View `v_database_record_customer_account`**

```sql
CREATE VIEW v_database_record_customer_account AS
SELECT a.database_record_id, a.record_i_d, a.table_name, a.last_modified, b.id AS account_id, b.customer_i_d AS account_customer_i_d, b.company_name AS account_company_name
FROM database_records a JOIN customer_accounts b ON a.customer_account_id = b.id;
```

| database_record_id | record_i_d | table_name | last_modified | account_id | account_customer_i_d | account_company_name |
|---|---|---|---|---|---|---|
| 1 | REC-2433 | Integrated Assessment A | 2022-05-05T04:36:00 | 100 | Collin Lopez | Feedback Rating |
| 2 | REC-2438 | Extended Survey | 2023-10-16T11:53:00 | 101 | Sarah Villanueva | Virgin Group |
| 3 | REC-2443 | Pilot Corridor | 2024-03-27T18:10:00 | 102 | Norma Fisher | United Technologies |
| 4 | REC-2448 | Baseline Series D | 2025-08-11T01:27:00 | 103 | Sandra Reese | Link Title |

The v_database_record_customer_account view connects database governance records to the customer accounts they reference, extending the audit trail to the commercial domain. A row might show database record REC-2448 (table: Baseline Series D, last modified 2025-08-11, modified by distributed-modified-54, record hash adaptive-record-29, marked as duplicate) linked to customer account 103 (Sandra Reese, Link Title, active status, credit limit 24.80). This view enables data governance teams to track modifications to customer records and to identify potential data quality issues such as duplicate entries.

### Synthesis

The data model presented here captures the essential entities and relationships of a modern supply chain and fulfillment operation. Inventory items are tracked through their lifecycle, shipments document the logistics of outbound movement, customer accounts maintain the commercial relationships that drive demand, and marketing campaigns record the promotional initiatives that stimulate it. The junction tables—records_items and campaigns_accounts—resolve many-to-many relationships that arise naturally in these domains, while the nine analytical views provide pre-constructed perspectives that answer the most common cross-domain questions. Together, these tables and views form a coherent operational dataset that supports inventory management, logistics coordination, customer service, marketing analytics, and data governance. The fictional organizations, people, and products embedded in the sample data illustrate the structure without obscuring the underlying design principles that make the model both practical and extensible.