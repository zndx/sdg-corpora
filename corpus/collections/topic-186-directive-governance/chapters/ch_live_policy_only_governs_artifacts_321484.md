---
chapter_id: ch_live_policy_only_governs_artifacts_321484
topic_id: 186
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'program_subclass', 'dataset_at_version']
model: engine-refine
---

Governance over data and software artifacts rests on stable identifiers that make every rule, program, and dataset version addressable across systems and audit trails. An artifact such as ARTI-0003 can be referenced unambiguously when a Privacy Compliance Policy binds to it, when a MetadataHarvest program declares that artifact as its input, or when lineage records show which versioned dataset consumed it. Identifiers are not merely labels; they are the join keys that let enforcement engines, deployment schedulers, and compliance reviewers speak about the same object without ambiguity. When PROG-0002 and PROG-0003 both list ARTI-0003 as input, the shared identifier is what allows an organization to ask, in one query, which running workloads touch privacy-governed material regardless of program name or hosting region.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

**t_dataset_at_version**

| id | dataset |
| --- | --- |
| VERS-0001 | Landsat-8-OLI |
| VERS-0002 | UrbanAirQuality |
| VERS-0003 | Landsat-8-OLI |
| VERS-0004 | ATLAS-ICU-Cohort |
| VERS-0005 | SatelliteTelemetryRaw |
| VERS-0006 | GeospatialRoadNetwork |

**t_dataset_at_version_at_dataset_version**

| id | at_dataset_version |
| --- | --- |
| VERS-0001 | v3.0.0-stable |
| VERS-0002 | release-2023-Q4 |
| VERS-0003 | build-4491 |
| VERS-0004 | v2.1.0 |
| VERS-0005 | build-4491 |
| VERS-0006 | release-2023-Q4 |
| VERS-0007 | v2.1.0 |
| VERS-0008 | v2.1.0 |

Enforcement describes how a policy’s requirements take effect once an artifact falls under its scope. The same artifact may be subject to different enforcement postures depending on the policy attached: blocking enforcement on ARTI-0001 under a Data Retention Policy means noncompliant operations halt rather than proceed with a warning, whereas advisory enforcement on ARTI-0002 under Access Control Policy surfaces guidance without necessarily interrupting a DataQualityScan that depends on that artifact. Deprecated enforcement signals that a rule remains on the books for traceability but must not be treated as an active control—an important distinction for auditors reviewing historical decisions. Priority resolves conflicts when multiple policies apply to overlapping contexts. Privacy Compliance Policy at priority 1 outranks Data Retention Policy at priority 2, which in turn outranks Access Control Policy at priority 4 and Immutable Audit Policy at priority 5; in practice, when retention and privacy obligations collide, the lower numeric priority wins unless an explicit exception path exists. Operators therefore configure pipelines so that the strictest effective posture is computed before execution, not discovered after a job has already written noncompliant output.

License and location extend governance from what is governed to how and where processing may legally and operationally occur. A program subclass ties a concrete workload—MetadataHarvest, DataQualityScan, or AnomalyDetectionPipeline—to the artifact it consumes and to the license terms under which that code may run. GPL-3.0 on PROG-0001 imposes copyleft obligations that differ materially from the proprietary license on PROG-0002 or the permissive Apache-2.0 and MIT terms on later variants. Location further constrains placement: rack-7 denotes on-premises hardware, while us-east-1 and ap-south-2 anchor cloud regions where residency, export-control, and latency requirements apply. The same program name can therefore appear in multiple registrations—MetadataHarvest runs under GPL-3.0 in rack-7 against ARTI-0002 and again under Apache-2.0 in ap-south-2 against ARTI-0003—reflecting that license and location are properties of a deployed instance, not of the program concept alone. Compliance review must verify that the license on the running instance matches the artifact’s policy envelope and that the chosen region satisfies data-sovereignty rules before input is read.

**t_program_subclass**

| id | program | input | license | location |
| --- | --- | --- | --- | --- |
| PROG-0001 | MetadataHarvest | ARTI-0002 | GPL-3.0 | rack-7 |
| PROG-0002 | DataQualityScan | ARTI-0006 | proprietary | us-east-1 |
| PROG-0003 | MetadataHarvest | ARTI-0003 | Apache-2.0 | ap-south-2 |
| PROG-0004 | AnomalyDetectionPipeline | ARTI-0003 | MIT | us-east-1 |
| PROG-0005 | LogAggregationJob | ARTI-0006 | BSD-3-Clause | us-east-1 |
| PROG-0006 | DataQualityScan | ARTI-0003 | GPL-3.0 | us-east-1 |
| PROG-0007 | PatientCohortExtract | ARTI-0002 | CC-BY-4.0 | us-east-1 |
| PROG-0008 | NightlyDataSync | ARTI-0006 | GPL-3.0 | rack-7 |

Versioned datasets introduce a second layer of identity: a version record names a dataset—Landsat-8-OLI, UrbanAirQuality, ATLAS-ICU-Cohort—and companion records pin each to a specific release tag such as v3.0.0-stable, release-2023-Q4, or build-4491. That separation lets governance attach to the dataset lineage while engineering teams ship immutable snapshots. UrbanAirQuality at release-2023-Q4 can be promoted, frozen, or retired without redefining what “UrbanAirQuality” means organizationally. Downstream programs and policies reference version identifiers when they need reproducibility: an anomaly pipeline bound to ARTI-0003 may consume only the dataset snapshot that existed when the artifact was certified, not whatever is current in a catalog.

Role, subject, and target formalize directed relationships among versioned entities. In a dataset–version association, the subject is the entity that plays a part, and the target is the versioned object that part applies to. VERS-0002 names UrbanAirQuality as subject relating to VERS-0001 as target with role owner, establishing custodial accountability for that release. The same pattern with role contributor on VERS-0001 and VERS-0004 shows Landsat-8-OLI and ATLAS-ICU-Cohort participating in a version graph without implying ownership. Reviewer on VERS-0003 captures a quality gate: a party must attest to a build before it is promoted. These triples are how access-control matrices, approval workflows, and audit narratives are materialized—who may change what, who must sign off, and which version line each obligation follows. A contributor on one edge does not inherit owner privileges on another unless explicitly granted.

Taken together, identifiers anchor every entity; enforcement and priority determine whether and in what order obligations bite; license and location govern lawful execution geography; and role–subject–target links stitch people and datasets into accountable version histories. An operator assessing PROG-0004 in us-east-1, licensed under MIT and reading ARTI-0003, must reconcile Privacy Compliance Policy’s blocking posture at priority 1 against whatever contributor or reviewer relationships attach to the dataset versions that artifact encapsulates. That end-to-end chain—from policy on an artifact, through a licensed program at a named location, to versioned data and the roles that steward it—is how organizations turn abstract compliance principles into enforceable, auditable practice.

**t_dataset_at_version__at_dataset_version**

| id | dataset_id | at_dataset_version_id | role |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0004 | VERS-0002 | contributor |
| VERS-0002 | VERS-0002 | VERS-0001 | owner |
| VERS-0003 | VERS-0005 | VERS-0001 | reviewer |
| VERS-0004 | VERS-0001 | VERS-0004 | contributor |
| VERS-0005 | VERS-0005 | VERS-0007 | owner |
| VERS-0006 | VERS-0002 | VERS-0007 | reviewer |
| VERS-0007 | VERS-0003 | VERS-0003 | reviewer |
| VERS-0008 | VERS-0003 | VERS-0002 | owner |