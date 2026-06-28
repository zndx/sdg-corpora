---
chapter_id: ch_live_evidence_correlated_with_99aaed
topic_id: 117
family: 07_long_tail
cited_terms: ['evidence_correlated_with', 'cardinality_max_one_generic', 'attestation_with_supporting_evidence']
model: engine-refine
---

Evidence Correlated With

In compliance and attestation frameworks, the integrity of a claim rests not on the declaration alone but on the structured chain of supporting evidence that can be independently verified. An attestation—whether a SOC 2 Compliance Review, a Data Provenance Statement, or a Patient Consent Declaration—functions as a formal assertion whose validity is contingent upon the evidentiary artifacts that underpin it. These artifacts are not merely appended; they are governed by cardinality constraints that dictate the nature of the relationship between assertion and proof. A cardinality of mandatory_one or strict_unique ensures that certain attestations require exactly one or a single unambiguous piece of supporting evidence, while constraints such as singular_ref or first_match permit more flexible mappings. The attestation identified as EVID-0001, for instance, is linked to the cardinality rule GENE-0001, which itself references the evidence item EVID-0001, establishing a self-referential loop that enforces internal consistency within the evidence graph.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | EVID-0006 |
| GENE-0002 | strict_unique | EVID-0001 |
| GENE-0003 | singular_ref | EVID-0002 |
| GENE-0004 | first_match | EVID-0003 |
| GENE-0005 | optional_one | EVID-0005 |
| GENE-0006 | mandatory_one | EVID-0005 |

The dimension of evidence correlation introduces a categorical taxonomy that classifies each supporting artifact by type. The table dim_evidence_correlated_with assigns labels such as Evidence Correlated With Label 01 through 04 to distinct identifiers, while simultaneously categorizing them under Evidence Correlated With Category 01 through 04. This dual-layer classification—label for human readability, category for machine processing—enables both auditors and automated systems to reason about the nature of the evidence. When a fact record in fact_evidence references evidence_correlated_with_key values like WITH-0005 or WITH-0003, it is not merely pointing to a row; it is asserting that the measured value, whether 192.81 or 641.37, is substantiated by evidence belonging to a specific category. The identifier WITH-0001, for example, serves as the primary key in the dimension table and as a foreign key in the fact table, creating a join path that transforms a numeric measurement into a classified, auditable claim.

**dim_evidence_correlated_with**

| id | evidence_correlated_with_label | evidence_correlated_with_category |
| --- | --- | --- |
| WITH-0001 | Evidence Correlated With Label 01 | Evidence Correlated With Category 01 |
| WITH-0002 | Evidence Correlated With Label 02 | Evidence Correlated With Category 02 |
| WITH-0003 | Evidence Correlated With Label 03 | Evidence Correlated With Category 03 |
| WITH-0004 | Evidence Correlated With Label 04 | Evidence Correlated With Category 04 |
| WITH-0005 | Evidence Correlated With Label 05 | Evidence Correlated With Category 05 |
| WITH-0006 | Evidence Correlated With Label 06 | Evidence Correlated With Category 06 |
| WITH-0007 | Evidence Correlated With Label 07 | Evidence Correlated With Category 07 |

Confidence and uncertainty constitute the quantitative backbone of evidentiary assessment. Confidence values—ranging from 0.052 for identifier WITH-0001 to 0.474 for WITH-0003—express the degree of assurance that the supporting evidence genuinely validates the attestation. These are not binary flags but continuous measures, allowing for nuanced risk evaluation. Uncertainty, measured on a different scale with values such as 125.66, 477.82, 366.82, and 430.96, captures the margin of error or variability inherent in the evidence itself. The inverse relationship between confidence and uncertainty is not strictly mathematical but conceptual: higher confidence typically corresponds to lower uncertainty, though the two dimensions are tracked independently to preserve granularity. An attestation supported by evidence with a confidence of 0.052 and an uncertainty of 125.66 signals a weak evidentiary link, one that may trigger additional review or remediation, whereas a confidence of 0.474 paired with an uncertainty of 366.82 suggests a stronger, albeit still imprecise, foundation.

The lifecycle of an attestation is structured through phases—initiation, execution, review, and closeout—that map the temporal progression from claim formulation to final validation. Each attestation record carries a phase designation that indicates its current state: EVID-0001 resides in initiation, EVID-0002 in execution, EVID-0003 in review, and EVID-0004 in closeout. This phased model ensures that attestations are not static declarations but dynamic artifacts that evolve through a controlled process. The transition between phases is governed by a trigger mechanism, captured in the triggered_by column, which records whether the transition was initiated by an event—such as the submission of a compliance document—or by an API call, as with EVID-0003 and EVID-0004. Event-driven triggers tend to reflect human actions or external system notifications, while API-driven triggers indicate automated workflows, enabling organizations to distinguish between manual and programmatic attestation lifecycles.

The misc column, represented by the value field in fact_evidence, provides an additional layer of metadata that does not fit neatly into the categorical or quantitative dimensions. Values such as 84.19, 8.37, and 641.37 may represent auxiliary measurements, contextual annotations, or derived scores that supplement the primary confidence and uncertainty metrics. These values are not classified by category and do not carry their own identifiers beyond the fact record's primary key, yet they contribute to the overall evidentiary profile. The interplay between misc values and the structured dimensions—category, confidence, uncertainty—creates a multi-faceted representation of evidence quality that supports both granular analysis and high-level compliance reporting. Together, these elements form a coherent framework in which every attestation is traceable to its supporting evidence, quantified by confidence and uncertainty, classified by category, and situated within a phased lifecycle governed by explicit triggers.

**fact_evidence**

| id | evidence_correlated_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0005 | 0.052 | 125.66 | 192.81 |
| WITH-0002 | WITH-0003 | 0.146 | 477.82 | 84.19 |
| WITH-0003 | WITH-0006 | 0.474 | 366.82 | 641.37 |
| WITH-0004 | WITH-0002 | 0.138 | 430.96 | 8.37 |

**t_attestation_with_supporting_evidence**

| id | attestation | with_supporting_evidence | phase | triggered_by |
| --- | --- | --- | --- | --- |
| EVID-0001 | SOC2 Compliance Review | GENE-0001 | initiation | event |
| EVID-0002 | Data Provenance Statement | GENE-0002 | execution | event |
| EVID-0003 | Patient Consent Declaration | GENE-0005 | review | api |
| EVID-0004 | Data Provenance Statement | GENE-0004 | closeout | api |
| EVID-0005 | Sensor Calibration Record | GENE-0001 | initiation | manual |
| EVID-0006 | Sensor Calibration Record | GENE-0005 | execution | schedule |