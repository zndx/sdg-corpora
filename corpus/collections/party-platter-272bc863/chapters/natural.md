# Catering Operations and Meal Assembly Reference

The modern catering operation manages two primary fulfillment channels: party platters assembled for group events and box lunches prepared for individual distribution. Each channel follows a structured assembly process where core meal components are paired with complementary sides, beverages, and desserts. The records below capture every stage of this pipeline—from the initial platter or lunch configuration through the granular ingredient level—providing a complete audit trail for inventory, pricing, and availability tracking.

**Table `party_platters`**

| id | platter_id | serves_count | base_price | epic_price | status | last_updated | side_item_side_id | beverage_id | dessert_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 15134 | 45 | 12.72 | 12.34 | available | 2023-06-17T17:27:00 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 884345 | 1 |
| 1001 | 9568453 | 31 | 12.87 | 19.97 | unavailable | 2024-11-01T00:44:00 | 937737 | 4447029 | 2 |
| 1002 | lu_tax_code_template_b_VB-IC-Tab | 0 | 17.41 | 27.02 | available | 2025-04-12T07:01:00 | 6564389 | 2002007020170 | 3 |
| 1003 | 10207157 | 5 | 18.59 | 36.43 | unavailable | 2022-09-23T14:18:00 | 103178 | 3158148 | 4 |

Party platters represent the primary event-ordering construct. Each row identifies a distinct platter configuration through a composite key (`id` and `platter_id`), specifies the headcount it serves (`serves_count`), and carries two price points: a standard `base_price` and an `epic_price` that may reflect promotional or volume-adjusted rates. The `status` column gates availability, toggling between `available` and `unavailable`. Timestamps in `last_updated` record the most recent modification. A platter such as `id` 1000, configured for 45 guests at a base price of 12.72, links to a specific side item (`ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), beverage (`884345`), and dessert (`1`), establishing the default accompaniments for that event order.

**Table `platter_items`**

| platter_item_id | item_id | item_name | quantity | category | is_crispy | is_grilled | party_platter_id |
|---|---|---|---|---|---|---|---|
| 1000 | ITE-2792 | Seasonal Survey | 9 | sandwich | false | false | 1000 |
| 1001 | ITE-2795 | Integrated Corridor | 8 | chicken | true | true | 1001 |
| 1002 | ITE-2798 | Extended Series D | 0 | beef | false | false | 1002 |
| 1003 | ITE-2801 | Pilot Assessment | 12 | catfish | true | true | 1003 |

The actual food items that populate a party platter are recorded in `platter_items`. Each entry carries a unique `platter_item_id`, an internal `item_id` (e.g., `ITE-2792`), a human-readable `item_name` such as "Seasonal Survey," a `quantity` indicating how many units of that item belong on the platter, and a `category` (sandwich, chicken, beef, catfish). Boolean flags `is_crispy` and `is_grilled` capture preparation attributes. The `party_platter_id` column ties each item back to its parent platter. For instance, platter 1000 includes nine units of "Seasonal Survey" (category: sandwich, neither crispy nor grilled), while platter 1003 carries twelve units of "Pilot Assessment" (category: catfish, both crispy and grilled).

**Table `side_items`**

| side_id | side_name | price | type | is_available | party_platter_id | box_lunch_id |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | 12.87 | chips | true | 1000 | 1 |
| 937737 | Extended Standard | 35.45 | coleslaw | false | 1001 | 2 |
| 6564389 | Pilot Framework | 29.24 | fruit | true | 1002 | 3 |
| 103178 | Baseline Protocol D | 29.99 | salad | false | 1003 | 4 |

Side dishes are cataloged in `side_items`, where each row defines a `side_id`, a descriptive `side_name`, a `price`, a `type` (chips, coleslaw, fruit, salad), and an `is_available` flag. The `party_platter_id` and `box_lunch_id` columns indicate which order types reference this side. The side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, named "Integrated Programme A," is a chips-type accompaniment priced at 12.87 and is currently available for party platter 1000 and box lunch 1.

**Table `beverages`**

| beverage_id | beverage_name | price | type | is_available | party_platter_id | box_lunch_id |
|---|---|---|---|---|---|---|
| 884345 | Compact Initiative | 12.87 | soft_drink | true | 1000 | 1 |
| 4447029 | Legacy Model | 35.45 | water | false | 1001 | 2 |
| 2002007020170 | Regional Cluster A | 29.24 | juice | true | 1002 | 3 |
| 3158148 | Seasonal Review | 29.99 | soft_drink | false | 1003 | 4 |

Beverage options follow the same structural pattern in `beverages`. Each record holds a `beverage_id`, `beverage_name`, `price`, `type` (soft_drink, water, juice), and `is_available` status, along with foreign references to `party_platter_id` and `box_lunch_id`. Beverage `884343`, "Compact Initiative," is a soft drink at 12.87, available for party platter 1000 and box lunch 1.

**Table `desserts`**

| id | dessert_id | dessert_name | price | type | is_available | party_platter_id | box_lunch_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | L486 | Integrated Framework A | 12.87 | cookie | true | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | a0f8b44e-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol | 35.45 | brownie | false | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7119779 | Pilot Programme | 29.24 | cookie | true | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1437585 | Baseline Standard D | 29.99 | brownie | false | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Desserts are stored in `desserts` with fields `dessert_id`, `dessert_name`, `price`, `type` (cookie, brownie), `is_available`, and the same dual foreign-key columns for party platters and box lunches. The dessert `L486`, "Integrated Framework A," is a cookie priced at 12.87, available for party platter 1000 and box lunch 1.

**Table `box_lunches`**

| id | lunch_id | lunch_name | price | status | last_updated | wrap_id | side_item_side_id | dessert_id |
|---|---|---|---|---|---|---|---|---|
| 1 | b_VB-IC-3 | Extended Framework | 12.87 | available | 2023-06-17T17:27:00 | 1000 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 1 |
| 2 | 4920 | Pilot Protocol A | 35.45 | unavailable | 2024-11-01T00:44:00 | 1001 | 937737 | 2 |
| 3 | lu_tax_code_template_m32 | Baseline Programme | 29.24 | available | 2025-04-12T07:01:00 | 1002 | 6564389 | 3 |
| 4 | 209212 | Distributed Standard | 29.99 | unavailable | 2022-09-23T14:18:00 | 1003 | 103178 | 4 |

Box lunches mirror party platters as the second major order type. Each row in `box_lunches` carries an `id`, a `lunch_id`, a `lunch_name`, a `price`, a `status`, and a `last_updated` timestamp. A box lunch references a `wrap_id` (the core sandwich component), a `side_item_side_id`, and a `dessert_id`. Lunch `id` 1, named "Extended Framework," is priced at 12.87, currently available, and links to wrap 1000, side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, and dessert `1`.

**Table `wraps`**

| wrap_id | wrap_name | price | main_ingredient | is_available | box_lunch_id |
|---|---|---|---|---|---|
| 1000 | Primary Survey A | 12.87 | chicken | true | 1 |
| 1001 | Composite Corridor | 35.45 | beef | false | 2 |
| 1002 | Compact Series | 29.24 | chicken | true | 3 |
| 1003 | Legacy Assessment D | 29.99 | beef | false | 4 |

The core component of a box lunch is the wrap, recorded in `wraps`. Each wrap carries a `wrap_id`, a `wrap_name`, a `price`, a `type` (chicken, beef, turkey, veggie), and an `is_available` flag. Wrap `1000`, "Seasonal Wrap," is a chicken-type wrap priced at 12.87 and is available.

**Table `ingredients`**

| id | ingredient_id | ingredient_name | type | is_organic | is_certified | wrap_id | platter_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Pilot Assessment | meat | false | true | 1000 | 1000 |
| 2 | 5844284 | Baseline Survey | cheese | true | false | 1001 | 1001 |
| 3 | template_ivacode_pagata_20det40ind | Distributed Corridor A | vegetable | false | true | 1002 | 1002 |
| 4 | 2087735 | Adaptive Series | sauce | true | false | 1003 | 1003 |

At the most granular level, `ingredients` captures the component ingredients that compose each wrap. Each ingredient has an `ingredient_id`, an `ingredient_name`, a `price`, a `type` (protein, vegetable, condiment, bread), and an `is_available` flag. The `wrap_id` column links the ingredient to its parent wrap.

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

The junction table `platters_items` resolves the many-to-many relationship between party platters and platter items. Each row pairs a `party_platter_id` with a `platter_item_id`, confirming that a specific food item is included in a specific platter configuration.

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

Similarly, `wraps_ingredients` links wraps to their constituent ingredients, pairing a `wrap_id` with an `ingredient_id` to document the recipe composition of each wrap.

## Party Platter Detail Views

The first set of views enriches party platter records by joining their associated items, sides, beverages, and desserts into single, queryable result sets. These views answer the operational question: "What exactly does this party platter order contain, in full?"

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

The view `v_party_platter_platter_item_detail` joins `party_platters` with `platter_items` on the platter identifier, producing a single row per platter-item combination. Reading row `id` 1000, the view reveals that platter 15134, serving 45 guests at a base price of 12.72, includes the item "Seasonal Survey" (item_id `ITE-2792`, quantity 9, category sandwich). Row `id` 1003 shows platter 10207157, serving only 5 guests at 18.59, carrying "Pilot Assessment" (item_id `ITE-2801`, quantity 12, category catfish, both crispy and grilled). This view is the primary tool for event planners verifying the exact food composition of any given platter order.

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

`v_party_platter_side_item` joins `party_platters` with `side_items`, answering which side dish accompanies each party platter. Row `id` 1000 pairs platter 15134 with side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Integrated Programme A," type chips, price 12.87, available). Row `id` 1001 links platter 9568453 to side `937737` ("Extended Standard," type coleslaw, price 35.45, unavailable). The view enables quick auditing of side-dish allocation across all active platter orders.

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

`v_party_platter_beverage` joins `party_platters` with `beverages`, revealing the beverage assigned to each platter. Row `id` 1000 shows platter 15134 paired with beverage `884345` ("Compact Initiative," type soft_drink, price 12.87, available). Row `id` 1002 links platter `lu_tax_code_template_b_VB-IC-Tab` to beverage `2002007020170` ("Regional Cluster A," type juice, price 29.24, available). This view supports beverage inventory reconciliation and ensures that each event has a confirmed drink allocation.

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

`v_party_platter_dessert` joins `party_platters` with `desserts`, exposing the dessert component of each platter. Row `id` 1000 associates platter 15134 with dessert `L486` ("Integrated Framework A," type cookie, price 12.87, available). Row `id` 1001 links platter 9568453 to dessert `a0f8b44e-8fcd-11eb-924d-9cd76263cbd0` ("Extended Protocol," type brownie, price 35.45, unavailable). The view is essential for dessert procurement and for confirming that each event has a confirmed sweet course.

## Reverse Lookup Views

The next set of views inverts the relationship: starting from an item, side, beverage, or dessert, these views identify which party platters reference them. They answer the question: "Which events are using this particular component?"

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

`v_platter_item_party_platter` joins `platter_items` with `party_platters`, producing a row for each platter-item pairing with full platter context. Row `id` 1000 shows that item "Seasonal Survey" (`ITE-2792`, quantity 9, category sandwich) is used in party platter 15134, which serves 45 guests at a base price of 12.72 and is currently available. Row `id` 1003 reveals that "Pilot Assessment" (`ITE-2801`, quantity 12, category catfish) appears in platter 10207157, serving 5 guests at 18.59, currently unavailable. This view supports demand forecasting for individual menu items.

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

`v_side_item_party_platter` joins `side_items` with `party_platters`, identifying which party platters reference each side dish. Row `id` 1000 shows side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Integrated Programme A," type chips, price 12.87, available) is assigned to party platter 15134. Row `id` 1001 links side `937737` ("Extended Standard," type coleslaw, price 35.45, unavailable) to platter 9568453. This view is useful for side-dish inventory planning and for identifying which events would be affected if a side becomes unavailable.

## Box Lunch Composition Views

Box lunches follow the same compositional logic as party platters but include an additional layer: the wrap. The views below join box lunches with their wraps, sides, beverages, and desserts, providing a complete picture of each lunch order.

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

`v_side_item_box_lunch` joins `side_items` with `box_lunches`, revealing which side dish accompanies each box lunch. Row `id` 1 shows side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Integrated Programme A," type chips, price 12.87, available) paired with box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available). Row `id` 2 links side `937737` ("Extended Standard," type coleslaw, price 35.45, unavailable) to lunch `4920` ("Pilot Protocol A," price 35.45, unavailable). This view supports side-dish allocation across the box lunch channel.

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

`v_beverage_party_platter` joins `beverages` with `party_platters`, identifying which beverage is assigned to each party platter. Row `id` 1000 shows beverage `884345` ("Compact Initiative," type soft_drink, price 12.87, available) assigned to party platter 15134. Row `id` 1002 links beverage `2002007020170` ("Regional Cluster A," type juice, price 29.24, available) to platter `lu_tax_code_template_b_VB-IC-Tab`. This view supports beverage procurement and ensures that each event has a confirmed drink allocation.

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

`v_beverage_box_lunch` joins `beverages` with `box_lunches`, revealing the beverage assigned to each box lunch. Row `id` 1 pairs beverage `884345` ("Compact Initiative," type soft_drink, price 12.87, available) with box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available). Row `id` 2 links beverage `4447029` ("Legacy Model," type water, price 35.45, unavailable) to lunch `4920` ("Pilot Protocol A," price 35.45, unavailable). This view is essential for beverage inventory reconciliation across the box lunch channel.

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

`v_dessert_party_platter` joins `desserts` with `party_platters`, exposing the dessert component of each platter. Row `id` 1000 associates platter 15134 with dessert `L486` ("Integrated Framework A," type cookie, price 12.87, available). Row `id` 1001 links platter 9568453 to dessert `a0f8b44e-8fcd-11eb-924d-9cd76263cbd0` ("Extended Protocol," type brownie, price 35.45, unavailable). This view supports dessert procurement and ensures that each event has a confirmed sweet course.

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

`v_dessert_box_lunch` joins `desserts` with `box_lunches`, revealing the dessert assigned to each box lunch. Row `id` 1 pairs dessert `L486` ("Integrated Framework A," type cookie, price 12.87, available) with box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available). Row `id` 2 links dessert `a0f8b44e-8fcd-11eb-924d-9cd76263cbd0` ("Extended Protocol," type brownie, price 35.45, unavailable) to lunch `4920` ("Pilot Protocol A," price 35.45, unavailable). This view is essential for dessert inventory management across the box lunch channel.

## Wrap and Ingredient Views

The box lunch wrap introduces a second layer of compositional detail. The views below join box lunches with their wraps, and wraps with their ingredients, enabling full traceability from the finished lunch down to individual ingredients.

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

`v_box_lunch_wrap` joins `box_lunches` with `wraps`, revealing which wrap is included in each box lunch. Row `id` 1 shows box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available) paired with wrap `1000` ("Seasonal Wrap," type chicken, price 12.87, available). Row `id` 2 links lunch `4920` ("Pilot Protocol A," price 35.45, unavailable) to wrap `1001` ("Integrated Wrap," type beef, price 35.45, unavailable). This view is the primary tool for verifying the core protein component of each lunch order.

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

`v_box_lunch_side_item` joins `box_lunches` with `side_items`, revealing the side dish included in each box lunch. Row `id` 1 pairs box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available) with side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Integrated Programme A," type chips, price 12.87, available). Row `id` 2 links lunch `4920` ("Pilot Protocol A," price 35.45, unavailable) to side `937737` ("Extended Standard," type coleslaw, price 35.45, unavailable). This view supports side-dish allocation across the box lunch channel.

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

`v_box_lunch_dessert` joins `box_lunches` with `desserts`, revealing the dessert included in each box lunch. Row `id` 1 pairs box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available) with dessert `L486` ("Integrated Framework A," type cookie, price 12.87, available). Row `id` 2 links lunch `4920` ("Pilot Protocol A," price 35.45, unavailable) to dessert `a0f8b44e-8fcd-11eb-924d-9cd76263cbd0` ("Extended Protocol," type brownie, price 35.45, unavailable). This view supports dessert procurement for the box lunch channel.

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

`v_wrap_box_lunch` joins `wraps` with `box_lunches`, identifying which box lunches reference each wrap. Row `id` 1 shows wrap `1000` ("Seasonal Wrap," type chicken, price 12.87, available) used in box lunch `b_VB-IC-3` ("Extended Framework," price 12.87, available). Row `id` 2 links wrap `1001` ("Integrated Wrap," type beef, price 35.45, unavailable) to lunch `4920` ("Pilot Protocol A," price 35.45, unavailable). This view supports wrap-level demand forecasting and inventory planning.

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

`v_wrap_ingredient_detail` joins `wraps` with `ingredients`, producing a row for each wrap-ingredient combination with full wrap context. Row `id` 1 shows wrap `1000` ("Seasonal Wrap," type chicken, price 12.87, available) containing ingredient `ING-001` ("Organic Greens," type vegetable, price 2.50, available). Row `id` 2 links wrap `1001` ("Integrated Wrap," type beef, price 35.45, unavailable) to ingredient `ING-002` ("Grilled Chicken Breast," type protein, price 8.75, available). This view is the primary tool for recipe verification and ingredient-level cost calculation.

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

`v_ingredient_wrap` joins `ingredients` with `wraps`, identifying which wraps use each ingredient. Row `id` 1 shows ingredient `ING-001` ("Organic Greens," type vegetable, price 2.50, available) used in wrap `1000` ("Seasonal Wrap," type chicken, price 12.87, available). Row `id` 2 links ingredient `ING-002` ("Grilled Chicken Breast," type protein, price 8.75, available) to wrap `1001` ("Integrated Wrap," type beef, price 35.45, unavailable). This view supports ingredient procurement and allergen tracking.

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

`v_ingredient_platter_item` joins `ingredients` with `platter_items`, identifying which platter items reference each ingredient. Row `id` 1 shows ingredient `ING-001` ("Organic Greens," type vegetable, price 2.50, available) used in platter item `ITE-2792` ("Seasonal Survey," quantity 9, category sandwich). Row `id` 2 links ingredient `ING-002` ("Grilled Chicken Breast," type protein, price 8.75, available) to platter item `ITE-2795` ("Integrated Corridor," quantity 8, category chicken). This view supports ingredient-level demand forecasting across both the party platter and box lunch channels.

## Synthesis

The catering data model captures a two-tiered fulfillment operation. Party platters and box lunches serve as the top-level order constructs, each referencing a set of complementary components—platter items, wraps, sides, beverages, and desserts. Junction tables (`platters_items` and `wraps_ingredients`) resolve the many-to-many relationships between orders and their constituent parts. The views provide bidirectional traceability: from order to component and from component back to order—enabling event planners, procurement staff, and kitchen teams to verify compositions, audit availability, and forecast demand at every level of the assembly chain.