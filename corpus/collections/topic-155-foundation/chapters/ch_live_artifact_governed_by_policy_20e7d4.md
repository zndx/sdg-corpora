---
chapter_id: ch_live_artifact_governed_by_policy_20e7d4
topic_id: 155
family: 01_foundation
cited_terms: ['artifact_governed_by_policy', 'attestation_min_one_signer', 'instrument_with_function']
model: engine-refine
---

The governance of computational artifacts rests upon a structured registry of identifiers, each anchoring a distinct entity within the compliance framework. Artifacts such as the `ml_training_dataset` (POLI-0001, 98,508,200 bytes, version 9), the `api_gateway_config` (POLI-0002, 750,925,585 bytes, version 8), the `payment_transaction_log` (POLI-0003, 14,439,485 bytes, version 10), and the `batch_ingestion_job` (POLI-0004, 765,223,054 bytes, version 3) are each assigned a unique identifier and tracked by version number and storage footprint. These metadata fields—size in bytes and semantic version—serve as immutable anchors for policy enforcement, ensuring that every governed artifact can be unambiguously referenced, compared across revisions, and audited against its declared footprint. The identifier scheme (POLI-0001 through POLI-0004) provides a stable key that persists regardless of content mutation, enabling downstream attestations and instrument bindings to resolve to a single authoritative entity.

**t_artifact_governed_by_policy**

| id | artifact | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | ml_training_dataset | 98508200 | 9 |
| POLI-0002 | api_gateway_config | 750925585 | 8 |
| POLI-0003 | payment_transaction_log | 14439485 | 10 |
| POLI-0004 | batch_ingestion_job | 765223054 | 3 |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

Attestations extend this identification model by coupling a human-readable description to a machine-resolvable identifier. The attestation `SIGN-0001` denotes a Chain of Custody Review, `SIGN-0002` a Security Baseline Validation, `SIGN-0003` another Chain of Custody Review, and `SIGN-0004` a SOC 2 Type II Audit. Each attestation entity is further characterized through an attribute-value architecture that separates schema from instance data. The attribute definitions—captured in the attribute registry—specify an `attr_name` (such as `duration_seconds`, `end_time`, `exit_code`, or `host_name`) and an `attr_type` drawn from a typed vocabulary including `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This separation ensures that the structural contract governing what properties an attestation may carry is decoupled from the actual values recorded at runtime, a design that supports schema evolution without invalidating historical records.

**t_attestation_min_one_signer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

The value storage layer implements a type-dispatched entity-attribute-value pattern, where each attribute type is materialized in its own value table. Decimal attributes such as `duration_seconds` are persisted in the decimal value table with values like 1355.00, 2257.11, 6713.34, and 6673.35, each row linking an `entity_id` (e.g., SIGN-0001) to an `attr_id` (e.g., SIGN-0001) and a typed `value`. Datetime attributes—`end_time` among them—reside in the datetime value table, recording timestamps such as 2023-01-30T09:27:18, 2023-11-17T23:13:16, 2024-10-31T01:25:16, and 2024-07-02T14:51:27. Integer attributes like `exit_code` are stored in the integer value table with values 392, 373, 567, and 384, while string-valued attributes such as `host_name` occupy the varchar value table, holding entries like node-b14, Log Level 02, review, and complete. The `entity_id` column in each value table references the attestation identifier, and the `attr_id` column references the attribute definition, forming a foreign-key chain that reconstructs the full attribute set for any given entity through a join across the type-specific tables.

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |

The same architectural pattern governs instrument records, where physical or logical instruments are bound to the functions they realize. The Keysight DSOX3024T (FUNC-0001), Thermo Q Exactive (FUNC-0002), Zygo NewView (FUNC-0003), and Agilent 5975C (FUNC-0004) each carry an identifier and are associated with a realized function—SIGN-0002, SIGN-0003, SIGN-0005, or SIGN-0005 respectively—creating a many-to-one mapping from instruments to attestation entities. The instrument attribute registry defines properties such as `checksum`, `created_date`, `identifier`, and `license`, with types including `xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string`. Values are again dispatched by type: date attributes like `created_date` store values such as 2024-09-19, 2023-09-07, 2024-09-12, and 2024-08-15; integer attributes hold values like 359, 4, 439, and 6; and varchar attributes record checksums (a3f9c21e), identifiers (ref-8842), licenses (MPL-2.0), and regions (us-east-1). This uniform treatment of instruments and attestations under a shared attribute-value schema enables cross-domain queries and consistent policy evaluation regardless of whether the subject is a software artifact, a compliance attestation, or a piece of measurement hardware.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | SIGN-0002 |
| FUNC-0002 | Thermo Q Exactive | SIGN-0003 |
| FUNC-0003 | Zygo NewView | SIGN-0005 |
| FUNC-0004 | Agilent 5975C | SIGN-0005 |
| FUNC-0005 | Agilent 5975C | SIGN-0002 |
| FUNC-0006 | Agilent 5975C | SIGN-0003 |

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |