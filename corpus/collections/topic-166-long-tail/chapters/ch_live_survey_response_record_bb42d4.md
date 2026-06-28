---
chapter_id: ch_live_survey_response_record_bb42d4
topic_id: 166
family: 08_derived
cited_terms: ['survey_response_record', 'claim_supported_by_evidence', 'intermediate_floor_assembly']
model: engine-refine
---

In governed research and operational compliance environments, stable identification underwrites every auditable assertion: an identifier such as RECO-0001 or EVID-0003 is not merely a surrogate key but the durable handle by which downstream reconciliation, retention policy, and cross-system federation remain possible when human-readable labels collide or evolve. Survey response records—Peer-Review-Submission, Q3-2023-Feedback, Safety-Compliance-Check—constitute the primary documentary surface through which institutional process is captured; each record binds to a researcher profile attribute (Clearance-Level, Domain-Expertise-Code, Protocol-Approval-Ref) so that eligibility, expertise scope, and protocol lineage can be evaluated without re-deriving context from free text. Because the same feedback instrument may recur across quarters, as when Q3-2023-Feedback appears twice under RECO-0002 and RECO-0004, the identifier pair (record id, captured attribute) disambiguates otherwise identical titles and prevents mistaken merges during longitudinal analysis.

Encoding and language metadata govern interpretability at the boundary where structured capture meets human expression. A record declared ascii versus unicode or utf8 signals which character repertoire and normalization rules apply before validation, redaction, or machine extraction; paired language codes—es, de, en—establish the lexical frame for consent text, hazard notices, and attestation fields. Where RECO-0001 and RECO-0003 both carry Spanish language tags yet differ in encoding (ascii against utf8), compliance reviewers must treat them as materially distinct ingestion paths: truncation, mojibake, or policy mismatch may arise if a single parser assumes homogeneous byte semantics. Researcher profile attributes therefore function as typed governance hooks: they name the facet of identity or authorization under examination (clearance tier, domain expertise code, protocol approval reference) rather than the survey instrument itself, enabling attribute-centric policy rules that survive instrument redesign.

Evidence-backed claims extend the same identification discipline into the evidentiary substrate on which assertions rest. Each entity—here instantiated as evidentiary objects EVID-0001 through EVID-0004—anchors a claim (Model accuracy benchmark, Server latency threshold breach, Emissions compliance record) to one or more supporting artifacts (Lab assay sheet, Kafka consumer lag metric, Git commit hash). Attributes (attr) decorate those entities with named, typed facets: confidence as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime. The attr type is the contract that dictates storage partition, comparison semantics, and permissible operators; decimal confidence values such as 0.768 and 0.833 admit ordered thresholds, whereas varchar-held method strings like nightly summary or language tag de require lexical equality and controlled vocabularies. Typed value tables materialize this contract in practice by routing each misc value—the concrete datum—to the physical representation matching its declared type, so that 2024-08-09T04:01:38 and peer decimal measurements 631.25 or 135.16 cannot be coerced silently into a single undifferentiated column.

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

The separation of entity, attr, and misc value is what makes heterogeneous evidence auditable under a unified claim model. Entity_id and attr_id jointly locate a value within the evidentiary graph: the same attr_id EVID-0004 (recorded_at) may timestamp multiple entities, while a single entity such as EVID-0001 may simultaneously carry confidence, dimensional classification (Dimension Kind 01), encoding annotation (Encoding 02), and procedural method strings. When two distinct claims—EVID-0002 and EVID-0003—share the textual claim Server latency threshold breach yet diverge in supporting evidence and in recorded_at stamps (2023-12-19T17:45:47 versus 2024-10-20T14:55:58), reviewers rely on identifiers and typed attrs to distinguish recurrence from duplication. Misc, in this architecture, denotes the payload slot whose interpretation is entirely delegated to attr_type; it is deliberately agnostic at the schema edge so governance logic remains centralized in attribute definitions rather than proliferating ad hoc columns per claim species.

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | Lab assay sheet |
| EVID-0002 | Server latency threshold breach | Kafka consumer lag metric |
| EVID-0003 | Server latency threshold breach | Lab assay sheet |
| EVID-0004 | Emissions compliance record | Git commit hash |
| EVID-0005 | Emissions compliance record | Calibration certificate |
| EVID-0006 | Batch ingestion delay anomaly | CloudWatch snapshot |

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

Physical assembly governance parallels the evidentiary pattern through intermediate floor assemblies—Gearbox Intermediate Shelf, Motor Mount Deck, Wing Spar Floor—each identified (ASSE-0001 through ASSE-0004) and decomposed into constituent components named under the lateral restraint strap family of parts: Retaining Clip, Locking Clevis, Shear Pin Assembly, Damping Mount. The lateral restraint strap designation classifies components whose primary compliance function is to resist lateral displacement and transfer shear within a floor assembly stack; containment relationships (contains_component) make bill-of-materials traceability explicit for safety reviews, retrofit campaigns, and failure investigations. Duplicate assembly names, as with Motor Mount Deck appearing under ASSE-0002 and ASSE-0004 with different contained components, illustrate why identifier-first traceability must subsume nominal labels: interchangeability, maintenance intervals, and restraint performance depend on the exact component set, not the shared marketing or engineering title.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |

Across survey capture, typed evidentiary attributes, and mechanical assembly composition, the governing principle is consistent: identifiers stabilize reference; attr and attr_type encode meaning; misc holds verified values; encoding and language secure human-readable integrity; researcher profile attributes and survey response records bind people and process; intermediate floor assemblies and lateral restraint strap components bind material structure to compliance scope. Operational practice therefore treats each layer as non-substitutable—merging records by title alone, coercing typed values, or equating assemblies by name alone are each failure modes that the architecture is designed to foreclose, provided consumers honor the identifier graph and the type contracts that give misc values their evidentiary weight.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |