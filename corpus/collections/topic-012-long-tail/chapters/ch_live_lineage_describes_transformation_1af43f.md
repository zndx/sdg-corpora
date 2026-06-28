---
chapter_id: ch_live_lineage_describes_transformation_1af43f
topic_id: 12
family: 07_long_tail
cited_terms: ['lineage_describes_transformation', 'reference_within_dataset', 'classification_subclass']
model: engine-refine
---

Provenance in structured data environments rests upon the disciplined coupling of identifiers with their associated attributes, types, and categorical contexts. Each entity within a dataset is anchored by a unique identifier—DATA-0001, DATA-0002, and so forth—through which its attributes are resolved and its values materialized. Attributes such as checksum_algo, code, format, and issued_date are not merely named fields; they carry explicit type declarations—xsd:string for textual properties like A-01 and Encoding 03, and xsd:date for temporal markers such as 2024-10-25 and 2023-04-24. This type discipline ensures that value interpretation remains unambiguous across systems, whether a datum represents a classification reference like PROVENANCE-MAP-V4 or a protocol designation such as QC-PROTOCOL-V2. The entity itself functions as the pivot around which all attribute-value pairs revolve: a single entity_id may reference multiple attributes, each resolved through its own attr_id, forming a dense web of metadata that documents not only what a record contains but how it is structured and typed.

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | CLAS-0003 | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | CLAS-0003 | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | CLAS-0006 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | CLAS-0004 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | CLAS-0003 | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | CLAS-0001 | regulatory_submission |

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |

Lineage tracking introduces a parallel dimension of accountability, where the provenance of data is quantified through confidence and uncertainty measures that accompany each recorded transition. A lineage record identified as TRAN-0001 carries a confidence score of 0.645 and an uncertainty value of 612.22, while TRAN-0004 exhibits a markedly higher confidence of 0.779 alongside an uncertainty of 708.23—demonstrating that confidence and uncertainty are not inversely proportional but rather capture distinct facets of provenance quality. These numeric assessments are anchored to lineage keys that reference other lineage records, establishing a directed graph of data transformation and movement. The lineage dimension further enriches this graph with human-readable labels—Lineage Label 01 through Lineage Label 04—and categorical groupings such as Lineage Category 01 and Lineage Category 04, enabling both machine-readable traversal and human interpretability of the data's journey through the system.

**dim_lineage**

| id | lineage_label | lineage_category |
| --- | --- | --- |
| TRAN-0001 | Lineage Label 01 | Lineage Category 01 |
| TRAN-0002 | Lineage Label 02 | Lineage Category 02 |
| TRAN-0003 | Lineage Label 03 | Lineage Category 03 |
| TRAN-0004 | Lineage Label 04 | Lineage Category 04 |
| TRAN-0005 | Lineage Label 05 | Lineage Category 05 |
| TRAN-0006 | Lineage Label 06 | Lineage Category 06 |
| TRAN-0007 | Lineage Label 07 | Lineage Category 07 |
| TRAN-0008 | Lineage Label 08 | Lineage Category 08 |

Classification and status information provide the regulatory and operational framing within which data entities are evaluated and governed. A classification record such as CLAS-0003, bearing the label OWASP Risk Rating and a status of complete, may be referenced by a dataset entity through a points_to relationship, thereby linking the entity to an external risk taxonomy. Exit codes—493, 301, 581, 197—serve as machine-readable indicators of classification outcomes, each associated with a specific status state: failed, pending, or complete. The GDPR Data Category classification appears twice in the reference corpus, associated with exit codes 301 and 581 and statuses of pending and complete respectively, illustrating how the same classification scheme can yield divergent outcomes depending on the entity under evaluation. These classification records are not isolated annotations; they are referenced by dataset entities that sit within broader operational contexts—ml_training_run, regulatory_submission, cloud_storage_bucket, enterprise_data_catalog—each of which imposes its own governance requirements on the data it contains.

The interplay between these constructs—identifiers, attributes, types, lineage, classification, and status—forms a coherent provenance fabric that supports auditability, compliance, and operational transparency. When an entity such as DATA-0001 is linked to the reference PROVENANCE-MAP-V4 and classified under CLAS-0003, its attributes (including a checksum value of Checksum Algo 01 and a format designation of RFC-3339) are simultaneously anchored to a lineage path with measurable confidence and uncertainty, and situated within a regulatory context that carries its own exit codes and status indicators. This multi-layered referencing architecture ensures that no datum exists in isolation: every value is traceable to its source, typed according to schema conventions, categorized within governance frameworks, and assessed against quality metrics that quantify the reliability of its provenance chain.

**fact_lineage**

| id | lineage_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | 0.645 | 612.22 | 903.86 |
| TRAN-0002 | TRAN-0003 | 0.071 | 133.03 | 832.18 |
| TRAN-0003 | TRAN-0005 | 0.404 | 76.69 | 862.00 |
| TRAN-0004 | TRAN-0003 | 0.779 | 708.23 | 259.55 |
| TRAN-0005 | TRAN-0003 | 0.376 | 801.99 | 986.33 |
| TRAN-0006 | TRAN-0008 | 0.744 | 956.79 | 34.40 |

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |
| CLAS-0006 | FAIR Principle | 199 | running |