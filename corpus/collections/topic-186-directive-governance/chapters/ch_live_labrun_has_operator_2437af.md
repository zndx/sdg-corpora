---
chapter_id: ch_live_labrun_has_operator_2437af
topic_id: 186
family: 02_observation_measurement
cited_terms: ['labrun_has_operator', 'ontology_class_match', 'equiv_union_ice_branches']
model: engine-refine
---

Operational execution and semantic classification both depend on a shared infrastructure of identifiers, categories, and quality signals that enable traceability across heterogeneous data sources. Every record carries a unique identifier—such as `OPER-0001` for an operator run or `MATC-0001` for an ontology match—that serves as the primary key for cross-referencing between fact and dimension tables. These identifiers are not arbitrary; they encode the entity type and sequence, allowing an operator run record to be joined to its descriptive dimension, or an ontology match to be resolved against its class definition. Alongside identification, categorical classification provides the organizational backbone: operators are grouped under labels like `Operator Label 01` and categories such as `Operator Category 01`, while ontology classes carry their own parallel taxonomy with labels like `Matches Ontology Class Label 01` and categories like `Matches Ontology Class Category 01`. This dual-layer structure—label for human readability, category for analytical grouping—ensures that both end users and automated systems can navigate the data consistently.

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

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

Confidence and uncertainty form the quality axis of semantic matching, quantifying how reliably a system has classified or mapped an entity to its ontology class. Confidence scores range from 0 to 1, with values such as `0.829` indicating strong agreement and `0.272` signaling considerable doubt about the correctness of the match. Uncertainty, measured on an absolute scale, complements this by expressing the magnitude of residual ambiguity—values like `27.88` suggest a tight, reliable classification, whereas `688.77` reflects substantial variance in the model's output. These two metrics are not redundant; confidence captures the system's self-assessed correctness, while uncertainty quantifies the spread of possible outcomes. In practice, a match with confidence `0.796` and uncertainty `236.57` would be treated as moderately reliable, whereas a match with confidence `0.584` and uncertainty `688.77` would warrant manual review or additional validation before downstream use.

The operational dimension of execution—captured through duration, exit codes, and retry counts—provides the performance and reliability context that semantic quality alone cannot supply. Each operator run is timed in seconds, with durations such as `4856.18` and `5155.73` representing runs that exceeded an hour, while shorter runs like `4308.22` completed in roughly seventy minutes. Exit codes communicate the outcome of each run: a value of `3` typically indicates a clean, controlled termination, whereas codes like `122`, `691`, and `566` signal various failure modes that require investigation. The retry count—ranging from a modest `12` retries to an extreme `265`—reveals the resilience demands placed on each operator; a run that required 265 retries before completing is fundamentally different in its operational profile from one that succeeded on the first attempt. Together, these metrics allow operators to be benchmarked not only by what they produce but by how efficiently and reliably they produce it.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

Multilingual branch definitions extend the taxonomy into cross-lingual equivalence, enabling the same conceptual entity to be referenced across different languages and domains. Each branch record carries an identifier such as `BRAN-0001`, an equivalence target like `Calibration_Offset` or `Equipment_Model`, a human-readable label such as `calibration record` or `intake form`, and a language code—`fr`, `es`, or `de`—that specifies the linguistic context. This structure supports internationalization by allowing a single conceptual branch to have multiple language-specific labels while maintaining a stable equivalence reference. For instance, the equivalence `Calibration_Offset` appears with the label `calibration record` in both French and Spanish contexts, while `Quality_Score` is associated with the label `intake form` in German. The language field ensures that downstream systems can resolve the correct label for a given locale, while the equivalence field preserves the semantic link across translations.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |