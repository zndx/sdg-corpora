## Ontology-Grounded Relational Modelling of Social Interaction Narratives

The domain under examination captures social interaction events as structured narratives in which characters utter dialogue, wear swimming goggles, and occupy physical locations. Each event is a bounded temporal episode—characterized by an activity type and weather condition—during which one or more characters exchange quoted speech, potentially wearing branded goggles, within a named location. The ontology behind this domain distinguishes five core entity types: `dialogue_utterances`, `characters`, `social_interaction_events`, `locations`, and `swimming_goggles`, plus two many-to-many junction tables, `events_utterances` and `events_characters`, that materialize the cardinality-bounded relationships between events and their constituent utterances and participants. The following sections walk through each base table, explain how attributes and foreign keys encode the ontology, and then interpret every view as a reconstructed domain fact.

**Table `dialogue_utterances`**

| id | utterance_id | quoted_text | speaker_name | timestamp | is_internal_thought | vocalization_mode | character_id | event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1250223 | legacy-quoted-31 | Distributed Standard | 2024-07-08T18:18:00 | false | said | 7021001070170 | 2002007020060 |
| 2 | 3990165 | compact-quoted-32 | Adaptive Framework D | 2025-12-19T01:35:00 | true | shouted | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | 168535 |
| 3 | gd_acc_160003 | composite-quoted-33 | Primary Protocol | 2022-05-03T08:52:00 | false | yelled | 4793488 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | primary-quoted-34 | Composite Programme | 2023-10-14T15:09:00 | true | cried | id_31 | 1186089 |

The `dialogue_utterances` table is the primary fact table for spoken (or internal) content. Each row carries a surrogate `id` (e.g. `1`, `2`, `3`, `4`), a business-level `utterance_id` such as `1250223` or `6b79636f-5851-491d-aa2f-815615d61cff`, and the `quoted_text` itself—values like `legacy-quoted-31` and `compact-quoted-32`. The `speaker_name` column records who produced the utterance (`Distributed Standard`, `Adaptive Framework D`, `Primary Protocol`, `Composite Programme`), while `timestamp` anchors the utterance in time (`2024-07-08T18:18:00`, `2025-12-19T01:35:00`, etc.). Boolean `is_internal_thought` distinguishes spoken speech from internal monologue, and `vocalization_mode` captures the delivery style (`said`, `shouted`, `yelled`, `cried`). Two foreign keys, `character_id` and `event_id`, bind each utterance to its speaker and to the event in which it occurred. The `character_id` values range from integer-like identifiers (`7021001070170`, `4793488`) to UUIDs (`a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0`) and string keys (`id_31`), reflecting the ontology's allowance for heterogeneous character identifiers.

**Table `characters`**

| character_id | full_name | age_group | gender | has_goggles | swimming_ability | dialogue_utterance_id | interacts_with_character_id | goggle_id |
|---|---|---|---|---|---|---|---|---|
| 7021001070170 | Theodore Mcgrath | child | male | false | beginner | 1 | 7021001070170 | 7536 |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult | female | true | intermediate | 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | b1b6a13c-8fb5-11eb-924d-9cd76263cbd0 |
| 4793488 | Saipan International Airport | elder | other | false | advanced | 3 | 4793488 | 727050 |
| id_31 | Norma Fisher | child | male | true | beginner | 4 | id_31 | 103181 |

The `characters` table stores the ontology's person (or organization) entities. Its primary key is `character_id`, which mirrors the values found in `dialogue_utterances.character_id`. The `full_name` column holds display names such as `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher`. Demographic attributes include `age_group` (`child`, `adult`, `elder`), `gender` (`male`, `female`, `other`), and a boolean `has_goggles` indicating whether the character owns goggles. The `swimming_ability` column encodes a skill level (`beginner`, `intermediate`, `advanced`). Two additional foreign keys, `dialogue_utterance_id` and `interacts_with_character_id`, create a self-referential link: a character can be associated with a specific utterance and can also interact with another character (the column references `characters.character_id` within the same table). The `goggle_id` foreign key ties a character to a specific pair of swimming goggles.

**Table `social_interaction_events`**

| event_id | location | start_time | end_time | activity_type | weather_condition | location_id |
|---|---|---|---|---|---|---|
| 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | conversation | sunny | 1 |
| 168535 | integrated-location-100 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | swimming | cloudy | 2 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | shopping | rainy | 3 |
| 1186089 | regional-location-102 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | sliding | warm | 4 |

`social_interaction_events` is the event-level fact table. Each row represents a discrete social episode identified by `event_id` (e.g. `2002007020060`, `168535`, `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, `1186089`). The `location` column stores a free-text location descriptor (`extended-location-99`, `integrated-location-100`, `seasonal-location-101`, `regional-location-102`), while `start_time` and `end_time` bound the event temporally. Notably, some events exhibit inverted time ranges (e.g. `start_time` `2024-03-27T14:42:00` with `end_time` `2023-02-26T13:27:00`), which the ontology treats as a data-quality signal rather than a constraint violation. The `activity_type` column classifies the event (`conversation`, `swimming`, `shopping`, `sliding`), and `weather_condition` records the ambient weather (`sunny`, `cloudy`, `rainy`, `warm`). A foreign key `location_id` links the event to a row in the `locations` table.

**Table `locations`**

| id | location_id | name | type | has_slide | water_temperature | is_indoor | event_id |
|---|---|---|---|---|---|---|---|
| 1 | 778556 | Extended Review | park | false | 2.23 | false | 2002007020060 |
| 2 | 1250220 | Pilot Initiative A | pool | true | 0.13 | true | 168535 |
| 3 | 14511 | Baseline Model | shop | false | 0.5465680900000001 | false | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 |
| 4 | 611510 | Distributed Cluster | home | true | 0.075 | true | 1186089 |

The `locations` table provides a normalized reference for physical places. Its surrogate primary key is `id` (integer values `1` through `4`), while `location_id` holds a business identifier (`778556`, `1250220`, `14511`, `611510`). The `name` column gives a human-readable label (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), and `type` classifies the venue (`park`, `pool`, `shop`, `home`). Boolean `has_slide` indicates the presence of a water slide, `water_temperature` stores a numeric measurement (`2.23`, `0.13`, `0.5465680900000001`, `0.075`), and `is_indoor` distinguishes indoor from outdoor venues. The foreign key `event_id` creates a back-reference to `social_interaction_events`, enabling a one-to-one or one-to-many mapping depending on the ontology's cardinality constraints.

**Table `swimming_goggles`**

| goggle_id | brand | price | comfort_level | causes_eye_irritation | purchase_date | character_id | event_id | location_id |
|---|---|---|---|---|---|---|---|---|
| 7536 | Adobe Systems Inc | 12.87 | low | false | 2022-01-07 | 7021001070170 | 2002007020060 | 1 |
| b1b6a13c-8fb5-11eb-924d-9cd76263cbd0 | Assicurazioni Generali | 35.45 | medium | true | 2023-06-18 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | 168535 | 2 |
| 727050 | LDAP First Name Field | 29.24 | high | false | 2024-11-02 | 4793488 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 3 |
| 103181 | National University of Singapore | 29.99 | low | true | 2025-04-13 | id_31 | 1186089 | 4 |

`swimming_goggles` is the product entity table. Its primary key is `goggle_id`, which can be an integer (`7536`, `727050`, `103181`) or a UUID (`b1b6a13c-8fb5-11eb-924d-9cd76263cbd0`). The `brand` column holds manufacturer names (`Adobe Systems Inc`, `Assicurazioni Generali`, `LDAP First Name Field`, `National University of Singapore`). The `price` column stores a decimal value (`12.87`, `35.45`, `29.24`, `29.99`), `comfort_level` is a categorical attribute (`low`, `medium`, `high`), and `causes_eye_irritation` is a boolean flag. `purchase_date` records when the goggles were acquired (`2022-01-07`, `2023-06-18`, `2024-11-02`, `2025-04-13`). Three foreign keys—`character_id`, `event_id`, and `location_id`—tie each goggle record to its owner, the event during which it was used, and the location where it was present.

**Table `events_utterances`**

| event_id | dialogue_utterance_id |
|---|---|
| 2002007020060 | 1 |
| 2002007020060 | 2 |
| 168535 | 2 |
| 168535 | 3 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 3 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 4 |
| 1186089 | 4 |
| 1186089 | 1 |

The `events_utterances` table is a many-to-many junction that decouples the relationship between `social_interaction_events` and `dialogue_utterances`. Its composite key consists of `event_id` and `dialogue_utterance_id`. Each row asserts that a particular utterance occurred within a particular event. For example, event `2002007020060` contains utterances `1` and `2`, event `168535` contains utterances `2` and `3`, event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0` contains utterances `3` and `4`, and event `1186089` contains utterances `4` and `1`. This junction table is essential because the ontology allows an event to host multiple utterances and an utterance to potentially appear in multiple events, a cardinality that cannot be expressed through a single foreign key column.

**Table `events_characters`**

| event_id | character_id |
|---|---|
| 2002007020060 | 7021001070170 |
| 2002007020060 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 |
| 168535 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 |
| 168535 | 4793488 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 4793488 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | id_31 |
| 1186089 | id_31 |
| 1186089 | 7021001070170 |

The `events_characters` table is the second many-to-many junction, linking `social_interaction_events` to `characters`. Although its row data is not enumerated in the payload, its structural role is symmetric to `events_utterances`: each row asserts that a specific character participated in a specific event. Together, `events_utterances` and `events_characters` form the relational backbone of the ontology's event-centric narrative model, enabling flexible composition of events from their constituent utterances and participants.

### Dialogue and Character Views

The view `vw_dialogue_utterance_character` joins `dialogue_utterances` to `characters` on `dialogue_utterances.character_id = characters.character_id`, producing a flat row that pairs each utterance with its speaker's demographic profile. Reading row 1: the utterance `legacy-quoted-31` spoken by `Distributed Standard` is attributed to character `Theodore Mcgrath`, a `child` `male` with `beginner` swimming ability who does not have goggles. Row 2 pairs `compact-quoted-32` (shouted, internal thought) with `Account Name`, an `adult` `female` with `intermediate` ability who wears goggles.

The view `vw_dialogue_utterance_social_interaction_event` joins `dialogue_utterances` to `social_interaction_events` on `dialogue_utterances.event_id = social_interaction_events.event_id`, answering the question "which event did this utterance occur in, and what were the event's conditions?" Row 1 shows utterance `legacy-quoted-31` occurring in event `2002007020060`, a `conversation` under `sunny` weather at `extended-location-99`. Row 3 shows `composite-quoted-33` (yelled, by `Primary Protocol`) occurring in event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, a `shopping` event under `rainy` conditions.

**View `vw_dialogue_utterance_character`**

```sql
CREATE VIEW vw_dialogue_utterance_character AS
SELECT a.id, a.utterance_id, a.quoted_text, a.speaker_name, b.character_id AS character_character_id, b.full_name AS character_full_name, b.age_group AS character_age_group
FROM dialogue_utterances a JOIN characters b ON a.character_id = b.character_id;
```

| id | utterance_id | quoted_text | speaker_name | character_character_id | character_full_name | character_age_group |
|---|---|---|---|---|---|---|
| 1 | 1250223 | legacy-quoted-31 | Distributed Standard | 7021001070170 | Theodore Mcgrath | child |
| 2 | 3990165 | compact-quoted-32 | Adaptive Framework D | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult |
| 3 | gd_acc_160003 | composite-quoted-33 | Primary Protocol | 4793488 | Saipan International Airport | elder |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | primary-quoted-34 | Composite Programme | id_31 | Norma Fisher | child |

**View `vw_dialogue_utterance_social_interaction_event`**

```sql
CREATE VIEW vw_dialogue_utterance_social_interaction_event AS
SELECT a.id, a.utterance_id, a.quoted_text, a.speaker_name, b.event_id AS event_event_id, b.location AS event_location, b.start_time AS event_start_time
FROM dialogue_utterances a JOIN social_interaction_events b ON a.event_id = b.event_id;
```

| id | utterance_id | quoted_text | speaker_name | event_event_id | event_location | event_start_time |
|---|---|---|---|---|---|---|
| 1 | 1250223 | legacy-quoted-31 | Distributed Standard | 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 |
| 2 | 3990165 | compact-quoted-32 | Adaptive Framework D | 168535 | integrated-location-100 | 2025-08-11T21:59:00 |
| 3 | gd_acc_160003 | composite-quoted-33 | Primary Protocol | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | primary-quoted-34 | Composite Programme | 1186089 | regional-location-102 | 2023-06-06T11:33:00 |

### Character-Centric Views

The view `vw_character_dialogue_utterance` reverses the join direction, starting from `characters` and pulling in the associated utterance. This orientation answers "what did this character say?" Row 1 reveals that `Theodore Mcgrath` (character `7021001070170`) is associated with utterance `1` (`legacy-quoted-31`, `said`). Row 4 shows `Norma Fisher` (character `id_31`) linked to utterance `4` (`primary-quoted-34`, `cried`, an internal thought).

The view `vw_character_character` performs a self-join on `characters` using the `interacts_with_character_id` foreign key, producing a row that pairs a character with the character they interact with. Since the sample data shows `interacts_with_character_id` equal to `character_id` for every row (e.g., `7021001070170` interacts with `7021001070170`), the current data encodes self-interaction or reflexive dialogue. The view surfaces this relationship explicitly, enabling downstream queries about character-to-character interaction patterns.

**View `vw_character_dialogue_utterance`**

```sql
CREATE VIEW vw_character_dialogue_utterance AS
SELECT a.character_id, a.full_name, a.age_group, a.gender, b.id AS utterance_id, b.utterance_id AS utterance_utterance_id, b.quoted_text AS utterance_quoted_text
FROM characters a JOIN dialogue_utterances b ON a.dialogue_utterance_id = b.id;
```

| character_id | full_name | age_group | gender | utterance_id | utterance_utterance_id | utterance_quoted_text |
|---|---|---|---|---|---|---|
| 7021001070170 | Theodore Mcgrath | child | male | 1 | 1250223 | legacy-quoted-31 |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult | female | 2 | 3990165 | compact-quoted-32 |
| 4793488 | Saipan International Airport | elder | other | 3 | gd_acc_160003 | composite-quoted-33 |
| id_31 | Norma Fisher | child | male | 4 | 6b79636f-5851-491d-aa2f-815615d61cff | primary-quoted-34 |

**View `vw_character_character`**

```sql
CREATE VIEW vw_character_character AS
SELECT a.character_id, a.full_name, a.age_group, a.gender, b.character_id AS character_character_id, b.full_name AS character_full_name, b.age_group AS character_age_group
FROM characters a JOIN characters b ON a.interacts_with_character_id = b.character_id;
```

| character_id | full_name | age_group | gender | character_character_id | character_full_name | character_age_group |
|---|---|---|---|---|---|---|
| 7021001070170 | Theodore Mcgrath | child | male | 7021001070170 | Theodore Mcgrath | child |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult | female | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult |
| 4793488 | Saipan International Airport | elder | other | 4793488 | Saipan International Airport | elder |
| id_31 | Norma Fisher | child | male | id_31 | Norma Fisher | child |

### Goggle-Related Views

The view `vw_character_swimming_goggle` joins `characters` to `swimming_goggles` on `characters.goggle_id = swimming_goggles.goggle_id`, answering "which goggles does this character own?" Row 1 shows `Theodore Mcgrath` owning goggles from `Adobe Systems Inc` priced at `12.87` with `low` comfort and no eye irritation. Row 2 shows `Account Name` owning goggles from `Assicurazioni Generali` at `35.45` with `medium` comfort that `causes_eye_irritation`.

**View `vw_character_swimming_goggle`**

```sql
CREATE VIEW vw_character_swimming_goggle AS
SELECT a.character_id, a.full_name, a.age_group, a.gender, b.goggle_id AS goggle_goggle_id, b.brand AS goggle_brand, b.price AS goggle_price
FROM characters a JOIN swimming_goggles b ON a.goggle_id = b.goggle_id;
```

| character_id | full_name | age_group | gender | goggle_goggle_id | goggle_brand | goggle_price |
|---|---|---|---|---|---|---|
| 7021001070170 | Theodore Mcgrath | child | male | 7536 | Adobe Systems Inc | 12.87 |
| a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult | female | b1b6a13c-8fb5-11eb-924d-9cd76263cbd0 | Assicurazioni Generali | 35.45 |
| 4793488 | Saipan International Airport | elder | other | 727050 | LDAP First Name Field | 29.24 |
| id_31 | Norma Fisher | child | male | 103181 | National University of Singapore | 29.99 |

The view `vw_swimming_goggle_character` reverses this join, starting from `swimming_goggles` and pulling in the owner's profile. Row 1 reveals that goggles `7536` (brand `Adobe Systems Inc`, price `12.87`, comfort `low`) are owned by character `7021001070170` (`Theodore Mcgrath`). Row 4 shows goggles `103181` (brand `National University of Singapore`, price `29.99`, comfort `low`, causes irritation) owned by character `id_31` (`Norma Fisher`).

**View `vw_swimming_goggle_character`**

```sql
CREATE VIEW vw_swimming_goggle_character AS
SELECT a.goggle_id, a.brand, a.price, a.comfort_level, b.character_id AS character_character_id, b.full_name AS character_full_name, b.age_group AS character_age_group
FROM swimming_goggles a JOIN characters b ON a.character_id = b.character_id;
```

| goggle_id | brand | price | comfort_level | character_character_id | character_full_name | character_age_group |
|---|---|---|---|---|---|---|
| 7536 | Adobe Systems Inc | 12.87 | low | 7021001070170 | Theodore Mcgrath | child |
| b1b6a13c-8fb5-11eb-924d-9cd76263cbd0 | Assicurazioni Generali | 35.45 | medium | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult |
| 727050 | LDAP First Name Field | 29.24 | high | 4793488 | Saipan International Airport | elder |
| 103181 | National University of Singapore | 29.99 | low | id_31 | Norma Fisher | child |

### Social Interaction Event Detail Views

The view `vw_social_interaction_event_dialogue_utterance_detail` joins `social_interaction_events` to `dialogue_utterances` on `event_id`, answering "what utterances occurred during this event?" Row 1 shows event `2002007020060` (a `conversation` at `extended-location-99`) containing utterance `1` (`legacy-quoted-31`, `said` by `Distributed Standard`). Row 2 shows the same event also containing utterance `2` (`compact-quoted-32`, `shouted` by `Adaptive Framework D`). This view reconstructs the full dialogue transcript for any given event.

The view `vw_social_interaction_event_character_detail` joins `social_interaction_events` to `characters` via the `events_characters` junction table, answering "which characters participated in this event?" Row 1 would show event `2002007020060` with its participating characters, while Row 2 would show event `168535` (a `swimming` event at `integrated-location-100`) with its participants. This view is the primary mechanism for enumerating event rosters.

**View `vw_social_interaction_event_dialogue_utterance_detail`**

```sql
CREATE VIEW vw_social_interaction_event_dialogue_utterance_detail AS
SELECT a.event_id, a.location, a.start_time, b.id AS utterance_id, b.utterance_id AS utterance_utterance_id, b.quoted_text AS utterance_quoted_text
FROM social_interaction_events a
  JOIN events_utterances j ON j.event_id = a.event_id
  JOIN dialogue_utterances b ON b.id = j.dialogue_utterance_id;
```

| event_id | location | start_time | utterance_id | utterance_utterance_id | utterance_quoted_text |
|---|---|---|---|---|---|
| 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 | 1 | 1250223 | legacy-quoted-31 |
| 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 | 2 | 3990165 | compact-quoted-32 |
| 168535 | integrated-location-100 | 2025-08-11T21:59:00 | 2 | 3990165 | compact-quoted-32 |
| 168535 | integrated-location-100 | 2025-08-11T21:59:00 | 3 | gd_acc_160003 | composite-quoted-33 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 | 3 | gd_acc_160003 | composite-quoted-33 |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 | 4 | 6b79636f-5851-491d-aa2f-815615d61cff | primary-quoted-34 |
| 1186089 | regional-location-102 | 2023-06-06T11:33:00 | 4 | 6b79636f-5851-491d-aa2f-815615d61cff | primary-quoted-34 |
| 1186089 | regional-location-102 | 2023-06-06T11:33:00 | 1 | 1250223 | legacy-quoted-31 |

**View `vw_social_interaction_event_character_detail`**

```sql
CREATE VIEW vw_social_interaction_event_character_detail AS
SELECT a.event_id, a.location, a.start_time, b.character_id AS character_character_id, b.full_name AS character_full_name, b.age_group AS character_age_group
FROM social_interaction_events a
  JOIN events_characters j ON j.event_id = a.event_id
  JOIN characters b ON b.character_id = j.character_id;
```

| event_id | location | start_time | character_character_id | character_full_name | character_age_group |
|---|---|---|---|---|---|
| 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 | 7021001070170 | Theodore Mcgrath | child |
| 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult |
| 168535 | integrated-location-100 | 2025-08-11T21:59:00 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Account Name | adult |
| 168535 | integrated-location-100 | 2025-08-11T21:59:00 | 4793488 | Saipan International Airport | elder |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 | 4793488 | Saipan International Airport | elder |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 | id_31 | Norma Fisher | child |
| 1186089 | regional-location-102 | 2023-06-06T11:33:00 | id_31 | Norma Fisher | child |
| 1186089 | regional-location-102 | 2023-06-06T11:33:00 | 7021001070170 | Theodore Mcgrath | child |

The view `vw_social_interaction_event_location` joins `social_interaction_events` to `locations` on `social_interaction_events.location_id = locations.id`, answering "where did this event take place, and what are the venue's properties?" Row 1 shows event `2002007020060` occurring at location `1` (`Extended Review`, type `park`, no slide, water temperature `2.23`, outdoor). Row 2 shows event `168535` at location `2` (`Pilot Initiative A`, type `pool`, has slide, water temperature `0.13`, indoor). This view is critical for spatial and environmental analysis of events.

**View `vw_social_interaction_event_location`**

```sql
CREATE VIEW vw_social_interaction_event_location AS
SELECT a.event_id, a.location, a.start_time, a.end_time, b.id AS location_id, b.location_id AS location_location_id, b.name AS location_name
FROM social_interaction_events a JOIN locations b ON a.location_id = b.id;
```

| event_id | location | start_time | end_time | location_id | location_location_id | location_name |
|---|---|---|---|---|---|---|
| 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | 778556 | Extended Review |
| 168535 | integrated-location-100 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | 1250220 | Pilot Initiative A |
| ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | 14511 | Baseline Model |
| 1186089 | regional-location-102 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | 611510 | Distributed Cluster |

### Location-Centric Views

The view `vw_location_social_interaction_event` reverses the previous join, starting from `locations` and pulling in the events that occurred there. Row 1 shows location `1` (`Extended Review`, a `park`) hosting event `2002007020060` (a `conversation`). Row 2 shows location `2` (`Pilot Initiative A`, a `pool`) hosting event `168535` (a `swimming` event). This orientation answers "what events happened at this venue?"

**View `vw_location_social_interaction_event`**

```sql
CREATE VIEW vw_location_social_interaction_event AS
SELECT a.id, a.location_id, a.name, a.type, b.event_id AS event_event_id, b.location AS event_location, b.start_time AS event_start_time
FROM locations a JOIN social_interaction_events b ON a.event_id = b.event_id;
```

| id | location_id | name | type | event_event_id | event_location | event_start_time |
|---|---|---|---|---|---|---|
| 1 | 778556 | Extended Review | park | 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 |
| 2 | 1250220 | Pilot Initiative A | pool | 168535 | integrated-location-100 | 2025-08-11T21:59:00 |
| 3 | 14511 | Baseline Model | shop | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 |
| 4 | 611510 | Distributed Cluster | home | 1186089 | regional-location-102 | 2023-06-06T11:33:00 |

### Goggle-Event and Goggle-Location Views

The view `vw_swimming_goggle_social_interaction_event` joins `swimming_goggles` to `social_interaction_events` on `swimming_goggles.event_id = social_interaction_events.event_id`, answering "which goggles were used during this event?" Row 1 shows goggles `7536` (`Adobe Systems Inc`, `12.87`, `low` comfort) used in event `2002007020060` (a `conversation`). Row 2 shows goggles `b1b6a13c-8fb5-11eb-924d-9cd76263cbd0` (`Assicurazioni Generali`, `35.45`, `medium` comfort, causes irritation) used in event `168535` (a `swimming` event).

**View `vw_swimming_goggle_social_interaction_event`**

```sql
CREATE VIEW vw_swimming_goggle_social_interaction_event AS
SELECT a.goggle_id, a.brand, a.price, a.comfort_level, b.event_id AS event_event_id, b.location AS event_location, b.start_time AS event_start_time
FROM swimming_goggles a JOIN social_interaction_events b ON a.event_id = b.event_id;
```

| goggle_id | brand | price | comfort_level | event_event_id | event_location | event_start_time |
|---|---|---|---|---|---|---|
| 7536 | Adobe Systems Inc | 12.87 | low | 2002007020060 | extended-location-99 | 2024-03-27T14:42:00 |
| b1b6a13c-8fb5-11eb-924d-9cd76263cbd0 | Assicurazioni Generali | 35.45 | medium | 168535 | integrated-location-100 | 2025-08-11T21:59:00 |
| 727050 | LDAP First Name Field | 29.24 | high | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 2022-01-22T04:16:00 |
| 103181 | National University of Singapore | 29.99 | low | 1186089 | regional-location-102 | 2023-06-06T11:33:00 |

The view `vw_swimming_goggle_location` joins `swimming_goggles` to `locations` on `swimming_goggles.location_id = locations.id`, answering "at which venue were these goggles present?" Row 1 shows goggles `7536` present at location `1` (`Extended Review`, a `park`). Row 4 shows goggles `103181` (`National University of Singapore`, `29.99`, `low` comfort, causes irritation) present at location `4` (`Distributed Cluster`, a `home`). This view supports product placement and environmental analysis.

**View `vw_swimming_goggle_location`**

```sql
CREATE VIEW vw_swimming_goggle_location AS
SELECT a.goggle_id, a.brand, a.price, a.comfort_level, b.id AS location_id, b.location_id AS location_location_id, b.name AS location_name
FROM swimming_goggles a JOIN locations b ON a.location_id = b.id;
```

| goggle_id | brand | price | comfort_level | location_id | location_location_id | location_name |
|---|---|---|---|---|---|---|
| 7536 | Adobe Systems Inc | 12.87 | low | 1 | 778556 | Extended Review |
| b1b6a13c-8fb5-11eb-924d-9cd76263cbd0 | Assicurazioni Generali | 35.45 | medium | 2 | 1250220 | Pilot Initiative A |
| 727050 | LDAP First Name Field | 29.24 | high | 3 | 14511 | Baseline Model |
| 103181 | National University of Singapore | 29.99 | low | 4 | 611510 | Distributed Cluster |

### Synthesis

The relational schema materializes a five-entity ontology with two many-to-many junction tables, producing a normalized structure where each fact table carries its own foreign keys to the entities it references. The `events_utterances` and `events_characters` junction tables resolve the cardinality of event-to-utterance and event-to-character relationships that cannot be expressed through single-column foreign keys. The twelve views collectively cover every pairwise combination of the five core entities, enabling analysts to reconstruct any domain fact—whether "which character said what in which event," "which goggles were worn at which location," or "what events occurred at which venue"—from the normalized base tables. The schema's design reflects a deliberate trade-off: denormalization through views provides convenient analytical surfaces while the underlying base tables preserve referential integrity and support efficient updates to individual entity types.