---
chapter_id: 691eaeee1c8a76db
topic_id: 157
family: 07_long_tail
cited_terms: ['kernel_event_with_tid', 'mass_function_equiv_frame_and_assignment']
model: xai/grok-4.3
---

# Chapter 4: Kernel Events and Equivalent Mass-Function Frames

This chapter defines two ontological templates that relate processes carrying thread identifiers to descriptive information content entities that assign masses over frames of discernment. The definitions are realized as a pair of mutually referencing tables whose foreign-key links support two-hop retrieval of thread identifiers, frames, and assigned masses.

## 1 Kernel Event Template

Axiom kernel_event_with_tid states that any instance of class X is a bfo:Process that bears a thread identifier drawn from class Y. The corresponding table stores the process class, the thread-identifier class, and a surrogate primary key. Column id is the primary key. Column y is a foreign key into t_mass_function_equiv_frame_and_assignment, allowing a reader to retrieve the mass-function frame that qualifies the event.

```sql
SELECT e.id, e.x, m.x AS frame
FROM t_kernel_event_with_tid e
JOIN t_mass_function_equiv_frame_and_assignment m ON e.y = m.id;
```

| id          | x                        | y          |
|-------------|--------------------------|------------|
| kevt-001    | ProcessThreadCreate      | mfa-010    |
| kevt-002    | ProcessThreadExit        | mfa-011    |
| kevt-003    | ProcessThreadSchedule    | mfa-012    |
| kevt-004    | ProcessThreadBlock       | mfa-010    |
| kevt-005    | ProcessThreadWake        | mfa-013    |

## 2 Mass-Function Frame and Assignment Template

Axiom mass_function_equiv_frame_and_assignment states that any instance of class X is equivalent to a cco:DescriptiveICE that ranges over a frame of discernment Y and assigns mass to a focal element Z. The corresponding table stores the DescriptiveICE class, the frame class, the focal element class, and a surrogate primary key. Column id is the primary key. Column y is a foreign key into t_kernel_event_with_tid, closing the reference cycle required by the two axioms.

```sql
SELECT m.id, m.x, m.z, e.x AS thread_class
FROM t_mass_function_equiv_frame_and_assignment m
JOIN t_kernel_event_with_tid e ON m.y = e.id;
```

| id       | x                              | y        | z                     |
|----------|--------------------------------|----------|-----------------------|
| mfa-010  | BeliefMassAssignmentThreadPool | kevt-001 | FrameSingletonThread  |
| mfa-011  | BeliefMassAssignmentThreadPool | kevt-002 | FrameSingletonThread  |
| mfa-012  | BeliefMassAssignmentScheduler  | kevt-003 | FrameSchedulerQueue   |
| mfa-013  | BeliefMassAssignmentWake       | kevt-005 | FrameWakeSource       |
| mfa-014  | BeliefMassAssignmentBlock      | kevt-004 | FrameBlockReason      |

## 3 Cross-Table Retrieval Example

To obtain the thread class, frame, and assigned mass class for kernel event kevt-001, first locate the row in t_kernel_event_with_tid, follow foreign key y to t_mass_function_equiv_frame_and_assignment, then read columns x and z. The joined result row is:

kevt-001 | ProcessThreadCreate | mfa-010 | BeliefMassAssignmentThreadPool | FrameSingletonThread

The same pattern extends to any other event identifier, confirming that every admissible thread identifier participates in exactly one mass-function assignment.

```json
{"tables": [{"name": "t_kernel_event_with_tid", "rows": [["kevt-001", "ProcessThreadCreate", "mfa-010"], ["kevt-002", "ProcessThreadExit", "mfa-011"], ["kevt-003", "ProcessThreadSchedule", "mfa-012"], ["kevt-004", "ProcessThreadBlock", "mfa-010"], ["kevt-005", "ProcessThreadWake", "mfa-013"]]}, {"name": "t_mass_function_equiv_frame_and_assignment", "rows": [["mfa-010", "BeliefMassAssignmentThreadPool", "kevt-001", "FrameSingletonThread"], ["mfa-011", "BeliefMassAssignmentThreadPool", "kevt-002", "FrameSingletonThread"], ["mfa-012", "BeliefMassAssignmentScheduler", "kevt-003", "FrameSchedulerQueue"], ["mfa-013", "BeliefMassAssignmentWake", "kevt-005", "FrameWakeSource"], ["mfa-014", "BeliefMassAssignmentBlock", "kevt-004", "FrameBlockReason"]]}]}
```