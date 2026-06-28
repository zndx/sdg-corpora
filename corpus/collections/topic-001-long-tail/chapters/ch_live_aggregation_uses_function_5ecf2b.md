---
chapter_id: ch_live_aggregation_uses_function_5ecf2b
topic_id: 1
family: 02_observation_measurement
cited_terms: ['aggregation_uses_function', 'human_rights_impact_report', 'control_only_addresses_threat_class']
model: engine-refine
---

Identifiers establish the durable keys through which every governance artifact remains traceable across operational, analytic, and audit contexts. A control that addresses Data Exfiltration through Multi-Factor Authentication carries THRE-0001 as its persistent entity reference, while aggregation logic resolves under FUNC-0001 and human reporting activity under REPO-0001; these codes are not decorative labels but the contractual join points that bind dimensional metadata to fact records, attribute values, and downstream attestations. When an auditor asks whether a given enforcement posture on a given date can be reconstructed, the answer depends on whether entity_id and attr_id pairs resolve unambiguously—THRE-0001 paired with attr_id THRE-0001 for effective_date, or THRE-0003 paired with the mandatory attribute across four distinct control instances—rather than on free-text descriptions that drift between systems.

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |

Attributes and their declared types constitute the typed vocabulary in which control posture is expressed and validated. Each attr—effective_date, enforcement, mandatory, priority—carries an attr_type drawn from a constrained schema namespace: xsd:date for temporal bounds, xsd:string for narrative or coded enforcement language, xsd:boolean for binary obligations, xsd:integer for ordinal or numeric priority. This separation matters because governance systems must reject semantically invalid assertions before they enter the compliance record: a priority value of 926 stored against THRE-0002 is admissible only when the receiving attr_type is xsd:integer, while mandatory assertions of true, false, false, and true across THRE-0001 through THRE-0004 remain comparable only because they share the same boolean attr and entity linkage pattern. Enforcement values such as Enforcement 02 and effective dates spanning 2023-01-13 through 2025-01-04 illustrate how heterogeneous attr families attach to a single entity without collapsing distinct semantic roles into a single undifferentiated value column.

Category provides the taxonomic layer that groups functionally related records for policy interpretation, dashboard roll-up, and scope filtering. Uses Aggregation Function Label 01 through Label 04 each sit within a Uses Aggregation Function Category, while category_id references such as FUNC-0003 and FUNC-0005 tie those labels to named category records—Category Name 01 through Category Name 04—so that analysts can aggregate or restrict by business meaning rather than by opaque key alone. The same principle governs reporting scope: Reports On Label 01 through Label 04 align with Reports On Category 01 through Category 04, allowing event streams and human attestations to be segmented by subject matter. Category therefore mediates between identifier-level granularity and executive-level summaries, ensuring that a control addressing System Downtime via Incident Response Plan can be evaluated alongside peer controls in the same risk class without conflating it with Configuration Drift or Access Review Policy interventions that address overlapping but distinct threat surfaces.

**dim_uses_aggregation_function_category**

| id | category_name |
| --- | --- |
| FUNC-0001 | Category Name 01 |
| FUNC-0002 | Category Name 02 |
| FUNC-0003 | Category Name 03 |
| FUNC-0004 | Category Name 04 |
| FUNC-0005 | Category Name 05 |
| FUNC-0006 | Category Name 06 |

**dim_uses_aggregation_function**

| id | uses_aggregation_function_label | uses_aggregation_function_category | category_id |
| --- | --- | --- | --- |
| FUNC-0001 | Uses Aggregation Function Label 01 | Uses Aggregation Function Category 01 | FUNC-0003 |
| FUNC-0002 | Uses Aggregation Function Label 02 | Uses Aggregation Function Category 02 | FUNC-0003 |
| FUNC-0003 | Uses Aggregation Function Label 03 | Uses Aggregation Function Category 03 | FUNC-0002 |
| FUNC-0004 | Uses Aggregation Function Label 04 | Uses Aggregation Function Category 04 | FUNC-0005 |
| FUNC-0005 | Uses Aggregation Function Label 05 | Uses Aggregation Function Category 05 | FUNC-0006 |
| FUNC-0006 | Uses Aggregation Function Label 06 | Uses Aggregation Function Category 06 | FUNC-0002 |

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | Data Exfiltration |
| THRE-0002 | Incident Response Plan | System Downtime |
| THRE-0003 | Incident Response Plan | Configuration Drift |
| THRE-0004 | Access Review Policy | System Downtime |
| THRE-0005 | Backup Retention Schedule | Configuration Drift |
| THRE-0006 | Backup Retention Schedule | Configuration Drift |
| THRE-0007 | Access Review Policy | Credential Theft |
| THRE-0008 | Incident Response Plan | Supply Chain Compromise |

Confidence and uncertainty quantify the epistemic weight attached to aggregated measurements and must be read jointly rather than as interchangeable synonyms. In the aggregation fact layer, FUNC-0001 records confidence 0.857 against uncertainty 811.48 and a computed value of 835.01, whereas FUNC-0004 carries confidence 0.024 with uncertainty 527.80 and value 996.14—a profile that signals a high-magnitude output accompanied by very low trust. Intermediate rows at confidence 0.688 and 0.639, with uncertainty near 850, show that moderate confidence does not automatically imply low dispersion. Operational practice treats confidence as the system's asserted belief in the aggregation result given available evidence, and uncertainty as the residual spread or doubt interval within which the true quantity may plausibly lie; governance workflows typically gate automated decisions on minimum confidence thresholds while routing high-uncertainty outputs to human review, particularly when uses_aggregation_function_key references such as FUNC-0004 and FUNC-0005 denote functions whose category placement may alter the evidentiary standard applied to the resulting misc value.

**fact_aggregation**

| id | uses_aggregation_function_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | 0.857 | 811.48 | 835.01 |
| FUNC-0002 | FUNC-0004 | 0.688 | 850.83 | 952.80 |
| FUNC-0003 | FUNC-0004 | 0.639 | 844.56 | 52.67 |
| FUNC-0004 | FUNC-0005 | 0.024 | 527.80 | 996.14 |
| FUNC-0005 | FUNC-0002 | 0.062 | 315.40 | 941.21 |

The uses_aggregation_function construct names the computational primitive—sum, weighted average, percentile threshold, or domain-specific rollup—through which raw signals become policy-relevant metrics. Dimension records bind each function identifier to a human-readable uses_aggregation_function_label and to both a free-text uses_aggregation_function_category and a normalized category_id, so that FUNC-0004 may appear twice as a fact key while still resolving to a single definitional row. Fact rows keyed FUNC-0001, FUNC-0002, FUNC-0003, and FUNC-0004 demonstrate how the same function registry supports multiple concurrent measurements, each with its own confidence-uncertainty-value triple, enabling trend analysis and version comparison without redefining the underlying aggregation semantics.

Human reporting complements machine aggregation by anchoring qualitative oversight to countable activity and explicit subject linkage. Each fact_human record carries an event_count—369, 491, 354, or 167 observations—that measures how much attestation or review traffic a given reporting entity generated, while reports_on_key values such as REPO-0006, REPO-0005, and REPO-0007 specify the object or domain upon which that activity reports, traversing dim_reports_on for label and category context. In mature operations, event_count thresholds trigger escalation when reporting volume falls below expected cadence, and reports_on resolution ensures that a surge in events against REPO-0006 is interpreted against the correct Reports On Category rather than as undifferentiated noise. Together, identifier-backed entities, typed attrs, categorical taxonomies, confidence-weighted aggregation functions, and event-counted human reports form a closed evidentiary chain: controls declare what they address and when they bind; attributes encode enforceable posture; aggregation functions produce quantified assessments whose misc values carry explicit uncertainty budgets; and human reporters supply the periodic attestations that confirm or challenge what the automated layer has inferred.

**fact_human**

| id | reports_on_key | event_count |
| --- | --- | --- |
| REPO-0001 | REPO-0006 | 369 |
| REPO-0002 | REPO-0006 | 491 |
| REPO-0003 | REPO-0005 | 354 |
| REPO-0004 | REPO-0007 | 167 |
| REPO-0005 | REPO-0007 | 8 |
| REPO-0006 | REPO-0001 | 333 |
| REPO-0007 | REPO-0001 | 488 |
| REPO-0008 | REPO-0002 | 207 |

**dim_reports_on**

| id | reports_on_label | reports_on_category |
| --- | --- | --- |
| REPO-0001 | Reports On Label 01 | Reports On Category 01 |
| REPO-0002 | Reports On Label 02 | Reports On Category 02 |
| REPO-0003 | Reports On Label 03 | Reports On Category 03 |
| REPO-0004 | Reports On Label 04 | Reports On Category 04 |
| REPO-0005 | Reports On Label 05 | Reports On Category 05 |
| REPO-0006 | Reports On Label 06 | Reports On Category 06 |
| REPO-0007 | Reports On Label 07 | Reports On Category 07 |