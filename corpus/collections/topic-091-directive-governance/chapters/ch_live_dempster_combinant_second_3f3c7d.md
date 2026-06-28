---
chapter_id: ch_live_dempster_combinant_second_3f3c7d
topic_id: 91
family: 07_long_tail
cited_terms: ['dempster_combinant_second', 'process_with_min_one_artifact', 'professional_experience']
model: engine-refine
---

In governed operational systems, every durable fact must be addressable without ambiguity, which is why identifier discipline sits at the foundation of auditability and downstream reconciliation. A stable identifier such as SECO-0001 or ARTI-0003 is not merely a surrogate key; it is the contractual handle by which evidence combinations, process runs, and professional attestations remain joinable across ingestion batches, schema migrations, and jurisdictional review. When AnomalyFusionEngine is paired with GPSPositionLog under SECO-0002, or when a Provenance capture run is recorded as ARTI-0003, the identifier ensures that later queries about confidence, exit code, or recorded_at retrieve the same logical object the originating subsystem intended, even if physical storage is partitioned across typed value relations.

The entity is the subject to which attributes attach, and attr is the named dimension along which that subject is described. In practice, entity_id and attr_id function as a typed assertion: SECO-0001 carries confidence as xsd:decimal, dimension_kind as xsd:string, and recorded_at as xsd:dateTime, while a schema migration job under ARTI-0001 may simultaneously expose duration_seconds, end_time, exit_code, and host_name. Attr_type matters because it governs validation, comparison, and serialization semantics before any value is accepted; a decimal confidence of 0.328 is not interchangeable with a datetime stamp of 2024-10-02T15:13:46, and treating them as such would corrupt fusion thresholds, SLA measurement, or forensic timelines. Governance therefore treats attr and attr_type as a published contract: attr_name declares intent, attr_type declares the lawful representation.

Misc, in this architecture, denotes the stored assertion itself—the literal payload held once entity and attr have been resolved. Rather than coercing heterogeneous facts into a single untyped column, the model routes misc through encoding-appropriate value carriers: varchar misc holds lexical material such as Dimension Kind 01, Encoding 02, nightly summary, or the language tag en; decimal misc holds magnitudes including 597.98, 738.09, and duration_seconds readings of 148.27 and 6895.59; datetime misc anchors temporal evidence from 2023-03-27T03:16:31 through 2025-04-14T02:53:50; integer misc captures discrete outcomes like exit codes 973, 28, 750, and 47. This separation is an operational safeguard: validators can reject misc that violates attr_type, and auditors can reason about units and comparability without inferring type from context.

Encoding and language extend the same principle from machine representation to human-legible provenance. Professional experience records bind a named attestation—Elena Rostova, Marcus Chen, or Fatima Al-Mansour—to a holder such as ML Platform Unit or Governance Council, an organization including Nexus Data Corp or Systems Reliability, a character encoding among latin1, utf8, or ascii, and a declared language among fr, de, es, or ja. Encoding determines how lexical misc round-trips through storage and export pipelines without substitution or truncation; language determines interpretive context for narrative fields, compliance copy, and cross-border disclosure. A record encoded as ascii but labeled es, or utf8 with ja, signals explicit stewardship choices that downstream consumers must honor when rendering credentials, role history, or accountable sign-off.

Organization and person complete the accountability graph by situating technical artifacts within responsible parties. Organizations name the institutional locus—Quality Assurance appears both as holder and as organization in the professional experience corpus, reflecting how duty-of-care and verification authority may coincide in matrixed enterprises—while person, realized here through holder and professional_experience naming, ties abstract process telemetry to accountable actors. When Batch ingestion run ARTI-0004 reports host_name node-a01, exit_code 47, and status misc failed, investigators do not stop at the process identifier; they trace backward through organizations and holders to determine who authorized the run, under which encoding and language conventions attestations were recorded, and whether combinant evidence such as LabDataCombinerNode fused with BaselineTelemetryTrace at confidence 0.558 before a governance decision was taken.

**t_process_with_min_one_artifact**

| id | process |
| --- | --- |
| ARTI-0001 | Schema migration job |
| ARTI-0002 | Data quality validation |
| ARTI-0003 | Provenance capture run |
| ARTI-0004 | Batch ingestion run |
| ARTI-0005 | Stream processing cycle |
| ARTI-0006 | Metadata extraction run |
| ARTI-0007 | Model retraining pass |

**t_professional_experience**

| id | professional_experience | holder | organization | encoding | language |
| --- | --- | --- | --- | --- | --- |
| EXPE-0001 | Elena Rostova | ML Platform Unit | Nexus Data Corp | latin1 | fr |
| EXPE-0002 | Marcus Chen | Quality Assurance | Quality Assurance | utf8 | de |
| EXPE-0003 | Fatima Al-Mansour | Quantum Provenance | Systems Reliability | ascii | es |
| EXPE-0004 | Fatima Al-Mansour | Governance Council | Quality Assurance | utf8 | ja |
| EXPE-0005 | Sofia Rossi | Atlas Infrastructure | Quantum Provenance | latin1 | es |
| EXPE-0006 | Liam O'Connor | ML Platform Unit | Stratos Cloud | ascii | es |
| EXPE-0007 | Yuki Tanaka | Platform Operations | Orion Telemetry Inc | ascii | fr |
| EXPE-0008 | Yuki Tanaka | Aegis Governance Ltd | Quality Assurance | utf8 | ja |

Taken together, identifier, entity, attr, attr_type, misc, encoding, language, organization, person, and professional experience form a single evidentiary grammar for systems that must defend their conclusions. Dempster combinant pairings—EvidenceCombinationBeta with SourceMetadataRegistry, GovernanceEvidenceModel with ThermalImagingFeed—supply fused observational claims whose typed attrs and misc values quantify trust and timing; process artifacts with minimum one attached record supply the operational mirror image, proving that Schema migration jobs, Data quality validation, and Provenance capture runs executed with measurable duration, bounded end times, and inspectable exit codes. Professional experience overlays human and institutional context so that neither automated fusion nor batch processing floats free of organizational memory. Mature compliance practice treats these elements not as incidental metadata but as co-equal evidence: without attr_type discipline misc becomes noise, without encoding and language fidelity person and organization lose verifiable meaning, and without persistent identifiers the entire chain of entity-bound assertions collapses at the first adversarial review.

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | SourceMetadataRegistry |
| SECO-0002 | AnomalyFusionEngine | GPSPositionLog |
| SECO-0003 | LabDataCombinerNode | BaselineTelemetryTrace |
| SECO-0004 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0005 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0006 | GovernanceEvidenceModel | SpectralAnalysisOutput |
| SECO-0007 | CrossDomainEvidenceRule | PressureSensorArray |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

**t_process_with_min_one_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_process_with_min_one_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2025-04-14T02:53:50 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2024-05-27T05:53:32 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2023-10-14T03:08:29 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2024-12-11T09:34:24 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2025-03-21T21:19:18 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-01-02T13:07:40 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2024-10-24T03:35:48 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2023-04-04T03:39:03 |

**t_process_with_min_one_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 148.27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 6895.59 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 3687.07 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 1136.57 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 4210.38 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 5529.13 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 4109.43 |

**t_process_with_min_one_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 973 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 28 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 750 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 47 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 118 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 269 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 506 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 132 |

**t_process_with_min_one_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | initiation |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | failed |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | edge-03 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | execution |