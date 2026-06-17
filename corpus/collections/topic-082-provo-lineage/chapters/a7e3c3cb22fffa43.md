---
chapter_id: a7e3c3cb22fffa43
topic_id: 82
family: 03_directive_governance
cited_terms: ['verification_min_one_evidence']
model: xai/grok-4.3
---

# Verification Processes in Laboratory Information Management

Laboratory information management systems record verification processes that satisfy the minimum-evidence constraint defined by the bfo:0000015 subclass axiom. The following sections present the axiom, map it to four tables that enforce the required one-to-many production of evidence, and demonstrate retrieval across primary-key and foreign-key links.

## 1. Ontological Foundation

### 1.1 verification_min_one_evidence Axiom
The axiom states that any verification process is a bfo:0000015 process that producesEvidence at least one evidence individual. Slot X holds the verification class; slot Y holds the evidence class. The relational projection materialises this constraint as an associative table whose non-null Y column guarantees the cardinality minimum.

## 2. Relational Schema

Four tables realise the axiom inside a laboratory domain. Three tables carry foreign-key columns that permit two- and three-hop joins.

### 2.1 t_sample
The table stores sample individuals referenced by verification processes. Its primary key sample_id is referenced by t_verification.sample_id.

| sample_id | description          | collected_date |
|-----------|----------------------|----------------|
| S001      | Water intake point A | 2024-03-01     |
| S002      | Gas line filter B    | 2024-03-02     |
| S003      | Light oil batch C    | 2024-03-03     |
| S004      | Air compressor D     | 2024-03-04     |

### 2.2 t_verification
The table instantiates X (verification processes). verification_id is the primary key; sample_id is a foreign key to t_sample.

| verification_id | sample_id | type                | operator   |
|-----------------|-----------|---------------------|------------|
| V001            | S001      | Pressure test       | Tech-01    |
| V002            | S002      | Viscosity check     | Tech-02    |
| V003            | S003      | Temperature cycle   | Tech-01    |
| V004            | S004      | Flow calibration    | Tech-03    |

### 2.3 t_evidence
The table instantiates Y (evidence individuals). evidence_id is the primary key; verification_id is a foreign key to t_verification.

| evidence_id | verification_id | result_value | timestamp           |
|-------------|-----------------|--------------|---------------------|
| E001        | V001            | 140 Bar      | 2024-03-01T09:15:00 |
| E002        | V001            | Pass         | 2024-03-01T09:18:00 |
| E003        | V002            | 48 cSt       | 2024-03-02T10:05:00 |
| E004        | V003            | -15 °C       | 2024-03-03T11:40:00 |
| E005        | V004            | 0.5 Bar      | 2024-03-04T14:20:00 |

### 2.4 t_verification_min_one_evidence
The table directly implements the axiom projection. id is the primary key; x references a verification process; y is a non-null foreign key to an evidence individual, enforcing the minimum cardinality.

| id   | x    | y    |
|------|------|------|
| VM01 | V001 | E001 |
| VM02 | V001 | E002 |
| VM03 | V002 | E003 |
| VM04 | V003 | E004 |
| VM05 | V004 | E005 |

## 3. Cross-Join Demonstration

Question: retrieve the result_value produced by the verification process performed on sample S001.

Execution path:  
t_sample.sample_id = S001 → t_verification.sample_id → t_verification.verification_id = V001 → t_evidence.verification_id → t_evidence.result_value.

Joined rows:

- S001, V001, E001, 140 Bar  
- S001, V001, E002, Pass

The presence of two rows for the same verification_id satisfies the min 1 producesEvidence requirement.

```json
{"tables": [{"name": "t_sample", "rows": [["S001", "Water intake point A", "2024-03-01"], ["S002", "Gas line filter B", "2024-03-02"], ["S003", "Light oil batch C", "2024-03-03"], ["S004", "Air compressor D", "2024-03-04"]]}, {"name": "t_verification", "rows": [["V001", "S001", "Pressure test", "Tech-01"], ["V002", "S002", "Viscosity check", "Tech-02"], ["V003", "S003", "Temperature cycle", "Tech-01"], ["V004", "S004", "Flow calibration", "Tech-03"]]}, {"name": "t_evidence", "rows": [["E001", "V001", "140 Bar", "2024-03-01T09:15:00"], ["E002", "V001", "Pass", "2024-03-01T09:18:00"], ["E003", "V002", "48 cSt", "2024-03-02T10:05:00"], ["E004", "V003", "-15 \u00b0C", "2024-03-03T11:40:00"], ["E005", "V004", "0.5 Bar", "2024-03-04T14:20:00"]]}, {"name": "t_verification_min_one_evidence", "rows": [["VM01", "V001", "E001"], ["VM02", "V001", "E002"], ["VM03", "V002", "E003"], ["VM04", "V003", "E004"], ["VM05", "V004", "E005"]]}]}
```