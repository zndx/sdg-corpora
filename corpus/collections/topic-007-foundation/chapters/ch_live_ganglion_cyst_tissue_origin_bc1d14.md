---
chapter_id: ch_live_ganglion_cyst_tissue_origin_bc1d14
topic_id: 7
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'kernelhook_observes_syscall_xref', 'designative_with_naming_authority']
model: engine-refine
---

Ganglion cyst tissue origin denotes the anatomical locus from which a cyst is understood to arise within the musculoskeletal envelope, and in operational reference systems it functions as a controlled vocabulary term rather than a free-text clinical note. Entries such as sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment establish discrete, auditable designations that downstream classification, reporting, and cross-system reconciliation can treat as canonical. Each origin is bound to a durable identifier—ORIG-0001 through ORIG-0004 in the present corpus—so that semantic drift, synonym proliferation, and ambiguous charting language are suppressed in favor of referential stability; the identifier is not merely a surrogate key but the contractual handle by which provenance, attribution, and structural linkage are asserted across tables and consuming applications.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

Connective tissue structure names the histo-architectural substrate within which an origin is situated, and the pairing of origin with structure supplies the compositional context that origin alone cannot carry. Periosteal layer, joint capsule, deep fascia, and fibrous adventitia exemplify the connective-tissue layer that governance models treat as a first-class entity distinct from the joint or compartment name: sacroiliac joint and metacarpophalangeal joint may both map to periosteal layer, while subacromial bursa aligns with joint capsule and first dorsal compartment with deep fascia or fibrous adventitia depending on the lineage asserted in the registry. Identifier discipline applies equally here—ORIG-0001 through ORIG-0004 recur as keys—so that structure terms remain normalized even when clinical discourse employs overlapping or colloquial phrasing.

Attribution and relational semantics are expressed through subject, target, and role, which together formalize who or what participates in a governed association and in what capacity. In the ganglion cyst lineage, ganglion_id acts as subject (ORIG-0007, ORIG-0008, ORIG-0002) and part_of_id as target (ORIG-0001, ORIG-0005, ORIG-0006), while role encodes stewardship posture: reviewer, contributor, or owner. A single subject may appear in multiple rows with different targets and roles—ORIG-0007 is linked once as contributor and once under a distinct part_of_id—demonstrating that governance is edge-specific rather than entity-monolithic. Owner on a subject–target edge is not interchangeable with owner on an observability or authority record; it denotes accountability for the asserted relationship, not generic resource custody.

Temporal and custodial metadata extend the same framework into operational telemetry and standards registries. Created date anchors when an observation or registration event entered the authoritative record: kernel-hook cross-references carry created_date values spanning 2023-03-30 through 2025-04-07, establishing an audit timeline for bcc_tcpconnect and tracee_fs_watch entries whose owner fields—sre, ml-infra, platform-team, analytics—identify the organizational steward responsible for lifecycle, review, and deprecation. Parallel authority records assign checksum algorithms to published designatives—OGC-API-Feat, DCAT-AP-3.0, HAN-0092, RFC-7578—so that md5, blake2b, and sha1 selections are not arbitrary implementation details but declared integrity contracts, with IANA and Crossref recorded as assigning bodies.

The misc code field—C-07, E-21, D-33 in the authority set—compresses cross-cutting policy or catalog lineage into a compact, machine-sortable token that checksum algorithm and designative string alone do not convey; repeated C-07 across distinct designatives signals shared catalog class without collapsing their semantic identity. Checksum algorithm choice therefore participates in a layered compliance posture: algorithm names document how an artifact’s fingerprint was computed, created date documents when that posture was recorded, owner documents who may alter it, and misc codes document which governance bucket applies when auditors reconcile heterogeneous standards corpora against a single naming-authority table.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | IANA | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | Crossref | md5 | E-21 |
| AUTH-0003 | HAN-0092 | IANA | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | IANA | sha1 | D-33 |

Taken together, identifier, ganglion cyst tissue origin, connective tissue structure, subject, target, role, owner, created date, checksum algorithm, and misc code constitute an interlocking evidence model in which anatomical taxonomy, relational stewardship, and standards integrity are governed by the same primitives. Clinical specificity (sacroiliac joint anchored to periosteal layer), operational specificity (bcc_tcpconnect owned by sre as of 2025-01-25), and bibliographic specificity (RFC-7578 under sha1 with code D-33) differ in domain but share mechanism: stable keys, explicit roles, dated assertions, declared hash contracts, and compact policy codes that permit dense, evidence-anchored reference prose without collapsing distinct evidentiary planes into undifferentiated metadata.

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

**t_kernelhook_observes_syscall_xref**

| id | kernelhook | created_date | owner |
| --- | --- | --- | --- |
| XREF-0001 | bcc_tcpconnect | 2025-01-25 | sre |
| XREF-0002 | bcc_tcpconnect | 2023-03-30 | ml-infra |
| XREF-0003 | tracee_fs_watch | 2024-11-21 | platform-team |
| XREF-0004 | bcc_tcpconnect | 2025-04-07 | analytics |
| XREF-0005 | tracee_fs_watch | 2024-03-25 | governance |