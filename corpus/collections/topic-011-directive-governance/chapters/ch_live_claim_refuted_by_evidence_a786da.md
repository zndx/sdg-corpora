---
chapter_id: ch_live_claim_refuted_by_evidence_a786da
topic_id: 11
family: 06_belief_structure
cited_terms: ['claim_refuted_by_evidence', 'attestation_basic', 'requirement_has_priority']
model: engine-refine
---

In governed information systems, stable identifiers anchor every auditable fact, relationship, and obligation so that records remain addressable across reviews, reconciliations, and downstream enforcement. An identifier is not merely a surrogate key for storage convenience; it is the durable handle by which analysts, automated validators, and oversight bodies refer to the same object when context shifts—from intake to dispute resolution to retrospective audit. When a compliance program must trace whether a contested assertion was overturned by documentary proof, references such as EVID-0001 and EVID-0004 allow distinct evidentiary artifacts to be cited without ambiguity, even when their natural-language descriptions (“Carbon emissions peaked,” “Firmware update breaks encryption”) could otherwise be conflated across versions, locales, or reporting periods. The practical consequence is procedural: identifiers make lineage explicit, enable idempotent updates, and support crosswalks between operational telemetry, policy libraries, and human-readable narratives.

Entities constitute the substantive objects those identifiers denote—the attestations, requirements, claims, and evidence records that governance frameworks treat as first-class participants in accountability workflows. An entity is the unit to which properties attach and from which relationships emanate; in operational practice, the same entity may accumulate multiple observations over time without changing its identity. Vendor risk assessments, HIPAA compliance reviews, and ML model fairness audits exemplify attestation entities whose significance lies in what they certify and when, not in the incidental labels assigned at creation. Likewise, requirements such as latency thresholds, backup intervals, and audit-log frequency represent obligation entities whose enforcement posture must be evaluated against evolving control environments. Entity-centric modeling matters because compliance is rarely about isolated data points; it is about whether a defined object—an assessment run, a control requirement, a disputed claim—satisfies predicates, bears responsibilities, and remains comparable across reporting cycles.

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Carbon emissions peaked |
| EVID-0002 | Patient dosage exceeds limit |
| EVID-0003 | Supply chain disruption |
| EVID-0004 | Firmware update breaks encryption |
| EVID-0005 | Algorithm bias flagged |
| EVID-0006 | Market volatility threshold |
| EVID-0007 | Carbon emissions peaked |

**t_claim_refuted_by_evidence_refuted_by_evidence**

| id | refuted_by_evidence |
| --- | --- |
| EVID-0001 | Compliance checklist v2.1 |
| EVID-0002 | Compliance checklist v2.1 |
| EVID-0003 | Compliance checklist v2.1 |
| EVID-0004 | Satellite imagery timestamp |
| EVID-0005 | Peer reviewed study 10.1234 |
| EVID-0006 | Lab bench measurement sheet |
| EVID-0007 | Satellite imagery timestamp |
| EVID-0008 | Clinical trial phase III |

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

Attributes name the measurable or declarative facets that entities expose to evaluation, while attribute types prescribe the interpretive contract under which values must be recorded, compared, and validated. An attribute such as duration_seconds, effective_date, mandatory, or enforcement is a governed dimension of meaning: it tells reviewers what is being asserted about the entity, not merely which column in a report happened to be populated. Attribute typing—xsd:decimal for durations, xsd:dateTime for temporal boundaries, xsd:boolean for binary obligations, xsd:string for categorical enforcement modes—prevents category errors that undermine automated reasoning and human sign-off alike. In practice, typing enforces separation of concerns at ingestion: datetime-valued end times are not coerced into free text, integer exit codes are not rounded into decimals, and boolean mandatory flags are not inferred from ambiguous phrases. Programs that treat attr and attr_type as administrative metadata rather than semantic guardrails routinely discover, during audit, that numerically plausible but semantically invalid tuples cannot be reconstructed into defensible compliance conclusions.

The misc dimension—here realized as the stored value bound to an entity–attribute pair—carries the evidentiary payload on which determinations rest. Values such as 7132.97 seconds of assessed duration, exit codes 898 and 71, host identifiers like ingest-21, enforcement labels including Enforcement 02, and effective dates ranging from 2023-04-21 to 2024-08-03 are not inert fields; they are the concrete measurements and declarations that transform abstract entities into inspectable compliance states. Because values are typed and keyed to entities, reviewers can ask precise questions: whether a HIPAA review ended on 2023-09-08T13:00:56, whether mandatory requirements uniformly register false across PRIO-0001 through PRIO-0004, or whether priority integers 3, 56, 2, and 806 imply materially different escalation paths for otherwise similar control statements. Dense operational corpora derive their authority from this binding—each misc entry is a testable proposition whose truth conditions are defined by attr_name, attr_type, and the entity’s role in the wider control graph.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | EVID-0007 |
| PRIO-0002 | Backup interval | EVID-0003 |
| PRIO-0003 | Throughput minimum | EVID-0006 |
| PRIO-0004 | Audit log frequency | EVID-0006 |
| PRIO-0005 | Throughput minimum | EVID-0002 |
| PRIO-0006 | Encryption standard | EVID-0004 |
| PRIO-0007 | Throughput minimum | EVID-0002 |
| PRIO-0008 | Fault tolerance level | EVID-0005 |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

Relational integrity in such frameworks is expressed through subject–target associations qualified by role, which model directed participation without collapsing heterogeneous actors into undifferentiated links. A subject points to the entity that initiates, bears, or is characterized by the relationship—commonly a claim under examination—while a target identifies the counterparty object that constrains, refutes, or prioritizes interpretation, such as a checklist artifact or timestamped satellite imagery. Role supplies the interpretive modifier that prevents symmetrical edges from being read as interchangeable: observer and reviewer are not cosmetic distinctions but allocations of epistemic responsibility, determining whose attestation weight applies when the same evidentiary pairing could support both provisional monitoring and formal rebuttal. The refutation pattern illustrates the mechanics in situ: multiple claims may converge on a single refuting artifact (Compliance checklist v2.1 appears across several refutation records), yet each subject–target tuple preserves a distinct claim context—linking EVID-0006 and EVID-0007 to shared evidence while reserving reviewer status for the firmware-encryption dispute where EVID-0001 is implicated as subject. Priority linkage extends the same subject–target logic into obligation management, where requirements reference evidentiary priorities (EVID-0007 for latency, EVID-0003 for throughput minima, EVID-0006 for backup and audit-log controls), embedding evidentiary precedence directly into which constraints demand immediate remediation.

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form an interlocking vocabulary for evidence-anchored governance: identifiers stabilize reference; entities supply the objects of duty and proof; attributes and types define what may be said and how it may be measured; misc values instantiate claims that can be tested; and subject–target–role triples articulate directed accountability among claims, evidence, and requirements. Mature programs operationalize these constructs not as schema trivia but as control primitives—so that when a dosage-limit claim, a supply-chain disruption assertion, or a superseded attestation state must be defended before regulators or internal risk committees, the underlying graph answers who said what, about which entity, under which typed attributes, in what directional relationship, and with what evidential weight. That compositional discipline is what converts fragmented operational logs and policy spreadsheets into a coherent, queryable compliance corpus capable of withstanding scrutiny long after individual contributors have left the record.

**t_claim_refuted_by_evidence__refuted_by_evidence**

| id | claim_id | refuted_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0006 | EVID-0004 | observer |
| EVID-0002 | EVID-0007 | EVID-0004 | observer |
| EVID-0003 | EVID-0003 | EVID-0007 | observer |
| EVID-0004 | EVID-0001 | EVID-0003 | reviewer |
| EVID-0005 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0006 | EVID-0001 | EVID-0007 | contributor |
| EVID-0007 | EVID-0007 | EVID-0005 | owner |
| EVID-0008 | EVID-0003 | EVID-0001 | owner |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |