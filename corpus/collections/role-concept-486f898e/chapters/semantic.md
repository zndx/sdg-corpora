The domain under examination concerns the ontology of professional role enactment within healthcare delivery ecosystems, where abstract role concepts are instantiated through concrete enactments, perceived by practitioners, and situated within cross-agency boundary contexts. Nurses and allied health professionals navigate role definitions that originate from diverse theoretical perspectives—symbolic interactionism, psychological frameworks, anthropological traditions, and organisational theory—each carrying distinct definitions and related concept networks. These concepts do not remain abstract; they are enacted in practice, perceived with varying degrees of clarity, and shaped by inter-agency collaboration structures that introduce tension, encroachment, and boundary-crossing dynamics. The relational schema captures this multi-layered ontology by normalising role concepts, enactments, perceptions, clinician profiles (`c_l_d_ns`), healthcare delivery events, and inter-agency boundary records into six base tables, then materialising twenty-one denormalised views that reconstruct domain facts through controlled joins.

## Ontological Foundations: Role Concepts and Their Attributes

The conceptual layer of the domain is anchored in the `role_concepts` table, which stores the abstract definitions and theoretical provenance of professional roles. Each row represents a distinct role concept identified by a surrogate `concept_id`—values such as `884350`, `392497`, `2106713`, and `4463648`—and is characterised by its `origin_language` (e.g., `compact-origin-26`, `composite-origin-27`, `primary-origin-28`, `adaptive-origin-29`), its `theoretical_perspective` (ranging from `symbolic_interactionist` to `psychological`, `anthropological`, and `organisational`), a free-text `definition_text` (such as `primary-definiti-70` or `adaptive-definiti-71`), and a `related_concepts` field linking to semantically associated concepts like `pilot-related-80` or `extended-related-81`. The table also carries foreign-key columns `enactment_id` and `perception_id`, which point into the `role_enactments` and `role_perceptions` tables respectively, establishing bidirectional navigability from concept to instantiation and from concept to perception.

**Table `role_concepts`**

| concept_id | origin_language | theoretical_perspective | definition_text | related_concepts | enactment_id | perception_id |
|---|---|---|---|---|---|---|
| 884350 | compact-origin-26 | symbolic_interactionist | primary-definiti-70 | pilot-related-80 | 8189497 | 2106694 |
| 392497 | composite-origin-27 | psychological | adaptive-definiti-71 | extended-related-81 | 1562836 | id_26 |
| 2106713 | primary-origin-28 | anthropological | distributed-definiti-72 | integrated-related-82 | 575200 | 1562849 |
| 4463648 | adaptive-origin-29 | organisational | baseline-definiti-73 | seasonal-related-83 | 10445649 | 3001009030160 |

The cardinality of relationships emerging from `role_concepts` is one-to-one with respect to both `enactment_id` and `perception_id` in the current dataset: each concept row references exactly one enactment and one perception. This design choice reflects a modelling decision that each role concept is instantiated in a single enactment context and perceived through a single perceptual lens within the observed population. The `origin_language` column encodes the linguistic or terminological provenance of the concept, while `theoretical_perspective` situates it within a scholarly tradition—information critical for traceability in ontology-grounded analytics.

## Instantiation: Role Enactments as Operationalised Concepts

The `role_enactments` table materialises abstract concepts into operational reality. Each enactment is identified by `enactment_id` (values `8189497`, `1562836`, `575200`, `10445649`) and carries attributes describing the quality and context of the enactment: `quality_of_enactment` takes values `high`, `medium`, or `low`; `influencing_factors` records contextual drivers such as `seasonal-influenc-53`, `regional-influenc-54`, `legacy-influenc-55`, and `compact-influenc-56`; `inter_agency_boundaries` stores the name of the boundary-crossing organisation or standard (e.g., `Singapore General Hospital`, `Professional Educator Standards Board`, `LDAP First Name Field`, `Viet Children's Aegis`); and `role_conflict_present` is a boolean flag (`true` or `false`) indicating whether the enactment involves role conflict.

**Table `role_enactments`**

| enactment_id | quality_of_enactment | influencing_factors | inter_agency_boundaries | role_conflict_present | concept_id | c_l_d_n_id | healthcare_delivery_id |
|---|---|---|---|---|---|---|---|
| 8189497 | high | seasonal-influenc-53 | Singapore General Hospital | false | 884350 | 1 | 100 |
| 1562836 | medium | regional-influenc-54 | Professional Educator Standards Board | true | 392497 | 2 | 101 |
| 575200 | low | legacy-influenc-55 | LDAP First Name Field | false | 2106713 | 3 | 102 |
| 10445649 | high | compact-influenc-56 | Viet Children's Aegis | true | 4463648 | 4 | 103 |

Foreign keys in `role_enactments` include `concept_id` (referencing `role_concepts`), `c_l_d_n_id` (referencing `c_l_d_ns`), and `healthcare_delivery_id` (referencing `healthcare_deliveries`). The `concept_id` column enforces that every enactment is grounded in a specific role concept—enactment `8189497` is grounded in concept `884350`, enactment `1562836` in concept `392497`, and so forth. The `c_l_d_n_id` column links enactments to clinician profiles (values `1` through `4`), and `healthcare_delivery_id` ties each enactment to a specific healthcare delivery event (values `100` through `103`). The cardinality from `role_concepts` to `role_enactments` is one-to-one in the current data, though the schema supports one-to-many expansion.

## Perceptual Framing: Role Perceptions and Clarity

The `role_perceptions` table captures how role concepts are subjectively experienced by practitioners. Each perception is identified by `perception_id` (values `2106694`, `id_26`, `1562849`, `3001009030160`) and characterised by `clarity_level` (`clear`, `ambiguous`, `conflicted`), `influencing_factors` (mirroring the factors in enactments: `seasonal-influenc-53`, `regional-influenc-54`, `legacy-influenc-55`, `compact-influenc-56`), boolean flags `public_health_roles` and `reflexive_practice`, and foreign keys `concept_id`, `c_l_d_n_id`, and `enactment_id`.

**Table `role_perceptions`**

| perception_id | clarity_level | influencing_factors | public_health_roles | reflexive_practice | concept_id | c_l_d_n_id | enactment_id |
|---|---|---|---|---|---|---|---|
| 2106694 | clear | seasonal-influenc-53 | true | false | 884350 | 1 | 8189497 |
| id_26 | ambiguous | regional-influenc-54 | false | true | 392497 | 2 | 1562836 |
| 1562849 | conflicted | legacy-influenc-55 | true | false | 2106713 | 3 | 575200 |
| 3001009030160 | clear | compact-influenc-56 | false | true | 4463648 | 4 | 10445649 |

The `concept_id` foreign key links each perception to its originating role concept—perception `2106694` corresponds to concept `884350`, perception `id_26` to concept `392497`, etc. The `enactment_id` column creates a direct perceptual link to the corresponding enactment, enabling analysis of how enactment quality maps to perceived clarity. For instance, enactment `8189497` (quality `high`, conflict `false`) is associated with perception `2106694` (clarity `clear`, reflexive_practice `false`), while enactment `1562836` (quality `medium`, conflict `true`) corresponds to perception `id_26` (clarity `ambiguous`, reflexive_practice `true`). The `c_l_d_n_id` column ties perceptions to clinician profiles, completing the triad of concept–enactment–perception.

## Clinician Profiles: The `c_l_d_ns` Table

The `c_l_d_ns` table represents clinician-level profiles, with each row identified by `id` (values `1` through `4`) and carrying attributes about the nurse: `nurse_id` (e.g., `6969414`, `2b2bb518-8fcd-11eb-924d-9cd76263cbd0`, `1250196`, `9125616`), `specialization` (such as `legacy-speciali-13`, `compact-speciali-14`, `composite-speciali-15`, `primary-speciali-16`), `years_of_experience` (values `7`, `10`, `13`, `16`), `inter_agency_collaboration` (naming organisations like `Greater Houston Community Foundation`, `LINK Interchange Network Ltd`, `Intl. Business Machines`, `GlobalPlatform Inc.`), and `role_clarity` (`clear`, `ambiguous`, `conflicted`).

**Table `c_l_d_ns`**

| id | nurse_id | specialization | years_of_experience | inter_agency_collaboration | role_clarity | enactment_id | perception_id | inter_agency_boundary_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6969414 | legacy-speciali-13 | 7 | Greater Houston Community Foundation | clear | 8189497 | 2106694 | 1000 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | compact-speciali-14 | 10 | LINK Interchange Network Ltd | ambiguous | 1562836 | id_26 | 1001 |
| 3 | 1250196 | composite-speciali-15 | 13 | Intl. Business Machines | conflicted | 575200 | 1562849 | 1002 |
| 4 | 9125616 | primary-speciali-16 | 16 | GlobalPlatform Inc. | clear | 10445649 | 3001009030160 | 1003 |

Foreign keys in `c_l_d_ns` include `enactment_id`, `perception_id`, and `inter_agency_boundary_id`. The `enactment_id` column links each clinician profile to a specific enactment (e.g., profile `1` to enactment `8189497`), `perception_id` links to a perception (e.g., profile `1` to perception `2106694`), and `inter_agency_boundary_id` references the `inter_agency_boundaries` table (values `1000` through `1003`). The cardinality from `c_l_d_ns` to each of these tables is one-to-one in the current data, reflecting a design where each clinician profile is associated with exactly one enactment, one perception, and one boundary record.

## Healthcare Delivery Events

The `healthcare_deliveries` table records discrete healthcare service events. Each delivery is identified by `healthcare_delivery_id` (values `100` through `103`) and carries `delivery_id` (e.g., `4060633`, `48753454`, `ba649482-8fbb-11eb-924d-9cd76263cbd0`, `1336176`), `service_type` (`community`, `hospital`, `specialized`), `complexity_level` (`low`, `medium`, `high`), `patient_needs` (e.g., `seasonal-patient-35`, `regional-patient-36`, `legacy-patient-37`, `compact-patient-38`), `effectiveness` (`effective`, `partially_effective`, `ineffective`), and a `created_at` timestamp.

**Table `healthcare_deliveries`**

| healthcare_delivery_id | delivery_id | service_type | complexity_level | patient_needs | effectiveness | c_l_d_n_id | enactment_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 4060633 | community | low | seasonal-patient-35 | effective | 1 | 8189497 | 2025-01-01 00:14:00 |
| 101 | 48753454 | hospital | medium | regional-patient-36 | partially_effective | 2 | 1562836 | 2025-02-06 03:14:00 |
| 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 | specialized | high | legacy-patient-37 | ineffective | 3 | 575200 | 2025-03-11 06:14:00 |
| 103 | 1336176 | community | low | compact-patient-38 | effective | 4 | 10445649 | 2025-04-16 09:14:00 |

Foreign keys include `c_l_d_n_id` (referencing `c_l_d_ns`) and `enactment_id` (referencing `role_enactments`). Delivery `100` is linked to clinician profile `1` and enactment `8189497`; delivery `101` to profile `2` and enactment `1562836`; delivery `102` to profile `3` and enactment `575200`; delivery `103` to profile `4` and enactment `10445649`. The schema supports one-to-many cardinality from `c_l_d_ns` to `healthcare_deliveries`, allowing a single clinician to be associated with multiple delivery events over time.

## Inter-Agency Boundaries

The `inter_agency_boundaries` table captures the structural tensions that arise when professional roles cross organisational boundaries. Each boundary is identified by `id` (values `1000` through `1003`) and carries `boundary_id` (e.g., `89005`, `2106716`, `9125638`, `168541`), `agency_type` (`health`, `social_care`, `education`, `other`), `tension_level` (`low`, `medium`, `high`), boolean `encroachment_present`, `impact_on_role` (`positive`, `negative`, `neutral`), and foreign keys `c_l_d_n_id`, `enactment_id`, and `perception_id`.

**Table `inter_agency_boundaries`**

| id | boundary_id | agency_type | tension_level | encroachment_present | impact_on_role | c_l_d_n_id | enactment_id | perception_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 89005 | health | low | true | positive | 1 | 8189497 | 2106694 |
| 1001 | 2106716 | social_care | medium | false | negative | 2 | 1562836 | id_26 |
| 1002 | 9125638 | education | high | true | neutral | 3 | 575200 | 1562849 |
| 1003 | 168541 | other | low | false | positive | 4 | 10445649 | 3001009030160 |

Boundary `1000` (agency `health`, tension `low`, encroachment `true`, impact `positive`) is linked to clinician profile `1`, enactment `8189497`, and perception `2106694`. Boundary `1001` (agency `social_care`, tension `medium`, encroachment `false`, impact `negative`) connects to profile `2`, enactment `1562836`, and perception `id_26`. Boundary `1002` (agency `education`, tension `high`, encroachment `true`, impact `neutral`) links to profile `3`, enactment `575200`, and perception `1562849`. Boundary `1003` (agency `other`, tension `low`, encroachment `false`, impact `positive`) connects to profile `4`, enactment `10445649`, and perception `3001009030160`. The schema supports one-to-many cardinality from `c_l_d_ns` to `inter_agency_boundaries`, permitting a clinician to encounter multiple boundary contexts.

## View-Based Reconstruction: Joining Normalised Tables

The twenty-one views materialise domain facts by joining the six normalised base tables. Each view answers a specific analytical question by reconstructing a coherent fact from the distributed schema.

The view `v_role_concept_role_enactment` joins `role_concepts` to `role_enactments` on `concept_id`, producing rows that pair each role concept with its enactment context. For example, concept `884350` (origin `compact-origin-26`, perspective `symbolic_interactionist`, definition `primary-definiti-70`) is joined with enactment `8189497` (quality `high`, conflict `false`, boundary `Singapore General Hospital`), revealing how a symbolic-interactionist concept is instantiated in a high-quality, conflict-free enactment at a hospital boundary.

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

The view `v_role_concept_role_perception` joins `role_concepts` to `role_perceptions` on `concept_id`, pairing each concept with its perceptual framing. Concept `392497` (origin `composite-origin-27`, perspective `psychological`, definition `adaptive-definiti-71`) is paired with perception `id_26` (clarity `ambiguous`, reflexive_practice `true`), illustrating how a psychological concept is perceived ambiguously but with active reflexive engagement.

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

The view `v_role_enactment_role_concept` performs the inverse join of `v_role_concept_role_enactment`, starting from enactments and resolving to their grounding concepts. Enactment `575200` (quality `low`, conflict `false`, boundary `LDAP First Name Field`) resolves to concept `2106713` (origin `primary-origin-28`, perspective `anthropological`, definition `distributed-definiti-72`), showing how a low-quality enactment at a technical boundary is grounded in an anthropological concept.

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

The view `v_role_enactment_c_l_d_n` joins `role_enactments` to `c_l_d_ns` on `enactment_id`, linking enactments to the clinician profiles that experience them. Enactment `10445649` (quality `high`, conflict `true`, boundary `Viet Children's Aegis`) is joined with clinician profile `4` (nurse `9125616`, specialization `primary-speciali-16`, experience `16` years, collaboration `GlobalPlatform Inc.`, clarity `clear`), revealing that a high-quality but conflicted enactment at a children's aid boundary is experienced by an experienced nurse with clear role perception.

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

The view `v_role_enactment_healthcare_delivery` joins `role_enactments` to `healthcare_deliveries` on `enactment_id`, connecting enactments to the service events they underpin. Enactment `1562836` (quality `medium`, conflict `true`) is joined with delivery `101` (service `hospital`, complexity `medium`, effectiveness `partially_effective`), demonstrating that a medium-quality conflicted enactment corresponds to a partially effective hospital delivery.

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

The view `v_role_perception_role_concept` joins `role_perceptions` to `role_concepts` on `concept_id`, inverting the conceptual-to-perceptual direction. Perception `1562849` (clarity `conflicted`, reflexive_practice `false`) resolves to concept `2106713` (origin `primary-origin-28`, perspective `anthropological`), showing that a conflicted perception maps to an anthropological concept.

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

The view `v_role_perception_c_l_d_n` joins `role_perceptions` to `c_l_d_ns` on `perception_id`, linking perceptual states to clinician profiles. Perception `3001009030160` (clarity `clear`, reflexive_practice `true`) is joined with clinician profile `4` (nurse `9125616`, experience `16` years, collaboration `GlobalPlatform Inc.`), indicating that a clear and reflexive perception is held by the most experienced nurse in the dataset.

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

The view `v_role_perception_role_enactment` joins `role_perceptions` to `role_enactments` on `enactment_id`, connecting perceptions to their enactment contexts. Perception `id_26` (clarity `ambiguous`, public_health_roles `false`, reflexive_practice `true`) is joined with enactment `1562836` (quality `medium`, conflict `true`, boundary `Professional Educator Standards Board`), revealing that an ambiguous perception accompanies a medium-quality conflicted enactment at an educator standards boundary.

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

The view `v_c_l_d_n_role_enactment` joins `c_l_d_ns` to `role_enactments` on `enactment_id`, starting from clinician profiles and resolving to their enactment contexts. Clinician profile `2` (nurse `2b2bb518-8fcd-11eb-924d-9cd76263cbd0`, specialization `compact-speciali-14`, experience `10` years, collaboration `LINK Interchange Network Ltd`, clarity `ambiguous`) is joined with enactment `1562836` (quality `medium`, conflict `true`), showing that an ambiguous-clarity clinician experiences a medium-quality conflicted enactment.

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

The view `v_c_l_d_n_role_perception` joins `c_l_d_ns` to `role_perceptions` on `perception_id`, linking clinician profiles to their perceptual states. Clinician profile `3` (nurse `1250196`, specialization `composite-speciali-15`, experience `13` years, collaboration `Intl. Business Machines`, clarity `conflicted`) is joined with perception `1562849` (clarity `conflicted`, public_health_roles `true`, reflexive_practice `false`), demonstrating that a conflicted-clarity clinician holds a conflicted perception with active public health engagement but no reflexive practice.

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

The view `v_c_l_d_n_inter_agency_boundary` joins `c_l_d_ns` to `inter_agency_boundaries` on `c_l_d_n_id`, connecting clinician profiles to the boundary contexts they navigate. Clinician profile `1` (nurse `6969414`, specialization `legacy-speciali-13`, experience `7` years, collaboration `Greater Houston Community Foundation`, clarity `clear`) is joined with boundary `1000` (agency `health`, tension `low`, encroachment `true`, impact `positive`), revealing that a clear-clarity clinician with seven years of experience navigates a low-tension health boundary where encroachment has a positive impact.

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

The view `v_healthcare_delivery_c_l_d_n` joins `healthcare_deliveries` to `c_l_d_ns` on `c_l_d_n_id`, linking service events to the clinicians who deliver them. Delivery `102` (service `specialized`, complexity `high`, effectiveness `ineffective`) is joined with clinician profile `3` (nurse `1250196`, specialization `composite-speciali-15`, experience `13` years, collaboration `Intl. Business Machines`, clarity `conflicted`), showing that an ineffective high-complexity specialised delivery is associated with a conflicted-clarity clinician.

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

The view `v_healthcare_delivery_role_enactment` joins `healthcare_deliveries` to `role_enactments` on `enactment_id`, connecting service events to their underlying enactments. Delivery `100` (service `community`, complexity `low`, effectiveness `effective`) is joined with enactment `8189497` (quality `high`, conflict `false`, boundary `Singapore General Hospital`), demonstrating that an effective low-complexity community delivery is grounded in a high-quality, conflict-free enactment.

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

The view `v_inter_agency_boundary_c_l_d_n` joins `inter_agency_boundaries` to `c_l_d_ns` on `c_l_d_n_id`, starting from boundary contexts and resolving to the clinicians affected. Boundary `1002` (agency `education`, tension `high`, encroachment `true`, impact `neutral`) is joined with clinician profile `3` (nurse `1250196`, specialization `composite-speciali-15`, experience `13` years, collaboration `Intl. Business Machines`, clarity `conflicted`), revealing that a high-tension education boundary with encroachment and neutral impact is navigated by a conflicted-clarity clinician with composite specialisation.

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

The view `v_inter_agency_boundary_role_enactment` joins `inter_agency_boundaries` to `role_enactments` on `enactment_id`, linking boundary contexts to their enactment counterparts. Boundary `1001` (agency `social_care`, tension `medium`, encroachment `false`, impact `negative`) is joined with enactment `1562836` (quality `medium`, conflict `true`, boundary `Professional Educator Standards Board`), showing that a medium-tension social care boundary with negative impact corresponds to a medium-quality conflicted enactment.

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

The view `v_inter_agency_boundary_role_perception` joins `inter_agency_boundaries` to `role_perceptions` on `perception_id`, connecting boundary contexts to their perceptual framings. Boundary `1003` (agency `other`, tension `low`, encroachment `false`, impact `positive`) is joined with perception `3001009030160` (clarity `clear`, public_health_roles `false`, reflexive_practice `true`), revealing that a low-tension boundary with positive impact is associated with a clear perception characterised by reflexive practice but no public health role engagement.

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

## Synthesis

The schema models a domain where role concepts—characterised by theoretical perspective, origin language, and definition—serve as ontological anchors for enactments, perceptions, clinician profiles, healthcare deliveries, and inter-agency boundaries. The six base tables are normalised to eliminate redundancy while preserving referential integrity through foreign keys: `role_enactments` references `role_concepts`, `c_l_d_ns`, and `healthcare_deliveries`; `role_perceptions` references `role_concepts`, `c_l_d_ns`, and `role_enactments`; `healthcare_deliveries` references `c_l_d_ns` and `role_enactments`; `inter_agency_boundaries` references `c_l_d_ns`, `role_enactments`, and `role_perceptions`; and `c_l_d_ns` references `role_enactments`, `role_perceptions`, and `inter_agency_boundaries`. The twenty-one views reconstruct domain facts by joining these tables along their foreign-key relationships, each view answering a specific analytical question—from concept-to-enactment mappings to boundary-to-perception associations—enabling ontology-grounded queries that trace professional role dynamics from abstract definition through operational enactment, subjective perception, clinician experience, service delivery, and cross-agency boundary navigation.