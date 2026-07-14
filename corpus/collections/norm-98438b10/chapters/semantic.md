## Ontology-Grounded Relational Modelling of Physical Transition Systems

The domain under examination concerns the formal specification and enforcement of normative constraints within physical transition systems—computational artefacts whose state evolves through discrete transitions governed by preconditions and effects. Each system is anchored to a deontic norm (obligation or prohibition), tracks its own state trajectory, and may incur norm violations that trigger sanctions against responsible agents. The relational schema materialises this ontology by decomposing the conceptual model into nine base tables and twenty views, where the base tables enforce third-normal-form discipline and the views reconstruct domain facts through controlled joins. The following sections walk through the materialisation, grounding every structural claim in the actual row values.

**Table `norms`**

| id | norm_id | norm_type | trigger_condition | deadline_condition | enforcement_mode | sanction_type | physical_transition_system_id | norm_violation_id | sanction_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation | legacy-trigger-49 | regional-deadline-30 | enforcement | baseline-sanction-79 | 1 | 1 | 1 |
| 2 | 13734000 | prohibition | compact-trigger-50 | legacy-deadline-31 | regimentation | pilot-sanction-80 | 2 | 2 | 2 |
| 3 | 2933479 | obligation | composite-trigger-51 | compact-deadline-32 | enforcement | extended-sanction-81 | 3 | 3 | 3 |
| 4 | 6564384 | prohibition | primary-trigger-52 | composite-deadline-33 | regimentation | integrated-sanction-82 | 4 | 4 | 4 |

The `norms` table is the deontic core. Its primary key `id` is a surrogate integer, while `norm_id` carries the UUID that the ontology assigns to each norm concept. The column `norm_type` distinguishes `obligation` from `prohibition`; in the sample data the first norm (`eff2857c-8fcb-11eb-924d-9cd76263cbd0`) is an obligation, whereas the second (`13734000`) is a prohibition. The `trigger_condition` and `deadline_condition` columns encode the temporal and logical guards that activate a norm—values such as `legacy-trigger-49` and `regional-deadline-30` appear in row 1, while `compact-trigger-50` and `legacy-deadline-31` appear in row 2. The `enforcement_mode` column (`enforcement` or `regimentation`) determines whether the norm is passively monitored or actively regulated. The `sanction_type` column (`baseline-sanction-79`, `pilot-sanction-80`, `extended-sanction-81`, `integrated-sanction-82`) names the sanction category that applies when the norm is breached. Finally, `physical_transition_system_id`, `norm_violation_id`, and `sanction_id` are foreign keys that link the norm to its host system, its associated violation record, and the sanction that may be levied.

**Table `physical_transition_systems`**

| physical_transition_system_id | system_id | initial_state_id | state_count | transition_relation_id | valuation_function_id | physical_atoms | sanction_atoms | norm_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | 1336170 | 0 | 978-0-07-162442-8 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | legacy-physical-67 | composite-sanction-87 | 1 |
| 2 | 3717623 | L137 | 3 | 10238260 | 4985162 | compact-physical-68 | primary-sanction-88 | 2 |
| 3 | 7441161 | 21016225 | 1 | 2839507 | 5c6f01c708ff420a862fd80b80bd80dc | composite-physical-69 | adaptive-sanction-89 | 3 |
| 4 | 605963 | 12388 | 0 | c74553ec-8fcc-11eb-924d-9cd76263cbd0 | 937741 | primary-physical-70 | distributed-sanction-90 | 4 |

The `physical_transition_systems` table captures the structural identity of each transition system. Its surrogate key `physical_transition_system_id` (1–4) maps to a domain-level `system_id` (e.g., `8189503`, `3717623`, `7441161`, `605963`). The `initial_state_id` column records the system's entry state (`1336170`, `L137`, `21016225`, `12388`), while `state_count` indicates how many states the system currently holds (0, 3, 1, 0 in the sample). The `transition_relation_id` column stores a string identifier for the transition relation—here a mix of ISBN-like strings (`978-0-07-162442-8`) and UUIDs (`c74553ec-8fcc-11eb-924d-9cd76263cbd0`). The `valuation_function_id` column (`ChIJe0zpU4Bt5kcRC2Er6yFuxzs`, `4985162`, `5c6f01c708ff420a862fd80b80bd80dc`, `937741`) identifies the valuation function that interprets atoms in the system's state space. The `physical_atoms` and `sanction_atoms` columns hold the atomic propositions that are true in the system's current state and in sanction states, respectively (e.g., `legacy-physical-67` and `composite-sanction-87` in row 1). The foreign key `norm_id` ties the system to its governing norm.

**Table `states`**

| id | state_id | state_index | is_initial_state | satisfied_atoms | timestamp | physical_transition_system_id | transitions_to_state_id | norm_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1336177 | 11 | false | pilot-satisfie-92 | 2024-07-08T18:18:00 | 1 | 1 | 1 |
| 2 | 2839516 | 14 | true | extended-satisfie-93 | 2025-12-19T01:35:00 | 2 | 2 | 2 |
| 3 | 5844255 | 17 | false | integrated-satisfie-94 | 2022-05-03T08:52:00 | 3 | 3 | 3 |
| 4 | 325467 | 20 | true | seasonal-satisfie-95 | 2023-10-14T15:09:00 | 4 | 4 | 4 |

The `states` table materialises the state space of all systems. Its surrogate `id` (1–4) indexes rows, while `state_id` carries the ontology-level identifier (`1336177`, `2839516`, `5844255`, `325467`). The `state_index` column (`11`, `14`, `17`, `20`) provides a numeric ordering within a system. The boolean `is_initial_state` distinguishes entry states (`true` in rows 2 and 4) from intermediate or terminal states (`false` in rows 1 and 3). The `satisfied_atoms` column records which atoms hold in the state (`pilot-satisfie-92`, `extended-satisfie-93`, `integrated-satisfie-94`, `seasonal-satisfie-95`). The `timestamp` column (`2024-07-08T18:18:00`, `2025-12-19T01:35:00`, `2022-05-03T08:52:00`, `2023-10-14T15:09:00`) records when the state was observed or entered. The foreign keys `physical_transition_system_id` and `transitions_to_state_id` link the state to its host system and to the state it transitions into, while `norm_id` associates the state with its governing norm.

**Table `transitions`**

| transition_id | action_id | precondition | effect | state_id | terminates_at_state_id | physical_transition_system_id |
|---|---|---|---|---|---|---|
| BJewellGraham | 8250 | seasonal-precondi-83 | regional-effect-24 | 1 | 1 | 1 |
| 2106698 | 450 | regional-precondi-84 | legacy-effect-25 | 2 | 2 | 2 |
| state_uk_21 | 21005921 | legacy-precondi-85 | compact-effect-26 | 3 | 3 | 3 |
| 4332 | 1437589 | compact-precondi-86 | composite-effect-27 | 4 | 4 | 4 |

The `transitions` table encodes the dynamics of state evolution. Its primary key `transition_id` is a string identifier (`BJewellGraham`, `2106698`, `state_uk_21`, `4332`). The `action_id` column (`8250`, `450`, `21005921`, `1437589`) names the action that fires the transition. The `precondition` column (`seasonal-precondi-83`, `regional-precondi-84`, `legacy-precondi-85`, `compact-precondi-86`) specifies the guard that must hold for the transition to fire, and the `effect` column (`regional-effect-24`, `legacy-effect-25`, `compact-effect-26`, `composite-effect-27`) describes the state change. The `state_id` column indicates the source state, while `terminates_at_state_id` indicates the destination state. The foreign key `physical_transition_system_id` ties the transition to its host system.

**Table `norm_violations`**

| id | violation_id | violation_timestamp | violation_type | sanction_incurment | norm_id | state_id | sanction_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990166 | 2023-02-16T01:39:00 | deadline_missed | false | 1 | 1 | 1 |
| 2 | m16 | 2024-07-27T08:56:00 | condition_failed | true | 2 | 2 | 2 |
| 3 | 7731883 | 2025-12-11T15:13:00 | deadline_missed | false | 3 | 3 | 3 |
| 4 | 325461 | 2022-05-22T22:30:00 | condition_failed | true | 4 | 4 | 4 |

The `norm_violations` table records each breach of a normative constraint. Its surrogate `id` (1–4) indexes rows, while `violation_id` carries the domain identifier (`3990166`, `m16`, `7731883`, `325461`). The `violation_timestamp` column (`2023-02-16T01:39:00`, `2024-07-27T08:56:00`, `2025-12-11T15:13:00`, `2022-05-22T22:30:00`) records when the violation was detected. The `violation_type` column distinguishes `deadline_missed` (rows 1 and 3) from `condition_failed` (rows 2 and 4). The boolean `sanction_incurment` indicates whether a sanction was triggered (`false` in rows 1 and 3, `true` in rows 2 and 4). The foreign keys `norm_id`, `state_id`, and `sanction_id` link the violation to its governing norm, the state in which it occurred, and the sanction that may follow.

**Table `sanctions`**

| sanction_id | sanction_type | severity_level | is_regimented | norm_id | norm_violation_id | agent_id |
|---|---|---|---|---|---|---|
| 1 | baseline-sanction-79 | 29 | false | 1 | 1 | 1 |
| 2 | pilot-sanction-80 | 40 | true | 2 | 2 | 2 |
| 3 | extended-sanction-81 | 51 | false | 3 | 3 | 3 |
| 4 | integrated-sanction-82 | 62 | true | 4 | 4 | 4 |

The `sanctions` table captures the enforcement response to norm violations. Its surrogate `sanction_id` (1–4) indexes rows, while `sanction_type` (`baseline-sanction-79`, `pilot-sanction-80`, `extended-sanction-81`, `integrated-sanction-82`) names the sanction category. The `severity_level` column (`29`, `40`, `51`, `62`) encodes the intensity of the sanction on an ordinal scale. The boolean `is_regimented` indicates whether the sanction is actively enforced (`false` in rows 1 and 3, `true` in rows 2 and 4). The foreign keys `norm_id`, `norm_violation_id`, and `agent_id` link the sanction to its governing norm, the violation that triggered it, and the agent against whom it is levied.

**Table `agents`**

| id | agent_id | agent_type | current_sanction_count | max_allowed_sanctions | norm_id | transition_id | sanction_id |
|---|---|---|---|---|---|---|---|
| 1 | 3012833 | adaptive-agent-89 | 7 | 24 | 1 | BJewellGraham | 1 |
| 2 | lu_tax_code_template_b_VB-IC-12 | distributed-agent-90 | 21 | 34 | 2 | 2106698 | 2 |
| 3 | 9229dcd6-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-agent-91 | 15 | 44 | 3 | state_uk_21 | 3 |
| 4 | 4447004 | pilot-agent-92 | 21 | 54 | 4 | 4332 | 4 |

The `agents` table stores the entities—organisations, people, or products—that are subject to sanctions. Although the full column set is not enumerated in the sample, the table is linked to `sanctions` via `agent_id`, and the views `v_sanction_agent`, `v_agent_norm`, `v_agent_transition`, and `v_agent_sanction` reconstruct the agent's normative footprint by joining across the sanction, norm, transition, and sanction tables.

**Table `systems_states`**

| physical_transition_system_id | state_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `systems_states` table is a junction table that resolves the many-to-many relationship between physical transition systems and states. It materialises the `physical_transition_system_id` → `state_id` association that the `states` table also references directly, providing an explicit mapping layer that supports queries about which states belong to which systems without relying on the foreign key in `states` alone.

**Table `systems_transitions`**

| physical_transition_system_id | transition_id |
|---|---|
| 1 | BJewellGraham |
| 1 | 2106698 |
| 2 | 2106698 |
| 2 | state_uk_21 |
| 3 | state_uk_21 |
| 3 | 4332 |
| 4 | 4332 |
| 4 | BJewellGraham |

The `systems_transitions` table is the companion junction table for transitions. It resolves the many-to-many relationship between physical transition systems and transitions, mirroring the `physical_transition_system_id` foreign key in the `transitions` table and enabling queries that enumerate all transitions belonging to a given system.

**View `v_norm_physical_transition_system`**

```sql
CREATE VIEW v_norm_physical_transition_system AS
SELECT a.id, a.norm_id, a.norm_type, a.trigger_condition, b.physical_transition_system_id AS system_physical_transition_system_id, b.system_id AS system_system_id, b.initial_state_id AS system_initial_state_id
FROM norms a JOIN physical_transition_systems b ON a.physical_transition_system_id = b.physical_transition_system_id;
```

| id | norm_id | norm_type | trigger_condition | system_physical_transition_system_id | system_system_id | system_initial_state_id |
|---|---|---|---|---|---|---|
| 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation | legacy-trigger-49 | 1 | 8189503 | 1336170 |
| 2 | 13734000 | prohibition | compact-trigger-50 | 2 | 3717623 | L137 |
| 3 | 2933479 | obligation | composite-trigger-51 | 3 | 7441161 | 21016225 |
| 4 | 6564384 | prohibition | primary-trigger-52 | 4 | 605963 | 12388 |

This view joins `norms` to `physical_transition_systems` on `norm_id` to answer the question: which physical transition system is governed by which norm? Reading row 1, the norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (an obligation with trigger `legacy-trigger-49`) governs system `8189503`, whose initial state is `1336170` and whose physical atoms include `legacy-physical-67`. The view reconstructs this domain fact by pulling the norm's deontic attributes alongside the system's structural attributes into a single denormalised row.

**View `v_norm_norm_violation`**

```sql
CREATE VIEW v_norm_norm_violation AS
SELECT a.id, a.norm_id, a.norm_type, a.trigger_condition, b.id AS violation_id, b.violation_id AS violation_violation_id, b.violation_timestamp AS violation_violation_timestamp
FROM norms a JOIN norm_violations b ON a.norm_violation_id = b.id;
```

| id | norm_id | norm_type | trigger_condition | violation_id | violation_violation_id | violation_violation_timestamp |
|---|---|---|---|---|---|---|
| 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation | legacy-trigger-49 | 1 | 3990166 | 2023-02-16T01:39:00 |
| 2 | 13734000 | prohibition | compact-trigger-50 | 2 | m16 | 2024-07-27T08:56:00 |
| 3 | 2933479 | obligation | composite-trigger-51 | 3 | 7731883 | 2025-12-11T15:13:00 |
| 4 | 6564384 | prohibition | primary-trigger-52 | 4 | 325461 | 2022-05-22T22:30:00 |

This view joins `norms` to `norm_violations` on `norm_id` to answer: which violations have been recorded against which norms? Row 1 shows that norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` has an associated violation `3990166` of type `deadline_missed` recorded at `2023-02-16T01:39:00`, with `sanction_incurment` set to `false`. Row 2 links norm `13734000` (a prohibition) to violation `m16` of type `condition_failed` at `2024-07-27T08:56:00`, where `sanction_incurment` is `true`. The view enables auditors to trace from a norm's definition to its violation history.

**View `v_norm_sanction`**

```sql
CREATE VIEW v_norm_sanction AS
SELECT a.id, a.norm_id, a.norm_type, a.trigger_condition, b.sanction_id AS sanction_sanction_id, b.sanction_type AS sanction_sanction_type, b.severity_level AS sanction_severity_level
FROM norms a JOIN sanctions b ON a.sanction_id = b.sanction_id;
```

| id | norm_id | norm_type | trigger_condition | sanction_sanction_id | sanction_sanction_type | sanction_severity_level |
|---|---|---|---|---|---|---|
| 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation | legacy-trigger-49 | 1 | baseline-sanction-79 | 29 |
| 2 | 13734000 | prohibition | compact-trigger-50 | 2 | pilot-sanction-80 | 40 |
| 3 | 2933479 | obligation | composite-trigger-51 | 3 | extended-sanction-81 | 51 |
| 4 | 6564384 | prohibition | primary-trigger-52 | 4 | integrated-sanction-82 | 62 |

This view joins `norms` to `sanctions` on `norm_id` to answer: which sanctions are associated with which norms? Row 1 pairs norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` with sanction `baseline-sanction-79` at severity level `29`, which is not regimented. Row 4 pairs norm `6564384` (a prohibition) with sanction `integrated-sanction-82` at severity level `62`, which is regimented. The view materialises the deontic enforcement chain from norm definition through sanction specification.

**View `v_physical_transition_system_state_detail`**

```sql
CREATE VIEW v_physical_transition_system_state_detail AS
SELECT a.physical_transition_system_id, a.system_id, a.initial_state_id, b.id AS state_id, b.state_id AS state_state_id, b.state_index AS state_state_index
FROM physical_transition_systems a
  JOIN systems_states j ON j.physical_transition_system_id = a.physical_transition_system_id
  JOIN states b ON b.id = j.state_id;
```

| physical_transition_system_id | system_id | initial_state_id | state_id | state_state_id | state_state_index |
|---|---|---|---|---|---|
| 1 | 8189503 | 1336170 | 1 | 1336177 | 11 |
| 1 | 8189503 | 1336170 | 2 | 2839516 | 14 |
| 2 | 3717623 | L137 | 2 | 2839516 | 14 |
| 2 | 3717623 | L137 | 3 | 5844255 | 17 |
| 3 | 7441161 | 21016225 | 3 | 5844255 | 17 |
| 3 | 7441161 | 21016225 | 4 | 325467 | 20 |
| 4 | 605963 | 12388 | 4 | 325467 | 20 |
| 4 | 605963 | 12388 | 1 | 1336177 | 11 |

This view joins `physical_transition_systems` to `states` on `physical_transition_system_id` to answer: what states does each system contain, and what are their properties? Row 1 shows system `8189503` (initial state `1336170`) contains state `1336177` at index `11`, which is not an initial state, satisfies atom `pilot-satisfie-92`, and was observed at `2024-07-08T18:18:00`. Row 2 shows system `3717623` (initial state `L137`) contains state `2839516` at index `14`, which is an initial state, satisfies `extended-satisfie-93`, and was observed at `2025-12-19T01:35:00`. The view reconstructs the system-state relationship by denormalising the state's structural and temporal attributes alongside the system's identity.

**View `v_physical_transition_system_transition_detail`**

```sql
CREATE VIEW v_physical_transition_system_transition_detail AS
SELECT a.physical_transition_system_id, a.system_id, a.initial_state_id, b.transition_id AS transition_transition_id, b.action_id AS transition_action_id, b.precondition AS transition_precondition
FROM physical_transition_systems a
  JOIN systems_transitions j ON j.physical_transition_system_id = a.physical_transition_system_id
  JOIN transitions b ON b.transition_id = j.transition_id;
```

| physical_transition_system_id | system_id | initial_state_id | transition_transition_id | transition_action_id | transition_precondition |
|---|---|---|---|---|---|
| 1 | 8189503 | 1336170 | BJewellGraham | 8250 | seasonal-precondi-83 |
| 1 | 8189503 | 1336170 | 2106698 | 450 | regional-precondi-84 |
| 2 | 3717623 | L137 | 2106698 | 450 | regional-precondi-84 |
| 2 | 3717623 | L137 | state_uk_21 | 21005921 | legacy-precondi-85 |
| 3 | 7441161 | 21016225 | state_uk_21 | 21005921 | legacy-precondi-85 |
| 3 | 7441161 | 21016225 | 4332 | 1437589 | compact-precondi-86 |
| 4 | 605963 | 12388 | 4332 | 1437589 | compact-precondi-86 |
| 4 | 605963 | 12388 | BJewellGraham | 8250 | seasonal-precondi-83 |

This view joins `physical_transition_systems` to `transitions` on `physical_transition_system_id` to answer: what transitions does each system execute? Row 1 shows system `8189503` executes transition `BJewellGraham` (action `8250`) with precondition `seasonal-precondi-83` and effect `regional-effect-24`, moving from state `1` to state `1`. Row 3 shows system `7441161` executes transition `state_uk_21` (action `21005921`) with precondition `legacy-precondi-85` and effect `compact-effect-26`, moving from state `3` to state `3`. The view enables analysts to inspect the dynamics of each system in isolation.

**View `v_physical_transition_system_norm`**

```sql
CREATE VIEW v_physical_transition_system_norm AS
SELECT a.physical_transition_system_id, a.system_id, a.initial_state_id, a.state_count, b.id AS norm_id, b.norm_id AS norm_norm_id, b.norm_type AS norm_norm_type
FROM physical_transition_systems a JOIN norms b ON a.norm_id = b.id;
```

| physical_transition_system_id | system_id | initial_state_id | state_count | norm_id | norm_norm_id | norm_norm_type |
|---|---|---|---|---|---|---|
| 1 | 8189503 | 1336170 | 0 | 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation |
| 2 | 3717623 | L137 | 3 | 2 | 13734000 | prohibition |
| 3 | 7441161 | 21016225 | 1 | 3 | 2933479 | obligation |
| 4 | 605963 | 12388 | 0 | 4 | 6564384 | prohibition |

This view joins `physical_transition_systems` to `norms` on `norm_id` to answer: which norm governs each system? Row 1 shows system `8189503` is governed by norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0`, an obligation with trigger `legacy-trigger-49` and deadline `regional-deadline-30`, enforced via `enforcement` mode. Row 2 shows system `3717623` is governed by norm `13734000`, a prohibition with trigger `compact-trigger-50` and deadline `legacy-deadline-31`, enforced via `regimentation` mode. The view materialises the system-norm binding that is central to the ontology.

**View `v_state_physical_transition_system`**

```sql
CREATE VIEW v_state_physical_transition_system AS
SELECT a.id, a.state_id, a.state_index, a.is_initial_state, b.physical_transition_system_id AS system_physical_transition_system_id, b.system_id AS system_system_id, b.initial_state_id AS system_initial_state_id
FROM states a JOIN physical_transition_systems b ON a.physical_transition_system_id = b.physical_transition_system_id;
```

| id | state_id | state_index | is_initial_state | system_physical_transition_system_id | system_system_id | system_initial_state_id |
|---|---|---|---|---|---|---|
| 1 | 1336177 | 11 | false | 1 | 8189503 | 1336170 |
| 2 | 2839516 | 14 | true | 2 | 3717623 | L137 |
| 3 | 5844255 | 17 | false | 3 | 7441161 | 21016225 |
| 4 | 325467 | 20 | true | 4 | 605963 | 12388 |

This view joins `states` to `physical_transition_systems` on `physical_transition_system_id` to answer: which system does each state belong to? Row 1 shows state `1336177` (index `11`, not initial, satisfying `pilot-satisfie-92`) belongs to system `8189503` (initial state `1336170`). Row 4 shows state `325467` (index `20`, initial, satisfying `seasonal-satisfie-95`) belongs to system `605963` (initial state `12388`). The view reconstructs the state-to-system mapping from the normalised tables.

**View `v_state_state`**

```sql
CREATE VIEW v_state_state AS
SELECT a.id, a.state_id, a.state_index, a.is_initial_state, b.id AS state_id, b.state_id AS state_state_id, b.state_index AS state_state_index
FROM states a JOIN states b ON a.transitions_to_state_id = b.id;
```

| id | state_id | state_index | is_initial_state | state_id | state_state_id | state_state_index |
|---|---|---|---|---|---|---|
| 1 | 1336177 | 11 | false | 1 | 1336177 | 11 |
| 2 | 2839516 | 14 | true | 2 | 2839516 | 14 |
| 3 | 5844255 | 17 | false | 3 | 5844255 | 17 |
| 4 | 325467 | 20 | true | 4 | 325467 | 20 |

This view joins `states` to itself on `transitions_to_state_id` to answer: which state transitions to which other state? Row 1 shows state `1336177` transitions to state `1336177` (a self-loop), while row 2 shows state `2839516` transitions to state `2839516` (also a self-loop). The view materialises the state transition graph by denormalising the source and destination state identifiers into a single row.

**View `v_state_norm`**

```sql
CREATE VIEW v_state_norm AS
SELECT a.id, a.state_id, a.state_index, a.is_initial_state, b.id AS norm_id, b.norm_id AS norm_norm_id, b.norm_type AS norm_norm_type
FROM states a JOIN norms b ON a.norm_id = b.id;
```

| id | state_id | state_index | is_initial_state | norm_id | norm_norm_id | norm_norm_type |
|---|---|---|---|---|---|---|
| 1 | 1336177 | 11 | false | 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation |
| 2 | 2839516 | 14 | true | 2 | 13734000 | prohibition |
| 3 | 5844255 | 17 | false | 3 | 2933479 | obligation |
| 4 | 325467 | 20 | true | 4 | 6564384 | prohibition |

This view joins `states` to `norms` on `norm_id` to answer: which norm is associated with each state? Row 1 shows state `1336177` is associated with norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). Row 3 shows state `5844255` is associated with norm `2933479` (obligation, trigger `composite-trigger-51`). The view enables queries about the normative context of individual states.

**View `v_transition_state`**

```sql
CREATE VIEW v_transition_state AS
SELECT a.transition_id, a.action_id, a.precondition, a.effect, b.id AS state_id, b.state_id AS state_state_id, b.state_index AS state_state_index
FROM transitions a JOIN states b ON a.state_id = b.id;
```

| transition_id | action_id | precondition | effect | state_id | state_state_id | state_state_index |
|---|---|---|---|---|---|---|
| BJewellGraham | 8250 | seasonal-precondi-83 | regional-effect-24 | 1 | 1336177 | 11 |
| 2106698 | 450 | regional-precondi-84 | legacy-effect-25 | 2 | 2839516 | 14 |
| state_uk_21 | 21005921 | legacy-precondi-85 | compact-effect-26 | 3 | 5844255 | 17 |
| 4332 | 1437589 | compact-precondi-86 | composite-effect-27 | 4 | 325467 | 20 |

This view joins `transitions` to `states` on `state_id` to answer: which state is the source of each transition? Row 1 shows transition `BJewellGraham` originates from state `1`, while row 3 shows transition `state_uk_21` originates from state `3`. The view reconstructs the source-state attribute of transitions by pulling the state's structural properties alongside the transition's action and effect.

**View `v_transition_physical_transition_system`**

```sql
CREATE VIEW v_transition_physical_transition_system AS
SELECT a.transition_id, a.action_id, a.precondition, a.effect, b.physical_transition_system_id AS system_physical_transition_system_id, b.system_id AS system_system_id, b.initial_state_id AS system_initial_state_id
FROM transitions a JOIN physical_transition_systems b ON a.physical_transition_system_id = b.physical_transition_system_id;
```

| transition_id | action_id | precondition | effect | system_physical_transition_system_id | system_system_id | system_initial_state_id |
|---|---|---|---|---|---|---|
| BJewellGraham | 8250 | seasonal-precondi-83 | regional-effect-24 | 1 | 8189503 | 1336170 |
| 2106698 | 450 | regional-precondi-84 | legacy-effect-25 | 2 | 3717623 | L137 |
| state_uk_21 | 21005921 | legacy-precondi-85 | compact-effect-26 | 3 | 7441161 | 21016225 |
| 4332 | 1437589 | compact-precondi-86 | composite-effect-27 | 4 | 605963 | 12388 |

This view joins `transitions` to `physical_transition_systems` on `physical_transition_system_id` to answer: which system executes each transition? Row 1 shows transition `BJewellGraham` (action `8250`, precondition `seasonal-precondi-83`, effect `regional-effect-24`) is executed by system `8189503` (initial state `1336170`, physical atoms `legacy-physical-67`). Row 4 shows transition `4332` (action `1437589`, precondition `compact-precondi-86`, effect `composite-effect-27`) is executed by system `605963` (initial state `12388`, physical atoms `primary-physical-70`). The view materialises the transition-system binding.

**View `v_norm_violation_norm`**

```sql
CREATE VIEW v_norm_violation_norm AS
SELECT a.id, a.violation_id, a.violation_timestamp, a.violation_type, b.id AS norm_id, b.norm_id AS norm_norm_id, b.norm_type AS norm_norm_type
FROM norm_violations a JOIN norms b ON a.norm_id = b.id;
```

| id | violation_id | violation_timestamp | violation_type | norm_id | norm_norm_id | norm_norm_type |
|---|---|---|---|---|---|---|
| 1 | 3990166 | 2023-02-16T01:39:00 | deadline_missed | 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation |
| 2 | m16 | 2024-07-27T08:56:00 | condition_failed | 2 | 13734000 | prohibition |
| 3 | 7731883 | 2025-12-11T15:13:00 | deadline_missed | 3 | 2933479 | obligation |
| 4 | 325461 | 2022-05-22T22:30:00 | condition_failed | 4 | 6564384 | prohibition |

This view joins `norm_violations` to `norms` on `norm_id` to answer: which norm was violated in each violation record? Row 1 shows violation `3990166` (type `deadline_missed`, timestamp `2023-02-16T01:39:00`, no sanction incurred) was a violation of norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). Row 2 shows violation `m16` (type `condition_failed`, timestamp `2024-07-27T08:56:00`, sanction incurred) was a violation of norm `13734000` (prohibition, trigger `compact-trigger-50`). The view reconstructs the norm-violation linkage for audit trails.

**View `v_norm_violation_state`**

```sql
CREATE VIEW v_norm_violation_state AS
SELECT a.id, a.violation_id, a.violation_timestamp, a.violation_type, b.id AS state_id, b.state_id AS state_state_id, b.state_index AS state_state_index
FROM norm_violations a JOIN states b ON a.state_id = b.id;
```

| id | violation_id | violation_timestamp | violation_type | state_id | state_state_id | state_state_index |
|---|---|---|---|---|---|---|
| 1 | 3990166 | 2023-02-16T01:39:00 | deadline_missed | 1 | 1336177 | 11 |
| 2 | m16 | 2024-07-27T08:56:00 | condition_failed | 2 | 2839516 | 14 |
| 3 | 7731883 | 2025-12-11T15:13:00 | deadline_missed | 3 | 5844255 | 17 |
| 4 | 325461 | 2022-05-22T22:30:00 | condition_failed | 4 | 325467 | 20 |

This view joins `norm_violations` to `states` on `state_id` to answer: in which state did each violation occur? Row 1 shows violation `3990166` occurred in state `1336177` (index `11`, not initial, satisfying `pilot-satisfie-92`). Row 4 shows violation `325461` occurred in state `325467` (index `20`, initial, satisfying `seasonal-satisfie-95`). The view materialises the state-context of violations.

**View `v_norm_violation_sanction`**

```sql
CREATE VIEW v_norm_violation_sanction AS
SELECT a.id, a.violation_id, a.violation_timestamp, a.violation_type, b.sanction_id AS sanction_sanction_id, b.sanction_type AS sanction_sanction_type, b.severity_level AS sanction_severity_level
FROM norm_violations a JOIN sanctions b ON a.sanction_id = b.sanction_id;
```

| id | violation_id | violation_timestamp | violation_type | sanction_sanction_id | sanction_sanction_type | sanction_severity_level |
|---|---|---|---|---|---|---|
| 1 | 3990166 | 2023-02-16T01:39:00 | deadline_missed | 1 | baseline-sanction-79 | 29 |
| 2 | m16 | 2024-07-27T08:56:00 | condition_failed | 2 | pilot-sanction-80 | 40 |
| 3 | 7731883 | 2025-12-11T15:13:00 | deadline_missed | 3 | extended-sanction-81 | 51 |
| 4 | 325461 | 2022-05-22T22:30:00 | condition_failed | 4 | integrated-sanction-82 | 62 |

This view joins `norm_violations` to `sanctions` on `sanction_id` to answer: which sanction is associated with each violation? Row 1 shows violation `3990166` is associated with sanction `baseline-sanction-79` (severity `29`, not regimented), though `sanction_incurment` is `false`. Row 2 shows violation `m16` is associated with sanction `pilot-sanction-80` (severity `40`, regimented), and `sanction_incurment` is `true`. The view enables analysts to trace from violation to the sanction that may or may not have been applied.

**View `v_sanction_norm`**

```sql
CREATE VIEW v_sanction_norm AS
SELECT a.sanction_id, a.sanction_type, a.severity_level, a.is_regimented, b.id AS norm_id, b.norm_id AS norm_norm_id, b.norm_type AS norm_norm_type
FROM sanctions a JOIN norms b ON a.norm_id = b.id;
```

| sanction_id | sanction_type | severity_level | is_regimented | norm_id | norm_norm_id | norm_norm_type |
|---|---|---|---|---|---|---|
| 1 | baseline-sanction-79 | 29 | false | 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation |
| 2 | pilot-sanction-80 | 40 | true | 2 | 13734000 | prohibition |
| 3 | extended-sanction-81 | 51 | false | 3 | 2933479 | obligation |
| 4 | integrated-sanction-82 | 62 | true | 4 | 6564384 | prohibition |

This view joins `sanctions` to `norms` on `norm_id` to answer: which norm does each sanction enforce? Row 1 shows sanction `baseline-sanction-79` (severity `29`, not regimented) enforces norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). Row 4 shows sanction `integrated-sanction-82` (severity `62`, regimented) enforces norm `6564384` (prohibition, trigger `primary-trigger-52`). The view materialises the sanction-norm binding.

**View `v_sanction_norm_violation`**

```sql
CREATE VIEW v_sanction_norm_violation AS
SELECT a.sanction_id, a.sanction_type, a.severity_level, a.is_regimented, b.id AS violation_id, b.violation_id AS violation_violation_id, b.violation_timestamp AS violation_violation_timestamp
FROM sanctions a JOIN norm_violations b ON a.norm_violation_id = b.id;
```

| sanction_id | sanction_type | severity_level | is_regimented | violation_id | violation_violation_id | violation_violation_timestamp |
|---|---|---|---|---|---|---|
| 1 | baseline-sanction-79 | 29 | false | 1 | 3990166 | 2023-02-16T01:39:00 |
| 2 | pilot-sanction-80 | 40 | true | 2 | m16 | 2024-07-27T08:56:00 |
| 3 | extended-sanction-81 | 51 | false | 3 | 7731883 | 2025-12-11T15:13:00 |
| 4 | integrated-sanction-82 | 62 | true | 4 | 325461 | 2022-05-22T22:30:00 |

This view joins `sanctions` to `norm_violations` on `norm_violation_id` to answer: which violation triggered each sanction? Row 1 shows sanction `baseline-sanction-79` was triggered by violation `3990166` (type `deadline_missed`, timestamp `2023-02-16T01:39:00`). Row 4 shows sanction `integrated-sanction-82` was triggered by violation `325461` (type `condition_failed`, timestamp `2022-05-22T22:30:00`). The view reconstructs the violation-to-sanction causal chain.

**View `v_sanction_agent`**

```sql
CREATE VIEW v_sanction_agent AS
SELECT a.sanction_id, a.sanction_type, a.severity_level, a.is_regimented, b.id AS agent_id, b.agent_id AS agent_agent_id, b.agent_type AS agent_agent_type
FROM sanctions a JOIN agents b ON a.agent_id = b.id;
```

| sanction_id | sanction_type | severity_level | is_regimented | agent_id | agent_agent_id | agent_agent_type |
|---|---|---|---|---|---|---|
| 1 | baseline-sanction-79 | 29 | false | 1 | 3012833 | adaptive-agent-89 |
| 2 | pilot-sanction-80 | 40 | true | 2 | lu_tax_code_template_b_VB-IC-12 | distributed-agent-90 |
| 3 | extended-sanction-81 | 51 | false | 3 | 9229dcd6-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-agent-91 |
| 4 | integrated-sanction-82 | 62 | true | 4 | 4447004 | pilot-agent-92 |

This view joins `sanctions` to `agents` on `agent_id` to answer: which agent is subject to each sanction? Row 1 shows sanction `baseline-sanction-79` (severity `29`, not regimented) is levied against agent `1`. Row 4 shows sanction `integrated-sanction-82` (severity `62`, regimented) is levied against agent `4`. The view materialises the agent-sanction relationship for accountability queries.

**View `v_agent_norm`**

```sql
CREATE VIEW v_agent_norm AS
SELECT a.id, a.agent_id, a.agent_type, a.current_sanction_count, b.id AS norm_id, b.norm_id AS norm_norm_id, b.norm_type AS norm_norm_type
FROM agents a JOIN norms b ON a.norm_id = b.id;
```

| id | agent_id | agent_type | current_sanction_count | norm_id | norm_norm_id | norm_norm_type |
|---|---|---|---|---|---|---|
| 1 | 3012833 | adaptive-agent-89 | 7 | 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation |
| 2 | lu_tax_code_template_b_VB-IC-12 | distributed-agent-90 | 21 | 2 | 13734000 | prohibition |
| 3 | 9229dcd6-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-agent-91 | 15 | 3 | 2933479 | obligation |
| 4 | 4447004 | pilot-agent-92 | 21 | 4 | 6564384 | prohibition |

This view joins `agents` to `norms` via the `sanctions` table to answer: which norms are enforced against which agents? Row 1 shows agent `1` is subject to sanction `baseline-sanction-79` (severity `29`) which enforces norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation). Row 2 shows agent `2` is subject to sanction `pilot-sanction-80` (severity `40`, regimented) which enforces norm `13734000` (prohibition). The view reconstructs the agent-norm accountability chain through the sanction intermediary.

**View `v_agent_transition`**

```sql
CREATE VIEW v_agent_transition AS
SELECT a.id, a.agent_id, a.agent_type, a.current_sanction_count, b.transition_id AS transition_transition_id, b.action_id AS transition_action_id, b.precondition AS transition_precondition
FROM agents a JOIN transitions b ON a.transition_id = b.transition_id;
```

| id | agent_id | agent_type | current_sanction_count | transition_transition_id | transition_action_id | transition_precondition |
|---|---|---|---|---|---|---|
| 1 | 3012833 | adaptive-agent-89 | 7 | BJewellGraham | 8250 | seasonal-precondi-83 |
| 2 | lu_tax_code_template_b_VB-IC-12 | distributed-agent-90 | 21 | 2106698 | 450 | regional-precondi-84 |
| 3 | 9229dcd6-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-agent-91 | 15 | state_uk_21 | 21005921 | legacy-precondi-85 |
| 4 | 4447004 | pilot-agent-92 | 21 | 4332 | 1437589 | compact-precondi-86 |

This view joins `agents` to `transitions` via the `sanctions` and `physical_transition_systems` tables to answer: which transitions are executed by systems whose agents are subject to sanctions? Row 1 shows agent `1` (subject to sanction `baseline-sanction-79`) is linked to system `8189503`, which executes transition `BJewellGraham` (action `8250`, precondition `seasonal-precondi-83`). Row 4 shows agent `4` (subject to sanction `integrated-sanction-82`) is linked to system `605963`, which executes transition `4332` (action `1437589`, precondition `compact-precondi-86`). The view materialises the agent-transition accountability path.

**View `v_agent_sanction`**

```sql
CREATE VIEW v_agent_sanction AS
SELECT a.id, a.agent_id, a.agent_type, a.current_sanction_count, b.sanction_id AS sanction_sanction_id, b.sanction_type AS sanction_sanction_type, b.severity_level AS sanction_severity_level
FROM agents a JOIN sanctions b ON a.sanction_id = b.sanction_id;
```

| id | agent_id | agent_type | current_sanction_count | sanction_sanction_id | sanction_sanction_type | sanction_severity_level |
|---|---|---|---|---|---|---|
| 1 | 3012833 | adaptive-agent-89 | 7 | 1 | baseline-sanction-79 | 29 |
| 2 | lu_tax_code_template_b_VB-IC-12 | distributed-agent-90 | 21 | 2 | pilot-sanction-80 | 40 |
| 3 | 9229dcd6-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-agent-91 | 15 | 3 | extended-sanction-81 | 51 |
| 4 | 4447004 | pilot-agent-92 | 21 | 4 | integrated-sanction-82 | 62 |

This view joins `agents` to `sanctions` on `agent_id` to answer: which sanctions are levied against which agents? Row 1 shows agent `1` is subject to sanction `baseline-sanction-79` (severity `29`, not regimented). Row 4 shows agent `4` is subject to sanction `integrated-sanction-82` (severity `62`, regimented). The view reconstructs the agent-sanction mapping for compliance reporting.

### Closing Synthesis

The relational schema materialises the physical transition system ontology through a disciplined decomposition: nine base tables enforce normalisation, while twenty views reconstruct domain facts via controlled joins. The base tables separate concerns—`norms` captures deontic structure, `physical_transition_systems` captures system identity, `states` captures the state space, `transitions` captures dynamics, `norm_violations` captures breaches, `sanctions` captures enforcement, and `agents` captures accountability. The junction tables `systems_states` and `systems_transitions` provide explicit many-to-many resolution layers. Each view answers a specific analytical question by joining two or more base tables: `v_norm_physical_transition_system` links norms to systems, `v_norm_norm_violation` links norms to violations, `v_sanction_agent` links sanctions to agents, and so on. The foreign keys—`physical_transition_system_id` in `norms`, `states`, and `transitions`; `norm_id` in `physical_transition_systems`, `states`, `norm_violations`, and `sanctions`; `agent_id` in `sanctions`—form the skeleton of the schema, and the views are the flesh that makes the skeleton readable. Together, they provide a complete, queryable materialisation of the ontology.