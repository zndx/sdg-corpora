---
chapter_id: e9c74fe6ce407eaa
topic_id: 53
family: 07_long_tail
cited_terms: ['observation_with_participant', 'column_tag_subclass', 'process_min_one_input']
model: xai/grok-4.3
---

# Relational Encodings of Observation Processes in Laboratory Systems

This chapter specifies three tables that realize a minimal fragment of an observation ontology in laboratory information management. The tables encode processes that participate in artifacts, annotations on columns, and processes with required inputs. All rows are drawn from a synthetic LIMS deployment that records equipment calibration events, sample assays, and result tagging.

## 1 Scope and Mapping

The ontology fragment is restricted to three axioms. Each axiom projects directly onto one table. Primary keys are opaque identifiers; foreign keys enforce the participant and input relations required by the axioms. Cross-table queries therefore recover multi-hop facts such as “the input observation that carries a given column annotation for a tagged process.”

### 1.1 Axiom 1 — Observation with Participant Artifact

Axiom 1 states that class X is a process having at least one artifact participant. The corresponding table stores the process class identifier in column x. The primary key id uniquely identifies each asserted observation class.

```sql
CREATE TABLE t_observation_with_participant (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| obs_001 | EquipmentCalibration |
| obs_002 | SampleAssay |
| obs_003 | ResultRecording |
| obs_004 | TemperatureLogging |
| obs_005 | VolumeMeasurement |

### 1.2 Axiom 2 — Column Tag Subclass

Axiom 2 states that class X is a descriptive information content entity annotating column Y. Table t_column_tag_subclass therefore carries a foreign key y that references t_observation_with_participant.id. The primary key id identifies each annotation class.

```sql
CREATE TABLE t_column_tag_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_observation_with_participant(id)
);
```

| id | x | y |
|----|---|---|
| tag_001 | CalibrationStatusTag | obs_001 |
| tag_002 | AssayResultTag | obs_002 |
| tag_003 | TemperatureUnitTag | obs_004 |
| tag_004 | VolumePrecisionTag | obs_005 |
| tag_005 | RecordingTimestampTag | obs_003 |

### 1.3 Axiom 3 — Process with Minimum One Input

Axiom 3 states that class X is a process having at least one input of class Y. Table t_process_min_one_input therefore carries a foreign key y that references t_observation_with_participant.id. The primary key id identifies each such process assertion.

```sql
CREATE TABLE t_process_min_one_input (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_observation_with_participant(id)
);
```

| id | x | y |
|----|---|---|
| proc_001 | CalibrationWorkflow | obs_001 |
| proc_002 | AssayPipeline | obs_002 |
| proc_003 | LoggingRoutine | obs_004 |
| proc_004 | MeasurementSequence | obs_005 |
| proc_005 | RecordingSession | obs_003 |

## 2 Cross-Join Demonstration

To retrieve the column annotation attached to the input observation of CalibrationWorkflow, join t_process_min_one_input to t_observation_with_participant on y = id, then to t_column_tag_subclass on y = id. The join yields:

- proc_001 → obs_001 → tag_001 (CalibrationStatusTag)

The resulting row set answers the multi-hop question “which annotation labels the participant observation required by CalibrationWorkflow.”

```json
{"tables": [{"name": "t_observation_with_participant", "rows": [["obs_001", "EquipmentCalibration"], ["obs_002", "SampleAssay"], ["obs_003", "ResultRecording"], ["obs_004", "TemperatureLogging"], ["obs_005", "VolumeMeasurement"]]}, {"name": "t_column_tag_subclass", "rows": [["tag_001", "CalibrationStatusTag", "obs_001"], ["tag_002", "AssayResultTag", "obs_002"], ["tag_003", "TemperatureUnitTag", "obs_004"], ["tag_004", "VolumePrecisionTag", "obs_005"], ["tag_005", "RecordingTimestampTag", "obs_003"]]}, {"name": "t_process_min_one_input", "rows": [["proc_001", "CalibrationWorkflow", "obs_001"], ["proc_002", "AssayPipeline", "obs_002"], ["proc_003", "LoggingRoutine", "obs_004"], ["proc_004", "MeasurementSequence", "obs_005"], ["proc_005", "RecordingSession", "obs_003"]]}]}
```