---
chapter_id: ch_live_mass_function_min_one_focal_445aee
topic_id: 186
family: 06_belief_structure
cited_terms: ['mass_function_min_one_focal', 'lineage_edge_at_run_time', 'strategic_commitment']
model: engine-refine
---

In evidence-based governance and operational telemetry, durable reference hinges on a small set of recurring primitives that recur across qualitatively different domains—from belief-theoretic mass assignments over focal elements to strategic commitments and runtime lineage edges. An **identifier** is the stable handle that makes any record addressable, auditable, and joinable across time and process boundaries. Whether the record denotes a focal mass function (`FOCA-0001`), a lineage edge observed at execution (`TIME-0003`), or a board-level undertaking (`COMM-0004`), the identifier is what permits downstream systems to assert “this is the same object” rather than a coincidentally similar label. Without identifiers, attribute values cannot be attributed, relationships cannot be reconciled, and compliance narratives collapse into undifferentiated text.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | calibration_status |
| FOCA-0002 | audit_trail_eta | calibration_status |
| FOCA-0003 | provenance_record_epsilon | user_agent |
| FOCA-0004 | sensor_array_gamma | data_quality_flag |
| FOCA-0005 | governance_log_delta | network_latency |
| FOCA-0006 | provenance_record_epsilon | location_geo |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | batch-revenue-aggregation |
| TIME-0002 | customer-churn-pipeline |
| TIME-0003 | climate-data-ingest |
| TIME-0004 | genomic-sequence-align |
| TIME-0005 | model-training-workflow |
| TIME-0006 | user-behavior-trace |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

An **entity** is the governed object that identifiers name and that the rest of the model describes. Entities are not merely rows; they are the units of accountability. A mass function such as `audit_trail_eta` anchored on focal element `calibration_status` is an entity whose evidentiary role is to quantify uncertainty or support over a specific proposition in a sensor or provenance context. A strategic commitment such as `CybersecurityHardening` is likewise an entity, but its accountability frame is organizational: it binds policy intent to measurable obligations. The architectural consequence is separation of identity from description: the entity persists while its descriptive **attr**ibutes evolve, and that separation is what makes retrospective audit possible—you can compare what was known on `2023-06-19T06:37:58` against what is asserted later without conflating the underlying commitment or measurement artifact.

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

**t_strategic_commitment_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0003 | true |
| COMM-0002 | COMM-0002 | COMM-0003 | true |
| COMM-0003 | COMM-0003 | COMM-0003 | false |
| COMM-0004 | COMM-0004 | COMM-0003 | false |
| COMM-0005 | COMM-0005 | COMM-0003 | false |
| COMM-0006 | COMM-0006 | COMM-0003 | true |

**t_strategic_commitment_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0001 | 2024-11-04 |
| COMM-0002 | COMM-0002 | COMM-0001 | 2024-08-07 |
| COMM-0003 | COMM-0003 | COMM-0001 | 2023-08-27 |
| COMM-0004 | COMM-0004 | COMM-0001 | 2025-05-25 |
| COMM-0005 | COMM-0005 | COMM-0001 | 2024-04-23 |
| COMM-0006 | COMM-0006 | COMM-0001 | 2025-03-12 |

**t_strategic_commitment_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0004 | 2 |
| COMM-0002 | COMM-0001 | COMM-0005 | 663 |
| COMM-0003 | COMM-0002 | COMM-0004 | 2 |
| COMM-0004 | COMM-0002 | COMM-0005 | 397 |
| COMM-0005 | COMM-0003 | COMM-0004 | 3 |
| COMM-0006 | COMM-0003 | COMM-0005 | 741 |
| COMM-0007 | COMM-0004 | COMM-0004 | 2 |
| COMM-0008 | COMM-0004 | COMM-0005 | 292 |

**t_strategic_commitment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMM-0001 | COMM-0001 | COMM-0007 | Encoding 01 |
| COMM-0002 | COMM-0001 | COMM-0002 | Enforcement 02 |
| COMM-0003 | COMM-0001 | COMM-0008 | change rationale |
| COMM-0004 | COMM-0001 | COMM-0009 | es |
| COMM-0005 | COMM-0001 | COMM-0006 | Scope 05 |
| COMM-0006 | COMM-0002 | COMM-0007 | Encoding 06 |
| COMM-0007 | COMM-0002 | COMM-0002 | Enforcement 07 |
| COMM-0008 | COMM-0002 | COMM-0008 | calibration record |

**Attr**ibutes name the facets that may be asserted about an entity, and **attr type** constrains how those facets may legally be expressed. Attribute typing is a compliance instrument: `confidence` typed as `xsd:decimal` admits values such as `0.223` and `0.161` suitable for quantitative scoring, whereas `recorded_at` as `xsd:dateTime` demands temporal literals like `2024-04-19T20:46:34` that interoperate with event ordering and retention rules. Strategic commitments exhibit the same discipline—`effective_date` as `xsd:date`, `mandatory` as `xsd:boolean`, `priority` as `xsd:integer`—so that enforcement engines, dashboards, and control tests can validate inputs before they enter authoritative stores. Typed attribute registries also prevent category errors at scale: a reviewer cannot silently store “Enforcement 02” where a boolean is required, nor treat a priority of `663` as a date. In practice, attr and attr type jointly define the contract between data producers and governance consumers.

Concrete attribute **misc**ellaneous values—stored in type-aligned value partitions—are the evidentiary payload that fulfills those contracts. The term misc here signals that the value’s semantics are carried by its attribute definition and storage type, not by a single universal value column overloaded with incompatible meanings. For focal functions, misc captures operational detail ranging from decimal measurements and coded strings (`Dimension Kind 01`, `Encoding 02`) to locale markers (`es`) and timestamps that anchor when a reading or assertion became valid. For commitments, misc materializes governance posture: `mandatory` flags (`true` for `RenewableEnergyAdoption` and `CircularEconomyRoadmap`, `false` for `SupplyChainResilienceInitiative` and `CybersecurityHardening`), effective dates spanning `2023-08-27` through `2025-05-25`, and priority integers that differentiate urgency within a portfolio. Misc values matter because auditors and operators reason over instances, not schemas; a false mandatory flag or an out-of-range confidence directly changes control applicability and risk treatment.

Beyond scalar description, governed systems require relational structure expressed through **subject**, **target**, and **role**. A subject is the originating or owning node in a directed association; a target is the node acted upon or contextualized by that association; the role qualifies the nature of participation and therefore the permissions, duties, and evidentiary weight of the link. In runtime lineage, `genomic-sequence-align` may appear as a subject linked to execution contexts such as `worker-node-12` or `batch-queue-primary`, with roles distinguishing **owner** accountability from **observer** visibility and **reviewer** attestation. Roles are not decorative labels—they determine who may remediate, who may only witness, and whose involvement satisfies segregation-of-duties expectations. The same subject may relate to multiple targets under different roles, and conversely a target such as `worker-node-12` may accumulate multiple subjects over time, which is precisely how operational forensics reconstruct “what ran where, under whose authority, with whose oversight.”

**t_lineage_edge_at_run_time__at_run_time**

| id | lineage_id | at_run_time_id | role |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0004 | TIME-0005 | owner |
| TIME-0002 | TIME-0006 | TIME-0003 | observer |
| TIME-0003 | TIME-0004 | TIME-0005 | owner |
| TIME-0004 | TIME-0004 | TIME-0001 | reviewer |
| TIME-0005 | TIME-0002 | TIME-0006 | contributor |
| TIME-0006 | TIME-0004 | TIME-0006 | owner |
| TIME-0007 | TIME-0005 | TIME-0004 | contributor |
| TIME-0008 | TIME-0005 | TIME-0003 | observer |

At the policy stratum, **strategiccommitment**, **organizationalobjective**, and **industryassociationmember** interlock to translate enterprise intent into stakeholder-legible obligations. A strategic commitment names a durable program—`SupplyChainResilienceInitiative`, `CircularEconomyRoadmap`—while an organizational objective states the internal outcome it pursues, such as `QualityAssurance`, `RegulatoryCompliance`, or `RiskMitigation`. The industry association member names the external or sector stakeholder whose interests the commitment is understood to support: `UrbanTransitAuthority` for renewable adoption, `BioGenLabs` for circular economy measures, `AlphaManufacturing` for supply-chain resilience, `AtlanticShippingLine` for cybersecurity hardening. This triad matters because compliance is seldom self-referential; controls must be traceable from measurable attributes and runtime lineage roles upward to commitments, and outward to the members whose trust, regulation, or contract terms justify the effort. When `CybersecurityHardening` pursues `RiskMitigation` on behalf of `AtlanticShippingLine`, optional enforcement attributes, effective dating, and execution-time reviewer roles become mutually reinforcing evidence that the organization both promised appropriately and operated accountably in fulfillment.

**t_strategic_commitment**

| id | strategic_commitment | pursues_objective | supports_stakeholder |
| --- | --- | --- | --- |
| COMM-0001 | RenewableEnergyAdoption | QualityAssurance | UrbanTransitAuthority |
| COMM-0002 | CircularEconomyRoadmap | RegulatoryCompliance | BioGenLabs |
| COMM-0003 | SupplyChainResilienceInitiative | QualityAssurance | AlphaManufacturing |
| COMM-0004 | CybersecurityHardening | RiskMitigation | AtlanticShippingLine |
| COMM-0005 | CybersecurityHardening | TalentAcquisition | FinServePartners |
| COMM-0006 | RenewableEnergyAdoption | MarketExpansion | TechCorpGlobal |

Taken together, identifiers stabilize entities; attrs and attr types define what may be said about them; misc values supply the auditable facts; and subject–target–role graphs plus commitment–objective–stakeholder bindings situate those facts inside authority structures and strategic purpose. That compositional pattern is why the same conceptual vocabulary spans sensor calibration mass, pipeline lineage, and board-level initiatives: governance quality is less about any single domain’s vocabulary and more about whether every assertion can be keyed, typed, valued, related, and escalated to the commitments and stakeholders it ultimately serves.

**t_strategic_commitment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMM-0001 | effective_date | xsd:date |
| COMM-0002 | enforcement | xsd:string |
| COMM-0003 | mandatory | xsd:boolean |
| COMM-0004 | priority | xsd:integer |
| COMM-0005 | review_cycle_days | xsd:integer |
| COMM-0006 | scope | xsd:string |
| COMM-0007 | encoding | xsd:string |
| COMM-0008 | label_text | xsd:string |