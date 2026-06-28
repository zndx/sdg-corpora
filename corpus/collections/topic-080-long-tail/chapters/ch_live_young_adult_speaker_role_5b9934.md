---
chapter_id: ch_live_young_adult_speaker_role_5b9934
topic_id: 80
family: 08_derived
cited_terms: ['young_adult_speaker_role', 'lineage_edge_describes_column_flow', 'existential_anchored_to_artifact_via_part']
model: engine-refine
---

Young-adult speaker governance assigns accountable roles to qualifying individuals who deliver educational presentations on policy-sensitive subjects, and treats each assignment as a durable record rather than an informal roster entry. The identifier ROLE-0001 through ROLE-0004 anchors distinct speaker capacities—Morales PolicyYouth, Ruiz OpenEdLead, Chen TEDx2023, and Tanaka YouthTech—to named individuals including Chloe Tan, Lucas Fernandez, Elena Rossi, and Zara Okonkwo. The youngadultspeakerrole dimension encodes institutional capacity (policy youth liaison, open-education lead, conference platform, youth technology advocate), while youngadultindividual binds that capacity to a specific person liable for conduct, attribution, and remedial action. Educationalpresentation completes the obligation chain: three roles converge on Ethical AI Governance, whereas Chen TEDx2023 is scoped to Open Source Licensing, signalling that platform-specific mandates may diverge from the programme’s default curriculum even when the speaker cohort remains nominally aligned.

**t_young_adult_speaker_role**

| id | young_adult_speaker_role | qualifying_individual | delivers_presentation |
| --- | --- | --- | --- |
| ROLE-0001 | Morales PolicyYouth | Chloe Tan | Ethical AI Governance |
| ROLE-0002 | Ruiz OpenEdLead | Lucas Fernandez | Ethical AI Governance |
| ROLE-0003 | Chen TEDx2023 | Elena Rossi | Open Source Licensing |
| ROLE-0004 | Tanaka YouthTech | Zara Okonkwo | Ethical AI Governance |
| ROLE-0005 | Tanaka YouthTech | Zara Okonkwo | Cloud Cost Optimization |
| ROLE-0006 | Patel AIWorkshop | Zara Okonkwo | Neuroplasticity Learning |

Describes column flow is the lineage construct that states how values propagate across governed attributes—from speaker assignment through presentation topic to downstream compliance artefacts—and must be interpreted alongside category rather than as an isolated technical label. FLOW-0001 through FLOW-0004 in the dimension layer carry Describes Column Flow Category 01–04 and paired labels, supplying the semantic frame within which lineage facts are classified and audited. Fact records do not merely restate those definitions; they assert operational edges keyed by describes_column_flow references such as FLOW-0006, FLOW-0005, and FLOW-0004, so that an auditor can reconstruct which transformation or dependency path a given attribute value traversed. Category therefore governs evidentiary grouping—whether a flow documents speaker-to-topic binding, cross-table enrichment, or artifact anchoring—while the describes column flow key preserves referential integrity between definitional and transactional layers.

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |

Confidence and uncertainty jointly quantify how firmly a lineage assertion should be treated in enforcement, review, and escalation workflows. A confidence of 0.779 on FLOW-0004 supports reliance on that edge during certification, whereas 0.071 on FLOW-0002 marks the same class of assertion as provisional and unsuitable for automated downstream propagation without human corroboration; intermediate values such as 0.645 and 0.404 invite tiered review rather than binary acceptance. Uncertainty magnitudes—including 612.22, 133.03, 76.69, and 708.23—express residual doubt in the units appropriate to the measurement model and must be read in tension with confidence: high confidence paired with elevated uncertainty (as on FLOW-0004, where 0.779 coexists with 708.23) signals a well-supported but wide-bounded claim, not contradiction. Misc-valued fields in the lineage fact layer (903.86, 832.18, 862.00, 259.55) carry auxiliary quantitative evidence—weights, scores, or normalised residuals—that enrich the primary probabilistic judgement without replacing it.

Physical and logical placement of governed artefacts is established through existential anchoring: each governed entity receives a stable identifier and is bound to a uri and a location that together satisfy chain-of-custody requirements. PART-0001 attaches GovernanceRule77 to hdfs://cluster/staging at rack-7, while PART-0004 places LabSampleVial-7 on s3://lake/raw at the same rack-7 location, illustrating that identical facility codes may span heterogeneous storage tiers. ObservationDrone04 and EdgeGateway-12 both resolve to abfss://prod/silver but diverge at location—eu-west-3 versus on-prem-dc1—demonstrating that uri encodes namespace and access policy whereas location encodes jurisdictional or physical siting obligations relevant to residency, export control, and incident response. In practice, compliance officers treat uri as the authoritative retrieval path for evidentiary replay and location as the constraint surface for lawful processing, cross-border transfer, and retention scheduling.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

Operational integrity depends on maintaining coherent joins across these domains: youngadultspeakerrole and youngadultindividual must remain consistent with educationalpresentation topics that lineage edges document under appropriate describes column flow categories, and those edges must meet minimum confidence thresholds before they authorise automated publication or credential issuance. Low-confidence lineage (FLOW-0002 at 0.071) should trigger re-validation of speaker credentials and presentation scope; high-confidence edges (FLOW-0004 at 0.779) may still require location-aware checks when anchored artefacts such as GovernanceRule77 or LabSampleVial-7 participate in the same compliance narrative. Identifier discipline—ROLE-0001, FLOW-0001, PART-0001—ensures that corrections propagate without semantic drift, and that audit trails remain legible to regulators who must reconstruct not only who spoke and on what subject, but through which data flows that assignment was derived, with what measured doubt, and from which retrievable, geographically situated artefacts the governing rules ultimately drew their force.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |