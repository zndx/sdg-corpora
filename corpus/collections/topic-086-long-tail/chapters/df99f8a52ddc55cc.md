---
chapter_id: df99f8a52ddc55cc
topic_id: 86
family: 01_foundation
cited_terms: ['equiv_intersect_artifact_with_part', 'requirement_equiv_specifies_target', 'cardinality_max_three_generic', 'cardinality_min_two_generic']
model: xai/grok-4.3
---

# Chapter 4: Modeling Artifact Composition and Directive Specification

This chapter defines four deterministic templates that capture equivalence intersections on artifacts, directive specification of targets, and generic cardinality restrictions. The templates are realized as four tables whose primary-key and foreign-key relationships enable cross-table joins that recover multi-hop class constraints.

## 1. Artifact–Part Equivalence Intersection

The table below embodies AXIOM 1. Column `id` is the primary key for each equivalence axiom instance; column `y` is a foreign key that must resolve to a directive specification, thereby linking an artifact class to one of its constituent part classes.

```sql
CREATE TABLE t_equiv_intersect_artifact_with_part (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_requirement_equiv_specifies_target(id)
);
```

| id       | x                  | y       |
|----------|--------------------|---------|
| part-001 | CompositionBook    | req-101 |
| part-002 | SpiralNotebook     | req-102 |
| part-003 | ThreeRingBinder    | req-103 |
| part-004 | PocketFolder       | req-104 |
| part-005 | WideRulePaper      | req-105 |
| part-006 | TabDivider         | req-106 |

## 2. Requirement Equivalence Specifying Targets

The table below embodies AXIOM 2. Column `id` is the primary key; columns `y` and `z` are foreign keys that respectively identify the artifact–part equivalence and the class to which the directive applies.

```sql
CREATE TABLE t_requirement_equiv_specifies_target (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  z VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_equiv_intersect_artifact_with_part(id)
);
```

| id      | x                    | y       | z             |
|---------|----------------------|---------|---------------|
| req-101 | SupplyDirective      | part-001| SeventhGrade  |
| req-102 | SupplyDirective      | part-002| EighthGrade   |
| req-103 | SupplyDirective      | part-003| SeventhGrade  |
| req-104 | SupplyDirective      | part-004| EighthGrade   |
| req-105 | SupplyDirective      | part-005| SeventhGrade  |
| req-106 | SupplyDirective      | part-006| EighthGrade   |

## 3. Maximum Cardinality Restriction

The table below embodies AXIOM 3. Column `id` is the primary key; column `y` is a foreign key referencing a requirement specification. The implicit object property is `hasPermittedComponent`.

```sql
CREATE TABLE t_cardinality_max_three_generic (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_requirement_equiv_specifies_target(id)
);
```

| id       | x                 | y       |
|----------|-------------------|---------|
| card-001 | SeventhGradeKit   | req-101 |
| card-002 | EighthGradeKit    | req-102 |
| card-003 | SeventhGradeKit   | req-103 |
| card-004 | EighthGradeKit    | req-104 |

## 4. Minimum Cardinality Restriction

The table below embodies AXIOM 4. Column `id` is the primary key; column `y` is a foreign key referencing a requirement specification. The implicit object property is `hasRequiredComponent`.

```sql
CREATE TABLE t_cardinality_min_two_generic (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_requirement_equiv_specifies_target(id)
);
```

| id       | x                 | y       |
|----------|-------------------|---------|
| minc-001 | SeventhGradeKit   | req-101 |
| minc-002 | EighthGradeKit    | req-102 |
| minc-003 | SeventhGradeKit   | req-105 |
| minc-004 | EighthGradeKit    | req-106 |

## 5. Cross-Join Demonstration

To determine every artifact part required by the directive that applies to SeventhGrade and that participates in a minimum-cardinality constraint of two, execute the following mental join:

```
t_requirement_equiv_specifies_target.z = 'SeventhGrade'
JOIN t_equiv_intersect_artifact_with_part ON y = t_requirement_equiv_specifies_target.id
JOIN t_cardinality_min_two_generic ON y = t_requirement_equiv_specifies_target.id
```

Result rows:

- req-101, part-001 (CompositionBook), minc-001
- req-105, part-005 (WideRulePaper), minc-003

```json
{"tables": [{"name": "t_equiv_intersect_artifact_with_part", "rows": [["part-001", "CompositionBook", "req-101"], ["part-002", "SpiralNotebook", "req-102"], ["part-003", "ThreeRingBinder", "req-103"], ["part-004", "PocketFolder", "req-104"], ["part-005", "WideRulePaper", "req-105"], ["part-006", "TabDivider", "req-106"]]}, {"name": "t_requirement_equiv_specifies_target", "rows": [["req-101", "SupplyDirective", "part-001", "SeventhGrade"], ["req-102", "SupplyDirective", "part-002", "EighthGrade"], ["req-103", "SupplyDirective", "part-003", "SeventhGrade"], ["req-104", "SupplyDirective", "part-004", "EighthGrade"], ["req-105", "SupplyDirective", "part-005", "SeventhGrade"], ["req-106", "SupplyDirective", "part-006", "EighthGrade"]]}, {"name": "t_cardinality_max_three_generic", "rows": [["card-001", "SeventhGradeKit", "req-101"], ["card-002", "EighthGradeKit", "req-102"], ["card-003", "SeventhGradeKit", "req-103"], ["card-004", "EighthGradeKit", "req-104"]]}, {"name": "t_cardinality_min_two_generic", "rows": [["minc-001", "SeventhGradeKit", "req-101"], ["minc-002", "EighthGradeKit", "req-102"], ["minc-003", "SeventhGradeKit", "req-105"], ["minc-004", "EighthGradeKit", "req-106"]]}]}
```