---
chapter_id: ch_live_classification_subclass_9c4b1d
topic_id: 41
family: 03_directive_governance
cited_terms: ['classification_subclass', 'survey_response_record', 'nonbreaking_change_subclass']
model: engine-refine
---

Identifiers constitute the durable addressing layer across compliance, survey, and change-management artifacts, and in operational practice they are what permit correlation, audit replay, and cross-subsystem reconciliation without ambiguity. A classification subclass such as CLAS-0001 is not merely a row label but a stable handle that downstream validators, policy engines, and reporting pipelines can reference when they must determine whether a control evaluation terminated in a recoverable state or requires human intervention. The same identifier discipline extends to survey response records (RECO-0001 through RECO-0004) and to change subclasses (CHAN-0001 through CHAN-0004), so that when an investigator traces a failed OWASP Risk Rating assessment back to the respondent data that informed it, or when a release manager asks which infrastructure component received a given non-breaking modification, every hop in the chain resolves through an explicit, immutable key rather than through inferred naming or positional coincidence.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

Exit codes and status fields together encode the terminal semantics of automated classification work. An exit code is the machine-readable residue of a bounded evaluation procedure: it tells orchestration logic whether to retry, escalate, or close the workflow, while status situates that outcome within a longer lifecycle that may still be in flight. CLAS-0001, mapped to OWASP Risk Rating, returns exit code 493 with status failed, signaling that the rating computation did not complete under acceptable preconditions and that dependent gates must remain closed. By contrast, CLAS-0003 and CLAS-0004—both tied to GDPR Data Category and CIS Benchmark classifications respectively—carry exit codes 581 and 197 with status complete, indicating successful termination even though the numeric codes themselves are framework-specific and must be interpreted against a documented codebook rather than assumed universal. CLAS-0002 remains pending at exit code 301, illustrating the common operational case in which a subprocess has emitted an interim code but the parent workflow has not yet committed a final disposition; governance systems that conflate exit code with status routinely misclassify such records as finished when they are merely checkpointed.

Survey response records anchor human-submitted evidence to structured compliance and research workflows, and each record type—Peer-Review-Submission, Q3-2023-Feedback, Safety-Compliance-Check—implies a distinct evidentiary contract about what assertions may legally be inferred from the response. The surveyresponserecord dimension names that contract explicitly so that retention policies, access controls, and analytic models do not treat a quarterly feedback instrument as though it carried the same probative weight as a safety attestation. Encoding and language are not cosmetic metadata; they govern whether text is losslessly preserved, whether collation and search behave correctly across corpora, and whether jurisdictional obligations attach to the content as stored. RECO-0001 and RECO-0003 specify ascii encoding with language es, a combination that demands verification that Spanish diacritics and punctuation were not silently stripped at ingest, whereas RECO-0002 uses unicode with de and RECO-0004 uses utf8 with en, reflecting the heterogeneous multilingual intake typical of distributed research programs where a single survey campaign must remain analytically comparable despite differing on-wire representations.

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

Researcher profile attributes specify which facets of an individual’s governed identity a given response is authorized to capture, and misalignment between the declared attribute and the survey instrument produces either over-collection—creating GDPR-category exposure—or under-collection that voids downstream clearance decisions. RECO-0001 binds Clearance-Level, appropriate for a Peer-Review-Submission where eligibility hinges on access tier; RECO-0002 captures Domain-Expertise-Code within a Q3-2023-Feedback context where specialist weighting may be applied without elevating security labels; RECO-0003 and RECO-0004 both record Protocol-Approval-Ref, pairing regulatory reference numbers to Safety-Compliance-Check and repeated quarterly feedback respectively so that auditors can verify that attested work rested on an approved protocol rather than on informal acknowledgment. These bindings are enforceable only when the researcherprofileattribute field is validated at submission time against the surveyresponserecord’s permitted schema, not retrofitted during batch export.

Non-breaking change subclasses describe modifications that preserve external contracts—Metric Name Addition, Dependency Version Bump, License Header Update, Field Nullability Change—while still requiring traceability because even contract-preserving edits can perturb observability, licensing attestations, or implicit consumer assumptions. Each change type applies to a concrete target in the operational estate: CHAN-0001’s metric name addition affects the ML Feature Store; CHAN-0002’s dependency version bump targets a Cloud Storage Bucket; CHAN-0003’s license header update applies to a GraphQL Endpoint; CHAN-0004’s field nullability change touches an Event Ingestion Pipeline. The subject–target association table makes those orientations explicit by pairing a nonbreaking_id with a non_breaking_change_for_id, and the role attribute governs how an actor or automation principal relates to that pairing—observer for CHAN-0004→CHAN-0006, contributor for CHAN-0006→CHAN-0005 and CHAN-0003→CHAN-0002, reviewer for CHAN-0001→CHAN-0003—so that approval matrices, notification fan-out, and segregation-of-duties checks can be evaluated without inferring responsibility from repository ownership alone.

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |

Taken together, these dimensions form a closed governance vocabulary in which classification outcomes (with their exit codes and statuses), internationalized survey evidence (with encoding, language, and captured profile attributes), and contract-preserving change events (with subject, target, and role) interlock. A failed OWASP assessment at CLAS-0001 may block publication of a Peer-Review-Submission tied to RECO-0001 until clearance attributes are reconciled; a complete GDPR categorization at CLAS-0003 informs retention handling for unicode German feedback in RECO-0002; a pending CIS-adjacent workflow at CLAS-0002 can proceed in parallel with contributor-led license header updates directed at the GraphQL Endpoint. Mature implementations treat each field as a constraint-bearing fact rather than as documentary filler: identifiers enable linkage, exit codes and status govern automation, encoding and language secure evidentiary integrity, researcherprofileattribute enforces data-minimization boundaries, and subject–target–role triples make non-breaking change governance as auditable as any breaking release, which is precisely why handbook prose must teach the domain through these interactions instead of through schematic enumeration.