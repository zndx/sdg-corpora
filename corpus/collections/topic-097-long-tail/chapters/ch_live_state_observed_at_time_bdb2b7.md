---
chapter_id: ch_live_state_observed_at_time_bdb2b7
topic_id: 97
family: 02_observation_measurement
cited_terms: ['state_observed_at_time', 'evidence_refutes_claim', 'claim_min_one_evidence']
model: engine-refine
---

In operational compliance and evidence governance, every durable assertion must be anchored to a stable identifier that survives re-query, audit, and cross-system reconciliation. Identifiers such as TIME-0001 through TIME-0004 designate discrete state observations—offline, calibrated, idle, calibrated—each timestamped at a known instant (2024-03-16T07:00:05Z through 2024-03-18T08:05:19Z). The identifier is not merely a surrogate key; it is the contractual handle by which downstream reviewers, lineage tools, and dispute-resolution workflows retrieve the same fact without ambiguity. Where claims enter the record under handles like EVID-0001 or CLAI-0003, the identifier binds narrative content (“Antibiotic resistance rising,” “Sensor drift calibration”) to a single authoritative row, preventing conflation when homonymous assertions recur across fiscal periods or instrument generations.

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | 2024-03-16T07:00:05Z |
| TIME-0002 | calibrated | 2024-03-17T09:33:40Z |
| TIME-0003 | idle | 2024-03-18T08:05:19Z |
| TIME-0004 | calibrated | 2024-03-16T11:22:30Z |
| TIME-0005 | idle | 2024-03-17T13:50:02Z |
| TIME-0006 | draining | 2024-03-15T10:45:11Z |
| TIME-0007 | idle | 2024-03-16T07:00:05Z |
| TIME-0008 | locked | 2024-03-15T08:30:00Z |

**t_claim_min_one_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Antibiotic resistance rising |
| EVID-0002 | Glacier mass loss accelerating |
| EVID-0003 | Antibiotic resistance rising |
| EVID-0004 | Deforestation rate doubled |
| EVID-0005 | Ocean acidity increased 0.3 |
| EVID-0006 | Ocean acidity increased 0.3 |
| EVID-0007 | Deforestation rate doubled |

An entity is the governed object to which attributes attach and from which typed values are read. In temporal state monitoring, each observation row constitutes an entity: TIME-0001 carries not only its enumerated state but also a constellation of attribute bindings—confidence as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime—declared in the attribute registry and materialized across segregated value stores. Segregation by attr_type is not cosmetic partitioning; it enforces validation, indexing, and unit semantics at ingest. A decimal confidence of 0.673 on TIME-0001 cannot be coerced into a varchar bucket without breaking comparability across calibration cycles, and a recorded_at value of 2023-08-28T00:49:09 must remain in a datetime column to preserve ordering against observation timestamps such as 2024-03-16T11:22:30Z. The entity therefore functions as the subject of description, while attr names declare which facet is being asserted and attr_type declares the interpretive contract under which misc—the concrete stored value—is admissible.

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

Attributes and their types jointly determine what may be said about an entity and how auditors may test it. The attr dimension_kind, typed as xsd:string and instantiated as “Dimension Kind 01” alongside encoding “Encoding 02” and locale “fr,” situates a numeric reading—138.13 or 126.00 on the same entity—in a classificatory frame that governs aggregation rules and disclosure boundaries. Method, whether appearing as an attribute on state entities or as a first-class field on evidentiary links, records the epistemic pathway: manual review of a benchmark result, hybrid reconciliation of an audit report, or automated processing of sensor drift calibration. Misc values are the evidentiary payload at the attribute level—the scalar or lexical fact that satisfies the type contract—while method at the linkage level documents how the surrounding judgment was produced. Together, attr, attr_type, and misc implement a typed assertion layer without which compliance narratives collapse into undifferentiated prose.

Evidentiary governance extends the entity–attribute model into directed relationships among claims, counter-evidence, and supporting material. A claim such as “Glacier mass loss accelerating” (EVID-0002) or “Deforestation rate doubled” (EVID-0004) becomes the subject of a support edge whose target is a distinct evidence identifier—EVID-0007 for the ICES marine ecosystem index, EVID-0005 for the Lancet longitudinal cohort study. Role qualifies the subject’s participation in that edge: contributor, reviewer, or owner, distinguishing mere citation from custodial accountability. Parallel refutation structures pair evidence (“Audit report FY2023,” “Data lineage snapshot”) against contested claims (“Firmware patch resolves bug,” “IPCC AR6 synthesis report”) and annotate the pairing with method (manual, hybrid, automated) and labeltext—calibration record, audit excerpt, intake form, pre-release note—that supplies human-scannable provenance without replacing the underlying identifier. Labeltext is the governed surface label auditors encounter first; it must align with but not substitute for the evidentiary object it names.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | Firmware patch resolves bug | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | ICES marine ecosystem index | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | IPCC AR6 synthesis report | automated | intake form |
| CLAI-0004 | Data lineage snapshot | Lancet longitudinal cohort study | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | Uptime exceeds 99.9% | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | Carbon neutral supply chain | automated | change rationale |
| CLAI-0007 | Incident summary Aug | GDPR Article 17 compliant | inferred | intake form |

In practice, these constructs interoperate across observation, assertion, and dispute workflows. State entities accumulate typed misc values under attr contracts so that a calibrated reading at 0.137 confidence can be traced to its dimension_kind and recorded_at provenance; claim entities accumulate subject–target graphs so that “Antibiotic resistance rising” may be supported by “Chemical purity meets ISO” under one role and linked to “Reagent stability confirmed” under another. Method and labeltext bridge machine-checkable graphs and review-ready dossiers: hybrid assessment of CLAI-0004’s data lineage snapshot against a Lancet longitudinal cohort study carries both an automated extraction trace and a pre-release note suitable for committee intake. Identifier stability, entity centrality, typed attr surfaces, misc as admissible fact, subject–target directionality, role as participation semantics, and labeltext as governed shorthand form the minimum vocabulary for any handbook that must survive external audit—because each term marks a distinct obligation: what exists, what is said about it, how it is typed, how it is valued, how claims relate to evidence, and how humans label what machines already keyed.

**t_claim_min_one_evidence_supported_by_evidence**

| id | supported_by_evidence |
| --- | --- |
| EVID-0001 | Chemical purity meets ISO |
| EVID-0002 | ICES marine ecosystem index |
| EVID-0003 | Reagent stability confirmed |
| EVID-0004 | Lancet longitudinal cohort study |
| EVID-0005 | WHO mortality surveillance Q3 |
| EVID-0006 | Firmware patch resolves bug |
| EVID-0007 | IPCC AR6 synthesis report |
| EVID-0008 | WHO mortality surveillance Q3 |

**t_claim_min_one_evidence__supported_by_evidence**

| id | claim_id | supported_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0004 | EVID-0002 | contributor |
| EVID-0002 | EVID-0003 | EVID-0007 | reviewer |
| EVID-0003 | EVID-0007 | EVID-0004 | owner |
| EVID-0004 | EVID-0007 | EVID-0005 | contributor |
| EVID-0005 | EVID-0005 | EVID-0004 | reviewer |
| EVID-0006 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0007 | EVID-0007 | EVID-0003 | reviewer |
| EVID-0008 | EVID-0004 | EVID-0004 | owner |