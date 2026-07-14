## Digital Production Record Systems

Modern digital production pipelines generate structured records across multiple interrelated domains: asset creation, project management, software tooling, external resource acquisition, and animation sequencing. Each production event is captured as a discrete record, linked to others through foreign-key relationships that trace the lineage of a digital asset from its initial draft through rendering, publication, and archival. The following reference describes the core tables and derived views that constitute the production record system, using representative values drawn from active production data.

**Table `digital_assets`**

| digital_asset_id | asset_identifier | asset_title | creation_date | file_format | duration_seconds | frame_count | status | tool_id | project_id | exported_to_digital_asset_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Integrated Framework A | 2022-01-13T12:24:00 | pilot-file-44 | 7.45 | 5 | draft | comi | 1000 | 1 |
| 2 | ASS-2756 | Extended Protocol | 2023-06-24T19:41:00 | extended-file-45 | 9.90 | 3 | rendered | 195360 | 1001 | 2 |
| 3 | ASS-2760 | Pilot Programme | 2024-11-08T02:58:00 | integrated-file-46 | 12.35 | 9 | published | 3355763 | 1002 | 3 |
| 4 | ASS-2764 | Baseline Standard D | 2025-04-19T09:15:00 | seasonal-file-47 | 14.80 | 6 | archived | 8387539 | 1003 | 4 |

The `digital_assets` table forms the central registry of all produced media. Each row represents a single asset with a unique `digital_asset_id`, an `asset_identifier` such as `ASS-2752` or `ASS-2764`, and a human-readable `asset_title` like "Integrated Framework A" or "Baseline Standard D." Assets carry a `creation_date` timestamp, a `file_format` designation (e.g., `pilot-file-44`, `extended-file-45`), and quantitative metadata including `duration_seconds` and `frame_count`. The `status` column tracks the asset's lifecycle stage—`draft`, `rendered`, `published`, or `archived`—while `tool_id` and `project_id` link the asset to the software tool and project that produced it. The `exported_to_digital_asset_id` column enables self-referencing, allowing an asset to record that it was exported from another asset in the system, as seen when asset `1` references itself as its export source.

**Table `projects`**

| id | project_id | project_title | start_date | end_date | project_type | description | resource_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1437597 | Integrated Model A | 2022-09-05 | 2022-09-01 | animation | Extended Survey | 1167 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Extended Cluster | 2023-02-16 | 2023-02-12 | modeling | Pilot Corridor A | 2106708 |
| 1002 | 5006462 | Pilot Review | 2024-07-27 | 2024-07-23 | rigging | Baseline Series | 4180945 |
| 1003 | 10207143 | Baseline Initiative D | 2025-12-11 | 2025-12-07 | music | Distributed Assessment | 10238270 |

Projects serve as the organizational container for all production activity. The `projects` table stores each project under a numeric or UUID-based `project_id`, a `project_title` such as "Integrated Model A" or "Extended Cluster," and temporal boundaries defined by `start_date` and `end_date`. The `project_type` field categorizes the work—`animation`, `modeling`, `rigging`, or `music`—while the `description` column provides a brief narrative label like "Extended Survey" or "Pilot Corridor A." Each project references an `external_resource` via `resource_id`, establishing a direct dependency on external content. Notably, project end dates precede start dates in the sample data, reflecting a scheduling convention where the end date encodes a deadline or milestone rather than a chronological completion.

**Table `software_tools`**

| tool_id | tool_name | version | tool_category | vendor | digital_asset_id |
|---|---|---|---|---|---|
| comi | Composite Model | seasonal-version-71 | 3d_modeling | Feedback Ratings | 1 |
| 195360 | Compact Cluster A | regional-version-72 | animation | Abbott Laboratories | 2 |
| 3355763 | Legacy Review | legacy-version-73 | audio_production | American Express | 3 |
| 8387539 | Regional Initiative | compact-version-74 | video_editing | Whatsapp Inc. | 4 |

The `software_tools` table catalogs the applications used to create and manipulate digital assets. Each tool record carries a `tool_id` (ranging from short strings like `comi` to numeric identifiers like `8387539`), a `tool_name` such as "Composite Model" or "Regional Initiative," and a `version` string that follows a pattern like `seasonal-version-71` or `legacy-version-73`. The `tool_category` classifies the tool's primary function—`3d_modeling`, `animation`, `audio_production`, or `video_editing`—and the `vendor` field names the software provider, including entries like "Feedback Ratings," "Abbott Laboratories," and "American Express." The `digital_asset_id` column creates a one-to-one linkage between a tool and the asset it produced, meaning each asset in `digital_assets` is associated with exactly one software tool.

**Table `external_resources`**

| resource_id | resource_title | source_url | resource_type | license | project_id | digital_asset_id |
|---|---|---|---|---|---|---|
| 1167 | Baseline Series D | https://bugs.launchpad.net/keystone/+bug/1432191 | texture | baseline-license-43 | 1000 | 1 |
| 2106708 | Distributed Assessment | https://ecocyc.org/gene?orgid=ECOLI&id=EG10355 | sound_clip | pilot-license-44 | 1001 | 2 |
| 4180945 | Adaptive Survey | https://bugs.launchpad.net/neutron/+bug/1184696 | pre_rigged_model | extended-license-45 | 1002 | 3 |
| 10238270 | Primary Corridor A | http://twitter.com/gagnonsheila/status/475411638917791744 | reference_video | integrated-license-46 | 1003 | 4 |

External resources represent content acquired from outside the production environment. The `external_resources` table records each resource with a `resource_id`, a `resource_title` such as "Baseline Series D" or "Primary Corridor A," and a `source_url` pointing to the origin location. The `resource_type` field distinguishes between `texture`, `sound_clip`, `pre_rigged_model`, and `reference_video`, while the `license` column documents the usage terms (e.g., `baseline-license-43`, `pilot-license-44`). Each external resource is linked to a `project_id` and a `digital_asset_id`, indicating which project consumed the resource and which asset it was applied to. This dual linkage ensures traceability from external content back through the project to the final asset.

**Table `animation_sequences`**

| id | sequence_id | sequence_name | duration_seconds | frame_count | animation_type | keyframe_count | project_id | digital_asset_id | uses_rig_digital_asset_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1437593 | Primary Review A | 7.45 | 5 | walk | 4 | 1000 | 1 | 1 |
| 1001 | c6ac3b76-9bac-11eb-a8a2-19ed5c03f8d3 | Composite Initiative | 9.90 | 3 | heavy_walk | 5 | 1001 | 2 | 2 |
| 1002 | 1152668 | Compact Model | 12.35 | 9 | dance | 5 | 1002 | 3 | 3 |
| 1003 | 19526306 | Legacy Cluster D | 14.80 | 6 | breakout | 0 | 1003 | 4 | 4 |

Animation sequences capture the motion data generated during production. The `animation_sequences` table stores each sequence under a numeric or UUID `id`, a `sequence_id`, and a `sequence_name` such as "Primary Review A" or "Legacy Cluster D." The `duration_seconds` and `frame_count` fields mirror the quantitative metadata found in `digital_assets`, while `animation_type` classifies the motion as `walk`, `heavy_walk`, `dance`, or `breakout`. The `keyframe_count` records the number of keyframes defining the animation, ranging from `0` for the sequence "Legacy Cluster D" to `5` for "Compact Model." Each sequence is associated with a `project_id` and a `digital_asset_id`, and the `uses_rig_digital_asset_id` column creates a self-referencing link to the rig asset that the animation depends on.

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

The `projects_assets` table resolves the many-to-many relationship between projects and digital assets. A single project may consume multiple assets, and a single asset may contribute to multiple projects. In the sample data, project `1000` ("Integrated Model A") references assets `1` and `2`, while project `1003` ("Baseline Initiative D") references assets `4` and `1`. This junction table enables flexible asset reuse across projects without duplicating asset records.

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

The `projects_tools` table records which software tools were employed within each project. This relationship allows a project to be associated with multiple tools across its lifecycle, and a single tool to be used across multiple projects. The table structure mirrors `projects_assets`, serving as a junction between the `projects` and `software_tools` domains.

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

The `tools_projects` table provides an alternative perspective on the tool-to-project relationship, potentially capturing different metadata or serving as a redundant linkage for query optimization. Like `projects_tools`, it establishes the many-to-many association between software tools and projects, ensuring that tool usage can be traced from either direction.

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

The view `v_digital_asset_software_tool` joins `digital_assets` with `software_tools` to answer the question: which software tool produced each digital asset? For asset `ASS-2752` ("Integrated Framework A"), the view reveals that it was created with "Composite Model" (tool category `3d_modeling`, vendor "Feedback Ratings"). For asset `ASS-2760` ("Pilot Programme"), the producing tool is "Legacy Review," categorized under `audio_production` and provided by "American Express." This view consolidates asset metadata with tool provenance in a single row, enabling production audits that trace any asset back to the application and version used to create it.

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

The view `v_digital_asset_project` joins `digital_assets` with `projects` to answer: which project did each digital asset belong to? Asset `ASS-2752` ("Integrated Framework A") is linked to project `1437597` ("Integrated Model A"), an `animation`-type project that ran from 2022-09-05 to 2022-09-01. Asset `ASS-2764` ("Baseline Standard D") connects to project `10207143` ("Baseline Initiative D"), categorized as `music` with the description "Distributed Assessment." This view provides a direct mapping from asset to project, useful for cost allocation and project-level asset inventories.

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

The view `v_digital_asset_digital_asset` performs a self-join on `digital_assets` to answer: which asset was exported from which other asset? In the sample data, asset `ASS-2752` references itself as its export source (`exported_to_digital_asset_id = 1`), indicating a self-export or a baseline-to-derivative relationship within the same asset. This view is essential for tracking asset lineage and derivative chains, allowing producers to reconstruct the full ancestry of any given asset.

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

The view `v_project_digital_asset_detail` joins `projects` with `digital_assets` through `projects_assets` to answer: which digital assets are associated with each project, with full asset metadata? Project `1000` ("Integrated Model A") appears with both asset `1` ("Integrated Framework A", status `draft`, format `pilot-file-44`) and asset `2` ("Extended Protocol", status `rendered`, format `extended-file-45`). Project `1002` ("Pilot Review") is associated with asset `3` ("Pilot Programme", status `published`) and asset `4` ("Baseline Standard D", status `archived"). This view provides a project-centric asset inventory, showing not just which assets belong to a project but their full production state.

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

The view `v_project_software_tool_detail` joins `projects` with `software_tools` through `projects_tools` to answer: which software tools were used in each project? This view enables project-level tool audits, showing which applications and versions were deployed during production. For example, a project might appear with multiple tool rows, each specifying the tool name, version, category, and vendor, allowing managers to assess tool diversity and licensing compliance.

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

The view `v_project_external_resource` joins `projects` with `external_resources` to answer: which external resources were consumed by each project? Project `1000` ("Integrated Model A") is linked to resource `1167` ("Baseline Series D", type `texture`, license `baseline-license-43`, sourced from a Launchpad bug tracker URL). Project `1001` ("Extended Cluster") references resource `2106708` ("Distributed Assessment", type `sound_clip`, license `pilot-license-44`, sourced from an EcoCyc gene database URL). This view supports resource tracking, license compliance, and cost accounting for externally acquired content.

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

The view `v_software_tool_project_detail` joins `software_tools` with `projects` through `tools_projects` to answer: which projects used each software tool? This is the inverse of `v_project_software_tool_detail` and serves tool-centric analysis. For instance, the tool "Compact Cluster A" (category `animation`, vendor "Abbott Laboratories") may appear with multiple project rows, showing the breadth of its deployment across the production portfolio. This view is valuable for vendor management, tool adoption analysis, and license utilization reporting.

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

The view `v_software_tool_digital_asset` joins `software_tools` with `digital_assets` to answer: which digital assets were created with each software tool? Since `software_tools` already contains a `digital_asset_id` foreign key, this view may add project context or additional tool metadata. For tool "Composite Model" (category `3d_modeling`), the view would show asset `ASS-2752` ("Integrated Framework A"), providing a tool-centric asset registry that complements the asset-centric view in `v_digital_asset_software_tool`.

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

The view `v_external_resource_project` joins `external_resources` with `projects` to answer: which projects consumed each external resource? Resource `1167` ("Baseline Series D", type `texture`) is linked to project `1000` ("Integrated Model A"), while resource `10238270` ("Primary Corridor A", type `reference_video`) is linked to project `1003` ("Baseline Initiative D"). This view supports resource utilization analysis, showing which external content is most heavily used and by which projects.

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

The view `v_external_resource_digital_asset` joins `external_resources` with `digital_assets` to answer: which digital assets incorporated each external resource? Resource `1167` ("Baseline Series D") is associated with digital asset `1` ("Integrated Framework A"), and resource `2106708` ("Distributed Assessment") is associated with digital asset `2` ("Extended Protocol"). This view traces the flow of external content into specific assets, enabling quality audits and license compliance checks at the asset level.

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

The view `v_animation_sequence_project` joins `animation_sequences` with `projects` to answer: which animation sequences belong to each project? Sequence `1437593` ("Primary Review A", type `walk`, 7.45 seconds, 5 frames) is linked to project `1000` ("Integrated Model A"). Sequence `1152668` ("Compact Model", type `dance`, 12.35 seconds, 9 frames) is linked to project `1002` ("Pilot Review"). This view provides a project-centric animation inventory, showing the motion content produced for each project.

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

The view `v_animation_sequence_digital_asset` joins `animation_sequences` with `digital_assets` to answer: which animation sequences are associated with each digital asset? Sequence `1437593` ("Primary Review A") is linked to digital asset `1` ("Integrated Framework A"), and sequence `19526306` ("Legacy Cluster D", type `breakout`, 0 keyframes) is linked to digital asset `4` ("Baseline Standard D"). The `uses_rig_digital_asset_id` column in the underlying data indicates that each sequence depends on a specific rig asset, creating a dependency chain from animation to rig to the rig's source asset. This view is essential for animation pipeline debugging and rig utilization analysis.

The production record system described above provides a comprehensive framework for tracking digital assets, projects, tools, external resources, and animation sequences through their full lifecycle. The base tables capture the core entities and their direct relationships, while the derived views answer common analytical questions by joining these entities in domain-relevant combinations. Together, they enable production managers to trace asset lineage, audit tool usage, verify resource licenses, and inventory animation content—all from a single, consistent data model.