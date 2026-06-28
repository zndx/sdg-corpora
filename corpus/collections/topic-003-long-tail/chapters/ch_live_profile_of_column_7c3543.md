---
chapter_id: ch_live_profile_of_column_7c3543
topic_id: 3
family: 02_observation_measurement
cited_terms: ['profile_of_column', 'agent_identified_by_uri', 'conjunctive_combination']
model: engine-refine
---

In governed knowledge systems, every assertion must be anchored to a stable identifier that survives renaming, migration, and cross-system reconciliation. Identifiers operate at two complementary levels: surrogate keys that index rows within a registry (such as COLU-0001 or COMB-0003) and external, scheme-qualified names that agents publish for downstream consumption. The agent-identification layer records how autonomous or semi-autonomous actors—weather-station-alpha, compliance-audit-bot, genomics-lab-director, edge-device-gateway—materialize those names through resolvable URIs (ark:/13030/n8yy3r, urn:isbn:978316148) while retaining human- or policy-facing aliases (ref-8842, ARN:res/41, urn:uuid:9f2a). Ownership closes the accountability loop: when ml-infra registers both genomics-lab-director and edge-device-gateway, or when data-engineering owns weather-station-alpha, stewards know whom to contact for provenance disputes, access reviews, and correction workflows. Without identifier discipline and explicit owner assignment, confidence scores and categorical labels cannot be traced to an accountable source, and composite judgments lose their audit chain.

The about dimension supplies semantic grounding for profile facts by binding each measured attribute to a defined subject entity rather than to an anonymous numeric row. A fact keyed COLU-0002 with about_key COLU-0002 states something *about* the entity whose registry entry carries About Label 02 under About Category 02; conversely, COLU-0003's about_key COLU-0001 redirects the measurement to a different subject (About Label 01, About Category 01), illustrating that the fact's own identifier and its about reference are deliberately separable. Category, in this architecture, is not decorative metadata but a governance partition: About Category 01 through About Category 04 stratify subjects for policy application, reporting roll-ups, and risk-tiered retention. Labels furnish the misc layer—human-readable descriptors that sit alongside machine keys—so operators can interpret registry content without decoding surrogate identifiers alone. In practice, category constrains which controls apply, while about linkage ensures that confidence-bearing measurements attach to the correct conceptual object rather than to a container or ingestion artifact.

**fact_profile**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0002 | 0.299 | 284.36 | 728.94 |
| COLU-0002 | COLU-0002 | 0.994 | 557.92 | 380.57 |
| COLU-0003 | COLU-0001 | 0.773 | 622.09 | 607.36 |
| COLU-0004 | COLU-0006 | 0.226 | 488.10 | 448.09 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| COLU-0001 | About Label 01 | About Category 01 |
| COLU-0002 | About Label 02 | About Category 02 |
| COLU-0003 | About Label 03 | About Category 03 |
| COLU-0004 | About Label 04 | About Category 04 |
| COLU-0005 | About Label 05 | About Category 05 |
| COLU-0006 | About Label 06 | About Category 06 |

Confidence and uncertainty form a paired epistemic record on every quantitative fact, encoding complementary views of reliability that compliance reviewers must read together rather than in isolation. Profile facts exhibit wide dispersion: COLU-0002 registers confidence 0.994 against uncertainty 557.92, signaling a high-trust measurement that nonetheless carries substantial magnitude risk in the misc value field (380.57), whereas COLU-0004's confidence 0.226 paired with uncertainty 488.10 flags a low-trust assertion that should be suppressed from automated decisioning pending human validation. Treating confidence as a unit-interval belief and uncertainty as a separate scale (here ranging roughly 284–622 on profiles, and higher on conjunctive composites up to 898.42) prevents the common failure mode of ranking records by a single scalar. Governance frameworks therefore prescribe dual thresholds—minimum confidence for publication and maximum uncertainty for operational use—and require that misc values (728.94, 607.36, 448.09, and similar) never be interpreted without their epistemic envelope.

Conjunctive combination extends single-subject profiling into logically compounded claims: a conjunctively_combines_key expresses that a composite fact holds only when its referenced combination definition is satisfied, mirroring Boolean AND semantics in policy engines and risk models. Dimension entries (Conjunctively Combines Label 01–04 mapped to Conjunctively Combines Category 01–04) classify each combination template for scope and applicability, while fact rows such as COMB-0001 and COMB-0002 both pointing at conjunctively_combines_key COMB-0004 show how multiple observed composites can instantiate the same definitional pattern. The epistemic profile of conjunctive facts diverges sharply from atomic profiles: COMB-0002's confidence 0.045 against uncertainty 898.42 marks a near-failed conjunction whose misc value 791.51 must not propagate, while COMB-0004 at confidence 0.799 and uncertainty 785.73 with value 980.44 represents a strong composite suitable for tier-one automation subject to owner review. Reference cycles among keys (COMB-0003 referencing COMB-0006, COMB-0004 referencing COMB-0003) demand acyclicity checks in deployment, lest evaluation order become undefined.

**fact_conjunctive**

| id | conjunctively_combines_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.738 | 736.08 | 793.45 |
| COMB-0002 | COMB-0004 | 0.045 | 898.42 | 791.51 |
| COMB-0003 | COMB-0006 | 0.764 | 666.33 | 598.69 |
| COMB-0004 | COMB-0003 | 0.799 | 785.73 | 980.44 |
| COMB-0005 | COMB-0006 | 0.312 | 470.05 | 427.17 |
| COMB-0006 | COMB-0003 | 0.643 | 227.57 | 137.91 |
| COMB-0007 | COMB-0004 | 0.630 | 30.12 | 467.22 |

**dim_conjunctively_combines**

| id | conjunctively_combines_label | conjunctively_combines_category |
| --- | --- | --- |
| COMB-0001 | Conjunctively Combines Label 01 | Conjunctively Combines Category 01 |
| COMB-0002 | Conjunctively Combines Label 02 | Conjunctively Combines Category 02 |
| COMB-0003 | Conjunctively Combines Label 03 | Conjunctively Combines Category 03 |
| COMB-0004 | Conjunctively Combines Label 04 | Conjunctively Combines Category 04 |
| COMB-0005 | Conjunctively Combines Label 05 | Conjunctively Combines Category 05 |
| COMB-0006 | Conjunctively Combines Label 06 | Conjunctively Combines Category 06 |

Operationally, these constructs interlock in a single evidentiary chain: agents identified by URI and owned by infrastructure teams emit facts about categorized subjects, each carrying confidence, uncertainty, and misc measurements, while conjunctive layers aggregate atomic assertions under labeled, categorized combination rules. A compliance auditor reconciling COLU-0001 (about COLU-0002, moderate confidence 0.299) against URI-0002's compliance-audit-bot provenance would weigh whether the low confidence reflects sensor drift or policy mismatch before accepting the misc value 728.94 into a regulatory report. Likewise, stewards under ml-infra must ensure that duplicate external identifiers (two rows sharing ARN:res/41 or urn:isbn:978316148) are either legitimately multi-typed aliases or flagged collisions. The misc fields—values, labels, and descriptive text—carry the payload that decisions consume, but their legitimacy rests entirely on identifier stability, about/category correctness, conjunctive soundness, owner accountability, and the joint interpretation of confidence with uncertainty; neglecting any element converts a structured governance registry into an unverifiable data lake.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |