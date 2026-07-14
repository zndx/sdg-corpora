## Role Dynamics in Inter-Agency Healthcare Delivery

Healthcare systems increasingly operate across organizational boundaries, where professional roles are defined, enacted, and perceived differently depending on institutional context. This chapter examines the architecture of role management within multi-agency healthcare environments, tracing how conceptual definitions of professional roles translate into practical enactments, how those enactments are perceived by stakeholders, and how the resulting role clarity—or confusion—impacts healthcare delivery outcomes. The domain encompasses six core record types: role concepts that define professional expectations, role enactments that capture how those definitions are put into practice, role perceptions that document stakeholder understanding, clinical delivery nodes (CLDNs) that anchor individual practitioners within the system, healthcare deliveries that record service provision events, and inter-agency boundaries that demarcate organizational jurisdictions. Together, these records form a relational framework for diagnosing role-related friction and identifying opportunities for improved coordination.

### Conceptual Foundations

Role concepts serve as the theoretical starting point for understanding professional expectations within healthcare systems. Each concept carries a unique identifier, an origin language that traces its intellectual provenance, and a theoretical perspective that situates it within a particular school of thought. The definition text provides the operational meaning, while related concepts capture conceptual linkages.

**Table `role_concepts`**

| concept_id | origin_language | theoretical_perspective | definition_text | related_concepts | enactment_id | perception_id |
|---|---|---|---|---|---|---|
| 884350 | compact-origin-26 | symbolic_interactionist | primary-definiti-70 | pilot-related-80 | 8189497 | 2106694 |
| 392497 | composite-origin-27 | psychological | adaptive-definiti-71 | extended-related-81 | 1562836 | id_26 |
| 2106713 | primary-origin-28 | anthropological | distributed-definiti-72 | integrated-related-82 | 575200 | 1562849 |
| 4463648 | adaptive-origin-29 | organisational | baseline-definiti-73 | seasonal-related-83 | 10445649 | 3001009030160 |

The four recorded concepts illustrate the diversity of theoretical grounding. Concept 884350 originates from a symbolic interactionist perspective with the origin language compact-origin-26, defining a primary definition (primary-definiti-70) that connects to pilot-related-80. Its enactment is tracked under identifier 8189497 and its perception under 2106694. Concept 392497 takes a psychological theoretical perspective with composite-origin-27 as its origin language, articulating an adaptive definition (adaptive-definiti-71) linked to extended-related-81, enacted under 1562836 and perceived under id_26. Concept 2106713 draws from an anthropological perspective (primary-origin-28) to describe a distributed definition (distributed-definiti-72) connected to integrated-related-82, with enactment 575200 and perception 1562849. Finally, concept 4463648 adopts an organisational perspective (adaptive-origin-29) to establish a baseline definition (baseline-definiti-73) related to seasonal-related-83, enacted under 10445649 and perceived under 3001009030160. These concepts form the definitional substrate against which all subsequent enactments and perceptions are measured.

### Operational Enactment

Role enactments represent the translation of conceptual definitions into practical action. Each enactment record captures the quality of execution, the factors influencing performance, the organizational boundary context, and whether role conflict is present. The enactment identifier links back to its originating role concept and forward to the clinical delivery node, healthcare delivery, and inter-agency boundary records that document the operational environment.

**Table `role_enactments`**

| enactment_id | quality_of_enactment | influencing_factors | inter_agency_boundaries | role_conflict_present | concept_id | c_l_d_n_id | healthcare_delivery_id |
|---|---|---|---|---|---|---|---|
| 8189497 | high | seasonal-influenc-53 | Singapore General Hospital | false | 884350 | 1 | 100 |
| 1562836 | medium | regional-influenc-54 | Professional Educator Standards Board | true | 392497 | 2 | 101 |
| 575200 | low | legacy-influenc-55 | LDAP First Name Field | false | 2106713 | 3 | 102 |
| 10445649 | high | compact-influenc-56 | Viet Children's Aegis | true | 4463648 | 4 | 103 |

Enactment 8189497 demonstrates high-quality execution under the influence of seasonal-influenc-53, occurring within the Singapore General Hospital boundary, with no role conflict present. This enactment corresponds to concept 884350, clinical delivery node 1, and healthcare delivery 100. Enactment 1562836 shows medium quality, influenced by regional-influenc-54, operating under Professional Educator Standards Board jurisdiction, with role conflict present; it maps to concept 392497, node 2, and delivery 101. Enactment 575200 registers low quality under legacy-influenc-55, constrained by the LDAP First Name Field boundary, without role conflict, tied to concept 2106713, node 3, and delivery 102. Enactment 10445649 achieves high quality despite compact-influenc-56, functioning within Viet Children's Aegis boundaries with role conflict present, linked to concept 4463648, node 4, and delivery 103. The presence or absence of role conflict does not consistently correlate with enactment quality, suggesting that conflict may be an inherent feature of certain boundary-spanning roles rather than a simple impediment.

### Stakeholder Perception

Role perceptions document how stakeholders understand and interpret professional roles in practice. The clarity level—ranging from clear to ambiguous to conflicted—captures the degree of shared understanding. Influencing factors mirror those found in enactments, enabling direct comparison. The public_health_roles flag indicates whether the perception pertains to public health functions, and reflexive_practice records whether the stakeholder engages in self-assessment of their role understanding.

**Table `role_perceptions`**

| perception_id | clarity_level | influencing_factors | public_health_roles | reflexive_practice | concept_id | c_l_d_n_id | enactment_id |
|---|---|---|---|---|---|---|---|
| 2106694 | clear | seasonal-influenc-53 | true | false | 884350 | 1 | 8189497 |
| id_26 | ambiguous | regional-influenc-54 | false | true | 392497 | 2 | 1562836 |
| 1562849 | conflicted | legacy-influenc-55 | true | false | 2106713 | 3 | 575200 |
| 3001009030160 | clear | compact-influenc-56 | false | true | 4463648 | 4 | 10445649 |

Perception 2106694 exhibits clear understanding under seasonal-influenc-53, with public health roles affirmed but reflexive practice absent; it connects to concept 884350, node 1, and enactment 8189497. Perception id_26 shows ambiguous clarity under regional-influenc-54, with public health roles not indicated but reflexive practice present, linked to concept 392497, node 2, and enactment 1562836. Perception 1562849 registers as conflicted under legacy-influenc-55, with public health roles affirmed and reflexive practice absent, associated with concept 2106713, node 3, and enactment 575200. Perception 3001009030160 demonstrates clear understanding under compact-influenc-56, with public health roles not indicated but reflexive practice present, tied to concept 4463648, node 4, and enactment 10445649. Notably, the two clear perceptions (2106694 and 3001009030160) correspond to high-quality enactments, while the ambiguous and conflicted perceptions align with medium and low enactment quality respectively, suggesting perception clarity as a predictor of enactment effectiveness.

### Clinical Delivery Nodes

Clinical delivery nodes (CLDNs) anchor individual practitioners within the broader role management framework. Each node records a nurse identifier, a specialization, years of experience, the inter-agency collaboration context, and the resulting role clarity. The CLDN identifier serves as the central join key, connecting to role enactments, role perceptions, inter-agency boundaries, and healthcare deliveries.

**Table `c_l_d_ns`**

| id | nurse_id | specialization | years_of_experience | inter_agency_collaboration | role_clarity | enactment_id | perception_id | inter_agency_boundary_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6969414 | legacy-speciali-13 | 7 | Greater Houston Community Foundation | clear | 8189497 | 2106694 | 1000 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 | 10 | LINK Interchange Network Ltd | ambiguous | 1562836 | id_26 | 1001 |
| 3 | 1250196 | composite-speciali-15 | 13 | Intl. Business Machines | conflicted | 575200 | 1562849 | 1002 |
| 4 | 9125616 | primary-speciali-16 | 16 | GlobalPlatform Inc. | clear | 10445649 | 3001009030160 | 1003 |

Node 1 belongs to nurse 6969414 with legacy-speciali-13 specialization and 7 years of experience, collaborating with the Greater Houston Community Foundation, achieving clear role clarity, and linked to enactment 8189497, perception 2106694, and boundary 1000. Node 2 is associated with nurse 2b2bb518-8fcd-11eb-924d-9cd76263cbd0, holding compact-speciali-14 specialization and 10 years of experience, working through LINK Interchange Network Ltd, experiencing ambiguous role clarity, connected to enactment 1562836, perception id_26, and boundary 1001. Node 3 belongs to nurse 1250196 with composite-speciali-15 specialization and 13 years of experience, collaborating with Intl. Business Machines, facing conflicted role clarity, tied to enactment 575200, perception 1562849, and boundary 1002. Node 4 is linked to nurse 9125616, possessing primary-speciali-16 specialization and 16 years of experience, operating through GlobalPlatform Inc., maintaining clear role clarity, and connected to enactment 10445649, perception 3001009030160, and boundary 1003. The data reveals an interesting pattern: the most experienced nurse (node 4, 16 years) achieves clear role clarity, while the least experienced (node 1, 7 years) also achieves clarity, suggesting that experience alone does not determine role clarity—organizational context and collaboration structures play significant mediating roles.

### Healthcare Delivery Records

Healthcare deliveries document specific service provision events, recording the delivery identifier, service type, complexity level, patient needs category, and measured effectiveness. Each delivery is associated with a clinical delivery node and its corresponding role enactment, enabling analysis of how role dynamics influence service outcomes.

**Table `healthcare_deliveries`**

| healthcare_delivery_id | delivery_id | service_type | complexity_level | patient_needs | effectiveness | c_l_d_n_id | enactment_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 4060633 | community | low | seasonal-patient-35 | effective | 1 | 8189497 | 2025-01-01 00:14:00 |
| 101 | 48753454 | hospital | medium | regional-patient-36 | partially_effective | 2 | 1562836 | 2025-02-06 03:14:00 |
| 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 | specialized | high | legacy-patient-37 | ineffective | 3 | 575200 | 2025-03-11 06:14:00 |
| 103 | 1336176 | community | low | compact-patient-38 | effective | 4 | 10445649 | 2025-04-16 09:14:00 |

Delivery 100 (identifier 4060633) provides community-level service at low complexity, addressing seasonal-patient-35 needs, and is rated effective; it is associated with CLDN 1 and enactment 8189497. Delivery 101 (identifier 48753454) delivers hospital-based service at medium complexity for regional-patient-36, rated partially effective, linked to CLDN 2 and enactment 1562836. Delivery 102 (identifier ba649482-8fbb-11eb-924d-9cd76263cbd0) provides specialized service at high complexity for legacy-patient-37, rated ineffective, connected to CLDN 3 and enactment 575200. Delivery 103 (identifier 1336176) delivers community-level service at low complexity for compact-patient-38, rated effective, tied to CLDN 4 and enactment 10445649. The effectiveness ratings correlate strongly with enactment quality and perception clarity: effective deliveries correspond to high-quality enactments with clear perceptions, while the ineffective delivery maps to low enactment quality and conflicted perception.

### Inter-Agency Boundaries

Inter-agency boundaries define the organizational jurisdictions within which role enactments occur. Each boundary records an agency type, tension level, whether encroachment is present, and the impact on role functioning. Boundaries serve as contextual filters that shape how role concepts are enacted and perceived.

**Table `inter_agency_boundaries`**

| id | boundary_id | agency_type | tension_level | encroachment_present | impact_on_role | c_l_d_n_id | enactment_id | perception_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 89005 | health | low | true | positive | 1 | 8189497 | 2106694 |
| 1001 | 2106716 | social_care | medium | false | negative | 2 | 1562836 | id_26 |
| 1002 | 9125638 | education | high | true | neutral | 3 | 575200 | 1562849 |
| 1003 | 168541 | other | low | false | positive | 4 | 10445649 | 3001009030160 |

Boundary 1000 (identifier 89005) represents a health agency type with low tension and encroachment present, producing a positive impact on role; it connects to CLDN 1, enactment 8189497, and perception 2106694. Boundary 1001 (identifier 2106716) is a social_care agency with medium tension, no encroachment, and negative role impact, linked to CLDN 2, enactment 1562836, and perception id_26. Boundary 1002 (identifier 9125638) operates in the education sector with high tension and encroachment present, yielding neutral role impact, associated with CLDN 3, enactment 575200, and perception 1562849. Boundary 1003 (identifier 168541) falls under the other agency category with low tension, no encroachment, and positive role impact, connected to CLDN 4, enactment 10445649, and perception 3001009030160. The tension level emerges as a significant factor: low-tension boundaries (1000 and 1003) produce positive role impacts, while medium and high tension (1001 and 1002) produce negative and neutral impacts respectively.

### Cross-Referential Analysis

The relational structure of this domain becomes fully apparent through joined views that connect role concepts to their enactments and perceptions, and that trace the influence of clinical delivery nodes, healthcare deliveries, and inter-agency boundaries on role dynamics.

**View `v_role_concept_role_enactment`**

```sql
CREATE VIEW v_role_concept_role_enactment AS
SELECT a.concept_id, a.origin_language, a.theoretical_perspective, a.definition_text, b.enactment_id AS enactment_enactment_id, b.quality_of_enactment AS enactment_quality_of_enactment, b.influencing_factors AS enactment_influencing_factors
FROM role_concepts a JOIN role_enactments b ON a.enactment_id = b.enactment_id;
```

| concept_id | origin_language | theoretical_perspective | definition_text | enactment_enactment_id | enactment_quality_of_enactment | enactment_influencing_factors |
|---|---|---|---|---|---|---|
| 884350 | compact-origin-26 | symbolic_interactionist | primary-definiti-70 | 8189497 | high | seasonal-influenc-53 |
| 392497 | composite-origin-27 | psychological | adaptive-definiti-71 | 1562836 | medium | regional-influenc-54 |
| 2106713 | primary-origin-28 | anthropological | distributed-definiti-72 | 575200 | low | legacy-influenc-55 |
| 4463648 | adaptive-origin-29 | organisational | baseline-definiti-73 | 10445649 | high | compact-influenc-56 |

This view links each role concept to its corresponding enactment, revealing how theoretical definitions translate into operational quality. Concept 884350 (symbolic interactionist, primary definition) maps to enactment 8189497 with high quality under Singapore General Hospital. Concept 392497 (psychological, adaptive definition) maps to enactment 1562836 with medium quality under Professional Educator Standards Board. Concept 2106713 (anthropological, distributed definition) maps to enactment 575200 with low quality under LDAP First Name Field. Concept 4463648 (organisational, baseline definition) maps to enactment 10445649 with high quality under Viet Children's Aegis. The view demonstrates that no single theoretical perspective guarantees enactment quality; both symbolic interactionist and organisational perspectives achieve high quality, while psychological and anthropological perspectives yield medium and low quality respectively.

**View `v_role_concept_role_perception`**

```sql
CREATE VIEW v_role_concept_role_perception AS
SELECT a.concept_id, a.origin_language, a.theoretical_perspective, a.definition_text, b.perception_id AS perception_perception_id, b.clarity_level AS perception_clarity_level, b.influencing_factors AS perception_influencing_factors
FROM role_concepts a JOIN role_perceptions b ON a.perception_id = b.perception_id;
```

| concept_id | origin_language | theoretical_perspective | definition_text | perception_perception_id | perception_clarity_level | perception_influencing_factors |
|---|---|---|---|---|---|---|
| 884350 | compact-origin-26 | symbolic_interactionist | primary-definiti-70 | 2106694 | clear | seasonal-influenc-53 |
| 392497 | composite-origin-27 | psychological | adaptive-definiti-71 | id_26 | ambiguous | regional-influenc-54 |
| 2106713 | primary-origin-28 | anthropological | distributed-definiti-72 | 1562849 | conflicted | legacy-influenc-55 |
| 4463648 | adaptive-origin-29 | organisational | baseline-definiti-73 | 3001009030160 | clear | compact-influenc-56 |

This view connects role concepts to their corresponding perceptions, enabling assessment of how well conceptual definitions are understood. Concept 884350 aligns with perception 2106694 (clear clarity, public health roles affirmed). Concept 392497 aligns with perception id_26 (ambiguous clarity, public health roles not indicated). Concept 2106713 aligns with perception 1562849 (conflicted clarity, public health roles affirmed). Concept 4463648 aligns with perception 3001009030160 (clear clarity, public health roles not indicated). The correspondence between conceptual clarity and perceptual clarity is not uniform; the anthropological concept (2106713) produces conflicted perception despite being associated with public health roles, suggesting that certain theoretical perspectives may be harder to operationalize in practice.

**View `v_role_enactment_role_concept`**

```sql
CREATE VIEW v_role_enactment_role_concept AS
SELECT a.enactment_id, a.quality_of_enactment, a.influencing_factors, a.inter_agency_boundaries, b.concept_id AS concept_concept_id, b.origin_language AS concept_origin_language, b.theoretical_perspective AS concept_theoretical_perspective
FROM role_enactments a JOIN role_concepts b ON a.concept_id = b.concept_id;
```

| enactment_id | quality_of_enactment | influencing_factors | inter_agency_boundaries | concept_concept_id | concept_origin_language | concept_theoretical_perspective |
|---|---|---|---|---|---|---|
| 8189497 | high | seasonal-influenc-53 | Singapore General Hospital | 884350 | compact-origin-26 | symbolic_interactionist |
| 1562836 | medium | regional-influenc-54 | Professional Educator Standards Board | 392497 | composite-origin-27 | psychological |
| 575200 | low | legacy-influenc-55 | LDAP First Name Field | 2106713 | primary-origin-28 | anthropological |
| 10445649 | high | compact-influenc-56 | Viet Children's Aegis | 4463648 | adaptive-origin-29 | organisational |

This view inverts the relationship, presenting enactments alongside their originating concepts. Enactment 8189497 (high quality, no conflict) derives from concept 884350 (symbolic interactionist). Enactment 1562836 (medium quality, conflict present) derives from concept 392497 (psychological). Enactment 575200 (low quality, no conflict) derives from concept 2106713 (anthropological). Enactment 10445649 (high quality, conflict present) derives from concept 4463648 (organisational). The presence of role conflict in high-quality enactment 10445649 reinforces the observation that conflict is not inherently detrimental; it may reflect the legitimate complexity of boundary-spanning roles.

**View `v_role_enactment_c_l_d_n`**

```sql
CREATE VIEW v_role_enactment_c_l_d_n AS
SELECT a.enactment_id, a.quality_of_enactment, a.influencing_factors, a.inter_agency_boundaries, b.id AS n_id, b.nurse_id AS n_nurse_id, b.specialization AS n_specialization
FROM role_enactments a JOIN c_l_d_ns b ON a.c_l_d_n_id = b.id;
```

| enactment_id | quality_of_enactment | influencing_factors | inter_agency_boundaries | n_id | n_nurse_id | n_specialization |
|---|---|---|---|---|---|---|
| 8189497 | high | seasonal-influenc-53 | Singapore General Hospital | 1 | 6969414 | legacy-speciali-13 |
| 1562836 | medium | regional-influenc-54 | Professional Educator Standards Board | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 |
| 575200 | low | legacy-influenc-55 | LDAP First Name Field | 3 | 1250196 | composite-speciali-15 |
| 10445649 | high | compact-influenc-56 | Viet Children's Aegis | 4 | 9125616 | primary-speciali-16 |

This view connects enactments to their associated clinical delivery nodes, revealing how practitioner characteristics intersect with role execution. Enactment 8189497 corresponds to CLDN 1 (nurse 6969414, 7 years experience, legacy-speciali-13, clear role clarity). Enactment 1562836 corresponds to CLDN 2 (nurse 2b2bb518-8fcd-11eb-924d-9cd76263cbd0, 10 years experience, compact-speciali-14, ambiguous role clarity). Enactment 575200 corresponds to CLDN 3 (nurse 1250196, 13 years experience, composite-speciali-15, conflicted role clarity). Enactment 10445649 corresponds to CLDN 4 (nurse 9125616, 16 years experience, primary-speciali-16, clear role clarity). The data suggests that role clarity at the practitioner level strongly predicts enactment quality, regardless of years of experience.

**View `v_role_enactment_healthcare_delivery`**

```sql
CREATE VIEW v_role_enactment_healthcare_delivery AS
SELECT a.enactment_id, a.quality_of_enactment, a.influencing_factors, a.inter_agency_boundaries, b.healthcare_delivery_id AS delivery_healthcare_delivery_id, b.delivery_id AS delivery_delivery_id, b.service_type AS delivery_service_type
FROM role_enactments a JOIN healthcare_deliveries b ON a.healthcare_delivery_id = b.healthcare_delivery_id;
```

| enactment_id | quality_of_enactment | influencing_factors | inter_agency_boundaries | delivery_healthcare_delivery_id | delivery_delivery_id | delivery_service_type |
|---|---|---|---|---|---|---|
| 8189497 | high | seasonal-influenc-53 | Singapore General Hospital | 100 | 4060633 | community |
| 1562836 | medium | regional-influenc-54 | Professional Educator Standards Board | 101 | 48753454 | hospital |
| 575200 | low | legacy-influenc-55 | LDAP First Name Field | 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 | specialized |
| 10445649 | high | compact-influenc-56 | Viet Children's Aegis | 103 | 1336176 | community |

This view links enactments to their corresponding healthcare deliveries, enabling direct assessment of how role dynamics influence service outcomes. Enactment 8189497 (high quality) maps to delivery 100 (community, low complexity, effective). Enactment 1562836 (medium quality) maps to delivery 101 (hospital, medium complexity, partially effective). Enactment 575200 (low quality) maps to delivery 102 (specialized, high complexity, ineffective). Enactment 10445649 (high quality) maps to delivery 103 (community, low complexity, effective). The correlation between enactment quality and delivery effectiveness is striking: high-quality enactments produce effective deliveries, medium quality yields partial effectiveness, and low quality results in ineffectiveness.

**View `v_role_perception_role_concept`**

```sql
CREATE VIEW v_role_perception_role_concept AS
SELECT a.perception_id, a.clarity_level, a.influencing_factors, a.public_health_roles, b.concept_id AS concept_concept_id, b.origin_language AS concept_origin_language, b.theoretical_perspective AS concept_theoretical_perspective
FROM role_perceptions a JOIN role_concepts b ON a.concept_id = b.concept_id;
```

| perception_id | clarity_level | influencing_factors | public_health_roles | concept_concept_id | concept_origin_language | concept_theoretical_perspective |
|---|---|---|---|---|---|---|
| 2106694 | clear | seasonal-influenc-53 | true | 884350 | compact-origin-26 | symbolic_interactionist |
| id_26 | ambiguous | regional-influenc-54 | false | 392497 | composite-origin-27 | psychological |
| 1562849 | conflicted | legacy-influenc-55 | true | 2106713 | primary-origin-28 | anthropological |
| 3001009030160 | clear | compact-influenc-56 | false | 4463648 | adaptive-origin-29 | organisational |

This view presents perceptions alongside their originating concepts from the perception side. Perception 2106694 (clear, public health roles true) derives from concept 884350 (symbolic interactionist). Perception id_26 (ambiguous, public health roles false) derives from concept 392497 (psychological). Perception 1562849 (conflicted, public health roles true) derives from concept 2106713 (anthropological). Perception 3001009030160 (clear, public health roles false) derives from concept 4463648 (organisational). The view highlights that public health role designation does not guarantee clear perception; perception 1562849 affirms public health roles yet remains conflicted.

**View `v_role_perception_c_l_d_n`**

```sql
CREATE VIEW v_role_perception_c_l_d_n AS
SELECT a.perception_id, a.clarity_level, a.influencing_factors, a.public_health_roles, b.id AS n_id, b.nurse_id AS n_nurse_id, b.specialization AS n_specialization
FROM role_perceptions a JOIN c_l_d_ns b ON a.c_l_d_n_id = b.id;
```

| perception_id | clarity_level | influencing_factors | public_health_roles | n_id | n_nurse_id | n_specialization |
|---|---|---|---|---|---|---|
| 2106694 | clear | seasonal-influenc-53 | true | 1 | 6969414 | legacy-speciali-13 |
| id_26 | ambiguous | regional-influenc-54 | false | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 |
| 1562849 | conflicted | legacy-influenc-55 | true | 3 | 1250196 | composite-speciali-15 |
| 3001009030160 | clear | compact-influenc-56 | false | 4 | 9125616 | primary-speciali-16 |

This view connects perceptions to clinical delivery nodes, showing how practitioner-level role clarity aligns with stakeholder perception. Perception 2106694 (clear) corresponds to CLDN 1 (clear role clarity). Perception id_26 (ambiguous) corresponds to CLDN 2 (ambiguous role clarity). Perception 1562849 (conflicted) corresponds to CLDN 3 (conflicted role clarity). Perception 3001009030160 (clear) corresponds to CLDN 4 (clear role clarity). The perfect alignment between practitioner role clarity and stakeholder perception clarity suggests that these measures capture the same underlying construct from different perspectives.

**View `v_role_perception_role_enactment`**

```sql
CREATE VIEW v_role_perception_role_enactment AS
SELECT a.perception_id, a.clarity_level, a.influencing_factors, a.public_health_roles, b.enactment_id AS enactment_enactment_id, b.quality_of_enactment AS enactment_quality_of_enactment, b.influencing_factors AS enactment_influencing_factors
FROM role_perceptions a JOIN role_enactments b ON a.enactment_id = b.enactment_id;
```

| perception_id | clarity_level | influencing_factors | public_health_roles | enactment_enactment_id | enactment_quality_of_enactment | enactment_influencing_factors |
|---|---|---|---|---|---|---|
| 2106694 | clear | seasonal-influenc-53 | true | 8189497 | high | seasonal-influenc-53 |
| id_26 | ambiguous | regional-influenc-54 | false | 1562836 | medium | regional-influenc-54 |
| 1562849 | conflicted | legacy-influenc-55 | true | 575200 | low | legacy-influenc-55 |
| 3001009030160 | clear | compact-influenc-56 | false | 10445649 | high | compact-influenc-56 |

This view links perceptions to their corresponding enactments. Perception 2106694 (clear) maps to enactment 8189497 (high quality). Perception id_26 (ambiguous) maps to enactment 1562836 (medium quality). Perception 1562849 (conflicted) maps to enactment 575200 (low quality). Perception 3001009030160 (clear) maps to enactment 10445649 (high quality). This view provides the strongest evidence for perception clarity as a predictor of enactment quality, with a monotonic relationship across all four records.

**View `v_c_l_d_n_role_enactment`**

```sql
CREATE VIEW v_c_l_d_n_role_enactment AS
SELECT a.id, a.nurse_id, a.specialization, a.years_of_experience, b.enactment_id AS enactment_enactment_id, b.quality_of_enactment AS enactment_quality_of_enactment, b.influencing_factors AS enactment_influencing_factors
FROM c_l_d_ns a JOIN role_enactments b ON a.enactment_id = b.enactment_id;
```

| id | nurse_id | specialization | years_of_experience | enactment_enactment_id | enactment_quality_of_enactment | enactment_influencing_factors |
|---|---|---|---|---|---|---|
| 1 | 6969414 | legacy-speciali-13 | 7 | 8189497 | high | seasonal-influenc-53 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 | 10 | 1562836 | medium | regional-influenc-54 |
| 3 | 1250196 | composite-speciali-15 | 13 | 575200 | low | legacy-influenc-55 |
| 4 | 9125616 | primary-speciali-16 | 16 | 10445649 | high | compact-influenc-56 |

This view presents clinical delivery nodes alongside their role enactments. CLDN 1 (nurse 6969414, 7 years, clear clarity) connects to enactment 8189497 (high quality, no conflict). CLDN 2 (nurse 2b2bb518-8fcd-11eb-924d-9cd76263cbd0, 10 years, ambiguous clarity) connects to enactment 1562836 (medium quality, conflict present). CLDN 3 (nurse 1250196, 13 years, conflicted clarity) connects to enactment 575200 (low quality, no conflict). CLDN 4 (nurse 9125616, 16 years, clear clarity) connects to enactment 10445649 (high quality, conflict present). The view reinforces that role clarity at the practitioner level is the dominant predictor of enactment quality.

**View `v_c_l_d_n_role_perception`**

```sql
CREATE VIEW v_c_l_d_n_role_perception AS
SELECT a.id, a.nurse_id, a.specialization, a.years_of_experience, b.perception_id AS perception_perception_id, b.clarity_level AS perception_clarity_level, b.influencing_factors AS perception_influencing_factors
FROM c_l_d_ns a JOIN role_perceptions b ON a.perception_id = b.perception_id;
```

| id | nurse_id | specialization | years_of_experience | perception_perception_id | perception_clarity_level | perception_influencing_factors |
|---|---|---|---|---|---|---|
| 1 | 6969414 | legacy-speciali-13 | 7 | 2106694 | clear | seasonal-influenc-53 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 | 10 | id_26 | ambiguous | regional-influenc-54 |
| 3 | 1250196 | composite-speciali-15 | 13 | 1562849 | conflicted | legacy-influenc-55 |
| 4 | 9125616 | primary-speciali-16 | 16 | 3001009030160 | clear | compact-influenc-56 |

This view connects clinical delivery nodes to their corresponding role perceptions. CLDN 1 (clear role clarity) maps to perception 2106694 (clear). CLDN 2 (ambiguous role clarity) maps to perception id_26 (ambiguous). CLDN 3 (conflicted role clarity) maps to perception 1562849 (conflicted). CLDN 4 (clear role clarity) maps to perception 3001009030160 (clear). The one-to-one correspondence between practitioner role clarity and perception clarity underscores the importance of role definition in achieving shared understanding.

**View `v_c_l_d_n_inter_agency_boundary`**

```sql
CREATE VIEW v_c_l_d_n_inter_agency_boundary AS
SELECT a.id, a.nurse_id, a.specialization, a.years_of_experience, b.id AS boundary_id, b.boundary_id AS boundary_boundary_id, b.agency_type AS boundary_agency_type
FROM c_l_d_ns a JOIN inter_agency_boundaries b ON a.inter_agency_boundary_id = b.id;
```

| id | nurse_id | specialization | years_of_experience | boundary_id | boundary_boundary_id | boundary_agency_type |
|---|---|---|---|---|---|---|
| 1 | 6969414 | legacy-speciali-13 | 7 | 1000 | 89005 | health |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 | 10 | 1001 | 2106716 | social_care |
| 3 | 1250196 | composite-speciali-15 | 13 | 1002 | 9125638 | education |
| 4 | 9125616 | primary-speciali-16 | 16 | 1003 | 168541 | other |

This view links clinical delivery nodes to their inter-agency boundaries. CLDN 1 (clear role clarity) operates under boundary 1000 (health agency, low tension, positive impact). CLDN 2 (ambiguous role clarity) operates under boundary 1001 (social_care agency, medium tension, negative impact). CLDN 3 (conflicted role clarity) operates under boundary 1002 (education agency, high tension, neutral impact). CLDN 4 (clear role clarity) operates under boundary 1003 (other agency, low tension, positive impact). The tension level of the boundary emerges as a structural determinant of role clarity: low-tension boundaries support clear role understanding, while medium and high tension erode it.

**View `v_healthcare_delivery_c_l_d_n`**

```sql
CREATE VIEW v_healthcare_delivery_c_l_d_n AS
SELECT a.healthcare_delivery_id, a.delivery_id, a.service_type, a.complexity_level, b.id AS n_id, b.nurse_id AS n_nurse_id, b.specialization AS n_specialization
FROM healthcare_deliveries a JOIN c_l_d_ns b ON a.c_l_d_n_id = b.id;
```

| healthcare_delivery_id | delivery_id | service_type | complexity_level | n_id | n_nurse_id | n_specialization |
|---|---|---|---|---|---|---|
| 100 | 4060633 | community | low | 1 | 6969414 | legacy-speciali-13 |
| 101 | 48753454 | hospital | medium | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 |
| 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 | specialized | high | 3 | 1250196 | composite-speciali-15 |
| 103 | 1336176 | community | low | 4 | 9125616 | primary-speciali-16 |

This view connects healthcare deliveries to their associated clinical delivery nodes. Delivery 100 (community, low complexity, effective) maps to CLDN 1 (clear role clarity). Delivery 101 (hospital, medium complexity, partially effective) maps to CLDN 2 (ambiguous role clarity). Delivery 102 (specialized, high complexity, ineffective) maps to CLDN 3 (conflicted role clarity). Delivery 103 (community, low complexity, effective) maps to CLDN 4 (clear role clarity). The view demonstrates that delivery effectiveness is contingent on the role clarity of the associated practitioner, regardless of service type or complexity.

**View `v_healthcare_delivery_role_enactment`**

```sql
CREATE VIEW v_healthcare_delivery_role_enactment AS
SELECT a.healthcare_delivery_id, a.delivery_id, a.service_type, a.complexity_level, b.enactment_id AS enactment_enactment_id, b.quality_of_enactment AS enactment_quality_of_enactment, b.influencing_factors AS enactment_influencing_factors
FROM healthcare_deliveries a JOIN role_enactments b ON a.enactment_id = b.enactment_id;
```

| healthcare_delivery_id | delivery_id | service_type | complexity_level | enactment_enactment_id | enactment_quality_of_enactment | enactment_influencing_factors |
|---|---|---|---|---|---|---|
| 100 | 4060633 | community | low | 8189497 | high | seasonal-influenc-53 |
| 101 | 48753454 | hospital | medium | 1562836 | medium | regional-influenc-54 |
| 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 | specialized | high | 575200 | low | legacy-influenc-55 |
| 103 | 1336176 | community | low | 10445649 | high | compact-influenc-56 |

This view links healthcare deliveries to their corresponding role enactments. Delivery 100 (effective) maps to enactment 8189497 (high quality). Delivery 101 (partially effective) maps to enactment 1562836 (medium quality). Delivery 102 (ineffective) maps to enactment 575200 (low quality). Delivery 103 (effective) maps to enactment 10445649 (high quality). This view provides the most direct evidence for the operational thesis: role enactment quality is the primary determinant of healthcare delivery effectiveness.

**View `v_inter_agency_boundary_c_l_d_n`**

```sql
CREATE VIEW v_inter_agency_boundary_c_l_d_n AS
SELECT a.id, a.boundary_id, a.agency_type, a.tension_level, b.id AS n_id, b.nurse_id AS n_nurse_id, b.specialization AS n_specialization
FROM inter_agency_boundaries a JOIN c_l_d_ns b ON a.c_l_d_n_id = b.id;
```

| id | boundary_id | agency_type | tension_level | n_id | n_nurse_id | n_specialization |
|---|---|---|---|---|---|---|
| 1000 | 89005 | health | low | 1 | 6969414 | legacy-speciali-13 |
| 1001 | 2106716 | social_care | medium | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 |
| 1002 | 9125638 | education | high | 3 | 1250196 | composite-speciali-15 |
| 1003 | 168541 | other | low | 4 | 9125616 | primary-speciali-16 |

This view connects inter-agency boundaries to their associated clinical delivery nodes. Boundary 1000 (health, low tension, positive impact) maps to CLDN 1 (clear role clarity). Boundary 1001 (social_care, medium tension, negative impact) maps to CLDN 2 (ambiguous role clarity). Boundary 1002 (education, high tension, neutral impact) maps to CLDN 3 (conflicted role clarity). Boundary 1003 (other, low tension, positive impact) maps to CLDN 4 (clear role clarity). The boundary-to-cldn mapping confirms that organizational boundary characteristics—particularly tension level—structurally shape practitioner role clarity.

**View `v_inter_agency_boundary_role_enactment`**

```sql
CREATE VIEW v_inter_agency_boundary_role_enactment AS
SELECT a.id, a.boundary_id, a.agency_type, a.tension_level, b.enactment_id AS enactment_enactment_id, b.quality_of_enactment AS enactment_quality_of_enactment, b.influencing_factors AS enactment_influencing_factors
FROM inter_agency_boundaries a JOIN role_enactments b ON a.enactment_id = b.enactment_id;
```

| id | boundary_id | agency_type | tension_level | enactment_enactment_id | enactment_quality_of_enactment | enactment_influencing_factors |
|---|---|---|---|---|---|---|
| 1000 | 89005 | health | low | 8189497 | high | seasonal-influenc-53 |
| 1001 | 2106716 | social_care | medium | 1562836 | medium | regional-influenc-54 |
| 1002 | 9125638 | education | high | 575200 | low | legacy-influenc-55 |
| 1003 | 168541 | other | low | 10445649 | high | compact-influenc-56 |

This view links inter-agency boundaries to their corresponding role enactments. Boundary 1000 (low tension, positive impact) maps to enactment 8189497 (high quality). Boundary 1001 (medium tension, negative impact) maps to enactment 1562836 (medium quality). Boundary 1002 (high tension, neutral impact) maps to enactment 575200 (low quality). Boundary 1003 (low tension, positive impact) maps to enactment 10445649 (high quality). The view reveals that boundary tension level predicts enactment quality: low tension supports high quality, medium tension yields medium quality, and high tension results in low quality.

**View `v_inter_agency_boundary_role_perception`**

```sql
CREATE VIEW v_inter_agency_boundary_role_perception AS
SELECT a.id, a.boundary_id, a.agency_type, a.tension_level, b.perception_id AS perception_perception_id, b.clarity_level AS perception_clarity_level, b.influencing_factors AS perception_influencing_factors
FROM inter_agency_boundaries a JOIN role_perceptions b ON a.perception_id = b.perception_id;
```

| id | boundary_id | agency_type | tension_level | perception_perception_id | perception_clarity_level | perception_influencing_factors |
|---|---|---|---|---|---|---|
| 1000 | 89005 | health | low | 2106694 | clear | seasonal-influenc-53 |
| 1001 | 2106716 | social_care | medium | id_26 | ambiguous | regional-influenc-54 |
| 1002 | 9125638 | education | high | 1562849 | conflicted | legacy-influenc-55 |
| 1003 | 168541 | other | low | 3001009030160 | clear | compact-influenc-56 |

This view connects inter-agency boundaries to their corresponding role perceptions. Boundary 1000 (low tension, positive impact) maps to perception 2106694 (clear). Boundary 1001 (medium tension, negative impact) maps to perception id_26 (ambiguous). Boundary 1002 (high tension, neutral impact) maps to perception 1562849 (conflicted). Boundary 1003 (low tension, positive impact) maps to perception 3001009030160 (clear). The boundary-perception relationship mirrors the boundary-enactment relationship, confirming that organizational boundary characteristics shape both practitioner understanding and stakeholder perception.

### Synthesis

The relational architecture of role management in inter-agency healthcare delivery reveals a coherent causal chain. Role concepts provide the definitional foundation, but their translation into effective practice depends on the quality of enactment, which is itself shaped by the clarity of role perception and the characteristics of the inter-agency boundary. Clinical delivery nodes serve as the operational anchor, where individual practitioners embody the intersection of role definition, perception, and boundary context. Healthcare delivery effectiveness emerges as the ultimate outcome measure, directly correlated with enactment quality and, by extension, with perception clarity and boundary tension. The data supports a model in which reducing inter-agency tension and clarifying role definitions produce cascading improvements across enactment quality, perception clarity, and service effectiveness. Practitioners operating within low-tension boundaries with clear role definitions consistently achieve high-quality enactments and effective service delivery, while those in high-tension environments with ambiguous or conflicted perceptions face systemic barriers to effective practice.