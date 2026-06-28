---
chapter_id: ch_live_nist80053_moderate_impact_726ca7
topic_id: 7
family: 07_long_tail
cited_terms: ['nist80053_moderate_impact', 'xdp_action_redirect', 'designative_subclass_basic']
model: engine-refine
---

Compliance frameworks and data governance architectures rely upon a structured taxonomy of identifiers, categories, and impact classifications to ensure traceability across regulatory boundaries. The NIST 800-53 moderate-impact regime exemplifies this discipline: each control reference is assigned a unique identifier such as IMPA-0001 through IMPA-0004, and these identifiers anchor mappings to specific federal standards—SP 800-53, SP 800-171, and SP 800-218—while simultaneously being classified under impact thresholds like Moderate Threshold, System Security Moderate, Impact Level Moderate, and Moderate Baseline. The relationship between a given NIST standard and its applicable impact level is not merely associative; it carries a role designation—observer, contributor, or owner—that encodes the nature of the linkage. For instance, IMPA-0002 (linked to SP 800-53) assumes an observer role against IMPA-0007, whereas IMPA-0006 assumes a contributor role against IMPA-0001, and IMPA-0007 assumes an owner role against IMPA-0007. This tripartite structure—subject, target, and role—enables auditors to reconstruct the provenance and responsibility chain for every compliance assertion.

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

In parallel data warehouse designs, the X D P action dimension provides a parallel taxonomy for tracking operational events. Each action is identified by a key—REDI-0005, REDI-0003, REDI-0006—and classified within a category such as X D P Action Category 01 through X D P Action Category 04, with a human-readable label like X D P Action Label 01 through X D P Action Label 04 serving as the misc field for display and reporting purposes. The fact table that records actual X D P actions references these dimension keys and attaches quantitative metadata: size bytes values ranging from 113,807,155 to 263,642,012 bytes, and version numbers spanning 4 through 9. This separation of dimension (what the action is) from fact (how much data it moved and which version was involved) is a standard dimensional modeling practice that supports both analytical querying and operational auditing.

**fact_xdp**

| id | x_d_p_action_key | size_bytes | version |
| --- | --- | --- | --- |
| REDI-0001 | REDI-0005 | 263642012 | 9 |
| REDI-0002 | REDI-0005 | 113807155 | 4 |
| REDI-0003 | REDI-0003 | 185269640 | 5 |
| REDI-0004 | REDI-0006 | 206478920 | 6 |

**dim_x_d_p_action**

| id | x_d_p_action_label | x_d_p_action_category |
| --- | --- | --- |
| REDI-0001 | X D P Action Label 01 | X D P Action Category 01 |
| REDI-0002 | X D P Action Label 02 | X D P Action Category 02 |
| REDI-0003 | X D P Action Label 03 | X D P Action Category 03 |
| REDI-0004 | X D P Action Label 04 | X D P Action Category 04 |
| REDI-0005 | X D P Action Label 05 | X D P Action Category 05 |
| REDI-0006 | X D P Action Label 06 | X D P Action Category 06 |
| REDI-0007 | X D P Action Label 07 | X D P Action Category 07 |

The designative subclass basic table introduces a multilingual classification layer where each entry carries a designative value—event_tag_crash, plate_A04, barcode_8842X—paired with a code such as D-33, B-12, or E-21, and a language attribute indicating the locale context (fr, es). This structure supports internationalized systems where the same designative concept may be referenced under different codes or in different languages. The repetition of event_tag_crash under both fr (code D-33) and es (code D-33) demonstrates that the code can remain stable across language variants, while the language column explicitly disambiguates the locale for downstream processing.

Together, these tables form a coherent metadata fabric: identifiers serve as the universal binding mechanism across all tables, categories and misc fields provide human-understandable classification, language enables locale-aware rendering, roles encode relationship semantics, size bytes and version capture quantitative and temporal attributes of events, and the subject-target-role triad models the directional relationships between compliance standards and their impact classifications. The architecture ensures that every data element—from a NIST control reference to an X D P action record to a designative subclass entry—can be traced to its authoritative source, its classification context, and its operational history.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |