---
chapter_id: ch_live_ebpfprogram_basic_da73a0
topic_id: 111
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_basic', 'policy_authored_by', 'allocation_associated_with_agent']
model: engine-refine
---

In enterprise observability and policy governance architectures, eBPF programs serve as the foundational instrumentation layer, and their lifecycle is tracked through a star-schema arrangement that separates dimensional metadata from quantitative telemetry. The dimension table for eBPF programs carries an **identifier** such as `EBPF-0001` through `EBPF-0004`, alongside a human-readable **misc** label like `Ebpfprogram Label 01` and a **category** classification such as `Ebpfprogram Category 01`. These categorical groupings enable aggregation and filtering across program families, while the fact table anchors each program instance with a composite **identifier** and an **ebpfprogram** key that references the dimension record. The fact table further records the **version** of the program binary — values like `12`, `9`, and `11` appear across the dataset — and the **size_bytes** of the compiled artifact, which ranges from roughly 113 MB for `EBPF-0003` up to 784 MB for `EBPF-0001`. This separation of concerns allows analysts to join lightweight dimension lookups against volumetric fact records without duplicating categorical metadata across every measurement.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Policy authorship introduces a parallel governance dimension, where regulatory frameworks are catalogued alongside their originating bodies and technical constraints. The authored-by relationship table stores policy identifiers such as `AUTH-0001` through `AUTH-0004`, each mapped to a named standard — `AWS IAM Permission Boundary`, `PCI DSS Access Standards`, `ISO 27001 Controls`, and `EU AI Risk Framework` — and attributed to an authoring entity including the `European Commission`, `NIST Computer Security`, and the `Federal Trade Commission`. A boolean **ismandatory** flag distinguishes enforceable controls from advisory guidance: `ISO 27001 Controls` and `EU AI Risk Framework` are marked `true`, whereas `AWS IAM Permission Boundary` and `PCI DSS Access Standards` carry `false`. The **encoding** column records the character set of the policy text, with `latin1` and `ascii` values appearing across the corpus, a detail that matters for downstream text processing and compliance scanning pipelines.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | European Commission | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | NIST Computer Security | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | NIST Computer Security | true | ascii |
| AUTH-0004 | EU AI Risk Framework | Federal Trade Commission | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | Federal Trade Commission | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | AWS Compliance Office | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | SOC 2 Audit Board | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | Federal Trade Commission | false | unicode |

Agent allocation tracking operates through a tripartite structure that models the dynamic association between resource allocations and the systems they serve. The primary allocation table assigns identifiers like `AGEN-0001` through `AGEN-0004` to named resources such as `data-ingest-queue`, `telemetry-ingest-window`, `cloud-vpc-subnet`, and `compute-fleet-reserve`. A companion table records historical associations, mapping each allocation to a prior system context — `helm-release-controller`, `governance-policy-engine`, and `lab-sample-tracker` — thereby preserving an audit trail of reassignment events. The junction table that materializes the many-to-many relationship between allocations and their prior associations carries composite foreign keys: the **subject** column (`allocation_id`) points to the allocation record, while the **target** column (`was_associated_with_id`) references the historical system. A **role** attribute on the junction table — taking values of `observer` or `contributor` — specifies the nature of the association, enabling downstream queries to distinguish passive monitoring relationships from active integration points.

**t_allocation_associated_with_agent**

| id | allocation |
| --- | --- |
| AGEN-0001 | data-ingest-queue |
| AGEN-0002 | telemetry-ingest-window |
| AGEN-0003 | cloud-vpc-subnet |
| AGEN-0004 | compute-fleet-reserve |
| AGEN-0005 | analytics-pipeline-slice |
| AGEN-0006 | prod-cpu-batch |

**t_allocation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | helm-release-controller |
| AGEN-0002 | governance-policy-engine |
| AGEN-0003 | governance-policy-engine |
| AGEN-0004 | lab-sample-tracker |
| AGEN-0005 | helm-release-controller |
| AGEN-0006 | helm-release-controller |

**t_allocation_associated_with_agent__was_associated_with**

| id | allocation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | AGEN-0004 | observer |
| AGEN-0002 | AGEN-0006 | AGEN-0004 | contributor |
| AGEN-0003 | AGEN-0005 | AGEN-0005 | contributor |
| AGEN-0004 | AGEN-0002 | AGEN-0004 | observer |
| AGEN-0005 | AGEN-0003 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0002 | owner |
| AGEN-0008 | AGEN-0002 | AGEN-0001 | owner |