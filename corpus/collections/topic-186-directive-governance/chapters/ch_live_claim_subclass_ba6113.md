---
chapter_id: ch_live_claim_subclass_ba6113
topic_id: 186
family: 06_belief_structure
cited_terms: ['claim_subclass', 'ganglion_cyst_tissue_origin', 'aggregation_over_time_window']
model: engine-refine
---

In governed reference systems, every durable fact begins with an identifier—a stable, opaque key that survives renaming, reclassification, and downstream integration. Identifiers such as `CLAI-0001`, `ORIG-0007`, and `WIND-0003` do not describe anything by themselves; they anchor records so that assertions, measurements, and relationships can be cited, audited, and reconciled across pipelines that may never share a common natural-language label. An entity is the thing those identifiers denote in operational use: a time-bounded aggregation definition, a tissue-origin concept, or any other unit that must carry structured metadata without collapsing into a single wide row. Separating identity from description is what allows the same logical object to accumulate heterogeneous evidence over time while remaining addressable under policy.

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

Attributes extend entities through a deliberately typed extension model. An attr names what is being said—`confidence`, `dimension_kind`, `method`, `recorded_at`—while attr type constrains how it may legally be stored and compared, whether as `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. Governance depends on that pairing: without attr type, a downstream consumer cannot know whether `0.781` is a probability, a currency amount, or a dimensionless ratio, and cannot enforce validation at intake. In practice, values are materialized in type-aligned stores and surfaced through a neutral value slot (misc) that holds the literal payload—`86.18` beside `Dimension Kind 01`, or `2025-01-03T19:33:06` beside `en`—while entity and attr foreign keys preserve which object spoke which property. That entity–attribute–value pattern is why a single aggregation such as `RealTimeClusterLoad` evaluated `over_time_window` `MonthlySettlement` can simultaneously publish a decimal confidence, a varchar classification, and a datetime audit stamp without schema churn each time a new measurable facet appears.

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

Assertions about the world—what is claimed, and what it is claimed about—require explicit provenance because compliance and clinical safety both punish silent inference. A claim such as “Packet loss SLA breach” asserted about “Kafka cluster node-3” is not interchangeable with the reverse pairing even when the words overlap; directionality fixes accountability. The method records how the assertion entered the corpus: `automated` ingestion, `hybrid` human–machine adjudication, or `inferred` derivation from other facts. That distinction matters in audit replay, because inferred claims typically carry weaker defensibility unless the inference graph is itself versioned. Labeltext supplies the human-facing documentary anchor—`audit excerpt`, `intake form`, `pre-release note`, `calibration record`—so reviewers can trace a machine-readable identifier back to the evidentiary artifact a regulator or clinician would recognize. Together, method and labeltext turn bare triples into governable statements with an inspectable chain of support.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | Packet loss SLA breach | automated | audit excerpt |
| CLAI-0002 | QC sample failed | Kafka cluster node-3 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | IoT temperature sensor-42 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | API gateway prod | inferred | calibration record |

Relational knowledge is rarely flat; it is carried by subject–target bindings qualified by role. In anatomical reference data, a ganglion cyst tissue origin such as “sacroiliac joint” or “first dorsal compartment” must be linked to connective tissue structure constituents—`periosteal layer`, `joint capsule`, `deep fascia`, `fibrous adventitia`—without collapsing distinct clinical meanings into one undifferentiated part list. The subject names the owning or originating concept (`ORIG-0007` tied to multiple part relationships), the target names the structural element being related (`ORIG-0001`, `ORIG-0005`), and role states the governance semantics of that edge: `owner` versus `contributor` versus `reviewer`. Roles prevent symmetric confusion when the same structure participates in multiple origins, or when one origin spans several structures with different stewardship obligations. This is the same architectural move seen outside medicine: who asserts, who maintains, and who attests must be explicit whenever two controlled vocabularies meet.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

Clinical specificity and operational telemetry share one design pressure: time and context must not be implicit. Ganglion cyst tissue origin terms encode where proliferative tissue is understood to arise in musculoskeletal practice—`metacarpophalangeal joint`, `subacromial bursa`—while connective tissue structure terms name the histological or regional scaffolding those origins elaborate. Keeping those families distinct preserves interoperability with terminology services and prevents anatomical overloading in analytics. Parallelly, aggregation-over-time-window pairings such as `MonthlyThroughputMetric` over `MonthlySettlement`, or `AnnualCapacityForecast` over `TrailingSevenDays` versus `BusinessHours`, define the unit of analysis before any metric value is accepted. The window is not decoration; it fixes comparability, settlement boundaries, and alert semantics.

Operational maturity shows up when identifiers, typed attributes, directed claims, and role-bearing relationships compose end to end. A forecast published with `confidence` `0.307`, `dimension_kind` `Dimension Kind 01`, and `recorded_at` `2023-06-25T19:59:38` is only actionable if each field’s attr type was honored at write time and if the aggregation–window definition (`WIND-0002`) was already registered as the entity scope. Likewise, an anatomical assertion that subacromial bursa elaborates through deep fascia under an `owner` role is reviewable only because subject, target, and role were stored as first-class facts rather than buried in narrative text. The domain’s through-line is disciplined reference: name things once, type what you say about them, document how you know, and bind related concepts with explicit participation semantics—so automated systems, human reviewers, and external auditors read the same durable story.