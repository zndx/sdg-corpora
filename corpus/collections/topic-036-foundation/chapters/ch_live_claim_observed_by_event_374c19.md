---
chapter_id: ch_live_claim_observed_by_event_374c19
topic_id: 36
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'social_enterprise_annual_income', 'table_provenance_source']
model: engine-refine
---

In governed data environments, assertions about organizational performance are rarely treated as self-evident truths; they are claims whose evidentiary weight must be stated explicitly and whose lineage must remain auditable. A claim is a structured proposition—here keyed as EVEN-0002, EVEN-0006, and related identifiers—that carries not only a substantive value (164.54, 173.58, 166.95, 152.06) but also paired epistemic metadata: confidence, expressing the degree of belief in the assertion on a bounded scale (0.621, 0.596, 0.338, 0.364), and uncertainty, quantifying residual doubt or dispersion in complementary units (571.46, 43.01, 142.53, 296.86). The coexistence of both measures matters in practice because governance frameworks rarely collapse judgment into a single scalar; auditors, model validators, and compliance officers need to distinguish between an assertion that is moderately believed yet highly volatile and one that is weakly believed but tightly bounded. When the same claim key recurs across multiple fact rows—as EVEN-0002 does three times with divergent confidence–uncertainty profiles—the operational implication is that a single conceptual claim may be instantiated under different evidential conditions, and downstream consumers must resolve or reconcile those instances rather than treating the key as synonymous with a unique truth.

Dimensional classification supplies the interpretive scaffolding without which raw identifiers would be opaque. Each identifier—EVEN-0001 through EVEN-0004, INCO-0001 through INCO-0004, SOUR-0001 through SOUR-0004—functions as a durable surrogate key that binds facts to human-readable labels and to category assignments that govern reporting, access control, and analytical roll-up. Claim Label 01 through Claim Label 04 sit within Claim Category 01 through Claim Category 04; sourced-from-table labels and categories perform the parallel function for provenance. Category is therefore not decorative metadata but a control surface: it determines which assertions enter which compliance workflows, which aggregation rules apply, and which dispute-resolution procedures are triggered when confidence falls below policy thresholds. Miscellaneous descriptive fields—claim labels, dimension labels, and free-form values such as Dimension Kind 01, Encoding 02, change rationale, or the locale code fr—occupy a deliberately heterogeneous role, capturing particulars that resist rigid typing yet remain indispensable for audit narrative and operational context.

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

**dim_sourced_from_table**

| id | sourced_from_table_label | sourced_from_table_category |
| --- | --- | --- |
| SOUR-0001 | Sourced From Table Label 01 | Sourced From Table Category 01 |
| SOUR-0002 | Sourced From Table Label 02 | Sourced From Table Category 02 |
| SOUR-0003 | Sourced From Table Label 03 | Sourced From Table Category 03 |
| SOUR-0004 | Sourced From Table Label 04 | Sourced From Table Category 04 |
| SOUR-0005 | Sourced From Table Label 05 | Sourced From Table Category 05 |
| SOUR-0006 | Sourced From Table Label 06 | Sourced From Table Category 06 |
| SOUR-0007 | Sourced From Table Label 07 | Sourced From Table Category 07 |
| SOUR-0008 | Sourced From Table Label 08 | Sourced From Table Category 08 |

Social enterprise annual income exemplifies how entity-centric subject matter is modeled when the governed object is neither a transaction nor a static registry entry but an organization whose reported financial standing must be attributed, typed, and time-stamped. BrightFuture Learning, Sustainable Harvest Fund, and Urban Harvest Co-op appear as distinct entities under the socialenterpriseannualincome subject, with Urban Harvest Co-op represented twice—signaling either duplicate registration, multi-year restatement, or legitimately separate income records that share a display name and therefore demand identifier-level disambiguation. The entity is the anchor; everything else hangs from it as attribute–value pairs partitioned by attr_type so that validation, indexing, and retention policies can be enforced at the schema layer. Attributes named confidence, dimension_kind, method, and recorded_at are declared with types xsd:decimal, xsd:string, xsd:string, and xsd:dateTime respectively, and values are stored in type-appropriate tables: decimals such as 0.063, 21.38, 997.65, and 0.705; strings including Dimension Kind 01 and Encoding 02; and timestamps spanning 2023-12-18 through 2025-02-04. This separation of attr from attr_type is a practical safeguard: it prevents silent coercion of numerics into text, preserves locale- and method-specific qualifiers, and ensures that temporal assertions—here uniformly attached via attr_id INCO-0004 across all four entities—remain queryable as first-class temporal evidence rather than buried in undifferentiated misc fields.

**t_social_enterprise_annual_income**

| id | social_enterprise_annual_income |
| --- | --- |
| INCO-0001 | BrightFuture Learning |
| INCO-0002 | Sustainable Harvest Fund |
| INCO-0003 | Urban Harvest Co-op |
| INCO-0004 | Urban Harvest Co-op |
| INCO-0005 | CleanTech Ventures |
| INCO-0006 | FairTrade Roots |

**t_social_enterprise_annual_income_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INCO-0001 | confidence | xsd:decimal |
| INCO-0002 | dimension_kind | xsd:string |
| INCO-0003 | method | xsd:string |
| INCO-0004 | recorded_at | xsd:dateTime |
| INCO-0005 | uncertainty | xsd:decimal |
| INCO-0006 | unit | xsd:string |
| INCO-0007 | value | xsd:decimal |
| INCO-0008 | encoding | xsd:string |

**t_social_enterprise_annual_income_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0004 | 2024-11-16T11:00:06 |
| INCO-0002 | INCO-0002 | INCO-0004 | 2025-02-04T05:23:06 |
| INCO-0003 | INCO-0003 | INCO-0004 | 2023-12-18T07:36:57 |
| INCO-0004 | INCO-0004 | INCO-0004 | 2024-08-27T04:35:14 |
| INCO-0005 | INCO-0005 | INCO-0004 | 2023-06-07T02:54:49 |
| INCO-0006 | INCO-0006 | INCO-0004 | 2024-06-20T22:31:31 |

**t_social_enterprise_annual_income_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0001 | 0.063 |
| INCO-0002 | INCO-0001 | INCO-0005 | 21.38 |
| INCO-0003 | INCO-0001 | INCO-0007 | 997.65 |
| INCO-0004 | INCO-0002 | INCO-0001 | 0.705 |
| INCO-0005 | INCO-0002 | INCO-0005 | 716.05 |
| INCO-0006 | INCO-0002 | INCO-0007 | 442.00 |
| INCO-0007 | INCO-0003 | INCO-0001 | 0.150 |
| INCO-0008 | INCO-0003 | INCO-0005 | 767.65 |

**t_social_enterprise_annual_income_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0002 | Dimension Kind 01 |
| INCO-0002 | INCO-0001 | INCO-0008 | Encoding 02 |
| INCO-0003 | INCO-0001 | INCO-0009 | change rationale |
| INCO-0004 | INCO-0001 | INCO-0010 | fr |
| INCO-0005 | INCO-0001 | INCO-0003 | automated |
| INCO-0006 | INCO-0001 | INCO-0006 | deg_C |
| INCO-0007 | INCO-0002 | INCO-0002 | Dimension Kind 07 |
| INCO-0008 | INCO-0002 | INCO-0008 | Encoding 08 |

Provenance completes the evidentiary chain by recording not only what was asserted but from which originating structure the assertion was derived. Sourced-from-table references—keyed to SOUR-0006 and SOUR-0008 in the fact layer, with dimensional labels and categories providing interpretive context—make explicit that confidence and uncertainty on derived facts (0.274/648.78, 0.140/899.39, 0.609/885.54, 0.874/289.58 alongside values 608.50, 639.23, 470.53, 720.41) are properties of the sourcing relationship as much as of the underlying measurement. When multiple fact rows point to the same sourced_from_table_key, as three rows do for SOUR-0006, practitioners infer shared extraction or transformation lineage and must apply consistent skepticism or uplift rules across that cohort. Low confidence paired with high uncertainty—as in 0.140 against 899.39—typically triggers manual review, secondary corroboration, or exclusion from certified aggregates; conversely, 0.874 confidence with 289.58 uncertainty may still warrant publication in official disclosures but with explicit qualification. Identifier stability across fact and dimension grains ensures that a reviewer can traverse from a published aggregate back to the entity-level attribute values, forward to the evidentiary claim that justified inclusion, and outward to the source table classification that governed trust parameters at ingestion.

Taken together, these constructs implement a compliance-oriented information architecture in which nothing of governance consequence is anonymous, untyped, or unscoped. Identifiers knit the graph; categories and labels supply policy-relevant semantics; entities ground assertions in real organizational subjects; attributes and their XSD-typed values encode the measurable and narratable particulars; claims and sourced-from-table facts carry the quantitative epistemics that separate certified reporting from provisional analytics; and miscellaneous fields absorb the residual detail that human judgment still requires. Operational maturity shows itself not in the presence of any single column but in the disciplined co-use of confidence and uncertainty, the refusal to collapse provenance into opaque misc strings, and the insistence that the same social enterprise name never substitutes for the entity identifier when evidentiary trails must withstand external scrutiny. Where Urban Harvest Co-op appears twice, where EVEN-0002 supports multiple confidence profiles, and where recorded_at timestamps diverge by more than a year across otherwise comparable entities, the system is doing its work: surfacing ambiguity early so that governance decisions—accept, qualify, restate, or reject—are made on evidence that is explicit, typed, categorized, and traceable rather than inferred after the fact.

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

**fact_table**

| id | sourced_from_table_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SOUR-0001 | SOUR-0008 | 0.274 | 648.78 | 608.50 |
| SOUR-0002 | SOUR-0006 | 0.140 | 899.39 | 639.23 |
| SOUR-0003 | SOUR-0006 | 0.609 | 885.54 | 470.53 |
| SOUR-0004 | SOUR-0006 | 0.874 | 289.58 | 720.41 |