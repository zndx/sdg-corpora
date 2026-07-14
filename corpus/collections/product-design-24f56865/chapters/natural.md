Product design operations in modern creative enterprises depend on a structured ecosystem of people, tools, competitions, and visual deliverables. A product design record captures the lifecycle of a concept from initial concept through final manufacture, while designers bring specialized skills to bear, software tools enable the technical work, design competitions provide external validation, photorealistic renders communicate the final vision, and design firms organize the broader business context. The following reference documents the entities, their operational relationships, and the analytical views that join them into actionable insight.

## Product Designs

The central artifact in this domain is the product design, a record that tracks a concept through its developmental stages. Each design carries a unique identifier such as `DES-2225` or `DES-2234`, a human-readable name like "Composite Model" or "Regional Initiative," and a status that reflects its current phase: `concept`, `draft`, `final`, or `manufactured`. The `rendering_complexity` field quantifies the visual sophistication of the design, with values ranging from 15 for simpler concepts to 39 for highly intricate ones.

**Table `product_designs`**

| id | design_identifier | design_name | design_status | creation_date | designer_role | rendering_complexity | designer_id | software_tool_id | design_competition_id | render_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | DES-2225 | Composite Model | concept | 2022-01-13T12:24:00 | integrated-designer-88 | 15 | 1000 | 1 | 1000 | 4843 |
| 101 | DES-2228 | Compact Cluster A | draft | 2023-06-24T19:41:00 | seasonal-designer-89 | 23 | 1001 | 2 | 1001 | 1208-0004-L |
| 102 | DES-2231 | Legacy Review | final | 2024-11-08T02:58:00 | regional-designer-90 | 31 | 1002 | 3 | 1002 | 10445634 |
| 103 | DES-2234 | Regional Initiative | manufactured | 2025-04-19T09:15:00 | legacy-designer-91 | 39 | 1003 | 4 | 1003 | 4102 |

The `designer_role` column assigns a functional role to the responsible designer, using identifiers like `integrated-designer-88` or `seasonal-designer-89`. Foreign keys link each design to its creator (`designer_id`), the software tool employed (`software_tool_id`), the competition it may have been submitted to (`design_competition_id`), and the photorealistic render that visualizes it (`render_id`). For instance, design `DES-2225` (Composite Model) is in `concept` status, has a rendering complexity of 15, and is associated with designer `1000`, software tool `1`, competition `1000`, and render `4843`.

## Designers

Designers are the human agents who drive product concepts forward. Each designer record includes a unique `designer_id` (such as `1186089` or `5fc685e2-8fcc-11eb-924d-9cd76263cbd0`), a display name like "Christopher Wilson" or "Charles Larsen," and an `employment_status` that is either `employed`, `independent`, or `retired`. The `career_start_year` indicates how many years into their career the designer is, ranging from 8 to 32 in the current dataset.

**Table `designers`**

| id | designer_id | designer_name | employment_status | career_start_year | primary_skill | contact_email | design_firm_id | design_competition_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1186089 | Adaptive Series | employed | 8 | seasonal-primary-53 | Christopher Wilson | 1 | 1000 |
| 1001 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Primary Assessment | independent | 16 | regional-primary-54 | Charles Larsen | 2 | 1001 |
| 1002 | 6564372 | Composite Survey D | retired | 24 | legacy-primary-55 | Mary Alvarez | 3 | 1002 |
| 1003 | 4060650 | Compact Corridor | employed | 32 | compact-primary-56 | April Snyder | 4 | 1003 |

A designer's `primary_skill` categorizes their expertise—for example, `seasonal-primary-53` or `regional-primary-54`—and their `contact_email` provides a communication channel. Each designer is affiliated with a `design_firm_id` and may be associated with a `design_competition_id`, establishing the organizational and competitive context of their work.

## Software Tools

The technical capability of a design team is defined by the software tools they use. Each tool record contains a `software_id` (such as `gd_taxc_2111` or `5917273`), a `software_name` like "Primary Review A" or "Composite Initiative," and a `software_version` that identifies the specific release, such as `seasonal-software-47` or `legacy-software-49`.

**Table `software_tools`**

| id | software_id | software_name | software_version | developer_name | interface_type | learning_curve | product_design_id |
|---|---|---|---|---|---|---|---|
| 1 | gd_taxc_2111 | Primary Review A | seasonal-software-47 | Composite Protocol | gui | low | 100 |
| 2 | 5917273 | Composite Initiative | regional-software-48 | Compact Programme A | cli | medium | 101 |
| 3 | id_4 | Compact Model | legacy-software-49 | Legacy Standard | hybrid | high | 102 |
| 4 | 8928496 | Legacy Cluster D | compact-software-50 | Regional Framework | gui | low | 103 |

The `developer_name` field names the organization that created the tool—`Composite Protocol`, `Compact Programme A`, `Legacy Standard`, or `Regional Framework`—while `interface_type` describes the user interaction model: `gui`, `cli`, or `hybrid`. The `learning_curve` field rates the difficulty of adoption as `low`, `medium`, or `high`. Each tool is linked to a `product_design_id`, indicating which design it was used to create.

## Design Competitions

Design competitions serve as external evaluation mechanisms that validate product concepts. Each competition record includes a `competition_id` (such as `4277014` or `575210`), a `competition_name` like "Compact Model" or "Legacy Cluster," and a `competition_year` that indicates the edition number, ranging from 13 to 34.

**Table `design_competitions`**

| id | competition_id | competition_name | competition_year | organizer_name | evaluation_criteria | grand_prize_awarded | design_firm_id | designer_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 4277014 | Compact Model | 13 | Compact Framework | primary-evaluati-52 | false | 1 | 1000 |
| 1001 | 575210 | Legacy Cluster | 20 | Legacy Protocol | adaptive-evaluati-53 | true | 2 | 1001 |
| 1002 | 619 | Regional Review A | 27 | Regional Programme A | distributed-evaluati-54 | false | 3 | 1002 |
| 1003 | 10449520 | Seasonal Initiative | 34 | Seasonal Standard | baseline-evaluati-55 | true | 4 | 1003 |

The `organizer_name` identifies the body running the competition—`Compact Framework`, `Legacy Protocol`, `Regional Programme A`, or `Seasonal Standard`—while `evaluation_criteria` describes the scoring methodology, such as `primary-evaluati-52` or `adaptive-evaluati-53`. The `grand_prize_awarded` boolean indicates whether the top prize has been distributed. Each competition is associated with a `design_firm_id` and a `designer_id`, linking the organizational and individual participants.

## Photorealistic Renders

Photorealistic renders are the visual artifacts that communicate product designs to stakeholders. Each render record carries a `render_id` (such as `4843` or `1208-0004-L`), a `render_date` timestamp, and a `lighting_setup` identifier like `regional-lighting-60` or `legacy-lighting-61`.

**Table `photorealistic_renders`**

| render_id | render_date | lighting_setup | resolution | render_time_hours | file_size_m_b | product_design_id | software_tool_id | design_competition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 4843 | 2023-06-02T17:51:00 | regional-lighting-60 | 15 | 21.45 | 344.8468322753906 | 100 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1208-0004-L | 2024-11-13T00:08:00 | legacy-lighting-61 | 20 | 23.90 | 226.0 | 101 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 10445634 | 2025-04-24T07:25:00 | compact-lighting-62 | 25 | 26.35 | 34.400001525878906 | 102 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4102 | 2022-09-08T14:42:00 | composite-lighting-63 | 30 | 28.80 | 189.85751 | 103 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `resolution` field quantifies the visual detail level, with values from 15 to 30 in the current data. `render_time_hours` records the computational effort required, ranging from 21.45 to 28.80 hours, while `file_size_m_b` captures the storage footprint, from 34.4 MB to 344.8 MB. Each render is linked to its source `product_design_id`, the `software_tool_id` used to generate it, and the `design_competition_id` it supports. Timestamps `created_at` and `updated_at` track the render's lifecycle.

## Design Firms

Design firms provide the organizational structure within which designers operate. Each firm record includes a `firm_id` (such as `575216` or `e4ea9416-8fd1-11eb-924d-9cd76263cbd0`), a `firm_name` like "Legacy Review D" or "Regional Initiative," and a `founding_year` indicating the firm's age, from 43 to 58 years.

**Table `design_firms`**

| id | firm_id | firm_name | founding_year | headquarters_location | firm_type | active_status | design_competition_id | design_firm_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 575216 | Legacy Review D | 43 | composite-headquar-63 | independent | false | 1000 | 1 |
| 2 | e4ea9416-8fd1-11eb-924d-9cd76263cbd0 | Regional Initiative | 48 | primary-headquar-64 | merged | true | 1001 | 2 |
| 3 | 884351 | Seasonal Model | 53 | adaptive-headquar-65 | subsidiary | false | 1002 | 3 |
| 4 | L907 | Integrated Cluster A | 58 | distributed-headquar-66 | independent | true | 1003 | 4 |

The `headquarters_location` field uses coded identifiers such as `composite-headquar-63` or `distributed-headquar-66`. The `firm_type` categorizes the organizational structure as `independent`, `merged`, or `subsidiary`, while `active_status` indicates whether the firm is currently operational. Each firm is linked to a `design_competition_id` and a `design_firm_id`, establishing its competitive and self-referential relationships.

## Association Records

The domain employs junction tables to manage many-to-many relationships between core entities. The `designers_designs` table links designers to the product designs they have contributed to, enabling a single designer to be associated with multiple designs and vice versa. The `tools_designers` table records which software tools each designer uses, supporting the reality that designers typically work with multiple tools across their careers. The `competitions_designs` table associates product designs with the competitions they have entered, allowing designs to participate in multiple competitions and competitions to evaluate multiple designs. The `firms_designers` table connects design firms to their designers, capturing the organizational membership structure.

## Analytical Views

The following views join the base tables to answer specific operational questions. Each view is interpreted below with reference to concrete data rows.

### Product Design to Designer View

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

This view answers which designer is responsible for each product design. It joins `product_designs` with `designers` on the designer foreign key. For design `DES-2225` (Composite Model), the view reveals that designer `1186089` (Christopher Wilson, employed, career start year 8) is the responsible party. For `DES-2231` (Legacy Review), the view shows designer `6564372` (Mary Alvarez, retired, career start year 24) as the creator.

### Product Design to Software Tool View

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

This view maps each product design to the software tool used in its creation. It joins `product_designs` with `software_tools` on the software tool foreign key. Design `DES-2225` was created using tool `gd_taxc_2111` (Primary Review A, version `seasonal-software-47`, developed by Composite Protocol, with a `gui` interface and `low` learning curve). Design `DES-2231` used tool `id_4` (Compact Model, version `legacy-software-49`, developed by Legacy Standard, with a `hybrid` interface and `high` learning curve).

### Product Design to Design Competition View

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

This view identifies which design competition each product design has been submitted to. It joins `product_designs` with `design_competitions` on the competition foreign key. Design `DES-2225` was submitted to competition `4277014` (Compact Model, year 13, organized by Compact Framework, with `primary-evaluati-52` criteria, and no grand prize awarded). Design `DES-2228` (Compact Cluster A) was submitted to competition `575210` (Legacy Cluster, year 20, organized by Legacy Protocol, with `adaptive-evaluati-53` criteria, and a grand prize awarded).

### Product Design to Photorealistic Render View

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

This view connects each product design to its corresponding photorealistic render. It joins `product_designs` with `photorealistic_renders` on the render foreign key. Design `DES-2225` is visualized by render `4843`, created on 2023-06-02 with `regional-lighting-60` setup, resolution 15, taking 21.45 hours and producing a 344.8 MB file. Design `DES-2231` is visualized by render `10445634`, created on 2025-04-24 with `compact-lighting-62` setup, resolution 25, taking 26.35 hours and producing a 34.4 MB file.

### Designer Product Design Detail View

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

This view provides a detailed look at each designer's product design portfolio. It joins `designers` with `product_designs` to show the full context of a designer's work. Designer `1186089` (Christopher Wilson, employed, primary skill `seasonal-primary-53`) has created design `DES-2225` (Composite Model, status `concept`, rendering complexity 15). Designer `6564372` (Mary Alvarez, retired, primary skill `legacy-primary-55`) has created design `DES-2231` (Legacy Review, status `final`, rendering complexity 31).

### Designer to Design Firm View

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

This view links each designer to their affiliated design firm. It joins `designers` with `design_firms` on the firm foreign key. Designer `1186089` (Christopher Wilson) is affiliated with firm `575216` (Legacy Review D, founded year 43, headquartered at `composite-headquar-63`, type `independent`, status `false`). Designer `5fc685e2-8fcc-11eb-924d-9cd76263cbd0` (Charles Larsen) is affiliated with firm `e4ea9416-8fd1-11eb-924d-9cd76263cbd0` (Regional Initiative, founded year 48, headquartered at `primary-headquar-64`, type `merged`, status `true`).

### Designer to Design Competition View

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

This view shows which design competitions each designer is associated with. It joins `designers` with `design_competitions` on the competition foreign key. Designer `1186089` (Christopher Wilson) is associated with competition `4277014` (Compact Model, year 13, organized by Compact Framework, criteria `primary-evaluati-52`, no grand prize awarded). Designer `4060650` (April Snyder) is associated with competition `10449520` (Seasonal Initiative, year 34, organized by Seasonal Standard, criteria `baseline-evaluati-55`, grand prize awarded).

### Software Tool to Designer Detail View

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

This view reveals which designers use each software tool. It joins `software_tools` with `designers` to show the user base of each tool. Tool `gd_taxc_2111` (Primary Review A, version `seasonal-software-47`, interface `gui`, learning curve `low`) is used by designer `1186089` (Christopher Wilson, employed, primary skill `seasonal-primary-53`). Tool `id_4` (Compact Model, version `legacy-software-49`, interface `hybrid`, learning curve `high`) is used by designer `6564372` (Mary Alvarez, retired, primary skill `legacy-primary-55`).

### Software Tool to Product Design View

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

This view maps each software tool to the product designs it has been used to create. It joins `software_tools` with `product_designs` on the product design foreign key. Tool `gd_taxc_2111` (Primary Review A) was used to create design `DES-2225` (Composite Model, status `concept`, rendering complexity 15). Tool `id_4` (Compact Model) was used to create design `DES-2231` (Legacy Review, status `final`, rendering complexity 31).

### Design Competition to Product Design Detail View

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

This view provides a detailed look at which product designs have been submitted to each competition. It joins `design_competitions` with `product_designs` to show the design portfolio of each competition. Competition `4277014` (Compact Model, year 13, organized by Compact Framework, criteria `primary-evaluati-52`, no grand prize awarded) has design `DES-2225` (Composite Model, status `concept`, rendering complexity 15) as a participant. Competition `575210` (Legacy Cluster, year 20, organized by Legacy Protocol, criteria `adaptive-evaluati-53`, grand prize awarded) has design `DES-2228` (Compact Cluster A, status `draft`, rendering complexity 23) as a participant.

### Design Competition to Design Firm View

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

This view links each design competition to its affiliated design firm. It joins `design_competitions` with `design_firms` on the firm foreign key. Competition `4277014` (Compact Model, year 13, organized by Compact Framework) is affiliated with firm `575216` (Legacy Review D, founded year 43, type `independent`, status `false`). Competition `10449520` (Seasonal Initiative, year 34, organized by Seasonal Standard) is affiliated with firm `L907` (Integrated Cluster A, founded year 58, type `independent`, status `true`).

### Design Competition to Designer View

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

This view shows which designers are associated with each design competition. It joins `design_competitions` with `designers` on the designer foreign key. Competition `4277014` (Compact Model, year 13, organized by Compact Framework) is associated with designer `1186089` (Christopher Wilson, employed, primary skill `seasonal-primary-53`). Competition `10449520` (Seasonal Initiative, year 34, organized by Seasonal Standard) is associated with designer `4060650` (April Snyder, employed, primary skill `compact-primary-56`).

### Photorealistic Render to Product Design View

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

This view connects each photorealistic render to its source product design. It joins `photorealistic_renders` with `product_designs` on the product design foreign key. Render `4843` (created 2023-06-02, lighting `regional-lighting-60`, resolution 15, 21.45 hours, 344.8 MB) visualizes design `DES-2225` (Composite Model, status `concept`, rendering complexity 15). Render `10445634` (created 2025-04-24, lighting `compact-lighting-62`, resolution 25, 26.35 hours, 34.4 MB) visualizes design `DES-2231` (Legacy Review, status `final`, rendering complexity 31).

### Photorealistic Render to Software Tool View

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

This view reveals which software tool was used to generate each photorealistic render. It joins `photorealistic_renders` with `software_tools` on the software tool foreign key. Render `4843` was generated using tool `gd_taxc_2111` (Primary Review A, version `seasonal-software-47`, developer `Composite Protocol`, interface `gui`, learning curve `low`). Render `1208-0004-L` was generated using tool `5917273` (Composite Initiative, version `regional-software-48`, developer `Compact Programme A`, interface `cli`, learning curve `medium`).

### Photorealistic Render to Design Competition View

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

This view links each photorealistic render to the design competition it supports. It joins `photorealistic_renders` with `design_competitions` on the competition foreign key. Render `4843` supports competition `4277014` (Compact Model, year 13, organized by Compact Framework, criteria `primary-evaluati-52`, no grand prize awarded). Render `1208-0004-L` supports competition `575210` (Legacy Cluster, year 20, organized by Legacy Protocol, criteria `adaptive-evaluati-53`, grand prize awarded).

### Design Firm to Designer Detail View

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

This view provides a detailed look at the designers affiliated with each design firm. It joins `design_firms` with `designers` on the firm foreign key. Firm `575216` (Legacy Review D, founded year 43, headquarters `composite-headquar-63`, type `independent`, status `false`) employs designer `1186089` (Christopher Wilson, employed, career start year 8, primary skill `seasonal-primary-53`). Firm `e4ea9416-8fd1-11eb-924d-9cd76263cbd0` (Regional Initiative, founded year 48, headquarters `primary-headquar-64`, type `merged`, status `true`) employs designer `5fc685e2-8fcc-11eb-924d-9cd76263cbd0` (Charles Larsen, independent, career start year 16, primary skill `regional-primary-54`).

### Design Firm to Design Competition View

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

This view links each design firm to the competitions it participates in. It joins `design_firms` with `design_competitions` on the competition foreign key. Firm `575216` (Legacy Review D, type `independent`, status `false`) participates in competition `4277014` (Compact Model, year 13, organized by Compact Framework, criteria `primary-evaluati-52`, no grand prize awarded). Firm `L907` (Integrated Cluster A, type `independent`, status `true`) participates in competition `10449520` (Seasonal Initiative, year 34, organized by Seasonal Standard, criteria `baseline-evaluati-55`, grand prize awarded).

### Design Firm Self-Reference View

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

This view captures self-referential relationships within the design firm entity, such as mergers, acquisitions, or organizational hierarchies. It joins `design_firms` with itself to reveal how firms relate to one another. Firm `575216` (Legacy Review D, type `independent`, status `false`) has a self-referential link to firm `575216`. Firm `e4ea9416-8fd1-11eb-924d-9cd76263cbd0` (Regional Initiative, type `merged`, status `true`) has a self-referential link to firm `e4ea9416-8fd1-11eb-924d-9cd76263cbd0`.

## Closing Synthesis

The product design domain is a tightly interwoven system where designers, tools, competitions, renders, and firms form a coherent operational network. Product designs serve as the central artifacts, each linked to a responsible designer, a software tool, a competition, and a visual render. Designers bring their skills and employment contexts to the work, while design firms provide the organizational backbone. Software tools enable the technical execution, and photorealistic renders communicate the results. Design competitions provide external evaluation and validation. The analytical views presented above allow practitioners to query this ecosystem from multiple angles—by designer, by tool, by competition, by firm, or by render—enabling comprehensive oversight of the entire product design lifecycle.

## Data appendix

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
