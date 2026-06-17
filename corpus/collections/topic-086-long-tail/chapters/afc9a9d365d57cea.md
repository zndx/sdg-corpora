---
chapter_id: afc9a9d365d57cea
topic_id: 86
family: 01_foundation
cited_terms: ['equiv_intersect_artifact_with_part', 'requirement_equiv_specifies_target', 'cardinality_max_three_generic', 'cardinality_min_two_generic']
model: xai/grok-4.3
---

# Chapter 7: Relational Projection of OWL Equivalence and Cardinality Axioms in Artifact Governance

This chapter defines four tables that project selected OWL axioms into a relational schema for artifact-part relations under directive governance. The tables support cross-table joins that resolve multi-hop queries over class equivalences, specification targets, and cardinality bounds. All column values are instances consistent with the slot types of the source axioms.

## 1 Axiom Overview

The four axioms constrain class definitions for artifacts, directives, and numeric restrictions. t_requirement_equiv_specifies_target serves as the central table because two foreign-key references terminate on its primary key and two originate from it. The remaining tables encode part intersections and cardinality limits that reference the same directive instances.

## 2 Table Definitions

t_equiv_intersect_artifact_with_part embodies axiom 1 by recording pairs of classes whose intersection defines an artifact that has at least one part of the second class. Column id is the primary key. Column y is a foreign key that must match an existing id value in t_requirement_equiv_specifies_target.

| id   | x                          | y     |
|------|----------------------------|-------|
| eqp1 | MetalHousing               | req1  |
| eqp2 | CircuitBoardAssembly       | req2  |
| eqp3 | SealedEnclosure            | req3  |
| eqp4 | PowerSupplyModule          | req4  |
| eqp5 | SensorArray                | req1  |

t_requirement_equiv_specifies_target embodies axiom 2 by recording directive classes that specify a target class and apply to an artifact class. Column id is the primary key. Column y is a foreign key referencing t_equiv_intersect_artifact_with_part.id. Column z is a second foreign key that also references t_equiv_intersect_artifact_with_part.id.

| id   | x                     | y     | z     |
|------|-----------------------|-------|-------|
| req1 | HousingSpecDirective  | eqp1  | eqp5  |
| req2 | BoardSpecDirective    | eqp2  | eqp3  |
| req3 | EnclosureSpecDirective| eqp3  | eqp1  |
| req4 | ModuleSpecDirective   | eqp4  | eqp2  |

t_cardinality_max_three_generic embodies axiom 3 by recording classes that may participate in an object property with at most three instances of a target class. Column id is the primary key. Column y is a foreign key referencing t_requirement_equiv_specifies_target.id.

| id    | x                    | y     |
|-------|----------------------|-------|
| cmax1 | HousingSpecDirective | req1  |
| cmax2 | BoardSpecDirective   | req2  |
| cmax3 | EnclosureSpecDirective| req3 |
| cmax4 | ModuleSpecDirective  | req4  |

t_cardinality_min_two_generic embodies axiom 4 by recording classes that must participate in an object property with at least two instances of a target class. Column id is the primary key. Column y is a foreign key referencing t_requirement_equiv_specifies_target.id.

| id    | x                    | y     |
|-------|----------------------|-------|
| cmin1 | HousingSpecDirective | req1  |
| cmin2 | BoardSpecDirective   | req2  |
| cmin3 | EnclosureSpecDirective| req3 |
| cmin4 | ModuleSpecDirective  | req4  |

## 3 Cross-Join Example

To retrieve every directive class together with its artifact intersection class and the maximum-cardinality bound, execute the following mental join:

```
t_requirement_equiv_specifies_target.id = t_equiv_intersect_artifact_with_part.y
t_requirement_equiv_specifies_target.id = t_cardinality_max_three_generic.y
```

One resulting row is: directive = HousingSpecDirective, artifact intersection = MetalHousing, part class = SensorArray, max cardinality target = req1. The same pattern extends to the minimum-cardinality table by substituting the corresponding foreign-key column.

```json
{"tables": [{"name": "t_equiv_intersect_artifact_with_part", "rows": [["eqp1", "MetalHousing", "req1"], ["eqp2", "CircuitBoardAssembly", "req2"], ["eqp3", "SealedEnclosure", "req3"], ["eqp4", "PowerSupplyModule", "req4"], ["eqp5", "SensorArray", "req1"]]}, {"name": "t_requirement_equiv_specifies_target", "rows": [["req1", "HousingSpecDirective", "eqp1", "eqp5"], ["req2", "BoardSpecDirective", "eqp2", "eqp3"], ["req3", "EnclosureSpecDirective", "eqp3", "eqp1"], ["req4", "ModuleSpecDirective", "eqp4", "eqp2"]]}, {"name": "t_cardinality_max_three_generic", "rows": [["cmax1", "HousingSpecDirective", "req1"], ["cmax2", "BoardSpecDirective", "req2"], ["cmax3", "EnclosureSpecDirective", "req3"], ["cmax4", "ModuleSpecDirective", "req4"]]}, {"name": "t_cardinality_min_two_generic", "rows": [["cmin1", "HousingSpecDirective", "req1"], ["cmin2", "BoardSpecDirective", "req2"], ["cmin3", "EnclosureSpecDirective", "req3"], ["cmin4", "ModuleSpecDirective", "req4"]]}]}
```