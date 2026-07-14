The domain under examination is an organizational governance framework in which people, roles, and organizations form the structural backbone, while strategic objectives, projects, and policies provide the operational layer that connects human actors to institutional goals. Every entity in this model carries a lifecycle: a `start_date`, an `end_date`, and a `status` that records whether the entity is `active`, `inactive`, `planned`, `designated`, `completed`, `cancelled`, or in `draft`. The relational schema captures this by distributing entities across six base tables and reconstructing cross-entity facts through twelve materialized views. The following sections walk through the base tables, the views, and the join logic that turns normalized rows back into domain-level narratives.

## Base Tables

The foundation of the model consists of six tables, each representing a distinct entity type. The `persons` table stores individual human actors. Its primary key is `id`, a surrogate integer, while `person_id` serves as a natural identifier. The column `full_name` holds the person's display name, and the temporal columns `start_date` and `end_date` bound the validity window of the record. The `status` column takes values such as `active`, `inactive`, or `designated`. Two foreign keys, `role_id` and `organization_id`, link each person to a role and an organization respectively. For example, row 1000 records Theodore Mcgrath as an `active` person whose role is `1` and whose organization is `1`; row 1002 records Sarah Villanueva with `status` `designated`, role `3`, and organization `3`.

**Table `persons`**

| id | person_id | full_name | start_date | end_date | status | role_id | organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Theodore Mcgrath | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1 | 1 |
| 1001 | Maria Rodriguez | Account Name | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | inactive | 2 | 2 |
| 1002 | Sarah Villanueva | Saipan International Airport | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | designated | 3 | 3 |
| 1003 | Susan Wagner | Norma Fisher | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | 4 | 4 |

The `roles` table defines the functional positions that persons occupy. Its primary key is `id`, and the column `role_name` carries the human-readable label of the role. Like `persons`, it has `start_date`, `end_date`, and `status` columns. The foreign keys `person_id` and `organization_id` establish that a role is always instantiated by a specific person within a specific organization. Row 1 carries the name `Seasonal Programme` and is associated with person `1000` and organization `1`; row 4, named `Pilot Protocol`, links person `1003` to organization `4`.

**Table `roles`**

| id | role_name | start_date | end_date | status | person_id | organization_id |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1000 | 1 |
| 2 | Integrated Standard | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | inactive | 1001 | 2 |
| 3 | Extended Framework D | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | designated | 1002 | 3 |
| 4 | Pilot Protocol | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | 1003 | 4 |

The `organizations` table models the institutional entities. Its primary key is `organization_id`, and the column `org_id` holds a secondary identifier (in the sample data, values range from the integer `1717` to the alphanumeric string `m16`). The column `org_name` stores the organization's name, such as `Extended Review` or `Distributed Cluster`. The temporal columns `founding_date`, `status`, and the foreign keys `person_id` and `role_id` tie each organization to a responsible person and a governing role. Row 1, `Extended Review`, is `active` and linked to person `1000` and role `1`; row 4, `Distributed Cluster`, is `inactive` and linked to person `1003` and role `4`.

**Table `organizations`**

| organization_id | org_id | org_name | founding_date | status | person_id | role_id |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 2023-06-24 | active | 1000 | 1 |
| 2 | 1717 | Pilot Initiative A | 2024-11-08 | inactive | 1001 | 2 |
| 3 | 69437 | Baseline Model | 2025-04-19 | active | 1002 | 3 |
| 4 | m16 | Distributed Cluster | 2022-09-03 | inactive | 1003 | 4 |

The `strategic_objectives` table captures the high-level goals that guide organizational activity. Its primary key is `id`, and the column `objective_id` holds a natural identifier that in the sample data takes UUID-like values such as `fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3` and short numeric strings like `30010090301600`. The column `objective_name` carries the label, for instance `Legacy Programme D` or `Seasonal Framework`. The `status` column records lifecycle states including `planned`, `active`, `completed`, and `cancelled`. Foreign keys `organization_id` and `project_id` connect each objective to the organization that owns it and the project that executes it. Row 100, `Legacy Programme D`, is `planned`, belongs to organization `1`, and is tied to project `1437597`.

**Table `strategic_objectives`**

| id | objective_id | objective_name | start_date | end_date | status | organization_id | project_id |
|---|---|---|---|---|---|---|---|
| 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Legacy Programme D | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1 | 1437597 |
| 101 | default_chart_a_tax_19 | Regional Standard | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 |
| 102 | 3001009030160 | Seasonal Framework | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 5006462 |
| 103 | 10449523 | Integrated Protocol A | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 4 | 10207143 |

The `projects` table represents the concrete work items through which strategic objectives are realized. Its primary key is `project_id`, which in the sample data mixes integers (e.g., `1437597`) and UUIDs (e.g., `df5a6648-8fd1-11eb-924d-9cd76263cbd0`). The column `project_name` holds the project's label, such as `Compact Survey` or `Legacy Corridor`. The temporal columns `start_date`, `end_date`, and `status` mirror those in other tables. The foreign key `strategic_objective_id` links the project to its parent objective, and `person_id` assigns a responsible person. Row `1437597`, `Compact Survey`, is `planned`, belongs to strategic objective `100`, and is assigned to person `1000`.

**Table `projects`**

| project_id | project_name | start_date | end_date | status | strategic_objective_id | person_id |
|---|---|---|---|---|---|---|
| 1437597 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 100 | 1000 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 101 | 1001 |
| 5006462 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 102 | 1002 |
| 10207143 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 103 | 1003 |

The `policies` table encodes the governance rules that constrain organizational behavior. Its primary key is `policy_id`, and the column `policy_name` stores the policy's label, such as `Regional Series` or `Extended Corridor`. The temporal columns `start_date`, `end_date`, and `status` record the policy's lifecycle, with values including `draft`, `active`, and `inactive`. An additional column `created_at` captures the timestamp of policy creation. Foreign keys `organization_id` and `strategic_objective_id` tie each policy to the organization that enacts it and the strategic objective it supports. Row 1, `Regional Series`, is in `draft` status, applies to organization `1`, and supports strategic objective `100`.

**Table `policies`**

| policy_id | policy_name | start_date | end_date | status | organization_id | strategic_objective_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | Regional Series | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | draft | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | Seasonal Assessment D | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | Integrated Survey | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | inactive | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | Extended Corridor | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | draft | 4 | 103 | 2025-04-16 09:14:00 |

## Views: Reconstructing Domain Facts

The base tables are normalized to eliminate redundancy, but domain questions naturally span multiple entity types. The twelve views materialize these cross-entity joins, each answering a specific class of query.

### Person–Role and Person–Organization Views

The view `v_person_role` joins `persons` to `roles` on the person–role relationship, producing a flat row that pairs a person's name with their role name and the temporal overlap of their assignments. Reading row 1000, the view reveals that Theodore Mcgrath holds the role `Seasonal Programme` during the period bounded by `2022-09-05T20:24:00` and `2022-09-01T08:00:00`, with `status` `active`.

**View `v_person_role`**

```sql
CREATE VIEW v_person_role AS
SELECT a.id, a.person_id, a.full_name, a.start_date, b.id AS role_id, b.role_name AS role_role_name, b.start_date AS role_start_date
FROM persons a JOIN roles b ON a.role_id = b.id;
```

| id | person_id | full_name | start_date | role_id | role_role_name | role_start_date |
|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Theodore Mcgrath | 2022-09-05T20:24:00 | 1 | Seasonal Programme | 2022-09-05T20:24:00 |
| 1001 | Maria Rodriguez | Account Name | 2023-02-16T03:41:00 | 2 | Integrated Standard | 2023-02-16T03:41:00 |
| 1002 | Sarah Villanueva | Saipan International Airport | 2024-07-27T10:58:00 | 3 | Extended Framework D | 2024-07-27T10:58:00 |
| 1003 | Susan Wagner | Norma Fisher | 2025-12-11T17:15:00 | 4 | Pilot Protocol | 2025-12-11T17:15:00 |

The view `v_person_organization` joins `persons` to `organizations`, answering the question "which organization does each person belong to?" Row 1000 shows Theodore Mcgrath associated with `Extended Review` (organization `1`), while row 1003 shows Susan Wagner linked to `Distributed Cluster` (organization `4`). The view carries the `status` of both the person and the organization, enabling queries such as "list all persons who are `active` in `inactive` organizations."

**View `v_person_organization`**

```sql
CREATE VIEW v_person_organization AS
SELECT a.id, a.person_id, a.full_name, a.start_date, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM persons a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | person_id | full_name | start_date | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Theodore Mcgrath | 2022-09-05T20:24:00 | 1 | 790471 | Extended Review |
| 1001 | Maria Rodriguez | Account Name | 2023-02-16T03:41:00 | 2 | 1717 | Pilot Initiative A |
| 1002 | Sarah Villanueva | Saipan International Airport | 2024-07-27T10:58:00 | 3 | 69437 | Baseline Model |
| 1003 | Susan Wagner | Norma Fisher | 2025-12-11T17:15:00 | 4 | m16 | Distributed Cluster |

### Role-Centric Views

The view `v_role_person` inverts the person–role perspective: it starts from roles and surfaces the person who fills each one. Row 1, `Seasonal Programme`, maps to person `1000` (Theodore Mcgrath), while row 3, `Extended Framework D`, maps to person `1002` (Sarah Villanueva). This orientation is useful when the analyst begins with a role and needs to discover its incumbent.

**View `v_role_person`**

```sql
CREATE VIEW v_role_person AS
SELECT a.id, a.role_name, a.start_date, a.end_date, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM roles a JOIN persons b ON a.person_id = b.id;
```

| id | role_name | start_date | end_date | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | George Bernard Shaw | Theodore Mcgrath |
| 2 | Integrated Standard | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | Maria Rodriguez | Account Name |
| 3 | Extended Framework D | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | Sarah Villanueva | Saipan International Airport |
| 4 | Pilot Protocol | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | Susan Wagner | Norma Fisher |

The view `v_role_organization` joins `roles` to `organizations`, answering "which organization does each role serve?" Row 1, `Seasonal Programme`, serves organization `1` (`Extended Review`), and row 4, `Pilot Protocol`, serves organization `4` (`Distributed Cluster`). The view preserves the `status` of both the role and the organization, allowing the analyst to filter for roles that are `active` within `inactive` organizations.

**View `v_role_organization`**

```sql
CREATE VIEW v_role_organization AS
SELECT a.id, a.role_name, a.start_date, a.end_date, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM roles a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | role_name | start_date | end_date | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 790471 | Extended Review |
| 2 | Integrated Standard | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1717 | Pilot Initiative A |
| 3 | Extended Framework D | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 69437 | Baseline Model |
| 4 | Pilot Protocol | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | m16 | Distributed Cluster |

### Organization-Centric Views

The view `v_organization_person` joins `organizations` to `persons`, answering "which persons are associated with each organization?" Row 1, `Extended Review`, is linked to person `1000` (Theodore Mcgrath), and row 3, `Baseline Model`, is linked to person `1002` (Sarah Villanueva). This view is the organizational counterpart to `v_person_organization`, useful when the query starts from an organization and needs to enumerate its people.

**View `v_organization_person`**

```sql
CREATE VIEW v_organization_person AS
SELECT a.organization_id, a.org_id, a.org_name, a.founding_date, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM organizations a JOIN persons b ON a.person_id = b.id;
```

| organization_id | org_id | org_name | founding_date | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 2023-06-24 | 1000 | George Bernard Shaw | Theodore Mcgrath |
| 2 | 1717 | Pilot Initiative A | 2024-11-08 | 1001 | Maria Rodriguez | Account Name |
| 3 | 69437 | Baseline Model | 2025-04-19 | 1002 | Sarah Villanueva | Saipan International Airport |
| 4 | m16 | Distributed Cluster | 2022-09-03 | 1003 | Susan Wagner | Norma Fisher |

The view `v_organization_role` joins `organizations` to `roles`, answering "which roles are instantiated within each organization?" Row 1, `Extended Review`, hosts role `1` (`Seasonal Programme`), and row 4, `Distributed Cluster`, hosts role `4` (`Pilot Protocol`). The view carries the `status` of both the organization and the role, enabling queries such as "list all `active` roles in `inactive` organizations."

**View `v_organization_role`**

```sql
CREATE VIEW v_organization_role AS
SELECT a.organization_id, a.org_id, a.org_name, a.founding_date, b.id AS role_id, b.role_name AS role_role_name, b.start_date AS role_start_date
FROM organizations a JOIN roles b ON a.role_id = b.id;
```

| organization_id | org_id | org_name | founding_date | role_id | role_role_name | role_start_date |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 2023-06-24 | 1 | Seasonal Programme | 2022-09-05T20:24:00 |
| 2 | 1717 | Pilot Initiative A | 2024-11-08 | 2 | Integrated Standard | 2023-02-16T03:41:00 |
| 3 | 69437 | Baseline Model | 2025-04-19 | 3 | Extended Framework D | 2024-07-27T10:58:00 |
| 4 | m16 | Distributed Cluster | 2022-09-03 | 4 | Pilot Protocol | 2025-12-11T17:15:00 |

### Strategic Objective Views

The view `v_strategic_objective_organization` joins `strategic_objectives` to `organizations`, answering "which organization owns each strategic objective?" Row 100, `Legacy Programme D`, is owned by organization `1` (`Extended Review`) and has `status` `planned`; row 102, `Seasonal Framework`, is owned by organization `3` (`Baseline Model`) and has `status` `completed`. This view is essential for governance audits that need to verify whether an organization's active objectives align with its strategic plan.

**View `v_strategic_objective_organization`**

```sql
CREATE VIEW v_strategic_objective_organization AS
SELECT a.id, a.objective_id, a.objective_name, a.start_date, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM strategic_objectives a JOIN organizations b ON a.organization_id = b.organization_id;
```

| id | objective_id | objective_name | start_date | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Legacy Programme D | 2022-09-05T20:24:00 | 1 | 790471 | Extended Review |
| 101 | default_chart_a_tax_19 | Regional Standard | 2023-02-16T03:41:00 | 2 | 1717 | Pilot Initiative A |
| 102 | 3001009030160 | Seasonal Framework | 2024-07-27T10:58:00 | 3 | 69437 | Baseline Model |
| 103 | 10449523 | Integrated Protocol A | 2025-12-11T17:15:00 | 4 | m16 | Distributed Cluster |

The view `v_strategic_objective_project` joins `strategic_objectives` to `projects`, answering "which projects execute each strategic objective?" Row 100, `Legacy Programme D`, is executed by project `1437597` (`Compact Survey`), which is itself `planned`; row 102, `Seasonal Framework`, is executed by project `5006462` (`Regional Series A`), which is `completed`. This view enables the analyst to trace from a strategic goal down to the concrete work items and to detect objectives that have no associated project.

**View `v_strategic_objective_project`**

```sql
CREATE VIEW v_strategic_objective_project AS
SELECT a.id, a.objective_id, a.objective_name, a.start_date, b.project_id AS project_project_id, b.project_name AS project_project_name, b.start_date AS project_start_date
FROM strategic_objectives a JOIN projects b ON a.project_id = b.project_id;
```

| id | objective_id | objective_name | start_date | project_project_id | project_project_name | project_start_date |
|---|---|---|---|---|---|---|
| 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Legacy Programme D | 2022-09-05T20:24:00 | 1437597 | Compact Survey | 2022-09-05T20:24:00 |
| 101 | default_chart_a_tax_19 | Regional Standard | 2023-02-16T03:41:00 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2023-02-16T03:41:00 |
| 102 | 3001009030160 | Seasonal Framework | 2024-07-27T10:58:00 | 5006462 | Regional Series A | 2024-07-27T10:58:00 |
| 103 | 10449523 | Integrated Protocol A | 2025-12-11T17:15:00 | 10207143 | Seasonal Assessment | 2025-12-11T17:15:00 |

The view `v_project_strategic_objective` inverts the previous join: it starts from projects and surfaces their parent strategic objective. Row `1437597`, `Compact Survey`, belongs to strategic objective `100` (`Legacy Programme D`); row `df5a6648-8fd1-11eb-924d-9cd76263cbd0`, `Legacy Corridor`, belongs to strategic objective `101` (`Regional Standard`). This orientation is useful when the analyst begins with a project and needs to discover its strategic justification.

**View `v_project_strategic_objective`**

```sql
CREATE VIEW v_project_strategic_objective AS
SELECT a.project_id, a.project_name, a.start_date, a.end_date, b.id AS objective_id, b.objective_id AS objective_objective_id, b.objective_name AS objective_objective_name
FROM projects a JOIN strategic_objectives b ON a.strategic_objective_id = b.id;
```

| project_id | project_name | start_date | end_date | objective_id | objective_objective_id | objective_objective_name |
|---|---|---|---|---|---|---|
| 1437597 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Legacy Programme D |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | default_chart_a_tax_19 | Regional Standard |
| 5006462 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 3001009030160 | Seasonal Framework |
| 10207143 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 10449523 | Integrated Protocol A |

### Project–Person Views

The view `v_project_person` joins `projects` to `persons`, answering "which person is responsible for each project?" Row `1437597`, `Compact Survey`, is assigned to person `1000` (Theodore Mcgrath); row `df5a6648-8fd1-11eb-924d-9cd76263cbd0`, `Legacy Corridor`, is assigned to person `1001` (Maria Rodriguez). The view carries the `status` of both the project and the person, enabling queries such as "list all projects assigned to `inactive` persons."

**View `v_project_person`**

```sql
CREATE VIEW v_project_person AS
SELECT a.project_id, a.project_name, a.start_date, a.end_date, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM projects a JOIN persons b ON a.person_id = b.id;
```

| project_id | project_name | start_date | end_date | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1437597 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | George Bernard Shaw | Theodore Mcgrath |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | Maria Rodriguez | Account Name |
| 5006462 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | Sarah Villanueva | Saipan International Airport |
| 10207143 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | Susan Wagner | Norma Fisher |

### Policy Views

The view `v_policy_organization` joins `policies` to `organizations`, answering "which organization enacts each policy?" Row 1, `Regional Series`, is enacted by organization `1` (`Extended Review`) and is in `draft` status; row 4, `Extended Corridor`, is enacted by organization `4` (`Distributed Cluster`) and is also in `draft` status. This view supports compliance audits by revealing which policies are active within which organizations.

**View `v_policy_organization`**

```sql
CREATE VIEW v_policy_organization AS
SELECT a.policy_id, a.policy_name, a.start_date, a.end_date, b.organization_id AS organization_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM policies a JOIN organizations b ON a.organization_id = b.organization_id;
```

| policy_id | policy_name | start_date | end_date | organization_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Regional Series | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 790471 | Extended Review |
| 2 | Seasonal Assessment D | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1717 | Pilot Initiative A |
| 3 | Integrated Survey | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 69437 | Baseline Model |
| 4 | Extended Corridor | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | m16 | Distributed Cluster |

The view `v_policy_strategic_objective` joins `policies` to `strategic_objectives`, answering "which strategic objective does each policy support?" Row 1, `Regional Series`, supports strategic objective `100` (`Legacy Programme D`); row 2, `Seasonal Assessment D`, supports strategic objective `101` (`Regional Standard`). This view enables the analyst to verify that every strategic objective has at least one supporting policy and to detect policies that reference objectives outside the current portfolio.

**View `v_policy_strategic_objective`**

```sql
CREATE VIEW v_policy_strategic_objective AS
SELECT a.policy_id, a.policy_name, a.start_date, a.end_date, b.id AS objective_id, b.objective_id AS objective_objective_id, b.objective_name AS objective_objective_name
FROM policies a JOIN strategic_objectives b ON a.strategic_objective_id = b.id;
```

| policy_id | policy_name | start_date | end_date | objective_id | objective_objective_id | objective_objective_name |
|---|---|---|---|---|---|---|
| 1 | Regional Series | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Legacy Programme D |
| 2 | Seasonal Assessment D | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | default_chart_a_tax_19 | Regional Standard |
| 3 | Integrated Survey | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 3001009030160 | Seasonal Framework |
| 4 | Extended Corridor | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 10449523 | Integrated Protocol A |

## Synthesis

The schema models a governance domain where people occupy roles within organizations, organizations pursue strategic objectives through projects, and policies constrain the entire structure. The six base tables normalize these entities, each carrying a lifecycle (`start_date`, `end_date`, `status`) and foreign keys that encode cardinality-bounded relationships: a person has one role and one organization, a role is filled by one person in one organization, a strategic objective belongs to one organization and one project, and a policy applies to one organization and one strategic objective. The twelve views materialize the cross-entity joins that domain questions require, each view answering a specific "who–what–where" query by flattening two or three tables into a single result set. Reading concrete rows—Theodore Mcgrath (`1000`) as an `active` person in `Extended Review` (`1`) holding the `Seasonal Programme` role (`1`), or the `completed` project `Regional Series A` (`5006462`) executing the `Seasonal Framework` objective (`102`) for `Baseline Model` (`3`)—the schema makes the full chain of accountability visible: person → role → organization → strategic objective → project, with policies overlaying governance constraints at the organization–objective level.