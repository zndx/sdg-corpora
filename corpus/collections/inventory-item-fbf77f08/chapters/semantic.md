## Ontology-Grounded Relational Modelling in a Logistics and Marketing Domain

The domain under examination sits at the intersection of physical logistics, customer relationship management, and digital record-keeping. Inventory items move through a warehouse, get assigned to shipments, and are delivered to customer accounts that are simultaneously enrolled in marketing campaigns. Every physical movement is mirrored by a database record that tracks data lineage, and every shipment may carry multiple items through a junction table. The relational schema captures these relationships through a carefully normalised set of base tables, junction tables, and materialised views that reconstruct domain facts on demand.

### The Inventory and Shipment Core

The backbone of the logistics model is the `inventory_items` table, which stores the static attributes of every product unit in the warehouse.

**Table `inventory_items`**

| id | sku | item_type | quantity_on_hand | unit_cost | location_code | status | shipment_record_id |
|---|---|---|---|---|---|---|---|
| 1 | SKU-2021 | diamond | 7 | 10.72 | 9736909 | in_stock | 1 |
| 2 | SKU-2025 | jewelry | 4 | 29.99 | 9125640 | reserved | 2 |
| 3 | SKU-2029 | antique_radio | 6 | 18.47 | 1450633 | shipped | 3 |
| 4 | SKU-2033 | diamond | 6 | 43.48 | 21005921 | damaged | 4 |

Each row is identified by a surrogate primary key `id` (values 1 through 4 in the sample data) and carries a human-readable `sku` such as `SKU-2021` or `SKU-2025`. The `item_type` column distinguishes categories like `diamond`, `jewelry`, and `antique_radio`, while `quantity_on_hand` records the current stock level — for instance, item 1 holds 7 units and item 2 holds 4. The `unit_cost` column stores monetary values ranging from 10.72 to 43.48, and `location_code` encodes a warehouse bin (e.g., `9736909`, `9125640`). The `status` column tracks the item's lifecycle state (`in_stock`, `reserved`, `shipped`, `damaged`), and critically, the `shipment_record_id` column acts as a foreign key pointing into the `shipment_records` table, establishing a one-to-many relationship: a single shipment can contain multiple inventory items.

The `shipment_records` table captures the outbound logistics events.

**Table `shipment_records`**

| shipment_record_id | tracking_number | shipment_date | carrier_name | total_weight | shipping_method | status | customer_account_id |
|---|---|---|---|---|---|---|---|
| 1 | TRA-2505 | 2023-10-02T21:51:00 | Integrated Assessment A | 1.48 | express | pending | 100 |
| 2 | TRA-2511 | 2024-03-13T04:08:00 | Extended Survey | 1.65 | standard | dispatched | 101 |
| 3 | TRA-2517 | 2025-08-24T11:25:00 | Pilot Corridor | 1.25 | overnight | delivered | 102 |
| 4 | TRA-2523 | 2022-01-08T18:42:00 | Baseline Series D | 0.6000001 | express | returned | 103 |

Each shipment is identified by `shipment_record_id` (1–4), carries a `tracking_number` like `TRA-2505` or `TRA-2511`, and is timestamped by `shipment_date` (e.g., `2023-10-02T21:51:00`). The `carrier_name` column names the logistics provider — `Integrated Assessment A`, `Extended Survey`, `Pilot Corridor`, `Baseline Series D` — while `total_weight` records the shipment mass (1.48, 1.65, 1.25, 0.6000001). The `shipping_method` distinguishes `express`, `standard`, and `overnight` services, and `status` tracks the shipment lifecycle (`pending`, `dispatched`, `delivered`, `returned`). The `customer_account_id` column is a foreign key into `customer_accounts`, linking each shipment to the account that placed the order.

### Customer Accounts and Marketing Campaigns

The `customer_accounts` table stores the commercial relationships between the business and its clients.

**Table `customer_accounts`**

| id | customer_i_d | company_name | contact_email | credit_limit | account_status | registration_date | shipment_record_id | marketing_campaign_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Collin Lopez | Feedback Rating | Christopher Wilson | 12.95 | active | 2023-06-19 | 1 | 1 |
| 101 | Sarah Villanueva | Virgin Group | Charles Larsen | 16.90 | suspended | 2024-11-03 | 2 | 2 |
| 102 | Norma Fisher | United Technologies | Mary Alvarez | 20.85 | archived | 2025-04-14 | 3 | 3 |
| 103 | Sandra Reese | Link Title | April Snyder | 24.80 | active | 2022-09-25 | 4 | 4 |

Each account is identified by `id` (100–103) and carries a `customer_i_d` (e.g., `Collin Lopez`, `Sarah Villanueva`), a `company_name` (`Feedback Rating`, `Virgin Group`, `United Technologies`, `Link Title`), and a `contact_email` (`Christopher Wilson`, `Charles Larsen`, `Mary Alvarez`, `April Snyder`). The `credit_limit` column stores monetary values (12.95, 16.90, 20.85, 24.80), and `account_status` tracks whether the account is `active`, `suspended`, or `archived`. The `registration_date` records when the account was created. Two foreign key columns — `shipment_record_id` and `marketing_campaign_id` — link the account to its most recent shipment and to a marketing campaign, respectively.

The `marketing_campaigns` table manages the promotional activities that target these accounts.

**Table `marketing_campaigns`**

| marketing_campaign_id | campaign_i_d | campaign_name | start_date | end_date | budget | channel | status | inventory_item_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CAM-2016 | Compact Framework | 2022-09-05 | 2022-09-01 | 35.45 | email | planned | 1 | 2025-01-01 00:14:00 |
| 2 | CAM-2022 | Legacy Protocol | 2023-02-16 | 2023-02-12 | 18.47 | web | active | 2 | 2025-02-06 03:14:00 |
| 3 | CAM-2028 | Regional Programme A | 2024-07-27 | 2024-07-23 | 26.25 | print | completed | 3 | 2025-03-11 06:14:00 |
| 4 | CAM-2034 | Seasonal Standard | 2025-12-11 | 2025-12-07 | 17.12 | social | cancelled | 4 | 2025-04-16 09:14:00 |

Each campaign is identified by `marketing_campaign_id` (1–4) and carries a `campaign_i_d` (`CAM-2016`, `CAM-2022`, `CAM-2028`, `CAM-2034`) and a `campaign_name` (`Compact Framework`, `Legacy Protocol`, `Regional Programme A`, `Seasonal Standard`). The `start_date` and `end_date` columns define the campaign window, though in the sample data the end dates precede the start dates — a data quality anomaly worth noting. The `budget` column stores campaign spending (35.45, 18.47, 26.25, 17.12), and `channel` specifies the delivery medium (`email`, `web`, `print`, `social`). The `status` column tracks campaign state (`planned`, `active`, `completed`, `cancelled`), and the `inventory_item_id` column is a foreign key linking the campaign to a specific inventory item, while `created_at` records the campaign's creation timestamp.

### Database Records and Junction Tables

The `database_records` table provides a data governance layer, tracking the provenance of records across the system.

**Table `database_records`**

| database_record_id | record_i_d | table_name | last_modified | modified_by | record_hash | is_duplicate | inventory_item_id | customer_account_id |
|---|---|---|---|---|---|---|---|---|
| 1 | REC-2433 | Integrated Assessment A | 2022-05-05T04:36:00 | composite-modified-51 | compact-record-26 | false | 1 | 100 |
| 2 | REC-2438 | Extended Survey | 2023-10-16T11:53:00 | primary-modified-52 | composite-record-27 | true | 2 | 101 |
| 3 | REC-2443 | Pilot Corridor | 2024-03-27T18:10:00 | adaptive-modified-53 | primary-record-28 | false | 3 | 102 |
| 4 | REC-2448 | Baseline Series D | 2025-08-11T01:27:00 | distributed-modified-54 | adaptive-record-29 | true | 4 | 103 |

Each record is identified by `database_record_id` (1–4) and carries a `record_i_d` (`REC-2433`, `REC-2438`, `REC-2443`, `REC-2448`). The `table_name` column indicates which logical table the record originated from (`Integrated Assessment A`, `Extended Survey`, `Pilot Corridor`, `Baseline Series D`), and `last_modified` records the timestamp of the last update. The `modified_by` column names the modification source (`composite-modified-51`, `primary-modified-52`, `adaptive-modified-53`, `distributed-modified-54`), while `record_hash` stores a hash identifier (`compact-record-26`, `composite-record-27`, `primary-record-28`, `adaptive-record-29`). The `is_duplicate` boolean flag (all `false` or `true` in the sample) indicates deduplication status. Two foreign key columns — `inventory_item_id` and `customer_account_id` — link each database record to its corresponding inventory item and customer account.

The `records_items` table serves as a junction table between shipments and inventory items, resolving a many-to-many relationship.

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

Each row pairs a `shipment_record_id` with an `inventory_item_id`. For example, shipment 1 contains inventory items 1 and 2, shipment 2 contains items 2 and 3, shipment 3 contains items 3 and 4, and shipment 4 contains items 4 and 1. This junction table is essential because a single shipment can carry multiple items, and a single inventory item can appear in multiple shipments over time.

The `campaigns_accounts` table (not shown in the sample data but present in the schema) similarly resolves the many-to-many relationship between marketing campaigns and customer accounts, allowing a single campaign to target multiple accounts and a single account to be enrolled in multiple campaigns.

### Materialised Views: Reconstructing Domain Facts

The materialised views join the normalised base tables to answer specific analytical questions. Each view represents a denormalised snapshot of a domain fact.

The view `v_inventory_item_shipment_record` joins `inventory_items` to `shipment_records` on the `shipment_record_id` foreign key, reconstructing the full picture of which items are in which shipments.

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

Reading a concrete row from this view: inventory item `SKU-2021` (a `diamond` with 7 units on hand at location `9736909`) is part of shipment `TRA-2505`, dispatched via `express` by `Integrated Assessment A` on `2023-10-02T21:51:00` with a total weight of 1.48. This join answers the question: "What shipment is this inventory item part of, and what are the shipment's logistics details?"

The view `v_shipment_record_inventory_item_detail` performs the same join but from the shipment's perspective, presenting all items contained within each shipment.

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

A row from this view shows shipment `TRA-2511` (carried by `Extended Survey` via `standard` shipping, status `dispatched`) containing inventory item `SKU-2025` (a `jewelry` item with 4 units, reserved status, unit cost 29.99). This view answers: "What items are in this shipment, and what are their inventory details?"

The view `v_shipment_record_customer_account` joins `shipment_records` to `customer_accounts` on `customer_account_id`, linking each shipment to the account that placed it.

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

A row from this view shows shipment `TRA-2517` (delivered by `Pilot Corridor` via `overnight` shipping on `2025-08-24T11:25:00`) belonging to customer account 102 (`Norma Fisher` at `United Technologies`, contact `Mary Alvarez`, credit limit 20.85, status `archived`). This view answers: "Which customer account placed this shipment, and what are their account details?"

The view `v_customer_account_shipment_record` performs the inverse join, presenting all shipments for each customer account.

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

A row from this view shows customer account 100 (`Collin Lopez` at `Feedback Rating`, contact `Christopher Wilson`, credit limit 12.95, status `active`) associated with shipment `TRA-2505` (tracking number `TRA-2505`, shipped via `express` by `Integrated Assessment A`, status `pending`). This view answers: "What shipments has this customer account placed?"

The view `v_customer_account_marketing_campaign` joins `customer_accounts` to `marketing_campaigns` on `marketing_campaign_id`, linking each account to its associated campaign.

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

A row from this view shows customer account 101 (`Sarah Villanueva` at `Virgin Group`, contact `Charles Larsen`, credit limit 16.90, status `suspended`) enrolled in marketing campaign `CAM-2022` (`Legacy Protocol`, budget 18.47, channel `web`, status `active`). This view answers: "Which marketing campaign is this customer account enrolled in?"

The view `v_marketing_campaign_customer_account_detail` performs the inverse join, presenting all accounts targeted by each campaign.

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

A row from this view shows marketing campaign `CAM-2028` (`Regional Programme A`, budget 26.25, channel `print`, status `completed`) targeting customer account 102 (`Norma Fisher` at `United Technologies`, contact `Mary Alvarez`, credit limit 20.85, status `archived`). This view answers: "Which customer accounts are targeted by this marketing campaign?"

The view `v_marketing_campaign_inventory_item` joins `marketing_campaigns` to `inventory_items` on `inventory_item_id`, linking each campaign to a specific inventory item.

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

A row from this view shows marketing campaign `CAM-2016` (`Compact Framework`, budget 35.45, channel `email`, status `planned`) associated with inventory item `SKU-2021` (a `diamond` with 7 units on hand, unit cost 10.72, status `in_stock`). This view answers: "Which inventory item is this marketing campaign promoting?"

The view `v_database_record_inventory_item` joins `database_records` to `inventory_items` on `inventory_item_id`, linking each database record to its corresponding inventory item.

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

A row from this view shows database record `REC-2433` (table `Integrated Assessment A`, last modified `2022-05-05T04:36:00` by `composite-modified-51`, hash `compact-record-26`, not a duplicate) associated with inventory item `SKU-2021` (a `diamond` with 7 units on hand, unit cost 10.72, status `in_stock`). This view answers: "Which inventory item does this database record pertain to?"

The view `v_database_record_customer_account` joins `database_records` to `customer_accounts` on `customer_account_id`, linking each database record to its corresponding customer account.

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

A row from this view shows database record `REC-2438` (table `Extended Survey`, last modified `2023-10-16T11:53:00` by `primary-modified-52`, hash `composite-record-27`, marked as a duplicate) associated with customer account 101 (`Sarah Villanueva` at `Virgin Group`, contact `Charles Larsen`, credit limit 16.90, status `suspended`). This view answers: "Which customer account does this database record pertain to?"

### Synthesis

The schema models a logistics and marketing domain through five core entity types — inventory items, shipments, customer accounts, marketing campaigns, and database records — connected by foreign keys and junction tables that resolve many-to-many relationships. The `records_items` junction table between shipments and inventory items, and the `campaigns_accounts` junction table between campaigns and customer accounts, demonstrate how normalisation eliminates redundancy while preserving relational expressiveness. The materialised views reconstruct domain facts by joining these normalised tables, each view answering a specific analytical question: which items are in which shipments, which accounts placed which shipments, which campaigns target which accounts, and which database records pertain to which inventory items or customer accounts. The concrete values — `SKU-2021` diamonds, `TRA-2505` express shipments, `Collin Lopez` accounts, `Compact Framework` email campaigns — ground the abstract schema in a tangible operational reality, illustrating how ontology-driven modelling translates conceptual relationships into a queryable relational structure.

## Data appendix

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
