---
chapter_id: ch_live_claim_observed_by_event_4b00de
topic_id: 40
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'policy_enforced_by', 'claim_not_disconfirmed']
model: engine-refine
---

A claim is an asserted proposition whose governance value depends on whether it can be keyed, classified, and scored without collapsing into free text. In operational assurance, claims such as redundancy failover successful, secondary sensor aligned, firmware version outdated, and thermal monitoring active function as inspectable statements whose truth status is managed rather than assumed. Each claim receives a durable identifier—EVEN-0001 through EVEN-0004 on the fact side, DISC-0001 through DISC-0004 where not-disconfirmation is tracked—so that the same proposition can be referenced across measurement, dimension, and enforcement contexts without semantic drift. Category supplies the taxonomic frame: Claim Category 01 through Claim Category 04 partition the claim universe so that reviewers can apply category-appropriate thresholds, retention rules, and escalation paths. Human-readable misc fields—Claim Label 02, Dimension Kind 01, intake form—carry presentation and audit context that identifiers alone cannot express, while confidence and uncertainty quantify epistemic posture in complementary registers. A confidence of 0.621 on one EVEN-0002 assertion and 0.338 on EVEN-0006 signal materially different reliance postures; paired uncertainty magnitudes (571.46 versus 43.01 on comparable keys) further distinguish whether low confidence reflects sparse evidence or high variance in the underlying signal.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

Confidence and uncertainty are not decorative metadata; they govern how downstream controls treat a claim as binding, provisional, or in need of corroboration. Decimal-valued confidence scores—0.145 on DISC-0001, 0.678 on DISC-0002—attach at the entity level through typed attribute bindings, while fact-level aggregates (0.596, 0.364) support rollups across claim keys that repeat, as when EVEN-0002 appears on multiple fact rows with distinct misc measurements (173.58, 152.06). The separation between scored fact rows and dimensional claim definitions (Claim Label 03 under Claim Category 03) preserves analytic integrity: the identifier EVEN-0003 remains stable even as confidence fluctuates. Where uncertainty reaches 296.86, reviewers are prompted to treat the associated value (166.95) as a point estimate within a wide band rather than a precise compliance datum. This pairing is what allows governance frameworks to mandate action at confidence floors without ignoring cases where uncertainty—not low confidence—is the operative risk.

Entities are the anchors to which attributes bind; attr names declare what is being said about the entity, and attr_type declares how it must be stored, validated, and compared. The attribute vocabulary—confidence, dimension_kind, method, recorded_at—maps to XSD-aligned types (xsd:decimal, xsd:string, xsd:dateTime) so that values land in type-appropriate stores rather than a single undifferentiated misc column. A recorded_at binding uniformly typed as xsd:dateTime yields comparable instants (2023-08-09T14:45:08, 2024-07-11T23:49:48) across entities DISC-0001 through DISC-0004, establishing temporal provenance for not-disconfirmed assertions. Decimal attributes carry magnitudes such as 669.01 and 65.74; varchar attributes carry lexical misc including Encoding 02 and locale marker ja. The entity–attr–value pattern prevents category errors at ingestion: a confidence typed as xsd:decimal cannot silently coexist with a datetime string in the same slot, and method remains string-typed procedural metadata distinct from the evidentiary decimal channel.

Relational governance extends beyond entity attributes through subject–target–role triples that specify who or what stands in which capacity toward a governed object. In policy enforcement, the subject is the policy identifier (ENFO-0001 for ISO27001 Encryption, ENFO-0002 for CCPA Data Deletion, ENFO-0003 for PCI-DSS Tokenization, ENFO-0006 where bridged), and the target is the enforcement instrument identifier (ENFO-0003, ENFO-0006, ENFO-0001 as enforced_by_id values pointing at Splunk SIEM, ISO Audit Board, or AWS Config Rules). Role discriminates obligation semantics within the same subject–target plane: observer, reviewer, and owner are not interchangeable labels—an AWS Config Rules target may appear as reviewer on one policy bridge and as owner on another, while Splunk SIEM may observe without owning remediation. This structure lets compliance handbooks state that ISO27001 Encryption is observed through a designated enforcement node without conflating observation with accountability, and it supports many-to-many enforcement topologies without losing traceability back to ENFO-0004 FINRA Record Retention or ENFO-0001 ISO27001 Encryption at the policy registry.

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

Not-disconfirmation models how claims coexist when neither assertion has been falsified, encoding pairwise claim relationships (claim, claim_2) such as redundancy failover successful alongside data pipeline stalled, or secondary sensor aligned reciprocally with secondary sensor aligned, or thermal monitoring active against threshold limits expanded. The construct is weaker than mutual confirmation and stronger than mere co-occurrence: it preserves competing or complementary assertions under active monitoring until evidence disconfirms one branch. Attributes on these pairs supply the evidentiary substrate—dimension_kind, method, recorded_at, confidence—so that a not-disconfirmed firmware version outdated claim relative to latency under SLA bounds can still carry a 2023-07-27T10:01:23 timestamp and a 0.145 confidence decimal, enabling reviewers to prioritize stale firmware risk without treating the SLA-bound latency claim as settled. Identifiers DISC-0001 through DISC-0004 thread through attr definitions and typed value tables so that every varchar, decimal, and datetime misc value remains attributable to a specific entity–attribute binding.

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |

Taken together, identifier, category, claim, entity, attr, attr_type, confidence, uncertainty, subject, target, role, and misc form a layered evidence architecture in which nothing relies on a single representation. Identifiers stabilize reference; categories and roles organize obligation and review; typed attributes enforce semantic discipline; confidence and uncertainty quantify reliance; misc carries the residual particulars that make an assertion auditable in court, in regulator examination, or in internal control testing. A practitioner reading EVEN-0002 at 0.596 confidence with uncertainty 43.01, bridged to Claim Label 02 in Claim Category 02, and linked through an observer-role enforcement edge, can reconstruct not only what was claimed but how firmly, by whom, under which policy family, and with what typed supporting measurements—without collapsing the distinction between the claim, the entity that bears it, and the control posture that governs its use.