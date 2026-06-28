---
chapter_id: ch_live_policy_classification_tier_74ffe2
topic_id: 168
family: 03_directive_governance
cited_terms: ['policy_classification_tier', 'ontology_class_match', 'dempster_combinant_first']
model: engine-refine
---

Ontology matching serves as the foundational mechanism for aligning domain-specific entities with standardized reference classes, a process that inherently produces both a confidence score and an uncertainty bound. When a fact is evaluated against an ontology class, the system records a confidence value—such as 0.829 for one match or 0.272 for another—indicating the degree of belief that the alignment is correct. Simultaneously, an uncertainty metric quantifies the margin of error or variance around that assessment, ranging from a tight 27.88 in high-confidence cases to 688.77 where the match is tenuous. These paired measures allow downstream consumers to weight evidence appropriately: a match with confidence 0.796 and uncertainty 236.57 carries a different operational implication than one with confidence 0.584 and uncertainty 688.77, even though both reference the same ontology class identifier. The ontology class itself is further characterized by a category label and a human-readable descriptor, enabling both machine-readable routing and human auditability.

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

Policy classification extends this matching logic into a structured governance hierarchy, where each policy is assigned a tier identifier and mapped to a classification level that dictates access and handling requirements. A policy such as the Medical Privacy Directive receives the identifier TIER-0001 and is classified at Tier 3 Critical, while the Financial SEC Reporting Rule, identified as TIER-0002, is assigned Restricted Access. The Environmental EPA Emissions Standard, TIER-0003, falls under Level 2 Sensitive. These classification tiers are not merely labels; they encode operational constraints that determine who may access the policy, under what conditions, and with what level of scrutiny. The tier identifier serves as the stable key that ties together the policy definition, its classification level, and the roles assigned to each relationship.

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

The relationship between policies and classification tiers is mediated through a role-based junction that explicitly records the subject, target, and role of each association. In this model, the subject is the policy entity—such as TIER-0002 for the Financial SEC Reporting Rule—and the target is the classification tier it is mapped to, for instance TIER-0003 representing Restricted Access. The role field captures the nature of the relationship: owner, observer, contributor, or reviewer. This triad ensures that every linkage between a policy and its classification tier is semantically complete, specifying not just which entities are connected but how they interact. A single policy may appear as the subject in multiple relationships with different roles, reflecting the multi-faceted governance structure that governs how policies are managed, monitored, and updated.

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

Evidence combination through Dempster-Shafer theory introduces a parallel structure for aggregating uncertain evidence from multiple sources. Combinant entities such as the UncertaintyPropagationPipeline or the MultiSourceInferenceEngine represent distinct evidence-processing mechanisms, each of which can be associated with one or more first combinants—concrete data sources like HistoricalLogArchive, CoreTelemetryFeed, GroundTruthLabels, or PrimaryFlightData. The association between a combinator and its first combinant is again expressed through a subject-target-role pattern, where the combinator is the subject, the first combinant is the target, and the role (owner, reviewer, or observer) defines the nature of the evidentiary relationship. This structure allows the system to track not only what evidence exists but how it was combined and by whom.

**t_dempster_combinant_first**

| id | dempster |
| --- | --- |
| FIRS-0001 | UncertaintyPropagationPipeline |
| FIRS-0002 | MultiSourceInferenceEngine |
| FIRS-0003 | EvidenceCombinationModel |
| FIRS-0004 | ProvenanceAggregator |
| FIRS-0005 | DataQualityFusionService |
| FIRS-0006 | BeliefFusionEngine |

**t_dempster_combinant_first_first_combinant**

| id | first_combinant |
| --- | --- |
| FIRS-0001 | HistoricalLogArchive |
| FIRS-0002 | CoreTelemetryFeed |
| FIRS-0003 | GroundTruthLabels |
| FIRS-0004 | PrimaryFlightData |
| FIRS-0005 | LIDARPointCloud |
| FIRS-0006 | BaselineSensorArray |

**t_dempster_combinant_first__first_combinant**

| id | dempster_id | first_combinant_id | role |
| --- | --- | --- | --- |
| FIRS-0001 | FIRS-0001 | FIRS-0005 | observer |
| FIRS-0002 | FIRS-0005 | FIRS-0002 | reviewer |
| FIRS-0003 | FIRS-0001 | FIRS-0004 | observer |
| FIRS-0004 | FIRS-0005 | FIRS-0006 | owner |
| FIRS-0005 | FIRS-0004 | FIRS-0005 | owner |
| FIRS-0006 | FIRS-0005 | FIRS-0005 | owner |
| FIRS-0007 | FIRS-0006 | FIRS-0004 | contributor |
| FIRS-0008 | FIRS-0002 | FIRS-0005 | observer |

Across all these structures, the identifier serves as the immutable anchor for every entity, whether it is a policy tier, an ontology class, or a Dempster-Shafer combinator. The category field provides a higher-level grouping that enables aggregation and filtering, while the misc field captures auxiliary values—such as the 882.98 associated with one ontology match or the 381.96 linked to another—that may represent derived scores, weights, or metadata not captured by the primary fields. Confidence and uncertainty remain the critical pair for assessing the reliability of any match or classification, and the role field ensures that every relationship is governed by a clear accountability structure. Together, these elements form a coherent framework for managing ontological alignment, policy governance, and evidence combination in a way that is both machine-processable and human-auditable.

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |