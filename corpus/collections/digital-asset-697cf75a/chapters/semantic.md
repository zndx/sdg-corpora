## Domain Modelling and Relational Materialisation

The domain under consideration is a production pipeline for digital assets—animated sequences, models, and media files—orchestrated through projects, authored with software tools, and enriched by external resources. Every artefact carries a lifecycle (draft through published), a temporal footprint (creation date, duration, frame count), and a set of relationships to the projects that consume it and the tools that produced it. The relational schema captures this structure through a core set of base tables, a handful of junction tables for many-to-many associations, and a family of views that reassemble the normalised facts into domain-meaningful joins.

**Table `digital_assets`**

| digital_asset_id | asset_identifier | asset_title | creation_date | file_format | duration_seconds | frame_count | status | tool_id | project_id | exported_to_digital_asset_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Integrated Framework A | 2022-01-13T12:24:00 | pilot-file-44 | 7.45 | 5 | draft | comi | 1000 | 1 |
| 2 | ASS-2756 | Extended Protocol | 2023-06-24T19:41:00 | extended-file-45 | 9.90 | 3 | rendered | 195360 | 1001 | 2 |
| 3 | ASS-2760 | Pilot Programme | 2024-11-08T02:58:00 | integrated-file-46 | 12.35 | 9 | published | 3355763 | 1002 | 3 |
| 4 | ASS-2764 | Baseline Standard D | 2025-04-19T09:15:00 | seasonal-file-47 | 14.80 | 6 | archived | 8387539 | 1003 | 4 |

The `digital_assets` table is the central entity. Each row represents a discrete media artefact identified by a surrogate `digital_asset_id` and a human-readable `asset_identifier` such as `ASS-2752`. The `asset_title` column carries a descriptive name—`Integrated Framework A`, `Extended Protocol`, and so on—while `creation_date` timestamps the artefact's origin. Production metadata includes `file_format` (e.g. `pilot-file-44`, `extended-file-45`), `duration_seconds` (a decimal ranging from 7.45 to 14.80), and `frame_count` (an integer between 3 and 9). The `status` column constrains the lifecycle to one of four values: `draft`, `rendered`, `published`, or `archived`. Two foreign keys anchor the asset to its authoring context: `tool_id` references the `software_tools` table, and `project_id` references the `projects` table. A self-referential column, `exported_to_digital_asset_id`, models the export relationship where one asset is derived from another; in the sample data every asset exports to itself, but the column is designed to support cross-asset export chains.

**Table `projects`**

| id | project_id | project_title | start_date | end_date | project_type | description | resource_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1437597 | Integrated Model A | 2022-09-05 | 2022-09-01 | animation | Extended Survey | 1167 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16 | 2023-02-12 | modeling | Pilot Corridor A | 2106708 |
| 1002 | 5006462 | Pilot Review | 2024-07-27 | 2024-07-23 | rigging | Baseline Series | 4180945 |
| 1003 | 10207143 | Baseline Initiative D | 2025-12-11 | 2025-12-07 | music | Distributed Assessment | 10238270 |

The `projects` table captures the organisational containers that group and schedule digital assets. Each project has a surrogate primary key `id` (1000–1003 in the sample), a business-level `project_id` that may be an integer like `1437597` or a UUID such as `df5a6648-8fd1-11eb-924d-9cd76263cbd0`, and a `project_title` (`Integrated Model A`, `Extended Cluster`, `Pilot Review`, `Baseline Initiative D`). Temporal bounds are stored in `start_date` and `end_date`, while `project_type` classifies the work as `animation`, `modeling`, `rigging`, or `music`. A free-text `description` field provides additional context, and `resource_id` links the project to an entry in the `external_resources` table.

**Table `software_tools`**

| tool_id | tool_name | version | tool_category | vendor | digital_asset_id |
|---|---|---|---|---|---|
| comi | Composite Model | seasonal-version-71 | 3d_modeling | Feedback Ratings | 1 |
| 195360 | Compact Cluster A | regional-version-72 | animation | Abbott Laboratories | 2 |
| 3355763 | Legacy Review | legacy-version-73 | audio_production | American Express | 3 |
| 8387539 | Regional Initiative | compact-version-74 | video_editing | Whatsapp Inc. | 4 |

Software tools are catalogued in `software_tools`, keyed by `tool_id` (a mixed-type column containing both string identifiers like `comi` and numeric strings like `195360`). Each tool has a `tool_name` (`Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative`), a `version` string, a `tool_category` (`3d_modeling`, `animation`, `audio_production`, `video_editing`), and a `vendor` name (`Feedback Ratings`, `Abbott Laboratories`, `American Express`, `Whatsapp Inc.`). The `digital_asset_id` column creates a one-to-many relationship: a single tool can be associated with multiple digital assets, but each asset references exactly one tool.

**Table `external_resources`**

| resource_id | resource_title | source_url | resource_type | license | project_id | digital_asset_id |
|---|---|---|---|---|---|---|
| 1167 | Baseline Series D | https://bugs.launchpad.net/keystone/+bug/1432191 | texture | baseline-license-43 | 1000 | 1 |
| 2106708 | Distributed Assessment | https://ecocyc.org/gene?orgid=ECOLI&id=EG10355 | sound_clip | pilot-license-44 | 1001 | 2 |
| 4180945 | Adaptive Survey | https://bugs.launchpad.net/neutron/+bug/1184696 | pre_rigged_model | extended-license-45 | 1002 | 3 |
| 10238270 | Primary Corridor A | http://twitter.com/gagnonsheila/status/475411638917791744 | reference_video | integrated-license-46 | 1003 | 4 |

External resources live in the `external_resources` table. Each row carries a `resource_id`, a `resource_title`, a `source_url` pointing to an external location (Launchpad bug trackers, Ecocyc gene pages, Twitter statuses), a `resource_type` (`texture`, `sound_clip`, `pre_rigged_model`, `reference_video`), and a `license` identifier. The table links outward through `project_id` and `digital_asset_id`, allowing a single resource to be associated with both a project and an asset.

**Table `animation_sequences`**

| id | sequence_id | sequence_name | duration_seconds | frame_count | animation_type | keyframe_count | project_id | digital_asset_id | uses_rig_digital_asset_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1437593 | Primary Review A | 7.45 | 5 | walk | 4 | 1000 | 1 | 1 |
| 1001 | c6ac3b76-9bac-11eb-a8a2-19ed5c03f8d3 | Composite Initiative | 9.90 | 3 | heavy_walk | 5 | 1001 | 2 | 2 |
| 1002 | 1152668 | Compact Model | 12.35 | 9 | dance | 5 | 1002 | 3 | 3 |
| 1003 | 19526306 | Legacy Cluster D | 14.80 | 6 | breakout | 0 | 1003 | 4 | 4 |

The `animation_sequences` table stores the temporal choreography of animated content. Each sequence has a surrogate `id`, a business `sequence_id`, and a `sequence_name` (`Primary Review A`, `Composite Initiative`, `Compact Model`, `Legacy Cluster D`). The `duration_seconds` and `frame_count` columns mirror the analogous columns in `digital_assets`, suggesting that sequences are time-bounded subsets of assets. The `animation_type` column classifies the motion (`walk`, `heavy_walk`, `dance`, `breakout`), while `keyframe_count` records the number of keyframes (0–5). Foreign keys `project_id` and `digital_asset_id` tie the sequence to its project and asset, and `uses_rig_digital_asset_id` creates a self-referential link to another digital asset that serves as the rig for the animation.

**Table `projects_assets`**

| project_id | digital_asset_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `projects_assets` junction table resolves the many-to-many relationship between projects and digital assets. A project can consume multiple assets, and an asset can belong to multiple projects. In the sample data, project `1000` consumes assets `1` and `2`, project `1001` consumes assets `2` and `3`, and so on, forming a chain where each project shares one asset with its predecessor and one with its successor.

**Table `projects_tools`**

| project_id | tool_id |
|---|---|
| 1000 | comi |
| 1000 | 195360 |
| 1001 | 195360 |
| 1001 | 3355763 |
| 1002 | 3355763 |
| 1002 | 8387539 |
| 1003 | 8387539 |
| 1003 | comi |

The `projects_tools` table links projects to software tools, enabling a project to be associated with multiple tools and a tool to be used across multiple projects. This is a standard junction table with composite foreign keys referencing `projects.id` and `software_tools.tool_id`.

**Table `tools_projects`**

| tool_id | project_id |
|---|---|
| comi | 1000 |
| comi | 1001 |
| 195360 | 1001 |
| 195360 | 1002 |
| 3355763 | 1002 |
| 3355763 | 1003 |
| 8387539 | 1003 |
| 8387539 | 1000 |

The `tools_projects` table provides a second junction between tools and projects, mirroring `projects_tools` but from the tool's perspective. Together, these two junction tables support bidirectional navigation: from a project you can enumerate its tools, and from a tool you can enumerate the projects that use it.

### Views: Reconstructing Domain Facts

The views materialise the normalised schema into domain-meaningful joins, each answering a specific analytical question.

**View `v_digital_asset_software_tool`**

```sql
CREATE VIEW v_digital_asset_software_tool AS
SELECT a.digital_asset_id, a.asset_identifier, a.asset_title, a.creation_date, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name, b.version AS tool_version
FROM digital_assets a JOIN software_tools b ON a.tool_id = b.tool_id;
```

| digital_asset_id | asset_identifier | asset_title | creation_date | tool_tool_id | tool_tool_name | tool_version |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Integrated Framework A | 2022-01-13T12:24:00 | comi | Composite Model | seasonal-version-71 |
| 2 | ASS-2756 | Extended Protocol | 2023-06-24T19:41:00 | 195360 | Compact Cluster A | regional-version-72 |
| 3 | ASS-2760 | Pilot Programme | 2024-11-08T02:58:00 | 3355763 | Legacy Review | legacy-version-73 |
| 4 | ASS-2764 | Baseline Standard D | 2025-04-19T09:15:00 | 8387539 | Regional Initiative | compact-version-74 |

The view `v_digital_asset_software_tool` joins `digital_assets` to `software_tools` on the `tool_id` foreign key, producing a flat row that pairs each asset with its authoring tool. For example, asset `ASS-2752` (`Integrated Framework A`) is paired with tool `comi` (`Composite Model`, category `3d_modeling`, vendor `Feedback Ratings`). This view answers the question: "Which tool produced which asset?"

**View `v_digital_asset_project`**

```sql
CREATE VIEW v_digital_asset_project AS
SELECT a.digital_asset_id, a.asset_identifier, a.asset_title, a.creation_date, b.id AS project_id, b.project_id AS project_project_id, b.project_title AS project_project_title
FROM digital_assets a JOIN projects b ON a.project_id = b.id;
```

| digital_asset_id | asset_identifier | asset_title | creation_date | project_id | project_project_id | project_project_title |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Integrated Framework A | 2022-01-13T12:24:00 | 1000 | 1437597 | Integrated Model A |
| 2 | ASS-2756 | Extended Protocol | 2023-06-24T19:41:00 | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster |
| 3 | ASS-2760 | Pilot Programme | 2024-11-08T02:58:00 | 1002 | 5006462 | Pilot Review |
| 4 | ASS-2764 | Baseline Standard D | 2025-04-19T09:15:00 | 1003 | 10207143 | Baseline Initiative D |

The view `v_digital_asset_project` joins `digital_assets` to `projects` on `project_id`, surfacing the project context for each asset. Asset `ASS-2752` belongs to project `1000` (`Integrated Model A`, type `animation`, started `2022-09-05`). This view answers: "Which project does each asset belong to?"

**View `v_digital_asset_digital_asset`**

```sql
CREATE VIEW v_digital_asset_digital_asset AS
SELECT a.digital_asset_id, a.asset_identifier, a.asset_title, a.creation_date, b.digital_asset_id AS asset_digital_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_title AS asset_asset_title
FROM digital_assets a JOIN digital_assets b ON a.exported_to_digital_asset_id = b.digital_asset_id;
```

| digital_asset_id | asset_identifier | asset_title | creation_date | asset_digital_asset_id | asset_asset_identifier | asset_asset_title |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Integrated Framework A | 2022-01-13T12:24:00 | 1 | ASS-2752 | Integrated Framework A |
| 2 | ASS-2756 | Extended Protocol | 2023-06-24T19:41:00 | 2 | ASS-2756 | Extended Protocol |
| 3 | ASS-2760 | Pilot Programme | 2024-11-08T02:58:00 | 3 | ASS-2760 | Pilot Programme |
| 4 | ASS-2764 | Baseline Standard D | 2025-04-19T09:15:00 | 4 | ASS-2764 | Baseline Standard D |

The view `v_digital_asset_digital_asset` performs a self-join on `digital_assets` using the `exported_to_digital_asset_id` column, revealing export relationships between assets. In the sample data, every asset exports to itself, so each row pairs an asset with its own metadata. This view answers: "Which asset was exported from which other asset?"

**View `v_project_digital_asset_detail`**

```sql
CREATE VIEW v_project_digital_asset_detail AS
SELECT a.id, a.project_id, a.project_title, b.digital_asset_id AS asset_digital_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_title AS asset_asset_title
FROM projects a
  JOIN projects_assets j ON j.project_id = a.id
  JOIN digital_assets b ON b.digital_asset_id = j.digital_asset_id;
```

| id | project_id | project_title | asset_digital_asset_id | asset_asset_identifier | asset_asset_title |
|---|---|---|---|---|---|
| 1000 | 1437597 | Integrated Model A | 1 | ASS-2752 | Integrated Framework A |
| 1000 | 1437597 | Integrated Model A | 2 | ASS-2756 | Extended Protocol |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2 | ASS-2756 | Extended Protocol |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 3 | ASS-2760 | Pilot Programme |
| 1002 | 5006462 | Pilot Review | 3 | ASS-2760 | Pilot Programme |
| 1002 | 5006462 | Pilot Review | 4 | ASS-2764 | Baseline Standard D |
| 1003 | 10207143 | Baseline Initiative D | 4 | ASS-2764 | Baseline Standard D |
| 1003 | 10207143 | Baseline Initiative D | 1 | ASS-2752 | Integrated Framework A |

The view `v_project_digital_asset_detail` joins `projects` to `digital_assets` via the `project_id` foreign key, producing a detailed row that combines project metadata with asset metadata. Project `1000` (`Integrated Model A`, type `animation`) appears alongside asset `ASS-2752` (`Integrated Framework A`, status `draft`, format `pilot-file-44`). This view answers: "What assets are associated with each project, and what are their properties?"

**View `v_project_software_tool_detail`**

```sql
CREATE VIEW v_project_software_tool_detail AS
SELECT a.id, a.project_id, a.project_title, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name, b.version AS tool_version
FROM projects a
  JOIN projects_tools j ON j.project_id = a.id
  JOIN software_tools b ON b.tool_id = j.tool_id;
```

| id | project_id | project_title | tool_tool_id | tool_tool_name | tool_version |
|---|---|---|---|---|---|
| 1000 | 1437597 | Integrated Model A | comi | Composite Model | seasonal-version-71 |
| 1000 | 1437597 | Integrated Model A | 195360 | Compact Cluster A | regional-version-72 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 195360 | Compact Cluster A | regional-version-72 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 3355763 | Legacy Review | legacy-version-73 |
| 1002 | 5006462 | Pilot Review | 3355763 | Legacy Review | legacy-version-73 |
| 1002 | 5006462 | Pilot Review | 8387539 | Regional Initiative | compact-version-74 |
| 1003 | 10207143 | Baseline Initiative D | 8387539 | Regional Initiative | compact-version-74 |
| 1003 | 10207143 | Baseline Initiative D | comi | Composite Model | seasonal-version-71 |

The view `v_project_software_tool_detail` joins `projects` to `software_tools` through the `projects_tools` junction table, revealing which tools are used in which projects. Project `1000` (`Integrated Model A`) is associated with tool `comi` (`Composite Model`, category `3d_modeling`). This view answers: "Which software tools are used in each project?"

**View `v_project_external_resource`**

```sql
CREATE VIEW v_project_external_resource AS
SELECT a.id, a.project_id, a.project_title, a.start_date, b.resource_id AS resource_resource_id, b.resource_title AS resource_resource_title, b.source_url AS resource_source_url
FROM projects a JOIN external_resources b ON a.resource_id = b.resource_id;
```

| id | project_id | project_title | start_date | resource_resource_id | resource_resource_title | resource_source_url |
|---|---|---|---|---|---|---|
| 1000 | 1437597 | Integrated Model A | 2022-09-05 | 1167 | Baseline Series D | https://bugs.launchpad.net/keystone/+bug/1432191 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16 | 2106708 | Distributed Assessment | https://ecocyc.org/gene?orgid=ECOLI&id=EG10355 |
| 1002 | 5006462 | Pilot Review | 2024-07-27 | 4180945 | Adaptive Survey | https://bugs.launchpad.net/neutron/+bug/1184696 |
| 1003 | 10207143 | Baseline Initiative D | 2025-12-11 | 10238270 | Primary Corridor A | http://twitter.com/gagnonsheila/status/475411638917791744 |

The view `v_project_external_resource` joins `projects` to `external_resources` on `resource_id`, surfacing the external resources linked to each project. Project `1000` (`Integrated Model A`) is linked to resource `1167` (`Baseline Series D`, type `texture`, licensed under `baseline-license-43`, sourced from a Launchpad bug tracker). This view answers: "What external resources are associated with each project?"

**View `v_software_tool_project_detail`**

```sql
CREATE VIEW v_software_tool_project_detail AS
SELECT a.tool_id, a.tool_name, a.version, b.id AS project_id, b.project_id AS project_project_id, b.project_title AS project_project_title
FROM software_tools a
  JOIN tools_projects j ON j.tool_id = a.tool_id
  JOIN projects b ON b.id = j.project_id;
```

| tool_id | tool_name | version | project_id | project_project_id | project_project_title |
|---|---|---|---|---|---|
| comi | Composite Model | seasonal-version-71 | 1000 | 1437597 | Integrated Model A |
| comi | Composite Model | seasonal-version-71 | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster |
| 195360 | Compact Cluster A | regional-version-72 | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster |
| 195360 | Compact Cluster A | regional-version-72 | 1002 | 5006462 | Pilot Review |
| 3355763 | Legacy Review | legacy-version-73 | 1002 | 5006462 | Pilot Review |
| 3355763 | Legacy Review | legacy-version-73 | 1003 | 10207143 | Baseline Initiative D |
| 8387539 | Regional Initiative | compact-version-74 | 1003 | 10207143 | Baseline Initiative D |
| 8387539 | Regional Initiative | compact-version-74 | 1000 | 1437597 | Integrated Model A |

The view `v_software_tool_project_detail` joins `software_tools` to `projects` through the `tools_projects` junction table, providing a tool-centric view of project associations. Tool `comi` (`Composite Model`, vendor `Feedback Ratings`) is associated with project `1000` (`Integrated Model A`, type `animation`). This view answers: "Which projects use each software tool?"

**View `v_software_tool_digital_asset`**

```sql
CREATE VIEW v_software_tool_digital_asset AS
SELECT a.tool_id, a.tool_name, a.version, a.tool_category, b.digital_asset_id AS asset_digital_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_title AS asset_asset_title
FROM software_tools a JOIN digital_assets b ON a.digital_asset_id = b.digital_asset_id;
```

| tool_id | tool_name | version | tool_category | asset_digital_asset_id | asset_asset_identifier | asset_asset_title |
|---|---|---|---|---|---|---|
| comi | Composite Model | seasonal-version-71 | 3d_modeling | 1 | ASS-2752 | Integrated Framework A |
| 195360 | Compact Cluster A | regional-version-72 | animation | 2 | ASS-2756 | Extended Protocol |
| 3355763 | Legacy Review | legacy-version-73 | audio_production | 3 | ASS-2760 | Pilot Programme |
| 8387539 | Regional Initiative | compact-version-74 | video_editing | 4 | ASS-2764 | Baseline Standard D |

The view `v_software_tool_digital_asset` joins `software_tools` to `digital_assets` on `digital_asset_id`, revealing which assets are produced by which tools. Tool `comi` (`Composite Model`) is associated with asset `ASS-2752` (`Integrated Framework A`, status `draft`). This view answers: "Which digital assets are produced by each software tool?"

**View `v_external_resource_project`**

```sql
CREATE VIEW v_external_resource_project AS
SELECT a.resource_id, a.resource_title, a.source_url, a.resource_type, b.id AS project_id, b.project_id AS project_project_id, b.project_title AS project_project_title
FROM external_resources a JOIN projects b ON a.project_id = b.id;
```

| resource_id | resource_title | source_url | resource_type | project_id | project_project_id | project_project_title |
|---|---|---|---|---|---|---|
| 1167 | Baseline Series D | https://bugs.launchpad.net/keystone/+bug/1432191 | texture | 1000 | 1437597 | Integrated Model A |
| 2106708 | Distributed Assessment | https://ecocyc.org/gene?orgid=ECOLI&id=EG10355 | sound_clip | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster |
| 4180945 | Adaptive Survey | https://bugs.launchpad.net/neutron/+bug/1184696 | pre_rigged_model | 1002 | 5006462 | Pilot Review |
| 10238270 | Primary Corridor A | http://twitter.com/gagnonsheila/status/475411638917791744 | reference_video | 1003 | 10207143 | Baseline Initiative D |

The view `v_external_resource_project` joins `external_resources` to `projects` on `project_id`, providing a resource-centric view of project associations. Resource `1167` (`Baseline Series D`, type `texture`) is linked to project `1000` (`Integrated Model A`, type `animation`). This view answers: "Which projects are associated with each external resource?"

**View `v_external_resource_digital_asset`**

```sql
CREATE VIEW v_external_resource_digital_asset AS
SELECT a.resource_id, a.resource_title, a.source_url, a.resource_type, b.digital_asset_id AS asset_digital_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_title AS asset_asset_title
FROM external_resources a JOIN digital_assets b ON a.digital_asset_id = b.digital_asset_id;
```

| resource_id | resource_title | source_url | resource_type | asset_digital_asset_id | asset_asset_identifier | asset_asset_title |
|---|---|---|---|---|---|---|
| 1167 | Baseline Series D | https://bugs.launchpad.net/keystone/+bug/1432191 | texture | 1 | ASS-2752 | Integrated Framework A |
| 2106708 | Distributed Assessment | https://ecocyc.org/gene?orgid=ECOLI&id=EG10355 | sound_clip | 2 | ASS-2756 | Extended Protocol |
| 4180945 | Adaptive Survey | https://bugs.launchpad.net/neutron/+bug/1184696 | pre_rigged_model | 3 | ASS-2760 | Pilot Programme |
| 10238270 | Primary Corridor A | http://twitter.com/gagnonsheila/status/475411638917791744 | reference_video | 4 | ASS-2764 | Baseline Standard D |

The view `v_external_resource_digital_asset` joins `external_resources` to `digital_assets` on `digital_asset_id`, revealing which assets are enriched by which external resources. Resource `1167` (`Baseline Series D`, type `texture`) is linked to asset `ASS-2752` (`Integrated Framework A`, status `draft`). This view answers: "Which digital assets are enriched by each external resource?"

**View `v_animation_sequence_project`**

```sql
CREATE VIEW v_animation_sequence_project AS
SELECT a.id, a.sequence_id, a.sequence_name, a.duration_seconds, b.id AS project_id, b.project_id AS project_project_id, b.project_title AS project_project_title
FROM animation_sequences a JOIN projects b ON a.project_id = b.id;
```

| id | sequence_id | sequence_name | duration_seconds | project_id | project_project_id | project_project_title |
|---|---|---|---|---|---|---|
| 1000 | 1437593 | Primary Review A | 7.45 | 1000 | 1437597 | Integrated Model A |
| 1001 | c6ac3b76-9bac-11eb-a8a2-19ed5c03f8d3 | Composite Initiative | 9.90 | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster |
| 1002 | 1152668 | Compact Model | 12.35 | 1002 | 5006462 | Pilot Review |
| 1003 | 19526306 | Legacy Cluster D | 14.80 | 1003 | 10207143 | Baseline Initiative D |

The view `v_animation_sequence_project` joins `animation_sequences` to `projects` on `project_id`, surfacing the project context for each animation sequence. Sequence `1000` (`Primary Review A`, type `walk`, 7.45 seconds, 5 frames) belongs to project `1000` (`Integrated Model A`, type `animation`). This view answers: "Which project does each animation sequence belong to?"

**View `v_animation_sequence_digital_asset`**

```sql
CREATE VIEW v_animation_sequence_digital_asset AS
SELECT a.id, a.sequence_id, a.sequence_name, a.duration_seconds, b.digital_asset_id AS asset_digital_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_title AS asset_asset_title
FROM animation_sequences a JOIN digital_assets b ON a.digital_asset_id = b.digital_asset_id;
```

| id | sequence_id | sequence_name | duration_seconds | asset_digital_asset_id | asset_asset_identifier | asset_asset_title |
|---|---|---|---|---|---|---|
| 1000 | 1437593 | Primary Review A | 7.45 | 1 | ASS-2752 | Integrated Framework A |
| 1001 | c6ac3b76-9bac-11eb-a8a2-19ed5c03f8d3 | Composite Initiative | 9.90 | 2 | ASS-2756 | Extended Protocol |
| 1002 | 1152668 | Compact Model | 12.35 | 3 | ASS-2760 | Pilot Programme |
| 1003 | 19526306 | Legacy Cluster D | 14.80 | 4 | ASS-2764 | Baseline Standard D |

The view `v_animation_sequence_digital_asset` joins `animation_sequences` to `digital_assets` on `digital_asset_id`, revealing which assets contain which animation sequences. Sequence `1000` (`Primary Review A`, type `walk`) is associated with asset `ASS-2752` (`Integrated Framework A`, status `draft`). This view answers: "Which digital assets contain which animation sequences?"

### Synthesis

The schema models a production pipeline where digital assets are the central artefacts, projects are the organisational containers, software tools are the authoring instruments, external resources are the enrichment sources, and animation sequences are the temporal choreographies. The base tables enforce referential integrity through foreign keys: `digital_assets.tool_id` → `software_tools.tool_id`, `digital_assets.project_id` → `projects.id`, `software_tools.digital_asset_id` → `digital_assets.digital_asset_id`, `external_resources.project_id` → `projects.id`, `external_resources.digital_asset_id` → `digital_assets.digital_asset_id`, and `animation_sequences.project_id` → `projects.id`. The junction tables `projects_assets`, `projects_tools`, and `tools_projects` resolve many-to-many relationships, while self-referential columns (`exported_to_digital_asset_id` in `digital_assets`, `uses_rig_digital_asset_id` in `animation_sequences`) model intra-domain dependencies. The twelve views reassemble these normalised facts into domain-meaningful joins, each answering a specific analytical question about the relationships between assets, projects, tools, resources, and sequences.