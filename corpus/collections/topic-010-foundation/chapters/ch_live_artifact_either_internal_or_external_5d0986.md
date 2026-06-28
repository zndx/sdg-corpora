---
chapter_id: ch_live_artifact_either_internal_or_external_5d0986
topic_id: 10
family: 07_long_tail
cited_terms: ['artifact_either_internal_or_external', 'artifact_governed_by_policy', 'artifact_has_id']
model: engine-refine
---

INTERNATIONAL UNION OF PURE AND APPLIED CHEMISTRY

ANALYTICAL CHEMISTRY DIVISION COMMISSION ON ELECTROANALYTICAL CHEMISTRY*

POTENTIOMETRIC SELECTIVITY COEFFICIENTS OF IION-SELECTIVE ELECTRODES

PART I. INORGANIC CATIONS

(Technical Report)

Prepared for publication by YOSHIO UMEZAWA 1 , PHILIPPE BÜHLMANN 1 , KAYOKO UMEZAWA 2 , KOJI TOHDA 1 , AND SHIGERU AMEMIYA 1

1 Department of Chemistry, The Un...

Artifact management in enterprise data governance rests upon the disciplined identification, classification, and versioning of discrete data entities across their lifecycle. An artifact constitutes the fundamental unit of traceability—a file, configuration, dataset, or operational payload whose integrity must be assured from ingestion through archival. Within the governing schema, the fact_artifact table anchors this discipline by assigning each artifact a persistent surrogate key (EXTE-0001 through EXTE-0004) and recording its material properties: the artifact_key references a canonical artifact identity, size_bytes quantifies storage footprint in bytes (values ranging from 42,978,804 bytes for EXTE-0002 to 996,080,316 bytes for EXTE-0003), and version tracks the revision counter (observed values of 5, 6, and 10). This triad of key, size, and version forms the minimal audit record sufficient to reconstruct artifact provenance at any point in time.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| EXTE-0001 | EXTE-0004 | 123155790 | 6 |
| EXTE-0002 | EXTE-0005 | 42978804 | 5 |
| EXTE-0003 | EXTE-0004 | 996080316 | 5 |
| EXTE-0004 | EXTE-0005 | 597369362 | 10 |
| EXTE-0005 | EXTE-0006 | 12061913 | 9 |
| EXTE-0006 | EXTE-0001 | 792675668 | 5 |

Classification of artifacts into semantic categories enables policy application at scale. The dim_artifact dimension table provides this categorical taxonomy through the artifact_category column, which assigns each artifact to a classification such as Artifact Category 01 through Artifact Category 04, corresponding to identifiers EXTE-0001 through EXTE-0004 respectively. Accompanying this is the artifact_label column (miscellaneous metadata), which carries human-readable designations—Artifact Label 01, Artifact Label 02, Artifact Label 03, Artifact Label 04—serving as display names in governance dashboards and operational runbooks. The join between fact_artifact and dim_artifact on their shared id column unites material properties with semantic classification, enabling queries that filter artifacts by category while retaining access to size and version information.

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| EXTE-0001 | Artifact Label 01 | Artifact Category 01 |
| EXTE-0002 | Artifact Label 02 | Artifact Category 02 |
| EXTE-0003 | Artifact Label 03 | Artifact Category 03 |
| EXTE-0004 | Artifact Label 04 | Artifact Category 04 |
| EXTE-0005 | Artifact Label 05 | Artifact Category 05 |
| EXTE-0006 | Artifact Label 06 | Artifact Category 06 |

**t_artifact_has_id**

| id | artifact | identifier | version |
| --- | --- | --- | --- |
| HAS-0001 | MetricsDump88A | oid:1.3.6.1 | 3 |
| HAS-0002 | DroneFleet7C | oid:1.3.6.1 | 4 |
| HAS-0003 | ConfigManifest99 | doi:10.1109/x | 9 |
| HAS-0004 | DataPipelineV3 | ARN:res/41 | 6 |
| HAS-0005 | DataPipelineV3 | ref-8842 | 11 |
| HAS-0006 | DroneFleet7C | oid:1.3.6.1 | 5 |

Identifier assignment extends artifact traceability beyond internal surrogate keys into externally recognized namespaces. The t_artifact_has_id table records the mapping between internal artifact names and authoritative identifiers drawn from distinct registries. For instance, the artifact MetricsDump88A carries the identifier oid:1.3.6.1, while DroneFleet7C shares the same OID prefix; ConfigManifest99 is assigned doi:10.1109/x, and DataPipelineV3 bears the ARN ARN:res/41. Each identifier-artifact pairing is itself versioned (versions 3, 4, 9, and 6 observed), reflecting that identifier assignments may change as artifacts evolve or migrate between systems. This table thus serves as the canonical registry linking operational artifact names to their globally unique identifiers, a prerequisite for cross-system audit and compliance reporting.

Policy governance introduces an additional layer of artifact management wherein specific artifact types are subject to regulatory or operational constraints. The t_artifact_governed_by_policy table enumerates these relationships, recording the artifact type (ml_training_dataset, api_gateway_config, payment_transaction_log, batch_ingestion_job), its size_bytes (labeled sizebytes in this context, with values spanning 14,439,485 bytes for payment_transaction_log to 765,223,054 bytes for batch_ingestion_job), and the governing version (observed values of 3, 8, 9, and 10). The presence of a record in this table signals that the named artifact type is subject to a defined policy regime, with the size_bytes and version columns providing the material and revision context necessary for policy enforcement—for example, verifying that a payment_transaction_log at version 10 conforms to retention requirements applicable to that revision.

**t_artifact_governed_by_policy**

| id | artifact | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | ml_training_dataset | 98508200 | 9 |
| POLI-0002 | api_gateway_config | 750925585 | 8 |
| POLI-0003 | payment_transaction_log | 14439485 | 10 |
| POLI-0004 | batch_ingestion_job | 765223054 | 3 |

The interplay of these four tables—fact_artifact, dim_artifact, t_artifact_has_id, and t_artifact_governed_by_policy—establishes a complete artifact governance fabric. The fact_artifact table provides the material record (what exists, how large, which revision); dim_artifact supplies the semantic classification (what category, what label); t_artifact_has_id bridges to external identity systems (which global identifier applies); and t_artifact_governed_by_policy declares regulatory applicability (which policies govern). Together, they enable an organization to answer, for any artifact, who created it, what it contains, how large it is, which version is in use, what category it belongs to, what external identifier it carries, and which policies constrain its handling. This comprehensive traceability is the foundation of data governance, audit readiness, and regulatory compliance in modern data architectures.