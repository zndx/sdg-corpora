---
chapter_id: ch_live_constraint_basic_c957c5
topic_id: 188
family: 03_directive_governance
cited_terms: ['constraint_basic', 'soc2_privacy_subclass', 'kernelhook_for_subsystem']
model: engine-refine
---

**Section 4.2 — Enforcement Mechanisms and Governance Classifications**

Compliance enforcement within the framework operates through a stratified constraint model that binds policy requirements to operational artifacts. Each constraint carries an enforcement posture—either *blocking*, which halts execution when violated, or *mandatory*, which requires resolution without necessarily preventing downstream processing. The constraint ENCRYPTION_AES256, for instance, is enforced in blocking mode and is associated with the label *nightly summary*, indicating that encryption compliance is validated as part of the nightly reporting cycle. Similarly, UNIQUE_EMAIL and MAX_LENGTH_255 both employ blocking enforcement, the former governing data intake forms to prevent duplicate email entries and the latter constraining field lengths in pre-release documentation workflows. The constraint PACKET_SIZE_MAX_1500, while also tied to intake form processing, is classified as mandatory rather than blocking, reflecting a design choice where oversized packets are flagged for remediation but do not abort the intake pipeline. These enforcement postures—blocking and mandatory—constitute the primary control levers by which the framework ensures that policy violations are either prevented outright or escalated for corrective action.

**t_constraint_basic**

| id | constraint | enforcement | label_text |
| --- | --- | --- | --- |
| CONS-0001 | ENCRYPTION_AES256 | blocking | nightly summary |
| CONS-0002 | UNIQUE_EMAIL | blocking | intake form |
| CONS-0003 | PACKET_SIZE_MAX_1500 | mandatory | intake form |
| CONS-0004 | MAX_LENGTH_255 | blocking | pre-release note |
| CONS-0005 | MAX_LENGTH_255 | advisory | calibration record |
| CONS-0006 | CHECK_AGE_POSITIVE | advisory | change rationale |
| CONS-0007 | NOT_NULL | mandatory | change rationale |

The SOC 2 privacy subclass architecture provides a secondary layer of governance, mapping privacy controls to recognized SOC 2 trust service criteria and operational domains. Privacy subclass identifiers such as PRIV-0001 through PRIV-0004 each carry a SOC classification—ranging from SOC1-Control-Statement and SOC1-TypeII to SOC2-Processing-Integrity—that determines the audit rigor and evidence requirements applicable to the control. These subclasses are further resolved into operational domains: incidentResponse, securityCriteria, and dataRetention. The domain mapping is not one-to-one; PRIV-0001 and PRIV-0002 both resolve to the incidentResponse domain, while PRIV-0003 maps to securityCriteria and PRIV-0004 to dataRetention. This many-to-one resolution pattern reflects the reality that a single operational domain—such as incident response—may be governed by multiple privacy subclass controls, each carrying its own SOC classification and audit expectations.

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | incidentResponse |
| PRIV-0002 | incidentResponse |
| PRIV-0003 | securityCriteria |
| PRIV-0004 | dataRetention |
| PRIV-0005 | encryptionStandards |
| PRIV-0006 | securityCriteria |

Governance roles within the SOC 2 privacy-subclass-to-domain mapping are explicitly assigned through a junction table that records the relationship between a privacy subclass, its target domain, and the responsible role. The role attribute takes values of *contributor* or *owner*, establishing a clear accountability model. In the observed data, the majority of mappings carry the contributor role—PRIV-0003 mapped to incidentResponse (PRIV-0001), PRIV-0003 mapped to securityCriteria (PRIV-0003), and PRIV-0002 mapped to dataRetention (PRIV-0006) all designate contributors—while only PRIV-0006 mapped to incidentResponse (PRIV-0005) carries the owner role. This distribution suggests a governance model where most privacy controls are executed by contributors under the oversight of designated owners, a pattern consistent with SOC 2 audit requirements that distinguish between control operators and control owners.

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |

Kernel subsystem management is tracked through a fact table that records hook-level metadata for each subsystem invocation, including the subsystem key, the size of the hook in bytes, and the version number. The size_bytes column captures substantial variation: values range from approximately 27 million bytes (SUBS-0005, at 27,282,284 bytes) to over 560 million bytes (SUBS-0007, at 560,962,979 bytes), with intermediate entries at roughly 36 million and 456 million bytes. Version numbers are discrete integers—1, 3, and 10 are observed—indicating that kernel subsystem hooks are versioned independently of their size, and that a given subsystem key may be associated with multiple versions across different hook records. The fact table references the dimension table dim_for_kernel_subsystem via the for_kernel_subsystem_key column, which in turn provides human-readable labels (e.g., *For Kernel Subsystem Label 01*) and categorical groupings (e.g., *For Kernel Subsystem Category 01*) for each subsystem identifier. This dimension-fact pairing enables both granular tracking of hook-level characteristics and higher-level aggregation by subsystem category, supporting capacity planning, version management, and subsystem lifecycle governance.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

**dim_for_kernel_subsystem**

| id | for_kernel_subsystem_label | for_kernel_subsystem_category |
| --- | --- | --- |
| SUBS-0001 | For Kernel Subsystem Label 01 | For Kernel Subsystem Category 01 |
| SUBS-0002 | For Kernel Subsystem Label 02 | For Kernel Subsystem Category 02 |
| SUBS-0003 | For Kernel Subsystem Label 03 | For Kernel Subsystem Category 03 |
| SUBS-0004 | For Kernel Subsystem Label 04 | For Kernel Subsystem Category 04 |
| SUBS-0005 | For Kernel Subsystem Label 05 | For Kernel Subsystem Category 05 |
| SUBS-0006 | For Kernel Subsystem Label 06 | For Kernel Subsystem Category 06 |
| SUBS-0007 | For Kernel Subsystem Label 07 | For Kernel Subsystem Category 07 |