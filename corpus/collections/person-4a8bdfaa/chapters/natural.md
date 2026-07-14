## Organizational Governance and Strategic Execution

Enterprise governance operates as a temporal discipline: every person, role, organization, objective, project, and policy carries a lifecycle. The records in this domain capture not just who is accountable and what is being pursued, but when assignments begin and end, which statuses they hold, and how each entity connects to the broader architecture of strategy and execution. The following reference describes the six base tables that store these records and the twelve views that join them into operational narratives.

**Table `persons`**

| id | person_id | full_name | start_date | end_date | status | role_id | organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | George Bernard Shaw | Theodore Mcgrath | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1 | 1 |
| 1001 | Maria Rodriguez | Account Name | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | inactive | 2 | 2 |
| 1002 | Sarah Villanueva | Saipan International Airport | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | designated | 3 | 3 |
| 1003 | Susan Wagner | Norma Fisher | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | 4 | 4 |

The persons table is the roster of individuals active within the governance ecosystem. Each row records a person's identifier, full name, the date range during which their record is valid, and their current status. Four persons appear in the current dataset. Theodore Mcgrath (person_id 1000) holds an active status with a validity window beginning 2022-09-05. Maria Rodriguez (1001) is marked inactive, her window closing on 2023-02-12. Sarah Villanueva (1002) carries the status designated, and Susan Wagner (1003) is active with a future-dated window starting 2025-12-11. The role_id and organization_id columns anchor each person to a specific organizational role and the organization they serve.

**Table `roles`**

| id | role_name | start_date | end_date | status | person_id | organization_id |
|---|---|---|---|---|---|---|
| 1 | Seasonal Programme | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1000 | 1 |
| 2 | Integrated Standard | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | inactive | 1001 | 2 |
| 3 | Extended Framework D | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | designated | 1002 | 3 |
| 4 | Pilot Protocol | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | 1003 | 4 |

Roles define the functional positions that persons occupy. The roles table mirrors the temporal structure of persons: each role has a name, a start and end date, a status, and foreign-key references back to the person and organization. The role named Seasonal Programme (id 1) is active and assigned to person 1000 within organization 1. Integrated Standard (id 2) is inactive, linked to person 1001. Extended Framework D (id 3) carries the status designated and belongs to person 1002. Pilot Protocol (id 4) is active and associated with person 1003. The symmetry between persons and roles is intentional — every person row references a role, and every role row references a person, forming a bidirectional mapping that the views below make explicit.

**Table `organizations`**

| organization_id | org_id | org_name | founding_date | status | person_id | role_id |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | 2023-06-24 | active | 1000 | 1 |
| 2 | 1717 | Pilot Initiative A | 2024-11-08 | inactive | 1001 | 2 |
| 3 | 69437 | Baseline Model | 2025-04-19 | active | 1002 | 3 |
| 4 | m16 | Distributed Cluster | 2022-09-03 | inactive | 1003 | 4 |

Organizations represent the structural units within which governance occurs. Each organization carries a unique org_id, a human-readable org_name, a founding_date, a status, and references to the person and role that anchor it. Extended Review (org_id 790471) is active, founded 2023-06-24, and linked to person 1000 and role 1. Pilot Initiative A (org_id 1717) is inactive, founded 2024-11-08, tied to person 1001 and role 2. Baseline Model (org_id 69437) is active, founded 2025-04-19, connected to person 1002 and role 3. Distributed Cluster (org_id m16) is inactive, founded 2022-09-03, associated with person 1003 and role 4. The organization table thus serves as the hub through which persons, roles, strategic objectives, projects, and policies are contextualized.

**Table `strategic_objectives`**

| id | objective_id | objective_name | start_date | end_date | status | organization_id | project_id |
|---|---|---|---|---|---|---|---|
| 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Legacy Programme D | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1 | 1437597 |
| 101 | default_chart_a_tax_19 | Regional Standard | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 2 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 |
| 102 | 3001009030160 | Seasonal Framework | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 5006462 |
| 103 | 10449523 | Integrated Protocol A | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 4 | 10207143 |

Strategic objectives articulate the goals that organizations pursue. Each objective has an objective_id, an objective_name, a validity window, a status, and references to the owning organization and an associated project. Legacy Programme D (objective_id fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3) is in a planned state, owned by organization 1, and linked to project 1437597. Regional Standard (default_chart_a_tax_19) is active, owned by organization 2, and tied to project df5a6648-8fd1-11eb-924d-9cd76263cbd0. Seasonal Framework (3001009030160) is completed, owned by organization 3, and connected to project 5006462. Integrated Protocol A (10449523) is cancelled, owned by organization 4, and associated with project 10207143. The statuses planned, active, completed, and cancelled span the full lifecycle of strategic intent.

**Table `projects`**

| project_id | project_name | start_date | end_date | status | strategic_objective_id | person_id |
|---|---|---|---|---|---|---|
| 1437597 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 100 | 1000 |
| df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 101 | 1001 |
| 5006462 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 102 | 1002 |
| 10207143 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 103 | 1003 |

Projects are the executable containers through which strategic objectives are realized. Each project carries a project_id, a project_name, a validity window, a status, a reference to its parent strategic objective, and a person_id indicating the individual responsible. Compact Survey (project_id 1437597) is planned, maps to strategic objective 100, and is assigned to person 1000. Legacy Corridor (df5a6648-8fd1-11eb-924d-9cd76263cbd0) is active, maps to objective 101, and is assigned to person 1001. Regional Series A (5006462) is completed, maps to objective 102, and is assigned to person 1002. Seasonal Assessment (10207143) is cancelled, maps to objective 103, and is assigned to person 1003. The project table thus bridges strategy and execution, with each row tying a named initiative to both a strategic goal and a responsible person.

**Table `policies`**

| policy_id | policy_name | start_date | end_date | status | organization_id | strategic_objective_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | Regional Series | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | draft | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | Seasonal Assessment D | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | Integrated Survey | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | inactive | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | Extended Corridor | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | draft | 4 | 103 | 2025-04-16 09:14:00 |

Policies encode the rules and standards that govern organizational behavior. Each policy has a policy_id, a policy_name, a validity window, a status, references to an organization and a strategic objective, and a created_at timestamp indicating when the policy record was first established. Regional Series (policy_id 1) is in draft status, applies to organization 1, aligns with strategic objective 100, and was created on 2025-01-01. Seasonal Assessment D (2) is active, applies to organization 2, aligns with objective 101, and was created on 2025-02-06. Integrated Survey (3) is inactive, applies to organization 3, aligns with objective 102, and was created on 2025-03-11. Extended Corridor (4) is in draft status, applies to organization 4, aligns with objective 103, and was created on 2025-04-16. Policies thus provide the regulatory layer that sits between organizational structure and strategic intent.

The views below join these base tables into readable narratives. Each view answers a specific operational question by combining records across tables.

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

This view joins persons to their assigned roles, answering the question: which role does each person hold, and what is the temporal context of that assignment? Row 1 shows Theodore Mcgrath (person_id 1000) in the role Seasonal Programme (id 1), both active, with matching validity windows. Row 2 shows Maria Rodriguez (1001) in the role Integrated Standard (id 2), both inactive, with identical date ranges. The join confirms a one-to-one correspondence between persons and roles in this dataset — every person row maps to exactly one role row and vice versa.

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

This view links persons to their organizations, answering: which organization does each person belong to, and what is the organizational context? Row 1 places Theodore Mcgrath (1000) within Extended Review (org_id 790471), an active organization founded in 2023. Row 2 places Maria Rodriguez (1001) within Pilot Initiative A (org_id 1717), which is inactive. The view makes explicit the organizational home of each person, with the organization_id and role_id columns from the persons table providing the foreign keys that drive the join.

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

This view presents the same person-role relationship from the role's perspective, answering: which person occupies this role? Row 1 shows the role Seasonal Programme (id 1) occupied by Theodore Mcgrath (1000). Row 2 shows Integrated Standard (id 2) occupied by Maria Rodriguez (1001). The columns here originate from the roles table and include the person_id foreign key, producing a role-centric view of the same bidirectional mapping. This orientation is useful when querying from the role side — for example, finding all persons assigned to a particular role.

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

This view connects roles to their organizations, answering: which organization does this role serve? Row 1 shows the role Seasonal Programme (id 1) serving Extended Review (org_id 790471). Row 2 shows Integrated Standard (id 2) serving Pilot Initiative A (org_id 1717). The role table carries both person_id and organization_id, so this join produces a complete picture of the role's organizational context. The status columns on both sides allow practitioners to verify that the role and its host organization share a consistent lifecycle state.

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

This view presents the organization-to-person relationship from the organization's perspective, answering: which person is anchored to this organization? Row 1 shows Extended Review (org_id 790471) anchored to Theodore Mcgrath (1000). Row 2 shows Pilot Initiative A (org_id 1717) anchored to Maria Rodriguez (1001). The organization table carries person_id and role_id as foreign keys, so this view surfaces the individual responsible for or associated with each organizational unit. It is the inverse of v_person_organization and serves organizational audits.

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

This view connects organizations to their roles, answering: which roles operate within this organization? Row 1 shows Extended Review (org_id 790471) hosting the role Seasonal Programme (id 1). Row 2 shows Pilot Initiative A (org_id 1717) hosting the role Integrated Standard (id 2). The join uses the organization_id foreign key present in both the organizations and roles tables. This view is particularly useful for capacity planning — it reveals how many roles are active within each organizational unit and whether their statuses align.

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

This view links strategic objectives to their owning organizations, answering: which organization owns each strategic objective? Row 1 shows Legacy Programme D (objective_id fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3) owned by organization 1. Row 2 shows Regional Standard (default_chart_a_tax_19) owned by organization 2. The strategic_objectives table carries organization_id as a foreign key, making this a straightforward join. The status columns on both sides allow practitioners to verify that an objective's lifecycle state is consistent with its owning organization's state.

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

This view connects strategic objectives to their associated projects, answering: which project executes each strategic objective? Row 1 shows Legacy Programme D (objective 100) executed by project Compact Survey (1437597). Row 2 shows Regional Standard (objective 101) executed by project Legacy Corridor (df5a6648-8fd1-11eb-924d-9cd76263cbd0). The strategic_objectives table carries project_id as a foreign key. This view is critical for strategy-to-execution traceability — it answers the question of whether every strategic objective has a corresponding project and whether their statuses are aligned.

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

This view presents the project-to-objective relationship from the project's perspective, answering: which strategic objective does this project serve? Row 1 shows Compact Survey (project 1437597) serving strategic objective 100 (Legacy Programme D). Row 2 shows Legacy Corridor (project df5a6648-8fd1-11eb-924d-9cd76263cbd0) serving objective 101 (Regional Standard). The projects table carries strategic_objective_id as a foreign key, making this the inverse of v_strategic_objective_project. This orientation is useful when reviewing project portfolios and understanding the strategic rationale behind each initiative.

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

This view links projects to the persons responsible for them, answering: which person is assigned to each project? Row 1 shows Compact Survey (project 1437597) assigned to Theodore Mcgrath (1000). Row 2 shows Legacy Corridor (project df5a6648-8fd1-11eb-924d-9cd76263cbd0) assigned to Maria Rodriguez (1001). The projects table carries person_id as a foreign key. This view is essential for workload management and accountability tracking — it surfaces the individual responsible for each project's execution and allows practitioners to verify that assignments are current by comparing validity windows.

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

This view connects policies to their applying organizations, answering: which organization is governed by each policy? Row 1 shows Regional Series (policy_id 1) applying to organization 1. Row 2 shows Seasonal Assessment D (policy_id 2) applying to organization 2. The policies table carries organization_id as a foreign key. This view supports compliance audits by revealing the organizational scope of each policy and allowing practitioners to verify that policies are current by comparing their status and validity windows against the host organization's state.

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

This view links policies to the strategic objectives they support, answering: which strategic objective does each policy govern? Row 1 shows Regional Series (policy_id 1) governing strategic objective 100 (Legacy Programme D). Row 2 shows Seasonal Assessment D (policy_id 2) governing objective 101 (Regional Standard). The policies table carries strategic_objective_id as a foreign key. This view is critical for regulatory alignment — it ensures that every policy can be traced to the strategic goal it exists to support, and that the policy's lifecycle state is consistent with the objective's state.

The governance domain described here is fundamentally relational. Persons hold roles within organizations; organizations own strategic objectives; objectives are executed through projects; projects are staffed by persons; and policies govern both organizations and objectives. The twelve views above make these relationships queryable from every direction, ensuring that any practitioner — whether auditing compliance, planning capacity, or tracing accountability — can navigate the full graph of organizational records. The temporal dimensions (start_date, end_date, status) on every table ensure that these relationships are not static snapshots but living records that evolve with the enterprise.