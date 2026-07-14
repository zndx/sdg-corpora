The cybernetics domain captures the interlocking relationships between living organisms, their engineered modifications, the research programmes that study them, the scientists who conduct the work, and the scholarly discourse that documents it. At its core, the model distinguishes six entity types—each materialised as a relational table—and stitches them together through foreign-key columns and a suite of join views that reconstruct domain facts from the normalised base. The tables are `CyberneticOrganism`, `CyberneticModification`, `CyberneticsResearch`, `Cybernetician`, `ResearchMethod`, and `ScientificDiscourse`. Every table carries a surrogate primary key, and every foreign key is a nullable column that points to the primary key of another table. The views then reassemble these pieces into flat, query-ready result sets.

## The base tables

The `CyberneticOrganism` table is the anchor for every living subject in the dataset. Its surrogate primary key `id` is an integer (100, 101, 102, 103 in the sample), while the natural identifier `organismId` carries a heterogeneous mix of values—plain integers such as `4793483`, UUIDs like `edc71a6a-9bab-11eb-a8a2-19ed5c03f8d3`, and short numeric codes such as `4277015`. The `organismType` column classifies the subject as `human`, `mouse`, or `astronaut`. Temporal and functional metadata follow: `modificationDate` stores an ISO-8601 timestamp (e.g. `2025-08-03T07:33:00`), `controlSystemType` records the mechanism applied (`osmotic pump` or `exogenous component`), `environmentAdaptation` notes the setting (`space travel` or `laboratory`), and `homeostaticStatus` is a categorical flag (`extended` or `unmodified`). Two foreign keys complete the row: `modificationId` points to `CyberneticModification.id`, and `researchId` points to `CyberneticsResearch.researchId`. In the sample data, organism `100` (a human with identifier `4793483`) is linked to modification `1` and research `1000`.

**Table `CyberneticOrganism`**

| id | organismId | organismType | modificationDate | controlSystemType | environmentAdaptation | homeostaticStatus | modificationId | researchId |
|---|---|---|---|---|---|---|---|---|
| 100 | 4793483 | human | 2025-08-03T07:33:00 | osmotic pump | space travel | extended | 1 | 1000 |
| 101 | edc71a6a-9bab-11eb-a8a2-19ed5c03f8d3 | mouse | 2022-01-14T14:50:00 | exogenous component | laboratory | unmodified | 2 | 1001 |
| 102 | 4277015 | astronaut | 2023-06-25T21:07:00 | osmotic pump | space travel | extended | 3 | 1002 |
| 103 | 2106717 | human | 2024-11-09T04:24:00 | exogenous component | laboratory | unmodified | 4 | 1003 |

The `CyberneticModification` table records every engineered intervention. Its surrogate key `id` is a small integer (1–4), while the business identifier `modificationId` uses a mix of integers (`6926378`, `6969415`), a synthetic code (`default_chart_a_tax_code_41`), and a UUID (`d64c33f2-8fc1-11eb-924d-9cd76263cbd0`). The `modificationType` column distinguishes `implant`, `drug delivery`, and `feedback loop`. The `implementationDate` column stores the timestamp of the procedure. `controlMechanism` mirrors the `controlSystemType` from the organism table (`osmotic pump` or `exogenous component`), and `targetFunction` describes the physiological goal (`homeostasis`, `self-regulation`, or `environmental adaptation`). Three foreign keys bind this table to the rest of the schema: `researcherId` references `Cybernetician.researcherId`, `organismId` references `CyberneticOrganism.id`, and `researchId` references `CyberneticsResearch.researchId`. Modification `1` (an `implant` with identifier `6926378`) targets `homeostasis` and is associated with researcher `89419`, organism `100`, and research `1000`.

**Table `CyberneticModification`**

| id | modificationId | modificationType | implementationDate | controlMechanism | targetFunction | researcherId | organismId | researchId |
|---|---|---|---|---|---|---|---|---|
| 1 | 6926378 | implant | 2024-11-14T10:06:00 | osmotic pump | homeostasis | 89419 | 100 | 1000 |
| 2 | 6969415 | drug delivery | 2025-04-25T17:23:00 | exogenous component | self-regulation | 2618557 | 101 | 1001 |
| 3 | default_chart_a_tax_code_41 | feedback loop | 2022-09-09T00:40:00 | osmotic pump | environmental adaptation | 9736892 | 102 | 1002 |
| 4 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | implant | 2023-02-20T07:57:00 | exogenous component | homeostasis | 1450639 | 103 | 1003 |

The `CyberneticsResearch` table is the central hub of the model. Its primary key `researchId` is a four-digit integer (1000–1003). The `researchTitle` column carries descriptive names such as `Extended Framework`, `Pilot Protocol A`, `Baseline Programme`, and `Distributed Standard`. The `startDate` and `endDate` columns store ISO-8601 timestamps; notably, in the sample data the end date precedes the start date (e.g. `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), which may reflect a data-entry convention or a retrospective labelling. `researchLocation` records the geographic or institutional setting (`USA`, `Britain`, `MIT`, `Rockland State`), `fundingSource` captures the financier (`Josiah Macy Jr Foundation`, `military`, `academic`), and `researchStatus` is a categorical flag (`active`, `completed`, `declined`). The `createdAt` column stores the row-creation timestamp. Three foreign keys tie research to its actors and methods: `cyberneticianId` references `Cybernetician.cyberneticianId`, `organismId` references `CyberneticOrganism.id`, and `methodId` references `ResearchMethod.methodId`. Research `1000` (`Extended Framework`) is funded by the Josiah Macy Jr Foundation, located in the USA, and linked to cybernetician `1`, organism `100`, and method `209228`.

**Table `CyberneticsResearch`**

| researchId | researchTitle | startDate | endDate | researchLocation | fundingSource | researchStatus | cyberneticianId | organismId | methodId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Extended Framework | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | USA | Josiah Macy Jr Foundation | active | 1 | 100 | 209228 | 2025-01-01 00:14:00 |
| 1001 | Pilot Protocol A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Britain | military | completed | 2 | 101 | 7441161 | 2025-02-06 03:14:00 |
| 1002 | Baseline Programme | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | MIT | academic | declined | 3 | 102 | 89447 | 2025-03-11 06:14:00 |
| 1003 | Distributed Standard | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Rockland State | Josiah Macy Jr Foundation | active | 4 | 103 | 4180941 | 2025-04-16 09:14:00 |

The `Cybernetician` table stores the scientists. Its surrogate primary key `cyberneticianId` is a small integer (1–4). The `researcherId` column carries the same numeric identifiers seen in `CyberneticModification.researcherId` (89419, 2618557, 9736892, 1450639), establishing a one-to-one correspondence between a cybernetician and the researcher records that reference them. `fullName` holds the scientist's name (`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`). `institution` records the affiliation (`MIT`, `Rockland State`, `academic`). `specialisation` is a categorical field (`medical cybernetics`, `space medicine`, `control theory`), `activePeriod` stores a textual era (`1945-1970`, `mid 1980s`), and `keyContributions` notes the scientist's signature work (`cybernetics theory`, `cyborg technique`, `feedback control`). The `researchId` foreign key points to `CyberneticsResearch.researchId`, and `collaboratesWithCyberneticianId` is a self-referential foreign key that points to another `cyberneticianId`—in the sample data, each cybernetician's `collaboratesWithCyberneticianId` equals their own `cyberneticianId`, suggesting a placeholder or a reflexive collaboration record. Cybernetician `1` (Theodore Mcgrath at MIT, specialising in medical cybernetics, active 1945–1970) is linked to research `1000` and collaborates with cybernetician `1`.

**Table `Cybernetician`**

| cyberneticianId | researcherId | fullName | institution | specialization | activePeriod | keyContributions | researchId | collaboratesWithCyberneticianId |
|---|---|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | MIT | medical cybernetics | 1945-1970 | cybernetics theory | 1000 | 1 |
| 2 | 2618557 | Account Name | Rockland State | space medicine | mid 1980s | cyborg technique | 1001 | 2 |
| 3 | 9736892 | Saipan International Airport | academic | control theory | 1945-1970 | feedback control | 1002 | 3 |
| 4 | 1450639 | Norma Fisher | MIT | medical cybernetics | mid 1980s | cybernetics theory | 1003 | 4 |

The `ResearchMethod` table captures the methodological toolkit. Its surrogate key `methodId` is a large integer (209228, 7441161, 89447, 4180941). The `methodName` column holds descriptive labels such as `human-machine analogy`, `feedback control`, and `osmotic pump implantation`. `methodType` is categorical (`experimental`, `theoretical`, `procedural`), `applicationDomain` mirrors the specialisation values from `Cybernetician` (`medical cybernetics`, `space medicine`, `control theory`), and `effectiveness` is a three-level ordinal (`high`, `moderate`, `low`). Two foreign keys bind the method to its context: `researchId` references `CyberneticsResearch.researchId`, and `cyberneticianId` references `Cybernetician.cyberneticianId`. Method `209228` (`human-machine analogy`, type `experimental`, domain `medical cybernetics`, effectiveness `high`) is associated with research `1000` and cybernetician `1`.

**Table `ResearchMethod`**

| methodId | methodName | methodType | applicationDomain | effectiveness | researchId | cyberneticianId |
|---|---|---|---|---|---|---|
| 209228 | human-machine analogy | experimental | medical cybernetics | high | 1000 | 1 |
| 7441161 | feedback control | theoretical | space medicine | moderate | 1001 | 2 |
| 89447 | osmotic pump implantation | procedural | control theory | low | 1002 | 3 |
| 4180941 | human-machine analogy | experimental | medical cybernetics | high | 1003 | 4 |

The `ScientificDiscourse` table records scholarly publications. Its surrogate key `discourseId` is a mixed-type identifier (integers like `3158142` and `89102`, a UUID-like string `b_VB-IC-0`). The `discourseTitle` column carries titles such as `Legacy Assessment D`, `Regional Survey`, `Seasonal Corridor`, and `Integrated Series A`. `publicationDate` stores an ISO-8601 timestamp. `authorId` holds the author's name (`Stephen King`, `Collin Lopez`, `Dana Nguyen`, `Greg Miller`). `discourseType` is categorical (`historical analysis`, `critique`, `theoretical framework`), and `keyThemes` captures the subject matter (`cyborgs`, `cybernetics`, `teleological account`). The `researchId` foreign key links the discourse to its parent research, and `referencesDiscourseId` is a self-referential foreign key pointing to another `discourseId`—in the sample data, each discourse references itself, suggesting a placeholder for citation chains. Discourse `3158142` (`Legacy Assessment D`, type `historical analysis`, theme `cyborgs`, authored by Stephen King) is linked to research `1000` and references discourse `3158142`.

**Table `ScientificDiscourse`**

| discourseId | discourseTitle | publicationDate | authorId | discourseType | keyThemes | researchId | referencesDiscourseId |
|---|---|---|---|---|---|---|---|
| 3158142 | Legacy Assessment D | 2025-12-01T23:33:00 | Stephen King | historical analysis | cyborgs | 1000 | 3158142 |
| 89102 | Regional Survey | 2022-05-12T06:50:00 | Collin Lopez | critique | cybernetics | 1001 | 89102 |
| b_VB-IC-0 | Seasonal Corridor | 2023-10-23T13:07:00 | Dana Nguyen | theoretical framework | teleological account | 1002 | b_VB-IC-0 |
| 338543 | Integrated Series A | 2024-03-07T20:24:00 | Greg Miller | historical analysis | cyborgs | 1003 | 338543 |

## Foreign-key topology and cardinality

The foreign-key graph forms a star centred on `CyberneticsResearch`. Every other table—`CyberneticOrganism`, `CyberneticModification`, `Cybernetician`, `ResearchMethod`, and `ScientificDiscourse`—carries a `researchId` foreign key that points to `CyberneticsResearch.researchId`. This design enforces the business rule that every organism, modification, scientist, method, and publication belongs to exactly one research programme. The cardinality is one-to-many on the research side: a single research record (e.g. `1000`) can be referenced by multiple rows in the child tables, while each child row references at most one research row.

Two additional FK chains radiate from `CyberneticsResearch`. The `cyberneticianId` column points to `Cybernetician.cyberneticianId`, establishing a many-to-one relationship between research and its lead scientist. The `organismId` column points to `CyberneticOrganism.id`, linking each research programme to its primary subject. The `methodId` column points to `ResearchMethod.methodId`, binding the methodological approach to the research.

`CyberneticModification` carries two further foreign keys. Its `researcherId` column references `Cybernetician.researcherId`, creating a many-to-one link between a modification and the scientist who performed it. Its `organismId` column references `CyberneticOrganism.id`, tying the modification to the subject organism. The `CyberneticOrganism` table itself carries a `modificationId` foreign key pointing to `CyberneticModification.id`, forming a one-to-one or one-to-many relationship: each organism can have at most one modification record (in the sample, organism `100` references modification `1`, organism `101` references modification `2`, and so on).

Two self-referential foreign keys exist: `Cybernetician.collaboratesWithCyberneticianId` and `ScientificDiscourse.referencesDiscourseId`. Both are nullable and point to the same table's primary key, enabling reflexive or peer-to-peer relationships. In the sample data, these columns are populated with the row's own primary key, which may indicate a default or placeholder value.

## The join views

Each view is a `SELECT` that joins two or more base tables on their foreign-key columns, producing a denormalised result set that answers a specific domain question. The view names follow a consistent convention: `vw_<table_a>_<table_b>` indicates a join between the two named tables.

The view `vw_cybernetic_organism_cybernetic_modification` joins `CyberneticOrganism` to `CyberneticModification` on `CyberneticOrganism.modificationId = CyberneticModification.id`. It answers the question: "For each organism, what is its associated modification?" A sample row shows organism `100` (type `human`, identifier `4793483`, homeostatic status `extended`) paired with modification `1` (type `implant`, control mechanism `osmotic pump`, target function `homeostasis`). This view materialises the organism-to-modification relationship in a single flat row.

**View `vw_cybernetic_organism_cybernetic_modification`**

```sql
CREATE VIEW vw_cybernetic_organism_cybernetic_modification AS
SELECT a.id, a.organismId, a.organismType, a.modificationDate, b.id AS modification_id, b.modificationId AS modification_modificationId, b.modificationType AS modification_modificationType
FROM CyberneticOrganism a JOIN CyberneticModification b ON a.modificationId = b.id;
```

| id | organismId | organismType | modificationDate | modification_id | modification_modificationId | modification_modificationType |
|---|---|---|---|---|---|---|
| 100 | 4793483 | human | 2025-08-03T07:33:00 | 1 | 6926378 | implant |
| 101 | edc71a6a-9bab-11eb-a8a2-19ed5c03f8d3 | mouse | 2022-01-14T14:50:00 | 2 | 6969415 | drug delivery |
| 102 | 4277015 | astronaut | 2023-06-25T21:07:00 | 3 | default_chart_a_tax_code_41 | feedback loop |
| 103 | 2106717 | human | 2024-11-09T04:24:00 | 4 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | implant |

The view `vw_cybernetic_organism_cybernetics_research` joins `CyberneticOrganism` to `CyberneticsResearch` on `CyberneticOrganism.researchId = CyberneticsResearch.researchId`. It answers: "Which research programme is each organism associated with?" A sample row pairs organism `100` (type `human`, environment `space travel`) with research `1000` (`Extended Framework`, location `USA`, status `active`). This view reconstructs the organism-to-research link that is stored as the `researchId` FK in the organism table.

**View `vw_cybernetic_organism_cybernetics_research`**

```sql
CREATE VIEW vw_cybernetic_organism_cybernetics_research AS
SELECT a.id, a.organismId, a.organismType, a.modificationDate, b.researchId AS research_researchId, b.researchTitle AS research_researchTitle, b.startDate AS research_startDate
FROM CyberneticOrganism a JOIN CyberneticsResearch b ON a.researchId = b.researchId;
```

| id | organismId | organismType | modificationDate | research_researchId | research_researchTitle | research_startDate |
|---|---|---|---|---|---|---|
| 100 | 4793483 | human | 2025-08-03T07:33:00 | 1000 | Extended Framework | 2022-09-05T20:24:00 |
| 101 | edc71a6a-9bab-11eb-a8a2-19ed5c03f8d3 | mouse | 2022-01-14T14:50:00 | 1001 | Pilot Protocol A | 2023-02-16T03:41:00 |
| 102 | 4277015 | astronaut | 2023-06-25T21:07:00 | 1002 | Baseline Programme | 2024-07-27T10:58:00 |
| 103 | 2106717 | human | 2024-11-09T04:24:00 | 1003 | Distributed Standard | 2025-12-11T17:15:00 |

The view `vw_cybernetic_modification_cybernetic_organism` performs the inverse join: `CyberneticModification` to `CyberneticOrganism` on `CyberneticModification.organismId = CyberneticOrganism.id`. It answers: "For each modification, which organism was it applied to?" A sample row shows modification `1` (type `implant`, implementation date `2024-11-14T10:06:00`) applied to organism `100` (type `human`, identifier `4793483`). This view is useful when the modification is the primary entity and the organism is the attribute of interest.

**View `vw_cybernetic_modification_cybernetic_organism`**

```sql
CREATE VIEW vw_cybernetic_modification_cybernetic_organism AS
SELECT a.id, a.modificationId, a.modificationType, a.implementationDate, b.id AS organism_id, b.organismId AS organism_organismId, b.organismType AS organism_organismType
FROM CyberneticModification a JOIN CyberneticOrganism b ON a.organismId = b.id;
```

| id | modificationId | modificationType | implementationDate | organism_id | organism_organismId | organism_organismType |
|---|---|---|---|---|---|---|
| 1 | 6926378 | implant | 2024-11-14T10:06:00 | 100 | 4793483 | human |
| 2 | 6969415 | drug delivery | 2025-04-25T17:23:00 | 101 | edc71a6a-9bab-11eb-a8a2-19ed5c03f8d3 | mouse |
| 3 | default_chart_a_tax_code_41 | feedback loop | 2022-09-09T00:40:00 | 102 | 4277015 | astronaut |
| 4 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | implant | 2023-02-20T07:57:00 | 103 | 2106717 | human |

The view `vw_cybernetic_modification_cybernetics_research` joins `CyberneticModification` to `CyberneticsResearch` on `CyberneticModification.researchId = CyberneticsResearch.researchId`. It answers: "Which research programme does each modification belong to?" A sample row pairs modification `1` (type `implant`, target function `homeostasis`) with research `1000` (`Extended Framework`, funding `Josiah Macy Jr Foundation`). This view reconstructs the modification-to-research FK that is stored directly in the modification table.

**View `vw_cybernetic_modification_cybernetics_research`**

```sql
CREATE VIEW vw_cybernetic_modification_cybernetics_research AS
SELECT a.id, a.modificationId, a.modificationType, a.implementationDate, b.researchId AS research_researchId, b.researchTitle AS research_researchTitle, b.startDate AS research_startDate
FROM CyberneticModification a JOIN CyberneticsResearch b ON a.researchId = b.researchId;
```

| id | modificationId | modificationType | implementationDate | research_researchId | research_researchTitle | research_startDate |
|---|---|---|---|---|---|---|
| 1 | 6926378 | implant | 2024-11-14T10:06:00 | 1000 | Extended Framework | 2022-09-05T20:24:00 |
| 2 | 6969415 | drug delivery | 2025-04-25T17:23:00 | 1001 | Pilot Protocol A | 2023-02-16T03:41:00 |
| 3 | default_chart_a_tax_code_41 | feedback loop | 2022-09-09T00:40:00 | 1002 | Baseline Programme | 2024-07-27T10:58:00 |
| 4 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | implant | 2023-02-20T07:57:00 | 1003 | Distributed Standard | 2025-12-11T17:15:00 |

The view `vw_cybernetics_research_cybernetician` joins `CyberneticsResearch` to `Cybernetician` on `CyberneticsResearch.cyberneticianId = Cybernetician.cyberneticianId`. It answers: "Which scientist leads each research programme?" A sample row shows research `1000` (`Extended Framework`, status `active`) led by cybernetician `1` (Theodore Mcgrath, institution `MIT`, specialisation `medical cybernetics`, active period `1945-1970`). This view materialises the research-to-cybernetician FK.

**View `vw_cybernetics_research_cybernetician`**

```sql
CREATE VIEW vw_cybernetics_research_cybernetician AS
SELECT a.researchId, a.researchTitle, a.startDate, a.endDate, b.cyberneticianId AS cybernetician_cyberneticianId, b.researcherId AS cybernetician_researcherId, b.fullName AS cybernetician_fullName
FROM CyberneticsResearch a JOIN Cybernetician b ON a.cyberneticianId = b.cyberneticianId;
```

| researchId | researchTitle | startDate | endDate | cybernetician_cyberneticianId | cybernetician_researcherId | cybernetician_fullName |
|---|---|---|---|---|---|---|
| 1000 | Extended Framework | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 89419 | Theodore Mcgrath |
| 1001 | Pilot Protocol A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 2618557 | Account Name |
| 1002 | Baseline Programme | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 9736892 | Saipan International Airport |
| 1003 | Distributed Standard | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 1450639 | Norma Fisher |

The view `vw_cybernetics_research_cybernetic_organism` joins `CyberneticsResearch` to `CyberneticOrganism` on `CyberneticsResearch.organismId = CyberneticOrganism.id`. It answers: "Which organism is the subject of each research programme?" A sample row pairs research `1000` (`Extended Framework`) with organism `100` (type `human`, identifier `4793483`, homeostatic status `extended`). This view reconstructs the research-to-organism FK.

**View `vw_cybernetics_research_cybernetic_organism`**

```sql
CREATE VIEW vw_cybernetics_research_cybernetic_organism AS
SELECT a.researchId, a.researchTitle, a.startDate, a.endDate, b.id AS organism_id, b.organismId AS organism_organismId, b.organismType AS organism_organismType
FROM CyberneticsResearch a JOIN CyberneticOrganism b ON a.organismId = b.id;
```

| researchId | researchTitle | startDate | endDate | organism_id | organism_organismId | organism_organismType |
|---|---|---|---|---|---|---|
| 1000 | Extended Framework | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | 4793483 | human |
| 1001 | Pilot Protocol A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | edc71a6a-9bab-11eb-a8a2-19ed5c03f8d3 | mouse |
| 1002 | Baseline Programme | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 4277015 | astronaut |
| 1003 | Distributed Standard | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 2106717 | human |

The view `vw_cybernetics_research_research_method` joins `CyberneticsResearch` to `ResearchMethod` on `CyberneticsResearch.methodId = ResearchMethod.methodId`. It answers: "Which methodological approach does each research programme employ?" A sample row shows research `1000` (`Extended Framework`) using method `209228` (`human-machine analogy`, type `experimental`, domain `medical cybernetics`, effectiveness `high`). This view materialises the research-to-method FK.

**View `vw_cybernetics_research_research_method`**

```sql
CREATE VIEW vw_cybernetics_research_research_method AS
SELECT a.researchId, a.researchTitle, a.startDate, a.endDate, b.methodId AS method_methodId, b.methodName AS method_methodName, b.methodType AS method_methodType
FROM CyberneticsResearch a JOIN ResearchMethod b ON a.methodId = b.methodId;
```

| researchId | researchTitle | startDate | endDate | method_methodId | method_methodName | method_methodType |
|---|---|---|---|---|---|---|
| 1000 | Extended Framework | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 209228 | human-machine analogy | experimental |
| 1001 | Pilot Protocol A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 7441161 | feedback control | theoretical |
| 1002 | Baseline Programme | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 89447 | osmotic pump implantation | procedural |
| 1003 | Distributed Standard | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4180941 | human-machine analogy | experimental |

The view `vw_cybernetician_cybernetics_research` joins `Cybernetician` to `CyberneticsResearch` on `Cybernetician.researchId = CyberneticsResearch.researchId`. It answers: "Which research programmes is each cybernetician associated with?" A sample row pairs cybernetician `1` (Theodore Mcgrath, MIT, specialisation `medical cybernetics`) with research `1000` (`Extended Framework`, location `USA`, status `active`). This view is the inverse of `vw_cybernetics_research_cybernetician` and is useful when the scientist is the primary entity.

**View `vw_cybernetician_cybernetics_research`**

```sql
CREATE VIEW vw_cybernetician_cybernetics_research AS
SELECT a.cyberneticianId, a.researcherId, a.fullName, a.institution, b.researchId AS research_researchId, b.researchTitle AS research_researchTitle, b.startDate AS research_startDate
FROM Cybernetician a JOIN CyberneticsResearch b ON a.researchId = b.researchId;
```

| cyberneticianId | researcherId | fullName | institution | research_researchId | research_researchTitle | research_startDate |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | MIT | 1000 | Extended Framework | 2022-09-05T20:24:00 |
| 2 | 2618557 | Account Name | Rockland State | 1001 | Pilot Protocol A | 2023-02-16T03:41:00 |
| 3 | 9736892 | Saipan International Airport | academic | 1002 | Baseline Programme | 2024-07-27T10:58:00 |
| 4 | 1450639 | Norma Fisher | MIT | 1003 | Distributed Standard | 2025-12-11T17:15:00 |

The view `vw_cybernetician_cybernetician` joins `Cybernetician` to itself on `Cybernetician.collaboratesWithCyberneticianId = Cybernetician.cyberneticianId`. It answers: "Which cybernetician collaborates with which other cybernetician?" In the sample data, each cybernetician's `collaboratesWithCyberneticianId` equals their own `cyberneticianId`, so the view produces reflexive pairs: cybernetician `1` (Theodore Mcgrath) collaborates with cybernetician `1`. This self-join is the mechanism by which the peer-to-peer collaboration relationship is materialised.

**View `vw_cybernetician_cybernetician`**

```sql
CREATE VIEW vw_cybernetician_cybernetician AS
SELECT a.cyberneticianId, a.researcherId, a.fullName, a.institution, b.cyberneticianId AS cybernetician_cyberneticianId, b.researcherId AS cybernetician_researcherId, b.fullName AS cybernetician_fullName
FROM Cybernetician a JOIN Cybernetician b ON a.collaboratesWithCyberneticianId = b.cyberneticianId;
```

| cyberneticianId | researcherId | fullName | institution | cybernetician_cyberneticianId | cybernetician_researcherId | cybernetician_fullName |
|---|---|---|---|---|---|---|
| 1 | 89419 | Theodore Mcgrath | MIT | 1 | 89419 | Theodore Mcgrath |
| 2 | 2618557 | Account Name | Rockland State | 2 | 2618557 | Account Name |
| 3 | 9736892 | Saipan International Airport | academic | 3 | 9736892 | Saipan International Airport |
| 4 | 1450639 | Norma Fisher | MIT | 4 | 1450639 | Norma Fisher |

The view `vw_research_method_cybernetics_research` joins `ResearchMethod` to `CyberneticsResearch` on `ResearchMethod.researchId = CyberneticsResearch.researchId`. It answers: "Which research programmes use each method?" A sample row shows method `209228` (`human-machine analogy`, type `experimental`, effectiveness `high`) used by research `1000` (`Extended Framework`, status `active`). This view is the inverse of `vw_cybernetics_research_research_method`.

**View `vw_research_method_cybernetics_research`**

```sql
CREATE VIEW vw_research_method_cybernetics_research AS
SELECT a.methodId, a.methodName, a.methodType, a.applicationDomain, b.researchId AS research_researchId, b.researchTitle AS research_researchTitle, b.startDate AS research_startDate
FROM ResearchMethod a JOIN CyberneticsResearch b ON a.researchId = b.researchId;
```

| methodId | methodName | methodType | applicationDomain | research_researchId | research_researchTitle | research_startDate |
|---|---|---|---|---|---|---|
| 209228 | human-machine analogy | experimental | medical cybernetics | 1000 | Extended Framework | 2022-09-05T20:24:00 |
| 7441161 | feedback control | theoretical | space medicine | 1001 | Pilot Protocol A | 2023-02-16T03:41:00 |
| 89447 | osmotic pump implantation | procedural | control theory | 1002 | Baseline Programme | 2024-07-27T10:58:00 |
| 4180941 | human-machine analogy | experimental | medical cybernetics | 1003 | Distributed Standard | 2025-12-11T17:15:00 |

The view `vw_research_method_cybernetician` joins `ResearchMethod` to `Cybernetician` on `ResearchMethod.cyberneticianId = Cybernetician.cyberneticianId`. It answers: "Which scientist is associated with each research method?" A sample row pairs method `209228` (`human-machine analogy`, domain `medical cybernetics`, effectiveness `high`) with cybernetician `1` (Theodore Mcgrath, institution `MIT`, specialisation `medical cybernetics`). This view reconstructs the method-to-cybernetician FK.

**View `vw_research_method_cybernetician`**

```sql
CREATE VIEW vw_research_method_cybernetician AS
SELECT a.methodId, a.methodName, a.methodType, a.applicationDomain, b.cyberneticianId AS cybernetician_cyberneticianId, b.researcherId AS cybernetician_researcherId, b.fullName AS cybernetician_fullName
FROM ResearchMethod a JOIN Cybernetician b ON a.cyberneticianId = b.cyberneticianId;
```

| methodId | methodName | methodType | applicationDomain | cybernetician_cyberneticianId | cybernetician_researcherId | cybernetician_fullName |
|---|---|---|---|---|---|---|
| 209228 | human-machine analogy | experimental | medical cybernetics | 1 | 89419 | Theodore Mcgrath |
| 7441161 | feedback control | theoretical | space medicine | 2 | 2618557 | Account Name |
| 89447 | osmotic pump implantation | procedural | control theory | 3 | 9736892 | Saipan International Airport |
| 4180941 | human-machine analogy | experimental | medical cybernetics | 4 | 1450639 | Norma Fisher |

The view `vw_scientific_discourse_cybernetics_research` joins `ScientificDiscourse` to `CyberneticsResearch` on `ScientificDiscourse.researchId = CyberneticsResearch.researchId`. It answers: "Which research programme does each discourse belong to?" A sample row shows discourse `3158142` (`Legacy Assessment D`, type `historical analysis`, theme `cyborgs`, author `Stephen King`) linked to research `1000` (`Extended Framework`, status `active`). This view materialises the discourse-to-research FK.

**View `vw_scientific_discourse_cybernetics_research`**

```sql
CREATE VIEW vw_scientific_discourse_cybernetics_research AS
SELECT a.discourseId, a.discourseTitle, a.publicationDate, a.authorId, b.researchId AS research_researchId, b.researchTitle AS research_researchTitle, b.startDate AS research_startDate
FROM ScientificDiscourse a JOIN CyberneticsResearch b ON a.researchId = b.researchId;
```

| discourseId | discourseTitle | publicationDate | authorId | research_researchId | research_researchTitle | research_startDate |
|---|---|---|---|---|---|---|
| 3158142 | Legacy Assessment D | 2025-12-01T23:33:00 | Stephen King | 1000 | Extended Framework | 2022-09-05T20:24:00 |
| 89102 | Regional Survey | 2022-05-12T06:50:00 | Collin Lopez | 1001 | Pilot Protocol A | 2023-02-16T03:41:00 |
| b_VB-IC-0 | Seasonal Corridor | 2023-10-23T13:07:00 | Dana Nguyen | 1002 | Baseline Programme | 2024-07-27T10:58:00 |
| 338543 | Integrated Series A | 2024-03-07T20:24:00 | Greg Miller | 1003 | Distributed Standard | 2025-12-11T17:15:00 |

The view `vw_scientific_discourse_scientific_discourse` joins `ScientificDiscourse` to itself on `ScientificDiscourse.referencesDiscourseId = ScientificDiscourse.discourseId`. It answers: "Which discourse references which other discourse?" In the sample data, each discourse references itself: discourse `3158142` (`Legacy Assessment D`) references discourse `3158142`. This self-join is the mechanism by which the citation chain relationship is materialised, and in production data it would link distinct discourse records to form a directed graph of scholarly references.

**View `vw_scientific_discourse_scientific_discourse`**

```sql
CREATE VIEW vw_scientific_discourse_scientific_discourse AS
SELECT a.discourseId, a.discourseTitle, a.publicationDate, a.authorId, b.discourseId AS discourse_discourseId, b.discourseTitle AS discourse_discourseTitle, b.publicationDate AS discourse_publicationDate
FROM ScientificDiscourse a JOIN ScientificDiscourse b ON a.referencesDiscourseId = b.discourseId;
```

| discourseId | discourseTitle | publicationDate | authorId | discourse_discourseId | discourse_discourseTitle | discourse_publicationDate |
|---|---|---|---|---|---|---|
| 3158142 | Legacy Assessment D | 2025-12-01T23:33:00 | Stephen King | 3158142 | Legacy Assessment D | 2025-12-01T23:33:00 |
| 89102 | Regional Survey | 2022-05-12T06:50:00 | Collin Lopez | 89102 | Regional Survey | 2022-05-12T06:50:00 |
| b_VB-IC-0 | Seasonal Corridor | 2023-10-23T13:07:00 | Dana Nguyen | b_VB-IC-0 | Seasonal Corridor | 2023-10-23T13:07:00 |
| 338543 | Integrated Series A | 2024-03-07T20:24:00 | Greg Miller | 338543 | Integrated Series A | 2024-03-07T20:24:00 |

## Closing synthesis

The cybernetics schema is a star topology with `CyberneticsResearch` at its centre. Every entity type—organisms, modifications, scientists, methods, and discourses—carries a `researchId` foreign key that anchors it to a research programme. Additional foreign keys create secondary relationships: organisms link to modifications, modifications link to scientists and organisms, research links to scientists and methods, and scientists and discourses form self-referential collaboration and citation graphs. The twelve join views reassemble these normalised pieces into flat, query-ready result sets, each view answering a specific relational question by joining exactly two tables on their shared key. The result is a model that is both faithful to the domain ontology and optimised for analytical queries: the base tables enforce referential integrity and minimise redundancy, while the views provide the denormalised perspectives that analysts and dashboards require.