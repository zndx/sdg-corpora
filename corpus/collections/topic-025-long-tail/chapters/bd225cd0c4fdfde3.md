---
chapter_id: bd225cd0c4fdfde3
topic_id: 25
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'metric_observed_by_event']
model: xai/grok-4.3
---

# Chapter 4: Descriptive Information Content Entities Observed at Laboratory Events

This chapter defines the relational representation of two ontology axioms that classify claims and metrics as descriptive information content entities observed at processual occurrences. The model uses a laboratory information management schema in which events anchor observations, samples are processed under those events, and cross-table joins recover multi-hop provenance.

## 1 Scope and Table Inventory

Four tables implement the required structure. Two tables directly instantiate the supplied axioms. Two supporting tables supply the event and sample context required for foreign-key navigation. Every row satisfies the subclass axioms that place the value of column x under cco:DescriptiveICE with an sdg:observedAt restriction to bfo:0000015.

### 1.1 t_event

The table t_event embodies the bfo:0000015 occurrence that appears in both supplied axioms as the target of the observedAt restriction. Column event_id is the primary key; no foreign keys are present.

```sql
CREATE TABLE t_event (
  event_id VARCHAR(255) PRIMARY KEY,
  event_type VARCHAR(255),
  occurred_on DATE
);
```

| event_id | event_type | occurred_on |
|----------|------------|-------------|
| E001 | sample_receipt | 2024-10-02 |
| E002 | analytical_run | 2024-10-03 |
| E003 | verification | 2024-10-04 |

### 1.2 t_sample

The table t_sample records physical specimens whose processing occurs inside events. Column sample_id is the primary key; column event_id is a foreign key to t_event.event_id. A reader can therefore obtain the observation event for any sample by a single equi-join on event_id.

```sql
CREATE TABLE t_sample (
  sample_id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) REFERENCES t_event(event_id),
  material VARCHAR(255)
);
```

| sample_id | event_id | material |
|-----------|----------|----------|
| S100 | E001 | serum |
| S101 | E001 | plasma |
| S102 | E002 | urine |
| S103 | E003 | serum |

### 1.3 t_claim_observed_by_event

The table t_claim_observed_by_event directly implements Axiom 1. Column id is the primary key; column x holds the class name of the descriptive information content entity. Because the axiom asserts an observedAt restriction, each x value is understood to be linked to an event via the surrounding schema.

```sql
CREATE TABLE t_claim_observed_by_event (
  id VARCHAR(255) PRIMARY KEY,
  x VARCHAR(255)
);
```

| id | x |
|----|---|
| C01 | compliance_claim |
| C02 | contamination_claim |
| C03 | identity_claim |

### 1.4 t_metric_observed_by_event

The table t_metric_observed_by_event directly implements Axiom 2. Column id is the primary key; column x holds the class name of the descriptive information content entity. The same observedAt semantics apply.

```sql
CREATE TABLE t_metric_observed_by_event (
  id VARCHAR(255) PRIMARY KEY,
  x VARCHAR(255)
);
```

| id | x |
|----|---|
| M01 | concentration_metric |
| M02 | purity_metric |
| M03 | volume_metric |
| M04 | ph_metric |

## 2 Cross-Join Example

To recover the material, event date, and metric class for sample S102 the following mental join is performed:

- Locate S102 in t_sample → event_id = E002
- Locate E002 in t_event → occurred_on = 2024-10-03, event_type = analytical_run
- Locate M01 in t_metric_observed_by_event (any metric row may be selected; M01 is used here)

The resulting joined tuple is (S102, urine, E002, 2024-10-03, concentration_metric). The same pattern extends to any claim row by substituting t_claim_observed_by_event.

```json
{"tables": [{"name": "t_event", "rows": [["E001", "sample_receipt", "2024-10-02"], ["E002", "analytical_run", "2024-10-03"], ["E003", "verification", "2024-10-04"]]}, {"name": "t_sample", "rows": [["S100", "E001", "serum"], ["S101", "E001", "plasma"], ["S102", "E002", "urine"], ["S103", "E003", "serum"]]}, {"name": "t_claim_observed_by_event", "rows": [["C01", "compliance_claim"], ["C02", "contamination_claim"], ["C03", "identity_claim"]]}, {"name": "t_metric_observed_by_event", "rows": [["M01", "concentration_metric"], ["M02", "purity_metric"], ["M03", "volume_metric"], ["M04", "ph_metric"]]}]}
```