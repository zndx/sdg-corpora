---
chapter_id: ch_live_verification_concludes_with_270d39
topic_id: 69
family: 03_directive_governance
cited_terms: ['verification_concludes_with', 'schemaorg_creativework_date', 'claim_subclass']
model: engine-refine
---

Verification governance rests on a small set of relational primitives that separate what something is from what can be said about it, and from how those assertions are bound to one another. An identifier supplies the durable handle by which any record survives ingestion, deduplication, and longitudinal audit: WITH-0001 names a Compliance Gateway Scan conclusion, CLAI-0002 names the QC sample failure claim it terminates in, and DATE-0006 names a creative-work subject that participates in publication linkage without ever being confused with the publication event itself. Identifiers are not display text; they are the contract under which cross-table joins, lineage queries, and evidentiary replay remain deterministic when labels change, hosts rotate, or claim wording is revised.

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Quantum Error Correction |
| DATE-0002 | Human Genome Release |
| DATE-0003 | OAuth 2.0 Guidelines |
| DATE-0004 | Human Genome Release |
| DATE-0005 | Human Genome Release |
| DATE-0006 | OpenTelemetry Specification |

The entity is the bearer of observable state. A verification conclusion such as WITH-0001 is an entity in this sense because it accumulates measurable properties across typed value stores rather than collapsing them into a single wide row. Attributes name those properties—duration_seconds, end_time, exit_code, host_name—while attr_type declares the validation and storage regime each name must obey. Binding duration_seconds to xsd:decimal and end_time to xsd:dateTime is not cosmetic typing; it is the enforcement boundary that permits 5022.45 to be aggregated arithmetically, 2023-03-17T15:14:20 to be compared chronologically, exit_code values 299 and 242 to be evaluated as integers, and host_name values such as ingest-21 to be matched as strings without silent coercion. Attr and attr_type together establish the vocabulary and grammar of what may legally be recorded about an entity.

Miscellaneous value fields—misc in the operational schema—hold the instantiated readings once entity and attr have been resolved. The same entity_id WITH-0001 may therefore carry a decimal duration, a datetime stamp, an integer exit code, and a varchar host label in separate typed projections, each keyed by its attr_id. This partition by type is a practical safeguard: it prevents a datetime from being mistaken for a scalar magnitude, and it allows retention policies, indexing, and unit normalization to follow the semantics of the attr_type rather than the accident of column width. In compliance practice, misc is where telemetry becomes evidence—numbers and timestamps and codes that auditors can recompute, not merely re-read.

Claims introduce interpretive assertions that verification activity concludes_with, and the method field records how those assertions were produced. A claim routed through method automated signals machine derivation with minimal human mediation; hybrid denotes blended machine extraction and human confirmation, as with the intake form backing QC sample failed; inferred marks conclusions reached by rule or model when direct observation is incomplete, as in the calibration record associated with Authentication microservice. Labeltext supplies the human-facing provenance caption—audit excerpt, intake form, pre-release note, calibration record—so that reviewers can distinguish the documentary genre of support without parsing internal identifiers. Method and labeltext jointly answer the governance questions of epistemic strength and documentary class: not only what was claimed, but under what evidential discipline the claim entered the record.

**t_verification_concludes_with**

| id | verification | concludes_with |
| --- | --- | --- |
| WITH-0001 | Compliance Gateway Scan | CLAI-0002 |
| WITH-0002 | Telemetry Sync Verify | CLAI-0005 |
| WITH-0003 | Data Lineage Trace | CLAI-0004 |
| WITH-0004 | Artifact Hash Check | CLAI-0003 |
| WITH-0005 | Model Drift Assessment | CLAI-0006 |
| WITH-0006 | Artifact Hash Check | CLAI-0006 |

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | WITH-0003 | automated | audit excerpt |
| CLAI-0002 | QC sample failed | WITH-0002 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | WITH-0004 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | WITH-0002 | inferred | calibration record |
| CLAI-0005 | Telemetry endpoint offline | WITH-0003 | automated | intake form |
| CLAI-0006 | Pipeline latency spike | WITH-0006 | automated | change rationale |

Relational fabric beyond attribute values is expressed through subject, target, and role. In publication governance, a creative work identified as DATE-0006 may stand as subject linked to a date_published target DATE-0004 under role owner, while the same subject may appear as contributor toward DATE-0001 or as observer toward DATE-0002 when participation is indirect or non-authoritative. Role is not decorative metadata; it constrains accountability, citation rights, and the permissible inferences an auditor may draw from co-occurrence. Subject and target thereby orient directed edges—verification concludes_with claim, schemaorg work relates_to publication date—so that traversal from instrument reading to human assertion to bibliographic anchor preserves directionality essential for non-repudiation and for explaining why a downstream record may rely on an upstream one.

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

Taken together, identifier, entity, attr, attr_type, and misc implement a typed fact layer; method and labeltext implement a provenance and presentation layer over claims; and subject, target, and role implement a participation layer over linked resources. A Data Lineage Trace that concludes_with CLAI-0004, carrying decimal duration 4177.56 and exit_code 130, does not merely describe an event—it occupies a node in a graph whose edges are typed, whose values are schema-validated, and whose assertions declare their derivation and documentary label. That architecture is what allows compliance operations to scale: heterogeneous evidence can be ingested without homogenizing it, relationships can be queried without overloading attribute slots, and reviewers can reconstruct, from stable identifiers outward, both the measurements that were taken and the interpretive claims those measurements were permitted to support.

**t_verification_concludes_with_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WITH-0001 | duration_seconds | xsd:decimal |
| WITH-0002 | end_time | xsd:dateTime |
| WITH-0003 | exit_code | xsd:integer |
| WITH-0004 | host_name | xsd:string |
| WITH-0005 | log_level | xsd:string |
| WITH-0006 | phase | xsd:string |
| WITH-0007 | retry_count | xsd:integer |
| WITH-0008 | scheduled_at | xsd:dateTime |

**t_verification_concludes_with_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0002 | 2023-03-17T15:14:20 |
| WITH-0002 | WITH-0001 | WITH-0008 | 2023-03-29T16:58:23 |
| WITH-0003 | WITH-0001 | WITH-0009 | 2023-05-17T22:59:07 |
| WITH-0004 | WITH-0002 | WITH-0002 | 2023-10-18T10:06:06 |
| WITH-0005 | WITH-0002 | WITH-0008 | 2023-06-18T21:36:06 |
| WITH-0006 | WITH-0002 | WITH-0009 | 2025-01-08T20:27:31 |
| WITH-0007 | WITH-0003 | WITH-0002 | 2025-05-26T17:08:43 |
| WITH-0008 | WITH-0003 | WITH-0008 | 2023-08-15T17:46:49 |

**t_verification_concludes_with_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0001 | 5022.45 |
| WITH-0002 | WITH-0002 | WITH-0001 | 4498.56 |
| WITH-0003 | WITH-0003 | WITH-0001 | 4177.56 |
| WITH-0004 | WITH-0004 | WITH-0001 | 216.79 |
| WITH-0005 | WITH-0005 | WITH-0001 | 4466.82 |
| WITH-0006 | WITH-0006 | WITH-0001 | 6044.91 |

**t_verification_concludes_with_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0003 | 299 |
| WITH-0002 | WITH-0001 | WITH-0007 | 242 |
| WITH-0003 | WITH-0002 | WITH-0003 | 130 |
| WITH-0004 | WITH-0002 | WITH-0007 | 120 |
| WITH-0005 | WITH-0003 | WITH-0003 | 587 |
| WITH-0006 | WITH-0003 | WITH-0007 | 195 |
| WITH-0007 | WITH-0004 | WITH-0003 | 700 |
| WITH-0008 | WITH-0004 | WITH-0007 | 420 |

**t_verification_concludes_with_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0004 | ingest-21 |
| WITH-0002 | WITH-0001 | WITH-0005 | Log Level 02 |
| WITH-0003 | WITH-0001 | WITH-0006 | review |
| WITH-0004 | WITH-0001 | WITH-0010 | complete |
| WITH-0005 | WITH-0001 | WITH-0011 | Triggered By 05 |
| WITH-0006 | WITH-0002 | WITH-0004 | gw-12 |
| WITH-0007 | WITH-0002 | WITH-0005 | Log Level 07 |
| WITH-0008 | WITH-0002 | WITH-0006 | execution |