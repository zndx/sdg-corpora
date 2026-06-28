---
chapter_id: ch_live_control_only_addresses_threat_class_182aa0
topic_id: 1
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'policy_authored_by', 'attestation_about_compliance_claim']
model: engine-refine
---

Attestation frameworks require a disciplined architecture for binding controls to threats, enriching those bindings with typed attributes, and recording the confidence with which each linkage is asserted. The control-to-threat mapping is established through identifiers such as THRE-0001 through THRE-0004, each associated with a specific control—Multi-Factor Authentication, Incident Response Plan, Access Review Policy—and each addressing a discrete risk, for example AUTH-0002, AUTH-0003, AUTH-0005, or AUTH-0006. This mapping is not merely catalogic; it is the structural backbone that allows an organization to trace a control back to the threat it mitigates and forward to the attributes that qualify its applicability. The entity that authors or owns a control is recorded separately in a policy registry, where policies such as AWS IAM Permission Boundary, PCI DSS Access Standards, ISO 27001 Controls, and EU AI Risk Framework are attributed to entities identified as THRE-0002, THRE-0005, or THRE-0008, and flagged as mandatory or non-mandatory according to the governing standard's requirements.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | AUTH-0002 |
| THRE-0002 | Incident Response Plan | AUTH-0005 |
| THRE-0003 | Incident Response Plan | AUTH-0006 |
| THRE-0004 | Access Review Policy | AUTH-0003 |
| THRE-0005 | Backup Retention Schedule | AUTH-0005 |
| THRE-0006 | Backup Retention Schedule | AUTH-0007 |
| THRE-0007 | Access Review Policy | AUTH-0004 |
| THRE-0008 | Incident Response Plan | AUTH-0003 |

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

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |

Attributes provide the dimensional detail that transforms a bare control-to-threat linkage into a fully qualified governance artifact. Each attribute is defined by a name—effective_date, enforcement, mandatory, priority—and a type drawn from the XML Schema definition space: xsd:date, xsd:string, xsd:boolean, xsd:integer. The type system enforces value discipline across the repository. Boolean attributes carry values of true or false, as seen when entity THRE-0001 is evaluated against attribute THRE-0003 and returns true, while entity THRE-0002 under the same attribute returns false. Date attributes encode effective dates such as 2024-12-09, 2024-12-21, 2025-01-04, and 2023-01-13, anchoring controls to temporal validity windows. Integer attributes capture quantitative measures—values of 5, 99, and 926 appear in the priority dimension—while string attributes hold free-form or coded text, including values like Encoding 01, Enforcement 02, change rationale, and the two-character code fr. This typed attribute model ensures that every control enrichment is machine-readable and semantically unambiguous.

The encoding of policy documents and the mandatory nature of their requirements introduce a second layer of governance metadata. Policies authored by distinct entities carry character encodings—latin1 for AWS IAM Permission Boundary, PCI DSS Access Standards, and EU AI Risk Framework, and ascii for ISO 27001 Controls—reflecting the technical constraints of the source systems from which the policy texts originate. The mandatory flag distinguishes between controls that are non-negotiable obligations and those that are advisory or optional; ISO 27001 Controls and EU AI Risk Framework are marked mandatory, whereas AWS IAM Permission Boundary and PCI DSS Access Standards are not. This distinction is critical for compliance auditors who must separate regulatory imperatives from organizational best practices, and it directly informs the weighting of evidence during an attestation review.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | THRE-0008 | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | THRE-0005 | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | THRE-0002 | true | ascii |
| AUTH-0004 | EU AI Risk Framework | THRE-0002 | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | THRE-0001 | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | THRE-0005 | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | THRE-0005 | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | THRE-0007 | false | unicode |

Attestation records operationalize the confidence and uncertainty associated with each asserted control-to-threat linkage. Each attestation is identified by a key such as CLAI-0001 through CLAI-0004 and classified into a category—Attestation Category 01 through Attestation Category 04—providing a high-level taxonomy for grouping related assertions. The confidence score quantifies the degree of certainty in the attestation, ranging from 0.051 for a highly uncertain claim to 0.987 for a near-certain one, with intermediate values of 0.482 and 0.840 representing moderate and strong confidence respectively. Uncertainty is expressed as an absolute measure—91.51, 606.80, 859.08, and 986.76—providing a complementary view that captures the magnitude of residual risk rather than its inverse. The attestation value, ranging from 16.44 to 571.54, represents the computed evidence weight or risk score underlying the assertion. Together, confidence, uncertainty, and value form a triad that allows auditors to distinguish between well-supported claims and those requiring further investigation.