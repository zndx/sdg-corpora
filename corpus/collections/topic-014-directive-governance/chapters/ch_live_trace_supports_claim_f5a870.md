---
chapter_id: ch_live_trace_supports_claim_f5a870
topic_id: 14
family: 07_long_tail
cited_terms: ['trace_supports_claim', 'flood_asset_vulnerability_assessment', 'counter_metric_subclass']
model: engine-refine
---

In governed information systems, the identifier is the non-negotiable anchor that permits a record to be cited, reconciled, and audited across time and subsystem boundaries. Identifiers such as CLAI-0001 through CLAI-0004 denote discrete evidentiary claims whose provenance is carried by trace lineage—compliance-audit-cycle, sensor-calibration-seq, incident-response-workflow, and telemetry-ingestion-stream—so that any downstream assertion can be traced to the operational context that produced it. Without a stable identifier, correlation of attributes, typed values, and assessment artefacts collapses into ambiguity; with it, each claim remains addressable even as surrounding metadata evolves, versions increment, or language-localised labels proliferate.

**t_trace_supports_claim**

| id | trace |
| --- | --- |
| CLAI-0001 | compliance-audit-cycle |
| CLAI-0002 | sensor-calibration-seq |
| CLAI-0003 | incident-response-workflow |
| CLAI-0004 | telemetry-ingestion-stream |
| CLAI-0005 | incident-response-workflow |
| CLAI-0006 | log-aggregation-cycle |

**t_trace_supports_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

The entity is the subject of description: the thing to which attributes attach and from which evidentiary weight is derived. In trace-supported claim modelling, entity and claim identifiers frequently coincide—CLAI-0001, CLAI-0002, and their successors—because the claim itself is the unit under assertion, yet the entity identifier also governs how values are partitioned across typed stores. An attribute (attr) names what is being said about that entity: confidence, dimension_kind, method, and recorded_at each denote a distinct semantic slot whose meaning must be declared before values may be interpreted. Attribute type (attr_type) then constrains interpretation and storage: xsd:decimal admits quantitative measures such as 0.088 and 0.802 for confidence, or 473.29 and 607.77 where magnitude matters; xsd:string carries lexical content including Dimension Kind 01, Encoding 02, intake form, and locale codes such as es; xsd:dateTime fixes temporal instants—2024-06-12T18:13:41 for one claim, 2024-09-25T21:45:51 for another—so that sequencing, retention, and statutory timeliness can be evaluated without conflating clock time with narrative description.

Values themselves are materialised in misc-typed columns whose heterogeneity is deliberate rather than negligent. The misc designation signals that the payload is semantically typed elsewhere—by attr and attr_type—and must not be read as an undifferentiated blob. A decimal misc of 0.802 bound to CLAI-0002 under confidence supports a different compliance inference than 0.088 on CLAI-0001; a varchar misc of intake form on CLAI-0009 characterises method, while es on CLAI-0010 encodes language preference within the same evidentiary family. Datetime misc entries uniformly reference recorded_at (CLAI-0004) across all four claims, demonstrating how a single attribute identifier can normalise temporal stamping while entity scope varies claim by claim. This separation of name, type, and value is what allows auditors to verify not merely that data exist, but that they exist in the correct logical compartment.

**t_trace_supports_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-06-12T18:13:41 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-04-03T22:44:05 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-09-25T21:45:51 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-07-08T19:08:05 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-05-02T18:38:21 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-03-27T11:44:46 |

**t_trace_supports_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.088 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 473.29 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 607.77 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.802 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 968.55 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 413.59 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.176 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 496.89 |

**t_trace_supports_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | intake form |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | hybrid |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | count |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Flood-asset governance extends the same identifier discipline into condition and vulnerability assessment. A floodassetvulnerabilityassessment record—ASSE-0001 assessing the 2022 Pakistan Monsoon, ASSE-0003 addressing Levee Seepage, ASSE-0004 documenting Bridge Foundation Scour—constitutes a formal evaluation episode that must remain retrievable alongside the asset state it interrogates. The floodassetcondition dimension captures assessed physical or operational condition: High Erosion Risk, Critical Structural Failure, Complete Bypass Failure, each paired with a vulnerability state such as Water Treatment Inundation, Thames Spring Overflow, or Hurricane Ida Surge. These pairings matter because regulatory reporting typically requires both the hazard mechanism and the asset manifestation; conflating them erodes defensibility under scrutiny. labeltext supplies human-facing descriptors—calibration record, nightly summary—that orient operators and reviewers without substituting for the canonical assessment identifier, while language tags (de, fr, ja) ensure that labels remain locale-appropriate without duplicating the underlying assessment key.

**t_flood_asset_vulnerability_assessment**

| id | flood_asset_vulnerability_assessment | assesses_asset_condition | identifies_vulnerability_state | label_text | language |
| --- | --- | --- | --- | --- | --- |
| ASSE-0001 | 2022 Pakistan Monsoon | 2022 Pakistan Monsoon | Water Treatment Inundation | calibration record | de |
| ASSE-0002 | Partial System Failure | High Erosion Risk | Thames Spring Overflow | nightly summary | fr |
| ASSE-0003 | Levee Seepage | Critical Structural Failure | Thames Spring Overflow | nightly summary | fr |
| ASSE-0004 | Bridge Foundation Scour | Complete Bypass Failure | Hurricane Ida Surge | nightly summary | ja |
| ASSE-0005 | Moderate Siltation | Complete Bypass Failure | Elevated Seepage Rate | intake form | es |
| ASSE-0006 | Low Drainage Capacity | Total Inundation | Moderate Siltation | audit excerpt | fr |
| ASSE-0007 | Severe Foundation Compromise | Water Treatment Inundation | Gulf Coast Storm Flood | intake form | es |
| ASSE-0008 | Critical Structural Failure | Critical Structural Failure | Pump Station Submersion | pre-release note | en |

Metric governance parallels this pattern at the scale of operational measurement and storage accountability. Metric kind classifies what is being counted or sized: fact_counter rows reference metric_kind_key values METR-0003, METR-0004, and METR-0005, resolved through dim_metric_kind to labels and categories such as Metric Kind Category 03 and Metric Kind Category 04. Category provides the rollup axis—capacity planning, compliance reporting, and cost allocation all depend on consistent categorical assignment rather than on ad hoc label text. size_bytes quantifies the material footprint of each counter instance—977102405, 609833100, 881633277, 422660739 bytes across versions 12, 8, 7, and 5—so that retention policy, tiering, and evidentiary completeness can be weighed against storage exposure. Where category answers “what class of measure is this,” size_bytes answers “what burden does retaining it impose,” and together they inform whether a given metric kind remains proportionate to the governance obligation it serves.

Taken together, identifier, entity, attr, attr_type, misc, category, metric kind, size_bytes, floodassetvulnerabilityassessment, floodassetcondition, labeltext, and language form an interlocking vocabulary for defensible information management. Identifiers bind records; entities specify subjects; attributes and their types declare meaning; misc columns carry typed payloads; assessment and condition fields document hazard-facing judgements; labels and language mediate human comprehension; categories and metric kinds organise measurement; and size_bytes grounds abstract compliance requirements in measurable resource fact. Systems that honour this separation—evidenced by the coexistence of trace lineage on CLAI claims, typed value partitions, multilingual assessment labels, and versioned byte-scale counters—are positioned to satisfy audit, not merely to accumulate data.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |