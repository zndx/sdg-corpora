The domain under examination captures the professional ecosystem of academic researchers, their institutional affiliations, the awards they receive, the professional societies to which they belong, and the leadership roles they hold within those societies. Five base tables form the backbone of this model: `academic_awards`, `researchers`, `professional_societies`, `leadership_positions`, and `academic_institutions`. Each table stores a distinct entity type, and foreign-key columns bind them into a normalized relational schema. The views then materialize the domain facts by joining these tables back together, answering questions that span multiple entity types.

## The Academic Awards Entity

**Table `academic_awards`**

| academic_award_id | award_identifier | award_name | issuing_organization | award_date | award_category | researcher_id | professional_society_id |
|---|---|---|---|---|---|---|---|
| 1000 | AWA-2104 | Primary Review A | Alphabet Inc Class A | 2025-12-01T23:33:00 | seasonal-award-53 | 1 | 100 |
| 1001 | AWA-2105 | Composite Initiative | ITT Industries | 2022-05-12T06:50:00 | regional-award-54 | 2 | 101 |
| 1002 | AWA-2106 | Compact Model | Switch Card Services Ltd. | 2023-10-23T13:07:00 | legacy-award-55 | 3 | 102 |
| 1003 | AWA-2107 | Legacy Cluster D | Buypass AS | 2024-03-07T20:24:00 | compact-award-56 | 4 | 103 |

The `academic_awards` table stores discrete recognitions conferred upon researchers. Its primary key, `academic_award_id`, is a synthetic integer identifier (e.g., `1000`, `1001`, `1002`, `1003`). The business key `award_identifier` carries a human-readable code such as `AWA-2104` or `AWA-2107`. The `award_name` column holds the title of the award—`Primary Review A`, `Composite Initiative`, `Compact Model`, `Legacy Cluster D`—while `issuing_organization` names the conferring body, ranging from `Alphabet Inc Class A` to `Buypass AS`. The `award_date` column records the timestamp of conferral, and `award_category` classifies the award into types like `seasonal-award-53`, `regional-award-54`, `legacy-award-55`, and `compact-award-56`.

Two foreign keys anchor this table to the rest of the schema. The column `researcher_id` references `researchers.id`, establishing which researcher received the award. The column `professional_society_id` references `professional_societies.professional_society_id`, indicating the professional society associated with the award. In the sample data, award `AWA-2104` (row `1000`) is linked to researcher `1` and professional society `100`, while award `AWA-2107` (row `1003`) connects researcher `4` with society `103`. This dual foreign-key design means each award can simultaneously express a recipient and a sponsoring or affiliated society.

## The Researchers Entity

**Table `researchers`**

| id | researcher_identifier | full_legal_name | primary_degree | secondary_degree | current_institution | current_title | research_focus | academic_award_id | leadership_position_id | academic_institution_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | RES-2651 | Integrated Framework A | pilot-primary-74 | primary-secondar-52 | extended-current-27 | Adaptive Protocol | seasonal-research-47 | 1000 | 1 | 1000 |
| 2 | RES-2652 | Extended Protocol | extended-primary-75 | adaptive-secondar-53 | integrated-current-28 | Primary Programme | regional-research-48 | 1001 | 2 | 1001 |
| 3 | RES-2653 | Pilot Programme | integrated-primary-76 | distributed-secondar-54 | seasonal-current-29 | Composite Standard D | legacy-research-49 | 1002 | 3 | 1002 |
| 4 | RES-2654 | Baseline Standard D | seasonal-primary-77 | baseline-secondar-55 | regional-current-30 | Compact Framework | compact-research-50 | 1003 | 4 | 1003 |

The `researchers` table is the central person entity. Its primary key `id` is a synthetic integer (e.g., `1`, `2`, `3`, `4`). The business key `researcher_identifier` provides a stable code such as `RES-2651` or `RES-2654`. The column `full_legal_name` stores the researcher's name—`Integrated Framework A`, `Extended Protocol`, `Pilot Programme`, `Baseline Standard D`—while `primary_degree` and `secondary_degree` capture their highest and secondary academic qualifications, with values like `pilot-primary-74` and `primary-secondar-52`.

The columns `current_institution`, `current_title`, and `research_focus` describe the researcher's present professional context. For instance, researcher `1` holds the title `Adaptive Protocol` with research focus `seasonal-research-47`, while researcher `3` holds `Composite Standard D` with focus `legacy-research-49`.

Three foreign keys link researchers to other entities. The column `academic_award_id` references `academic_awards.academic_award_id`, pointing to the award the researcher received (e.g., researcher `1` links to award `1000`). The column `leadership_position_id` references `leadership_positions.id`, indicating the leadership role the researcher holds (e.g., researcher `2` links to position `2`). The column `academic_institution_id` references `academic_institutions.academic_institution_id`, identifying the researcher's affiliated institution (e.g., researcher `4` links to institution `1003`). These three foreign keys create a star-like topology where the `researchers` table sits at the center, radiating connections outward to awards, leadership positions, and institutions.

## The Professional Societies Entity

**Table `professional_societies`**

| professional_society_id | society_identifier | society_name | founding_year | headquarters_location | membership_count | primary_discipline | academic_award_id | researcher_id | leadership_position_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | SOC-2579 | Composite Model | 43 | composite-headquar-63 | 242 | compact-primary-44 | 1000 | 1 | 1 |
| 101 | SOC-2583 | Compact Cluster A | 48 | primary-headquar-64 | 77 | composite-primary-45 | 1001 | 2 | 2 |
| 102 | SOC-2587 | Legacy Review | 53 | adaptive-headquar-65 | 601 | primary-primary-46 | 1002 | 3 | 3 |
| 103 | SOC-2591 | Regional Initiative | 58 | distributed-headquar-66 | 300 | adaptive-primary-47 | 1003 | 4 | 4 |

The `professional_societies` table models the professional organizations that researchers belong to or are affiliated with. Its primary key `professional_society_id` is a synthetic integer (e.g., `100`, `101`, `102`, `103`). The business key `society_identifier` carries codes such as `SOC-2579` or `SOC-2591`. The `society_name` column holds names like `Composite Model`, `Compact Cluster A`, `Legacy Review`, and `Regional Initiative`.

The column `founding_year` stores the year the society was established (values `43`, `48`, `53`, `58` in the sample), `headquarters_location` records the headquarters (e.g., `composite-headquar-63`, `distributed-headquar-66`), and `membership_count` captures the number of members (ranging from `77` to `601`). The `primary_discipline` column classifies the society's focus area, with values such as `compact-primary-44`, `composite-primary-45`, `primary-primary-46`, and `adaptive-primary-47`.

Three foreign keys connect this table to the broader schema. The column `academic_award_id` references `academic_awards.academic_award_id`, linking a society to an award (e.g., society `100` links to award `1000`). The column `researcher_id` references `researchers.id`, identifying the researcher associated with the society (e.g., society `101` links to researcher `2`). The column `leadership_position_id` references `leadership_positions.id`, connecting the society to a leadership role (e.g., society `103` links to position `4`). This mirrors the bidirectional relationship pattern seen in other tables: a professional society can be the recipient of an award, the home of a researcher, and the host of a leadership position.

## The Leadership Positions Entity

**Table `leadership_positions`**

| id | position_identifier | position_title | organization_name | start_date | end_date | position_status | researcher_id | professional_society_id |
|---|---|---|---|---|---|---|---|---|
| 1 | POS-2600 | Extended Model | Staples Inc. | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | current | 1 | 100 |
| 2 | POS-2606 | Pilot Cluster A | Oscar Health Inc. | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | past | 2 | 101 |
| 3 | POS-2612 | Baseline Review | Atlantic Richfield | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | interim | 3 | 102 |
| 4 | POS-2618 | Distributed Initiative | Port Loko | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | current | 4 | 103 |

The `leadership_positions` table records governance and administrative roles held by researchers. Its primary key `id` is a synthetic integer (e.g., `1`, `2`, `3`, `4`). The business key `position_identifier` provides codes such as `POS-2600` or `POS-2618`. The `position_title` column stores the title of the role—`Extended Model`, `Pilot Cluster A`, `Baseline Review`, `Distributed Initiative`—while `organization_name` names the organization where the role was held, such as `Staples Inc.`, `Oscar Health Inc.`, `Atlantic Richfield`, and `Port Loko`.

The temporal dimensions are captured by `start_date` and `end_date`, which store timestamps like `2022-09-05T20:24:00` and `2025-12-11T17:15:00`. The `position_status` column indicates whether the role is `current`, `past`, or `interim`. In the sample data, position `POS-2600` held by researcher `1` is marked `current`, while position `POS-2606` held by researcher `2` is marked `past`.

Two foreign keys anchor this table. The column `researcher_id` references `researchers.id`, identifying the person who holds the position (e.g., position `3` is held by researcher `3`). The column `professional_society_id` references `professional_societies.professional_society_id`, identifying the society within which the leadership role exists (e.g., position `4` is within society `103`). This design allows the model to answer questions such as "Which researcher holds which leadership position, and in which professional society?"

## The Academic Institutions Entity

**Table `academic_institutions`**

| academic_institution_id | institution_identifier | institution_name | founding_year | location_city | location_state | location_country | institution_type | researcher_id | awarded_degree_to_researcher_id | leadership_position_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | INS-2717 | Extended Corridor | 43 | seasonal-location-23 | composite-location-93 | adaptive-location-47 | university | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 1001 | INS-2718 | Pilot Series A | 48 | regional-location-24 | primary-location-94 | distributed-location-48 | medical_school | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 1002 | INS-2719 | Baseline Assessment | 53 | legacy-location-25 | adaptive-location-95 | baseline-location-49 | research_institute | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 1003 | INS-2720 | Distributed Survey | 58 | compact-location-26 | distributed-location-96 | pilot-location-50 | university | 4 | 4 | 4 | 2025-04-16 09:14:00 |

The `academic_institutions` table models the universities, medical schools, and research institutes affiliated with researchers. Its primary key `academic_institution_id` is a synthetic integer (e.g., `1000`, `1001`, `1002`, `1003`). The business key `institution_identifier` carries codes such as `INS-2717` or `INS-2720`. The `institution_name` column holds names like `Extended Corridor`, `Pilot Series A`, `Baseline Assessment`, and `Distributed Survey`.

The column `founding_year` records the year of establishment (values `43`, `48`, `53`, `58`), while `location_city`, `location_state`, and `location_country` store the geographic location. For example, institution `INS-2717` is located in `seasonal-location-23`, `composite-location-93`, and `adaptive-location-47`. The `institution_type` column classifies the institution as `university`, `medical_school`, or `research_institute`.

Three foreign keys connect this table to the rest of the schema. The column `researcher_id` references `researchers.id`, identifying the researcher affiliated with the institution (e.g., institution `1000` links to researcher `1`). The column `awarded_degree_to_researcher_id` references `researchers.id` again, indicating which researcher received a degree from this institution (e.g., institution `1001` awarded a degree to researcher `2`). The column `leadership_position_id` references `leadership_positions.id`, linking the institution to a leadership position (e.g., institution `1003` links to position `4`). The `created_at` column stores a timestamp such as `2025-01-01 00:14:00`, providing an audit trail for when the institution record was created.

## View: v_academic_award_researcher

**View `v_academic_award_researcher`**

```sql
CREATE VIEW v_academic_award_researcher AS
SELECT a.academic_award_id, a.award_identifier, a.award_name, a.issuing_organization, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM academic_awards a JOIN researchers b ON a.researcher_id = b.id;
```

| academic_award_id | award_identifier | award_name | issuing_organization | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 1000 | AWA-2104 | Primary Review A | Alphabet Inc Class A | 1 | RES-2651 | Integrated Framework A |
| 1001 | AWA-2105 | Composite Initiative | ITT Industries | 2 | RES-2652 | Extended Protocol |
| 1002 | AWA-2106 | Compact Model | Switch Card Services Ltd. | 3 | RES-2653 | Pilot Programme |
| 1003 | AWA-2107 | Legacy Cluster D | Buypass AS | 4 | RES-2654 | Baseline Standard D |

The view `v_academic_award_researcher` joins `academic_awards` with `researchers` on the condition `academic_awards.researcher_id = researchers.id`. This join answers the question: "Which researcher received which academic award?" The result columns include the award's `academic_award_id`, `award_identifier`, `award_name`, and `issuing_organization`, alongside the researcher's `id`, `researcher_identifier`, and `full_legal_name`.

Reading the first row of the view, award `AWA-2104` (named `Primary Review A`, issued by `Alphabet Inc Class A`) was received by researcher `RES-2651` (`Integrated Framework A`). The second row shows award `AWA-2105` (`Composite Initiative`, issued by `ITT Industries`) linked to researcher `RES-2652` (`Extended Protocol`). The third row connects award `AWA-2106` (`Compact Model`, issued by `Switch Card Services Ltd.`) with researcher `RES-2653` (`Pilot Programme`), and the fourth row links award `AWA-2107` (`Legacy Cluster D`, issued by `Buypass AS`) to researcher `RES-2654` (`Baseline Standard D`). This view materializes the direct recipient relationship that is stored as the foreign key `researcher_id` in the `academic_awards` table.

## View: v_academic_award_professional_society

**View `v_academic_award_professional_society`**

```sql
CREATE VIEW v_academic_award_professional_society AS
SELECT a.academic_award_id, a.award_identifier, a.award_name, a.issuing_organization, b.professional_society_id AS society_professional_society_id, b.society_identifier AS society_society_identifier, b.society_name AS society_society_name
FROM academic_awards a JOIN professional_societies b ON a.professional_society_id = b.professional_society_id;
```

| academic_award_id | award_identifier | award_name | issuing_organization | society_professional_society_id | society_society_identifier | society_society_name |
|---|---|---|---|---|---|---|
| 1000 | AWA-2104 | Primary Review A | Alphabet Inc Class A | 100 | SOC-2579 | Composite Model |
| 1001 | AWA-2105 | Composite Initiative | ITT Industries | 101 | SOC-2583 | Compact Cluster A |
| 1002 | AWA-2106 | Compact Model | Switch Card Services Ltd. | 102 | SOC-2587 | Legacy Review |
| 1003 | AWA-2107 | Legacy Cluster D | Buypass AS | 103 | SOC-2591 | Regional Initiative |

The view `v_academic_award_professional_society` joins `academic_awards` with `professional_societies` on `academic_awards.professional_society_id = professional_societies.professional_society_id`. This join answers: "Which professional society is associated with which academic award?" The result includes the award's identifying columns alongside the society's `professional_society_id`, `society_identifier`, `society_name`, `founding_year`, `headquarters_location`, `membership_count`, and `primary_discipline`.

In the sample data, award `AWA-2104` is associated with society `SOC-2579` (`Composite Model`, founded in year `43`, headquartered at `composite-headquar-63`, with `242` members and discipline `compact-primary-44`). Award `AWA-2105` links to society `SOC-2583` (`Compact Cluster A`, founded in year `48`, with `77` members). Award `AWA-2106` connects to society `SOC-2587` (`Legacy Review`, founded in year `53`, with `601` members), and award `AWA-2107` links to society `SOC-2591` (`Regional Initiative`, founded in year `58`, with `300` members). This view materializes the society-award relationship stored as `professional_society_id` in `academic_awards`.

## View: v_researcher_academic_award

**View `v_researcher_academic_award`**

```sql
CREATE VIEW v_researcher_academic_award AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.primary_degree, b.academic_award_id AS award_academic_award_id, b.award_identifier AS award_award_identifier, b.award_name AS award_award_name
FROM researchers a JOIN academic_awards b ON a.academic_award_id = b.academic_award_id;
```

| id | researcher_identifier | full_legal_name | primary_degree | award_academic_award_id | award_award_identifier | award_award_name |
|---|---|---|---|---|---|---|
| 1 | RES-2651 | Integrated Framework A | pilot-primary-74 | 1000 | AWA-2104 | Primary Review A |
| 2 | RES-2652 | Extended Protocol | extended-primary-75 | 1001 | AWA-2105 | Composite Initiative |
| 3 | RES-2653 | Pilot Programme | integrated-primary-76 | 1002 | AWA-2106 | Compact Model |
| 4 | RES-2654 | Baseline Standard D | seasonal-primary-77 | 1003 | AWA-2107 | Legacy Cluster D |

The view `v_researcher_academic_award` joins `researchers` with `academic_awards` on `researchers.academic_award_id = academic_awards.academic_award_id`. This join answers the inverse question of `v_academic_award_researcher`: "Which academic award is associated with which researcher?" The result columns include the researcher's `id`, `researcher_identifier`, `full_legal_name`, `primary_degree`, `secondary_degree`, `current_institution`, `current_title`, and `research_focus`, alongside the award's `academic_award_id`, `award_identifier`, `award_name`, `issuing_organization`, `award_date`, and `award_category`.

The first row shows researcher `RES-2651` (`Integrated Framework A`, with primary degree `pilot-primary-74`, current title `Adaptive Protocol`, and research focus `seasonal-research-47`) linked to award `AWA-2104` (`Primary Review A`, issued by `Alphabet Inc Class A`, dated `2025-12-01`, category `seasonal-award-53`). The second row connects researcher `RES-2652` (`Extended Protocol`, degree `extended-primary-75`, title `Primary Programme`, focus `regional-research-48`) to award `AWA-2105` (`Composite Initiative`, issued by `ITT Industries`, dated `2022-05-12`, category `regional-award-54`). This view materializes the award-to-researcher relationship stored as `academic_award_id` in the `researchers` table.

## View: v_researcher_leadership_position

**View `v_researcher_leadership_position`**

```sql
CREATE VIEW v_researcher_leadership_position AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.primary_degree, b.id AS position_id, b.position_identifier AS position_position_identifier, b.position_title AS position_position_title
FROM researchers a JOIN leadership_positions b ON a.leadership_position_id = b.id;
```

| id | researcher_identifier | full_legal_name | primary_degree | position_id | position_position_identifier | position_position_title |
|---|---|---|---|---|---|---|
| 1 | RES-2651 | Integrated Framework A | pilot-primary-74 | 1 | POS-2600 | Extended Model |
| 2 | RES-2652 | Extended Protocol | extended-primary-75 | 2 | POS-2606 | Pilot Cluster A |
| 3 | RES-2653 | Pilot Programme | integrated-primary-76 | 3 | POS-2612 | Baseline Review |
| 4 | RES-2654 | Baseline Standard D | seasonal-primary-77 | 4 | POS-2618 | Distributed Initiative |

The view `v_researcher_leadership_position` joins `researchers` with `leadership_positions` on `researchers.leadership_position_id = leadership_positions.id`. This join answers: "Which leadership position is held by which researcher?" The result includes the researcher's identifying and professional columns alongside the position's `id`, `position_identifier`, `position_title`, `organization_name`, `start_date`, `end_date`, and `position_status`.

The first row shows researcher `RES-2651` (`Integrated Framework A`) linked to position `POS-2600` (`Extended Model` at `Staples Inc.`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, status `current`). The second row connects researcher `RES-2652` (`Extended Protocol`) to position `POS-2606` (`Pilot Cluster A` at `Oscar Health Inc.`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00`, status `past`). The third row links researcher `RES-2653` (`Pilot Programme`) to position `POS-2612` (`Baseline Review` at `Atlantic Richfield`, running from `2024-07-27T10:58:00` to `2024-07-23T22:34:00`, status `interim`), and the fourth row connects researcher `RES-2654` (`Baseline Standard D`) to position `POS-2618` (`Distributed Initiative` at `Port Loko`, running from `2025-12-11T17:15:00` to `2025-12-07T05:51:00`, status `current`). This view materializes the leadership-to-researcher relationship stored as `leadership_position_id` in the `researchers` table.

## View: v_researcher_academic_institution

**View `v_researcher_academic_institution`**

```sql
CREATE VIEW v_researcher_academic_institution AS
SELECT a.id, a.researcher_identifier, a.full_legal_name, a.primary_degree, b.academic_institution_id AS institution_academic_institution_id, b.institution_identifier AS institution_institution_identifier, b.institution_name AS institution_institution_name
FROM researchers a JOIN academic_institutions b ON a.academic_institution_id = b.academic_institution_id;
```

| id | researcher_identifier | full_legal_name | primary_degree | institution_academic_institution_id | institution_institution_identifier | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | RES-2651 | Integrated Framework A | pilot-primary-74 | 1000 | INS-2717 | Extended Corridor |
| 2 | RES-2652 | Extended Protocol | extended-primary-75 | 1001 | INS-2718 | Pilot Series A |
| 3 | RES-2653 | Pilot Programme | integrated-primary-76 | 1002 | INS-2719 | Baseline Assessment |
| 4 | RES-2654 | Baseline Standard D | seasonal-primary-77 | 1003 | INS-2720 | Distributed Survey |

The view `v_researcher_academic_institution` joins `researchers` with `academic_institutions` on `researchers.academic_institution_id = academic_institutions.academic_institution_id`. This join answers: "Which academic institution is affiliated with which researcher?" The result columns include the researcher's identifying and professional details alongside the institution's `academic_institution_id`, `institution_identifier`, `institution_name`, `founding_year`, `location_city`, `location_state`, `location_country`, `institution_type`, `awarded_degree_to_researcher_id`, `leadership_position_id`, and `created_at`.

The first row shows researcher `RES-2651` (`Integrated Framework A`) linked to institution `INS-2717` (`Extended Corridor`, founded in year `43`, located in `seasonal-location-23`, `composite-location-93`, `adaptive-location-47`, type `university`, created at `2025-01-01 00:14:00`). The second row connects researcher `RES-2652` (`Extended Protocol`) to institution `INS-2718` (`Pilot Series A`, founded in year `48`, located in `regional-location-24`, `primary-location-94`, `distributed-location-48`, type `medical_school`, created at `2025-02-06 03:14:00`). The third row links researcher `RES-2653` (`Pilot Programme`) to institution `INS-2719` (`Baseline Assessment`, founded in year `53`, located in `legacy-location-25`, `adaptive-location-95`, `baseline-location-49`, type `research_institute`, created at `2025-03-11 06:14:00`), and the fourth row connects researcher `RES-2654` (`Baseline Standard D`) to institution `INS-2720` (`Distributed Survey`, founded in year `58`, located in `compact-location-26`, `distributed-location-96`, `pilot-location-50`, type `university`, created at `2025-04-16 09:14:00`). This view materializes the institution-to-researcher relationship stored as `academic_institution_id` in the `researchers` table.

## View: v_professional_society_academic_award

**View `v_professional_society_academic_award`**

```sql
CREATE VIEW v_professional_society_academic_award AS
SELECT a.professional_society_id, a.society_identifier, a.society_name, a.founding_year, b.academic_award_id AS award_academic_award_id, b.award_identifier AS award_award_identifier, b.award_name AS award_award_name
FROM professional_societies a JOIN academic_awards b ON a.academic_award_id = b.academic_award_id;
```

| professional_society_id | society_identifier | society_name | founding_year | award_academic_award_id | award_award_identifier | award_award_name |
|---|---|---|---|---|---|---|
| 100 | SOC-2579 | Composite Model | 43 | 1000 | AWA-2104 | Primary Review A |
| 101 | SOC-2583 | Compact Cluster A | 48 | 1001 | AWA-2105 | Composite Initiative |
| 102 | SOC-2587 | Legacy Review | 53 | 1002 | AWA-2106 | Compact Model |
| 103 | SOC-2591 | Regional Initiative | 58 | 1003 | AWA-2107 | Legacy Cluster D |

The view `v_professional_society_academic_award` joins `professional_societies` with `academic_awards` on `professional_societies.academic_award_id = academic_awards.academic_award_id`. This join answers: "Which academic award is associated with which professional society?" The result includes the society's `professional_society_id`, `society_identifier`, `society_name`, `founding_year`, `headquarters_location`, `membership_count`, and `primary_discipline`, alongside the award's `academic_award_id`, `award_identifier`, `award_name`, `issuing_organization`, `award_date`, and `award_category`.

The first row shows society `SOC-2579` (`Composite Model`, founded in year `43`, headquartered at `composite-headquar-63`, with `242` members and discipline `compact-primary-44`) linked to award `AWA-2104` (`Primary Review A`, issued by `Alphabet Inc Class A`, dated `2025-12-01`, category `seasonal-award-53`). The second row connects society `SOC-2583` (`Compact Cluster A`, founded in year `48`, headquartered at `primary-headquar-64`, with `77` members and discipline `composite-primary-45`) to award `AWA-2105` (`Composite Initiative`, issued by `ITT Industries`, dated `2022-05-12`, category `regional-award-54`). The third row links society `SOC-2587` (`Legacy Review`, founded in year `53`, headquartered at `adaptive-headquar-65`, with `601` members and discipline `primary-primary-46`) to award `AWA-2106` (`Compact Model`, issued by `Switch Card Services Ltd.`, dated `2023-10-23`, category `legacy-award-55`), and the fourth row connects society `SOC-2591` (`Regional Initiative`, founded in year `58`, headquartered at `distributed-headquar-66`, with `300` members and discipline `adaptive-primary-47`) to award `AWA-2107` (`Legacy Cluster D`, issued by `Buypass AS`, dated `2024-03-07`, category `compact-award-56`). This view materializes the award-to-society relationship stored as `academic_award_id` in the `professional_societies` table.

## View: v_professional_society_researcher

**View `v_professional_society_researcher`**

```sql
CREATE VIEW v_professional_society_researcher AS
SELECT a.professional_society_id, a.society_identifier, a.society_name, a.founding_year, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM professional_societies a JOIN researchers b ON a.researcher_id = b.id;
```

| professional_society_id | society_identifier | society_name | founding_year | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 100 | SOC-2579 | Composite Model | 43 | 1 | RES-2651 | Integrated Framework A |
| 101 | SOC-2583 | Compact Cluster A | 48 | 2 | RES-2652 | Extended Protocol |
| 102 | SOC-2587 | Legacy Review | 53 | 3 | RES-2653 | Pilot Programme |
| 103 | SOC-2591 | Regional Initiative | 58 | 4 | RES-2654 | Baseline Standard D |

The view `v_professional_society_researcher` joins `professional_societies` with `researchers` on `professional_societies.researcher_id = researchers.id`. This join answers: "Which researcher is associated with which professional society?" The result columns include the society's identifying and descriptive columns alongside the researcher's `id`, `researcher_identifier`, `full_legal_name`, `primary_degree`, `secondary_degree`, `current_institution`, `current_title`, and `research_focus`.

The first row shows society `SOC-2579` (`Composite Model`, founded in year `43`, headquartered at `composite-headquar-63`, with `242` members and discipline `compact-primary-44`) linked to researcher `RES-2651` (`Integrated Framework A`, primary degree `pilot-primary-74`, secondary degree `primary-secondar-52`, current institution `extended-current-27`, title `Adaptive Protocol`, research focus `seasonal-research-47`). The second row connects society `SOC-2583` (`Compact Cluster A`, founded in year `48`, headquartered at `primary-headquar-64`, with `77` members and discipline `composite-primary-45`) to researcher `RES-2652` (`Extended Protocol`, primary degree `extended-primary-75`, secondary degree `adaptive-secondar-53`, current institution `integrated-current-28`, title `Primary Programme`, research focus `regional-research-48`). The third row links society `SOC-2587` (`Legacy Review`, founded in year `53`, headquartered at `adaptive-headquar-65`, with `601` members and discipline `primary-primary-46`) to researcher `RES-2653` (`Pilot Programme`, primary degree `integrated-primary-76`, secondary degree `distributed-secondar-54`, current institution `seasonal-current-29`, title `Composite Standard D`, research focus `legacy-research-49`), and the fourth row connects society `SOC-2591` (`Regional Initiative`, founded in year `58`, headquartered at `distributed-headquar-66`, with `300` members and discipline `adaptive-primary-47`) to researcher `RES-2654` (`Baseline Standard D`, primary degree `seasonal-primary-77`, secondary degree `baseline-secondar-55`, current institution `regional-current-30`, title `Compact Framework`, research focus `compact-research-50`). This view materializes the researcher-to-society relationship stored as `researcher_id` in the `professional_societies` table.

## View: v_professional_society_leadership_position

**View `v_professional_society_leadership_position`**

```sql
CREATE VIEW v_professional_society_leadership_position AS
SELECT a.professional_society_id, a.society_identifier, a.society_name, a.founding_year, b.id AS position_id, b.position_identifier AS position_position_identifier, b.position_title AS position_position_title
FROM professional_societies a JOIN leadership_positions b ON a.leadership_position_id = b.id;
```

| professional_society_id | society_identifier | society_name | founding_year | position_id | position_position_identifier | position_position_title |
|---|---|---|---|---|---|---|
| 100 | SOC-2579 | Composite Model | 43 | 1 | POS-2600 | Extended Model |
| 101 | SOC-2583 | Compact Cluster A | 48 | 2 | POS-2606 | Pilot Cluster A |
| 102 | SOC-2587 | Legacy Review | 53 | 3 | POS-2612 | Baseline Review |
| 103 | SOC-2591 | Regional Initiative | 58 | 4 | POS-2618 | Distributed Initiative |

The view `v_professional_society_leadership_position` joins `professional_societies` with `leadership_positions` on `professional_societies.leadership_position_id = leadership_positions.id`. This join answers: "Which leadership position is hosted within which professional society?" The result includes the society's identifying and descriptive columns alongside the position's `id`, `position_identifier`, `position_title`, `organization_name`, `start_date`, `end_date`, and `position_status`.

The first row shows society `SOC-2579` (`Composite Model`, founded in year `43`, headquartered at `composite-headquar-63`, with `242` members and discipline `compact-primary-44`) linked to position `POS-2600` (`Extended Model` at `Staples Inc.`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, status `current`). The second row connects society `SOC-2583` (`Compact Cluster A`, founded in year `48`, headquartered at `primary-headquar-64`, with `77` members and discipline `composite-primary-45`) to position `POS-2606` (`Pilot Cluster A` at `Oscar Health Inc.`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00`, status `past`). The third row links society `SOC-2587` (`Legacy Review`, founded in year `53`, headquartered at `adaptive-headquar-65`, with `601` members and discipline `primary-primary-46`) to position `POS-2612` (`Baseline Review` at `Atlantic Richfield`, running from `2024-07-27T10:58:00` to `2024-07-23T22:34:00`, status `interim`), and the fourth row connects society `SOC-2591` (`Regional Initiative`, founded in year `58`, headquartered at `distributed-headquar-66`, with `300` members and discipline `adaptive-primary-47`) to position `POS-2618` (`Distributed Initiative` at `Port Loko`, running from `2025-12-11T17:15:00` to `2025-12-07T05:51:00`, status `current`). This view materializes the leadership-to-society relationship stored as `leadership_position_id` in the `professional_societies` table.

## View: v_leadership_position_researcher

**View `v_leadership_position_researcher`**

```sql
CREATE VIEW v_leadership_position_researcher AS
SELECT a.id, a.position_identifier, a.position_title, a.organization_name, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM leadership_positions a JOIN researchers b ON a.researcher_id = b.id;
```

| id | position_identifier | position_title | organization_name | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 1 | POS-2600 | Extended Model | Staples Inc. | 1 | RES-2651 | Integrated Framework A |
| 2 | POS-2606 | Pilot Cluster A | Oscar Health Inc. | 2 | RES-2652 | Extended Protocol |
| 3 | POS-2612 | Baseline Review | Atlantic Richfield | 3 | RES-2653 | Pilot Programme |
| 4 | POS-2618 | Distributed Initiative | Port Loko | 4 | RES-2654 | Baseline Standard D |

The view `v_leadership_position_researcher` joins `leadership_positions` with `researchers` on `leadership_positions.researcher_id = researchers.id`. This join answers: "Which researcher holds which leadership position?" The result columns include the position's `id`, `position_identifier`, `position_title`, `organization_name`, `start_date`, `end_date`, and `position_status`, alongside the researcher's `id`, `researcher_identifier`, `full_legal_name`, `primary_degree`, `secondary_degree`, `current_institution`, `current_title`, and `research_focus`.

The first row shows position `POS-2600` (`Extended Model` at `Staples Inc.`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, status `current`) held by researcher `RES-2651` (`Integrated Framework A`, primary degree `pilot-primary-74`, secondary degree `primary-secondar-52`, current institution `extended-current-27`, title `Adaptive Protocol`, research focus `seasonal-research-47`). The second row connects position `POS-2606` (`Pilot Cluster A` at `Oscar Health Inc.`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00`, status `past`) to researcher `RES-2652` (`Extended Protocol`, primary degree `extended-primary-75`, secondary degree `adaptive-secondar-53`, current institution `integrated-current-28`, title `Primary Programme`, research focus `regional-research-48`). The third row links position `POS-2612` (`Baseline Review` at `Atlantic Richfield`, running from `2024-07-27T10:58:00` to `2024-07-23T22:34:00`, status `interim`) to researcher `RES-2653` (`Pilot Programme`, primary degree `integrated-primary-76`, secondary degree `distributed-secondar-54`, current institution `seasonal-current-29`, title `Composite Standard D`, research focus `legacy-research-49`), and the fourth row connects position `POS-2618` (`Distributed Initiative` at `Port Loko`, running from `2025-12-11T17:15:00` to `2025-12-07T05:51:00`, status `current`) to researcher `RES-2654` (`Baseline Standard D`, primary degree `seasonal-primary-77`, secondary degree `baseline-secondar-55`, current institution `regional-current-30`, title `Compact Framework`, research focus `compact-research-50`). This view materializes the researcher-to-leadership relationship stored as `researcher_id` in the `leadership_positions` table.

## View: v_leadership_position_professional_society

**View `v_leadership_position_professional_society`**

```sql
CREATE VIEW v_leadership_position_professional_society AS
SELECT a.id, a.position_identifier, a.position_title, a.organization_name, b.professional_society_id AS society_professional_society_id, b.society_identifier AS society_society_identifier, b.society_name AS society_society_name
FROM leadership_positions a JOIN professional_societies b ON a.professional_society_id = b.professional_society_id;
```

| id | position_identifier | position_title | organization_name | society_professional_society_id | society_society_identifier | society_society_name |
|---|---|---|---|---|---|---|
| 1 | POS-2600 | Extended Model | Staples Inc. | 100 | SOC-2579 | Composite Model |
| 2 | POS-2606 | Pilot Cluster A | Oscar Health Inc. | 101 | SOC-2583 | Compact Cluster A |
| 3 | POS-2612 | Baseline Review | Atlantic Richfield | 102 | SOC-2587 | Legacy Review |
| 4 | POS-2618 | Distributed Initiative | Port Loko | 103 | SOC-2591 | Regional Initiative |

The view `v_leadership_position_professional_society` joins `leadership_positions` with `professional_societies` on `leadership_positions.professional_society_id = professional_societies.professional_society_id`. This join answers: "Which professional society hosts which leadership position?" The result columns include the position's identifying and temporal columns alongside the society's `professional_society_id`, `society_identifier`, `society_name`, `founding_year`, `headquarters_location`, `membership_count`, and `primary_discipline`.

The first row shows position `POS-2600` (`Extended Model` at `Staples Inc.`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, status `current`) hosted within society `SOC-2579` (`Composite Model`, founded in year `43`, headquartered at `composite-headquar-63`, with `242` members and discipline `compact-primary-44`). The second row connects position `POS-2606` (`Pilot Cluster A` at `Oscar Health Inc.`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00`, status `past`) to society `SOC-2583` (`Compact Cluster A`, founded in year `48`, headquartered at `primary-headquar-64`, with `77` members and discipline `composite-primary-45`). The third row links position `POS-2612` (`Baseline Review` at `Atlantic Richfield`, running from `2024-07-27T10:58:00` to `2024-07-23T22:34:00`, status `interim`) to society `SOC-2587` (`Legacy Review`, founded in year `53`, headquartered at `adaptive-headquar-65`, with `601` members and discipline `primary-primary-46`), and the fourth row connects position `POS-2618` (`Distributed Initiative` at `Port Loko`, running from `2025-12-11T17:15:00` to `2025-12-07T05:51:00`, status `current`) to society `SOC-2591` (`Regional Initiative`, founded in year `58`, headquartered at `distributed-headquar-66`, with `300` members and discipline `adaptive-primary-47`). This view materializes the society-to-leadership relationship stored as `professional_society_id` in the `leadership_positions` table.

## View: v_academic_institution_researcher

**View `v_academic_institution_researcher`**

```sql
CREATE VIEW v_academic_institution_researcher AS
SELECT a.academic_institution_id, a.institution_identifier, a.institution_name, a.founding_year, b.id AS researcher_id, b.researcher_identifier AS researcher_researcher_identifier, b.full_legal_name AS researcher_full_legal_name
FROM academic_institutions a JOIN researchers b ON a.researcher_id = b.id;
```

| academic_institution_id | institution_identifier | institution_name | founding_year | researcher_id | researcher_researcher_identifier | researcher_full_legal_name |
|---|---|---|---|---|---|---|
| 1000 | INS-2717 | Extended Corridor | 43 | 1 | RES-2651 | Integrated Framework A |
| 1001 | INS-2718 | Pilot Series A | 48 | 2 | RES-2652 | Extended Protocol |
| 1002 | INS-2719 | Baseline Assessment | 53 | 3 | RES-2653 | Pilot Programme |
| 1003 | INS-2720 | Distributed Survey | 58 | 4 | RES-2654 | Baseline Standard D |

The view `v_academic_institution_researcher` joins `academic_institutions` with `researchers` on `academic_institutions.researcher_id = researchers.id`. This join answers: "Which researcher is affiliated with which academic institution?" The result columns include the institution's `academic_institution_id`, `institution_identifier`, `institution_name`, `founding_year`, `location_city`, `location_state`, `location_country`, `institution_type`, `awarded_degree_to_researcher_id`, `leadership_position_id`, and `created_at`, alongside the researcher's `id`, `researcher_identifier`, `full_legal_name`, `primary_degree`, `secondary_degree`, `current_institution`, `current_title`, and `research_focus`.

The first row shows institution `INS-2717` (`Extended Corridor`, founded in year `43`, located in `seasonal-location-23`, `composite-location-93`, `adaptive-location-47`, type `university`, created at `2025-01-01 00:14:00`) affiliated with researcher `RES-2651` (`Integrated Framework A`, primary degree `pilot-primary-74`, secondary degree `primary-secondar-52`, current institution `extended-current-27`, title `Adaptive Protocol`, research focus `seasonal-research-47`). The second row connects institution `INS-2718` (`Pilot Series A`, founded in year `48`, located in `regional-location-24`, `primary-location-94`, `distributed-location-48`, type `medical_school`, created at `2025-02-06 03:14:00`) to researcher `RES-2652` (`Extended Protocol`, primary degree `extended-primary-75`, secondary degree `adaptive-secondar-53`, current institution `integrated-current-28`, title `Primary Programme`, research focus `regional-research-48`). The third row links institution `INS-2719` (`Baseline Assessment`, founded in year `53`, located in `legacy-location-25`, `adaptive-location-95`, `baseline-location-49`, type `research_institute`, created at `2025-03-11 06:14:00`) to researcher `RES-2653` (`Pilot Programme`, primary degree `integrated-primary-76`, secondary degree `distributed-secondar-54`, current institution `seasonal-current-29`, title `Composite Standard D`, research focus `legacy-research-49`), and the fourth row connects institution `INS-2720` (`Distributed Survey`, founded in year `58`, located in `compact-location-26`, `distributed-location-96`, `pilot-location-50`, type `university`, created at `2025-04-16 09:14:00`) to researcher `RES-2654` (`Baseline Standard D`, primary degree `seasonal-primary-77`, secondary degree `baseline-secondar-55`, current institution `regional-current-30`, title `Compact Framework`, research focus `compact-research-50`). This view materializes the researcher-to-institution relationship stored as `researcher_id` in the `academic_institutions` table.

## View: v_academic_institution_leadership_position

**View `v_academic_institution_leadership_position`**

```sql
CREATE VIEW v_academic_institution_leadership_position AS
SELECT a.academic_institution_id, a.institution_identifier, a.institution_name, a.founding_year, b.id AS position_id, b.position_identifier AS position_position_identifier, b.position_title AS position_position_title
FROM academic_institutions a JOIN leadership_positions b ON a.leadership_position_id = b.id;
```

| academic_institution_id | institution_identifier | institution_name | founding_year | position_id | position_position_identifier | position_position_title |
|---|---|---|---|---|---|---|
| 1000 | INS-2717 | Extended Corridor | 43 | 1 | POS-2600 | Extended Model |
| 1001 | INS-2718 | Pilot Series A | 48 | 2 | POS-2606 | Pilot Cluster A |
| 1002 | INS-2719 | Baseline Assessment | 53 | 3 | POS-2612 | Baseline Review |
| 1003 | INS-2720 | Distributed Survey | 58 | 4 | POS-2618 | Distributed Initiative |

The view `v_academic_institution_leadership_position` joins `academic_institutions` with `leadership_positions` on `academic_institutions.leadership_position_id = leadership_positions.id`. This join answers: "Which leadership position is associated with which academic institution?" The result columns include the institution's identifying, geographic, and temporal columns alongside the position's `id`, `position_identifier`, `position_title`, `organization_name`, `start_date`, `end_date`, and `position_status`.

The first row shows institution `INS-2717` (`Extended Corridor`, founded in year `43`, located in `seasonal-location-23`, `composite-location-93`, `adaptive-location-47`, type `university`, created at `2025-01-01 00:14:00`) linked to position `POS-2600` (`Extended Model` at `Staples Inc.`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`, status `current`). The second row connects institution `INS-2718` (`Pilot Series A`, founded in year `48`, located in `regional-location-24`, `primary-location-94`, `distributed-location-48`, type `medical_school`, created at `2025-02-06 03:14:00`) to position `POS-2606` (`Pilot Cluster A` at `Oscar Health Inc.`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00`, status `past`). The third row links institution `INS-2719` (`Baseline Assessment`, founded in year `53`, located in `legacy-location-25`, `adaptive-location-95`, `baseline-location-49`, type `research_institute`, created at `2025-03-11 06:14:00`) to position `POS-2612` (`Baseline Review` at `Atlantic Richfield`, running from `2024-07-27T10:58:00` to `2024-07-23T22:34:00`, status `interim`), and the fourth row connects institution `INS-2720` (`Distributed Survey`, founded in year `58`, located in `compact-location-26`, `distributed-location-96`, `pilot-location-50`, type `university`, created at `2025-04-16 09:14:00`) to position `POS-2618` (`Distributed Initiative` at `Port Loko`, running from `2025-12-11T17:15:00` to `2025-12-07T05:51:00`, status `current`). This view materializes the leadership-to-institution relationship stored as `leadership_position_id` in the `academic_institutions` table.

## Synthesis

The relational schema models the academic researcher ecosystem as five interlocking entity types, each with its own primary key and a set of descriptive attributes. Foreign-key columns in every table create a dense web of bidirectional relationships: `academic_awards` points to both `researchers` and `professional_societies`; `researchers` points to `academic_awards`, `leadership_positions`, and `academic_institutions`; `professional_societies` points to `academic_awards`, `researchers`, and `leadership_positions`; `leadership_positions` points to `researchers` and `professional_societies`; and `academic_institutions` points to `researchers` (twice, for affiliation and degree awarding) and `leadership_positions`. The twelve views each perform a single join between two base tables, reconstructing a domain fact from the normalized storage. Together, the base tables and views provide a complete picture of who the researchers are, what awards they have received, which societies they belong to, what leadership roles they hold, and which institutions they are affiliated with.