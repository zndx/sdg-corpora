---
chapter_id: ch_live_ice_with_existential_99ba93
topic_id: 19
family: 01_foundation
cited_terms: ['ice_with_existential', 'descriptive_only_about_artifact', 'state_basic']
model: engine-refine
---

In governed information environments, every assertion must be anchored to a durable identifier that survives schema evolution, organizational restructuring, and cross-system exchange without loss of referential integrity. Identifiers such as EXIS-0001 and ARTI-0002 function not merely as surrogate keys within a single repository but as the contractual handles by which policies, audit trails, and downstream analytics rejoin the same logical object across time and jurisdiction. The entity is the bearer of those identifiers in operational practice: it is the thing—whether a batch-processing rule, a metadata schema version, or a provenance trace—that may accumulate typed characteristics, participate in relational graphs, and become the subject of compliance review. When EXIS-0001 is associated with encoding, label_text, and language, each bound through a distinct attribute record, the entity becomes legible to both human stewards and automated validators because its identity is separable from the mutable surface of its descriptive content.

**t_ice_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | encoding | xsd:string |
| EXIS-0002 | label_text | xsd:string |
| EXIS-0003 | language | xsd:string |

**t_ice_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | Encoding 01 |
| EXIS-0002 | EXIS-0001 | EXIS-0002 | audit excerpt |
| EXIS-0003 | EXIS-0001 | EXIS-0003 | de |
| EXIS-0004 | EXIS-0002 | EXIS-0001 | Encoding 04 |
| EXIS-0005 | EXIS-0002 | EXIS-0002 | change rationale |
| EXIS-0006 | EXIS-0002 | EXIS-0003 | de |
| EXIS-0007 | EXIS-0003 | EXIS-0001 | Encoding 07 |
| EXIS-0008 | EXIS-0003 | EXIS-0002 | pre-release note |

Attributes and attribute types supply the interpretive contract under which miscellaneous stored values acquire meaning rather than remaining opaque strings. An attribute name such as encoding or language denotes the semantic role a value is intended to play, while an attribute type—here uniformly xsd:string—prescribes the syntactic and validation regime applicable at ingestion, transformation, and publication. This separation matters because governance frameworks must distinguish permissible variation (a label rendered in de versus another locale) from impermissible corruption (a numeric field masquerading as text). The misc field, in this pattern, carries the instantiated payload: Encoding 01 and audit excerpt are not interchangeable tokens but role-specific realizations whose authority derives from their linkage to entity EXIS-0001 through attribute EXIS-0002, not from the literal characters alone. Stewards therefore treat attr and attr_type as normative metadata, and misc as evidence whose admissibility is conditional on that normative frame.

The about dimension organizes descriptive facts around intentional subjects of discourse, enabling analysts and compliance officers to ask what is being characterized rather than only what number was recorded. A descriptive fact keyed to about_key ARTI-0002 asserts something in reference to the subject labeled About Label 02 and classified under About Category 02, while a parallel fact about ARTI-0005 attaches the same measurement machinery to a different semantic anchor. Category, whether applied to about or to state, performs taxonomic work that the identifier alone cannot: it groups subjects for policy application, reporting boundaries, and risk triage without collapsing distinct individuals into an undifferentiated pool. In mature practice, category is neither decorative labeling nor a substitute for identifier precision; it is the governance layer that determines which controls, retention rules, and evidentiary standards attach to a given class of subject, even when individual instances share superficially similar misc values.

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

State complements about by capturing condition, disposition, or operational posture as an object of measurement in its own right. Where descriptive facts under fact_descriptive articulate properties attributed to about subjects, state facts under fact_state record observations tied to state_key references such as STAT-0004 and STAT-0005, with dimensional labels and state categories providing the interpretive scaffold for State Label 04 within State Category 04. The coexistence of both planes—existential ice elements related, for example, to Laboratory Zone B alongside hydraulic and latency budgets—illustrates how governance models must simultaneously track what something is, what is said about it, and how it is behaving. Provenance Trace Identifier and Sampling Frequency Specification, when related to operational zones and engineering tolerances, exemplify the cross-linking by which existential declarations constrain where and how state and descriptive measurements may be legitimately collected.

**t_ice_with_existential**

| id | ice | related |
| --- | --- | --- |
| EXIS-0001 | Batch Processing Rule | Laboratory Zone B |
| EXIS-0002 | Metadata Schema Version | Hydraulic Pressure Range |
| EXIS-0003 | Provenance Trace Identifier | Network Latency Budget |
| EXIS-0004 | Sampling Frequency Specification | Laboratory Zone B |
| EXIS-0005 | Provenance Trace Identifier | Field Sampling Site |
| EXIS-0006 | Quality Control Checkpoint | Laboratory Zone B |
| EXIS-0007 | Instrument Serial Registry | Ambient Air Temperature |
| EXIS-0008 | Provenance Trace Identifier | ISO 8601 Timestamp |

Confidence and uncertainty jointly qualify every numeric or categorical assertion so that downstream consumers may calibrate reliance, escalation, and remedial action. Confidence scores ranging from 0.012 to 0.854 signal graded belief in the correctness or completeness of associated misc values—0.854 supporting comparatively strong reliance on a descriptive reading of 646.43, whereas 0.209 demands explicit hedging before that same machinery informs enforcement. Uncertainty, expressed in commensurate numeric magnitude (452.69 through 951.90 in the illustrative corpus), provides a complementary or orthogonal gauge of dispersion, ambiguity, or epistemic risk that confidence alone may obscure: a fact may carry middling confidence yet still exhibit high uncertainty, or vice versa, and responsible interpretation requires reading both fields together with the underlying value. Operational guides therefore prescribe that misc never be promoted to authoritative fact without simultaneous evaluation of confidence and uncertainty, and that identifiers, entities, attributes, categories, about and state references remain intact in the audit record so that any later challenge can reconstruct not only what was claimed, but under what typological, taxonomic, and epistemic conditions the claim was advanced.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |