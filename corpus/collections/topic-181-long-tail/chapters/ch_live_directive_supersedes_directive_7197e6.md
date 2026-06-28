---
chapter_id: ch_live_directive_supersedes_directive_7197e6
topic_id: 181
family: 03_directive_governance
cited_terms: ['directive_supersedes_directive', 'dempster_combination_subclass', 'soc2_confidentiality_subclass']
model: engine-refine
---

In compliance governance, a directive is not a single document but an entity whose obligations are decomposed into typed attributes. Each attribute—such as `effective_date`, `enforcement`, `mandatory`, or `priority`—carries a declared `attr_type` that constrains how evidence may be recorded and validated: dates conform to `xsd:date`, free-text enforcement language to `xsd:string`, pass-fail applicability to `xsd:boolean`, and ordinal or numeric weight to `xsd:integer`. The identifier scheme (for example `DIRE-0001` through `DIRE-0004`) anchors every assertion to a stable entity key so that supersession relationships among standards like PCI DSS v4.0 and NERC CIP-003 can be traced without conflating version lineage with operational metadata. Typed value stores then bind each entity–attribute pair to a concrete `misc` payload: PCI DSS v4.0 directives carry effective dates ranging from 2024-04-11 to 2023-10-24, enforcement strings such as "Enforcement 02" or encoding markers like "Encoding 01," and boolean mandatory flags that split evenly between true and false across the population. Integer priorities on the same entities span orders of magnitude—from 2 and 3 at the low end to 436 and 990 at the high—signaling that priority is not merely ordinal rank but may encode composite scoring or external reference weights that downstream prioritization engines must interpret in context.

**t_directive_supersedes_directive**

| id | directive |
| --- | --- |
| DIRE-0001 | PCI DSS v4.0 |
| DIRE-0002 | PCI DSS v4.0 |
| DIRE-0003 | NERC CIP-003 |
| DIRE-0004 | PCI DSS v4.0 |
| DIRE-0005 | NIST SP 800-53 |
| DIRE-0006 | NERC CIP-003 |
| DIRE-0007 | FedRAMP Moderate |
| DIRE-0008 | NERC CIP-003 |

**t_directive_supersedes_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_directive_supersedes_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | false |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |
| DIRE-0007 | DIRE-0007 | DIRE-0003 | false |
| DIRE-0008 | DIRE-0008 | DIRE-0003 | true |

**t_directive_supersedes_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-04-11 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2024-01-18 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2023-05-24 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2023-10-24 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2024-12-26 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2025-05-10 |
| DIRE-0007 | DIRE-0007 | DIRE-0001 | 2025-05-06 |
| DIRE-0008 | DIRE-0008 | DIRE-0001 | 2024-01-25 |

**t_directive_supersedes_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 436 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 990 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 2 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 360 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 4 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 588 |

The separation of attribute definition from attribute value is what makes the model auditable. An `attr` row declares what may be said about a directive; the corresponding `entity` and `attr` foreign keys in each typed value table declare who said it and about which facet. When `DIRE-0003` records `mandatory: true` while `DIRE-0002` records `mandatory: false`, the disagreement is not a schema defect but a governance fact: two directives in the same supersession graph can impose different binding force even when they share a standard family name. Likewise, varchar misc values such as "audit excerpt" or locale code "en" attach narrative or localization evidence that boolean and date types cannot capture, preventing a one-size-fits-all coercion that would erode forensic traceability during examinations.

SOC 2 control scoping introduces a parallel dimensional layer keyed by `for_s_o_c2_domain`, where each domain identifier (for instance `CONF-0002` or `CONF-0005`) maps to a human-readable label and a `category` that clusters controls by trust-service theme. Configuration facts hang priority and `review_cycle_days` off that domain key: priorities from 1 through 5 establish relative examination urgency, while review cycles of 372 to 890 days translate policy intent into calendar-bound reassessment obligations. A domain assigned priority 1 with a 890-day cycle and another at priority 5 with 372 days illustrates that urgency and cadence are independently governable levers—high priority does not automatically imply short review intervals, and compliance officers must reconcile both when building annual audit plans.

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |

Where multiple evidentiary sources support the same control conclusion, belief must be fused rather than naïvely averaged. The `combines_via_dempster` dimension names the fusion rule—Dempster's rule of combination—which aggregates partially overlapping bodies of evidence while preserving explicit mass on ignorance. Each combination event carries a `confidence` score and paired `uncertainty` measure: a fusion yielding confidence 0.728 with uncertainty 479.57 represents a materially different epistemic posture than one at 0.014 confidence and 392.06 uncertainty, even if the combined `misc` value (846.10 versus 137.18) suggests a numerically larger outcome in the weaker-confidence case. Category labels on the Dempster dimension further partition fusion strategies so that analysts can filter combination logic by evidentiary context—whether combining scanner findings with policy attestations, correlating change-ticket evidence with penetration-test results, or merging vendor questionnaires across business units.

**fact_dempster**

| id | combines_via_dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.153 | 9.49 | 520.46 |
| COMB-0002 | COMB-0006 | 0.014 | 392.06 | 137.18 |
| COMB-0003 | COMB-0003 | 0.025 | 687.80 | 197.61 |
| COMB-0004 | COMB-0004 | 0.728 | 479.57 | 846.10 |
| COMB-0005 | COMB-0005 | 0.918 | 172.36 | 296.96 |
| COMB-0006 | COMB-0001 | 0.755 | 608.06 | 341.51 |

**dim_combines_via_dempster**

| id | combines_via_dempster_label | combines_via_dempster_category |
| --- | --- | --- |
| COMB-0001 | Combines Via Dempster Label 01 | Combines Via Dempster Category 01 |
| COMB-0002 | Combines Via Dempster Label 02 | Combines Via Dempster Category 02 |
| COMB-0003 | Combines Via Dempster Label 03 | Combines Via Dempster Category 03 |
| COMB-0004 | Combines Via Dempster Label 04 | Combines Via Dempster Category 04 |
| COMB-0005 | Combines Via Dempster Label 05 | Combines Via Dempster Category 05 |
| COMB-0006 | Combines Via Dempster Label 06 | Combines Via Dempster Category 06 |
| COMB-0007 | Combines Via Dempster Label 07 | Combines Via Dempster Category 07 |

Identifiers thread these subsystems into a coherent evidentiary graph. Directive identifiers, attribute identifiers, combination keys (`COMB-0001` through `COMB-0004`), and SOC 2 domain keys are all first-class `identifier` fields, not display text, which allows labels and categories to evolve without breaking referential integrity. The `misc` column, despite its humble name, routinely holds the operational payload that examiners actually cite: enforcement prose, encoded classification tokens, fused numeric scores, or domain labels. Treating misc as semantically rich rather than residual is essential; it is where qualitative compliance language and quantitative fusion outputs coexist in one auditable column family governed by surrounding type and dimension metadata.

In practice, a compliance operator works across these constructs in sequence: locate the entity by identifier, confirm the attribute's declared type, read the typed value (or misc text where varchar applies), scope the finding to the appropriate SOC 2 domain category, rank it by priority, schedule reassessment by review cycle days, and—when multiple sources corroborate or conflict—route the evidentiary set through the designated Dempster combination category to obtain a confidence-weighted conclusion with explicit uncertainty bounds. A PCI DSS directive marked non-mandatory with a near-term effective date may still surface urgently if fused evidence across domains yields low uncertainty and high confidence; conversely, a mandatory NERC CIP-003 obligation with a distant review cycle demands continuous monitoring rather than point-in-time attestation. The architecture encodes that discipline: types prevent silent coercion, categories enable principled aggregation, and confidence–uncertainty pairs force decision-makers to see not only what the model concludes but how firmly it concludes it.

**t_directive_supersedes_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |