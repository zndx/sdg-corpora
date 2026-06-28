---
chapter_id: ch_live_audit_produces_evidence_42848b
topic_id: 166
family: 07_long_tail
cited_terms: ['audit_produces_evidence', 'claim_supported_by_evidence', 'lift_basic']
model: engine-refine
---

Attr, attr type, entity, identifier, and misc name the minimal contract by which governed records remain addressable, typed, and auditable across heterogeneous compliance domains. An identifier is the durable surrogate key that survives renaming of human-readable labels and permits stable reference in lineage, authorization, and evidentiary linkage; in operational practice it is not merely a row handle but the spine on which assertions are joined. Evidence produced by audits (EVID-0001 through EVID-0004, spanning Data Retention Policy Audit, ISO27001 Certification, and repeated Cloud Infrastructure Scan entries), claims supported by that evidence, and lift assets (LIFT-0001 through LIFT-0004, Observatory Lift and Freight Service Lift) each carry distinct identifier namespaces, yet obey the same referencing discipline: the identifier on a parent record is replayed as entity_id wherever typed values attach, so that confidence scores, dimension classifications, procedural methods, and temporal stamps remain unambiguously owned by exactly one governed instance.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | EVID-0003 |
| EVID-0002 | Server latency threshold breach | EVID-0001 |
| EVID-0003 | Server latency threshold breach | EVID-0003 |
| EVID-0004 | Emissions compliance record | EVID-0003 |
| EVID-0005 | Emissions compliance record | EVID-0003 |
| EVID-0006 | Batch ingestion delay anomaly | EVID-0003 |

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

The attr dimension separates what is being said about an entity from the entity itself. Attribute names—confidence, dimension_kind, method, recorded_at—function as a controlled vocabulary of measurable or declarative facets, while attr_id (distinct from the entity identifier though often co-numbered within a family) selects which facet a given value row instantiates. Repeating the same quartet of attr names across audit evidence, claim–evidence support, and lift registries signals intentional schema reuse: compliance officers can compare confidence and recorded_at across substantively different object classes without relearning local field names. Where attr_id diverges from entity_id within a value store—as when EVID-0001 hosts decimal measurements keyed variously to EVID-0001, EVID-0005, and EVID-0007—the model encodes many-to-one attribution explicitly rather than flattening attributes into wide tables that would fracture whenever a new measurable facet is introduced.

Attr type governs interpretability and storage routing at the boundary between metadata and payload. Declarations of xsd:decimal, xsd:string, and xsd:dateTime are not decorative labels; they mandate which value repository may legally hold a datum and which validation, aggregation, and comparison operations apply downstream. Confidence therefore materializes only in decimal stores (0.658 on audit evidence EVID-0001, 0.814 on EVID-0002, 0.768 on the supporting claim EVID-0001, 0.833 on claim EVID-0002; lift LIFT-0001 at 0.624 versus LIFT-0002 at 0.175), dimension_kind and method in varchar repositories (Dimension Kind 01, Encoding 02, calibration record versus nightly summary, change rationale), and recorded_at exclusively as ISO-8601 datetimes (2025-03-28T10:19:21 for audit EVID-0001; 2024-08-09T04:01:38 on the paired claim). Misc, in this architecture, is precisely that routed payload—the value column whose concrete syntax must conform to the attr type or forfeit trust in automated reasoning.

Entity, narrowly construed, is the governed thing to which attrs accrue, identified by entity_id in each typed value relation and typically aligned with the parent record’s identifier when the attribute describes the whole object. The pattern tolerates multiple entities and multiple attributes per family without collision because each value row is a triple: entity_id names the bearer, attr_id names the facet, and misc holds the facet’s content. Audit evidence EVID-0003 and EVID-0004 both arise from Cloud Infrastructure Scan activity yet remain distinct entities with separate recorded_at stamps (2025-03-19T12:10:16 and 2023-11-17T00:14:22), preserving temporal differentiation that a single scan label would otherwise obscure. Claims that cite evidence reuse the EVID identifier space for their own rows while supported_by_evidence pointers (e.g., Server latency threshold breach claims EVID-0002 and EVID-0003 both anchored to audit evidence EVID-0003) demonstrate how entity identity and evidentiary identity are deliberately separable so that one scan artifact can substantiate multiple assertions without merging their attribute histories.

Why this decomposition matters in governance practice is that it trades convenience of ad hoc spreadsheets for enforceable structure. Identifiers make cross-table joins and obligation tracing mechanical: an examiner can traverse from claim language through supported_by_evidence to the producing audit and inspect confidence and recorded_at on each hop. Attr and attr type jointly prevent category errors—treating a timestamp as a sortable number or a locale tag as a dimension code—while misc remains the sole locus of domain heterogeneity (en versus de language tags, emissions compliance versus model accuracy benchmark claims, freight versus observatory lift contexts). When attribute vocabularies and XSD typings are shared across entity classes, portfolio-level reporting becomes possible; when entity_id discipline is maintained, local exceptions (a single lift’s change rationale, a single audit’s calibration record) do not corrupt global definitions. The resulting system is verbose at rest but legible under scrutiny: every compliance-relevant statement resolves to an identified entity, a named and typed attribute, and a misc value whose meaning is fixed by the type declaration that preceded it.