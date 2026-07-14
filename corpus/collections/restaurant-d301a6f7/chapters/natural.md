## The Restaurant and Wine Industry Domain

The restaurant and wine industry operates as an interconnected ecosystem where establishments, producers, and events converge around shared products and personnel. At its core, the domain tracks establishments that serve wine, the awards they receive, the people who work within them, the wines they carry, the vineyards that produce those wines, and the events that bring these elements together. Foods and chemicals associated with wines and personnel round out the operational picture. Understanding this domain requires examining how each entity relates to the others through a network of foreign-key relationships that capture real-world business connections.

**Table `restaurants`**

| id | restaurant_id | name | city | state | operating_since | corkage_fee | has_grand_award | grand_award_year | wine_award_id | person_id | has_owner_person_id | event_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 48104239 | Extended Review | integrated-city-34 | distributed-state-84 | 25 | 9.47 | false | 18 | 100 | 1000 | 1000 | 1000 |
| 2 | 3355790 | Pilot Initiative A | seasonal-city-35 | baseline-state-85 | 35 | 24.09 | true | 28 | 101 | 1001 | 1001 | 1001 |
| 3 | b351025e-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | regional-city-36 | pilot-state-86 | 45 | 14.58 | false | 38 | 102 | 1002 | 1002 | 1002 |
| 4 | 16658 | Distributed Cluster | legacy-city-37 | extended-state-87 | 55 | 4.15 | true | 48 | 103 | 1003 | 1003 | 1003 |

Restaurants form the central hub of the domain. Each establishment is identified by a unique `restaurant_id` and carries a `name`, `city`, and `state` that locate it geographically. The `operating_since` column records how many years the restaurant has been in business, ranging from 25 years at Extended Review to 55 years at Distributed Cluster. The `corkage_fee` column captures the charge patrons pay to bring their own bottle, with values spanning from $4.15 to $24.09. The `has_grand_award` flag indicates whether the restaurant has received a grand award designation, while `grand_award_year` specifies the year of that achievement. Foreign keys `wine_award_id`, `person_id`, `has_owner_person_id`, and `event_id` link each restaurant to its award, primary personnel, owner, and associated event respectively.

**Table `wine_awards`**

| id | award_id | award_name | issuing_organization | award_year | minimum_selections | is_grand_award | restaurant_id |
|---|---|---|---|---|---|---|---|
| 100 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | Alphabet Inc Class A | 36 | 36 | false | 1 |
| 101 | 3012811 | Composite Initiative | ITT Industries | 43 | 45 | true | 2 |
| 102 | 15493350 | Compact Model | Switch Card Services Ltd. | 50 | 54 | false | 3 |
| 103 | state_uk_17 | Legacy Cluster D | Buypass AS | 57 | 63 | true | 4 |

Wine awards represent the recognition that establishments earn from various issuing organizations. Each award record carries an `award_id`, `award_name`, and `issuing_organization` — for example, the Primary Review A award from Alphabet Inc Class A, or the Legacy Cluster D award from Buypass AS. The `award_year` and `minimum_selections` columns document when the award was given and the threshold of selections required. The `is_grand_award` flag distinguishes grand awards from standard recognitions; Composite Initiative and Legacy Cluster D are grand awards, while Primary Review A and Compact Model are not. The `restaurant_id` foreign key ties each award to the establishment that received it.

**Table `persons`**

| person_id | first_name | last_name | role | is_celebrity | restaurant_id | works_as_chef_restaurant_id | wine_id | vineyard_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Stephanie Collins | Paul Allen | Owner | false | 1 | 1 | 100 | 1000 |
| 1001 | Janice Johnston | Heather Beasley | Chef | true | 2 | 2 | 101 | 1001 |
| 1002 | Upal Saha | Audrey Taylor | Winemaker | false | 3 | 3 | 102 | 1002 |
| 1003 | Katherine Snyder | Susan Wagner | Celebrity | true | 4 | 4 | 103 | 1003 |

Persons encompass the individuals who operate within the restaurant and wine ecosystem. Each person record includes a `person_id`, `first_name`, `last_name`, and `role`, which can be Owner, Chef, Winemaker, or Celebrity. The `is_celebrity` flag identifies public figures such as Janice Johnston and Katherine Snyder. Foreign keys `restaurant_id`, `works_as_chef_restaurant_id`, `wine_id`, and `vineyard_id` connect each person to their primary restaurant, the restaurant where they work as a chef, the wine they are associated with, and the vineyard they are linked to. Stephanie Collins serves as Owner at Extended Review, Janice Johnston works as a Chef at Pilot Initiative A, Upal Saha is a Winemaker at Baseline Model, and Katherine Snyder holds a Celebrity role at Distributed Cluster.

**Table `wines`**

| wine_id | producer | vintage | variety | appellation | vineyard_source | parker_rating | contains_resveratrol | person_id | vineyard_id | restaurant_id | food_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | seasonal-producer-89 | 33 | Pinot Noir | composite-appellat-99 | pilot-vineyard-26 | pilot-parker-86 | true | 1000 | 1000 | 1 | 1 |
| 101 | regional-producer-90 | 37 | Burgundy | primary-appellat-100 | extended-vineyard-27 | extended-parker-87 | false | 1001 | 1001 | 2 | 2 |
| 102 | legacy-producer-91 | 41 | Red | adaptive-appellat-101 | integrated-vineyard-28 | integrated-parker-88 | true | 1002 | 1002 | 3 | 3 |
| 103 | compact-producer-92 | 45 | Pinot Noir | distributed-appellat-102 | seasonal-vineyard-29 | seasonal-parker-89 | false | 1003 | 1003 | 4 | 4 |

Wines are the products at the center of this domain. Each wine record includes a `wine_id`, `producer`, `vintage`, `variety`, `appellation`, and `vineyard_source`. Varieties include Pinot Noir, Burgundy, and Red, while appellations range from composite-appellat-99 to distributed-appellat-102. The `parker_rating` column provides a quality assessment, and `contains_resveratrol` indicates whether the wine contains this compound. Foreign keys `person_id`, `vineyard_id`, `restaurant_id`, and `food_id` link each wine to its associated person, vineyard, restaurant, and food.

**Table `vineyards`**

| vineyard_id | name | location | acres | average_vine_age | ownership_type | wine_id | person_id |
|---|---|---|---|---|---|---|---|
| 1000 | Extended Review | extended-location-99 | 5.70 | 40 | Owned | 100 | 1000 |
| 1001 | Pilot Initiative A | integrated-location-100 | 10.40 | 51 | Leased | 101 | 1001 |
| 1002 | Baseline Model | seasonal-location-101 | 15.10 | 62 | Owned | 102 | 1002 |
| 1003 | Distributed Cluster | regional-location-102 | 19.80 | 73 | Leased | 103 | 1003 |

Vineyards are the agricultural sources of the wines. Each vineyard record includes a `vineyard_id`, `name`, `location`, `acres`, `average_vine_age`, and `ownership_type`. Vineyard sizes range from 5.70 acres at Extended Review to 19.80 acres at Distributed Cluster, with vine ages spanning from 40 to 73 years. Ownership types are either Owned or Leased. Foreign keys `wine_id` and `person_id` connect each vineyard to its wine and associated person.

**Table `events`**

| event_id | event_name | event_type | date | min_participants | is_special_menu | restaurant_id | wine_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Seasonal Standard | Wine Dinner | 2023-02-05 | 48 | false | 1 | 100 | 1000 |
| 1001 | Integrated Framework | Participation Dinner | 2024-07-16 | 57 | true | 2 | 101 | 1001 |
| 1002 | Extended Protocol D | Tasting | 2025-12-27 | 66 | false | 3 | 102 | 1002 |
| 1003 | Pilot Programme | Wine Dinner | 2022-05-11 | 75 | true | 4 | 103 | 1003 |

Events bring together restaurants, wines, and people in organized gatherings. Each event record includes an `event_id`, `event_name`, `event_type`, `date`, `min_participants`, and `is_special_menu`. Event types include Wine Dinner, Participation Dinner, and Tasting. The `min_participants` column specifies the minimum number of attendees, ranging from 48 to 75. Foreign keys `restaurant_id`, `wine_id`, and `person_id` link each event to its host restaurant, featured wine, and associated person.

**Table `foods`**

| id | food_id | name | category | is_staining | preparation_method | wine_id | restaurant_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 9085267 | Extended Review | Vegetable | true | Roasted | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Pilot Initiative A | Dish | false | Raw | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | bac1b89e-8fc8-11eb-924d-9cd76263cbd0 | Baseline Model | Ingredient | true | Roasted | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | gd_taxc_2121 | Distributed Cluster | Vegetable | false | Raw | 103 | 4 | 2025-04-16 09:14:00 |

Foods represent the culinary offerings that accompany wines in restaurant menus and events. Each food record includes a `food_id`, `food_name`, `food_type`, `restaurant_id`, and `wine_id`, connecting dishes to their establishments and paired wines.

**Table `chemicals`**

| id | chemical_id | name | location_in_wine | biological_effect | tested_on_organism | wine_id | person_id |
|---|---|---|---|---|---|---|---|
| 1 | 5917279 | Extended Review | Skin | Life-extending | Yeast | 100 | 1000 |
| 2 | 3990180 | Pilot Initiative A | Flesh | Caloric restriction mimic | Fruit Fly | 101 | 1001 |
| 3 | 8189495 | Baseline Model | Stem | Life-extending | Mouse | 102 | 1002 |
| 4 | 43197165 | Distributed Cluster | Skin | Caloric restriction mimic | Yeast | 103 | 1003 |

Chemicals capture the chemical compounds relevant to wines and the people involved with them. Each chemical record includes a `chemical_id`, `chemical_name`, `chemical_type`, `wine_id`, and `person_id`, linking compounds to specific wines and personnel.

### Award and Restaurant Relationships

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

This view joins restaurants with their wine awards, answering which establishments have earned which recognitions and from which organizations. The joined result reveals that Extended Review holds the Primary Review A award from Alphabet Inc Class A, while Pilot Initiative A received the Composite Initiative grand award from ITT Industries. Baseline Model carries the Compact Model award from Switch Card Services Ltd., and Distributed Cluster holds the Legacy Cluster D grand award from Buypass AS. The view surfaces both the award details and the restaurant context in a single record, making it straightforward to identify which restaurants hold grand awards and which do not.

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

This view presents the same relationship from the awards perspective, answering which restaurants have received each award. Reading the joined records, the Primary Review A award maps to Extended Review in integrated-city-34, the Composite Initiative grand award maps to Pilot Initiative A in seasonal-city-35, the Compact Model award maps to Baseline Model in regional-city-36, and the Legacy Cluster D grand award maps to Distributed Cluster in legacy-city-37. This orientation is useful when starting from an award and tracing back to the recipient establishment.

### Personnel and Restaurant Relationships

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

This view joins restaurants with their associated persons, answering which individuals are connected to each establishment. The joined records show that Stephanie Collins (Owner) is linked to Extended Review, Janice Johnston (Chef, Celebrity) to Pilot Initiative A, Upal Saha (Winemaker) to Baseline Model, and Katherine Snyder (Celebrity) to Distributed Cluster. The view surfaces both the person's role and their celebrity status alongside the restaurant's operational details, providing a clear picture of the human capital at each establishment.

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

This view presents the personnel-restaurant relationship from the person's perspective, answering which restaurant each person is associated with. The joined records confirm that Stephanie Collins works at Extended Review, Janice Johnston at Pilot Initiative A, Upal Saha at Baseline Model, and Katherine Snyder at Distributed Cluster. This orientation is useful when starting from a person and tracing to their primary establishment.

### Event and Restaurant Relationships

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

This view joins restaurants with their events, answering which establishments host which gatherings and what type each event is. The joined records reveal that Extended Review hosts the Seasonal Standard Wine Dinner on 2023-02-05 with 48 minimum participants and no special menu. Pilot Initiative A hosts the Integrated Framework Participation Dinner on 2024-07-16 with 57 minimum participants and a special menu. Baseline Model hosts the Extended Protocol D Tasting on 2025-12-27 with 66 minimum participants and no special menu. Distributed Cluster hosts the Pilot Programme Wine Dinner on 2022-05-11 with 75 minimum participants and a special menu. The view provides a complete picture of each restaurant's event calendar.

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

This view presents the event-restaurant relationship from the event's perspective, answering which restaurant hosts each event. The joined records show that the Seasonal Standard Wine Dinner is hosted by Extended Review, the Integrated Framework Participation Dinner by Pilot Initiative A, the Extended Protocol D Tasting by Baseline Model, and the Pilot Programme Wine Dinner by Distributed Cluster. This orientation supports event-centric queries that need to identify the host establishment.

### Wine and Personnel Relationships

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

This view joins persons with their associated wines, answering which individuals are connected to which wines. The joined records show that Stephanie Collins is linked to wine 100 (Pinot Noir, vintage 33), Janice Johnston to wine 101 (Burgundy, vintage 37), Upal Saha to wine 102 (Red, vintage 41), and Katherine Snyder to wine 103 (Pinot Noir, vintage 45). The view surfaces the wine's variety, vintage, and Parker rating alongside the person's role, providing context for understanding which personnel are associated with which products.

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

This view presents the wine-person relationship from the wine's perspective, answering which person is associated with each wine. The joined records confirm that wine 100 (Pinot Noir, vintage 33) is associated with Stephanie Collins, wine 101 (Burgundy, vintage 37) with Janice Johnston, wine 102 (Red, vintage 41) with Upal Saha, and wine 103 (Pinot Noir, vintage 45) with Katherine Snyder. This orientation is useful when starting from a wine and tracing to its associated person.

### Vineyard and Personnel Relationships

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

This view joins persons with their associated vineyards, answering which individuals are connected to which vineyards. The joined records show that Stephanie Collins is linked to the Extended Review vineyard in extended-location-99 with 5.70 acres and 40-year average vine age, Janice Johnston to the Pilot Initiative A vineyard in integrated-location-100 with 10.40 acres and 51-year average vine age, Upal Saha to the Baseline Model vineyard in seasonal-location-101 with 15.10 acres and 62-year average vine age, and Katherine Snyder to the Distributed Cluster vineyard in regional-location-102 with 19.80 acres and 73-year average vine age. The view surfaces the vineyard's size, age, and ownership type alongside the person's role.

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

This view presents the vineyard-person relationship from the vineyard's perspective, answering which person is associated with each vineyard. The joined records confirm that the Extended Review vineyard is associated with Stephanie Collins, the Pilot Initiative A vineyard with Janice Johnston, the Baseline Model vineyard with Upal Saha, and the Distributed Cluster vineyard with Katherine Snyder. This orientation supports vineyard-centric queries that need to identify the associated personnel.

### Wine and Vineyard Relationships

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

This view joins wines with their vineyard sources, answering which wines come from which vineyards. The joined records reveal that wine 100 (Pinot Noir, vintage 33, Parker rating pilot-parker-86) originates from the Extended Review vineyard with 5.70 acres, wine 101 (Burgundy, vintage 37, Parker rating extended-parker-87) from the Pilot Initiative A vineyard with 10.40 acres, wine 102 (Red, vintage 41, Parker rating integrated-parker-88) from the Baseline Model vineyard with 15.10 acres, and wine 103 (Pinot Noir, vintage 45, Parker rating seasonal-parker-89) from the Distributed Cluster vineyard with 19.80 acres. The view surfaces the vineyard's ownership type and average vine age alongside the wine's characteristics, including whether it contains resveratrol.

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

This view presents the vineyard-wine relationship from the vineyard's perspective, answering which wine each vineyard produces. The joined records confirm that the Extended Review vineyard produces wine 100 (Pinot Noir), the Pilot Initiative A vineyard produces wine 101 (Burgundy), the Baseline Model vineyard produces wine 102 (Red), and the Distributed Cluster vineyard produces wine 103 (Pinot Noir). This orientation is useful when starting from a vineyard and tracing to its wine output.

### Wine and Restaurant Relationships

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

This view joins wines with their associated restaurants, answering which establishments carry which wines. The joined records show that wine 100 (Pinot Noir, vintage 33) is served at Extended Review, wine 101 (Burgundy, vintage 37) at Pilot Initiative A, wine 102 (Red, vintage 41) at Baseline Model, and wine 103 (Pinot Noir, vintage 45) at Distributed Cluster. The view surfaces the wine's producer, appellation, and Parker rating alongside the restaurant's location and corkage fee, providing a complete picture of wine availability at each establishment.

### Wine and Food Relationships

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

This view joins wines with their associated foods, answering which dishes accompany which wines. The joined records reveal that wine 100 (Pinot Noir, vintage 33, contains resveratrol) is paired with food 1, wine 101 (Burgundy, vintage 37, does not contain resveratrol) with food 2, wine 102 (Red, vintage 41, contains resveratrol) with food 3, and wine 103 (Pinot Noir, vintage 45, does not contain resveratrol) with food 4. The view surfaces the wine's variety and Parker rating alongside the food details, supporting menu planning and pairing analysis.

### Food and Restaurant Relationships

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

This view joins foods with their associated restaurants, answering which establishments serve which dishes. The joined records show that food 1 is served at Extended Review, food 2 at Pilot Initiative A, food 3 at Baseline Model, and food 4 at Distributed Cluster. The view surfaces the food's type alongside the restaurant's location and operating history, providing context for menu analysis.

### Chemical and Wine Relationships

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

This view joins chemicals with their associated wines, answering which chemical compounds are present in which wines. The joined records reveal that wine 100 (Pinot Noir, vintage 33, contains resveratrol) is linked to chemical records, wine 101 (Burgundy, vintage 37, does not contain resveratrol) to its own chemical records, wine 102 (Red, vintage 41, contains resveratrol) to its chemical records, and wine 103 (Pinot Noir, vintage 45, does not contain resveratrol) to its chemical records. The view surfaces the wine's variety and Parker rating alongside the chemical's name and type, supporting chemical analysis and quality assessment.

### Chemical and Personnel Relationships

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

This view joins chemicals with their associated persons, answering which individuals are connected to which chemical compounds. The joined records show that Stephanie Collins is linked to chemical records, Janice Johnston to chemical records, Upal Saha to chemical records, and Katherine Snyder to chemical records. The view surfaces the person's role and celebrity status alongside the chemical's name and type, providing context for understanding the chemical expertise and associations of each individual in the domain.

### Event and Wine Relationships

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

This view joins events with their associated wines, answering which wines are featured at which events. The joined records reveal that the Seasonal Standard Wine Dinner features wine 100 (Pinot Noir, vintage 33), the Integrated Framework Participation Dinner features wine 101 (Burgundy, vintage 37), the Extended Protocol D Tasting features wine 102 (Red, vintage 41), and the Pilot Programme Wine Dinner features wine 103 (Pinot Noir, vintage 45). The view surfaces the wine's producer and Parker rating alongside the event's type and date, supporting event planning and wine selection analysis.

### Event and Personnel Relationships

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

This view joins events with their associated persons, answering which individuals are connected to which events. The joined records show that the Seasonal Standard Wine Dinner is associated with Stephanie Collins, the Integrated Framework Participation Dinner with Janice Johnston, the Extended Protocol D Tasting with Upal Saha, and the Pilot Programme Wine Dinner with Katherine Snyder. The view surfaces the person's role and celebrity status alongside the event's type and participant requirements, providing a complete picture of personnel involvement in each event.

### Synthesis

The restaurant and wine industry domain forms a tightly coupled network of establishments, awards, personnel, wines, vineyards, events, foods, and chemicals. Restaurants serve as the central anchor, each linked to an award, a primary person, an owner, and an event. Wines connect to vineyards through their source, to persons through their association, to restaurants through their service, and to foods through their pairing. Vineyards produce wines and are linked to personnel. Events bring together restaurants, wines, and people in organized gatherings. Foods accompany wines in restaurant menus, and chemicals provide the chemical context for both wines and personnel. The foreign-key relationships between these entities create a comprehensive operational picture that supports analysis across every dimension of the domain — from award tracking and personnel management to event planning and chemical analysis.

## Data appendix

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
