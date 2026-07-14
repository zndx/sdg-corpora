The product design lifecycle in this domain spans conceptual ideation through competitive evaluation, with every artifact—designs, designers, software tools, competitions, renders, and firms—captured as first-class entities in a normalized relational schema. The model separates concerns into six base tables that store core entities, four junction tables that resolve many-to-many associations, and eighteen derived views that materialize the most common analytical joins. Each view answers a specific domain question by reassembling facts from the normalized tables, and every column traces back to a single source table or a join path that preserves referential integrity. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become foreign keys and junction tables, and the view-level reconstructions that turn normalized rows into readable domain facts.

## Base Tables and Entity Types

The central entity is the product design, captured in the `product_designs` table. Each row represents a discrete design artifact identified by a surrogate `id` and a human-readable `design_identifier` such as `DES-2225` or `DES-2234`. The `design_name` column carries descriptive labels like *Composite Model*, *Compact Cluster A*, *Legacy Review*, and *Regional Initiative*. A `design_status` column constrains the lifecycle stage to one of four values—`concept`, `draft`, `final`, or `manufactured`—while `creation_date` records the ISO-8601 timestamp of the design's inception, for example `2022-01-13T12:24:00`. The `designer_role` column stores a role identifier such as `integrated-designer-88` or `seasonal-designer-89`, and `rendering_complexity` holds an integer metric (15, 23, 31, 39) that quantifies the visual sophistication of the design. Four foreign-key columns anchor the design to its surrounding ecosystem: `designer_id` points to the `designers` table, `software_tool_id` to `software_tools`, `design_competition_id` to `design_competitions`, and `render_id` to `photorealistic_renders`.

**Table `product_designs`**

| id | design_identifier | design_name | design_status | creation_date | designer_role | rendering_complexity | designer_id | software_tool_id | design_competition_id | render_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | DES-2225 | Composite Model | concept | 2022-01-13T12:24:00 | integrated-designer-88 | 15 | 1000 | 1 | 1000 | 4843 |
| 101 | DES-2228 | Compact Cluster A | draft | 2023-06-24T19:41:00 | seasonal-designer-89 | 23 | 1001 | 2 | 1001 | 1208-0004-L |
| 102 | DES-2231 | Legacy Review | final | 2024-11-08T02:58:00 | regional-designer-90 | 31 | 1002 | 3 | 1002 | 10445634 |
| 103 | DES-2234 | Regional Initiative | manufactured | 2025-04-19T09:15:00 | legacy-designer-91 | 39 | 1003 | 4 | 1003 | 4102 |

The `designers` table stores individual designers as rows keyed by `id` and a secondary `designer_id` that may carry a UUID-style value like `5fc685e2-8fcc-11eb-924d-9cd76263cbd0`. The `designer_name` column holds human-readable names—*Christopher Wilson*, *Charles Larsen*, *Mary Alvarez*, *April Snyder*—while `employment_status` constrains the relationship to the industry to `employed`, `independent`, or `retired`. The `career_start_year` column is an integer (8, 16, 24, 32) indicating years of professional experience, and `primary_skill` stores a categorical label such as `seasonal-primary-53` or `regional-primary-54`. The `contact_email` column provides an email address for each designer. Two foreign-key columns, `design_firm_id` and `design_competition_id`, link the designer to their affiliated firm and to a competition they participate in.

**Table `designers`**

| id | designer_id | designer_name | employment_status | career_start_year | primary_skill | contact_email | design_firm_id | design_competition_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1186089 | Adaptive Series | employed | 8 | seasonal-primary-53 | Christopher Wilson | 1 | 1000 |
| 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment | independent | 16 | regional-primary-54 | Charles Larsen | 2 | 1001 |
| 1002 | 6564372 | Composite Survey D | retired | 24 | legacy-primary-55 | Mary Alvarez | 3 | 1002 |
| 1003 | 4060650 | Compact Corridor | employed | 32 | compact-primary-56 | April Snyder | 4 | 1003 |

Software tools used in the design process are catalogued in `software_tools`. Each row has a surrogate `id`, a `software_id` (e.g., `gd_taxc_2111` or `5917273`), and a `software_name` such as *Primary Review A*, *Composite Initiative*, *Compact Model*, and *Legacy Cluster D*. The `software_version` column stores version strings like `seasonal-software-47` or `legacy-software-49`, while `developer_name` identifies the tool's creator—*Composite Protocol*, *Compact Programme A*, *Legacy Standard*, *Regional Framework*. The `interface_type` column constrains the user interface to `gui`, `cli`, or `hybrid`, and `learning_curve` stores a categorical difficulty level (`low`, `medium`, `high`). A single foreign-key column, `product_design_id`, ties each tool to the product design it supports.

**Table `software_tools`**

| id | software_id | software_name | software_version | developer_name | interface_type | learning_curve | product_design_id |
|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | seasonal-software-47 | Composite Protocol | gui | low | 100 |
| 2 | 5917273 | Composite Initiative | regional-software-48 | Compact Programme A | cli | medium | 101 |
| 3 | id_4 | Compact Model | legacy-software-49 | Legacy Standard | hybrid | high | 102 |
| 4 | 8928496 | Legacy Cluster D | compact-software-50 | Regional Framework | gui | low | 103 |

Design competitions are recorded in `design_competitions`. The table's primary key is `id`, and each competition carries a `competition_id` (e.g., `4277014`, `575210`, `619`, `10449520`) alongside a `competition_name` such as *Compact Model*, *Legacy Cluster*, *Regional Review A*, and *Seasonal Initiative*. The `competition_year` column stores an integer (13, 20, 27, 34), and `organizer_name` names the organizing body—*Compact Framework*, *Legacy Protocol*, *Regional Programme A*, *Seasonal Standard*. The `evaluation_criteria` column holds a categorical label like `primary-evaluati-52` or `adaptive-evaluati-53`, while `grand_prize_awarded` is a boolean (`true` or `false`). Two foreign-key columns, `design_firm_id` and `designer_id`, associate the competition with a firm and a designer.

**Table `design_competitions`**

| id | competition_id | competition_name | competition_year | organizer_name | evaluation_criteria | grand_prize_awarded | design_firm_id | designer_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 4277014 | Compact Model | 13 | Compact Framework | primary-evaluati-52 | false | 1 | 1000 |
| 1001 | 575210 | Legacy Cluster | 20 | Legacy Protocol | adaptive-evaluati-53 | true | 2 | 1001 |
| 1002 | 619 | Regional Review A | 27 | Regional Programme A | distributed-evaluati-54 | false | 3 | 1002 |
| 1003 | 10449520 | Seasonal Initiative | 34 | Seasonal Standard | baseline-evaluati-55 | true | 4 | 1003 |

Photorealistic renders are stored in `photorealistic_renders`, keyed by `render_id` which may be numeric (`4843`, `10445634`, `4102`) or alphanumeric (`1208-0004-L`). The `render_date` column records the ISO-8601 timestamp of render creation, and `lighting_setup` stores a categorical label such as `regional-lighting-60` or `legacy-lighting-61`. The `resolution` column holds an integer (15, 20, 25, 30), while `render_time_hours` and `file_size_m_b` store floating-point metrics (e.g., 21.45 hours, 344.85 MB). The `product_design_id`, `software_tool_id`, and `design_competition_id` columns are foreign keys linking the render to its design, the tool used to create it, and the competition it was submitted to. The `created_at` and `updated_at` columns track audit timestamps.

**Table `photorealistic_renders`**

| render_id | render_date | lighting_setup | resolution | render_time_hours | file_size_m_b | product_design_id | software_tool_id | design_competition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 4843 | 2023-06-02T17:51:00 | regional-lighting-60 | 15 | 21.45 | 344.8468322753906 | 100 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1208-0004-L | 2024-11-13T00:08:00 | legacy-lighting-61 | 20 | 23.90 | 226.0 | 101 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 10445634 | 2025-04-24T07:25:00 | compact-lighting-62 | 25 | 26.35 | 34.400001525878906 | 102 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4102 | 2022-09-08T14:42:00 | composite-lighting-63 | 30 | 28.80 | 189.85751 | 103 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Design firms are catalogued in `design_firms`. Each row has a surrogate `id`, a `firm_id` (e.g., `575216`, `e4ea9416-8fd1-11eb-924d-9cd76263cbd0`), and a `firm_name` such as *Legacy Review D*, *Regional Initiative*, *Seasonal Model*, and *Integrated Cluster A*. The `founding_year` column stores an integer (43, 48, 53, 58), and `headquarters_location` holds a categorical location label like `composite-headquar-63` or `distributed-headquar-66`. The `firm_type` column constrains the organizational structure to `independent`, `merged`, or `subsidiary`, while `active_status` is a boolean (`true` or `false`). Two foreign-key columns, `design_competition_id` and `design_firm_id`, link the firm to a competition and to another firm, enabling self-referential relationships.

**Table `design_firms`**

| id | firm_id | firm_name | founding_year | headquarters_location | firm_type | active_status | design_competition_id | design_firm_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 43 | composite-headquar-63 | independent | false | 1000 | 1 |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | primary-headquar-64 | merged | true | 1001 | 2 |
| 3 | 884351 | Seasonal Model | 53 | adaptive-headquar-65 | subsidiary | false | 1002 | 3 |
| 4 | L907 | Integrated Cluster A | 58 | distributed-headquar-66 | independent | true | 1003 | 4 |

## Junction Tables and Many-to-Many Relationships

The six base tables above capture one-to-many and many-to-one relationships through their foreign-key columns. However, several domain relationships are inherently many-to-many and require junction tables to materialize correctly. The `designers_designs` junction table resolves the association between designers and product designs, allowing a single designer to be linked to multiple designs and a single design to be attributed to multiple designers. Each row in this table contains the composite key of the two entities it connects.

**Table `designers_designs`**

| designer_id | product_design_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `tools_designers` junction table resolves the relationship between software tools and designers, capturing which designers use which tools. This is a classic many-to-many pattern: a designer may be proficient in multiple tools, and a tool may be used by multiple designers. The junction table's rows encode these pairings as composite foreign keys.

**Table `tools_designers`**

| software_tool_id | designer_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `competitions_designs` junction table resolves the many-to-many relationship between design competitions and product designs. A competition may feature multiple designs, and a design may be submitted to multiple competitions. The junction table's rows store the pairing of a competition identifier with a design identifier.

**Table `competitions_designs`**

| design_competition_id | product_design_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `firms_designers` junction table resolves the relationship between design firms and designers. A firm may employ multiple designers, and a designer may have worked with multiple firms over their career. The junction table encodes these associations as composite foreign keys.

**Table `firms_designers`**

| design_firm_id | designer_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## Views and Analytical Joins

The normalized base tables and junction tables form the physical layer of the schema. The logical layer is provided by eighteen views, each of which joins two or more tables to answer a specific analytical question. These views do not store data; they materialize a join path at query time, reconstructing domain facts from the normalized tables.

The view `v_product_design_designer` joins `product_designs` to `designers` on the `designer_id` foreign key, answering the question: *Which designer is associated with each product design?* A row from this view might show that design `DES-2225` (Composite Model) is linked to the designer named *Christopher Wilson* with employment status `employed`.

**View `v_product_design_designer`**

```sql
CREATE VIEW v_product_design_designer AS
SELECT a.id, a.design_identifier, a.design_name, a.design_status, b.id AS designer_id, b.designer_id AS designer_designer_id, b.designer_name AS designer_designer_name
FROM product_designs a JOIN designers b ON a.designer_id = b.id;
```

| id | design_identifier | design_name | design_status | designer_id | designer_designer_id | designer_designer_name |
|---|---|---|---|---|---|---|
| 100 | DES-2225 | Composite Model | concept | 1000 | 1186089 | Adaptive Series |
| 101 | DES-2228 | Compact Cluster A | draft | 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment |
| 102 | DES-2231 | Legacy Review | final | 1002 | 6564372 | Composite Survey D |
| 103 | DES-2234 | Regional Initiative | manufactured | 1003 | 4060650 | Compact Corridor |

The view `v_product_design_software_tool` joins `product_designs` to `software_tools` on the `software_tool_id` foreign key, answering: *Which software tool supports each product design?* A representative row shows that design `DES-2228` (Compact Cluster A) uses the tool *Composite Initiative* with interface type `cli` and a `medium` learning curve.

**View `v_product_design_software_tool`**

```sql
CREATE VIEW v_product_design_software_tool AS
SELECT a.id, a.design_identifier, a.design_name, a.design_status, b.id AS tool_id, b.software_id AS tool_software_id, b.software_name AS tool_software_name
FROM product_designs a JOIN software_tools b ON a.software_tool_id = b.id;
```

| id | design_identifier | design_name | design_status | tool_id | tool_software_id | tool_software_name |
|---|---|---|---|---|---|---|
| 100 | DES-2225 | Composite Model | concept | 1 | gd_taxc_2111 | Primary Review A |
| 101 | DES-2228 | Compact Cluster A | draft | 2 | 5917273 | Composite Initiative |
| 102 | DES-2231 | Legacy Review | final | 3 | id_4 | Compact Model |
| 103 | DES-2234 | Regional Initiative | manufactured | 4 | 8928496 | Legacy Cluster D |

The view `v_product_design_design_competition` joins `product_designs` to `design_competitions` on the `design_competition_id` foreign key, answering: *To which competition does each product design belong?* A row from this view might reveal that design `DES-2231` (Legacy Review) was submitted to the competition *Regional Review A* in year 27, organized by *Regional Programme A*, with evaluation criteria `distributed-evaluati-54`.

**View `v_product_design_design_competition`**

```sql
CREATE VIEW v_product_design_design_competition AS
SELECT a.id, a.design_identifier, a.design_name, a.design_status, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM product_designs a JOIN design_competitions b ON a.design_competition_id = b.id;
```

| id | design_identifier | design_name | design_status | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 100 | DES-2225 | Composite Model | concept | 1000 | 4277014 | Compact Model |
| 101 | DES-2228 | Compact Cluster A | draft | 1001 | 575210 | Legacy Cluster |
| 102 | DES-2231 | Legacy Review | final | 1002 | 619 | Regional Review A |
| 103 | DES-2234 | Regional Initiative | manufactured | 1003 | 10449520 | Seasonal Initiative |

The view `v_product_design_photorealistic_render` joins `product_designs` to `photorealistic_renders` on the `render_id` foreign key, answering: *Which photorealistic render corresponds to each product design?* A sample row shows that design `DES-2225` (Composite Model) has render `4843`, created on `2023-06-02T17:51:00` with `regional-lighting-60` setup, resolution 15, and a file size of 344.85 MB.

**View `v_product_design_photorealistic_render`**

```sql
CREATE VIEW v_product_design_photorealistic_render AS
SELECT a.id, a.design_identifier, a.design_name, a.design_status, b.render_id AS render_render_id, b.render_date AS render_render_date, b.lighting_setup AS render_lighting_setup
FROM product_designs a JOIN photorealistic_renders b ON a.render_id = b.render_id;
```

| id | design_identifier | design_name | design_status | render_render_id | render_render_date | render_lighting_setup |
|---|---|---|---|---|---|---|
| 100 | DES-2225 | Composite Model | concept | 4843 | 2023-06-02T17:51:00 | regional-lighting-60 |
| 101 | DES-2228 | Compact Cluster A | draft | 1208-0004-L | 2024-11-13T00:08:00 | legacy-lighting-61 |
| 102 | DES-2231 | Legacy Review | final | 10445634 | 2025-04-24T07:25:00 | compact-lighting-62 |
| 103 | DES-2234 | Regional Initiative | manufactured | 4102 | 2022-09-08T14:42:00 | composite-lighting-63 |

The view `v_designer_product_design_detail` joins `designers` to `product_designs`, answering the inverse question: *What product designs is each designer associated with?* A row from this view might show that *Christopher Wilson* (designer id `1186089`, employed, career start year 8, primary skill `seasonal-primary-53`) is linked to design `DES-2225` (Composite Model, status `concept`, rendering complexity 15).

**View `v_designer_product_design_detail`**

```sql
CREATE VIEW v_designer_product_design_detail AS
SELECT a.id, a.designer_id, a.designer_name, b.id AS design_id, b.design_identifier AS design_design_identifier, b.design_name AS design_design_name
FROM designers a
  JOIN designers_designs j ON j.designer_id = a.id
  JOIN product_designs b ON b.id = j.product_design_id;
```

| id | designer_id | designer_name | design_id | design_design_identifier | design_design_name |
|---|---|---|---|---|---|
| 1000 | 1186089 | Adaptive Series | 100 | DES-2225 | Composite Model |
| 1000 | 1186089 | Adaptive Series | 101 | DES-2228 | Compact Cluster A |
| 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment | 101 | DES-2228 | Compact Cluster A |
| 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment | 102 | DES-2231 | Legacy Review |
| 1002 | 6564372 | Composite Survey D | 102 | DES-2231 | Legacy Review |
| 1002 | 6564372 | Composite Survey D | 103 | DES-2234 | Regional Initiative |
| 1003 | 4060650 | Compact Corridor | 103 | DES-2234 | Regional Initiative |
| 1003 | 4060650 | Compact Corridor | 100 | DES-2225 | Composite Model |

The view `v_designer_design_firm` joins `designers` to `design_firms` on the `design_firm_id` foreign key, answering: *Which design firm is each designer affiliated with?* A representative row shows that *Charles Larsen* (designer id `5fc685e2-8fcc-11eb-924d-9cd76263cbd0`, independent, career start year 16) is affiliated with the firm *Regional Initiative*, founded in year 48, headquartered at `primary-headquar-64`, of type `merged`, and currently active.

**View `v_designer_design_firm`**

```sql
CREATE VIEW v_designer_design_firm AS
SELECT a.id, a.designer_id, a.designer_name, a.employment_status, b.id AS firm_id, b.firm_id AS firm_firm_id, b.firm_name AS firm_firm_name
FROM designers a JOIN design_firms b ON a.design_firm_id = b.id;
```

| id | designer_id | designer_name | employment_status | firm_id | firm_firm_id | firm_firm_name |
|---|---|---|---|---|---|---|
| 1000 | 1186089 | Adaptive Series | employed | 1 | 575216 | Legacy Review D |
| 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment | independent | 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative |
| 1002 | 6564372 | Composite Survey D | retired | 3 | 884351 | Seasonal Model |
| 1003 | 4060650 | Compact Corridor | employed | 4 | L907 | Integrated Cluster A |

The view `v_designer_design_competition` joins `designers` to `design_competitions` on the `design_competition_id` foreign key, answering: *Which competition is each designer participating in?* A row from this view might show that *Mary Alvarez* (designer id `6564372`, retired, career start year 24, primary skill `legacy-primary-55`) is linked to the competition *Regional Review A* (id `619`), organized by *Regional Programme A*, with evaluation criteria `distributed-evaluati-54` and `grand_prize_awarded` set to `false`.

**View `v_designer_design_competition`**

```sql
CREATE VIEW v_designer_design_competition AS
SELECT a.id, a.designer_id, a.designer_name, a.employment_status, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM designers a JOIN design_competitions b ON a.design_competition_id = b.id;
```

| id | designer_id | designer_name | employment_status | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 1000 | 1186089 | Adaptive Series | employed | 1000 | 4277014 | Compact Model |
| 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment | independent | 1001 | 575210 | Legacy Cluster |
| 1002 | 6564372 | Composite Survey D | retired | 1002 | 619 | Regional Review A |
| 1003 | 4060650 | Compact Corridor | employed | 1003 | 10449520 | Seasonal Initiative |

The view `v_software_tool_designer_detail` joins `software_tools` to `designers`, answering: *Which designers are associated with each software tool?* A representative row shows that the tool *Primary Review A* (software id `gd_taxc_2111`, version `seasonal-software-47`, developer *Composite Protocol*, interface `gui`, learning curve `low`) is linked to designer *Christopher Wilson*.

**View `v_software_tool_designer_detail`**

```sql
CREATE VIEW v_software_tool_designer_detail AS
SELECT a.id, a.software_id, a.software_name, b.id AS designer_id, b.designer_id AS designer_designer_id, b.designer_name AS designer_designer_name
FROM software_tools a
  JOIN tools_designers j ON j.software_tool_id = a.id
  JOIN designers b ON b.id = j.designer_id;
```

| id | software_id | software_name | designer_id | designer_designer_id | designer_designer_name |
|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | 1000 | 1186089 | Adaptive Series |
| 1 | gd_taxc_2111 | Primary Review A | 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment |
| 2 | 5917273 | Composite Initiative | 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment |
| 2 | 5917273 | Composite Initiative | 1002 | 6564372 | Composite Survey D |
| 3 | id_4 | Compact Model | 1002 | 6564372 | Composite Survey D |
| 3 | id_4 | Compact Model | 1003 | 4060650 | Compact Corridor |
| 4 | 8928496 | Legacy Cluster D | 1003 | 4060650 | Compact Corridor |
| 4 | 8928496 | Legacy Cluster D | 1000 | 1186089 | Adaptive Series |

The view `v_software_tool_product_design` joins `software_tools` to `product_designs` on the `product_design_id` foreign key, answering: *Which product design uses each software tool?* A row from this view might show that the tool *Compact Model* (software id `id_4`, version `legacy-software-49`, developer *Legacy Standard*, interface `hybrid`, learning curve `high`) is used by design `DES-2231` (Legacy Review, status `final`, rendering complexity 31).

**View `v_software_tool_product_design`**

```sql
CREATE VIEW v_software_tool_product_design AS
SELECT a.id, a.software_id, a.software_name, a.software_version, b.id AS design_id, b.design_identifier AS design_design_identifier, b.design_name AS design_design_name
FROM software_tools a JOIN product_designs b ON a.product_design_id = b.id;
```

| id | software_id | software_name | software_version | design_id | design_design_identifier | design_design_name |
|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | seasonal-software-47 | 100 | DES-2225 | Composite Model |
| 2 | 5917273 | Composite Initiative | regional-software-48 | 101 | DES-2228 | Compact Cluster A |
| 3 | id_4 | Compact Model | legacy-software-49 | 102 | DES-2231 | Legacy Review |
| 4 | 8928496 | Legacy Cluster D | compact-software-50 | 103 | DES-2234 | Regional Initiative |

The view `v_design_competition_product_design_detail` joins `design_competitions` to `product_designs`, answering: *What product designs are featured in each competition?* A representative row shows that the competition *Compact Model* (id `4277014`, year 13, organizer *Compact Framework*, criteria `primary-evaluati-52`, grand prize `false`) features design `DES-2225` (Composite Model, status `concept`, rendering complexity 15).

**View `v_design_competition_product_design_detail`**

```sql
CREATE VIEW v_design_competition_product_design_detail AS
SELECT a.id, a.competition_id, a.competition_name, b.id AS design_id, b.design_identifier AS design_design_identifier, b.design_name AS design_design_name
FROM design_competitions a
  JOIN competitions_designs j ON j.design_competition_id = a.id
  JOIN product_designs b ON b.id = j.product_design_id;
```

| id | competition_id | competition_name | design_id | design_design_identifier | design_design_name |
|---|---|---|---|---|---|
| 1000 | 4277014 | Compact Model | 100 | DES-2225 | Composite Model |
| 1000 | 4277014 | Compact Model | 101 | DES-2228 | Compact Cluster A |
| 1001 | 575210 | Legacy Cluster | 101 | DES-2228 | Compact Cluster A |
| 1001 | 575210 | Legacy Cluster | 102 | DES-2231 | Legacy Review |
| 1002 | 619 | Regional Review A | 102 | DES-2231 | Legacy Review |
| 1002 | 619 | Regional Review A | 103 | DES-2234 | Regional Initiative |
| 1003 | 10449520 | Seasonal Initiative | 103 | DES-2234 | Regional Initiative |
| 1003 | 10449520 | Seasonal Initiative | 100 | DES-2225 | Composite Model |

The view `v_design_competition_design_firm` joins `design_competitions` to `design_firms` on the `design_firm_id` foreign key, answering: *Which design firm is associated with each competition?* A row from this view might show that the competition *Legacy Cluster* (id `575210`, year 20, organizer *Legacy Protocol*, criteria `adaptive-evaluati-53`, grand prize `true`) is linked to the firm *Regional Initiative* (firm id `e4ea9416-8fd1-11eb-924d-9cd76263cbd0`), founded in year 48, headquartered at `primary-headquar-64`, type `merged`, and active.

**View `v_design_competition_design_firm`**

```sql
CREATE VIEW v_design_competition_design_firm AS
SELECT a.id, a.competition_id, a.competition_name, a.competition_year, b.id AS firm_id, b.firm_id AS firm_firm_id, b.firm_name AS firm_firm_name
FROM design_competitions a JOIN design_firms b ON a.design_firm_id = b.id;
```

| id | competition_id | competition_name | competition_year | firm_id | firm_firm_id | firm_firm_name |
|---|---|---|---|---|---|---|
| 1000 | 4277014 | Compact Model | 13 | 1 | 575216 | Legacy Review D |
| 1001 | 575210 | Legacy Cluster | 20 | 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative |
| 1002 | 619 | Regional Review A | 27 | 3 | 884351 | Seasonal Model |
| 1003 | 10449520 | Seasonal Initiative | 34 | 4 | L907 | Integrated Cluster A |

The view `v_design_competition_designer` joins `design_competitions` to `designers` on the `designer_id` foreign key, answering: *Which designer is participating in each competition?* A representative row shows that the competition *Regional Review A* (id `619`, year 27, organizer *Regional Programme A*, criteria `distributed-evaluati-54`, grand prize `false`) is linked to designer *Mary Alvarez* (id `6564372`, retired, career start year 24, primary skill `legacy-primary-55`).

**View `v_design_competition_designer`**

```sql
CREATE VIEW v_design_competition_designer AS
SELECT a.id, a.competition_id, a.competition_name, a.competition_year, b.id AS designer_id, b.designer_id AS designer_designer_id, b.designer_name AS designer_designer_name
FROM design_competitions a JOIN designers b ON a.designer_id = b.id;
```

| id | competition_id | competition_name | competition_year | designer_id | designer_designer_id | designer_designer_name |
|---|---|---|---|---|---|---|
| 1000 | 4277014 | Compact Model | 13 | 1000 | 1186089 | Adaptive Series |
| 1001 | 575210 | Legacy Cluster | 20 | 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment |
| 1002 | 619 | Regional Review A | 27 | 1002 | 6564372 | Composite Survey D |
| 1003 | 10449520 | Seasonal Initiative | 34 | 1003 | 4060650 | Compact Corridor |

The view `v_photorealistic_render_product_design` joins `photorealistic_renders` to `product_designs` on the `product_design_id` foreign key, answering: *Which product design does each photorealistic render depict?* A row from this view might show that render `1208-0004-L` (render date `2024-11-13T00:08:00`, lighting `legacy-lighting-61`, resolution 20, render time 23.90 hours, file size 226.0 MB) depicts design `DES-2228` (Compact Cluster A, status `draft`, rendering complexity 23).

**View `v_photorealistic_render_product_design`**

```sql
CREATE VIEW v_photorealistic_render_product_design AS
SELECT a.render_id, a.render_date, a.lighting_setup, a.resolution, b.id AS design_id, b.design_identifier AS design_design_identifier, b.design_name AS design_design_name
FROM photorealistic_renders a JOIN product_designs b ON a.product_design_id = b.id;
```

| render_id | render_date | lighting_setup | resolution | design_id | design_design_identifier | design_design_name |
|---|---|---|---|---|---|---|
| 4843 | 2023-06-02T17:51:00 | regional-lighting-60 | 15 | 100 | DES-2225 | Composite Model |
| 1208-0004-L | 2024-11-13T00:08:00 | legacy-lighting-61 | 20 | 101 | DES-2228 | Compact Cluster A |
| 10445634 | 2025-04-24T07:25:00 | compact-lighting-62 | 25 | 102 | DES-2231 | Legacy Review |
| 4102 | 2022-09-08T14:42:00 | composite-lighting-63 | 30 | 103 | DES-2234 | Regional Initiative |

The view `v_photorealistic_render_software_tool` joins `photorealistic_renders` to `software_tools` on the `software_tool_id` foreign key, answering: *Which software tool was used to create each photorealistic render?* A representative row shows that render `10445634` (render date `2025-04-24T07:25:00`, lighting `compact-lighting-62`, resolution 25, render time 26.35 hours, file size 34.40 MB) was created using the tool *Compact Model* (software id `id_4`, version `legacy-software-49`, developer *Legacy Standard*, interface `hybrid`, learning curve `high`).

**View `v_photorealistic_render_software_tool`**

```sql
CREATE VIEW v_photorealistic_render_software_tool AS
SELECT a.render_id, a.render_date, a.lighting_setup, a.resolution, b.id AS tool_id, b.software_id AS tool_software_id, b.software_name AS tool_software_name
FROM photorealistic_renders a JOIN software_tools b ON a.software_tool_id = b.id;
```

| render_id | render_date | lighting_setup | resolution | tool_id | tool_software_id | tool_software_name |
|---|---|---|---|---|---|---|
| 4843 | 2023-06-02T17:51:00 | regional-lighting-60 | 15 | 1 | gd_taxc_2111 | Primary Review A |
| 1208-0004-L | 2024-11-13T00:08:00 | legacy-lighting-61 | 20 | 2 | 5917273 | Composite Initiative |
| 10445634 | 2025-04-24T07:25:00 | compact-lighting-62 | 25 | 3 | id_4 | Compact Model |
| 4102 | 2022-09-08T14:42:00 | composite-lighting-63 | 30 | 4 | 8928496 | Legacy Cluster D |

The view `v_photorealistic_render_design_competition` joins `photorealistic_renders` to `design_competitions` on the `design_competition_id` foreign key, answering: *To which competition does each photorealistic render belong?* A row from this view might show that render `4102` (render date `2022-09-08T14:42:00`, lighting `composite-lighting-63`, resolution 30, render time 28.80 hours, file size 189.86 MB) belongs to the competition *Seasonal Initiative* (id `10449520`, year 34, organizer *Seasonal Standard*, criteria `baseline-evaluati-55`, grand prize `true`).

**View `v_photorealistic_render_design_competition`**

```sql
CREATE VIEW v_photorealistic_render_design_competition AS
SELECT a.render_id, a.render_date, a.lighting_setup, a.resolution, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM photorealistic_renders a JOIN design_competitions b ON a.design_competition_id = b.id;
```

| render_id | render_date | lighting_setup | resolution | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 4843 | 2023-06-02T17:51:00 | regional-lighting-60 | 15 | 1000 | 4277014 | Compact Model |
| 1208-0004-L | 2024-11-13T00:08:00 | legacy-lighting-61 | 20 | 1001 | 575210 | Legacy Cluster |
| 10445634 | 2025-04-24T07:25:00 | compact-lighting-62 | 25 | 1002 | 619 | Regional Review A |
| 4102 | 2022-09-08T14:42:00 | composite-lighting-63 | 30 | 1003 | 10449520 | Seasonal Initiative |

The view `v_design_firm_designer_detail` joins `design_firms` to `designers`, answering: *Which designers are employed by each design firm?* A representative row shows that the firm *Legacy Review D* (firm id `575216`, founded year 43, headquarters `composite-headquar-63`, type `independent`, active `false`) is linked to designer *Christopher Wilson* (id `1186089`, employed, career start year 8, primary skill `seasonal-primary-53`).

**View `v_design_firm_designer_detail`**

```sql
CREATE VIEW v_design_firm_designer_detail AS
SELECT a.id, a.firm_id, a.firm_name, b.id AS designer_id, b.designer_id AS designer_designer_id, b.designer_name AS designer_designer_name
FROM design_firms a
  JOIN firms_designers j ON j.design_firm_id = a.id
  JOIN designers b ON b.id = j.designer_id;
```

| id | firm_id | firm_name | designer_id | designer_designer_id | designer_designer_name |
|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 1000 | 1186089 | Adaptive Series |
| 1 | 575216 | Legacy Review D | 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 1002 | 6564372 | Composite Survey D |
| 3 | 884351 | Seasonal Model | 1002 | 6564372 | Composite Survey D |
| 3 | 884351 | Seasonal Model | 1003 | 4060650 | Compact Corridor |
| 4 | L907 | Integrated Cluster A | 1003 | 4060650 | Compact Corridor |
| 4 | L907 | Integrated Cluster A | 1000 | 1186089 | Adaptive Series |

The view `v_design_firm_design_competition` joins `design_firms` to `design_competitions` on the `design_competition_id` foreign key, answering: *Which competition is associated with each design firm?* A row from this view might show that the firm *Seasonal Model* (firm id `884351`, founded year 53, headquarters `adaptive-headquar-65`, type `subsidiary`, active `false`) is linked to the competition *Regional Review A* (id `619`, year 27, organizer *Regional Programme A*, criteria `distributed-evaluati-54`, grand prize `false`).

**View `v_design_firm_design_competition`**

```sql
CREATE VIEW v_design_firm_design_competition AS
SELECT a.id, a.firm_id, a.firm_name, a.founding_year, b.id AS competition_id, b.competition_id AS competition_competition_id, b.competition_name AS competition_competition_name
FROM design_firms a JOIN design_competitions b ON a.design_competition_id = b.id;
```

| id | firm_id | firm_name | founding_year | competition_id | competition_competition_id | competition_competition_name |
|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 43 | 1000 | 4277014 | Compact Model |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | 1001 | 575210 | Legacy Cluster |
| 3 | 884351 | Seasonal Model | 53 | 1002 | 619 | Regional Review A |
| 4 | L907 | Integrated Cluster A | 58 | 1003 | 10449520 | Seasonal Initiative |

The view `v_design_firm_design_firm` performs a self-join on `design_firms`, answering: *How do design firms relate to one another?* This view enables analysis of inter-firm relationships, such as mergers, subsidiaries, or partnerships. A representative row might show that the firm *Integrated Cluster A* (firm id `L907`, founded year 58, headquarters `distributed-headquar-66`, type `independent`, active `true`) is linked to the firm *Legacy Review D* (firm id `575216`, founded year 43, headquarters `composite-headquar-63`, type `independent`, active `false`), revealing a structural relationship between two independent firms.

**View `v_design_firm_design_firm`**

```sql
CREATE VIEW v_design_firm_design_firm AS
SELECT a.id, a.firm_id, a.firm_name, a.founding_year, b.id AS firm_id, b.firm_id AS firm_firm_id, b.firm_name AS firm_firm_name
FROM design_firms a JOIN design_firms b ON a.design_firm_id = b.id;
```

| id | firm_id | firm_name | founding_year | firm_id | firm_firm_id | firm_firm_name |
|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 43 | 1 | 575216 | Legacy Review D |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative |
| 3 | 884351 | Seasonal Model | 53 | 3 | 884351 | Seasonal Model |
| 4 | L907 | Integrated Cluster A | 58 | 4 | L907 | Integrated Cluster A |

## Synthesis

The schema models the product design domain as a network of six entity types—product designs, designers, software tools, design competitions, photorealistic renders, and design firms—connected through foreign-key columns and four junction tables. The base tables enforce referential integrity at the physical level, while the eighteen views provide a logical layer that reconstructs domain facts through declarative joins. Each view answers a specific analytical question by reassembling normalized columns into a coherent row: for example, `v_photorealistic_render_product_design` tells us which design a render depicts, while `v_design_firm_design_firm` reveals inter-firm relationships. The model is fully normalized, with no redundant data, and every view's join path is deterministic and traceable back to its source tables. This separation of physical storage from logical presentation enables flexible querying without compromising data integrity.