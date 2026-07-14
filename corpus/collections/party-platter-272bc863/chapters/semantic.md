## The Catering Catalogue as a Normalised Relational Model

The catering catalogue domain captures how organisations assemble meal offerings for events and individual orders. At the highest level, two product families exist: party platters and box lunches. Each family is a composite entity whose attributes and component items are spread across several tables, linked by foreign keys that enforce a clean normalised structure. The schema separates the header-level metadata (who the offering is for, how many it serves, pricing, and status) from the line-item composition (which foods and drinks belong to the offering), and from the optional side, beverage, and dessert attachments. Junction tables mediate many-to-many relationships between platters and their items, and between wraps and their ingredients. A suite of materialised views then reassembles these normalised fragments into flat, query-friendly projections that answer concrete business questions about what goes into a given offering.

**Table `party_platters`**

| id | platter_id | serves_count | base_price | epic_price | status | last_updated | side_item_side_id | beverage_id | dessert_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 15134 | 45 | 12.72 | 12.34 | available | 2023-06-17T17:27:00 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 884345 | 1 |
| 1001 | 9568453 | 31 | 12.87 | 19.97 | unavailable | 2024-11-01T00:44:00 | 937737 | 4447029 | 2 |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 17.41 | 27.02 | available | 2025-04-12T07:01:00 | 6564389 | 2002007020170 | 3 |
| 1003 | 10207157 | 5 | 18.59 | 36.43 | unavailable | 2022-09-23T14:18:00 | 103178 | 3158148 | 4 |

The `party_platters` table is the anchor for the party-platter product family. Its primary key `id` is a surrogate integer (1000, 1001, 1002, 1003 in the sample data), while `platter_id` carries a business identifier that can be numeric (`15134`, `9568453`) or alphanumeric (`lu_tax_code_template_b_VB-IC-Tab`). The column `serves_count` records the headcount the platter is designed for, ranging from 0 to 45 in the sample. Pricing is captured in two columns: `base_price` (the standard unit price, e.g. 12.72) and `epic_price` (a promotional or alternate price, e.g. 12.34 or 36.43). The `status` column constrains the offering to `available` or `unavailable`, and `last_updated` is a timestamp (`2023-06-17T17:27:00`, `2024-11-01T00:44:00`, etc.). Three foreign keys — `side_item_side_id`, `beverage_id`, and `dessert_id` — point into the `side_items`, `beverages`, and `desserts` tables respectively, establishing a one-to-one attachment of a side, a drink, and a dessert to each party platter. The side identifier is a Google Place ID-style string (`ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), the beverage identifier is numeric (`884345`), and the dessert identifier is an integer (`1`).

**Table `platter_items`**

| platter_item_id | item_id | item_name | quantity | category | is_crispy | is_grilled | party_platter_id |
|---|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | 9 | sandwich | false | false | 1000 |
| 1001 | ITE-2795 | Integrated Corridor | 8 | chicken | true | true | 1001 |
| 1002 | ITE-2798 | Extended Series D | 0 | beef | false | false | 1002 |
| 1003 | ITE-2801 | Pilot Assessment | 12 | catfish | true | true | 1003 |

Each party platter is composed of one or more `platter_items`. The `platter_items` table stores these line items with a surrogate `platter_item_id` (1000–1003), a business `item_id` (`ITE-2792`, `ITE-2795`, etc.), and an `item_name` such as "Seasonal Survey" or "Integrated Corridor". The `quantity` column records how many units of the item are included (0–12), while `category` classifies the item as `sandwich`, `chicken`, `beef`, or `catfish`. Two boolean flags, `is_crispy` and `is_grilled`, capture preparation attributes. The foreign key `party_platter_id` links each item back to its parent `party_platter` row (e.g. item 1000 belongs to platter 1000). This design means a single party platter can have multiple platter items, while each platter item belongs to exactly one platter — a classic one-to-many relationship materialised as a column-level foreign key.

**Table `side_items`**

| side_id | side_name | price | type | is_available | party_platter_id | box_lunch_id |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | 12.87 | chips | true | 1000 | 1 |
| 937737 | Extended Standard | 35.45 | coleslaw | false | 1001 | 2 |
| 6564389 | Pilot Framework | 29.24 | fruit | true | 1002 | 3 |
| 103178 | Baseline Protocol D | 29.99 | salad | false | 1003 | 4 |

**Table `beverages`**

| beverage_id | beverage_name | price | type | is_available | party_platter_id | box_lunch_id |
|---|---|---|---|---|---|---|
| 884345 | Compact Initiative | 12.87 | soft_drink | true | 1000 | 1 |
| 4447029 | Legacy Model | 35.45 | water | false | 1001 | 2 |
| 2002007020170 | Regional Cluster A | 29.24 | juice | true | 1002 | 3 |
| 3158148 | Seasonal Review | 29.99 | soft_drink | false | 1003 | 4 |

**Table `desserts`**

| id | dessert_id | dessert_name | price | type | is_available | party_platter_id | box_lunch_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | L486 | Integrated Framework A | 12.87 | cookie | true | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | a0f8b44e-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol | 35.45 | brownie | false | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7119779 | Pilot Programme | 29.24 | cookie | true | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1437585 | Baseline Standard D | 29.99 | brownie | false | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The side, beverage, and dessert tables follow a parallel structure. The `side_items` table uses `side_id` as its primary key (a Google Place ID string like `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` or a numeric value like `937737`), with `side_name` ("Integrated Programme A", "Extended Standard"), `price` (12.87–35.45), `type` (`chips`, `coleslaw`, `fruit`, `salad`), and `is_available` (true/false). It carries two foreign keys: `party_platter_id` links the side to a party platter, and `box_lunch_id` links it to a box lunch. The `beverages` table mirrors this pattern with `beverage_id` (numeric: 884345, 4447029, 2002007020170, 3158148), `beverage_name` ("Compact Initiative", "Legacy Model"), `price`, `type` (`soft_drink`, `water`, `juice`), `is_available`, and the same pair of foreign keys (`party_platter_id`, `box_lunch_id`). The `desserts` table adds `id` as an additional surrogate key alongside `dessert_id` (which can be a short code like `L486`, a UUID-like string, or a numeric value), `dessert_name` ("Integrated Framework A", "Extended Protocol"), `price`, `type` (`cookie`, `brownie`), `is_available`, the same two foreign keys, and audit columns `created_at` and `updated_at`. The dual foreign keys in all three tables mean that a side, beverage, or dessert can be shared across both party platters and box lunches, or attached to only one of the two families.

**Table `box_lunches`**

| id | lunch_id | lunch_name | price | status | last_updated | wrap_id | side_item_side_id | dessert_id |
|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-IC-3 | Extended Framework | 12.87 | available | 2023-06-17T17:27:00 | 1000 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 1 |
| 2 | 4920 | Pilot Protocol A | 35.45 | unavailable | 2024-11-01T00:44:00 | 1001 | 937737 | 2 |
| 3 | lu_tax_code_template_m32 | Baseline Programme | 29.24 | available | 2025-04-12T07:01:00 | 1002 | 6564389 | 3 |
| 4 | 209212 | Distributed Standard | 29.99 | unavailable | 2022-09-23T14:18:00 | 1003 | 103178 | 4 |

The `box_lunches` table is the counterpart to `party_platters` for the individual lunch product family. Its surrogate primary key `id` (1–4) maps to a business `lunch_id` (`b_VB-IC-3`, `4920`, `lu_tax_code_template_m32`, `209212`) and a human-readable `lunch_name` ("Extended Framework", "Pilot Protocol A", etc.). The `price` column holds the unit cost (12.87–35.45), `status` is again `available` or `unavailable`, and `last_updated` is a timestamp. Three foreign keys complete the header: `wrap_id` points to a row in the `wraps` table, `side_item_side_id` points to a row in `side_items`, and `dessert_id` points to a row in `desserts`. The wrap reference is a numeric ID (1000–1003), the side reference is a Google Place ID string (`ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), and the dessert reference is an integer (`1`). This structure means each box lunch is composed of exactly one wrap, one side, and one dessert — a one-to-one composition at the header level, with the actual wrap contents further decomposed into ingredients.

**Table `wraps`**

| wrap_id | wrap_name | price | main_ingredient | is_available | box_lunch_id |
|---|---|---|---|---|---|
| 1000 | Primary Survey A | 12.87 | chicken | true | 1 |
| 1001 | Composite Corridor | 35.45 | beef | false | 2 |
| 1002 | Compact Series | 29.24 | chicken | true | 3 |
| 1003 | Legacy Assessment D | 29.99 | beef | false | 4 |

**Table `ingredients`**

| id | ingredient_id | ingredient_name | type | is_organic | is_certified | wrap_id | platter_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Pilot Assessment | meat | false | true | 1000 | 1000 |
| 2 | 5844284 | Baseline Survey | cheese | true | false | 1001 | 1001 |
| 3 | template_ivacode_pagata_20det40ind | Distributed Corridor A | vegetable | false | true | 1002 | 1002 |
| 4 | 2087735 | Adaptive Series | sauce | true | false | 1003 | 1003 |

Wraps and ingredients form a many-to-many relationship that requires a junction table. The `wraps` table stores wrap-level metadata (the sample data shows wrap IDs 1000–1003 corresponding to the wraps referenced by box lunches). The `ingredients` table stores individual ingredient records. The junction table `wraps_ingredients` links a wrap to its constituent ingredients, with each row representing one ingredient within one wrap. This normalised design avoids repeating ingredient data and allows a single ingredient (e.g., "chicken breast") to appear in multiple wraps, while a wrap (e.g., "Grilled Chicken Wrap") can contain multiple ingredients.

**Table `platters_items`**

| party_platter_id | platter_item_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `wraps_ingredients`**

| wrap_id | ingredient_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `platters_items` junction table mediates the many-to-many relationship between `party_platters` and `platter_items`. Although the sample data suggests a one-to-one mapping (platter 1000 has item 1000, platter 1001 has item 1001, etc.), the junction table design supports the general case where a single party platter could reference multiple platter items, and a platter item could theoretically appear in multiple platters. The `wraps_ingredients` junction table similarly supports the general case where a wrap contains multiple ingredients and an ingredient appears in multiple wraps. These junction tables are the relational manifestation of the domain concept that a meal offering is an aggregation of constituent parts, where the parts themselves are independently managed entities.

The materialised views in this schema serve as denormalised projections that answer specific business questions by joining the normalised tables back together. Each view corresponds to a particular facet of the domain model and reconstructs a domain fact from the underlying foreign-key relationships.

**View `v_party_platter_platter_item_detail`**

```sql
CREATE VIEW v_party_platter_platter_item_detail AS
SELECT a.id, a.platter_id, a.serves_count, b.platter_item_id AS item_platter_item_id, b.item_id AS item_item_id, b.item_name AS item_item_name
FROM party_platters a
  JOIN platters_items j ON j.party_platter_id = a.id
  JOIN platter_items b ON b.platter_item_id = j.platter_item_id;
```

| id | platter_id | serves_count | item_platter_item_id | item_item_id | item_item_name |
|---|---|---|---|---|---|
| 1000 | 15134 | 45 | 1000 | ITE-2792 | Seasonal Survey |
| 1000 | 15134 | 45 | 1001 | ITE-2795 | Integrated Corridor |
| 1001 | 9568453 | 31 | 1001 | ITE-2795 | Integrated Corridor |
| 1001 | 9568453 | 31 | 1002 | ITE-2798 | Extended Series D |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 1002 | ITE-2798 | Extended Series D |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 1003 | ITE-2801 | Pilot Assessment |
| 1003 | 10207157 | 5 | 1003 | ITE-2801 | Pilot Assessment |
| 1003 | 10207157 | 5 | 1000 | ITE-2792 | Seasonal Survey |

The view `v_party_platter_platter_item_detail` joins `party_platters` with `platter_items` on `party_platter.id = platter_items.party_platter_id`. It answers the question: "What items are in each party platter, and what are the platter's header details?" A row from this view might show platter 1000 (serving 45 people, base price 12.72) containing item "Seasonal Survey" (category `sandwich`, quantity 9, not crispy, not grilled). This view is the primary projection for platter composition queries.

**View `v_party_platter_side_item`**

```sql
CREATE VIEW v_party_platter_side_item AS
SELECT a.id, a.platter_id, a.serves_count, a.base_price, b.side_id AS item_side_id, b.side_name AS item_side_name, b.price AS item_price
FROM party_platters a JOIN side_items b ON a.side_item_side_id = b.side_id;
```

| id | platter_id | serves_count | base_price | item_side_id | item_side_name | item_price |
|---|---|---|---|---|---|---|
| 1000 | 15134 | 45 | 12.72 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | 12.87 |
| 1001 | 9568453 | 31 | 12.87 | 937737 | Extended Standard | 35.45 |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 17.41 | 6564389 | Pilot Framework | 29.24 |
| 1003 | 10207157 | 5 | 18.59 | 103178 | Baseline Protocol D | 29.99 |

`v_party_platter_side_item` joins `party_platters` with `side_items` on `party_platters.side_item_side_id = side_items.side_id`. It answers: "What side is attached to each party platter?" A sample row shows platter 1000 with side "Integrated Programme A" (type `chips`, price 12.87, available). This view isolates the side attachment relationship from the broader platter header.

**View `v_party_platter_beverage`**

```sql
CREATE VIEW v_party_platter_beverage AS
SELECT a.id, a.platter_id, a.serves_count, a.base_price, b.beverage_id AS beverage_beverage_id, b.beverage_name AS beverage_beverage_name, b.price AS beverage_price
FROM party_platters a JOIN beverages b ON a.beverage_id = b.beverage_id;
```

| id | platter_id | serves_count | base_price | beverage_beverage_id | beverage_beverage_name | beverage_price |
|---|---|---|---|---|---|---|
| 1000 | 15134 | 45 | 12.72 | 884345 | Compact Initiative | 12.87 |
| 1001 | 9568453 | 31 | 12.87 | 4447029 | Legacy Model | 35.45 |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 17.41 | 2002007020170 | Regional Cluster A | 29.24 |
| 1003 | 10207157 | 5 | 18.59 | 3158148 | Seasonal Review | 29.99 |

`v_party_platter_beverage` joins `party_platters` with `beverages` on `party_platters.beverage_id = beverages.beverage_id`. It answers: "What beverage accompanies each party platter?" A sample row shows platter 1000 with beverage "Compact Initiative" (type `soft_drink`, price 12.87, available). This view is useful for beverage inventory and pricing analysis.

**View `v_party_platter_dessert`**

```sql
CREATE VIEW v_party_platter_dessert AS
SELECT a.id, a.platter_id, a.serves_count, a.base_price, b.id AS dessert_id, b.dessert_id AS dessert_dessert_id, b.dessert_name AS dessert_dessert_name
FROM party_platters a JOIN desserts b ON a.dessert_id = b.id;
```

| id | platter_id | serves_count | base_price | dessert_id | dessert_dessert_id | dessert_dessert_name |
|---|---|---|---|---|---|---|
| 1000 | 15134 | 45 | 12.72 | 1 | L486 | Integrated Framework A |
| 1001 | 9568453 | 31 | 12.87 | 2 | a0f8b44e-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 17.41 | 3 | 7119779 | Pilot Programme |
| 1003 | 10207157 | 5 | 18.59 | 4 | 1437585 | Baseline Standard D |

`v_party_platter_dessert` joins `party_platters` with `desserts` on `party_platters.dessert_id = desserts.id`. It answers: "What dessert is attached to each party platter?" A sample row shows platter 1000 with dessert "Integrated Framework A" (type `cookie`, price 12.87, available). This view isolates the dessert attachment for party platters specifically.

**View `v_platter_item_party_platter`**

```sql
CREATE VIEW v_platter_item_party_platter AS
SELECT a.platter_item_id, a.item_id, a.item_name, a.quantity, b.id AS platter_id, b.platter_id AS platter_platter_id, b.serves_count AS platter_serves_count
FROM platter_items a JOIN party_platters b ON a.party_platter_id = b.id;
```

| platter_item_id | item_id | item_name | quantity | platter_id | platter_platter_id | platter_serves_count |
|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | 9 | 1000 | 15134 | 45 |
| 1001 | ITE-2795 | Integrated Corridor | 8 | 1001 | 9568453 | 31 |
| 1002 | ITE-2798 | Extended Series D | 0 | 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 |
| 1003 | ITE-2801 | Pilot Assessment | 12 | 1003 | 10207157 | 5 |

`v_platter_item_party_platter` is the inverse of `v_party_platter_platter_item_detail`, joining `platter_items` with `party_platters` on `platter_items.party_platter_id = party_platters.id`. It answers: "Which party platter does each platter item belong to?" A sample row shows item "Integrated Corridor" (category `chicken`, quantity 8, crispy and grilled) belonging to platter 1001 (serving 31, base price 12.87, unavailable). This view is useful when querying from the item perspective upward to the platter.

**View `v_side_item_party_platter`**

```sql
CREATE VIEW v_side_item_party_platter AS
SELECT a.side_id, a.side_name, a.price, a.type, b.id AS platter_id, b.platter_id AS platter_platter_id, b.serves_count AS platter_serves_count
FROM side_items a JOIN party_platters b ON a.party_platter_id = b.id;
```

| side_id | side_name | price | type | platter_id | platter_platter_id | platter_serves_count |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | 12.87 | chips | 1000 | 15134 | 45 |
| 937737 | Extended Standard | 35.45 | coleslaw | 1001 | 9568453 | 31 |
| 6564389 | Pilot Framework | 29.24 | fruit | 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 |
| 103178 | Baseline Protocol D | 29.99 | salad | 1003 | 10207157 | 5 |

`v_side_item_party_platter` joins `side_items` with `party_platters` on `side_items.party_platter_id = party_platters.id`. It answers: "Which party platters reference each side item?" A sample row shows side "Extended Standard" (type `coleslaw`, price 35.45, unavailable) referenced by platter 1001. This view supports side-item popularity and usage analysis across party platters.

**View `v_side_item_box_lunch`**

```sql
CREATE VIEW v_side_item_box_lunch AS
SELECT a.side_id, a.side_name, a.price, a.type, b.id AS lunch_id, b.lunch_id AS lunch_lunch_id, b.lunch_name AS lunch_lunch_name
FROM side_items a JOIN box_lunches b ON a.box_lunch_id = b.id;
```

| side_id | side_name | price | type | lunch_id | lunch_lunch_id | lunch_lunch_name |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | 12.87 | chips | 1 | b_VB-IC-3 | Extended Framework |
| 937737 | Extended Standard | 35.45 | coleslaw | 2 | 4920 | Pilot Protocol A |
| 6564389 | Pilot Framework | 29.24 | fruit | 3 | lu_tax_code_template_m32 | Baseline Programme |
| 103178 | Baseline Protocol D | 29.99 | salad | 4 | 209212 | Distributed Standard |

`v_side_item_box_lunch` joins `side_items` with `box_lunches` on `side_items.box_lunch_id = box_lunches.id`. It answers: "Which box lunches reference each side item?" A sample row shows side "Integrated Programme A" (type `chips`, price 12.87, available) referenced by box lunch 1 ("Extended Framework", price 12.87, available). This view isolates the side-to-box-lunch relationship.

**View `v_beverage_party_platter`**

```sql
CREATE VIEW v_beverage_party_platter AS
SELECT a.beverage_id, a.beverage_name, a.price, a.type, b.id AS platter_id, b.platter_id AS platter_platter_id, b.serves_count AS platter_serves_count
FROM beverages a JOIN party_platters b ON a.party_platter_id = b.id;
```

| beverage_id | beverage_name | price | type | platter_id | platter_platter_id | platter_serves_count |
|---|---|---|---|---|---|---|
| 884345 | Compact Initiative | 12.87 | soft_drink | 1000 | 15134 | 45 |
| 4447029 | Legacy Model | 35.45 | water | 1001 | 9568453 | 31 |
| 2002007020170 | Regional Cluster A | 29.24 | juice | 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 |
| 3158148 | Seasonal Review | 29.99 | soft_drink | 1003 | 10207157 | 5 |

`v_beverage_party_platter` joins `beverages` with `party_platters` on `beverages.party_platter_id = party_platters.id`. It answers: "Which party platters reference each beverage?" A sample row shows beverage "Legacy Model" (type `water`, price 35.45, unavailable) referenced by platter 1001. This view supports beverage usage analysis across party platters.

**View `v_beverage_box_lunch`**

```sql
CREATE VIEW v_beverage_box_lunch AS
SELECT a.beverage_id, a.beverage_name, a.price, a.type, b.id AS lunch_id, b.lunch_id AS lunch_lunch_id, b.lunch_name AS lunch_lunch_name
FROM beverages a JOIN box_lunches b ON a.box_lunch_id = b.id;
```

| beverage_id | beverage_name | price | type | lunch_id | lunch_lunch_id | lunch_lunch_name |
|---|---|---|---|---|---|---|
| 884345 | Compact Initiative | 12.87 | soft_drink | 1 | b_VB-IC-3 | Extended Framework |
| 4447029 | Legacy Model | 35.45 | water | 2 | 4920 | Pilot Protocol A |
| 2002007020170 | Regional Cluster A | 29.24 | juice | 3 | lu_tax_code_template_m32 | Baseline Programme |
| 3158148 | Seasonal Review | 29.99 | soft_drink | 4 | 209212 | Distributed Standard |

`v_beverage_box_lunch` joins `beverages` with `box_lunches` on `beverages.box_lunch_id = box_lunches.id`. It answers: "Which box lunches reference each beverage?" A sample row shows beverage "Regional Cluster A" (type `juice`, price 29.24, available) referenced by box lunch 3 ("Baseline Programme", price 29.24, available). This view isolates the beverage-to-box-lunch relationship.

**View `v_dessert_party_platter`**

```sql
CREATE VIEW v_dessert_party_platter AS
SELECT a.id, a.dessert_id, a.dessert_name, a.price, b.id AS platter_id, b.platter_id AS platter_platter_id, b.serves_count AS platter_serves_count
FROM desserts a JOIN party_platters b ON a.party_platter_id = b.id;
```

| id | dessert_id | dessert_name | price | platter_id | platter_platter_id | platter_serves_count |
|---|---|---|---|---|---|---|
| 1 | L486 | Integrated Framework A | 12.87 | 1000 | 15134 | 45 |
| 2 | a0f8b44e-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol | 35.45 | 1001 | 9568453 | 31 |
| 3 | 7119779 | Pilot Programme | 29.24 | 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 |
| 4 | 1437585 | Baseline Standard D | 29.99 | 1003 | 10207157 | 5 |

`v_dessert_party_platter` joins `desserts` with `party_platters` on `desserts.id = party_platters.dessert_id`. It answers: "Which party platters reference each dessert?" A sample row shows dessert "Extended Protocol" (type `brownie`, price 35.45, unavailable) referenced by platter 1001. This view supports dessert usage analysis across party platters.

**View `v_dessert_box_lunch`**

```sql
CREATE VIEW v_dessert_box_lunch AS
SELECT a.id, a.dessert_id, a.dessert_name, a.price, b.id AS lunch_id, b.lunch_id AS lunch_lunch_id, b.lunch_name AS lunch_lunch_name
FROM desserts a JOIN box_lunches b ON a.box_lunch_id = b.id;
```

| id | dessert_id | dessert_name | price | lunch_id | lunch_lunch_id | lunch_lunch_name |
|---|---|---|---|---|---|---|
| 1 | L486 | Integrated Framework A | 12.87 | 1 | b_VB-IC-3 | Extended Framework |
| 2 | a0f8b44e-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol | 35.45 | 2 | 4920 | Pilot Protocol A |
| 3 | 7119779 | Pilot Programme | 29.24 | 3 | lu_tax_code_template_m32 | Baseline Programme |
| 4 | 1437585 | Baseline Standard D | 29.99 | 4 | 209212 | Distributed Standard |

`v_dessert_box_lunch` joins `desserts` with `box_lunches` on `desserts.id = box_lunches.dessert_id`. It answers: "Which box lunches reference each dessert?" A sample row shows dessert "Pilot Programme" (type `cookie`, price 29.24, available) referenced by box lunch 3 ("Baseline Programme", price 29.24, available). This view isolates the dessert-to-box-lunch relationship.

**View `v_box_lunch_wrap`**

```sql
CREATE VIEW v_box_lunch_wrap AS
SELECT a.id, a.lunch_id, a.lunch_name, a.price, b.wrap_id AS wrap_wrap_id, b.wrap_name AS wrap_wrap_name, b.price AS wrap_price
FROM box_lunches a JOIN wraps b ON a.wrap_id = b.wrap_id;
```

| id | lunch_id | lunch_name | price | wrap_wrap_id | wrap_wrap_name | wrap_price |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-3 | Extended Framework | 12.87 | 1000 | Primary Survey A | 12.87 |
| 2 | 4920 | Pilot Protocol A | 35.45 | 1001 | Composite Corridor | 35.45 |
| 3 | lu_tax_code_template_m32 | Baseline Programme | 29.24 | 1002 | Compact Series | 29.24 |
| 4 | 209212 | Distributed Standard | 29.99 | 1003 | Legacy Assessment D | 29.99 |

`v_box_lunch_wrap` joins `box_lunches` with `wraps` on `box_lunches.wrap_id = wraps.id`. It answers: "What wrap is included in each box lunch?" A sample row shows box lunch 1 ("Extended Framework", price 12.87, available) containing wrap 1000. This view is the primary projection for box lunch wrap composition.

**View `v_box_lunch_side_item`**

```sql
CREATE VIEW v_box_lunch_side_item AS
SELECT a.id, a.lunch_id, a.lunch_name, a.price, b.side_id AS item_side_id, b.side_name AS item_side_name, b.price AS item_price
FROM box_lunches a JOIN side_items b ON a.side_item_side_id = b.side_id;
```

| id | lunch_id | lunch_name | price | item_side_id | item_side_name | item_price |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-3 | Extended Framework | 12.87 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | 12.87 |
| 2 | 4920 | Pilot Protocol A | 35.45 | 937737 | Extended Standard | 35.45 |
| 3 | lu_tax_code_template_m32 | Baseline Programme | 29.24 | 6564389 | Pilot Framework | 29.24 |
| 4 | 209212 | Distributed Standard | 29.99 | 103178 | Baseline Protocol D | 29.99 |

`v_box_lunch_side_item` joins `box_lunches` with `side_items` on `box_lunches.side_item_side_id = side_items.side_id`. It answers: "What side is included in each box lunch?" A sample row shows box lunch 1 ("Extended Framework") with side "Integrated Programme A" (type `chips`, price 12.87, available). This view isolates the side attachment for box lunches.

**View `v_box_lunch_dessert`**

```sql
CREATE VIEW v_box_lunch_dessert AS
SELECT a.id, a.lunch_id, a.lunch_name, a.price, b.id AS dessert_id, b.dessert_id AS dessert_dessert_id, b.dessert_name AS dessert_dessert_name
FROM box_lunches a JOIN desserts b ON a.dessert_id = b.id;
```

| id | lunch_id | lunch_name | price | dessert_id | dessert_dessert_id | dessert_dessert_name |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-3 | Extended Framework | 12.87 | 1 | L486 | Integrated Framework A |
| 2 | 4920 | Pilot Protocol A | 35.45 | 2 | a0f8b44e-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol |
| 3 | lu_tax_code_template_m32 | Baseline Programme | 29.24 | 3 | 7119779 | Pilot Programme |
| 4 | 209212 | Distributed Standard | 29.99 | 4 | 1437585 | Baseline Standard D |

`v_box_lunch_dessert` joins `box_lunches` with `desserts` on `box_lunches.dessert_id = desserts.id`. It answers: "What dessert is included in each box lunch?" A sample row shows box lunch 1 ("Extended Framework") with dessert "Integrated Framework A" (type `cookie`, price 12.87, available). This view isolates the dessert attachment for box lunches.

**View `v_wrap_box_lunch`**

```sql
CREATE VIEW v_wrap_box_lunch AS
SELECT a.wrap_id, a.wrap_name, a.price, a.main_ingredient, b.id AS lunch_id, b.lunch_id AS lunch_lunch_id, b.lunch_name AS lunch_lunch_name
FROM wraps a JOIN box_lunches b ON a.box_lunch_id = b.id;
```

| wrap_id | wrap_name | price | main_ingredient | lunch_id | lunch_lunch_id | lunch_lunch_name |
|---|---|---|---|---|---|---|
| 1000 | Primary Survey A | 12.87 | chicken | 1 | b_VB-IC-3 | Extended Framework |
| 1001 | Composite Corridor | 35.45 | beef | 2 | 4920 | Pilot Protocol A |
| 1002 | Compact Series | 29.24 | chicken | 3 | lu_tax_code_template_m32 | Baseline Programme |
| 1003 | Legacy Assessment D | 29.99 | beef | 4 | 209212 | Distributed Standard |

`v_wrap_box_lunch` joins `wraps` with `box_lunches` on `wraps.id = box_lunches.wrap_id`. It answers: "Which box lunch contains each wrap?" A sample row shows wrap 1000 contained in box lunch 1 ("Extended Framework", price 12.87, available). This view is the inverse of `v_box_lunch_wrap`, useful when querying from the wrap perspective upward to the box lunch.

**View `v_wrap_ingredient_detail`**

```sql
CREATE VIEW v_wrap_ingredient_detail AS
SELECT a.wrap_id, a.wrap_name, a.price, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.ingredient_name AS ingredient_ingredient_name
FROM wraps a
  JOIN wraps_ingredients j ON j.wrap_id = a.wrap_id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| wrap_id | wrap_name | price | ingredient_id | ingredient_ingredient_id | ingredient_ingredient_name |
|---|---|---|---|---|---|
| 1000 | Primary Survey A | 12.87 | 1 | 1450638 | Pilot Assessment |
| 1000 | Primary Survey A | 12.87 | 2 | 5844284 | Baseline Survey |
| 1001 | Composite Corridor | 35.45 | 2 | 5844284 | Baseline Survey |
| 1001 | Composite Corridor | 35.45 | 3 | template_ivacode_pagata_20det40ind | Distributed Corridor A |
| 1002 | Compact Series | 29.24 | 3 | template_ivacode_pagata_20det40ind | Distributed Corridor A |
| 1002 | Compact Series | 29.24 | 4 | 2087735 | Adaptive Series |
| 1003 | Legacy Assessment D | 29.99 | 4 | 2087735 | Adaptive Series |
| 1003 | Legacy Assessment D | 29.99 | 1 | 1450638 | Pilot Assessment |

`v_wrap_ingredient_detail` joins `wraps` with `ingredients` through the `wraps_ingredients` junction table. It answers: "What ingredients are in each wrap?" A sample row might show wrap 1000 containing a specific ingredient with its quantity and preparation notes. This view is the primary projection for wrap ingredient composition queries.

**View `v_ingredient_wrap`**

```sql
CREATE VIEW v_ingredient_wrap AS
SELECT a.id, a.ingredient_id, a.ingredient_name, a.type, b.wrap_id AS wrap_wrap_id, b.wrap_name AS wrap_wrap_name, b.price AS wrap_price
FROM ingredients a JOIN wraps b ON a.wrap_id = b.wrap_id;
```

| id | ingredient_id | ingredient_name | type | wrap_wrap_id | wrap_wrap_name | wrap_price |
|---|---|---|---|---|---|---|
| 1 | 1450638 | Pilot Assessment | meat | 1000 | Primary Survey A | 12.87 |
| 2 | 5844284 | Baseline Survey | cheese | 1001 | Composite Corridor | 35.45 |
| 3 | template_ivacode_pagata_20det40ind | Distributed Corridor A | vegetable | 1002 | Compact Series | 29.24 |
| 4 | 2087735 | Adaptive Series | sauce | 1003 | Legacy Assessment D | 29.99 |

`v_ingredient_wrap` joins `ingredients` with `wraps` through the `wraps_ingredients` junction table. It answers: "Which wraps contain each ingredient?" A sample row might show ingredient "chicken breast" appearing in wrap 1000. This view is the inverse of `v_wrap_ingredient_detail`, useful for ingredient usage analysis across wraps.

**View `v_ingredient_platter_item`**

```sql
CREATE VIEW v_ingredient_platter_item AS
SELECT a.id, a.ingredient_id, a.ingredient_name, a.type, b.platter_item_id AS item_platter_item_id, b.item_id AS item_item_id, b.item_name AS item_item_name
FROM ingredients a JOIN platter_items b ON a.platter_item_id = b.platter_item_id;
```

| id | ingredient_id | ingredient_name | type | item_platter_item_id | item_item_id | item_item_name |
|---|---|---|---|---|---|---|
| 1 | 1450638 | Pilot Assessment | meat | 1000 | ITE-2792 | Seasonal Survey |
| 2 | 5844284 | Baseline Survey | cheese | 1001 | ITE-2795 | Integrated Corridor |
| 3 | template_ivacode_pagata_20det40ind | Distributed Corridor A | vegetable | 1002 | ITE-2798 | Extended Series D |
| 4 | 2087735 | Adaptive Series | sauce | 1003 | ITE-2801 | Pilot Assessment |

`v_ingredient_platter_item` joins `ingredients` with `platter_items` through the `platters_items` junction table. It answers: "Which platter items contain each ingredient?" A sample row might show ingredient "seasonal vegetables" appearing in platter item "Seasonal Survey" (category `sandwich`, quantity 9). This view connects the ingredient level of detail up through the platter item layer, enabling cross-family ingredient analysis.

The schema as a whole demonstrates a disciplined normalisation strategy: header-level metadata is separated from line-item composition, optional attachments (sides, beverages, desserts) are stored in their own tables with dual foreign keys to support sharing across product families, and many-to-many relationships (platter-to-items, wrap-to-ingredients) are mediated by junction tables. The materialised views then provide denormalised projections that answer specific business questions without requiring ad-hoc joins at query time. Each view corresponds to a particular foreign-key path in the schema, and reading a row from a view is equivalent to following the foreign key chain from one entity to its related entity and projecting the combined attributes. This design supports both the integrity guarantees of normalisation and the query convenience of denormalisation, with the views serving as the bridge between the two paradigms.