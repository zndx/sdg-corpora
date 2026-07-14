In a modern animation production pipeline, every creative decision leaves a traceable footprint: which software rendered a frame, which asset was rigged, which audio track accompanied the final cut. The relational model described here captures that provenance by normalising seven entity types into base tables and then projecting them through sixteen denormalised views that answer concrete production questions. Each table stores a single entity type with its attributes as columns; foreign-key columns encode one-to-many or many-to-one relationships; and the views rejoin those columns so that a single row reconstructs a domain fact — for example, "which software tool was used to produce the audio track for project PRO-2058?"

## The base tables

The model centres on `animation_projects`, the hub entity that ties every other resource to a specific production. Its primary key is `animation_project_id`, an integer surrogate, while the natural business key lives in `project_identifier` (values such as `PRO-2058`, `PRO-2059`, `PRO-2060`, `PRO-2061`). The column `project_title` carries human-readable names like *Integrated Model A* and *Extended Cluster*. Temporal and technical metadata follow: `creation_date` is a timestamp (`2022-01-13T12:24:00` for the first row), `total_frames` counts rendered frames (11, 29, 9, 3), `render_resolution` stores a categorical label (`regional-render-18`, `legacy-render-19`, `compact-render-20`, `composite-render-21`), and two boolean flags — `is_rigged` and `has_green_screen` — record production state. Four foreign-key columns (`software_tool_id`, `digital_asset_id`, `audio_track_id`, `video_file_id`) each point to exactly one row in their respective tables, enforcing a many-to-one relationship from the project side.

**Table `animation_projects`**

| animation_project_id | project_identifier | project_title | creation_date | total_frames | render_resolution | is_rigged | has_green_screen | software_tool_id | digital_asset_id | audio_track_id | video_file_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-01-13T12:24:00 | 11 | regional-render-18 | true | true | 1000 | 1 | 1000 | 1 |
| 2 | PRO-2059 | Extended Cluster | 2023-06-24T19:41:00 | 29 | legacy-render-19 | false | false | 1001 | 2 | 1001 | 2 |
| 3 | PRO-2060 | Pilot Review | 2024-11-08T02:58:00 | 9 | compact-render-20 | true | true | 1002 | 3 | 1002 | 3 |
| 4 | PRO-2061 | Baseline Initiative D | 2025-04-19T09:15:00 | 3 | composite-render-21 | false | false | 1003 | 4 | 1003 | 4 |

The `digital_assets` table stores the 3D resources consumed by projects. Its surrogate key is `id`, and the natural identifier is `asset_identifier` (`ASS-2752`, `ASS-2756`, `ASS-2760`, `ASS-2764`). The `asset_name` column holds names such as *Pilot Programme* and *Baseline Standard*, while `asset_type` classifies the asset as `Model`, `Texture`, `Environment`, or `Character`. Polygon counts (`10`, `11`, `15`, `6`) and a boolean `is_rigged` flag describe geometry and rigging state. `source_origin` records provenance as `Created` or `Downloaded`. Two foreign keys — `animation_project_id` and `rigging_system_id` — link the asset to its parent project and to the rig that animates it. Timestamps `created_at` and `updated_at` track the asset lifecycle.

**Table `digital_assets`**

| id | asset_identifier | asset_name | asset_type | polygon_count | is_rigged | source_origin | animation_project_id | rigging_system_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | Model | 10 | true | Created | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ASS-2756 | Baseline Standard | Texture | 11 | false | Downloaded | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ASS-2760 | Distributed Framework A | Environment | 15 | true | Created | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ASS-2764 | Adaptive Protocol | Character | 6 | false | Downloaded | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Rigging systems live in `rigging_systems`. The primary key `id` is a surrogate; `rig_identifier` (`RIG-2762`, `RIG-2763`, `RIG-2764`, `RIG-2765`) is the business key. `rig_type` takes values `IK`, `FK`, and `Blendshape`. `joint_count` records the number of joints in the skeleton (0, 14, 6, 9), while `has_controls` and `is_constrained` are boolean flags describing the rig's capabilities. The foreign key `digital_asset_id` ties each rig to exactly one asset, and `animation_control_id` points to the control that drives it.

**Table `rigging_systems`**

| id | rig_identifier | rig_type | joint_count | has_controls | is_constrained | digital_asset_id | animation_control_id |
|---|---|---|---|---|---|---|---|
| 1000 | RIG-2762 | IK | 0 | true | false | 1 | 1 |
| 1001 | RIG-2763 | FK | 14 | false | true | 2 | 2 |
| 1002 | RIG-2764 | Blendshape | 6 | true | false | 3 | 3 |
| 1003 | RIG-2765 | IK | 9 | false | true | 4 | 4 |

`animation_controls` captures the interactive handles attached to rigs. Its surrogate key is `id`; `control_identifier` (`CON-2399`, `CON-2404`, `CON-2409`, `CON-2414`) is the natural key. `control_name` carries descriptive labels (*Adaptive Assessment*, *Primary Survey*, *Composite Corridor D*, *Compact Series*), and `control_type` classifies the control as `IK Handle`, `Joint`, `Constraint`, or `Button`. The boolean `is_constrained` records whether the control is locked. Foreign keys `rigging_system_id` and `digital_asset_id` link the control to its parent rig and, transitively, to the asset. Timestamps `created_at` and `updated_at` mirror the asset table's audit columns.

**Table `animation_controls`**

| id | control_identifier | control_name | control_type | is_constrained | rigging_system_id | digital_asset_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | CON-2399 | Adaptive Assessment | IK Handle | false | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | CON-2404 | Primary Survey | Joint | true | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | CON-2409 | Composite Corridor D | Constraint | false | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | CON-2414 | Compact Series | Button | true | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Audio production is modelled in `audio_tracks`. The surrogate key `id` is used; `track_identifier` (`TRA-2455`, `TRA-2459`, `TRA-2463`, `TRA-2467`) is the business key. `track_title` stores names such as *Legacy Cluster D* and *Regional Review*. `file_format` takes values `OGG` or `TAK`. The boolean `is_original` flags whether the track is the original recording. `duration_seconds` records length (7.45, 9.90, 12.35, 14.80). Foreign keys `animation_project_id` and `software_tool_id` link the track to its project and to the tool that produced it. The `created_at` timestamp provides an audit trail.

**Table `audio_tracks`**

| id | track_identifier | track_title | file_format | is_original | duration_seconds | animation_project_id | software_tool_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | TRA-2455 | Legacy Cluster D | OGG | false | 7.45 | 1 | 1000 | 2025-01-01 00:14:00 |
| 1001 | TRA-2459 | Regional Review | TAK | true | 9.90 | 2 | 1001 | 2025-02-06 03:14:00 |
| 1002 | TRA-2463 | Seasonal Initiative | OGG | false | 12.35 | 3 | 1002 | 2025-03-11 06:14:00 |
| 1003 | TRA-2467 | Integrated Model A | TAK | true | 14.80 | 4 | 1003 | 2025-04-16 09:14:00 |

`software_tools` catalogues the production software. Its surrogate key is `software_tool_id`; `tool_identifier` (`TOO-2075`, `TOO-2078`, `TOO-2081`, `TOO-2084`) is the natural key. `tool_name` carries names like *Composite Model* and *Compact Cluster A*. `tool_category` classifies the tool as `3D Modeling`, `Animation`, `Audio Editing`, or `Video Editing`. The `version` column stores a categorical label (`seasonal-version-71`, `regional-version-72`, `legacy-version-73`, `compact-version-74`). Foreign keys `animation_project_id` and `audio_track_id` link the tool to the project and to the audio track it produced.

**Table `software_tools`**

| software_tool_id | tool_identifier | tool_name | tool_category | version | animation_project_id | audio_track_id |
|---|---|---|---|---|---|---|
| 1000 | TOO-2075 | Composite Model | 3D Modeling | seasonal-version-71 | 1 | 1000 |
| 1001 | TOO-2078 | Compact Cluster A | Animation | regional-version-72 | 2 | 1001 |
| 1002 | TOO-2081 | Legacy Review | Audio Editing | legacy-version-73 | 3 | 1002 |
| 1003 | TOO-2084 | Regional Initiative | Video Editing | compact-version-74 | 4 | 1003 |

`video_files` completes the set of base tables. Although the full column list is not shown here, the table is linked from `animation_projects` via the foreign key `video_file_id`, and it participates in two views (`vw_video_file_animation_project` and `vw_video_file_software_tool`) that join it back to the project and to the software tool, respectively.

## Foreign-key topology and cardinality

The foreign-key graph forms a star centred on `animation_projects`. Each project row holds four FK columns (`software_tool_id`, `digital_asset_id`, `audio_track_id`, `video_file_id`), each pointing to a single row in the target table. This is a many-to-one relationship from the project's perspective: many projects could theoretically reference the same tool, asset, track, or video, but the schema enforces that each project references at most one row per target.

The `digital_assets` table introduces a second star. Its FK `animation_project_id` points back to `animation_projects`, creating a bidirectional link: a project owns assets, and an asset belongs to a project. The FK `rigging_system_id` points to `rigging_systems`, establishing that each asset has at most one rig.

`rigging_systems` holds FK `digital_asset_id` (pointing to `digital_assets`) and FK `animation_control_id` (pointing to `animation_controls`). This means a rig is attached to exactly one asset and driven by exactly one control.

`animation_controls` holds FK `rigging_system_id` and FK `digital_asset_id`, creating a symmetric link back to both the rig and the asset. The presence of both FKs means the control table can be queried from either direction: "which rig does this control belong to?" or "which asset does this control animate?"

`audio_tracks` holds FK `animation_project_id` and FK `software_tool_id`, linking the track to its project and to the tool that produced it.

`software_tools` holds FK `animation_project_id` and FK `audio_track_id`, linking the tool to its project and to the audio track it produced.

The net effect is a tightly coupled graph where every entity type is reachable from every other through at most two hops. This topology is what the views materialise.

## Views: reconstructing domain facts

Each view is a `SELECT` that joins two base tables on their shared foreign key, producing a denormalised row that answers a single production question. The following sections interpret every view.

### Project-centric views

`vw_animation_project_software_tool` joins `animation_projects` to `software_tools` on `animation_projects.software_tool_id = software_tools.software_tool_id`. It answers: "Which software tool was used for each project?" A sample row reads: project `PRO-2058` (*Integrated Model A*) used tool `TOO-2075` (*Composite Model*, category `3D Modeling`, version `seasonal-version-71`).

**View `vw_animation_project_software_tool`**

```sql
CREATE VIEW vw_animation_project_software_tool AS
SELECT a.animation_project_id, a.project_identifier, a.project_title, a.creation_date, b.software_tool_id AS tool_software_tool_id, b.tool_identifier AS tool_tool_identifier, b.tool_name AS tool_tool_name
FROM animation_projects a JOIN software_tools b ON a.software_tool_id = b.software_tool_id;
```

| animation_project_id | project_identifier | project_title | creation_date | tool_software_tool_id | tool_tool_identifier | tool_tool_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-01-13T12:24:00 | 1000 | TOO-2075 | Composite Model |
| 2 | PRO-2059 | Extended Cluster | 2023-06-24T19:41:00 | 1001 | TOO-2078 | Compact Cluster A |
| 3 | PRO-2060 | Pilot Review | 2024-11-08T02:58:00 | 1002 | TOO-2081 | Legacy Review |
| 4 | PRO-2061 | Baseline Initiative D | 2025-04-19T09:15:00 | 1003 | TOO-2084 | Regional Initiative |

`vw_animation_project_digital_asset` joins `animation_projects` to `digital_assets` on `animation_projects.digital_asset_id = digital_assets.id`. It answers: "Which digital asset is associated with each project?" A sample row reads: project `PRO-2058` is linked to asset `ASS-2752` (*Pilot Programme*, type `Model`, 10 polygons, source `Created`).

**View `vw_animation_project_digital_asset`**

```sql
CREATE VIEW vw_animation_project_digital_asset AS
SELECT a.animation_project_id, a.project_identifier, a.project_title, a.creation_date, b.id AS asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM animation_projects a JOIN digital_assets b ON a.digital_asset_id = b.id;
```

| animation_project_id | project_identifier | project_title | creation_date | asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-01-13T12:24:00 | 1 | ASS-2752 | Pilot Programme |
| 2 | PRO-2059 | Extended Cluster | 2023-06-24T19:41:00 | 2 | ASS-2756 | Baseline Standard |
| 3 | PRO-2060 | Pilot Review | 2024-11-08T02:58:00 | 3 | ASS-2760 | Distributed Framework A |
| 4 | PRO-2061 | Baseline Initiative D | 2025-04-19T09:15:00 | 4 | ASS-2764 | Adaptive Protocol |

`vw_animation_project_audio_track` joins `animation_projects` to `audio_tracks` on `animation_projects.audio_track_id = audio_tracks.id`. It answers: "Which audio track accompanies each project?" A sample row reads: project `PRO-2058` uses track `TRA-2455` (*Legacy Cluster D*, format `OGG`, duration 7.45 s, not original).

**View `vw_animation_project_audio_track`**

```sql
CREATE VIEW vw_animation_project_audio_track AS
SELECT a.animation_project_id, a.project_identifier, a.project_title, a.creation_date, b.id AS track_id, b.track_identifier AS track_track_identifier, b.track_title AS track_track_title
FROM animation_projects a JOIN audio_tracks b ON a.audio_track_id = b.id;
```

| animation_project_id | project_identifier | project_title | creation_date | track_id | track_track_identifier | track_track_title |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-01-13T12:24:00 | 1000 | TRA-2455 | Legacy Cluster D |
| 2 | PRO-2059 | Extended Cluster | 2023-06-24T19:41:00 | 1001 | TRA-2459 | Regional Review |
| 3 | PRO-2060 | Pilot Review | 2024-11-08T02:58:00 | 1002 | TRA-2463 | Seasonal Initiative |
| 4 | PRO-2061 | Baseline Initiative D | 2025-04-19T09:15:00 | 1003 | TRA-2467 | Integrated Model A |

`vw_animation_project_video_file` joins `animation_projects` to `video_files` on `animation_projects.video_file_id = video_files.id`. It answers: "Which video file is the output of each project?" The join reconstructs the project's rendering target alongside the video file's metadata.

**View `vw_animation_project_video_file`**

```sql
CREATE VIEW vw_animation_project_video_file AS
SELECT a.animation_project_id, a.project_identifier, a.project_title, a.creation_date, b.id AS file_id, b.file_identifier AS file_file_identifier, b.file_name AS file_file_name
FROM animation_projects a JOIN video_files b ON a.video_file_id = b.id;
```

| animation_project_id | project_identifier | project_title | creation_date | file_id | file_file_identifier | file_file_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Integrated Model A | 2022-01-13T12:24:00 | 1 | FIL-2398 | Compact Standard |
| 2 | PRO-2059 | Extended Cluster | 2023-06-24T19:41:00 | 2 | FIL-2400 | Legacy Framework |
| 3 | PRO-2060 | Pilot Review | 2024-11-08T02:58:00 | 3 | FIL-2402 | Regional Protocol A |
| 4 | PRO-2061 | Baseline Initiative D | 2025-04-19T09:15:00 | 4 | FIL-2404 | Seasonal Programme |

### Asset-centric views

`vw_digital_asset_animation_project` joins `digital_assets` to `animation_projects` on `digital_assets.animation_project_id = animation_projects.animation_project_id`. It answers the inverse question: "Which project does this asset belong to?" A sample row reads: asset `ASS-2752` (*Pilot Programme*) belongs to project `PRO-2058` (*Integrated Model A*).

**View `vw_digital_asset_animation_project`**

```sql
CREATE VIEW vw_digital_asset_animation_project AS
SELECT a.id, a.asset_identifier, a.asset_name, a.asset_type, b.animation_project_id AS project_animation_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM digital_assets a JOIN animation_projects b ON a.animation_project_id = b.animation_project_id;
```

| id | asset_identifier | asset_name | asset_type | project_animation_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | Model | 1 | PRO-2058 | Integrated Model A |
| 2 | ASS-2756 | Baseline Standard | Texture | 2 | PRO-2059 | Extended Cluster |
| 3 | ASS-2760 | Distributed Framework A | Environment | 3 | PRO-2060 | Pilot Review |
| 4 | ASS-2764 | Adaptive Protocol | Character | 4 | PRO-2061 | Baseline Initiative D |

`vw_digital_asset_rigging_system` joins `digital_assets` to `rigging_systems` on `digital_assets.rigging_system_id = rigging_systems.id`. It answers: "Which rig animates this asset?" A sample row reads: asset `ASS-2752` is rigged by system `RIG-2762` (type `IK`, 0 joints, has controls, not constrained).

**View `vw_digital_asset_rigging_system`**

```sql
CREATE VIEW vw_digital_asset_rigging_system AS
SELECT a.id, a.asset_identifier, a.asset_name, a.asset_type, b.id AS system_id, b.rig_identifier AS system_rig_identifier, b.rig_type AS system_rig_type
FROM digital_assets a JOIN rigging_systems b ON a.rigging_system_id = b.id;
```

| id | asset_identifier | asset_name | asset_type | system_id | system_rig_identifier | system_rig_type |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | Model | 1000 | RIG-2762 | IK |
| 2 | ASS-2756 | Baseline Standard | Texture | 1001 | RIG-2763 | FK |
| 3 | ASS-2760 | Distributed Framework A | Environment | 1002 | RIG-2764 | Blendshape |
| 4 | ASS-2764 | Adaptive Protocol | Character | 1003 | RIG-2765 | IK |

### Rigging-centric views

`vw_rigging_system_digital_asset` joins `rigging_systems` to `digital_assets` on `rigging_systems.digital_asset_id = digital_assets.id`. It answers the inverse: "Which asset does this rig belong to?" A sample row reads: rig `RIG-2762` (type `IK`) belongs to asset `ASS-2752` (*Pilot Programme*).

**View `vw_rigging_system_digital_asset`**

```sql
CREATE VIEW vw_rigging_system_digital_asset AS
SELECT a.id, a.rig_identifier, a.rig_type, a.joint_count, b.id AS asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM rigging_systems a JOIN digital_assets b ON a.digital_asset_id = b.id;
```

| id | rig_identifier | rig_type | joint_count | asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|---|
| 1000 | RIG-2762 | IK | 0 | 1 | ASS-2752 | Pilot Programme |
| 1001 | RIG-2763 | FK | 14 | 2 | ASS-2756 | Baseline Standard |
| 1002 | RIG-2764 | Blendshape | 6 | 3 | ASS-2760 | Distributed Framework A |
| 1003 | RIG-2765 | IK | 9 | 4 | ASS-2764 | Adaptive Protocol |

`vw_rigging_system_animation_control` joins `rigging_systems` to `animation_controls` on `rigging_systems.animation_control_id = animation_controls.id`. It answers: "Which control drives this rig?" A sample row reads: rig `RIG-2762` is driven by control `CON-2399` (*Adaptive Assessment*, type `IK Handle`, not constrained).

**View `vw_rigging_system_animation_control`**

```sql
CREATE VIEW vw_rigging_system_animation_control AS
SELECT a.id, a.rig_identifier, a.rig_type, a.joint_count, b.id AS control_id, b.control_identifier AS control_control_identifier, b.control_name AS control_control_name
FROM rigging_systems a JOIN animation_controls b ON a.animation_control_id = b.id;
```

| id | rig_identifier | rig_type | joint_count | control_id | control_control_identifier | control_control_name |
|---|---|---|---|---|---|---|
| 1000 | RIG-2762 | IK | 0 | 1 | CON-2399 | Adaptive Assessment |
| 1001 | RIG-2763 | FK | 14 | 2 | CON-2404 | Primary Survey |
| 1002 | RIG-2764 | Blendshape | 6 | 3 | CON-2409 | Composite Corridor D |
| 1003 | RIG-2765 | IK | 9 | 4 | CON-2414 | Compact Series |

### Control-centric views

`vw_animation_control_rigging_system` joins `animation_controls` to `rigging_systems` on `animation_controls.rigging_system_id = rigging_systems.id`. It answers the inverse: "Which rig does this control belong to?" A sample row reads: control `CON-2399` (*Adaptive Assessment*) belongs to rig `RIG-2762` (type `IK`, 0 joints).

**View `vw_animation_control_rigging_system`**

```sql
CREATE VIEW vw_animation_control_rigging_system AS
SELECT a.id, a.control_identifier, a.control_name, a.control_type, b.id AS system_id, b.rig_identifier AS system_rig_identifier, b.rig_type AS system_rig_type
FROM animation_controls a JOIN rigging_systems b ON a.rigging_system_id = b.id;
```

| id | control_identifier | control_name | control_type | system_id | system_rig_identifier | system_rig_type |
|---|---|---|---|---|---|---|
| 1 | CON-2399 | Adaptive Assessment | IK Handle | 1000 | RIG-2762 | IK |
| 2 | CON-2404 | Primary Survey | Joint | 1001 | RIG-2763 | FK |
| 3 | CON-2409 | Composite Corridor D | Constraint | 1002 | RIG-2764 | Blendshape |
| 4 | CON-2414 | Compact Series | Button | 1003 | RIG-2765 | IK |

`vw_animation_control_digital_asset` joins `animation_controls` to `digital_assets` on `animation_controls.digital_asset_id = digital_assets.id`. It answers: "Which asset does this control animate?" A sample row reads: control `CON-2399` (*Adaptive Assessment*) animates asset `ASS-2752` (*Pilot Programme*, type `Model`).

**View `vw_animation_control_digital_asset`**

```sql
CREATE VIEW vw_animation_control_digital_asset AS
SELECT a.id, a.control_identifier, a.control_name, a.control_type, b.id AS asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM animation_controls a JOIN digital_assets b ON a.digital_asset_id = b.id;
```

| id | control_identifier | control_name | control_type | asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|---|
| 1 | CON-2399 | Adaptive Assessment | IK Handle | 1 | ASS-2752 | Pilot Programme |
| 2 | CON-2404 | Primary Survey | Joint | 2 | ASS-2756 | Baseline Standard |
| 3 | CON-2409 | Composite Corridor D | Constraint | 3 | ASS-2760 | Distributed Framework A |
| 4 | CON-2414 | Compact Series | Button | 4 | ASS-2764 | Adaptive Protocol |

### Audio-centric views

`vw_audio_track_animation_project` joins `audio_tracks` to `animation_projects` on `audio_tracks.animation_project_id = animation_projects.animation_project_id`. It answers: "Which project does this audio track belong to?" A sample row reads: track `TRA-2455` (*Legacy Cluster D*) belongs to project `PRO-2058` (*Integrated Model A*).

**View `vw_audio_track_animation_project`**

```sql
CREATE VIEW vw_audio_track_animation_project AS
SELECT a.id, a.track_identifier, a.track_title, a.file_format, b.animation_project_id AS project_animation_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM audio_tracks a JOIN animation_projects b ON a.animation_project_id = b.animation_project_id;
```

| id | track_identifier | track_title | file_format | project_animation_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1000 | TRA-2455 | Legacy Cluster D | OGG | 1 | PRO-2058 | Integrated Model A |
| 1001 | TRA-2459 | Regional Review | TAK | 2 | PRO-2059 | Extended Cluster |
| 1002 | TRA-2463 | Seasonal Initiative | OGG | 3 | PRO-2060 | Pilot Review |
| 1003 | TRA-2467 | Integrated Model A | TAK | 4 | PRO-2061 | Baseline Initiative D |

`vw_audio_track_software_tool` joins `audio_tracks` to `software_tools` on `audio_tracks.software_tool_id = software_tools.software_tool_id`. It answers: "Which software tool produced this audio track?" A sample row reads: track `TRA-2455` was produced by tool `TOO-2075` (*Composite Model*, category `3D Modeling`, version `seasonal-version-71`).

**View `vw_audio_track_software_tool`**

```sql
CREATE VIEW vw_audio_track_software_tool AS
SELECT a.id, a.track_identifier, a.track_title, a.file_format, b.software_tool_id AS tool_software_tool_id, b.tool_identifier AS tool_tool_identifier, b.tool_name AS tool_tool_name
FROM audio_tracks a JOIN software_tools b ON a.software_tool_id = b.software_tool_id;
```

| id | track_identifier | track_title | file_format | tool_software_tool_id | tool_tool_identifier | tool_tool_name |
|---|---|---|---|---|---|---|
| 1000 | TRA-2455 | Legacy Cluster D | OGG | 1000 | TOO-2075 | Composite Model |
| 1001 | TRA-2459 | Regional Review | TAK | 1001 | TOO-2078 | Compact Cluster A |
| 1002 | TRA-2463 | Seasonal Initiative | OGG | 1002 | TOO-2081 | Legacy Review |
| 1003 | TRA-2467 | Integrated Model A | TAK | 1003 | TOO-2084 | Regional Initiative |

### Software-tool-centric views

`vw_software_tool_animation_project` joins `software_tools` to `animation_projects` on `software_tools.animation_project_id = animation_projects.animation_project_id`. It answers the inverse: "Which project uses this software tool?" A sample row reads: tool `TOO-2075` (*Composite Model*) is used by project `PRO-2058` (*Integrated Model A*).

**View `vw_software_tool_animation_project`**

```sql
CREATE VIEW vw_software_tool_animation_project AS
SELECT a.software_tool_id, a.tool_identifier, a.tool_name, a.tool_category, b.animation_project_id AS project_animation_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM software_tools a JOIN animation_projects b ON a.animation_project_id = b.animation_project_id;
```

| software_tool_id | tool_identifier | tool_name | tool_category | project_animation_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1000 | TOO-2075 | Composite Model | 3D Modeling | 1 | PRO-2058 | Integrated Model A |
| 1001 | TOO-2078 | Compact Cluster A | Animation | 2 | PRO-2059 | Extended Cluster |
| 1002 | TOO-2081 | Legacy Review | Audio Editing | 3 | PRO-2060 | Pilot Review |
| 1003 | TOO-2084 | Regional Initiative | Video Editing | 4 | PRO-2061 | Baseline Initiative D |

`vw_software_tool_audio_track` joins `software_tools` to `audio_tracks` on `software_tools.software_tool_id = audio_tracks.software_tool_id`. It answers: "Which audio track was produced by this software tool?" A sample row reads: tool `TOO-2075` (*Composite Model*) produced track `TRA-2455` (*Legacy Cluster D*, format `OGG`, duration 7.45 s).

**View `vw_software_tool_audio_track`**

```sql
CREATE VIEW vw_software_tool_audio_track AS
SELECT a.software_tool_id, a.tool_identifier, a.tool_name, a.tool_category, b.id AS track_id, b.track_identifier AS track_track_identifier, b.track_title AS track_track_title
FROM software_tools a JOIN audio_tracks b ON a.audio_track_id = b.id;
```

| software_tool_id | tool_identifier | tool_name | tool_category | track_id | track_track_identifier | track_track_title |
|---|---|---|---|---|---|---|
| 1000 | TOO-2075 | Composite Model | 3D Modeling | 1000 | TRA-2455 | Legacy Cluster D |
| 1001 | TOO-2078 | Compact Cluster A | Animation | 1001 | TRA-2459 | Regional Review |
| 1002 | TOO-2081 | Legacy Review | Audio Editing | 1002 | TRA-2463 | Seasonal Initiative |
| 1003 | TOO-2084 | Regional Initiative | Video Editing | 1003 | TRA-2467 | Integrated Model A |

### Video-centric views

`vw_video_file_animation_project` joins `video_files` to `animation_projects` on `video_files.video_file_id = animation_projects.animation_project_id` (or the symmetric FK direction). It answers: "Which project produced this video file?" The join reconstructs the project's rendering metadata alongside the video file's attributes.

**View `vw_video_file_animation_project`**

```sql
CREATE VIEW vw_video_file_animation_project AS
SELECT a.id, a.file_identifier, a.file_name, a.file_format, b.animation_project_id AS project_animation_project_id, b.project_identifier AS project_project_identifier, b.project_title AS project_project_title
FROM video_files a JOIN animation_projects b ON a.animation_project_id = b.animation_project_id;
```

| id | file_identifier | file_name | file_format | project_animation_project_id | project_project_identifier | project_project_title |
|---|---|---|---|---|---|---|
| 1 | FIL-2398 | Compact Standard | pilot-file-44 | 1 | PRO-2058 | Integrated Model A |
| 2 | FIL-2400 | Legacy Framework | extended-file-45 | 2 | PRO-2059 | Extended Cluster |
| 3 | FIL-2402 | Regional Protocol A | integrated-file-46 | 3 | PRO-2060 | Pilot Review |
| 4 | FIL-2404 | Seasonal Programme | seasonal-file-47 | 4 | PRO-2061 | Baseline Initiative D |

`vw_video_file_software_tool` joins `video_files` to `software_tools` on the shared tool reference. It answers: "Which software tool rendered this video file?" The join reconstructs the tool's category and version alongside the video file's metadata.

**View `vw_video_file_software_tool`**

```sql
CREATE VIEW vw_video_file_software_tool AS
SELECT a.id, a.file_identifier, a.file_name, a.file_format, b.software_tool_id AS tool_software_tool_id, b.tool_identifier AS tool_tool_identifier, b.tool_name AS tool_tool_name
FROM video_files a JOIN software_tools b ON a.software_tool_id = b.software_tool_id;
```

| id | file_identifier | file_name | file_format | tool_software_tool_id | tool_tool_identifier | tool_tool_name |
|---|---|---|---|---|---|---|
| 1 | FIL-2398 | Compact Standard | pilot-file-44 | 1000 | TOO-2075 | Composite Model |
| 2 | FIL-2400 | Legacy Framework | extended-file-45 | 1001 | TOO-2078 | Compact Cluster A |
| 3 | FIL-2402 | Regional Protocol A | integrated-file-46 | 1002 | TOO-2081 | Legacy Review |
| 4 | FIL-2404 | Seasonal Programme | seasonal-file-47 | 1003 | TOO-2084 | Regional Initiative |

## Synthesis

The model encodes a production pipeline as a set of seven normalised tables linked by foreign keys that enforce one-to-many cardinality from the perspective of the referencing table. The `animation_projects` table sits at the centre, holding four FK columns that point to `software_tools`, `digital_assets`, `audio_tracks`, and `video_files`. The `digital_assets` table links to `rigging_systems`, which in turn links to `animation_controls`. The `audio_tracks` and `software_tools` tables cross-reference each other through mutual FK columns.

The sixteen views each perform a single two-table join, projecting the shared key and the non-key columns of both tables into a denormalised row. Each view answers a concrete production question — "which tool was used for this project?" or "which asset does this rig animate?" — and each row in a view can be traced back to exactly one pair of base-table rows. This design separates the concerns of storage (normalised, update-friendly base tables) from the concerns of analysis (denormalised, read-optimised views), a pattern that scales cleanly as new entity types and relationships are added to the pipeline.

## Data appendix

**Table `video_files`**

| id | file_identifier | file_name | file_format | resolution | has_lighting | animation_project_id | software_tool_id |
|---|---|---|---|---|---|---|---|
| 1 | FIL-2398 | Compact Standard | pilot-file-44 | regional-resoluti-30 | true | 1 | 1000 |
| 2 | FIL-2400 | Legacy Framework | extended-file-45 | legacy-resoluti-31 | false | 2 | 1001 |
| 3 | FIL-2402 | Regional Protocol A | integrated-file-46 | compact-resoluti-32 | true | 3 | 1002 |
| 4 | FIL-2404 | Seasonal Programme | seasonal-file-47 | composite-resoluti-33 | false | 4 | 1003 |
