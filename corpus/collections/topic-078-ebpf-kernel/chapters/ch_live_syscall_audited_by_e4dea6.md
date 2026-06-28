---
chapter_id: ch_live_syscall_audited_by_e4dea6
topic_id: 78
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by', 'attribute_set_subclass', 'soc2_processing_integrity']
model: engine-refine
---

Attribute records in compliance and governance systems are anchored by stable identifiers—SET-0001 through SET-0004, for instance—that serve as immutable keys across analytical and reporting layers. Each identifier maps to a human-readable label such as Attribute Label 01 and is classified within a categorical taxonomy, Attribute Category 01 through Attribute Category 04, enabling aggregation, filtering, and cross-referencing without ambiguity. The attribute key itself, whether SET-0003 or SET-0005, denotes the semantic meaning of the measurement, while the associated value—ranging from 100.75 to 779.52 in observed records—represents the quantitative or qualitative datum under assessment. This separation of identity, classification, and measured content is a structural necessity: it permits the same attribute to be evaluated repeatedly across time, systems, and organizational boundaries while preserving traceability to its original definition.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

Every measured value carries two companion metrics that quantify its reliability: confidence and uncertainty. Confidence, expressed as a decimal between zero and one, indicates the degree of assurance in the measurement—0.926 for SET-0001, for example, signals a high-confidence observation, whereas 0.123 for SET-0003 reflects substantial doubt. Uncertainty, reported on an absolute scale, provides the complementary margin of error; values such as 274.08 and 957.49 quantify the dispersion expected around the recorded value. Together, these paired measures allow downstream consumers to weight evidence appropriately, flag low-confidence records for review, and maintain audit trails that distinguish between measured reality and inferred approximation. In regulatory contexts, the absence of both confidence and uncertainty is itself a finding: unquantified data cannot be trusted for compliance assertions.

The format and language dimensions govern how data is encoded and localized for consumption. Format designations—JSON, UUID, CSV—specify the structural representation of the datum, determining parsing behavior, schema validation, and interoperability with downstream systems. Language codes such as fr, en, and ja indicate the linguistic context of the record, ensuring that human-readable outputs, audit reports, and regulatory filings are rendered in the appropriate locale. These metadata attributes are not decorative; they are enforcement mechanisms. A syscall audit record referencing execve in JSON with English locale will be processed and routed differently than one carrying epoll_ctl in CSV with a Japanese locale, and conflating the two introduces parsing failures, localization errors, and compliance gaps.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |

Role, subject, and target constitute the relational scaffolding that binds entities within a governance framework. In the SOC 2 processing integrity domain, for instance, a record links a subject—such as INTE-0006, representing an entity like GlobalPay Systems or Nexus Cloud Services—to a target domain, such as INTE-0005 or INTE-0003, which may correspond to user provisioning or report generation. The role assigned to that linkage—owner, reviewer, or observer—defines the accountability structure: the owner bears responsibility for the integrity of the control, the reviewer validates its operation, and the observer monitors without authority. This triad ensures that every compliance assertion can be traced to a responsible party, a controlled process, and a defined scope, forming the backbone of auditability and regulatory defensibility.

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |