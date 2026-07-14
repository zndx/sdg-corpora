## Normative Governance of Physical Transition Systems

Energy infrastructure, industrial processes, and environmental management systems all share a common structural challenge: they must operate within boundaries set by external regulations while progressing through discrete operational states. A physical transition system captures this reality by modeling a system as a sequence of states connected by transitions, where each transition is governed by normative constraints. When those constraints are breached, violations are recorded and sanctions are applied to the responsible agents. This chapter documents the data model that supports this governance framework, showing how norms, states, transitions, violations, and sanctions interlock to form a complete audit trail of regulatory compliance.

## The Normative Layer

At the foundation of the model lies the concept of a norm—a rule that prescribes or prohibits behavior within a physical transition system. Norms carry a type, a trigger condition that activates them, a deadline condition that defines their temporal scope, and an enforcement mode that determines how strictly they are applied. Each norm is also associated with a sanction type, a physical transition system, and, when relevant, a recorded violation and an applied sanction.

**Table `norms`**

| id | norm_id | norm_type | trigger_condition | deadline_condition | enforcement_mode | sanction_type | physical_transition_system_id | norm_violation_id | sanction_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | obligation | legacy-trigger-49 | regional-deadline-30 | enforcement | baseline-sanction-79 | 1 | 1 | 1 |
| 2 | 13734000 | prohibition | compact-trigger-50 | legacy-deadline-31 | regimentation | pilot-sanction-80 | 2 | 2 | 2 |
| 3 | 2933479 | obligation | composite-trigger-51 | compact-deadline-32 | enforcement | extended-sanction-81 | 3 | 3 | 3 |
| 4 | 6564384 | prohibition | primary-trigger-52 | composite-deadline-33 | regimentation | integrated-sanction-82 | 4 | 4 | 4 |

The first norm, identified by the UUID `eff2857c-8fcb-11eb-924d-9cd76263cbd0`, is an obligation triggered by `legacy-trigger-49` and bounded by `regional-deadline-30`. It operates under an enforcement mode and carries the sanction type `baseline-sanction-79`. It is linked to physical transition system `1`, norm violation `1`, and sanction `1`. The second norm, with identifier `13734000`, is a prohibition activated by `compact-trigger-50` and constrained by `legacy-deadline-31`. It uses regimentation as its enforcement mode and is paired with `pilot-sanction-80`. The third and fourth norms follow the same pattern: an obligation with `composite-trigger-51` and `regional-deadline-32` under enforcement, and a prohibition with `primary-trigger-52` and `composite-deadline-33` under regimentation, each carrying their own sanction types and system associations.

Norm types fall into two categories: obligations, which require the system to achieve a certain condition, and prohibitions, which forbid specific actions. The trigger conditions—`legacy-trigger-49`, `compact-trigger-50`, `composite-trigger-51`, and `primary-trigger-52`—serve as the events or state predicates that activate the norm. The deadline conditions—`regional-deadline-30`, `legacy-deadline-31`, `compact-deadline-32`, and `composite-deadline-33`—establish the temporal window within which compliance must be demonstrated. Enforcement modes distinguish between `enforcement`, which applies standard regulatory pressure, and `regimentation`, which imposes stricter, more structured oversight.

## Physical Transition Systems

A physical transition system is the operational entity that the norms govern. Each system has a unique identifier, an initial state, a count of states it traverses, a transition relation that defines how states connect, and valuation functions for both physical and sanction atoms. The system is also linked to a specific norm.

**Table `physical_transition_systems`**

| physical_transition_system_id | system_id | initial_state_id | state_count | transition_relation_id | valuation_function_id | physical_atoms | sanction_atoms | norm_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | 1336170 | 0 | 978-0-07-162442-8 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | legacy-physical-67 | composite-sanction-87 | 1 |
| 2 | 3717623 | L137 | 3 | 10238260 | 4985162 | compact-physical-68 | primary-sanction-88 | 2 |
| 3 | 7441161 | 21016225 | 1 | 2839507 | 5c6f01c708ff420a862fd80b80bd80dc | composite-physical-69 | adaptive-sanction-89 | 3 |
| 4 | 605963 | 12388 | 0 | c74553ec-8fcc-11eb-924d-9cd76263cbd0 | 937741 | primary-physical-70 | distributed-sanction-90 | 4 |

System `1` begins at state `1336170`, has zero recorded states in its current snapshot, and uses the transition relation `978-0-07-162442-8`. Its valuation function is `ChIJe0zpU4Bt5kcRC2Er6yFuxzs`, with physical atoms labeled `legacy-physical-67` and sanction atoms labeled `composite-sanction-87`. It is governed by norm `1`. System `2`, identified by `3717623`, starts at state `L137`, has three states, and uses transition relation `10238260` with valuation `4985162`. Its physical atoms are `compact-physical-68` and sanction atoms are `primary-sanction-88`, under norm `2`. System `3` (`7441161`) begins at `21016225`, has one state, and uses transition relation `2839507` with valuation `5c6f01c708ff420a862fd80b80bd80dc`, physical atoms `composite-physical-69`, and sanction atoms `adaptive-sanction-89`, under norm `3`. System `4` (`605963`) starts at `12388`, has zero states, uses transition relation `c74553ec-8fcc-11eb-924d-9cd76263cbd0` with valuation `937741`, physical atoms `primary-physical-70`, and sanction atoms `distributed-sanction-90`, under norm `4`.

The transition relation identifiers—ranging from ISBN-style strings like `978-0-07-162442-8` to UUIDs like `c74553ec-8fcc-11eb-924d-9cd76263cbd0`—serve as references to the formal rules that govern state changes. The valuation functions—such as `ChIJe0zpU4Bt5kcRC2Er6yFuxzs` and `5c6f01c708ff420a862fd80b80bd80dc`—encode the mapping from system conditions to truth values for the atoms that appear in norms and transitions.

## States and Transitions

States represent the discrete conditions a physical transition system occupies at a given moment. Each state has an index, a flag indicating whether it is the initial state, a set of satisfied atoms, a timestamp, and links to the physical transition system it belongs to, the state it transitions to, and the norm it satisfies.

**Table `states`**

| id | state_id | state_index | is_initial_state | satisfied_atoms | timestamp | physical_transition_system_id | transitions_to_state_id | norm_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1336177 | 11 | false | pilot-satisfie-92 | 2024-07-08T18:18:00 | 1 | 1 | 1 |
| 2 | 2839516 | 14 | true | extended-satisfie-93 | 2025-12-19T01:35:00 | 2 | 2 | 2 |
| 3 | 5844255 | 17 | false | integrated-satisfie-94 | 2022-05-03T08:52:00 | 3 | 3 | 3 |
| 4 | 325467 | 20 | true | seasonal-satisfie-95 | 2023-10-14T15:09:00 | 4 | 4 | 4 |

State `1` (identifier `1336177`) is not an initial state, carries index `11`, satisfies `pilot-satisfie-92`, and is timestamped `2024-07-08T18:18:00`. It belongs to physical transition system `1`, transitions to state `1`, and satisfies norm `1`. State `2` (identifier `2839516`) is an initial state with index `14`, satisfies `extended-satisfie-93`, and is timestamped `2025-12-19T01:35:00`. It belongs to system `2`, transitions to state `2`, and satisfies norm `2`. State `3` (identifier `5844255`) is not initial, has index `17`, satisfies `integrated-satisfie-94`, and is timestamped `2022-05-03T08:52:00`, under system `3` and norm `3`. State `4` (identifier `325467`) is an initial state with index `20`, satisfies `seasonal-satisfie-95`, and is timestamped `2023-10-14T15:09:00`, under system `4` and norm `4`.

Transitions represent the actions that move a system from one state to another. Each transition has an action identifier, a precondition that must hold before the transition, an effect that describes the outcome, and links to the source state, the terminating state, and the physical transition system.

**Table `transitions`**

| transition_id | action_id | precondition | effect | state_id | terminates_at_state_id | physical_transition_system_id |
|---|---|---|---|---|---|---|
| BJewellGraham | 8250 | seasonal-precondi-83 | regional-effect-24 | 1 | 1 | 1 |
| 2106698 | 450 | regional-precondi-84 | legacy-effect-25 | 2 | 2 | 2 |
| state_uk_21 | 21005921 | legacy-precondi-85 | compact-effect-26 | 3 | 3 | 3 |
| 4332 | 1437589 | compact-precondi-86 | composite-effect-27 | 4 | 4 | 4 |

Transition `BJewellGraham` (action `8250`) has precondition `seasonal-precondi-83` and effect `regional-effect-24`. It originates from state `1`, terminates at state `1`, and belongs to physical transition system `1`. Transition `2106698` (action `450`) has precondition `regional-precondi-84` and effect `legacy-effect-25`, moving from state `2` to state `2` within system `2`. Transition `state_uk_21` (action `21005921`) has precondition `legacy-precondi-85` and effect `compact-effect-26`, operating between state `3` and state `3` in system `3`. Transition `4332` (action `1437589`) has precondition `compact-precondi-86` and effect `composite-effect-27`, operating between state `4` and state `4` in system `4`.

The preconditions—`seasonal-precondi-83`, `regional-precondi-84`, `legacy-precondi-85`, and `compact-precondi-86`—define the conditions that must be met before a transition can execute. The effects—`regional-effect-24`, `legacy-effect-25`, `compact-effect-26`, and `composite-effect-27`—describe the resulting state changes. The action identifiers range from human-readable names like `BJewellGraham` and `state_uk_21` to numeric codes like `8250` and `4332`.

## Violations and Sanctions

When a norm is breached, a violation is recorded. Each violation has a unique identifier, a timestamp, a type (such as `deadline_missed` or `condition_failed`), a flag indicating whether a sanction is incurred, and links to the norm violated, the state at the time of violation, and the sanction applied.

**Table `norm_violations`**

| id | violation_id | violation_timestamp | violation_type | sanction_incurment | norm_id | state_id | sanction_id |
|---|---|---|---|---|---|---|---|
| 1 | 3990166 | 2023-02-16T01:39:00 | deadline_missed | false | 1 | 1 | 1 |
| 2 | m16 | 2024-07-27T08:56:00 | condition_failed | true | 2 | 2 | 2 |
| 3 | 7731883 | 2025-12-11T15:13:00 | deadline_missed | false | 3 | 3 | 3 |
| 4 | 325461 | 2022-05-22T22:30:00 | condition_failed | true | 4 | 4 | 4 |

Violation `1` (identifier `3990166`) occurred at `2023-02-16T01:39:00` as a `deadline_missed` event. No sanction was incurred (`false`), and it is linked to norm `1`, state `1`, and sanction `1`. Violation `2` (identifier `m16`) occurred at `2024-07-27T08:56:00` as a `condition_failed` event. A sanction was incurred (`true`), and it is linked to norm `2`, state `2`, and sanction `2`. Violation `3` (identifier `7731883`) occurred at `2025-12-11T15:13:00` as a `deadline_missed` with no sanction incurred, under norm `3`, state `3`, and sanction `3`. Violation `4` (identifier `325461`) occurred at `2022-05-22T22:30:00` as a `condition_failed` with a sanction incurred, under norm `4`, state `4`, and sanction `4`.

Sanctions are the enforcement mechanisms applied when violations occur. Each sanction has a type, a severity level, a flag indicating whether it is regimented, and links to the norm, the violation, and the responsible agent.

**Table `sanctions`**

| sanction_id | sanction_type | severity_level | is_regimented | norm_id | norm_violation_id | agent_id |
|---|---|---|---|---|---|---|
| 1 | baseline-sanction-79 | 29 | false | 1 | 1 | 1 |
| 2 | pilot-sanction-80 | 40 | true | 2 | 2 | 2 |
| 3 | extended-sanction-81 | 51 | false | 3 | 3 | 3 |
| 4 | integrated-sanction-82 | 62 | true | 4 | 4 | 4 |

Sanction `1` is of type `baseline-sanction-79` with severity level `29`, is not regimented, and is linked to norm `1`, violation `1`, and agent `1`. Sanction `2` is of type `pilot-sanction-80` with severity level `40`, is regimented, and is linked to norm `2`, violation `2`, and agent `2`. Sanction `3` is of type `extended-sanction-81` with severity level `51`, is not regimented, and is linked to norm `3`, violation `3`, and agent `3`. Sanction `4` is of type `integrated-sanction-82` with severity level `62`, is regimented, and is linked to norm `4`, violation `4`, and agent `4`.

Severity levels range from `29` to `62`, reflecting the increasing seriousness of the infractions. Regimented sanctions (`true` for sanctions `2` and `4`) indicate that the enforcement follows a structured, rule-based procedure, while non-regimented sanctions (`false` for sanctions `1` and `3`) allow for more discretionary application.

## Agents

Agents are the entities—organizations, personnel, or automated systems—held accountable under the sanction framework. Each agent is linked to the sanctions they incur.

**Table `agents`**

| id | agent_id | agent_type | current_sanction_count | max_allowed_sanctions | norm_id | transition_id | sanction_id |
|---|---|---|---|---|---|---|---|
| 1 | 3012833 | adaptive-agent-89 | 7 | 24 | 1 | BJewellGraham | 1 |
| 2 | lu_tax_code_template_b_VB-IC-12 | distributed-agent-90 | 21 | 34 | 2 | 2106698 | 2 |
| 3 | 9229dcd6-9bad-11eb-a8a2-19ed5c03f8d3 | baseline-agent-91 | 15 | 44 | 3 | state_uk_21 | 3 |
| 4 | 4447004 | pilot-agent-92 | 21 | 54 | 4 | 4332 | 4 |

Agent `1` is associated with sanction `1` (baseline-sanction-79, severity `29`). Agent `2` is associated with sanction `2` (pilot-sanction-80, severity `40`). Agent `3` is associated with sanction `3` (extended-sanction-81, severity `51`). Agent `4` is associated with sanction `4` (integrated-sanction-82, severity `62`). The agent identifiers are simple integers, but in production systems they would typically reference organizational units or individual operators.

## System-State and System-Transition Associations

The model uses associative tables to link physical transition systems to their constituent states and transitions, enabling many-to-many relationships where a system may share states or transitions with other systems, or a state or transition may be referenced by multiple systems.

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

These associative tables provide the structural backbone for the views that follow, allowing queries to traverse from systems to their states and transitions and back again.

## Joined Views: Interpreting the Relationships

The views in this model synthesize data from multiple base tables to answer specific operational questions. Each view joins related entities to produce a comprehensive record that captures the full context of a norm, a state, a transition, a violation, a sanction, or an agent.

The view `v_norm_physical_transition_system` answers the question: which physical transition systems are governed by which norms? It joins the norms table with the physical transition systems table on their shared identifier.

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

In this view, norm `eff2857c-8fcb-11eb-924d-924d-9cd76263cbd0` (an obligation with trigger `legacy-trigger-49`) is joined with physical transition system `1` (starting at state `1336170`, with valuation `ChIJe0zpU4Bt5kcRC2Er6yFuxzs`). The second row pairs norm `13734000` (a prohibition with trigger `compact-trigger-50`) with system `2` (starting at state `L137`, with valuation `4985162`). This join is the primary lens through which compliance auditors determine which systems fall under which regulatory requirements.

The view `v_norm_norm_violation` links norms to their recorded violations, answering: for each norm, what violations have been documented?

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

Here, norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` is joined with violation `3990166` (a `deadline_missed` at `2023-02-16T01:39:00` with no sanction incurred). The second row pairs norm `13734000` with violation `m16` (a `condition_failed` at `2024-07-27T08:56:00` with a sanction incurred). This view enables tracking of violation frequency and patterns across norms.

The view `v_norm_sanction` connects norms to their sanctions, answering: what sanctions are associated with each norm?

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

Norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` is joined with sanction `baseline-sanction-79` (severity `29`, not regimented). Norm `13734000` is joined with sanction `pilot-sanction-80` (severity `40`, regimented). This view is essential for understanding the enforcement posture of each norm.

The view `v_physical_transition_system_state_detail` provides a detailed record of each state within a physical transition system, joining the systems table with the states table.

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

Physical transition system `1` (valuation `ChIJe0zpU4Bt5kcRC2Er6yFuxzs`) is joined with state `1336177` (index `11`, not initial, satisfying `pilot-satisfie-92`, timestamped `2024-07-08T18:18:00`). System `2` (valuation `4985162`) is joined with state `2839516` (index `14`, initial, satisfying `extended-satisfie-93`, timestamped `2025-12-19T01:35:00`). This view supports state-level auditing of system behavior.

The view `v_physical_transition_system_transition_detail` joins physical transition systems with their transitions, answering: which transitions belong to which systems?

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

System `1` (valuation `ChIJe0zpU4Bt5kcRC2Er6yFuxzs`) is joined with transition `BJewellGraham` (action `8250`, precondition `seasonal-precondi-83`, effect `regional-effect-24`). System `2` (valuation `4985162`) is joined with transition `2106698` (action `450`, precondition `regional-precondi-84`, effect `legacy-effect-25`). This view is used to trace the operational history of each system.

The view `v_physical_transition_system_norm` links physical transition systems directly to their governing norms, providing a compact view of system-norm relationships.

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

System `1` (initial state `1336170`, physical atoms `legacy-physical-67`) is joined with norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`, enforcement mode `enforcement`). System `2` (initial state `L137`, physical atoms `compact-physical-68`) is joined with norm `13734000` (prohibition, trigger `compact-trigger-50`, enforcement mode `regimentation`). This view is the operational counterpart to `v_norm_physical_transition_system`, oriented from the system side.

The view `v_state_physical_transition_system` joins states with their parent physical transition systems, answering: which system does each state belong to?

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

State `1336177` (index `11`, not initial, satisfying `pilot-satisfie-92`) is joined with physical transition system `1` (initial state `1336170`, physical atoms `legacy-physical-67`). State `2839516` (index `14`, initial, satisfying `extended-satisfie-93`) is joined with system `2` (initial state `L137`, physical atoms `compact-physical-68`). This view supports state-centric queries about system membership.

The view `v_state_state` provides a self-referential join on states, enabling analysis of state-to-state relationships such as transitions and dependencies.

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

State `1336177` (index `11`, satisfying `pilot-satisfie-92`) is joined with itself in the context of its transition relationship to state `1`. State `2839516` (index `14`, satisfying `extended-satisfie-93`) is similarly joined with state `2`. This view is useful for analyzing the internal state graph of a system.

The view `v_state_norm` links states to their governing norms, answering: which norm does each state satisfy?

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

State `1336177` (index `11`, satisfying `pilot-satisfie-92`) is joined with norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). State `2839516` (index `14`, satisfying `extended-satisfie-93`) is joined with norm `13734000` (prohibition, trigger `compact-trigger-50`). This view is critical for compliance verification at the state level.

The view `v_transition_state` joins transitions with their source states, answering: from which state does each transition originate?

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

Transition `BJewellGraham` (action `8250`, precondition `seasonal-precondi-83`, effect `regional-effect-24`) is joined with state `1336177` (index `11`, satisfying `pilot-satisfie-92`). Transition `2106698` (action `450`, precondition `regional-precondi-84`, effect `legacy-effect-25`) is joined with state `2839516` (index `14`, satisfying `extended-satisfie-93`). This view supports transition-level auditing.

The view `v_transition_physical_transition_system` joins transitions with their parent physical transition systems, answering: which system does each transition belong to?

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

Transition `BJewellGraham` (action `8250`, precondition `seasonal-precondi-83`, effect `regional-effect-24`) is joined with physical transition system `1` (initial state `1336170`, physical atoms `legacy-physical-67`). Transition `2106698` (action `450`, precondition `regional-precondi-84`, effect `legacy-effect-25`) is joined with system `2` (initial state `L137`, physical atoms `compact-physical-68`). This view is used to trace the operational lineage of each transition.

The view `v_norm_violation_norm` links norm violations to their governing norms, answering: which norm was violated in each recorded violation?

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

Violation `3990166` (type `deadline_missed`, timestamp `2023-02-16T01:39:00`, no sanction incurred) is joined with norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). Violation `m16` (type `condition_failed`, timestamp `2024-07-27T08:56:00`, sanction incurred) is joined with norm `13734000` (prohibition, trigger `compact-trigger-50`). This view is essential for violation attribution.

The view `v_norm_violation_state` joins violations with the states at which they occurred, answering: in which state did each violation take place?

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

Violation `3990166` (type `deadline_missed`, no sanction incurred) is joined with state `1336177` (index `11`, satisfying `pilot-satisfie-92`). Violation `m16` (type `condition_failed`, sanction incurred) is joined with state `2839516` (index `14`, satisfying `extended-satisfie-93`). This view provides temporal and state context for violations.

The view `v_norm_violation_sanction` links violations to their sanctions, answering: what sanction was applied for each violation?

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

Violation `3990166` (type `deadline_missed`, no sanction incurred) is joined with sanction `baseline-sanction-79` (severity `29`, not regimented). Violation `m16` (type `condition_failed`, sanction incurred) is joined with sanction `pilot-sanction-80` (severity `40`, regimented). This view is used to analyze the enforcement response to violations.

The view `v_sanction_norm` joins sanctions with their governing norms, answering: which norm does each sanction enforce?

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

Sanction `baseline-sanction-79` (severity `29`, not regimented) is joined with norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). Sanction `pilot-sanction-80` (severity `40`, regimented) is joined with norm `13734000` (prohibition, trigger `compact-trigger-50`). This view supports sanction-level compliance analysis.

The view `v_sanction_norm_violation` links sanctions to their originating violations, answering: which violation triggered each sanction?

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

Sanction `baseline-sanction-79` (severity `29`, not regimented) is joined with violation `3990166` (type `deadline_missed`, no sanction incurred). Sanction `pilot-sanction-80` (severity `40`, regimented) is joined with violation `m16` (type `condition_failed`, sanction incurred). This view traces the causal chain from violation to enforcement.

The view `v_sanction_agent` joins sanctions with the agents responsible for them, answering: which agent is subject to each sanction?

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

Sanction `baseline-sanction-79` (severity `29`, not regimented) is joined with agent `1`. Sanction `pilot-sanction-80` (severity `40`, regimented) is joined with agent `2`. This view is the primary tool for accountability tracking.

The view `v_agent_norm` links agents to the norms they are subject to, answering: which norms govern each agent?

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

Agent `1` is joined with norm `eff2857c-8fcb-11eb-924d-9cd76263cbd0` (obligation, trigger `legacy-trigger-49`). Agent `2` is joined with norm `13734000` (prohibition, trigger `compact-trigger-50`). This view supports agent-centric compliance reviews.

The view `v_agent_transition` joins agents with the transitions they oversee or execute, answering: which transitions are associated with each agent?

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

Agent `1` is joined with transition `BJewellGraham` (action `8250`, precondition `seasonal-precondi-83`, effect `regional-effect-24`). Agent `2` is joined with transition `2106698` (action `450`, precondition `regional-precondi-84`, effect `legacy-effect-25`). This view is used for operational accountability.

The view `v_agent_sanction` joins agents with the sanctions they incur, answering: what sanctions has each agent received?

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

Agent `1` is joined with sanction `baseline-sanction-79` (severity `29`, not regimented). Agent `2` is joined with sanction `pilot-sanction-80` (severity `40`, regimented). This view provides a complete picture of an agent's enforcement history.

## Synthesis

The data model presented here captures the full lifecycle of normative governance in physical transition systems. Norms define the rules; physical transition systems are the entities governed by those rules; states and transitions describe the operational behavior of those systems; violations record when rules are broken; sanctions enforce consequences; and agents are the accountable parties. The associative tables `systems_states` and `systems_transitions` provide the structural flexibility needed for complex many-to-many relationships, while the twenty views synthesize these base tables into focused lenses for auditing, compliance verification, and operational analysis. Together, they form a coherent framework for tracking regulatory compliance across a portfolio of physical systems, from the initial norm through the state transitions it governs, the violations that may occur, and the sanctions that enforce adherence.