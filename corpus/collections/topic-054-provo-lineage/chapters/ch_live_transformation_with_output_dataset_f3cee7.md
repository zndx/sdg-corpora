---
chapter_id: ch_live_transformation_with_output_dataset_f3cee7
topic_id: 54
family: 05_provo_lineage
cited_terms: ['transformation_with_output_dataset', 'two_disjoint_artifacts', 'universal_combined_with_existential']
model: engine-refine
---

In enterprise data architectures, the identifier serves as the primary addressing mechanism, anchoring every entity to a stable, machine-readable key that persists across transformation lifecycles. Output datasets—labeled generically as Output Dataset Label 01 through Output Dataset Label 04—each carry a distinct category designation (Output Dataset Category 01 through 04) that classifies their provenance and governs downstream access policies. The transformation fact table records each execution against an output_dataset_key, establishing a foreign-key linkage to the dimension table where these categorical assignments reside; a single dataset such as DATA-0004 may accumulate multiple transformation records, as evidenced by three separate executions (DATA-0001, DATA-0002, DATA-0004) all resolving to the same output target.

**dim_output_dataset**

| id | output_dataset_label | output_dataset_category |
| --- | --- | --- |
| DATA-0001 | Output Dataset Label 01 | Output Dataset Category 01 |
| DATA-0002 | Output Dataset Label 02 | Output Dataset Category 02 |
| DATA-0003 | Output Dataset Label 03 | Output Dataset Category 03 |
| DATA-0004 | Output Dataset Label 04 | Output Dataset Category 04 |
| DATA-0005 | Output Dataset Label 05 | Output Dataset Category 05 |
| DATA-0006 | Output Dataset Label 06 | Output Dataset Category 06 |

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

The operational fidelity of each transformation is captured through three orthogonal metrics: duration_seconds, exit, and retry_count. Execution times span a wide range—from a brisk 150.01 seconds for a lightweight job to over 5,474 seconds for a compute-intensive pipeline—while exit codes (354, 220, 471, 302) encode non-zero termination conditions that signal resource exhaustion, permission failures, or data quality violations. The retry_count column quantifies resilience, with values ranging from 25 to 357 retries, indicating that certain transformations require substantial backoff-and-retry cycles before reaching a terminal state. These metrics, when correlated against the output dataset category, enable capacity planning and SLA compliance reporting.

**fact_transformation**

| id | output_dataset_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0004 | 2399.22 | 354 | 25 |
| DATA-0002 | DATA-0004 | 5474.59 | 220 | 357 |
| DATA-0003 | DATA-0005 | 150.01 | 471 | 150 |
| DATA-0004 | DATA-0004 | 5248.45 | 302 | 85 |
| DATA-0005 | DATA-0006 | 6668.88 | 184 | 484 |
| DATA-0006 | DATA-0004 | 777.01 | 996 | 445 |
| DATA-0007 | DATA-0005 | 6572.74 | 634 | 341 |

The attribute-value model decouples entity metadata from the entity itself, using attr and attr_type to define a schema-less property system. Each artifact—whether an etl-job, config-bundle, or data-pipeline-v4—carries typed attributes such as checksum (xsd:string), created_date (xsd:date), identifier (cco:DesignativeICE), and license (xsd:string). The entity column in the value tables references the artifact that owns the property, while attr_id points to the attribute definition, creating a tripartite join that reconstructs the full property graph. This design permits heterogeneous data types to coexist within a single logical model: date values like 2023-05-13 and 2024-02-28, integer counts such as 36 and 462, and freeform strings including the license identifier MPL-2.0 and the geographic region ap-south-2.

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |

The misc column functions as the universal value carrier across all attribute value tables, absorbing data of any type without schema enforcement at the storage layer. Whether holding a UUID (urn:uuid:9f2a), a hash digest (9d2b7a16), a semantic version, or a categorical label, the misc field preserves the original representation while the attr_type column in the definition table provides the interpretive context. This separation of value storage from type semantics is critical in environments where artifact properties evolve independently of the transformation pipeline that consumes them, ensuring that metadata changes do not require schema migrations.