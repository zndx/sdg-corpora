---
chapter_id: ch_live_kernelhook_for_subsystem_d1a5cd
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['kernelhook_for_subsystem', 'artifact_has_id', 'evidence_independent_of']
model: engine-refine
---

Kernel subsystem governance rests on a stable dimensional spine in which each deployable surface is keyed by an identifier and classified by category and descriptive label. The dimension records SUBS-0001 through SUBS-0004 map to For Kernel Subsystem Category 01–04 and the corresponding For Kernel Subsystem Label 01–04, establishing the taxonomic and human-readable frame within which operational facts are interpreted. Category partitions the kernel surface for policy application—capacity planning, change-control scope, and audit sampling—while the label supplies the miscellany of operational naming that permits operators to correlate registry entries with runtime components without collapsing distinct subsystems into a single undifferentiated pool. Identifier SUBS-000n is therefore not merely a surrogate key; it is the join anchor that binds descriptive metadata to measured behavior and to downstream artifact registries.

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

Measured behavior enters through kernel hook facts keyed by the same identifier namespace but oriented toward attachment and magnitude. Each hook record associates a for_kernel_subsystem reference with a size_bytes footprint and a version integer, encoding both physical presence in the instrumented kernel and the revision under which that presence was observed. SUBS-0001 attaches to subsystem SUBS-0005 at 36,342,735 bytes under version 3, whereas SUBS-0002 binds to SUBS-0007 at 560,962,979 bytes under version 1; SUBS-0003 references SUBS-0001 at 456,299,832 bytes at version 10, and SUBS-0004 again targets SUBS-0005 at 272,822,846 bytes at version 1. The dispersion of size_bytes across three orders of magnitude signals heterogeneous hook payloads—compact probes versus large trace or dump regions—and the coexistence of version 1 with version 10 on different rows demonstrates that subsystem lineage and hook revision are independently tracked. Governance treats size_bytes as a capacity and integrity signal: abrupt deltas across reconciliations trigger review even when category and label remain unchanged.

Version propagates beyond kernel facts into artifact identity, where external identifiers standardize cross-system reference. The artifact registry records MetricsDump88A, DroneFleet7C, ConfigManifest99, and DataPipelineV3, each carrying a typed identifier—oid:1.3.6.1 appears twice, doi:10.1109/x once, ARN:res/41 once—and an artifact-level version distinct from hook version (3, 4, 9, and 6 respectively). This separation matters because kernel hook version 10 on SUBS-0003 does not imply artifact version 9 on ConfigManifest99; compliance workflows must maintain parallel version streams and prove correspondence through controlled mapping rather than numeric equality. Identifier typing (OID, DOI, ARN) further constrains validation rules: OID namespaces suit telemetric and MIB-aligned dumps, DOI anchors published methodological artifacts, and ARN-scoped resources tie cloud-resident pipelines to infrastructure policy.

**t_artifact_has_id**

| id | artifact | identifier | version |
| --- | --- | --- | --- |
| HAS-0001 | MetricsDump88A | oid:1.3.6.1 | 3 |
| HAS-0002 | DroneFleet7C | oid:1.3.6.1 | 4 |
| HAS-0003 | ConfigManifest99 | doi:10.1109/x | 9 |
| HAS-0004 | DataPipelineV3 | ARN:res/41 | 6 |
| HAS-0005 | DataPipelineV3 | ref-8842 | 11 |
| HAS-0006 | DroneFleet7C | oid:1.3.6.1 | 5 |

Evidence governance complements instrumentation by asserting what observational material stands independent of underlying platforms or schemas. Base evidence types—clinical trial outcome, compliance certification record, sensor calibration trace, and lab assay result—are declared alongside independence objects: data warehouse, labeling schema, and measurement device. Independence is not absence of linkage but an explicit claim that probative value does not derive from a nominated dependency; INDE-0001 and INDE-0004 both cite data warehouse as the independence object, while INDE-0003 cites measurement device, indicating repeated need to insulate certain evidentiary classes from warehouse re-materialization or device-specific drift. Relational structure is expressed through subject and target roles on the bridge: evidence_id INDE-0005 pairs with evidence_independent_of_id INDE-0008 under role contributor; INDE-0003 appears twice as subject against INDE-0008 as target with roles reviewer and, in a separate row, observer via INDE-0002 as subject against INDE-0005 as target under reviewer. Subject denotes the evidentiary assertion under certification; target denotes the independence claim or counterparty node; role qualifies the procedural stance—contribution, review, or observation—without collapsing multiple hats into an undifferentiated edge.

In practice, auditors reconcile category and label from the subsystem dimension against hook size_bytes and version, then trace outward to artifact identifiers and evidence independence graphs. A subsystem in For Kernel Subsystem Category 02 implicated by a hook on SUBS-0007 at half-gigabyte scale under version 1 demands different retention and hashing policy than a category-01 probe at 36 MB under version 3. Artifact DOI and OID bindings supply bibliographic and protocol lineage for published metrics and manifests, while ARN-bound pipelines enforce residency controls. Evidence paths where the same subject (INDE-0003) holds reviewer and observer roles toward a common target (INDE-0008) require separation-of-duties checks so that calibration traces credentialed as independent of a measurement device are not simultaneously validated only by parties with observer standing on the same edge. Identifier stability across fact_kernelhook, dim_for_kernel_subsystem, t_artifact_has_id, and the evidence bridge tables is the operational invariant: category and misc label contextualize, size_bytes and version quantify and time-bind, subject-target-role triples proceduralize independence claims, and typed external identifiers export the kernel-local registry into enterprise and regulatory corpora without ambiguity.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

**t_evidence_independent_of**

| id | evidence |
| --- | --- |
| INDE-0001 | clinical trial outcome |
| INDE-0002 | compliance certification record |
| INDE-0003 | sensor calibration trace |
| INDE-0004 | lab assay result |
| INDE-0005 | batch processing checksum |
| INDE-0006 | telemetry snapshot |
| INDE-0007 | compliance certification record |

**t_evidence_independent_of_evidence_independent_of**

| id | evidence_independent_of |
| --- | --- |
| INDE-0001 | data warehouse |
| INDE-0002 | labeling schema |
| INDE-0003 | measurement device |
| INDE-0004 | data warehouse |
| INDE-0005 | partition strategy |
| INDE-0006 | git repository |
| INDE-0007 | monitoring dashboard |
| INDE-0008 | labeling schema |

**t_evidence_independent_of__evidence_independent_of**

| id | evidence_id | evidence_independent_of_id | role |
| --- | --- | --- | --- |
| INDE-0001 | INDE-0005 | INDE-0008 | contributor |
| INDE-0002 | INDE-0003 | INDE-0008 | reviewer |
| INDE-0003 | INDE-0003 | INDE-0008 | observer |
| INDE-0004 | INDE-0002 | INDE-0005 | reviewer |
| INDE-0005 | INDE-0002 | INDE-0003 | observer |
| INDE-0006 | INDE-0006 | INDE-0001 | contributor |
| INDE-0007 | INDE-0001 | INDE-0005 | contributor |
| INDE-0008 | INDE-0002 | INDE-0005 | contributor |