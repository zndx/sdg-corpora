---
chapter_id: ch_live_trace_with_root_span_a6f448
topic_id: 46
family: 07_long_tail
cited_terms: ['trace_with_root_span', 'sample_subclass', 'policy_min_one_enforcer']
model: engine-refine
---

In distributed tracing architectures, each execution is captured as a trace record identified by a unique identifier such as `SPAN-0001` or `SPAN-0004`, with every trace anchored to a root span that represents the top-level operation in a call hierarchy. The `fact_trace` table stores these granular measurements, recording the `size_bytes` consumed by each trace—values ranging from roughly 70 MB for `SPAN-0003` to nearly 954 MB for `SPAN-0004`—alongside a `version` number that tracks schema or instrumentation revisions, with observed versions including 4, 8, and 12. Each trace references its parent root span through the `root_span_key` column, which points to a corresponding entry in the `dim_root_span` dimension table. That dimension table classifies root spans by a human-readable `root_span_label` (for instance, `Root Span Label 01`) and assigns them to a `root_span_category` such as `Root Span Category 02`, enabling aggregation and filtering of traces by operational domain.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

Beyond trace telemetry, the system tracks physical and logical samples through the `t_sample_subclass` table, where each sample carries a distinct `identifier`—for example, `gid://svc/77` for environment water samples or `doi:10.1109/x` for a reference-cited sediment sample—and is associated with a `location` indicating where it was collected, whether a cloud region like `us-east-1`, a hardware rack designated `rack-7`, an on-premises data center (`on-prem-dc1`), or a geographic region such as `ap-south-2`. The `sample` column itself holds descriptive codes like `ENV-WATER-7B` or `TRACE-CACHE-5`, while the `collected_from` field links each sample back to a policy enforcer, establishing a chain of custody between the physical or logical artifact and the governance framework under which it was gathered.

**t_sample_subclass**

| id | sample | collected_from | identifier | location |
| --- | --- | --- | --- | --- |
| SAMP-0001 | ENV-WATER-7B | ENFO-0002 | gid://svc/77 | us-east-1 |
| SAMP-0002 | TELEMETRY-PKG-9 | ENFO-0002 | gid://svc/77 | rack-7 |
| SAMP-0003 | TRACE-CACHE-5 | ENFO-0004 | ref-8842 | on-prem-dc1 |
| SAMP-0004 | SEDIMENT-LAKE-9 | ENFO-0003 | doi:10.1109/x | ap-south-2 |
| SAMP-0005 | TELEMETRY-PKG-9 | ENFO-0004 | ref-8842 | on-prem-dc1 |

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

Policy enforcement is modeled through two interrelated tables. The `t_policy_min_one_enforcer` table enumerates the regulatory frameworks themselves—`SOC 2 Type II Controls`, `ISO 13485 QMS`, `GDPR Compliance Framework`, and `EU AI Act Risk Management`—each assigned an identifier such as `ENFO-0001` through `ENFO-0004`. The companion table `t_policy_min_one_enforcer_enforced_by` lists the organizational bodies responsible for upholding those policies, including the `Regulatory Affairs Division`, the `Compliance Audit Board`, the `Privacy Officer`, and the `Data Stewardship Council`. The bridge table `t_policy_min_one_enforcer__enforced_by` connects policies to enforcers, using `subject` to reference the policy identifier and `target` to reference the enforcer identifier, while the `role` column specifies the nature of the relationship—whether an enforcer acts as an `owner`, `contributor`, or `observer` of a given policy.

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |

The foreign-key relationships between these tables form a coherent governance graph. Traces in `fact_trace` point to root spans in `dim_root_span` via `root_span_key`, allowing analysts to drill from individual operation-level measurements up to categorized, labeled aggregate views. Samples in `t_sample_subclass` reference policy enforcers through `collected_from`, which in turn maps to the `t_policy_min_one_enforcer` table, thereby anchoring every collected sample to a regulatory framework. The junction table `t_policy_min_one_enforcer__enforced_by` then clarifies which organizational body enforces which policy and in what capacity, with the `subject` and `target` columns serving as the foreign keys that bind policies to their responsible parties. Together, these relationships ensure that every trace, sample, and policy decision can be traced back to its governing framework and accountable entity.