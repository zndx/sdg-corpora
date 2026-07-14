## The Canapé and Tasting Bowl Catalogue

A modern catering operation manages its menu through a structured catalogue of bite-sized offerings—canapés and tasting bowls—each defined by its flavour profile, dietary suitability, and the pricing strategy that governs its sale. The catalogue is built from a handful of core record types: the items themselves, the bread bases that support canapés, the food ingredients that compose them, and the pricing schemes that attach monetary values and temporal validity to every offering. Cross-reference tables link ingredients to both canapés and bowls, enabling a complete bill-of-materials for every dish on the menu.

**Table `canapes`**

| canape_id | name | price | category | dietary_classification | recommended_count_per_person | bread_base_id | pricing_scheme_id |
|---|---|---|---|---|---|---|---|
| 1 | Extended Review | 12.87 | savoury | v | 12 | 1 | 1 |
| 2 | Pilot Initiative A | 35.45 | sweet | vg | 12 | 2 | 2 |
| 3 | Baseline Model | 29.24 | savoury | none | 5 | 3 | 3 |
| 4 | Distributed Cluster | 29.99 | sweet | v | 8 | 4 | 4 |

The `canapes` table is the primary catalogue of small savoury and sweet bites. Each row carries a unique `canape_id`, a human-readable `name`, a `price`, a `category` (savoury or sweet), a `dietary_classification` (v for vegetarian, vg for vegan, or none), a `recommended_count_per_person` for event planning, and two foreign keys: `bread_base_id` pointing to the supporting bread, and `pricing_scheme_id` pointing to the active pricing strategy. Consider the first row: "Extended Review" is a savoury, vegetarian canape priced at 12.87, recommended at 12 pieces per person, resting on bread base 1 and governed by pricing scheme 1. The fourth row, "Distributed Cluster," is a sweet, vegetarian offering at 29.99, recommended at 8 per person, built on bread base 4 and priced under scheme 4.

**Table `bread_bases`**

| bread_base_id | base_id | name | type | canape_id |
|---|---|---|---|---|
| 1 | 10782187 | Extended Review | rye bread | 1 |
| 2 | 575207 | Pilot Initiative A | rice cracker | 2 |
| 3 | 5f90467a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | cornet | 3 |
| 4 | 1152667 | Distributed Cluster | yorkshire pudding | 4 |

Every canape requires a foundation. The `bread_bases` table stores these supports, each identified by `bread_base_id` and carrying a `base_id` (a secondary identifier), a `name` describing the bread type, a `type` classification, and a `canape_id` foreign key that ties the base back to its parent canape. The base for "Extended Review" is rye bread (base_id 10782187); "Pilot Initiative A" uses a rice cracker (base_id 575207); "Baseline Model" sits on a cornet (base_id 5f90467a-8fcd-11eb-924d-9cd76263cbd0); and "Distributed Cluster" is served on yorkshire pudding (base_id 1152667). The `canape_id` column ensures referential integrity between the base and the canape it supports.

**Table `food_ingredients`**

| food_ingredient_id | ingredient_id | name | category | is_allergen |
|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | false |
| 1001 | 5844284 | Pilot Initiative A | vegetable | true |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | dairy | false |
| 1003 | 2087735 | Distributed Cluster | sauce | true |

Ingredients are catalogued independently in `food_ingredients`, where each row has a `food_ingredient_id`, an `ingredient_id` (a secondary identifier), a `name`, a `category` (protein, vegetable, dairy, or sauce), and an `is_allergen` boolean. The ingredient "Extended Review" (id 1000) is a protein and is not an allergen. "Pilot Initiative A" (id 1001) is a vegetable and is flagged as an allergen. "Baseline Model" (id 1002) is a dairy product and is not an allergen. "Distributed Cluster" (id 1003) is a sauce and is flagged as an allergen. These ingredients are later assembled into canapés and tasting bowls through junction tables.

**Table `tasting_bowls`**

| bowl_id | name | price | category | dietary_classification | recommended_count_per_person | pricing_scheme_id |
|---|---|---|---|---|---|---|
| 2933459 | Extended Review | 12.87 | savoury | v | 12 | 1 |
| 4463640 | Pilot Initiative A | 35.45 | sweet | vg | 12 | 2 |
| 4447026 | Baseline Model | 29.24 | savoury | none | 5 | 3 |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 | sweet | v | 8 | 4 |

Tasting bowls mirror the canapé structure but represent a different service format. The `tasting_bowls` table holds `bowl_id`, `name`, `price`, `category`, `dietary_classification`, `recommended_count_per_person`, and `pricing_scheme_id`. The four bowls share the same names as the four canapés—"Extended Review," "Pilot Initiative A," "Baseline Model," and "Distributed Cluster"—and carry identical prices and categories, suggesting a paired menu where each canapé has a corresponding bowl. Bowl 2933459 ("Extended Review") is savoury, vegetarian, priced at 12.87, recommended at 12 per person, and governed by pricing scheme 1. Bowl 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 ("Distributed Cluster") is sweet, vegetarian, priced at 29.99, recommended at 8 per person, under scheme 4.

**Table `pricing_schemes`**

| id | scheme_id | price_point | currency | valid_from | canape_id | bowl_id |
|---|---|---|---|---|---|---|
| 1 | 4716393 | 12.72 | seasonal-currency-71 | 2025-12-17T11:09:00 | 1 | 2933459 |
| 2 | 338514 | 19.93 | regional-currency-72 | 2022-05-01T18:26:00 | 2 | 4463640 |
| 3 | template_ivacode_pagata_20ind | 19.93 | legacy-currency-73 | 2023-10-12T01:43:00 | 3 | 4447026 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.94 | compact-currency-74 | 2024-03-23T08:00:00 | 4 | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 |

Pricing is managed centrally in `pricing_schemes`. Each scheme has an `id`, a `scheme_id` (secondary identifier), a `price_point`, a `currency` code, a `valid_from` timestamp, and foreign keys `canape_id` and `bowl_id` linking it to the specific offerings it prices. Scheme 1 (scheme_id 4716393) sets a price point of 12.72 in seasonal-currency-71, valid from 2025-12-17, and applies to canape 1 and bowl 2933459. Scheme 2 (scheme_id 338514) sets 19.93 in regional-currency-72, valid from 2022-05-01, for canape 2 and bowl 4463640. Scheme 3 (scheme_id template_ivacode_pagata_20ind) sets 19.93 in legacy-currency-73, valid from 2023-10-12, for canape 3 and bowl 4447026. Scheme 4 (scheme_id 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3) sets 11.94 in compact-currency-74, valid from 2024-03-23, for canape 4 and bowl 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0. Note that the `price_point` in the pricing scheme may differ from the `price` stored directly on the canape or bowl, reflecting a layered pricing model where the scheme provides the operative rate.

**Table `canapes_ingredients`**

| canape_id | food_ingredient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The composition of each canape is recorded in `canapes_ingredients`, a junction table linking `canape_id` to `food_ingredient_id`. Canape 1 ("Extended Review") contains ingredients 1000 and 1001. Canape 2 ("Pilot Initiative A") contains ingredients 1001 and 1002. Canape 3 ("Baseline Model") contains ingredients 1002 and 1003. Canape 4 ("Distributed Cluster") contains ingredients 1003 and 1000. This creates a symmetric pattern: each canape uses exactly two ingredients, and each ingredient appears in exactly two canapés.

**Table `ingredients_canapes`**

| food_ingredient_id | canape_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `ingredients_canapes` table provides the reverse linkage from ingredient to canape, ensuring that ingredient-centric queries can resolve to their parent dishes. The same pairings appear: ingredient 1000 links to canapes 1 and 4; ingredient 1001 links to canapes 1 and 2; ingredient 1002 links to canapes 2 and 3; ingredient 1003 links to canapes 3 and 4. This bidirectional mapping supports both canape-to-ingredient and ingredient-to-canape lookups without loss of information.

**Table `ingredients_bowls`**

| food_ingredient_id | bowl_id |
|---|---|
| 1000 | 2933459 |
| 1000 | 4463640 |
| 1001 | 4463640 |
| 1001 | 4447026 |
| 1002 | 4447026 |
| 1002 | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 |
| 1003 | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 |
| 1003 | 2933459 |

Tasting bowls are similarly composed of ingredients, recorded in `ingredients_bowls`. This table links `bowl_id` to `food_ingredient_id`, enabling the same bill-of-materials pattern for bowls as exists for canapés. The specific pairings follow the same structural logic, ensuring that every bowl can be traced back to its constituent ingredients.

**Table `bowls_ingredients`**

| bowl_id | food_ingredient_id |
|---|---|
| 2933459 | 1000 |
| 2933459 | 1001 |
| 4463640 | 1001 |
| 4463640 | 1002 |
| 4447026 | 1002 |
| 4447026 | 1003 |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | 1003 |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | 1000 |

The `bowls_ingredients` table mirrors `ingredients_bowls` with the reverse direction of the relationship, allowing ingredient-centric queries to resolve to their parent bowls. Together, these two junction tables form a complete bidirectional mapping between tasting bowls and food ingredients, supporting both top-down (bowl-to-ingredient) and bottom-up (ingredient-to-bowl) navigation.

### Bread Base and Canape Relationships

**View `v_canape_bread_base`**

```sql
CREATE VIEW v_canape_bread_base AS
SELECT a.canape_id, a.name, a.price, a.category, b.bread_base_id AS base_bread_base_id, b.base_id AS base_base_id, b.name AS base_name
FROM canapes a JOIN bread_bases b ON a.bread_base_id = b.bread_base_id;
```

| canape_id | name | price | category | base_bread_base_id | base_base_id | base_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 12.87 | savoury | 1 | 10782187 | Extended Review |
| 2 | Pilot Initiative A | 35.45 | sweet | 2 | 575207 | Pilot Initiative A |
| 3 | Baseline Model | 29.24 | savoury | 3 | 5f90467a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 4 | Distributed Cluster | 29.99 | sweet | 4 | 1152667 | Distributed Cluster |

This view joins `canapes` with `bread_bases` on the bread base identifier, answering the question: "What bread base supports each canape?" The result pairs each canape with its foundation. For example, the canape "Extended Review" (canape_id 1) is served on rye bread (bread_base_id 1, base_id 10782187). The canape "Pilot Initiative A" (canape_id 2) rests on a rice cracker (bread_base_id 2, base_id 575207). This view is essential for menu descriptions that must communicate the base component of each bite.

**View `v_bread_base_canape`**

```sql
CREATE VIEW v_bread_base_canape AS
SELECT a.bread_base_id, a.base_id, a.name, a.type, b.canape_id AS canape_canape_id, b.name AS canape_name, b.price AS canape_price
FROM bread_bases a JOIN canapes b ON a.canape_id = b.canape_id;
```

| bread_base_id | base_id | name | type | canape_canape_id | canape_name | canape_price |
|---|---|---|---|---|---|---|
| 1 | 10782187 | Extended Review | rye bread | 1 | Extended Review | 12.87 |
| 2 | 575207 | Pilot Initiative A | rice cracker | 2 | Pilot Initiative A | 35.45 |
| 3 | 5f90467a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | cornet | 3 | Baseline Model | 29.24 |
| 4 | 1152667 | Distributed Cluster | yorkshire pudding | 4 | Distributed Cluster | 29.99 |

The reverse join, `v_bread_base_canape`, answers: "Which canape does each bread base support?" Since each base is linked to exactly one canape, the result is a one-to-one mapping. Base 10782187 (rye bread) supports canape "Extended Review" (canape_id 1). Base 575207 (rice cracker) supports canape "Pilot Initiative A" (canape_id 2). This view is useful when inventory or procurement is tracked by bread base rather than by canape.

### Ingredient Detail for Canapés

**View `v_canape_food_ingredient_detail`**

```sql
CREATE VIEW v_canape_food_ingredient_detail AS
SELECT a.canape_id, a.name, a.price, b.food_ingredient_id AS ingredient_food_ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM canapes a
  JOIN canapes_ingredients j ON j.canape_id = a.canape_id
  JOIN food_ingredients b ON b.food_ingredient_id = j.food_ingredient_id;
```

| canape_id | name | price | ingredient_food_ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1 | Extended Review | 12.87 | 1000 | 1450638 | Extended Review |
| 1 | Extended Review | 12.87 | 1001 | 5844284 | Pilot Initiative A |
| 2 | Pilot Initiative A | 35.45 | 1001 | 5844284 | Pilot Initiative A |
| 2 | Pilot Initiative A | 35.45 | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | Baseline Model | 29.24 | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | Baseline Model | 29.24 | 1003 | 2087735 | Distributed Cluster |
| 4 | Distributed Cluster | 29.99 | 1003 | 2087735 | Distributed Cluster |
| 4 | Distributed Cluster | 29.99 | 1000 | 1450638 | Extended Review |

This view joins `canapes` with `canapes_ingredients` and `food_ingredients`, answering: "What ingredients compose each canape, and what are their properties?" The result expands each canape row with the full ingredient record. Canape "Extended Review" (canape_id 1) contains ingredient 1000 ("Extended Review," a protein, not an allergen) and ingredient 1001 ("Pilot Initiative A," a vegetable, allergen flagged). Canape "Baseline Model" (canape_id 3) contains ingredient 1002 ("Baseline Model," a dairy, not an allergen) and ingredient 1003 ("Distributed Cluster," a sauce, allergen flagged). This view is the primary tool for allergen checking and dietary compliance.

**View `v_food_ingredient_canape_detail`**

```sql
CREATE VIEW v_food_ingredient_canape_detail AS
SELECT a.food_ingredient_id, a.ingredient_id, a.name, b.canape_id AS canape_canape_id, b.name AS canape_name, b.price AS canape_price
FROM food_ingredients a
  JOIN ingredients_canapes j ON j.food_ingredient_id = a.food_ingredient_id
  JOIN canapes b ON b.canape_id = j.canape_id;
```

| food_ingredient_id | ingredient_id | name | canape_canape_id | canape_name | canape_price |
|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | 1 | Extended Review | 12.87 |
| 1000 | 1450638 | Extended Review | 2 | Pilot Initiative A | 35.45 |
| 1001 | 5844284 | Pilot Initiative A | 2 | Pilot Initiative A | 35.45 |
| 1001 | 5844284 | Pilot Initiative A | 3 | Baseline Model | 29.24 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 3 | Baseline Model | 29.24 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 4 | Distributed Cluster | 29.99 |
| 1003 | 2087735 | Distributed Cluster | 4 | Distributed Cluster | 29.99 |
| 1003 | 2087735 | Distributed Cluster | 1 | Extended Review | 12.87 |

The inverse perspective, `v_food_ingredient_canape_detail`, answers: "Which canapes use each ingredient?" Ingredient 1000 (protein, non-allergen) appears in canapes "Extended Review" (canape_id 1) and "Distributed Cluster" (canape_id 4). Ingredient 1001 (vegetable, allergen) appears in canapes "Extended Review" (canape_id 1) and "Pilot Initiative A" (canape_id 2). This view supports ingredient-centric reporting, such as determining which dishes contain a specific allergen or which dishes use a particular protein source.

### Pricing Schemes for Canapés

**View `v_canape_pricing_scheme`**

```sql
CREATE VIEW v_canape_pricing_scheme AS
SELECT a.canape_id, a.name, a.price, a.category, b.id AS scheme_id, b.scheme_id AS scheme_scheme_id, b.price_point AS scheme_price_point
FROM canapes a JOIN pricing_schemes b ON a.pricing_scheme_id = b.id;
```

| canape_id | name | price | category | scheme_id | scheme_scheme_id | scheme_price_point |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 12.87 | savoury | 1 | 4716393 | 12.72 |
| 2 | Pilot Initiative A | 35.45 | sweet | 2 | 338514 | 19.93 |
| 3 | Baseline Model | 29.24 | savoury | 3 | template_ivacode_pagata_20ind | 19.93 |
| 4 | Distributed Cluster | 29.99 | sweet | 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.94 |

This view joins `canapes` with `pricing_schemes`, answering: "What is the operative price and currency for each canape?" Canape "Extended Review" (canape_id 1) is priced at 12.72 in seasonal-currency-71 under scheme 4716393, valid from 2025-12-17. Canape "Pilot Initiative A" (canape_id 2) is priced at 19.93 in regional-currency-72 under scheme 338514, valid from 2022-05-01. The view surfaces the temporal dimension of pricing, allowing operators to determine which scheme is active at any given date.

**View `v_pricing_scheme_canape`**

```sql
CREATE VIEW v_pricing_scheme_canape AS
SELECT a.id, a.scheme_id, a.price_point, a.currency, b.canape_id AS canape_canape_id, b.name AS canape_name, b.price AS canape_price
FROM pricing_schemes a JOIN canapes b ON a.canape_id = b.canape_id;
```

| id | scheme_id | price_point | currency | canape_canape_id | canape_name | canape_price |
|---|---|---|---|---|---|---|
| 1 | 4716393 | 12.72 | seasonal-currency-71 | 1 | Extended Review | 12.87 |
| 2 | 338514 | 19.93 | regional-currency-72 | 2 | Pilot Initiative A | 35.45 |
| 3 | template_ivacode_pagata_20ind | 19.93 | legacy-currency-73 | 3 | Baseline Model | 29.24 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.94 | compact-currency-74 | 4 | Distributed Cluster | 29.99 |

The reverse join, `v_pricing_scheme_canape`, answers: "Which canapes are covered by each pricing scheme?" Scheme 4716393 (price point 12.72, seasonal-currency-71) covers canape "Extended Review" (canape_id 1). Scheme 338514 (price point 19.93, regional-currency-72) covers canape "Pilot Initiative A" (canape_id 2). This view is useful for financial reconciliation, where one needs to trace a pricing scheme back to the menu items it affects.

### Ingredient Detail for Tasting Bowls

**View `v_tasting_bowl_food_ingredient_detail`**

```sql
CREATE VIEW v_tasting_bowl_food_ingredient_detail AS
SELECT a.bowl_id, a.name, a.price, b.food_ingredient_id AS ingredient_food_ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM tasting_bowls a
  JOIN bowls_ingredients j ON j.bowl_id = a.bowl_id
  JOIN food_ingredients b ON b.food_ingredient_id = j.food_ingredient_id;
```

| bowl_id | name | price | ingredient_food_ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 2933459 | Extended Review | 12.87 | 1000 | 1450638 | Extended Review |
| 2933459 | Extended Review | 12.87 | 1001 | 5844284 | Pilot Initiative A |
| 4463640 | Pilot Initiative A | 35.45 | 1001 | 5844284 | Pilot Initiative A |
| 4463640 | Pilot Initiative A | 35.45 | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 4447026 | Baseline Model | 29.24 | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 4447026 | Baseline Model | 29.24 | 1003 | 2087735 | Distributed Cluster |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 | 1003 | 2087735 | Distributed Cluster |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 | 1000 | 1450638 | Extended Review |

This view joins `tasting_bowls` with `ingredients_bowls` and `food_ingredients`, answering: "What ingredients compose each tasting bowl?" The structure mirrors the canape ingredient view but operates on the bowl catalogue. Each bowl row is expanded with its ingredient details, including category and allergen status. This view enables the same allergen and dietary analysis for bowls as for canapés.

**View `v_food_ingredient_tasting_bowl_detail`**

```sql
CREATE VIEW v_food_ingredient_tasting_bowl_detail AS
SELECT a.food_ingredient_id, a.ingredient_id, a.name, b.bowl_id AS bowl_bowl_id, b.name AS bowl_name, b.price AS bowl_price
FROM food_ingredients a
  JOIN ingredients_bowls j ON j.food_ingredient_id = a.food_ingredient_id
  JOIN tasting_bowls b ON b.bowl_id = j.bowl_id;
```

| food_ingredient_id | ingredient_id | name | bowl_bowl_id | bowl_name | bowl_price |
|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | 2933459 | Extended Review | 12.87 |
| 1000 | 1450638 | Extended Review | 4463640 | Pilot Initiative A | 35.45 |
| 1001 | 5844284 | Pilot Initiative A | 4463640 | Pilot Initiative A | 35.45 |
| 1001 | 5844284 | Pilot Initiative A | 4447026 | Baseline Model | 29.24 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 4447026 | Baseline Model | 29.24 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 |
| 1003 | 2087735 | Distributed Cluster | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 |
| 1003 | 2087735 | Distributed Cluster | 2933459 | Extended Review | 12.87 |

The inverse, `v_food_ingredient_tasting_bowl_detail`, answers: "Which tasting bowls contain each ingredient?" Ingredient 1000 (protein, non-allergen) appears in specific bowls, and ingredient 1001 (vegetable, allergen) appears in others. This view supports ingredient-centric reporting for the bowl category, enabling operators to identify all bowls that contain a given allergen or ingredient type.

### Pricing Schemes for Tasting Bowls

**View `v_tasting_bowl_pricing_scheme`**

```sql
CREATE VIEW v_tasting_bowl_pricing_scheme AS
SELECT a.bowl_id, a.name, a.price, a.category, b.id AS scheme_id, b.scheme_id AS scheme_scheme_id, b.price_point AS scheme_price_point
FROM tasting_bowls a JOIN pricing_schemes b ON a.pricing_scheme_id = b.id;
```

| bowl_id | name | price | category | scheme_id | scheme_scheme_id | scheme_price_point |
|---|---|---|---|---|---|---|
| 2933459 | Extended Review | 12.87 | savoury | 1 | 4716393 | 12.72 |
| 4463640 | Pilot Initiative A | 35.45 | sweet | 2 | 338514 | 19.93 |
| 4447026 | Baseline Model | 29.24 | savoury | 3 | template_ivacode_pagata_20ind | 19.93 |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 | sweet | 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.94 |

This view joins `tasting_bowls` with `pricing_schemes`, answering: "What is the operative price and currency for each tasting bowl?" Bowl "Extended Review" (bowl_id 2933459) is priced at 12.72 in seasonal-currency-71 under scheme 4716393, valid from 2025-12-17. Bowl "Pilot Initiative A" (bowl_id 4463640) is priced at 19.93 in regional-currency-72 under scheme 338514, valid from 2022-05-01. The view surfaces the temporal validity of each scheme, enabling date-aware pricing queries.

**View `v_pricing_scheme_tasting_bowl`**

```sql
CREATE VIEW v_pricing_scheme_tasting_bowl AS
SELECT a.id, a.scheme_id, a.price_point, a.currency, b.bowl_id AS bowl_bowl_id, b.name AS bowl_name, b.price AS bowl_price
FROM pricing_schemes a JOIN tasting_bowls b ON a.bowl_id = b.bowl_id;
```

| id | scheme_id | price_point | currency | bowl_bowl_id | bowl_name | bowl_price |
|---|---|---|---|---|---|---|
| 1 | 4716393 | 12.72 | seasonal-currency-71 | 2933459 | Extended Review | 12.87 |
| 2 | 338514 | 19.93 | regional-currency-72 | 4463640 | Pilot Initiative A | 35.45 |
| 3 | template_ivacode_pagata_20ind | 19.93 | legacy-currency-73 | 4447026 | Baseline Model | 29.24 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.94 | compact-currency-74 | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 |

The reverse join, `v_pricing_scheme_tasting_bowl`, answers: "Which tasting bowls are covered by each pricing scheme?" Scheme 4716393 (price point 12.72, seasonal-currency-71) covers bowl "Extended Review" (bowl_id 2933459). Scheme 338514 (price point 19.93, regional-currency-72) covers bowl "Pilot Initiative A" (bowl_id 4463640). This view is essential for financial reporting, where one needs to trace a pricing scheme back to the specific bowls it prices.

### Synthesis

The catalogue model described here supports a catering operation through a clean separation of concerns: items (canapés and bowls) are defined by their attributes and linked to their foundations (bread bases), their compositions (ingredients), and their pricing (schemes). The bidirectional junction tables ensure that queries can flow in either direction—top-down from dish to ingredient, or bottom-up from ingredient to dish—without requiring application-level joins. The pricing schemes introduce a temporal layer, allowing prices to evolve while maintaining a historical record of what was charged and when. Together, these tables and views form a complete operational reference for menu management, allergen compliance, event planning, and financial reconciliation.