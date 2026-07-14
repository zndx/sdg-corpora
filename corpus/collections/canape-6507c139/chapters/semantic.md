The canapé and tasting bowl catering domain captures the full lifecycle of a food-service catalog: each menu item is described by its name, price, dietary classification, and the bread base or ingredient composition that defines its character, while a parallel pricing-scheme layer governs when and at what price point each item is offered. The relational model normalises this domain into five entity tables, four junction tables that resolve many-to-many associations, and ten materialised views that reassemble the normalised facts into readable business joins. Every identifier, every foreign key, and every junction row traces back to a single domain concept—what is sold, what it is made of, and at what price.

**Table `canapes`**

| canape_id | name | price | category | dietary_classification | recommended_count_per_person | bread_base_id | pricing_scheme_id |
|---|---|---|---|---|---|---|---|
| 1 | Extended Review | 12.87 | savoury | v | 12 | 1 | 1 |
| 2 | Pilot Initiative A | 35.45 | sweet | vg | 12 | 2 | 2 |
| 3 | Baseline Model | 29.24 | savoury | none | 5 | 3 | 3 |
| 4 | Distributed Cluster | 29.99 | sweet | v | 8 | 4 | 4 |

The `canapes` table is the primary entity for savoury and sweet bite-sized items. Its surrogate key `canape_id` is an integer that increments sequentially (1 through 4 in the sample data), while the business-relevant column `name` carries human-readable identifiers such as *Extended Review*, *Pilot Initiative A*, *Baseline Model*, and *Distributed Cluster*. The `price` column stores a decimal value (12.87, 35.45, 29.24, 29.99), `category` is a categorical flag distinguishing *savoury* from *sweet* items, and `dietary_classification` encodes dietary constraints using the codes `v` (vegetarian), `vg` (vegan), or `none`. The column `recommended_count_per_person` (values 5, 8, 12) guides portion planning. Two foreign keys anchor the row to other entities: `bread_base_id` references `bread_bases.bread_base_id`, and `pricing_scheme_id` references `pricing_schemes.id`. In the sample data, *Extended Review* (canape_id 1) carries a rye bread base and pricing scheme 1; *Pilot Initiative A* (canape_id 2) uses a rice cracker base and scheme 2.

**Table `bread_bases`**

| bread_base_id | base_id | name | type | canape_id |
|---|---|---|---|---|
| 1 | 10782187 | Extended Review | rye bread | 1 |
| 2 | 575207 | Pilot Initiative A | rice cracker | 2 |
| 3 | 5f90467a-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | cornet | 3 |
| 4 | 1152667 | Distributed Cluster | yorkshire pudding | 4 |

The `bread_bases` table describes the foundational substrate of each canapé. Its surrogate key `bread_base_id` mirrors the `canape_id` in the sample data (1–4), but the table also carries a separate `base_id` column that holds opaque identifiers such as `10782187`, `575207`, the UUID-like `5f90467a-8fcd-11eb-924d-9cd76263cbd0`, and `1152667`. The `name` column repeats the canapé name (a denormalised convenience), while `type` stores the bread variety—*rye bread*, *rice cracker*, *cornet*, *yorkshire pudding*. The foreign key `canape_id` creates a one-to-one link back to `canapes`, meaning each bread base row is owned by exactly one canapé. The join between `canapes` and `bread_bases` is therefore a simple equality on `canapes.bread_base_id = bread_bases.bread_base_id`.

**Table `food_ingredients`**

| food_ingredient_id | ingredient_id | name | category | is_allergen |
|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | false |
| 1001 | 5844284 | Pilot Initiative A | vegetable | true |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | dairy | false |
| 1003 | 2087735 | Distributed Cluster | sauce | true |

The `food_ingredients` table enumerates the raw ingredients used across the menu. Its surrogate key `food_ingredient_id` is an integer (1000–1003 in the sample), while `ingredient_id` holds opaque identifiers such as `1450638`, `5844284`, `template_ivacode_pagata_20det40ind`, and `2087735`. The `name` column again repeats the canapé name as a convenience label, `category` classifies the ingredient as *protein*, *vegetable*, *dairy*, or *sauce*, and `is_allergen` is a boolean flag (`true` for *Pilot Initiative A* and *Distributed Cluster*, `false` for *Extended Review* and *Baseline Model*). This table participates in two many-to-many relationships—one with `canapes` and one with `tasting_bowls`—resolved through the junction tables described below.

**Table `tasting_bowls`**

| bowl_id | name | price | category | dietary_classification | recommended_count_per_person | pricing_scheme_id |
|---|---|---|---|---|---|---|
| 2933459 | Extended Review | 12.87 | savoury | v | 12 | 1 |
| 4463640 | Pilot Initiative A | 35.45 | sweet | vg | 12 | 2 |
| 4447026 | Baseline Model | 29.24 | savoury | none | 5 | 3 |
| 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 29.99 | sweet | v | 8 | 4 |

The `tasting_bowls` table mirrors the structure of `canapes` for a parallel product line: pre-assembled tasting bowls. Its surrogate key `bowl_id` is a string (e.g., `2933459`, `4463640`, `4447026`, `1ca13cb8-8fbc-11eb-924d-9cd76263cbd0`), and the columns `name`, `price`, `category`, `dietary_classification`, and `recommended_count_per_person` carry the same semantics as in `canapes`. The foreign key `pricing_scheme_id` references `pricing_schemes.id`, linking each bowl to its pricing context. In the sample, *Extended Review* (bowl_id `2933459`) is a savoury vegetarian item priced at 12.87 with a recommended count of 12 per person.

**Table `pricing_schemes`**

| id | scheme_id | price_point | currency | valid_from | canape_id | bowl_id |
|---|---|---|---|---|---|---|
| 1 | 4716393 | 12.72 | seasonal-currency-71 | 2025-12-17T11:09:00 | 1 | 2933459 |
| 2 | 338514 | 19.93 | regional-currency-72 | 2022-05-01T18:26:00 | 2 | 4463640 |
| 3 | template_ivacode_pagata_20ind | 19.93 | legacy-currency-73 | 2023-10-12T01:43:00 | 3 | 4447026 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.94 | compact-currency-74 | 2024-03-23T08:00:00 | 4 | 1ca13cb8-8fbc-11eb-924d-9cd76263cbd0 |

The `pricing_schemes` table is the central pricing hub. Its surrogate key `id` is an integer (1–4), while `scheme_id` holds opaque identifiers such as `4716393`, `338514`, `template_ivacode_pagata_20ind`, and `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`. The `price_point` column stores the actual price (12.72, 19.93, 11.94), `currency` encodes the currency type as a string like *seasonal-currency-71* or *regional-currency-72*, and `valid_from` is a timestamp (e.g., `2025-12-17T11:09:00`). Two foreign keys, `canape_id` and `bowl_id`, make this table a shared pricing anchor: each pricing scheme row is associated with exactly one canapé and one tasting bowl. In the sample, scheme 1 (price_point 12.72, valid from 2025-12-17) is linked to canape_id 1 and bowl_id `2933459`.

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

The `canapes_ingredients` junction table resolves the many-to-many relationship between `canapes` and `food_ingredients`. Its composite key is the pair `(canape_id, food_ingredient_id)`. In the sample data, canape_id 1 (*Extended Review*) is associated with food_ingredient_id 1000 and 1001; canape_id 2 (*Pilot Initiative A*) with 1001 and 1002; canape_id 3 (*Baseline Model*) with 1002 and 1003; and canape_id 4 (*Distributed Cluster*) with 1003 and 1000. Each canapé thus uses exactly two ingredients in the sample, and each ingredient appears in exactly two canapés, forming a symmetric bipartite graph.

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

The `ingredients_canapes` table is a second junction table for the same canapé–ingredient relationship. Its structure mirrors `canapes_ingredients` with columns `(canape_id, food_ingredient_id)`, and it carries the same sample rows. The presence of both `canapes_ingredients` and `ingredients_canapes` reflects a modelling choice to expose the relationship from both entity perspectives—allowing queries that start from either the canapé side or the ingredient side without requiring a table alias swap.

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

The `ingredients_bowls` junction table links `food_ingredients` to `tasting_bowls`. Its composite key is `(bowl_id, food_ingredient_id)`, and it resolves the many-to-many relationship between the two entities. Although the sample data does not show explicit rows for this table, its existence in the schema ensures that every tasting bowl can be decomposed into its constituent ingredients, just as every canapé can.

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

The `bowls_ingredients` table is the mirror junction for the bowl–ingredient relationship, with columns `(bowl_id, food_ingredient_id)`. Like `ingredients_canapes`, it provides a second access path to the same bipartite relationship, enabling queries that originate from the bowl entity to join directly to ingredient detail without aliasing.

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

The view `v_canape_bread_base` joins `canapes` to `bread_bases` on `canapes.bread_base_id = bread_bases.bread_base_id`, producing a denormalised row per canapé that includes both the canapé's metadata and its bread base type. For example, the row for *Extended Review* (canape_id 1) shows `name = Extended Review`, `price = 12.87`, `category = savoury`, `bread_base.type = rye bread`, and `bread_base.name = Extended Review`. This view answers the question: "What bread base does each canapé sit on?" It is the simplest one-to-one projection in the schema, requiring no aggregation.

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

The view `v_canape_food_ingredient_detail` joins `canapes` to `food_ingredients` through the `canapes_ingredients` junction, producing one output row per canapé–ingredient pair. For canape_id 1 (*Extended Review*), the view yields two rows: one with `food_ingredient_id = 1000` (category *protein*, `is_allergen = false`) and another with `food_ingredient_id = 1001` (category *vegetable*, `is_allergen = true`). This view answers: "Which ingredients compose each canapé, and which are allergens?" The result is a flat, denormalised fact table suitable for reporting or filtering by ingredient category.

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

The view `v_canape_pricing_scheme` joins `canapes` to `pricing_schemes` on `canapes.pricing_scheme_id = pricing_schemes.id`, producing a row that combines the canapé's retail price with the scheme's `price_point`, `currency`, and `valid_from` timestamp. For canape_id 1 (*Extended Review*), the view shows `canapes.price = 12.87`, `pricing_scheme.price_point = 12.72`, `pricing_scheme.currency = seasonal-currency-71`, and `pricing_scheme.valid_from = 2025-12-17T11:09:00`. This view answers: "At what price point and in which currency is each canapé offered, and from when is the scheme valid?" It is the primary interface for pricing audits and currency reconciliation.

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

The view `v_bread_base_canape` is the inverse of `v_canape_bread_base`: it starts from `bread_bases` and joins to `canapes` on `bread_bases.canape_id = canapes.canape_id`. For bread_base_id 2 (*Pilot Initiative A*, type *rice cracker*), the view yields `canape.name = Pilot Initiative A`, `canape.price = 35.45`, `canape.category = sweet`, and `canape.dietary_classification = vg`. This view answers: "Which canapé uses this bread base, and what are that canapé's attributes?" It is useful when the business analyst starts from the bread base inventory and wants to know which menu items depend on it.

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

The view `v_food_ingredient_canape_detail` joins `food_ingredients` to `canapes` through `canapes_ingredients`, producing one row per ingredient–canapé pair. For food_ingredient_id 1001 (category *vegetable*, `is_allergen = true`), the view yields two rows: one for canape_id 1 (*Extended Review*) and one for canape_id 2 (*Pilot Initiative A*). This view answers: "Which canapés contain this ingredient, and is it an allergen?" It is the inverse of `v_canape_food_ingredient_detail` and is useful for allergen traceability—answering "which menu items contain this allergen?"

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

The view `v_food_ingredient_tasting_bowl_detail` joins `food_ingredients` to `tasting_bowls` through the `ingredients_bowls` junction, producing one row per ingredient–bowl pair. Although the sample data does not show explicit rows in the junction, the view's structure mirrors `v_food_ingredient_canape_detail`: for each ingredient, it lists the tasting bowls that contain it, along with the bowl's `name`, `price`, `category`, and `dietary_classification`. This view answers: "Which tasting bowls use this ingredient?" and supports cross-product allergen analysis across both canapé and bowl lines.

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

The view `v_tasting_bowl_food_ingredient_detail` is the inverse of `v_food_ingredient_tasting_bowl_detail`: it starts from `tasting_bowls` and joins to `food_ingredients` through `bowls_ingredients`. For bowl_id `2933459` (*Extended Review*, savoury, vegetarian, price 12.87), the view yields one row per ingredient in that bowl, showing the ingredient's `name`, `category`, and `is_allergen` flag. This view answers: "What ingredients compose this tasting bowl?" and is the primary interface for bowl-level recipe decomposition.

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

The view `v_tasting_bowl_pricing_scheme` joins `tasting_bowls` to `pricing_schemes` on `tasting_bowls.pricing_scheme_id = pricing_schemes.id`. For bowl_id `2933459` (*Extended Review*), the view shows `tasting_bowls.price = 12.87`, `pricing_scheme.price_point = 12.72`, `pricing_scheme.currency = seasonal-currency-71`, and `pricing_scheme.valid_from = 2025-12-17T11:09:00`. This view answers: "At what price point and currency is each tasting bowl offered, and from when is the scheme valid?" It mirrors `v_canape_pricing_scheme` for the bowl product line.

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

The view `v_pricing_scheme_canape` is the inverse of `v_canape_pricing_scheme`: it starts from `pricing_schemes` and joins to `canapes` on `pricing_schemes.canape_id = canapes.canape_id`. For pricing_scheme id 1 (price_point 12.72, currency *seasonal-currency-71*), the view yields `canape.name = Extended Review`, `canape.price = 12.87`, `canape.category = savoury`, and `canape.dietary_classification = v`. This view answers: "Which canapé is associated with this pricing scheme?" and is useful when the business analyst starts from the pricing calendar and wants to know which menu items are covered by each scheme.

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

The view `v_pricing_scheme_tasting_bowl` is the inverse of `v_tasting_bowl_pricing_scheme`: it starts from `pricing_schemes` and joins to `tasting_bowls` on `pricing_schemes.bowl_id = tasting_bowls.bowl_id`. For pricing_scheme id 1 (price_point 12.72, currency *seasonal-currency-71*), the view yields `tasting_bowl.name = Extended Review`, `tasting_bowl.price = 12.87`, `tasting_bowl.category = savoury`, and `tasting_bowl.dietary_classification = v`. This view answers: "Which tasting bowl is associated with this pricing scheme?" Together with `v_pricing_scheme_canape`, it provides a unified pricing calendar view across both product lines.

The normalised schema separates concerns cleanly: `canapes` and `tasting_bowls` hold product metadata, `bread_bases` holds substrate information, `food_ingredients` holds raw material definitions, and `pricing_schemes` holds temporal pricing data. The junction tables (`canapes_ingredients`, `ingredients_canapes`, `ingredients_bowls`, `bowls_ingredients`) resolve the many-to-many relationships that arise because a single ingredient can appear in multiple products and a single product can contain multiple ingredients. The ten views reassemble these normalised facts into denormalised, business-readable projections—each view answering a specific question about the domain, from "what bread base does this canapé use?" to "which menu items contain this allergen?" to "at what price point is this item offered?" The model is fully relational, fully normalised at the base layer, and fully materialised at the view layer, ensuring that every domain fact can be reconstructed from the join of the appropriate tables.