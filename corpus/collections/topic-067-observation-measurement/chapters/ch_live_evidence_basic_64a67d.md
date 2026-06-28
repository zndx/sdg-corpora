---
chapter_id: ch_live_evidence_basic_64a67d
topic_id: 67
family: 06_belief_structure
cited_terms: ['evidence_basic', 'labrun_min_one_sample', 'constraint_check_subclass']
model: engine-refine
---

The foundational layer of the data model rests upon a disciplined identification scheme, where every record carries a unique identifier that anchors it within a broader entity graph. Evidence items are distinguished by codes such as EVID-0001 through EVID-0004, laboratory samples by SAMP-0001 through SAMP-0004, and constraints by CHEC-0001 through CHEC-0004; these identifiers serve as the primary keys that enable cross-referencing across all tables. A sample record like SAMP-0001, associated with laboratory run SEQ-EXP-99 and input sample RNA-POOL-22, becomes the entity to which multiple attribute values attach. The entity-attribute-value pattern is realized through a family of typed value tables—each distinguished by the data type of its value column—so that the same entity identifier SAMP-0001 can simultaneously carry a decimal measurement of 2021.10, a datetime stamp of 2024-08-01T16:02:07, and a string value of edge-03, all linked through a common attr_id foreign key. This separation of attribute definitions from their typed values preserves schema stability while allowing heterogeneous data to coexist under a single entity.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

Attribute definitions themselves are catalogued in a dedicated registry that pairs each attribute name with its XSD type, establishing a contract for the shape of data that may be stored. The attribute duration_seconds is declared as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string; these type declarations govern which value table a given attribute's data must inhabit. When a value record references attr_id SAMP-0002, it is storing data for the attribute end_time, and the value table it appears in—whether the datetime, decimal, integer, or varchar table—must be consistent with the xsd:dateTime type assigned to that attribute in the definition table. This type discipline ensures that the value 2024-02-12T19:03:44 is stored only in the datetime value table, that 435 appears only in the integer table, and that complete resides only in the varchar table, preventing type confusion across the model.

Beyond attribute-level metadata, each piece of evidence is classified by a dimension kind and an encoding, properties that describe the nature of the measurement and the character representation of the underlying data. The dimension_kind column distinguishes between temperature, count, and pressure—values that appear across evidence items such as EVID-0001 (temperature), EVID-0002 (count), and EVID-0004 (pressure)—providing a categorical axis along which evidence can be filtered, aggregated, or compared. The encoding column, taking values of ascii, latin1, or utf8, specifies the character encoding used for the evidence text; evidence item EVID-0002, for instance, is stored in latin1 while EVID-0003 and EVID-0004 both use utf8. These two properties together form a lightweight classification schema that sits alongside the evidence description—whether Compliance checklist, Latency benchmark result, or Incident postmortem—and enables downstream systems to handle character data correctly and to reason about the physical or logical dimension being measured.

Constraint enforcement is governed by a separate registry that ties each constraint to one or more evidence items, declares whether compliance is mandatory, and assigns a priority level that orders remediation effort. The constraint Null field rejection appears twice in the registry—under identifiers CHEC-0001 and CHEC-0002—with the first instance checking evidence EVID-0005 and marked mandatory with priority 1, while the second checks EVID-0003 and also carries mandatory status and priority 1. By contrast, the constraint Anomaly detection threshold (CHEC-0003) references EVID-0005, is mandatory, but carries priority 4, indicating a lower urgency; the constraint Header presence check (CHEC-0004) references EVID-0002, is not mandatory, and carries priority 1. The mandatory flag and priority column together form a two-dimensional enforcement matrix: a constraint that is both mandatory and priority 1 demands immediate attention, while a non-mandatory constraint at priority 5 represents the lowest enforcement tier. This structure allows auditors and automated systems to triage which evidence items require validation, which validations are non-negotiable, and in what order discrepancies should be addressed.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | EVID-0005 | true | 1 |
| CHEC-0002 | Null field rejection | EVID-0003 | true | 5 |
| CHEC-0003 | Anomaly detection threshold | EVID-0005 | true | 4 |
| CHEC-0004 | Header presence check | EVID-0002 | false | 1 |
| CHEC-0005 | Batch size limit | EVID-0002 | false | 4 |