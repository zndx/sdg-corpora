---
chapter_id: ch_live_dataset_was_generated_by_e7a835
topic_id: 35
family: 05_provo_lineage
cited_terms: ['dataset_was_generated_by', 'gdpr_article_subclass', 'survey_response_record']
model: engine-refine
---

The governance of researcher interactions relies upon the precise structuring of survey response records, which serve as the primary mechanism for capturing profile attributes such as Clearance-Level, Domain-Expertise-Code, and Protocol-Approval-Ref. These records, exemplified by operational instances like Peer-Review-Submission, Safety-Compliance-Check, and Q3-2023-Feedback, are not merely textual artifacts but are rigorously defined by their technical encoding and linguistic parameters. To ensure interoperability across diverse institutional environments, each record is annotated with specific encoding standards—including ascii, unicode, and utf8—and designated language codes such as es, de, and en. This granular metadata ensures that sensitive compliance and feedback data remain both machine-readable and linguistically unambiguous throughout the data lifecycle.

At the core of relational integrity lies the systematic application of unique identifiers, which anchor complex provenance chains across disparate systems. In the context of dataset generation, entities such as the supply-chain-manifest, satellite-imagery-stack, lab-culture-growth, and genomic-variant-call are explicitly linked to their originating sources—ranging from edge-compute-node and telemetry-collector to ml-training-runner—through a tripartite relationship defined by subject, target, and role. The subject column designates the originating dataset entity, while the target column identifies the specific generation mechanism or node. The role attribute further qualifies this interaction, distinguishing between passive observer statuses and active contributor engagements, thereby establishing a transparent audit trail for data lineage.

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | supply-chain-manifest |
| GENE-0002 | satellite-imagery-stack |
| GENE-0003 | lab-culture-growth |
| GENE-0004 | genomic-variant-call |
| GENE-0005 | lab-culture-growth |
| GENE-0006 | genomic-variant-call |
| GENE-0007 | patient-vitals-csv |
| GENE-0008 | telemetry-sensor-readings |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | edge-compute-node |
| GENE-0002 | telemetry-collector |
| GENE-0003 | ml-training-runner |
| GENE-0004 | telemetry-collector |
| GENE-0005 | kafka-ingestion-job |
| GENE-0006 | batch-cleanup-script |

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |

This structural paradigm of subject-target relationships governed by specific roles extends seamlessly into regulatory compliance frameworks, where the mapping of legal articles to overarching data protection standards is critical. Within the governance of cross-border data flows, identifiers such as ARTI-0001 and GENE-0001 provide the necessary granularity to trace obligations back to their source. For instance, the alignment of Brazilian LGPD and Canadian PIPEDA with specific regulatory articles—such as the Australian Privacy Act, Japanese APPI, or Article 9—relies on the same relational architecture. Here, the role attribute assumes a compliance-centric function, categorizing the relationship between a regulatory subclass and its constituent article as either an owner, a contributor, or an observer, ensuring that legal dependencies are explicitly documented and enforceable.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

Ultimately, the interplay between encoding, language, and structured identifiers forms the bedrock of a resilient data governance ecosystem. By decoupling the semantic content of a survey response record or a regulatory subclass from its technical transport mechanisms and relational context, organizations can maintain rigorous control over their information assets. The consistent application of role-based relationship mapping—whether linking a lab-culture-growth dataset to an ml-training-runner or associating a Protocol-Approval-Ref with a specific compliance check—ensures that every data point is contextualized. This approach transforms raw data into a governed asset, where the provenance, encoding, and regulatory standing of each record are as clearly defined as the record itself.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |