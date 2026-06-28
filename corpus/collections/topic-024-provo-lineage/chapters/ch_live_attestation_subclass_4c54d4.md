---
chapter_id: ch_live_attestation_subclass_4c54d4
topic_id: 24
family: 03_directive_governance
cited_terms: ['attestation_subclass', 'agent_at_organization', 'ebpfprogram_writes_to_map_xref']
model: engine-refine
---

Attestation governance rests on the disciplined separation of what is being asserted from the typed evidence that substantiates it. An attestation instance—whether it records SOC2-TypeII control coverage, a VulnerabilityScan-Q3 result, SecureBoot-Enabled posture, or TPM-Attestation binding—functions as an entity in the operational sense: a durable object to which auditors, automation, and policy engines attach facts over time. Each entity receives a stable identifier (for example ATTE-0001) so that heterogeneous measurements collected across hosts, runs, and review cycles can be correlated without collapsing distinct attestations into a single undifferentiated record. The identifier is not decorative metadata; it is the join key that preserves lineage when the same attribute name appears on different entities or when one entity accumulates multiple observations of the same attribute class across repeated executions.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SOC2-TypeII |
| ATTE-0002 | VulnerabilityScan-Q3 |
| ATTE-0003 | SecureBoot-Enabled |
| ATTE-0004 | TPM-Attestation |
| ATTE-0005 | GitOps-Deployment |
| ATTE-0006 | AccessControlReview |
| ATTE-0007 | ThirdPartyVendorRisk |

**t_attestation_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

Attributes and attribute types constitute the contract layer between raw observability and defensible compliance statements. An attribute names the semantic slot—duration_seconds, end_time, exit_code, host_name—while attr_type declares the interpretive grammar under which values must be stored and validated. Binding duration_seconds to xsd:decimal, end_time to xsd:dateTime, exit_code to xsd:integer, and host_name to xsd:string enforces type-safe persistence: a decimal duration of 1293.13 seconds on ATTE-0001 cannot be silently coerced into an integer exit code of 806 on the same entity without breaking audit reconstruction. In practice, attr_type governs which value store receives a given misc payload, routing temporal facts such as 2025-01-08T20:38:13 and 2024-04-06T01:35:21 into datetime semantics, numeric magnitudes such as 4975.39 and 778.44 into decimal semantics, discrete status codes 806, 470, 695, and 409 into integer semantics, and lexical tokens gw-12, Log Level 02, review, and superseded into string semantics. The misc designation for stored values signals that the payload is evidence-bearing content whose meaning is entirely determined by the paired attr and attr_type, not by the storage column name itself.

Entity–attribute binding is where governance becomes operational rather than declarative. The same attr_id may appear against multiple entity_id values—end_time observations tied both to ATTE-0001 and ATTE-0002, exit_code readings recorded twice under ATTE-0002—demonstrating that attributes are reusable measurement templates while entities remain the scoped subjects of attestation. Conversely, a single entity may host many attributes simultaneously: ATTE-0001 carries datetime boundaries, decimal duration, integer exit status, and varchar host identity in parallel, yielding a composite evidentiary profile suitable for pass/fail adjudication, SLA measurement, or forensic replay. Reviewers therefore reason across typed facts anchored to one identifier, not across an undifferentiated event stream.

**t_attestation_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2025-01-08T20:38:13 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2024-01-27T20:47:31 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2024-07-24T11:57:07 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2024-04-06T01:35:21 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-02-15T00:38:24 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2023-06-05T10:05:45 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2024-06-10T20:49:48 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2023-08-11T12:49:10 |

**t_attestation_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 1293.13 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 215.34 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 4975.39 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 778.44 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5119.03 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 3990.60 |
| ATTE-0007 | ATTE-0007 | ATTE-0001 | 1452.26 |

**t_attestation_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | gw-12 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | review |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | edge-03 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | closeout |

Organizational placement and ownership introduce accountability dimensions that sit alongside technical evidence. Agent registrations—backup-scheduler under data-governance, cert-manager under security-ops, risk-assessor instances under cloud-infrastructure and quality-assurance—are stamped with createddate values such as 2023-09-23 and 2025-01-23 that establish when a capability entered the governed estate. Owner assignments (ml-infra, analytics, sre) designate the operational authority responsible for continuity, remediation, and attestation freshness; without owner, an agent may execute correctly yet remain outside enforceable responsibility chains. Createddate and owner together answer not only what was measured but who stood behind the measuring instrument at the time the record entered the corpus.

**t_agent_at_organization**

| id | agent | at_organization | created_date | owner |
| --- | --- | --- | --- | --- |
| ORGA-0001 | backup-scheduler | data-governance | 2025-01-04 | ml-infra |
| ORGA-0002 | cert-manager | security-ops | 2023-09-23 | analytics |
| ORGA-0003 | risk-assessor | cloud-infrastructure | 2024-03-21 | ml-infra |
| ORGA-0004 | risk-assessor | quality-assurance | 2025-01-23 | sre |
| ORGA-0005 | risk-assessor | network-operations | 2024-08-08 | analytics |
| ORGA-0006 | pipeline-runner | infrastructure-security | 2024-08-22 | platform-team |

eBPF program inventory extends the same evidentiary discipline into kernel-level instrumentation, where program identity, categorical classification, binary footprint, and revision history must remain reconcilable under change. The ebpfprogram key links factual measurements in the program fact store to dimensional labels and category assignments—Ebpfprogram Category 01 through Ebpfprogram Category 04—so that runtime artifacts can be reported by control family rather than by opaque binary hash alone. Size_bytes quantifies deployment and update risk: footprints ranging from 113209263 to 784335640 bytes inform capacity planning, supply-chain review, and the proportional scrutiny applied to high-mass programs. Version numbers (9, 11, 12) record the revision plane on which compatibility, rollback, and patch attestation depend; a program key such as XREF-0003 may appear across multiple fact rows with different size_bytes and version tuples, capturing the historical progression of a single logical program through successive builds. Category supplies the governance taxonomy that groups programs for policy application—monitoring versus enforcement versus audit—while identifier and ebpfprogram together preserve the star-schema integrity required for cross-domain reporting.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | 784335640 | 12 |
| XREF-0002 | XREF-0003 | 641704069 | 9 |
| XREF-0003 | XREF-0003 | 113209263 | 11 |
| XREF-0004 | XREF-0005 | 161013093 | 12 |
| XREF-0005 | XREF-0004 | 352203820 | 12 |
| XREF-0006 | XREF-0003 | 167519051 | 1 |

Taken together, identifier, entity, attr, attr_type, misc, category, createddate, owner, ebpfprogram, size_bytes, and version form an interlocking evidence architecture rather than a flat inventory. Identifiers stabilize references; entities scope attestations; attributes and types enforce interpretability; misc carries the measured world; organizational timestamps and owners establish custody; and eBPF facts plus categorical dimensions extend kernel instrumentation into the same compliance vocabulary used for SOC2-TypeII duration accounting and TPM-Attestation host binding. Mature operations treat each field as a constraint on what may be claimed, by whom, under which type discipline, and with what measurable artifact—so that when exit_code 806 coincides with end_time 2024-01-27T20:47:31 on entity ATTE-0001 and host_name gw-12, the resulting statement is not narrative opinion but a typed, attributable, temporally bounded record suitable for external assurance.

**t_attestation_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 806 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 470 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 695 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 409 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 704 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 30 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 773 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 233 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| XREF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| XREF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| XREF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| XREF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| XREF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| XREF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| XREF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| XREF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |