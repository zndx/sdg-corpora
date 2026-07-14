The wine-and-dining ecosystem captured in this dataset spans the full arc from vineyard to table: grape-growing land, the wines produced there, the restaurants that curate and serve them, the people who own, cook, and critique, the awards that certify quality, the events that bring these actors together, the foods that accompany the pour, and the chemical compounds that define character. The relational model normalizes this world into eight base tables whose columns encode entity attributes and whose foreign keys encode the cardinality-bounded relationships between them. Every view then reassembles a slice of the domain by joining the appropriate tables, turning a denormalized row back into a coherent domain fact.

## Base Tables and Their Attributes

The `restaurants` table anchors the commercial side of the domain. Its primary key `id` is a surrogate integer, while the business identifier `restaurant_id` carries values such as `48104239` for *Extended Review* and `3355790` for *Pilot Initiative A*. The columns `name`, `city`, and `state` describe the establishment's identity and geography — for instance, *Baseline Model* sits in `regional-city-36` within `pilot-state-86`. The integer `operating_since` records tenure (25 years for *Extended Review*, 55 for *Distributed Cluster*), and `corkage_fee` captures the per-bottle charge (ranging from `4.15` to `24.09`). The boolean `has_grand_award` together with `grand_award_year` and `wine_award_id` form a denormalized bridge to the awards table, while `person_id`, `has_owner_person_id`, and `event_id` serve as foreign keys pointing into `persons` and `events`.

**Table `restaurants`**

| id | restaurant_id | name | city | state | operating_since | corkage_fee | has_grand_award | grand_award_year | wine_award_id | person_id | has_owner_person_id | event_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 48104239 | Extended Review | integrated-city-34 | distributed-state-84 | 25 | 9.47 | false | 18 | 100 | 1000 | 1000 | 1000 |
| 2 | 3355790 | Pilot Initiative A | seasonal-city-35 | baseline-state-85 | 35 | 24.09 | true | 28 | 101 | 1001 | 1001 | 1001 |
| 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | regional-city-36 | pilot-state-86 | 45 | 14.58 | false | 38 | 102 | 1002 | 1002 | 1002 |
| 4 | 16658 | Distributed Cluster | legacy-city-37 | extended-state-87 | 55 | 4.15 | true | 48 | 103 | 1003 | 1003 | 1003 |

The `wine_awards` table formalizes the certification layer. Each row carries an `award_id` (a UUID or string such as `e02275d4-8fd1-11eb-924d-9cd76263cbd0` or `state_uk_17`), an `award_name` like *Primary Review A* or *Composite Initiative*, and an `issuing_organization` such as *Alphabet Inc Class A* or *Buypass AS*. The `award_year` is stored as a compact integer (36, 43, 50, 57), `minimum_selections` records the threshold count, and `is_grand_award` flags the highest tier. The foreign key `restaurant_id` ties the award back to the restaurant that received it.

**Table `wine_awards`**

| id | award_id | award_name | issuing_organization | award_year | minimum_selections | is_grand_award | restaurant_id |
|---|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | Alphabet Inc Class A | 36 | 36 | false | 1 |
| 101 | 3012811 | Composite Initiative | ITT Industries | 43 | 45 | true | 2 |
| 102 | 15493350 | Compact Model | Switch Card Services Ltd. | 50 | 54 | false | 3 |
| 103 | state_uk_17 | Legacy Cluster D | Buypass AS | 57 | 63 | true | 4 |

The `persons` table captures the human actors. The surrogate `person_id` (1000–1003) links to `first_name` and `last_name` — *Stephanie Collins*, *Janice Johnston*, *Upal Saha*, *Katherine Snyder* — while `role` encodes their function (*Owner*, *Chef*, *Winemaker*, *Celebrity*). The boolean `is_celebrity` distinguishes public figures, and the foreign keys `restaurant_id`, `works_as_chef_restaurant_id`, `wine_id`, and `vineyard_id` express the many possible affiliations a person may hold within the domain.

**Table `persons`**

| person_id | first_name | last_name | role | is_celebrity | restaurant_id | works_as_chef_restaurant_id | wine_id | vineyard_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Stephanie Collins | Paul Allen | Owner | false | 1 | 1 | 100 | 1000 |
| 1001 | Janice Johnston | Heather Beasley | Chef | true | 2 | 2 | 101 | 1001 |
| 1002 | Upal Saha | Audrey Taylor | Winemaker | false | 3 | 3 | 102 | 1002 |
| 1003 | Katherine Snyder | Susan Wagner | Celebrity | true | 4 | 4 | 103 | 1003 |

The `wines` table is the product catalogue. Its surrogate `wine_id` (100–103) connects to `producer` (*seasonal-producer-89*, *regional-producer-90*), `vintage` (33–45), `variety` (*Pinot Noir*, *Burgundy*, *Red*), `appellation` (*composite-appellat-99*, *primary-appellat-100*), and `vineyard_source` (*pilot-vineyard-26*, *extended-vineyard-27*). The numeric `parker_rating` (e.g. *pilot-parker-86*) and boolean `contains_resveratrol` add chemical and critical dimensions. Foreign keys `person_id`, `vineyard_id`, `restaurant_id`, and `food_id` bind the wine to its creator, origin, server, and pairing.

**Table `wines`**

| wine_id | producer | vintage | variety | appellation | vineyard_source | parker_rating | contains_resveratrol | person_id | vineyard_id | restaurant_id | food_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | seasonal-producer-89 | 33 | Pinot Noir | composite-appellat-99 | pilot-vineyard-26 | pilot-parker-86 | true | 1000 | 1000 | 1 | 1 |
| 101 | regional-producer-90 | 37 | Burgundy | primary-appellat-100 | extended-vineyard-27 | extended-parker-87 | false | 1001 | 1001 | 2 | 2 |
| 102 | legacy-producer-91 | 41 | Red | adaptive-appellat-101 | integrated-vineyard-28 | integrated-parker-88 | true | 1002 | 1002 | 3 | 3 |
| 103 | compact-producer-92 | 45 | Pinot Noir | distributed-appellat-102 | seasonal-vineyard-29 | seasonal-parker-89 | false | 1003 | 1003 | 4 | 4 |

The `vineyards` table models the land. Each `vineyard_id` (1000–1003) maps to a `name` (*Extended Review*, *Pilot Initiative A*), a `location` string, `acres` (5.70 to 19.80), `average_vine_age` (40–73), and `ownership_type` (*Owned* or *Leased*). The foreign keys `wine_id` and `person_id` tie the vineyard to the wine it supplies and the person who manages it.

**Table `vineyards`**

| vineyard_id | name | location | acres | average_vine_age | ownership_type | wine_id | person_id |
|---|---|---|---|---|---|---|---|
| 1000 | Extended Review | extended-location-99 | 5.70 | 40 | Owned | 100 | 1000 |
| 1001 | Pilot Initiative A | integrated-location-100 | 10.40 | 51 | Leased | 101 | 1001 |
| 1002 | Baseline Model | seasonal-location-101 | 15.10 | 62 | Owned | 102 | 1002 |
| 1003 | Distributed Cluster | regional-location-102 | 19.80 | 73 | Leased | 103 | 1003 |

The `events` table records occasions. An `event_id` (1000–1003) identifies the event (*Seasonal Standard*, *Integrated Framework*, *Extended Protocol D*, *Pilot Programme*), while `event_name`, `event_type` (*Wine Dinner*, *Participation Dinner*, *Tasting*), `date` (2022–2025), and `min_participants` (48–75) describe its scope. The boolean `is_special_menu` flags premium offerings, and foreign keys `restaurant_id`, `wine_id`, and `person_id` anchor the event to its venue, featured wine, and key participant.

**Table `events`**

| event_id | event_name | event_type | date | min_participants | is_special_menu | restaurant_id | wine_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Seasonal Standard | Wine Dinner | 2023-02-05 | 48 | false | 1 | 100 | 1000 |
| 1001 | Integrated Framework | Participation Dinner | 2024-07-16 | 57 | true | 2 | 101 | 1001 |
| 1002 | Extended Protocol D | Tasting | 2025-12-27 | 66 | false | 3 | 102 | 1002 |
| 1003 | Pilot Programme | Wine Dinner | 2022-05-11 | 75 | true | 4 | 103 | 1003 |

The `foods` table captures culinary items that pair with wines. Each food row carries a `food_id` and attributes such as `name`, `cuisine_type`, `spice_level`, and `calories`, with a foreign key `wine_id` linking it to the wine it accompanies.

**Table `foods`**

| id | food_id | name | category | is_staining | preparation_method | wine_id | restaurant_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 9085267 | Extended Review | Vegetable | true | Roasted | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Pilot Initiative A | Dish | false | Raw | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | bac1b89e-8fc8-11eb-924d-9cd76263cbd0 | Baseline Model | Ingredient | true | Roasted | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | gd_taxc_2121 | Distributed Cluster | Vegetable | false | Raw | 103 | 4 | 2025-04-16 09:14:00 |

The `chemicals` table catalogs chemical compounds found in wine. Each `chemical_id` identifies a compound by `name`, `category` (e.g. *polyphenol*, *alcohol*, *ester*), `concentration_range`, and `health_effect`, with a foreign key `wine_id` connecting it to the wine in which it appears.

**Table `chemicals`**

| id | chemical_id | name | location_in_wine | biological_effect | tested_on_organism | wine_id | person_id |
|---|---|---|---|---|---|---|---|
| 1 | 5917279 | Extended Review | Skin | Life-extending | Yeast | 100 | 1000 |
| 2 | 3990180 | Pilot Initiative A | Flesh | Caloric restriction mimic | Fruit Fly | 101 | 1001 |
| 3 | 8189495 | Baseline Model | Stem | Life-extending | Mouse | 102 | 1002 |
| 4 | 43197165 | Distributed Cluster | Skin | Caloric restriction mimic | Yeast | 103 | 1003 |

## Views as Reconstructed Domain Facts

Each view is a declarative join that materializes a specific question over the normalized base tables. The following sections interpret what each view answers, reading concrete rows as evidence.

The view `vw_restaurant_wine_award` joins `restaurants` to `wine_awards` on `restaurant_id`, answering which awards each restaurant has earned. Row 1 shows *Extended Review* (`restaurant_id` 48104239) linked to award *Primary Review A* issued by *Alphabet Inc Class A* in year 36, while row 2 shows *Pilot Initiative A* (`restaurant_id` 3355790) holding the grand award *Composite Initiative* from *ITT Industries* in year 43.

**View `vw_restaurant_wine_award`**

```sql
CREATE VIEW vw_restaurant_wine_award AS
SELECT a.id, a.restaurant_id, a.name, a.city, b.id AS award_id, b.award_id AS award_award_id, b.award_name AS award_award_name
FROM restaurants a JOIN wine_awards b ON a.wine_award_id = b.id;
```

| id | restaurant_id | name | city | award_id | award_award_id | award_award_name |
|---|---|---|---|---|---|---|
| 1 | 48104239 | Extended Review | integrated-city-34 | 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |
| 2 | 3355790 | Pilot Initiative A | seasonal-city-35 | 101 | 3012811 | Composite Initiative |
| 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | regional-city-36 | 102 | 15493350 | Compact Model |
| 4 | 16658 | Distributed Cluster | legacy-city-37 | 103 | state_uk_17 | Legacy Cluster D |

The view `vw_restaurant_person` joins `restaurants` to `persons` on `restaurant_id`, revealing the people associated with each establishment. Row 1 pairs *Extended Review* with *Stephanie Collins* (Owner), and row 2 pairs *Pilot Initiative A* with *Janice Johnston* (Chef, celebrity).

**View `vw_restaurant_person`**

```sql
CREATE VIEW vw_restaurant_person AS
SELECT a.id, a.restaurant_id, a.name, a.city, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM restaurants a JOIN persons b ON a.person_id = b.person_id;
```

| id | restaurant_id | name | city | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 48104239 | Extended Review | integrated-city-34 | 1000 | Stephanie Collins | Paul Allen |
| 2 | 3355790 | Pilot Initiative A | seasonal-city-35 | 1001 | Janice Johnston | Heather Beasley |
| 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | regional-city-36 | 1002 | Upal Saha | Audrey Taylor |
| 4 | 16658 | Distributed Cluster | legacy-city-37 | 1003 | Katherine Snyder | Susan Wagner |

The view `vw_restaurant_event` joins `restaurants` to `events` on `restaurant_id`, surfacing the events hosted at each venue. Row 1 shows *Extended Review* hosting *Seasonal Standard* (a Wine Dinner on 2023-02-05 with 48 participants), and row 2 shows *Pilot Initiative A* hosting *Integrated Framework* (a Participation Dinner on 2024-07-16 with a special menu).

**View `vw_restaurant_event`**

```sql
CREATE VIEW vw_restaurant_event AS
SELECT a.id, a.restaurant_id, a.name, a.city, b.event_id AS event_event_id, b.event_name AS event_event_name, b.event_type AS event_event_type
FROM restaurants a JOIN events b ON a.event_id = b.event_id;
```

| id | restaurant_id | name | city | event_event_id | event_event_name | event_event_type |
|---|---|---|---|---|---|---|
| 1 | 48104239 | Extended Review | integrated-city-34 | 1000 | Seasonal Standard | Wine Dinner |
| 2 | 3355790 | Pilot Initiative A | seasonal-city-35 | 1001 | Integrated Framework | Participation Dinner |
| 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | regional-city-36 | 1002 | Extended Protocol D | Tasting |
| 4 | 16658 | Distributed Cluster | legacy-city-37 | 1003 | Pilot Programme | Wine Dinner |

The view `vw_wine_award_restaurant` is the inverse of `vw_restaurant_wine_award`, joining `wine_awards` to `restaurants` to answer which restaurant received a given award. Row 1 maps award *Primary Review A* back to *Extended Review*, and row 4 maps the grand award *Legacy Cluster D* (issued by *Buypass AS*) to *Distributed Cluster*.

**View `vw_wine_award_restaurant`**

```sql
CREATE VIEW vw_wine_award_restaurant AS
SELECT a.id, a.award_id, a.award_name, a.issuing_organization, b.id AS restaurant_id, b.restaurant_id AS restaurant_restaurant_id, b.name AS restaurant_name
FROM wine_awards a JOIN restaurants b ON a.restaurant_id = b.id;
```

| id | award_id | award_name | issuing_organization | restaurant_id | restaurant_restaurant_id | restaurant_name |
|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | Alphabet Inc Class A | 1 | 48104239 | Extended Review |
| 101 | 3012811 | Composite Initiative | ITT Industries | 2 | 3355790 | Pilot Initiative A |
| 102 | 15493350 | Compact Model | Switch Card Services Ltd. | 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 103 | state_uk_17 | Legacy Cluster D | Buypass AS | 4 | 16658 | Distributed Cluster |

The view `vw_person_restaurant` joins `persons` to `restaurants` on `restaurant_id`, answering which restaurant each person works at. Row 1 shows *Stephanie Collins* at *Extended Review*, and row 4 shows *Katherine Snyder* at *Distributed Cluster*.

**View `vw_person_restaurant`**

```sql
CREATE VIEW vw_person_restaurant AS
SELECT a.person_id, a.first_name, a.last_name, a.role, b.id AS restaurant_id, b.restaurant_id AS restaurant_restaurant_id, b.name AS restaurant_name
FROM persons a JOIN restaurants b ON a.restaurant_id = b.id;
```

| person_id | first_name | last_name | role | restaurant_id | restaurant_restaurant_id | restaurant_name |
|---|---|---|---|---|---|---|
| 1000 | Stephanie Collins | Paul Allen | Owner | 1 | 48104239 | Extended Review |
| 1001 | Janice Johnston | Heather Beasley | Chef | 2 | 3355790 | Pilot Initiative A |
| 1002 | Upal Saha | Audrey Taylor | Winemaker | 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 1003 | Katherine Snyder | Susan Wagner | Celebrity | 4 | 16658 | Distributed Cluster |

The view `vw_person_wine` joins `persons` to `wines` on `wine_id`, revealing which wines each person is associated with. Row 1 links *Stephanie Collins* to wine 100 (*Pinot Noir*, vintage 33, from *seasonal-producer-89*), and row 3 links *Upal Saha* to wine 102 (*Red*, vintage 41, from *legacy-producer-91*).

**View `vw_person_wine`**

```sql
CREATE VIEW vw_person_wine AS
SELECT a.person_id, a.first_name, a.last_name, a.role, b.wine_id AS wine_wine_id, b.producer AS wine_producer, b.vintage AS wine_vintage
FROM persons a JOIN wines b ON a.wine_id = b.wine_id;
```

| person_id | first_name | last_name | role | wine_wine_id | wine_producer | wine_vintage |
|---|---|---|---|---|---|---|
| 1000 | Stephanie Collins | Paul Allen | Owner | 100 | seasonal-producer-89 | 33 |
| 1001 | Janice Johnston | Heather Beasley | Chef | 101 | regional-producer-90 | 37 |
| 1002 | Upal Saha | Audrey Taylor | Winemaker | 102 | legacy-producer-91 | 41 |
| 1003 | Katherine Snyder | Susan Wagner | Celebrity | 103 | compact-producer-92 | 45 |

The view `vw_person_vineyard` joins `persons` to `vineyards` on `vineyard_id`, showing which vineyard each person manages. Row 1 pairs *Stephanie Collins* with *Extended Review* vineyard (5.70 acres, Owned, average vine age 40), and row 4 pairs *Katherine Snyder* with *Distributed Cluster* vineyard (19.80 acres, Leased, average vine age 73).

**View `vw_person_vineyard`**

```sql
CREATE VIEW vw_person_vineyard AS
SELECT a.person_id, a.first_name, a.last_name, a.role, b.vineyard_id AS vineyard_vineyard_id, b.name AS vineyard_name, b.location AS vineyard_location
FROM persons a JOIN vineyards b ON a.vineyard_id = b.vineyard_id;
```

| person_id | first_name | last_name | role | vineyard_vineyard_id | vineyard_name | vineyard_location |
|---|---|---|---|---|---|---|
| 1000 | Stephanie Collins | Paul Allen | Owner | 1000 | Extended Review | extended-location-99 |
| 1001 | Janice Johnston | Heather Beasley | Chef | 1001 | Pilot Initiative A | integrated-location-100 |
| 1002 | Upal Saha | Audrey Taylor | Winemaker | 1002 | Baseline Model | seasonal-location-101 |
| 1003 | Katherine Snyder | Susan Wagner | Celebrity | 1003 | Distributed Cluster | regional-location-102 |

The view `vw_wine_person` is the inverse of `vw_person_wine`, joining `wines` to `persons` on `person_id` to answer which person is linked to a given wine. Row 1 shows wine 100 (*Pinot Noir*, Parker rating *pilot-parker-86*, contains resveratrol) linked to *Stephanie Collins*, and row 2 shows wine 101 (*Burgundy*, vintage 37) linked to *Janice Johnston*.

**View `vw_wine_person`**

```sql
CREATE VIEW vw_wine_person AS
SELECT a.wine_id, a.producer, a.vintage, a.variety, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM wines a JOIN persons b ON a.person_id = b.person_id;
```

| wine_id | producer | vintage | variety | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 100 | seasonal-producer-89 | 33 | Pinot Noir | 1000 | Stephanie Collins | Paul Allen |
| 101 | regional-producer-90 | 37 | Burgundy | 1001 | Janice Johnston | Heather Beasley |
| 102 | legacy-producer-91 | 41 | Red | 1002 | Upal Saha | Audrey Taylor |
| 103 | compact-producer-92 | 45 | Pinot Noir | 1003 | Katherine Snyder | Susan Wagner |

The view `vw_wine_vineyard` joins `wines` to `vineyards` on `vineyard_id`, revealing the origin vineyard of each wine. Row 1 maps wine 100 (*Pinot Noir*) to *Extended Review* vineyard (location `extended-location-99`), and row 3 maps wine 102 (*Red*) to *Baseline Model* vineyard (location `seasonal-location-101`, 15.10 acres).

**View `vw_wine_vineyard`**

```sql
CREATE VIEW vw_wine_vineyard AS
SELECT a.wine_id, a.producer, a.vintage, a.variety, b.vineyard_id AS vineyard_vineyard_id, b.name AS vineyard_name, b.location AS vineyard_location
FROM wines a JOIN vineyards b ON a.vineyard_id = b.vineyard_id;
```

| wine_id | producer | vintage | variety | vineyard_vineyard_id | vineyard_name | vineyard_location |
|---|---|---|---|---|---|---|
| 100 | seasonal-producer-89 | 33 | Pinot Noir | 1000 | Extended Review | extended-location-99 |
| 101 | regional-producer-90 | 37 | Burgundy | 1001 | Pilot Initiative A | integrated-location-100 |
| 102 | legacy-producer-91 | 41 | Red | 1002 | Baseline Model | seasonal-location-101 |
| 103 | compact-producer-92 | 45 | Pinot Noir | 1003 | Distributed Cluster | regional-location-102 |

The view `vw_wine_restaurant` joins `wines` to `restaurants` on `restaurant_id`, answering which restaurant serves a given wine. Row 1 shows wine 100 served at *Extended Review* (corkage fee 9.47), and row 4 shows wine 103 served at *Distributed Cluster* (corkage fee 4.15).

**View `vw_wine_restaurant`**

```sql
CREATE VIEW vw_wine_restaurant AS
SELECT a.wine_id, a.producer, a.vintage, a.variety, b.id AS restaurant_id, b.restaurant_id AS restaurant_restaurant_id, b.name AS restaurant_name
FROM wines a JOIN restaurants b ON a.restaurant_id = b.id;
```

| wine_id | producer | vintage | variety | restaurant_id | restaurant_restaurant_id | restaurant_name |
|---|---|---|---|---|---|---|
| 100 | seasonal-producer-89 | 33 | Pinot Noir | 1 | 48104239 | Extended Review |
| 101 | regional-producer-90 | 37 | Burgundy | 2 | 3355790 | Pilot Initiative A |
| 102 | legacy-producer-91 | 41 | Red | 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 103 | compact-producer-92 | 45 | Pinot Noir | 4 | 16658 | Distributed Cluster |

The view `vw_wine_food` joins `wines` to `foods` on `food_id`, surfacing the food pairings for each wine. Row 1 links wine 100 (*Pinot Noir*) to food 1, and row 4 links wine 103 (*Pinot Noir*, vintage 45) to food 4.

**View `vw_wine_food`**

```sql
CREATE VIEW vw_wine_food AS
SELECT a.wine_id, a.producer, a.vintage, a.variety, b.id AS food_id, b.food_id AS food_food_id, b.name AS food_name
FROM wines a JOIN foods b ON a.food_id = b.id;
```

| wine_id | producer | vintage | variety | food_id | food_food_id | food_name |
|---|---|---|---|---|---|---|
| 100 | seasonal-producer-89 | 33 | Pinot Noir | 1 | 9085267 | Extended Review |
| 101 | regional-producer-90 | 37 | Burgundy | 2 | lu_tax_code_template_b_VB-EC-15 | Pilot Initiative A |
| 102 | legacy-producer-91 | 41 | Red | 3 | bac1b89e-8fc8-11eb-924d-9cd76263cbd0 | Baseline Model |
| 103 | compact-producer-92 | 45 | Pinot Noir | 4 | gd_taxc_2121 | Distributed Cluster |

The view `vw_vineyard_wine` joins `vineyards` to `wines` on `wine_id`, answering which wine each vineyard produces. Row 1 shows *Extended Review* vineyard producing wine 100 (*Pinot Noir*, vintage 33), and row 2 shows *Pilot Initiative A* vineyard producing wine 101 (*Burgundy*, vintage 37).

**View `vw_vineyard_wine`**

```sql
CREATE VIEW vw_vineyard_wine AS
SELECT a.vineyard_id, a.name, a.location, a.acres, b.wine_id AS wine_wine_id, b.producer AS wine_producer, b.vintage AS wine_vintage
FROM vineyards a JOIN wines b ON a.wine_id = b.wine_id;
```

| vineyard_id | name | location | acres | wine_wine_id | wine_producer | wine_vintage |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | extended-location-99 | 5.70 | 100 | seasonal-producer-89 | 33 |
| 1001 | Pilot Initiative A | integrated-location-100 | 10.40 | 101 | regional-producer-90 | 37 |
| 1002 | Baseline Model | seasonal-location-101 | 15.10 | 102 | legacy-producer-91 | 41 |
| 1003 | Distributed Cluster | regional-location-102 | 19.80 | 103 | compact-producer-92 | 45 |

The view `vw_vineyard_person` joins `vineyards` to `persons` on `person_id`, revealing the person associated with each vineyard. Row 1 links *Extended Review* vineyard to *Stephanie Collins*, and row 3 links *Baseline Model* vineyard to *Upal Saha* (Winemaker).

**View `vw_vineyard_person`**

```sql
CREATE VIEW vw_vineyard_person AS
SELECT a.vineyard_id, a.name, a.location, a.acres, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM vineyards a JOIN persons b ON a.person_id = b.person_id;
```

| vineyard_id | name | location | acres | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | extended-location-99 | 5.70 | 1000 | Stephanie Collins | Paul Allen |
| 1001 | Pilot Initiative A | integrated-location-100 | 10.40 | 1001 | Janice Johnston | Heather Beasley |
| 1002 | Baseline Model | seasonal-location-101 | 15.10 | 1002 | Upal Saha | Audrey Taylor |
| 1003 | Distributed Cluster | regional-location-102 | 19.80 | 1003 | Katherine Snyder | Susan Wagner |

The view `vw_event_restaurant` joins `events` to `restaurants` on `restaurant_id`, answering which restaurant hosts a given event. Row 1 shows *Seasonal Standard* hosted at *Extended Review*, and row 3 shows *Extended Protocol D* hosted at *Baseline Model* on 2025-12-27.

**View `vw_event_restaurant`**

```sql
CREATE VIEW vw_event_restaurant AS
SELECT a.event_id, a.event_name, a.event_type, a.date, b.id AS restaurant_id, b.restaurant_id AS restaurant_restaurant_id, b.name AS restaurant_name
FROM events a JOIN restaurants b ON a.restaurant_id = b.id;
```

| event_id | event_name | event_type | date | restaurant_id | restaurant_restaurant_id | restaurant_name |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Standard | Wine Dinner | 2023-02-05 | 1 | 48104239 | Extended Review |
| 1001 | Integrated Framework | Participation Dinner | 2024-07-16 | 2 | 3355790 | Pilot Initiative A |
| 1002 | Extended Protocol D | Tasting | 2025-12-27 | 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 1003 | Pilot Programme | Wine Dinner | 2022-05-11 | 4 | 16658 | Distributed Cluster |

The view `vw_event_wine` joins `events` to `wines` on `wine_id`, surfacing the featured wine at each event. Row 1 links *Seasonal Standard* to wine 100 (*Pinot Noir*), and row 2 links *Integrated Framework* to wine 101 (*Burgundy*).

**View `vw_event_wine`**

```sql
CREATE VIEW vw_event_wine AS
SELECT a.event_id, a.event_name, a.event_type, a.date, b.wine_id AS wine_wine_id, b.producer AS wine_producer, b.vintage AS wine_vintage
FROM events a JOIN wines b ON a.wine_id = b.wine_id;
```

| event_id | event_name | event_type | date | wine_wine_id | wine_producer | wine_vintage |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Standard | Wine Dinner | 2023-02-05 | 100 | seasonal-producer-89 | 33 |
| 1001 | Integrated Framework | Participation Dinner | 2024-07-16 | 101 | regional-producer-90 | 37 |
| 1002 | Extended Protocol D | Tasting | 2025-12-27 | 102 | legacy-producer-91 | 41 |
| 1003 | Pilot Programme | Wine Dinner | 2022-05-11 | 103 | compact-producer-92 | 45 |

The view `vw_event_person` joins `events` to `persons` on `person_id`, revealing the key participant at each event. Row 1 pairs *Seasonal Standard* with *Stephanie Collins*, and row 4 pairs *Pilot Programme* with *Katherine Snyder* (Celebrity).

**View `vw_event_person`**

```sql
CREATE VIEW vw_event_person AS
SELECT a.event_id, a.event_name, a.event_type, a.date, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM events a JOIN persons b ON a.person_id = b.person_id;
```

| event_id | event_name | event_type | date | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Standard | Wine Dinner | 2023-02-05 | 1000 | Stephanie Collins | Paul Allen |
| 1001 | Integrated Framework | Participation Dinner | 2024-07-16 | 1001 | Janice Johnston | Heather Beasley |
| 1002 | Extended Protocol D | Tasting | 2025-12-27 | 1002 | Upal Saha | Audrey Taylor |
| 1003 | Pilot Programme | Wine Dinner | 2022-05-11 | 1003 | Katherine Snyder | Susan Wagner |

The view `vw_food_wine` joins `foods` to `wines` on `wine_id`, answering which wine pairs with a given food. Row 1 links food 1 to wine 100 (*Pinot Noir*, vintage 33, contains resveratrol), and row 3 links food 3 to wine 102 (*Red*, vintage 41).

**View `vw_food_wine`**

```sql
CREATE VIEW vw_food_wine AS
SELECT a.id, a.food_id, a.name, a.category, b.wine_id AS wine_wine_id, b.producer AS wine_producer, b.vintage AS wine_vintage
FROM foods a JOIN wines b ON a.wine_id = b.wine_id;
```

| id | food_id | name | category | wine_wine_id | wine_producer | wine_vintage |
|---|---|---|---|---|---|---|
| 1 | 9085267 | Extended Review | Vegetable | 100 | seasonal-producer-89 | 33 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Pilot Initiative A | Dish | 101 | regional-producer-90 | 37 |
| 3 | bac1b89e-8fc8-11eb-924d-9cd76263cbd0 | Baseline Model | Ingredient | 102 | legacy-producer-91 | 41 |
| 4 | gd_taxc_2121 | Distributed Cluster | Vegetable | 103 | compact-producer-92 | 45 |

The view `vw_food_restaurant` joins `foods` to `restaurants` on `restaurant_id`, revealing which restaurant serves a given food. Row 1 links food 1 to *Extended Review*, and row 4 links food 4 to *Distributed Cluster*.

**View `vw_food_restaurant`**

```sql
CREATE VIEW vw_food_restaurant AS
SELECT a.id, a.food_id, a.name, a.category, b.id AS restaurant_id, b.restaurant_id AS restaurant_restaurant_id, b.name AS restaurant_name
FROM foods a JOIN restaurants b ON a.restaurant_id = b.id;
```

| id | food_id | name | category | restaurant_id | restaurant_restaurant_id | restaurant_name |
|---|---|---|---|---|---|---|
| 1 | 9085267 | Extended Review | Vegetable | 1 | 48104239 | Extended Review |
| 2 | lu_tax_code_template_b_VB-EC-15 | Pilot Initiative A | Dish | 2 | 3355790 | Pilot Initiative A |
| 3 | bac1b89e-8fc8-11eb-924d-9cd76263cbd0 | Baseline Model | Ingredient | 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 4 | gd_taxc_2121 | Distributed Cluster | Vegetable | 4 | 16658 | Distributed Cluster |

The view `vw_chemical_wine` joins `chemicals` to `wines` on `wine_id`, answering which chemical compounds are present in each wine. Row 1 links a chemical to wine 100 (*Pinot Noir*, vintage 33, contains resveratrol), and row 3 links a chemical to wine 102 (*Red*, vintage 41, contains resveratrol).

**View `vw_chemical_wine`**

```sql
CREATE VIEW vw_chemical_wine AS
SELECT a.id, a.chemical_id, a.name, a.location_in_wine, b.wine_id AS wine_wine_id, b.producer AS wine_producer, b.vintage AS wine_vintage
FROM chemicals a JOIN wines b ON a.wine_id = b.wine_id;
```

| id | chemical_id | name | location_in_wine | wine_wine_id | wine_producer | wine_vintage |
|---|---|---|---|---|---|---|
| 1 | 5917279 | Extended Review | Skin | 100 | seasonal-producer-89 | 33 |
| 2 | 3990180 | Pilot Initiative A | Flesh | 101 | regional-producer-90 | 37 |
| 3 | 8189495 | Baseline Model | Stem | 102 | legacy-producer-91 | 41 |
| 4 | 43197165 | Distributed Cluster | Skin | 103 | compact-producer-92 | 45 |

The view `vw_chemical_person` joins `chemicals` to `persons` on `person_id`, revealing which person is associated with a given chemical compound. Row 1 links a chemical to *Stephanie Collins*, and row 4 links a chemical to *Katherine Snyder*.

**View `vw_chemical_person`**

```sql
CREATE VIEW vw_chemical_person AS
SELECT a.id, a.chemical_id, a.name, a.location_in_wine, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM chemicals a JOIN persons b ON a.person_id = b.person_id;
```

| id | chemical_id | name | location_in_wine | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 5917279 | Extended Review | Skin | 1000 | Stephanie Collins | Paul Allen |
| 2 | 3990180 | Pilot Initiative A | Flesh | 1001 | Janice Johnston | Heather Beasley |
| 3 | 8189495 | Baseline Model | Stem | 1002 | Upal Saha | Audrey Taylor |
| 4 | 43197165 | Distributed Cluster | Skin | 1003 | Katherine Snyder | Susan Wagner |

## Synthesis

The schema's design reflects a deliberate trade-off between normalization and query convenience. The eight base tables isolate entities — restaurants, awards, people, wines, vineyards, events, foods, chemicals — into their own namespaces, with surrogate integer keys and a handful of denormalized foreign-key columns that encode the domain's many-to-one and one-to-one relationships. The twenty views then reconstruct the relationships the base tables deliberately separate: `vw_restaurant_wine_award` and `vw_wine_award_restaurant` mirror each other across the restaurant–award axis; `vw_person_wine` and `vw_wine_person` mirror across the person–wine axis; `vw_wine_vineyard` and `vw_vineyard_wine` mirror across the wine–vineyard axis. Together, the base tables and views form a complete relational model of the wine-and-dining domain, where every denormalized row in a view corresponds to a single, interpretable fact about which restaurant serves which wine, which person manages which vineyard, which chemical appears in which vintage, and which event brings them all together.