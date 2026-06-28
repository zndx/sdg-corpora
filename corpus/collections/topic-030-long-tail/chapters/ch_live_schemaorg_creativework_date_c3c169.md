---
chapter_id: ch_live_schemaorg_creativework_date_c3c169
topic_id: 30
family: 07_long_tail
cited_terms: ['schemaorg_creativework_date', 'ebpfprogram_writes_to_map', 'kernelhook_in_kernel_module']
model: engine-refine
---

In governed technical inventories, the identifier is the non-negotiable anchor that permits reconciliation across time, jurisdiction, and lineage. Whether the record denotes a Schema.org creative work, an eBPF program, or a kernel-hook binding, the identifier must remain stable while descriptive attributes evolve; entries such as DATE-0001, MAP-0003, and MODU-0002 are not display labels but durable keys that downstream audits, joins, and access-control policies resolve against. Without that constancy, a compliance review cannot determine whether the OAuth 2.0 Guidelines dated 2023-12-01 and the Human Genome Release entries that share a title but carry distinct publication stamps—2022-11-05 versus 2023-04-12—refer to the same intellectual object or to legitimately separate revisions. Identifier discipline therefore precedes every other control: it is what converts a pile of assertions into an accountable registry.

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Quantum Error Correction |
| DATE-0002 | Human Genome Release |
| DATE-0003 | OAuth 2.0 Guidelines |
| DATE-0004 | Human Genome Release |
| DATE-0005 | Human Genome Release |
| DATE-0006 | OpenTelemetry Specification |

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

Category and misc fields partition the registry into operable taxonomies without collapsing heterogeneous assets into a single undifferentiated namespace. Category assigns each writes-to-map artifact to a governed class—Writes To Map Category 01 through Writes To Map Category 04—so that retention rules, review cadence, and escalation paths can vary by asset family rather than by individual row. Misc carries human-legible disambiguation where the category alone would be coarse: Writes To Map Label 03 may sit in the same category as Label 01 yet denote a distinct operational surface whose incident response playbook differs. In practice, auditors treat category as the control plane and misc as the annotation plane; together they prevent over-broad policy application while still permitting fine-grained search and reporting.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

License and location translate technical metadata into enforceable obligations and territorial scope. A kernel-hook record that binds PsSetCreateProcessNotify_Monitor within ntoskrnl.exe under CC-BY-4.0 in zone-b imposes attribution and redistribution constraints distinct from an MIT-licensed nvlddmkm.sys deployment in eu-west-3 or a GPL-3.0 kdcom.sys artifact in us-east-1. Location—whether expressed as a logical zone or a regional endpoint—determines which data-sovereignty regime, export-control checklist, and incident-notification window apply at the moment of deployment or modification. Compliance teams therefore map license terms to location-bound playbooks: the same open-source permissive license does not yield identical operational freedom when the hosting region shifts from ap-south-2 to eu-west-3, because subprocessors, breach-notification clocks, and lawful-access channels change with geography even when the code artifact is byte-identical.

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

Version and size_bytes quantify change velocity and resource footprint for programs that mutate the runtime environment, particularly where eBPF objects write into kernel maps. An entry recording version 12 at 784335640 bytes targeting MAP-0003 signals not merely a build number but a material expansion of in-kernel attack surface relative to a version-9 program of 641704069 bytes writing to MAP-0005. Governance frameworks treat monotonic or divergent version lines as evidence of patch cadence, while size thresholds trigger additional review—large map-writing binaries may imply broader map key enumeration, expanded helper complexity, or embedded data sections that affect memory accounting. Pairing version with writes_to_map linkage makes the audit trail directional: the program is not an abstract binary but an actor that asserts write authority over a classified map destination, and both the program’s revision and its byte weight must be evaluated in that relational context.

Subject, target, and role formalize how independent entities associate without denormalizing their authoritative attributes. In provenance graphs for creative works, a subject identifier such as DATE-0006 may relate to a target publication stamp DATE-0004 under role owner, while another association pairs the same subject with DATE-0001 under contributor, and a separate subject DATE-0005 may attach to DATE-0002 as observer. The role is not decorative metadata; it encodes permission semantics, attribution duty, and evidentiary weight—owners bear accountability for publication integrity, contributors assume partial responsibility for content accuracy, and observers may access without mutation rights. Subject-target edges thereby become the compositional layer on which lineage queries run: Quantum Error Correction linked as owner to one date and Human Genome Release linked as contributor or observer to others yields a multi-party publication history that flat tables cannot express without integrity loss.

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

Writes_to_map completes the chain from classified map inventory to concrete program behavior, and it is the field most directly tied to runtime authorization. Dimension records name and categorize each map endpoint—MAP-0001 through MAP-0004 with their paired labels and categories—while fact rows bind executing programs to the specific map keys they may populate, as when MAP-0001 writes to MAP-0003 at version 11 with a footprint of 113209263 bytes. Operational guides require that every writes_to_map reference resolve to a dimension entry before promotion: an unclassified or orphaned map key is a policy violation because it bypasses the category-based controls established upstream. In incident review, investigators traverse identifier to writes_to_map to category to license to location, reconstructing not only what executed but under which legal, geographic, and relational constraints it was permitted to do so—exactly the closed loop that identifier-first governance is designed to guarantee.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |