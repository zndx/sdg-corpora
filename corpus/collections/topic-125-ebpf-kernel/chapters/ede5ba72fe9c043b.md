---
chapter_id: ede5ba72fe9c043b
topic_id: 125
family: 07_long_tail
cited_terms: ['schemaorg_place_address', 'observation_with_participant', 'artifact_min_one_owner']
model: xai/grok-4.3
---

# Laboratory Artifact and Observation Registry

This chapter defines a minimal relational schema that implements three ontology axioms for artifacts, their owners, and observations in which they participate. The model supports traceability queries across ownership, location, and process participation without requiring external identifiers beyond the supplied primary and foreign keys.

## 1 Ontology-to-Relation Mapping

The three axioms are realized as tables whose column types and foreign-key constraints directly encode the Manchester syntax restrictions. Primary keys serve as stable identifiers for each asserted individual. Foreign keys enforce the existential and cardinality restrictions stated in the axioms.

### 1.1 Observation with Participant

Axiom 2 states that an observation is a process that necessarily has at least one artifact participant. The table therefore stores only the observation identifier and the class-level descriptor of the observation itself; any artifact linkage is expressed through foreign-key references from the other two tables.

```sql
CREATE TABLE t_observation_with_participant (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| obs-001 | EquipmentCalibration |
| obs-002 | LocationAudit |
| obs-003 | OwnershipTransfer |
| obs-004 | AddressVerification |
| obs-005 | ComponentInspection |

### 1.2 Artifact with Postal Address

Axiom 1 states that certain artifacts are located at a postal address. The foreign key on column y references an observation identifier, thereby recording the address assertion as a participation fact within that observation.

```sql
CREATE TABLE t_schemaorg_place_address (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_observation_with_participant(id)
);
```

| id | x | y |
|----|---|---|
| addr-001 | 900 SW Jackson Street, Room 900-N | obs-002 |
| addr-002 | Landon State Office Building | obs-004 |
| addr-003 | Curtis State Office Building, Room 530 | obs-002 |
| addr-004 | Post 351 Headquarters | obs-004 |
| addr-005 | KanCare Advisory Council Chamber | obs-005 |

### 1.3 Artifact with Minimum One Owner

Axiom 3 requires every artifact to have at least one owner. The foreign key on column y again references an observation, capturing the ownership assertion inside the temporal scope of that observation.

```sql
CREATE TABLE t_artifact_min_one_owner (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_observation_with_participant(id)
);
```

| id | x | y |
|----|---|---|
| own-001 | Medical Device DMF | obs-003 |
| own-002 | Quality System Record | obs-001 |
| own-003 | Auxiliary Meeting Log | obs-003 |
| own-004 | Ball Cap Inventory | obs-005 |
| own-005 | ATM Terminal Log | obs-001 |
| own-006 | Ceremony Attendance Sheet | obs-002 |

## 2 Cross-Table Query Example

To retrieve the owner of the artifact whose address was verified during observation obs-004, join t_artifact_min_one_owner to t_schemaorg_place_address on the shared observation reference:

```sql
SELECT o.x AS artifact, a.x AS address, own.x AS owner_observation
FROM t_artifact_min_one_owner own
JOIN t_schemaorg_place_address a ON own.y = a.y
WHERE a.y = 'obs-004';
```

Result row: artifact = “Ball Cap Inventory”, address = “Post 351 Headquarters”, owner_observation = “OwnershipTransfer”.

```json
{"tables": [{"name": "t_observation_with_participant", "rows": [["obs-001", "EquipmentCalibration"], ["obs-002", "LocationAudit"], ["obs-003", "OwnershipTransfer"], ["obs-004", "AddressVerification"], ["obs-005", "ComponentInspection"]]}, {"name": "t_schemaorg_place_address", "rows": [["addr-001", "900 SW Jackson Street, Room 900-N", "obs-002"], ["addr-002", "Landon State Office Building", "obs-004"], ["addr-003", "Curtis State Office Building, Room 530", "obs-002"], ["addr-004", "Post 351 Headquarters", "obs-004"], ["addr-005", "KanCare Advisory Council Chamber", "obs-005"]]}, {"name": "t_artifact_min_one_owner", "rows": [["own-001", "Medical Device DMF", "obs-003"], ["own-002", "Quality System Record", "obs-001"], ["own-003", "Auxiliary Meeting Log", "obs-003"], ["own-004", "Ball Cap Inventory", "obs-005"], ["own-005", "ATM Terminal Log", "obs-001"], ["own-006", "Ceremony Attendance Sheet", "obs-002"]]}]}
```