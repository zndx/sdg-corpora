## The Taper Gage Registry: From Ontology to Relational Schema

The taper gage registry captures the lifecycle of precision measurement tools—ring and plug gages whose conical geometry must be specified, requested, manufactured, and tracked through calibration. Each gage carries a unique tool number, a mark size, and a status that moves it through a pipeline from `REQUESTED` to `CALIBRATED` to `SHIPPED`. The relational model decomposes this domain into six base tables and six materialized views, each view encoding a specific join that reconstructs a domain fact from the normalized tables. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become foreign keys and junction tables, and the views that answer the operational questions stakeholders actually ask.

**Table `taper_gages`**

| taper_gage_id | gage_type | tool_number | mark_size | status | large_end_diameter | small_end_diameter | taper_per_foot | taper_per_inch | taper_tolerance | included_angle | gage_specification_id | manufacturer_id | requestor_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | RING | TOO-2137 | compact-mark-38 | REQUESTED | 21.95 | 13.45 | 6.20 | 3.70 | 5.95 | 7.20 | 1 | 1000 | 1 |
| 2 | PLUG | TOO-2139 | composite-mark-39 | IN_PRODUCTION | 25.90 | 16.90 | 9.40 | 6.40 | 7.90 | 11.40 | 2 | 1001 | 2 |
| 3 | RING | TOO-2141 | primary-mark-40 | CALIBRATED | 29.85 | 20.35 | 12.60 | 9.10 | 9.85 | 15.60 | 3 | 1002 | 3 |
| 4 | PLUG | TOO-2143 | adaptive-mark-41 | SHIPPED | 33.80 | 23.80 | 15.80 | 11.80 | 11.80 | 19.80 | 4 | 1003 | 4 |

The `taper_gages` table is the central entity. Its primary key, `taper_gage_id`, is a surrogate integer that orders gages sequentially: 1, 2, 3, 4. The `gage_type` column distinguishes between `RING` and `PLUG` gages, while `tool_number` (e.g. `TOO-2137`, `TOO-2139`) provides a human-readable identifier. The `mark_size` column carries descriptive labels such as `compact-mark-38` or `adaptive-mark-41`. The `status` column enforces a finite lifecycle: `REQUESTED`, `IN_PRODUCTION`, `CALIBRATED`, and `SHIPPED`. The physical dimensions of each gage are captured in `large_end_diameter` and `small_end_diameter` (measured in millimetres, ranging from 13.45 to 33.80), the `taper_per_foot` and `taper_per_inch` columns encode the conical slope, and `taper_tolerance`, `included_angle` capture the angular precision. Three foreign keys anchor this table to the rest of the schema: `gage_specification_id` references `gage_specifications`, `manufacturer_id` references `manufacturers`, and `requestor_id` references `requestors`. These three FK columns express the *many-to-one* relationships that the ontology models as single-valued object properties.

**Table `gage_specifications`**

| gage_specification_id | large_end_diameter | small_end_diameter | taper_per_foot | taper_per_inch | taper_tolerance | half_angle | included_angle | has_steps | step_location | taper_gage_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 21.95 | 13.45 | 6.20 | 3.70 | 5.95 | 9.95 | 7.20 | true | LARGE_END | 1 |
| 2 | 25.90 | 16.90 | 9.40 | 6.40 | 7.90 | 12.90 | 11.40 | false | SMALL_END | 2 |
| 3 | 29.85 | 20.35 | 12.60 | 9.10 | 9.85 | 15.85 | 15.60 | true | NONE | 3 |
| 4 | 33.80 | 23.80 | 15.80 | 11.80 | 11.80 | 18.80 | 19.80 | false | LARGE_END | 4 |

The `gage_specifications` table stores the detailed geometric specification for each gage. Its primary key `gage_specification_id` is a surrogate integer, and the table includes a denormalized copy of the dimensional columns (`large_end_diameter`, `small_end_diameter`, `taper_per_foot`, `taper_per_inch`, `taper_tolerance`, `half_angle`, `included_angle`) alongside two additional attributes: `has_steps` (a boolean indicating whether the gage has stepped geometry) and `step_location` (one of `LARGE_END`, `SMALL_END`, or `NONE`). The foreign key `taper_gage_id` creates a one-to-one relationship back to `taper_gages`. In the ontology, this corresponds to a functional property: each gage has exactly one specification, and each specification belongs to exactly one gage. The data confirms this: specification 1 pairs with gage 1, specification 2 with gage 2, and so on. The `half_angle` column (values 9.95, 12.90, 15.85, 18.80) is a derived geometric quantity, while `included_angle` (7.20, 11.40, 15.60, 19.80) is the full cone angle.

**Table `requestors`**

| requestor_id | name | company | phone | email |
|---|---|---|---|---|
| 1 | Extended Review | Greater Houston Community Foundation | compact-phone-26 | seasonal-email-11 |
| 2 | Pilot Initiative A | General Electric | composite-phone-27 | regional-email-12 |
| 3 | Baseline Model | Litton Industries | primary-phone-28 | legacy-email-13 |
| 4 | Distributed Cluster | Feedback Rating | adaptive-phone-29 | compact-email-14 |

The `requestors` table models the organizations that request or commission taper gages. Its primary key is `requestor_id`, and the columns `name`, `company`, `phone`, and `email` store contact information. The four rows represent fictional entities: `Extended Review` (Greater Houston Community Foundation), `Pilot Initiative A` (General Electric), `Baseline Model` (Litton Industries), and `Distributed Cluster` (Feedback Rating). The `phone` and `email` columns carry synthetic placeholder values such as `compact-phone-26` and `seasonal-email-11`. In the ontology, `requestors` is an entity type with no subsumption hierarchy; each row is a distinct individual.

**Table `manufacturers`**

| id | name | contact_email |
|---|---|---|
| 1000 | Extended Review | Christopher Wilson |
| 1001 | Pilot Initiative A | Charles Larsen |
| 1002 | Baseline Model | Mary Alvarez |
| 1003 | Distributed Cluster | April Snyder |

The `manufacturers` table stores the organizations that produce taper gages. Its primary key is `id`, and the columns `name` and `contact_email` hold the organization's name and a contact email address. The four rows mirror the requestors in name (a design choice reflecting the fictional dataset): `Extended Review` (contact: Christopher Wilson), `Pilot Initiative A` (Charles Larsen), `Baseline Model` (Mary Alvarez), and `Distributed Cluster` (April Snyder). The `contact_email` column stores what appear to be person names rather than email addresses, but the column type and semantics are those of an email field. In the ontology, `manufacturers` is a peer entity type to `requestors`, both connected to `taper_gages` through many-to-many relationships.

**Table `requestors_gages`**

| requestor_id | taper_gage_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `requestors_gages` table materializes the many-to-many relationship between requestors and taper gages. Its composite primary key consists of `requestor_id` and `taper_gage_id`, each of which is a foreign key referencing `requestors` and `taper_gages` respectively. The eight rows encode the following assignments: requestor 1 (`Extended Review`) is associated with gages 1 and 2; requestor 2 (`Pilot Initiative A`) with gages 2 and 3; requestor 3 (`Baseline Model`) with gages 3 and 4; and requestor 4 (`Distributed Cluster`) with gages 4 and 1. This junction table is the relational encoding of the ontology's symmetric many-to-many object property, which cannot be expressed as a single foreign key column in either endpoint table.

**Table `manufacturers_gages`**

| manufacturer_id | taper_gage_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `manufacturers_gages` table is the symmetric junction table for the manufacturer–gage relationship. Its composite primary key is `manufacturer_id` and `taper_gage_id`, with foreign keys referencing `manufacturers` and `taper_gages`. The eight rows mirror the requestor assignments: manufacturer 1000 (`Extended Review`) produces gages 1 and 2; manufacturer 1001 (`Pilot Initiative A`) produces gages 2 and 3; manufacturer 1002 (`Baseline Model`) produces gages 3 and 4; and manufacturer 1003 (`Distributed Cluster`) produces gages 4 and 1. The parallel structure between `requestors_gages` and `manufacturers_gages` reflects the ontology's design where both requestors and manufacturers are peer entity types connected to `taper_gages` through identical many-to-many relationships.

The three foreign keys in `taper_gages` (`gage_specification_id`, `manufacturer_id`, `requestor_id`) express *many-to-one* relationships that are cardinality-bounded: each gage has exactly one specification, one manufacturer, and one requestor. The two junction tables express *many-to-many* relationships that are not cardinality-bounded in the same way: a requestor can request many gages, and a gage can be requested by many requestors. The schema thus combines both patterns, which is common in ontologies that mix functional properties (one-to-one or many-to-one) with non-functional object properties (many-to-many).

**View `v_taper_gage_gage_specification`**

```sql
CREATE VIEW v_taper_gage_gage_specification AS
SELECT a.taper_gage_id, a.gage_type, a.tool_number, a.mark_size, b.gage_specification_id AS specification_gage_specification_id, b.large_end_diameter AS specification_large_end_diameter, b.small_end_diameter AS specification_small_end_diameter
FROM taper_gages a JOIN gage_specifications b ON a.gage_specification_id = b.gage_specification_id;
```

| taper_gage_id | gage_type | tool_number | mark_size | specification_gage_specification_id | specification_large_end_diameter | specification_small_end_diameter |
|---|---|---|---|---|---|---|
| 1 | RING | TOO-2137 | compact-mark-38 | 1 | 21.95 | 13.45 |
| 2 | PLUG | TOO-2139 | composite-mark-39 | 2 | 25.90 | 16.90 |
| 3 | RING | TOO-2141 | primary-mark-40 | 3 | 29.85 | 20.35 |
| 4 | PLUG | TOO-2143 | adaptive-mark-41 | 4 | 33.80 | 23.80 |

The view `v_taper_gage_gage_specification` joins `taper_gages` to `gage_specifications` on `taper_gages.gage_specification_id = gage_specifications.gage_specification_id`. This join reconstructs the full geometric profile of each gage by combining the high-level metadata from `taper_gages` (tool number, mark size, status) with the detailed dimensional and angular data from `gage_specifications`. The view answers the question: "What are the complete physical specifications of each taper gage?" Reading the first row as evidence, the view would report that gage `TOO-2137` (a `RING` gage with status `REQUESTED`) has a large-end diameter of 21.95, a small-end diameter of 13.45, a taper of 6.20 per foot and 3.70 per inch, a tolerance of 5.95, a half-angle of 9.95, an included angle of 7.20, stepped geometry at the `LARGE_END`. The second row would show gage `TOO-2139` (a `PLUG` gage, `IN_PRODUCTION`) with no steps (`has_steps = false`, `step_location = SMALL_END`). This view is the primary query interface for quality engineers who need to inspect a gage's geometry without navigating between tables.

**View `v_taper_gage_manufacturer`**

```sql
CREATE VIEW v_taper_gage_manufacturer AS
SELECT a.taper_gage_id, a.gage_type, a.tool_number, a.mark_size, b.id AS manufacturer_id, b.name AS manufacturer_name, b.contact_email AS manufacturer_contact_email
FROM taper_gages a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| taper_gage_id | gage_type | tool_number | mark_size | manufacturer_id | manufacturer_name | manufacturer_contact_email |
|---|---|---|---|---|---|---|
| 1 | RING | TOO-2137 | compact-mark-38 | 1000 | Extended Review | Christopher Wilson |
| 2 | PLUG | TOO-2139 | composite-mark-39 | 1001 | Pilot Initiative A | Charles Larsen |
| 3 | RING | TOO-2141 | primary-mark-40 | 1002 | Baseline Model | Mary Alvarez |
| 4 | PLUG | TOO-2143 | adaptive-mark-41 | 1003 | Distributed Cluster | April Snyder |

The view `v_taper_gage_manufacturer` joins `taper_gages` to `manufacturers` on `taper_gages.manufacturer_id = manufacturers.id`. This join answers the question: "Which manufacturer is responsible for each taper gage?" The view combines the gage's tool number, type, and status with the manufacturer's name and contact email. The first row would show that gage `TOO-2137` (a `RING` gage, status `REQUESTED`) is produced by `Extended Review` (contact: Christopher Wilson). The second row would show gage `TOO-2139` (`PLUG`, `IN_PRODUCTION`) produced by `Pilot Initiative A` (Charles Larsen). Because the FK in `taper_gages` is many-to-one, this view produces exactly one row per gage, with the manufacturer's information repeated for each gage they produce. This view supports procurement queries such as "list all gages produced by a given manufacturer."

**View `v_taper_gage_requestor`**

```sql
CREATE VIEW v_taper_gage_requestor AS
SELECT a.taper_gage_id, a.gage_type, a.tool_number, a.mark_size, b.requestor_id AS requestor_requestor_id, b.name AS requestor_name, b.company AS requestor_company
FROM taper_gages a JOIN requestors b ON a.requestor_id = b.requestor_id;
```

| taper_gage_id | gage_type | tool_number | mark_size | requestor_requestor_id | requestor_name | requestor_company |
|---|---|---|---|---|---|---|
| 1 | RING | TOO-2137 | compact-mark-38 | 1 | Extended Review | Greater Houston Community Foundation |
| 2 | PLUG | TOO-2139 | composite-mark-39 | 2 | Pilot Initiative A | General Electric |
| 3 | RING | TOO-2141 | primary-mark-40 | 3 | Baseline Model | Litton Industries |
| 4 | PLUG | TOO-2143 | adaptive-mark-41 | 4 | Distributed Cluster | Feedback Rating |

The view `v_taper_gage_requestor` joins `taper_gages` to `requestors` on `taper_gages.requestor_id = requestors.requestor_id`. This join answers the question: "Which organization has requested each taper gage?" The view combines the gage's identifying and dimensional metadata with the requestor's name, company, phone, and email. The first row would report that gage `TOO-2137` (a `RING` gage, status `REQUESTED`) was requested by `Extended Review` (Greater Houston Community Foundation, phone `compact-phone-26`, email `seasonal-email-11`). The second row would show gage `TOO-2139` (`PLUG`, `IN_PRODUCTION`) requested by `Pilot Initiative A` (General Electric). Like the manufacturer view, this is a many-to-one join producing one row per gage. It supports operational queries such as "which gages has a given organization requested?"

**View `v_gage_specification_taper_gage`**

```sql
CREATE VIEW v_gage_specification_taper_gage AS
SELECT a.gage_specification_id, a.large_end_diameter, a.small_end_diameter, a.taper_per_foot, b.taper_gage_id AS gage_taper_gage_id, b.gage_type AS gage_gage_type, b.tool_number AS gage_tool_number
FROM gage_specifications a JOIN taper_gages b ON a.taper_gage_id = b.taper_gage_id;
```

| gage_specification_id | large_end_diameter | small_end_diameter | taper_per_foot | gage_taper_gage_id | gage_gage_type | gage_tool_number |
|---|---|---|---|---|---|---|
| 1 | 21.95 | 13.45 | 6.20 | 1 | RING | TOO-2137 |
| 2 | 25.90 | 16.90 | 9.40 | 2 | PLUG | TOO-2139 |
| 3 | 29.85 | 20.35 | 12.60 | 3 | RING | TOO-2141 |
| 4 | 33.80 | 23.80 | 15.80 | 4 | PLUG | TOO-2143 |

The view `v_gage_specification_taper_gage` joins `gage_specifications` to `taper_gages` on `gage_specifications.taper_gage_id = taper_gages.taper_gage_id`. This is the inverse of `v_taper_gage_gage_specification`: it starts from the specification side and attaches the gage-level metadata. The view answers the question: "For each gage specification, which gage does it belong to, and what is its current status?" The first row would show that specification 1 (large-end diameter 21.95, stepped at `LARGE_END`) belongs to gage `TOO-2137` (type `RING`, status `REQUESTED`). The third row would show specification 3 (large-end diameter 29.85, `has_steps = true`, `step_location = NONE`) belonging to gage `TOO-2141` (type `RING`, status `CALIBRATED`). This view is useful when the starting point is a specification record—for example, when a quality engineer wants to look up the current lifecycle status of the gage associated with a given specification.

**View `v_requestor_taper_gage_detail`**

```sql
CREATE VIEW v_requestor_taper_gage_detail AS
SELECT a.requestor_id, a.name, a.company, b.taper_gage_id AS gage_taper_gage_id, b.gage_type AS gage_gage_type, b.tool_number AS gage_tool_number
FROM requestors a
  JOIN requestors_gages j ON j.requestor_id = a.requestor_id
  JOIN taper_gages b ON b.taper_gage_id = j.taper_gage_id;
```

| requestor_id | name | company | gage_taper_gage_id | gage_gage_type | gage_tool_number |
|---|---|---|---|---|---|
| 1 | Extended Review | Greater Houston Community Foundation | 1 | RING | TOO-2137 |
| 1 | Extended Review | Greater Houston Community Foundation | 2 | PLUG | TOO-2139 |
| 2 | Pilot Initiative A | General Electric | 2 | PLUG | TOO-2139 |
| 2 | Pilot Initiative A | General Electric | 3 | RING | TOO-2141 |
| 3 | Baseline Model | Litton Industries | 3 | RING | TOO-2141 |
| 3 | Baseline Model | Litton Industries | 4 | PLUG | TOO-2143 |
| 4 | Distributed Cluster | Feedback Rating | 4 | PLUG | TOO-2143 |
| 4 | Distributed Cluster | Feedback Rating | 1 | RING | TOO-2137 |

The view `v_requestor_taper_gage_detail` joins `requestors` to `requestors_gages` to `taper_gages` on `requestors.requestor_id = requestors_gages.requestor_id` and `requestors_gages.taper_gage_id = taper_gages.taper_gage_id`. This join reconstructs the many-to-many relationship as a denormalized detail table. The view answers the question: "For each requestor, which gages have they requested, and what are those gages' types and statuses?" Because the junction table `requestors_gages` contains eight rows, this view produces eight rows. Reading the first two rows as evidence: requestor 1 (`Extended Review`, Greater Houston Community Foundation) has requested gage 1 (`TOO-2137`, `RING`, status `REQUESTED`) and gage 2 (`TOO-2139`, `PLUG`, status `IN_PRODUCTION`). The third and fourth rows would show requestor 2 (`Pilot Initiative A`, General Electric) requesting gages 2 and 3. This view is the operational interface for requestor dashboards, where a stakeholder needs to see all their requested gages in a single flat result set.

**View `v_manufacturer_taper_gage_detail`**

```sql
CREATE VIEW v_manufacturer_taper_gage_detail AS
SELECT a.id, a.name, a.contact_email, b.taper_gage_id AS gage_taper_gage_id, b.gage_type AS gage_gage_type, b.tool_number AS gage_tool_number
FROM manufacturers a
  JOIN manufacturers_gages j ON j.manufacturer_id = a.id
  JOIN taper_gages b ON b.taper_gage_id = j.taper_gage_id;
```

| id | name | contact_email | gage_taper_gage_id | gage_gage_type | gage_tool_number |
|---|---|---|---|---|---|
| 1000 | Extended Review | Christopher Wilson | 1 | RING | TOO-2137 |
| 1000 | Extended Review | Christopher Wilson | 2 | PLUG | TOO-2139 |
| 1001 | Pilot Initiative A | Charles Larsen | 2 | PLUG | TOO-2139 |
| 1001 | Pilot Initiative A | Charles Larsen | 3 | RING | TOO-2141 |
| 1002 | Baseline Model | Mary Alvarez | 3 | RING | TOO-2141 |
| 1002 | Baseline Model | Mary Alvarez | 4 | PLUG | TOO-2143 |
| 1003 | Distributed Cluster | April Snyder | 4 | PLUG | TOO-2143 |
| 1003 | Distributed Cluster | April Snyder | 1 | RING | TOO-2137 |

The view `v_manufacturer_taper_gage_detail` joins `manufacturers` to `manufacturers_gages` to `taper_gages` on `manufacturers.id = manufacturers_gages.manufacturer_id` and `manufacturers_gages.taper_gage_id = taper_gages.taper_gage_id`. This join reconstructs the manufacturer–gage many-to-many relationship as a denormalized detail table. The view answers the question: "For each manufacturer, which gages have they produced, and what are those gages' types and statuses?" The eight rows mirror the requestor detail view. The first two rows would show manufacturer 1000 (`Extended Review`, contact Christopher Wilson) producing gage 1 (`TOO-2137`, `RING`, status `REQUESTED`) and gage 2 (`TOO-2139`, `PLUG`, status `IN_PRODUCTION`). The third and fourth rows would show manufacturer 1001 (`Pilot Initiative A`, Charles Larsen) producing gages 2 and 3. This view supports production planning queries such as "list all gages produced by a given manufacturer, ordered by status."

The six views collectively cover all the join paths in the schema. The three "detail" views (`v_requestor_taper_gage_detail`, `v_manufacturer_taper_gage_detail`, and the specification views) materialize the many-to-many and one-to-one relationships as flat result sets, while the three "lookup" views (`v_taper_gage_gage_specification`, `v_taper_gage_manufacturer`, `v_taper_gage_requestor`) provide denormalized single-table interfaces for the three foreign-key relationships in `taper_gages`. Together, they encode the full ontology: four entity types (`taper_gages`, `gage_specifications`, `requestors`, `manufacturers`), two many-to-many relationships (requestor–gage, manufacturer–gage), and two one-to-one/many-to-one relationships (gage–specification, gage–manufacturer, gage–requestor). The schema is normalized to third normal form, with redundancy eliminated by separating the gage's lifecycle metadata from its geometric specification, and by separating the requestor and manufacturer entities from the gage entity itself. The views restore the denormalized facts that users need to answer operational questions, without requiring them to write joins explicitly.