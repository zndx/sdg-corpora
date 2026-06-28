---
chapter_id: ch_live_schemaorg_place_geocoord_4c514a
topic_id: 35
family: 07_long_tail
cited_terms: ['schemaorg_place_geocoord', 'evidence_independent_of', 'transformation_only_uses_datasets']
model: engine-refine
---

Geospatial provenance in governed data environments rests on stable identifiers that survive schema evolution, lineage recomputation, and cross-system federation. An identifier such as GEOC-0004 functions not merely as a surrogate key but as the durable handle by which coordinate semantics, storage metrics, and downstream attestations remain joinable across releases; when the same key appears repeatedly as the geo-coordinates reference for distinct fact records, the pattern signals intentional reuse of a canonical spatial definition rather than accidental duplication. Category and miscellaneous descriptive attributes—here instantiated as Geo Coordinates Category 04 paired with Geo Coordinates Label 04—supply the controlled vocabulary and human-legible gloss that auditors and operators require when byte-level payloads cannot be interpreted without contextual framing. Category constrains how a coordinate set may be consumed in policy rules (permitted use, retention class, disclosure tier), while misc fields carry operational nuance that does not warrant a full dimension hierarchy yet must remain queryable for incident response and disclosure workflows.

**dim_geo_coordinates**

| id | geo_coordinates_label | geo_coordinates_category |
| --- | --- | --- |
| GEOC-0001 | Geo Coordinates Label 01 | Geo Coordinates Category 01 |
| GEOC-0002 | Geo Coordinates Label 02 | Geo Coordinates Category 02 |
| GEOC-0003 | Geo Coordinates Label 03 | Geo Coordinates Category 03 |
| GEOC-0004 | Geo Coordinates Label 04 | Geo Coordinates Category 04 |
| GEOC-0005 | Geo Coordinates Label 05 | Geo Coordinates Category 05 |
| GEOC-0006 | Geo Coordinates Label 06 | Geo Coordinates Category 06 |

Byte magnitude and version jointly operationalize the materiality and temporal integrity of geospatial facts. Size in bytes—ranging in the exemplar corpus from 114,301,972 through 998,785,819—drives capacity planning, transfer-cost accounting, and the thresholding of integrity checks; large objects demand chunked verification, resumable replication, and explicit checksum policies, whereas smaller artifacts may be inlined in audit bundles. Version numbers (3, 5, 4, 8 in the sample) encode generational state: each increment should correspond to a documented change in coordinate reference system, precision model, derivation pipeline, or legal basis for collection. Governance practice treats version as an immutable lineage marker at write time; consumers that resolve GEOC-0004 at version 8 must not silently substitute semantics established at version 3 without a recorded migration and, where required, re-attestation of dependent evidence.

**fact_schemaorg**

| id | geo_coordinates_key | size_bytes | version |
| --- | --- | --- | --- |
| GEOC-0001 | GEOC-0004 | 895265030 | 3 |
| GEOC-0002 | GEOC-0006 | 114301972 | 5 |
| GEOC-0003 | GEOC-0004 | 338701831 | 4 |
| GEOC-0004 | GEOC-0004 | 998785819 | 8 |

Independence of evidence from infrastructural or representational substrates is a foundational compliance construct, distinct from simple correlation or co-location in a repository. The evidence types illustrated—clinical trial outcome, compliance certification record, sensor calibration trace, lab assay result—are assertions whose probative value must be evaluable even when the systems that once housed them are retired or reconfigured. Declaring that such evidence is independent of a data warehouse, labeling schema, or measurement device means the epistemic claim can be validated from primary records, chain-of-custody metadata, and method documentation without requiring the continued availability of a particular storage tier or vendor-specific encoding. Where independence is partial or conditional, the exception must be explicit; otherwise downstream risk models inherit hidden environmental dependencies that invalidate reproducibility under discovery or regulatory examination.

**t_evidence_independent_of**

| id | evidence |
| --- | --- |
| INDE-0001 | clinical trial outcome |
| INDE-0002 | compliance certification record |
| INDE-0003 | sensor calibration trace |
| INDE-0004 | lab assay result |
| INDE-0005 | batch processing checksum |
| INDE-0006 | telemetry snapshot |
| INDE-0007 | compliance certification record |

**t_evidence_independent_of_evidence_independent_of**

| id | evidence_independent_of |
| --- | --- |
| INDE-0001 | data warehouse |
| INDE-0002 | labeling schema |
| INDE-0003 | measurement device |
| INDE-0004 | data warehouse |
| INDE-0005 | partition strategy |
| INDE-0006 | git repository |
| INDE-0007 | monitoring dashboard |
| INDE-0008 | labeling schema |

Relationship semantics between subjects and targets are not inferable from adjacency alone and are therefore materialized with explicit role assignments at the association grain. In evidence-to-independence linkages, a subject evidence identifier binds to a target independence anchor under roles such as contributor, reviewer, or observer—distinctions that govern who may assert, corroborate, or merely witness a claim without altering it. The recurrence of a single independence target (INDE-0008) across multiple evidence subjects typifies shared infrastructural preconditions audited once and referenced many times, while differentiated roles prevent a reviewer relationship from being misread as authorship. The same subject–target–role triad appears in transformation governance: a calibration routine or validation check (subject) uses an ingestion buffer queue or historical metrics dataset (target) as contributor or observer inputs, encoding whether the entity supplies authoritative inputs, passive context, or non-binding oversight. Mislabelled roles constitute a control deficiency because they break segregation-of-duties proofs and corrupt automated policy engines that authorize publication, de-identification, or external transfer based on typed edges.

**t_evidence_independent_of__evidence_independent_of**

| id | evidence_id | evidence_independent_of_id | role |
| --- | --- | --- | --- |
| INDE-0001 | INDE-0005 | INDE-0008 | contributor |
| INDE-0002 | INDE-0003 | INDE-0008 | reviewer |
| INDE-0003 | INDE-0003 | INDE-0008 | observer |
| INDE-0004 | INDE-0002 | INDE-0005 | reviewer |
| INDE-0005 | INDE-0002 | INDE-0003 | observer |
| INDE-0006 | INDE-0006 | INDE-0001 | contributor |
| INDE-0007 | INDE-0001 | INDE-0005 | contributor |
| INDE-0008 | INDE-0002 | INDE-0005 | contributor |

Transformation pipelines that only use datasets under declared entity roles complete the operational picture by constraining what may enter a derived artifact without expanding scope beyond approved sources. Signal denoising filters, telemetry ingestion filters, and validation checks each name a bounded operation whose permitted inputs are enumerated through uses-entity bindings—event log archives, feature registry caches, and similar stores—rather than through ad hoc filesystem access. Pairing transformation identity with entity identity under contributor versus observer roles ensures that provenance graphs remain legible: contributors supply data whose license, retention, and quality tier propagate; observers supply diagnostic context that must not flow into regulated outputs unless separately authorized. Together, identifier stability, classified geo-coordinates metadata, byte and version accounting, evidence independence declarations, and typed subject–target roles form an interlocking control fabric in which spatial facts, attestations, and derivations can be reconstructed, challenged, and released under policy without collapsing into undifferentiated document stores or irreproducible pipeline snapshots.

**t_transformation_only_uses_datasets**

| id | transformation |
| --- | --- |
| DATA-0001 | validation check |
| DATA-0002 | signal denoising filter |
| DATA-0003 | calibration routine |
| DATA-0004 | telemetry ingestion filter |
| DATA-0005 | feature engineering step |
| DATA-0006 | format conversion layer |

**t_transformation_only_uses_datasets_uses_entity**

| id | uses_entity |
| --- | --- |
| DATA-0001 | event log archive |
| DATA-0002 | feature registry cache |
| DATA-0003 | ingestion buffer queue |
| DATA-0004 | historical metrics dataset |
| DATA-0005 | configuration manifest |
| DATA-0006 | configuration manifest |

**t_transformation_only_uses_datasets__uses_entity**

| id | transformation_id | uses_entity_id | role |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | DATA-0002 | reviewer |
| DATA-0002 | DATA-0001 | DATA-0002 | observer |
| DATA-0003 | DATA-0003 | DATA-0003 | contributor |
| DATA-0004 | DATA-0001 | DATA-0004 | contributor |
| DATA-0005 | DATA-0005 | DATA-0001 | observer |
| DATA-0006 | DATA-0005 | DATA-0003 | reviewer |
| DATA-0007 | DATA-0003 | DATA-0006 | reviewer |
| DATA-0008 | DATA-0005 | DATA-0003 | contributor |