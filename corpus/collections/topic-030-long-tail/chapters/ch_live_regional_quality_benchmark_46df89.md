---
chapter_id: ch_live_regional_quality_benchmark_46df89
topic_id: 30
family: 08_derived
cited_terms: ['regional_quality_benchmark', 'agent_with_role', 'kernelhook_in_kernel_module']
model: engine-refine
---

Agent identifiers serve as the immutable anchors of a governance framework, uniquely binding operational entities to their metadata across dimensional and factual layers. In the agent domain, identifiers such as `ROLE-0001` and `ROLE-0002` resolve through foreign keys to role definitions, while regional identifiers like `BENC-0001` and `BENC-0004` anchor measurement records to their categorical context. Kernel-level hooks carry their own namespace—`MODU-0001` through `MODU-0004`—tying observable behaviors to the modules that implement them. Each identifier is not merely a label but a join key that traverses the boundary between descriptive dimensions and quantitative facts, ensuring that every measurement, version, and license attribution can be traced back to a single authoritative entity.

Agent roles are classified through a two-tier taxonomy: a categorical label and a human-readable designation. The dimension table `dim_agent_role` maps each role identifier to an `agent_role_category` such as `Agent Role Category 01` and an `agent_role_label` like `Agent Role Label 02`, while the fact table `fact_agent` records the operational parameters of each role instance. A single role category can encompass multiple instances with divergent characteristics—`ROLE-0006`, for example, appears in both `ROLE-0002` (version 1, 458,577,289 bytes) and `ROLE-0003` (version 1, 548,859,900 bytes), demonstrating that version and size are instance-level attributes rather than role-level ones. Version numbers range from 1 to 12 across the dataset, and size bytes span two orders of magnitude, from 20,883,723 to 548,859,900, reflecting the heterogeneity of agent deployments within the same categorical grouping.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

Regional measurements are governed by confidence and uncertainty metrics that quantify the reliability of each observation. The fact table `fact_regional` pairs each regional identifier with a `regional_key` that references the dimension table `dim_regional`, where labels such as `Regional Label 01` and categories like `Regional Category 03` provide the semantic context. Confidence values—ranging from 0.036 for `BENC-0001` to 0.818 for `BENC-0003`—indicate the degree of assurance in the associated measurement, while uncertainty values, expressed in absolute terms, span from 253.71 to 762.47. The misc value column holds the measured quantity itself, with entries such as 915.44 and 179.17, and the relationship between confidence and uncertainty is not strictly inverse: `BENC-0003` achieves the highest confidence (0.818) with a moderate uncertainty of 510.50, whereas `BENC-0001` exhibits the lowest confidence (0.036) alongside an uncertainty of 509.32, suggesting that confidence is derived from factors beyond raw variance alone.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

Licensing and geographic location provide the compliance and operational context for kernel-level components. The table `t_kernelhook_in_kernel_module` records which kernel hook—such as `PsSetCreateProcessNotify_Monitor` or `nvlddmkm.sys`—is implemented within which kernel module, including `ntoskrnl.exe`, `kdcom.sys`, and `hal.dll`. Licenses span the permissive spectrum from `CC-BY-4.0` and `MIT` to the copyleft `GPL-3.0`, and locations are expressed as geographic regions including `zone-b`, `us-east-1`, `eu-west-3`, and `ap-south-2`. This combination of license and location enables auditability: a component governed by `GPL-3.0` in `eu-west-3` carries different regulatory obligations than one licensed under `MIT` in `ap-south-2`, and the identifier column ensures that each hook-to-module pairing can be referenced unambiguously in compliance reports.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |