---
chapter_id: ch_live_information_dissemination_event_731679
topic_id: 26
family: 08_derived
cited_terms: ['information_dissemination_event', 'nist80053_high_impact', 'ebpfprogram_loaded_in_kernel']
model: engine-refine
---

Effective information governance begins with unambiguous identification of every compliance and operational action. Each informationdisseminationevent is anchored by a unique identifier, such as EVEN-0001 for a Data Retention Policy v3 update or EVEN-0004 for a Firmware Rollout v4.2, ensuring that audit trails remain traceable across distributed systems. These identifiers serve as the primary keys that bind disparate tracking tables together, allowing auditors and system operators to reconstruct the full lifecycle of a policy, bulletin, or technical release without ambiguity. Without this rigid identification layer, cross-referencing regulatory requirements against actual deployment records would collapse into fragmented, unverifiable logs.

**t_information_dissemination_event**

| id | information_dissemination_event |
| --- | --- |
| EVEN-0001 | Data Retention Policy v3 |
| EVEN-0002 | Security Bulletin 2024-05 |
| EVEN-0003 | Data Retention Policy v3 |
| EVEN-0004 | Firmware Rollout v4.2 |
| EVEN-0005 | Data Retention Policy v3 |
| EVEN-0006 | TLS 1.3 Migration Notice |
| EVEN-0007 | GDPR Compliance Update |

The operational reality of disseminating information requires mapping each event to the external entities that facilitate or receive it. This is achieved through relational junction tables that link a subject—the originating event identifier—to a target, such as a disseminationchannel, audience segment, or internal participant. The subject column functions as a foreign key pointing to the central event registry, while the target column resolves to the corresponding dimension table for channels, audiences, or participants. The semantic weight of each connection is defined by a role field, which explicitly states whether an entity acts as an owner, contributor, reviewer, or observer. For instance, a single firmware rollout may designate a technical writer as a contributor while marking an intranet portal as the primary distribution target, thereby creating a precise, role-aware dependency graph that survives organizational restructuring.

**t_information_dissemination_event_utilizes_channel**

| id | utilizes_channel |
| --- | --- |
| EVEN-0001 | SMS Gateway |
| EVEN-0002 | Mailing List |
| EVEN-0003 | CDN Distribution |
| EVEN-0004 | Intranet Portal |
| EVEN-0005 | RSS Feed |
| EVEN-0006 | Slack Workspace |

**t_information_dissemination_event__utilizes_channel**

| id | information_id | utilizes_channel_id | role |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0004 | EVEN-0001 | contributor |
| EVEN-0002 | EVEN-0004 | EVEN-0005 | contributor |
| EVEN-0003 | EVEN-0001 | EVEN-0005 | owner |
| EVEN-0004 | EVEN-0004 | EVEN-0003 | observer |
| EVEN-0005 | EVEN-0001 | EVEN-0006 | contributor |
| EVEN-0006 | EVEN-0004 | EVEN-0002 | observer |
| EVEN-0007 | EVEN-0001 | EVEN-0005 | owner |
| EVEN-0008 | EVEN-0005 | EVEN-0006 | reviewer |

**t_information_dissemination_event_reaches_audience**

| id | reaches_audience |
| --- | --- |
| EVEN-0001 | Partner Integrators |
| EVEN-0002 | Emergency Responders |
| EVEN-0003 | Public Sector |
| EVEN-0004 | External Developers |
| EVEN-0005 | Field Technicians |
| EVEN-0006 | Internal Auditors |
| EVEN-0007 | Compliance Officers |

**t_information_dissemination_event__reaches_audience**

| id | information_id | reaches_audience_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | EVEN-0007 | owner | Cardinality Note 01 |
| EVEN-0002 | EVEN-0007 | EVEN-0001 | contributor | Cardinality Note 02 |
| EVEN-0003 | EVEN-0003 | EVEN-0005 | reviewer | Cardinality Note 03 |
| EVEN-0004 | EVEN-0003 | EVEN-0004 | reviewer | Cardinality Note 04 |
| EVEN-0005 | EVEN-0004 | EVEN-0003 | contributor | Cardinality Note 05 |
| EVEN-0006 | EVEN-0007 | EVEN-0003 | owner | Cardinality Note 06 |
| EVEN-0007 | EVEN-0004 | EVEN-0005 | reviewer | Cardinality Note 07 |
| EVEN-0008 | EVEN-0007 | EVEN-0006 | reviewer | Cardinality Note 08 |

**t_information_dissemination_event_has_participant**

| id | has_participant |
| --- | --- |
| EVEN-0001 | Product Manager |
| EVEN-0002 | Legal Counsel |
| EVEN-0003 | Operations Manager |
| EVEN-0004 | Technical Writer |
| EVEN-0005 | Legal Counsel |
| EVEN-0006 | Legal Counsel |
| EVEN-0007 | Security Officer |

**t_information_dissemination_event__has_participant**

| id | information_id | has_participant_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | EVEN-0005 | reviewer | Cardinality Note 01 | 2025-05-08 |
| EVEN-0002 | EVEN-0007 | EVEN-0006 | contributor | Cardinality Note 02 | 2024-10-02 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | contributor | Cardinality Note 03 | 2024-02-16 |
| EVEN-0004 | EVEN-0007 | EVEN-0003 | contributor | Cardinality Note 04 | 2023-02-27 |
| EVEN-0005 | EVEN-0003 | EVEN-0005 | contributor | Cardinality Note 05 | 2024-08-08 |
| EVEN-0006 | EVEN-0003 | EVEN-0002 | reviewer | Cardinality Note 06 | 2024-01-28 |
| EVEN-0007 | EVEN-0003 | EVEN-0004 | owner | Cardinality Note 07 | 2025-02-17 |
| EVEN-0008 | EVEN-0007 | EVEN-0001 | contributor | Cardinality Note 08 | 2025-04-14 |

Governance frameworks demand more than static mappings; they require temporal precision and multiplicity constraints to prevent stale or overlapping assignments. The since column records the exact date a particular role or relationship became active, with entries tracking activations ranging from early 2023 to mid-2025, ensuring that historical compliance states can be accurately reconstructed. Coupled with this temporal tracking are cardinality note annotations, which document relationship constraints or exceptions for specific subject-target pairings. These notes, labeled sequentially from Cardinality Note 01 through Cardinality Note 04, provide auditors with immediate context on whether a relationship is one-to-one, one-to-many, or subject to special regulatory carve-outs, preventing ambiguous multiplicity claims during compliance audits.

The distribution mechanism and recipient scope dictate how compliance requirements are enforced across different stakeholder tiers. Channels such as SMS Gateways, Mailing Lists, CDN Distributions, and Intranet Portals are explicitly cataloged and linked to their respective events, while audience tables capture who ultimately receives the information, from Partner Integrators and External Developers to Emergency Responders and Public Sector entities. These distribution networks are cross-referenced against established security baselines, with high-impact compliance mappings tying standards like NIST SP 800-171, NIST SP 800-61, Zero Trust Architecture, and NIST SP 800-161 to specific impact tiers such as Moderate, Tier-4, Severity-Medium, and Compliance-Low. Each regulatory threshold is assigned a specific role to ensure active management rather than passive acknowledgment.

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

The same relational architecture extends beyond policy and communication into infrastructure telemetry, where system-level components are tracked with identical rigor. Kernel-loaded programs, such as eBPF modules, are recorded with precise size bytes metrics—ranging from approximately 113 million to over 784 million—and version identifiers that span major releases. These technical assets are classified through a category field and contextualized via a misc label, while a loaded in foreign key ties each binary to its deployment environment. By applying the subject-target-role pattern to infrastructure, organizations maintain a unified governance model where regulatory documents, communication channels, and low-level system binaries are all subject to the same traceable, role-aware, and temporally versioned tracking framework.

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |