---
chapter_id: ch_live_constraint_min_one_check_2c03ef
topic_id: 97
family: 03_directive_governance
cited_terms: ['constraint_min_one_check', 'claim_refuted_by_evidence', 'knowledge_base_integration']
model: engine-refine
---

Constraints governing data quality and compliance are anchored by unique identifiers—CHEC-0001 through CHEC-0004—that distinguish each rule within the enforcement layer, while their applicability is bounded by scope, which delineates whether a constraint operates at the team, local, or regional level. A Unique Index constraint (CHEC-0001) and a Latency Limit (CHEC-0002) both apply at the team scope, whereas a Primary Key Rule (CHEC-0003) is scoped locally and a Range Validation (CHEC-0004) extends regionally. Each constraint carries an effective date that establishes its temporal validity: CHEC-0004 took effect on 2023-05-11, CHEC-0002 on 2023-05-17, CHEC-0001 on 2023-05-21, and CHEC-0003 on 2025-03-18, reflecting a staggered rollout that permits phased enforcement across organizational boundaries. These constraints reference evidence items—EVID-0007, EVID-0005, EVID-0001—through which compliance is measured and validated.

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | EVID-0007 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | EVID-0007 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | EVID-0005 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | EVID-0001 | 2023-05-11 | regional |

Claims that require refutation are themselves identified by evidence-style identifiers (EVID-0001 through EVID-0004), each encoding a specific allegation: Carbon emissions peaked, Patient dosage exceeds limit, Supply chain disruption, and Firmware update breaks encryption. The refutation of each claim is mediated through a junction table that establishes a directed relationship between a subject—the claim being challenged—and a target—the evidence that challenges it. In this relationship, a role attribute assigns the function of the refuting entity, with values such as observer and reviewer indicating whether the evidence serves as a passive witness or an active adjudicator. For instance, claim EVID-0006 is refuted by evidence EVID-0004 under the role of observer, while claim EVID-0001 is refuted by EVID-0003 under the role of reviewer, establishing a hierarchy of evidentiary authority.

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

Knowledge base integrations—SoilCarbonInventory, WildfireRiskMatrix, ClimateAdaptationFramework, and ArcticPermafrostAtlas—serve as the structural containers through which diverse knowledge sources are unified under a single identifier (INTE-0001 through INTE-0004). Each integration incorporates both indigenous knowledge bases, such as MāoriResourceMapping and YupikCoastalEcology, and scientific knowledge bases, including HaidaGwaiiHeritage, CherokeeSeedVault, GenBankSequenceArchive, and NOAAOceanTemperature. The encoding field specifies the character encoding used for metadata storage within each integration, with values of ascii and utf8 indicating the byte representation conventions applied. Label text provides human-readable descriptors for the integration artifacts—calibration record, intake form, and audit excerpt—enabling operational staff to identify the purpose of each knowledge artifact without consulting technical documentation.

**t_knowledge_base_integration**

| id | knowledge_base_integration | incorporates_indigenous_knowledge | incorporates_scientific_knowledge | encoding | label_text |
| --- | --- | --- | --- | --- | --- |
| INTE-0001 | SoilCarbonInventory | MāoriResourceMapping | HaidaGwaiiHeritage | ascii | calibration record |
| INTE-0002 | WildfireRiskMatrix | YupikCoastalEcology | CherokeeSeedVault | ascii | intake form |
| INTE-0003 | ClimateAdaptationFramework | MODISVegetationIndex | GenBankSequenceArchive | ascii | calibration record |
| INTE-0004 | ArcticPermafrostAtlas | MāoriResourceMapping | NOAAOceanTemperature | utf8 | audit excerpt |
| INTE-0005 | WildfireRiskMatrix | NASAClimateReanalysis | YupikCoastalEcology | utf8 | change rationale |
| INTE-0006 | ClimateAdaptationFramework | HaidaGwaiiHeritage | NASAClimateReanalysis | utf8 | calibration record |
| INTE-0007 | SoilCarbonInventory | USFSDroughtMonitor | CherokeeSeedVault | latin1 | pre-release note |