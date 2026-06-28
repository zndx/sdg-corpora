---
chapter_id: ch_live_dataset_with_record_count_8275fa
topic_id: 3
family: 01_foundation
cited_terms: ['dataset_with_record_count', 'dbpedia_label_alignment', 'dempster_combinant_first']
model: engine-refine
---

In governed data environments, an identifier is the durable handle by which a record remains addressable across ingestion cycles, reconciliation jobs, and downstream analytics without conflating distinct logical objects. Identifiers such as COUN-0001, ALIG-0003, and FIRS-0004 are not merely surrogate keys; they anchor provenance, enable idempotent updates, and permit joins that survive renaming of human-readable labels. Where a Mount Fuji sensor-telemetry corpus and a customer_profile_db ingestion batch may share superficial naming patterns, their separation at the identifier level prevents silent cross-contamination of metrics, retention policies, and access controls. The practical consequence is that every audit trail, lineage graph, and compliance attestation ultimately resolves to these stable references rather than to display strings that drift with locale, synonymy, or editorial revision.

An entity denotes the unit of meaning to which facts attach—the alignment between a DBpedia resource and a normalized label, a Dempster combinant configuration, or a counted dataset snapshot—while attributes name the typed properties that may be asserted about that entity. Attribute typing, expressed here through XSD-aligned declarations such as xsd:decimal for confidence, xsd:string for dimension_kind and method, and xsd:dateTime for recorded_at, is the contract that governs validation, indexing, aggregation, and interchange. Without attr_type discipline, a confidence score of 0.452 could be parsed as text, a timestamp could be coerced into a floating-point epoch, and regulatory reports would inherit silent precision loss. Attribute catalogs therefore function as schema registries: they tell operators which value stores are authoritative for which semantic slots and which coercion rules apply at ingest time.

**t_dbpedia_label_alignment**

| id | dbpedia | aligned_to_d_bpedia_label |
| --- | --- | --- |
| ALIG-0001 | Great Barrier Reef | Paris |
| ALIG-0002 | lab_specimen_registry | European Union |
| ALIG-0003 | lab_specimen_registry | Paris |
| ALIG-0004 | European Union | European Union |
| ALIG-0005 | clinical_trials_arm_b | Great Barrier Reef |
| ALIG-0006 | Paris France | Paris |

**t_dbpedia_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_dbpedia_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-30T18:47:51 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2023-03-19T14:45:09 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2023-04-29T16:40:54 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2025-02-04T06:16:43 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2025-03-19T01:28:11 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-10-31T13:56:29 |

**t_dbpedia_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.452 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 120.37 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 479.08 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.795 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 400.65 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 655.22 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.045 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 957.62 |

The misc designation, in operational parlance, marks the payload—the literal value materialized once entity and attribute have been resolved. Decimal misc values including 0.452 and 479.08 quantify alignment strength or derived measurements; varchar misc entries such as Encoding 02 and nightly summary carry categorical or procedural annotations; datetime misc values spanning 2023-03-19T14:45:09 through 2025-02-04T06:16:43 establish temporal bounds on when an assertion became valid. Partitioning misc by physical type rather than stuffing heterogeneous values into a single untyped column is a deliberate governance choice: it preserves index selectivity, enables type-safe APIs, and allows retention and encryption policies to differ by sensitivity class. In the alignment domain, repeated attachment of attr_id ALIG-0004 (recorded_at) across entities ALIG-0001 through ALIG-0004 illustrates how one attribute definition fans out to many entity instances, each carrying its own misc without duplicating metadata about what recorded_at means.

Version and sizebytes address complementary dimensions of corpus lifecycle management. Version numbers—observed at 3 for Mount Fuji and International Space Station holdings versus 8 and 12 for clinical_trials_arm_b and customer_profile_db—signal generational change in content, schema, or derivation logic, and they matter because consumers must know whether they are comparing like with like when reconciling record counts or recomputing aggregates. Sizebytes, quantified here from roughly 1.78×10⁸ through 9.73×10⁸ bytes, operationalizes storage planning, transfer budgeting, and tiering decisions; a satellite_image corpus at 973314714 bytes and a sensor_telemetry stream at 177784075 bytes impose different backup windows, checksum strategies, and disaster-recovery RPO/RTO targets even when both share a version index of 3. Together, version and sizebytes let stewards answer whether growth is an expected artifact of new observations or an anomaly warranting investigation.

**t_dataset_with_record_count**

| id | dataset | record | size_bytes | version |
| --- | --- | --- | --- | --- |
| COUN-0001 | Mount Fuji | sensor_telemetry | 177784075 | 3 |
| COUN-0002 | clinical_trials_arm_b | ingestion_batch | 723832596 | 8 |
| COUN-0003 | International Space Station | satellite_image | 973314714 | 3 |
| COUN-0004 | customer_profile_db | sensor_telemetry | 658168246 | 12 |
| COUN-0005 | inventory_snapshot | compliance_audit | 780581245 | 4 |
| COUN-0006 | Apple Inc | satellite_image | 519122574 | 10 |
| COUN-0007 | Great Barrier Reef | financial_transaction | 692732003 | 3 |

Relational assertions over combinatorial inference pipelines introduce subject, target, and role as first-class semantic primitives distinct from mere foreign-key linkage. A subject such as FIRS-0001 (UncertaintyPropagationPipeline) or FIRS-0005 denotes the actor or container whose behavior is being characterized; a target such as FIRS-0005 (CoreTelemetryFeed) or FIRS-0006 names the counterpart resource that participates in the relationship; and role—observer, reviewer, or owner—qualifies the nature of participation rather than leaving it implicit. An observer pairing of UncertaintyPropagationPipeline with GroundTruthLabels is not interchangeable with an owner pairing involving a different combinant identity, because authorization, liability, and evidentiary weight attach to role, not to connectivity alone. This tripartite pattern generalizes beyond Dempster-Shafer combinant graphs to any governance model that must express directed, typed associations among operational components.

**t_dempster_combinant_first**

| id | dempster |
| --- | --- |
| FIRS-0001 | UncertaintyPropagationPipeline |
| FIRS-0002 | MultiSourceInferenceEngine |
| FIRS-0003 | EvidenceCombinationModel |
| FIRS-0004 | ProvenanceAggregator |
| FIRS-0005 | DataQualityFusionService |
| FIRS-0006 | BeliefFusionEngine |

**t_dempster_combinant_first_first_combinant**

| id | first_combinant |
| --- | --- |
| FIRS-0001 | HistoricalLogArchive |
| FIRS-0002 | CoreTelemetryFeed |
| FIRS-0003 | GroundTruthLabels |
| FIRS-0004 | PrimaryFlightData |
| FIRS-0005 | LIDARPointCloud |
| FIRS-0006 | BaselineSensorArray |

**t_dempster_combinant_first__first_combinant**

| id | dempster_id | first_combinant_id | role |
| --- | --- | --- | --- |
| FIRS-0001 | FIRS-0001 | FIRS-0005 | observer |
| FIRS-0002 | FIRS-0005 | FIRS-0002 | reviewer |
| FIRS-0003 | FIRS-0001 | FIRS-0004 | observer |
| FIRS-0004 | FIRS-0005 | FIRS-0006 | owner |
| FIRS-0005 | FIRS-0004 | FIRS-0005 | owner |
| FIRS-0006 | FIRS-0005 | FIRS-0005 | owner |
| FIRS-0007 | FIRS-0006 | FIRS-0004 | contributor |
| FIRS-0008 | FIRS-0002 | FIRS-0005 | observer |

Across these constructs, the recurring design principle is separation of identity, semantics, typing, and value. Identifiers stabilize reference; entities delimit the scope of truth; attr and attr_type declare what may be said and how it must be encoded; misc carries the said facts; version and sizebytes situate corpora in time and infrastructure; and subject, target, and role articulate who relates to whom under which operational mandate. When alignment operations map Great Barrier Reef to Paris while lab_specimen_registry resolves variously to Paris or European Union, the resulting ambiguity is manageable only because each mapping row remains keyed, each confidence or method assertion remains typed, and each recorded_at misc remains independently verifiable. Mature compliance practice treats these elements not as incidental column labels but as the minimal vocabulary for defensible data stewardship: every control—from access review to evidentiary chain-of-custody—ultimately decomposes into correctly scoped identifiers, correctly typed attributes, and correctly attributed relationships.

**t_dbpedia_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | hybrid |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | deg_C |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |