## Data Transaction Lifecycle Management

Organizations that move sensitive information across network boundaries must track every artifact from initiation through archival. A data transaction begins when a sender initiates a transfer, specifying the protocol, volume, and compliance requirements. The transfer is mediated by automated scripts running on dedicated servers, secured with encryption keys, and accompanied by digital signatures that bind the content to its origin. Audit trails record the provenance of each step, while the files themselves carry metadata about compression, storage location, and deletion status. This chapter describes the entities that compose this lifecycle, the relationships that bind them, and the analytical views that practitioners use to monitor integrity and compliance.

**Table `data_transactions`**

| data_transaction_id | transaction_id | timestamp | protocol | data_volume_bytes | status | compliance_standard | encryption_key_id | automated_script_id | audit_trail_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 2024-07-08T18:18:00 | OpenPGP | 15.45 | pending | IndustryRegulation | 1000 | 1 | 100 |
| 2 | 89509 | 2025-12-19T01:35:00 | S/MIME | 17.90 | encrypting | InternalPolicy | 1001 | 2 | 101 |
| 3 | 1186092 | 2022-05-03T08:52:00 | LegacyFileTransfer | 20.35 | transmitted | IndustryRegulation | 1002 | 3 | 102 |
| 4 | 9085243 | 2023-10-14T15:09:00 | Email | 22.80 | decrypted | InternalPolicy | 1003 | 4 | 103 |

A data transaction is the central event in the lifecycle. Each row captures a unique transfer identified by a business `transaction_id` such as `937738` or `1186092`, alongside a system-generated `data_transaction_id`. The `timestamp` field anchors the event in time — for example, `2024-07-08T18:18:00` for the first record. The `protocol` column records the transport mechanism, ranging from `OpenPGP` and `S/MIME` to `LegacyFileTransfer` and plain `Email`. The `data_volume_bytes` field, expressed in megabytes, quantifies the payload; values in the sample data span from `15.45` to `22.80`. The `status` column tracks the current phase of the transfer — `pending`, `encrypting`, `transmitted`, or `decrypted` — while `compliance_standard` indicates the regulatory framework, either `IndustryRegulation` or `InternalPolicy`. Each transaction is linked to an encryption key, an automated script, and an audit trail through foreign keys `encryption_key_id`, `automated_script_id`, and `audit_trail_id`.

**Table `data_files`**

| data_file_id | file_id | file_name | file_size_bytes | storage_location | is_encrypted | is_deleted_securely | compression_ratio | server_id | data_transaction_id | digital_signature_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard | 344.0 | distributed-storage-48 | false | true | 11.95 | 100 | 1 | 1000 | 2025-01-01 00:14:00 |
| 101 | state_et_5 | Legacy Framework | 1.05 | baseline-storage-49 | true | false | 15.90 | 101 | 2 | 1001 | 2025-02-06 03:14:00 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A | 540.0 | pilot-storage-50 | false | true | 19.85 | 102 | 3 | 1002 | 2025-03-11 06:14:00 |
| 103 | lu_tax_code_template_m22 | Seasonal Programme | 105.482 | extended-storage-51 | true | false | 23.80 | 103 | 4 | 1003 | 2025-04-16 09:14:00 |

Data files are the persistent artifacts produced or consumed by transactions. The `data_file_id` serves as the primary key, while `file_id` holds a human-readable or hashed identifier such as `68f46afd953b4de8824b596a1bff565c` or `state_et_5`. The `file_name` column provides a descriptive label — `Compact Standard`, `Legacy Framework`, `Regional Protocol A`, `Seasonal Programme` — and `file_size_bytes` records the uncompressed size, ranging from `105.482` to `540.0`. The `storage_location` field points to a storage tier such as `distributed-storage-48` or `baseline-storage-49`. Boolean flags `is_encrypted` and `is_deleted_securely` indicate whether the file is currently encrypted and whether it has been securely purged. The `compression_ratio` quantifies the space savings achieved, with values like `11.95` and `23.80`. Each file is associated with a `server_id` for hosting, a `data_transaction_id` for provenance, and a `digital_signature_id` for integrity verification. The `created_at` timestamp records when the file was first instantiated.

**Table `encryption_keys`**

| id | key_id | key_type | creation_date | expiration_date | is_revoked | managed_by_server | server_id | data_transaction_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 2087751 | Symmetric | 2022-01-13 | 2025-08-18 | true | primary-managed-64 | 100 | 1 |
| 1001 | 2618562 | Asymmetric | 2023-06-24 | 2022-01-02 | false | adaptive-managed-65 | 101 | 2 |
| 1002 | 8843769 | Public | 2024-11-08 | 2023-06-13 | true | distributed-managed-66 | 102 | 3 |
| 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private | 2025-04-19 | 2024-11-24 | false | baseline-managed-67 | 103 | 4 |

Encryption keys provide the cryptographic material that protects data at rest and in transit. The primary key `id` maps to a `key_id` such as `2087751` or `065525fa-8fb2-11eb-924d-9cd76263cbd0`. The `key_type` distinguishes between `Symmetric`, `Asymmetric`, `Public`, and `Private` keys. The `creation_date` and `expiration_date` define the key's validity window; note that in some records the expiration precedes the creation date, indicating a data anomaly that operators should investigate. The `is_revoked` flag marks keys that have been withdrawn from service — keys `1000` and `1002` are revoked, while `1001` and `1003` remain active. The `managed_by_server` column names the management infrastructure, such as `primary-managed-64` or `adaptive-managed-65`, and `server_id` links the key to the hosting server. The `data_transaction_id` ties the key to the transaction it protects.

**Table `automated_scripts`**

| id | script_id | script_name | platform | is_legacy | execution_frequency | server_id | data_transaction_id |
|---|---|---|---|---|---|---|---|
| 1 | 2618563 | Baseline Series D | Windows | true | OnDemand | 100 | 1 |
| 2 | 13683100-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | HP-UX | false | Scheduled | 101 | 2 |
| 3 | 5844258 | Adaptive Survey | Red Hat Enterprise Linux | true | Continuous | 102 | 3 |
| 4 | 9736895 | Primary Corridor A | Sun Solaris | false | OnDemand | 103 | 4 |

Automated scripts orchestrate the processing steps within a transaction. The `id` column is the primary key, and `script_id` holds the operational identifier, such as `2618563` or `13683100-8fcc-11eb-924d-9cd76263cbd0`. The `script_name` provides a human-readable label — `Baseline Series D`, `Distributed Assessment`, `Adaptive Survey`, `Primary Corridor A`. The `platform` column records the operating environment, including `Windows`, `HP-UX`, `Red Hat Enterprise Linux`, and `Sun Solaris`. The `is_legacy` flag identifies scripts running on deprecated infrastructure. The `execution_frequency` describes the scheduling model: `OnDemand`, `Scheduled`, or `Continuous`. Each script runs on a specific `server_id` and is invoked by a `data_transaction_id`.

**Table `servers`**

| id | server_id | server_name | operating_system | is_breached | location | data_file_id | encryption_key_id | automated_script_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model | Windows | true | extended-location-99 | 100 | 1000 | 1 |
| 101 | 1450637 | Primary Cluster | HP-UX | false | integrated-location-100 | 101 | 1001 | 2 |
| 102 | 4985152 | Composite Review D | Red Hat Enterprise Linux | true | seasonal-location-101 | 102 | 1002 | 3 |
| 103 | 9736887 | Compact Initiative | Sun Solaris | false | regional-location-102 | 103 | 1003 | 4 |

Servers are the physical or virtual hosts that execute scripts, store files, and manage keys. The `id` column is the primary key, and `server_id` holds the operational identifier, such as `911352d5dab64576b7a6da51aa69d76d` or `1450637`. The `server_name` provides a descriptive label — `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`. The `operating_system` column records the host OS, matching the platforms referenced in the automated scripts table. The `is_breached` flag indicates whether the server has experienced a security incident; servers `100` and `102` are marked breached, while `101` and `103` are not. The `location` field specifies the geographic or logical placement, such as `extended-location-99` or `integrated-location-100`. Each server hosts a `data_file_id`, manages an `encryption_key_id`, and runs an `automated_script_id`.

**Table `audit_trails`**

| id | trail_id | generated_timestamp | sender_identity | content_hash | is_verified | data_transaction_id | digital_signature_id |
|---|---|---|---|---|---|---|---|
| 100 | cad8432e-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-07T01:51:00 | legacy-sender-91 | integrated-content-40 | true | 1 | 1000 |
| 101 | 48753455 | 2024-07-18T08:08:00 | compact-sender-92 | seasonal-content-41 | false | 2 | 1001 |
| 102 | 7731879 | 2025-12-02T15:25:00 | composite-sender-93 | regional-content-42 | true | 3 | 1002 |
| 103 | 168539 | 2022-05-13T22:42:00 | primary-sender-94 | legacy-content-43 | false | 4 | 1003 |

Audit trails provide the immutable record of transaction provenance. The `id` column is the primary key, and `trail_id` holds the trace identifier, such as `cad8432e-8fcd-11eb-924d-9cd76263cbd0` or `48753455`. The `generated_timestamp` records when the trail entry was created, for example `2023-02-07T01:51:00`. The `sender_identity` identifies the originator, such as `legacy-sender-91` or `compact-sender-92`. The `content_hash` stores a checksum of the transferred content, with values like `integrated-content-40` and `seasonal-content-41`. The `is_verified` flag indicates whether the trail entry has been cryptographically validated. Each trail is linked to a `data_transaction_id` and a `digital_signature_id`.

**Table `digital_signatures`**

| id | signature_id | algorithm | signing_date | is_valid | data_file_id | encryption_key_id | audit_trail_id |
|---|---|---|---|---|---|---|---|
| 1000 | 20554289 | RSA | 2022-05-26T16:12:00 | true | 100 | 1000 | 100 |
| 1001 | 5844261 | DSA | 2023-10-10T23:29:00 | false | 101 | 1001 | 101 |
| 1002 | 1186081 | ECDSA | 2024-03-21T06:46:00 | true | 102 | 1002 | 102 |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA | 2025-08-05T13:03:00 | false | 103 | 1003 | 103 |

Digital signatures bind the integrity of a file or transaction to a cryptographic proof. The primary key `id` maps to a signature identifier, and each signature is associated with a `data_file_id` for the artifact it protects, an `encryption_key_id` for the key used in signing, and an `audit_trail_id` for the provenance record. The signature table completes the chain of trust: a file is signed, the signature is verified against a key, and the result is recorded in an audit trail.

**Table `transactions_files`**

| data_transaction_id | data_file_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `transactions_files` table resolves the many-to-many relationship between data transactions and data files. A single transaction may produce or consume multiple files, and a file may be referenced by multiple transactions. This junction table ensures that the provenance graph remains accurate even when files are reused across transfers.

The following views join these base tables to answer specific operational questions. Each view presents a different slice of the data, enabling practitioners to investigate relationships that span multiple entities.

**View `data_transaction_encryption_key_view`**

```sql
CREATE VIEW data_transaction_encryption_key_view AS
SELECT a.data_transaction_id, a.transaction_id, a.timestamp, a.protocol, b.id AS key_id, b.key_id AS key_key_id, b.key_type AS key_key_type
FROM data_transactions a JOIN encryption_keys b ON a.encryption_key_id = b.id;
```

| data_transaction_id | transaction_id | timestamp | protocol | key_id | key_key_id | key_key_type |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2024-07-08T18:18:00 | OpenPGP | 1000 | 2087751 | Symmetric |
| 2 | 89509 | 2025-12-19T01:35:00 | S/MIME | 1001 | 2618562 | Asymmetric |
| 3 | 1186092 | 2022-05-03T08:52:00 | LegacyFileTransfer | 1002 | 8843769 | Public |
| 4 | 9085243 | 2023-10-14T15:09:00 | Email | 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private |

This view answers the question: which encryption key protects which transaction, and what is the key's current status? For example, transaction `937738` (`data_transaction_id` 1) is protected by key `2087751` (`id` 1000), a Symmetric key that is currently revoked. Transaction `89509` (`data_transaction_id` 2) uses key `2618562` (`id` 1001), an Asymmetric key that remains active. Operators can use this view to identify transactions protected by revoked keys, which may require re-encryption.

**View `data_transaction_data_file_detail_view`**

```sql
CREATE VIEW data_transaction_data_file_detail_view AS
SELECT a.data_transaction_id, a.transaction_id, a.timestamp, b.data_file_id AS file_data_file_id, b.file_id AS file_file_id, b.file_name AS file_file_name
FROM data_transactions a
  JOIN transactions_files j ON j.data_transaction_id = a.data_transaction_id
  JOIN data_files b ON b.data_file_id = j.data_file_id;
```

| data_transaction_id | transaction_id | timestamp | file_data_file_id | file_file_id | file_file_name |
|---|---|---|---|---|---|
| 1 | 937738 | 2024-07-08T18:18:00 | 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard |
| 1 | 937738 | 2024-07-08T18:18:00 | 101 | state_et_5 | Legacy Framework |
| 2 | 89509 | 2025-12-19T01:35:00 | 101 | state_et_5 | Legacy Framework |
| 2 | 89509 | 2025-12-19T01:35:00 | 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A |
| 3 | 1186092 | 2022-05-03T08:52:00 | 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A |
| 3 | 1186092 | 2022-05-03T08:52:00 | 103 | lu_tax_code_template_m22 | Seasonal Programme |
| 4 | 9085243 | 2023-10-14T15:09:00 | 103 | lu_tax_code_template_m22 | Seasonal Programme |
| 4 | 9085243 | 2023-10-14T15:09:00 | 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard |

This view links transactions to the files they produced or consumed. Transaction `937738` (`data_transaction_id` 1) is associated with the file `Compact Standard` (`data_file_id` 100), stored at `distributed-storage-48`, with a compression ratio of `11.95`. Transaction `89509` (`data_transaction_id` 2) produced `Legacy Framework` (`data_file_id` 101), which is encrypted and stored at `baseline-storage-49` with a compression ratio of `15.90`. This view helps practitioners audit file storage patterns and compression efficiency across transactions.

**View `data_transaction_automated_script_view`**

```sql
CREATE VIEW data_transaction_automated_script_view AS
SELECT a.data_transaction_id, a.transaction_id, a.timestamp, a.protocol, b.id AS script_id, b.script_id AS script_script_id, b.script_name AS script_script_name
FROM data_transactions a JOIN automated_scripts b ON a.automated_script_id = b.id;
```

| data_transaction_id | transaction_id | timestamp | protocol | script_id | script_script_id | script_script_name |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2024-07-08T18:18:00 | OpenPGP | 1 | 2618563 | Baseline Series D |
| 2 | 89509 | 2025-12-19T01:35:00 | S/MIME | 2 | 13683100-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 3 | 1186092 | 2022-05-03T08:52:00 | LegacyFileTransfer | 3 | 5844258 | Adaptive Survey |
| 4 | 9085243 | 2023-10-14T15:09:00 | Email | 4 | 9736895 | Primary Corridor A |

This view reveals which automated script executed for each transaction. Transaction `937738` (`data_transaction_id` 1) was processed by `Baseline Series D` (`id` 1), an OnDemand script running on Windows and marked as legacy. Transaction `1186092` (`data_transaction_id` 3) used `Adaptive Survey` (`id` 3), a Continuous script on Red Hat Enterprise Linux, also flagged as legacy. The view enables operators to assess the impact of retiring legacy scripts by identifying all transactions that depend on them.

**View `data_transaction_audit_trail_view`**

```sql
CREATE VIEW data_transaction_audit_trail_view AS
SELECT a.data_transaction_id, a.transaction_id, a.timestamp, a.protocol, b.id AS trail_id, b.trail_id AS trail_trail_id, b.generated_timestamp AS trail_generated_timestamp
FROM data_transactions a JOIN audit_trails b ON a.audit_trail_id = b.id;
```

| data_transaction_id | transaction_id | timestamp | protocol | trail_id | trail_trail_id | trail_generated_timestamp |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2024-07-08T18:18:00 | OpenPGP | 100 | cad8432e-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-07T01:51:00 |
| 2 | 89509 | 2025-12-19T01:35:00 | S/MIME | 101 | 48753455 | 2024-07-18T08:08:00 |
| 3 | 1186092 | 2022-05-03T08:52:00 | LegacyFileTransfer | 102 | 7731879 | 2025-12-02T15:25:00 |
| 4 | 9085243 | 2023-10-14T15:09:00 | Email | 103 | 168539 | 2022-05-13T22:42:00 |

This view connects transactions to their audit trail entries. Transaction `937738` (`data_transaction_id` 1) has trail entry `cad8432e-8fcd-11eb-924d-9cd76263cbd0` (`id` 100), generated on `2023-02-07T01:51:00` by `legacy-sender-91`, with content hash `integrated-content-40` and verified status. Transaction `89509` (`data_transaction_id` 2) has trail entry `48753455` (`id` 101), generated by `compact-sender-92`, with content hash `seasonal-content-41` and an unverified status. This view is essential for compliance audits, as it surfaces any unverified trail entries that require attention.

**View `data_file_server_view`**

```sql
CREATE VIEW data_file_server_view AS
SELECT a.data_file_id, a.file_id, a.file_name, a.file_size_bytes, b.id AS server_id, b.server_id AS server_server_id, b.server_name AS server_server_name
FROM data_files a JOIN servers b ON a.server_id = b.id;
```

| data_file_id | file_id | file_name | file_size_bytes | server_id | server_server_id | server_server_name |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard | 344.0 | 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model |
| 101 | state_et_5 | Legacy Framework | 1.05 | 101 | 1450637 | Primary Cluster |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A | 540.0 | 102 | 4985152 | Composite Review D |
| 103 | lu_tax_code_template_m22 | Seasonal Programme | 105.482 | 103 | 9736887 | Compact Initiative |

This view shows which server hosts each data file. File `Compact Standard` (`data_file_id` 100) is hosted on server `Adaptive Model` (`id` 100), which runs Windows and is marked as breached. File `Regional Protocol A` (`data_file_id` 102) is hosted on server `Composite Review D` (`id` 102), also running a breached system. This view is critical for risk assessment: files hosted on breached servers may need to be migrated or re-encrypted.

**View `data_file_data_transaction_view`**

```sql
CREATE VIEW data_file_data_transaction_view AS
SELECT a.data_file_id, a.file_id, a.file_name, a.file_size_bytes, b.data_transaction_id AS transaction_data_transaction_id, b.transaction_id AS transaction_transaction_id, b.timestamp AS transaction_timestamp
FROM data_files a JOIN data_transactions b ON a.data_transaction_id = b.data_transaction_id;
```

| data_file_id | file_id | file_name | file_size_bytes | transaction_data_transaction_id | transaction_transaction_id | transaction_timestamp |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard | 344.0 | 1 | 937738 | 2024-07-08T18:18:00 |
| 101 | state_et_5 | Legacy Framework | 1.05 | 2 | 89509 | 2025-12-19T01:35:00 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A | 540.0 | 3 | 1186092 | 2022-05-03T08:52:00 |
| 103 | lu_tax_code_template_m22 | Seasonal Programme | 105.482 | 4 | 9085243 | 2023-10-14T15:09:00 |

This view provides the reverse mapping from files back to their originating transactions. File `Compact Standard` (`data_file_id` 100) was produced by transaction `937738` (`data_transaction_id` 1), while file `Seasonal Programme` (`data_file_id` 103) was produced by transaction `9085243` (`data_transaction_id` 4). This bidirectional linkage ensures that practitioners can trace a file back to its source transaction and vice versa.

**View `data_file_digital_signature_view`**

```sql
CREATE VIEW data_file_digital_signature_view AS
SELECT a.data_file_id, a.file_id, a.file_name, a.file_size_bytes, b.id AS signature_id, b.signature_id AS signature_signature_id, b.algorithm AS signature_algorithm
FROM data_files a JOIN digital_signatures b ON a.digital_signature_id = b.id;
```

| data_file_id | file_id | file_name | file_size_bytes | signature_id | signature_signature_id | signature_algorithm |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard | 344.0 | 1000 | 20554289 | RSA |
| 101 | state_et_5 | Legacy Framework | 1.05 | 1001 | 5844261 | DSA |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A | 540.0 | 1002 | 1186081 | ECDSA |
| 103 | lu_tax_code_template_m22 | Seasonal Programme | 105.482 | 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA |

This view links data files to their digital signatures. File `Compact Standard` (`data_file_id` 100) carries signature `1000`, file `Legacy Framework` (`data_file_id` 101) carries signature `1001`, and so on. Each signature provides cryptographic proof that the file has not been altered since signing. This view enables operators to verify the integrity of stored files by cross-referencing signatures with their corresponding content hashes in the audit trails.

**View `encryption_key_server_view`**

```sql
CREATE VIEW encryption_key_server_view AS
SELECT a.id, a.key_id, a.key_type, a.creation_date, b.id AS server_id, b.server_id AS server_server_id, b.server_name AS server_server_name
FROM encryption_keys a JOIN servers b ON a.server_id = b.id;
```

| id | key_id | key_type | creation_date | server_id | server_server_id | server_server_name |
|---|---|---|---|---|---|---|
| 1000 | 2087751 | Symmetric | 2022-01-13 | 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model |
| 1001 | 2618562 | Asymmetric | 2023-06-24 | 101 | 1450637 | Primary Cluster |
| 1002 | 8843769 | Public | 2024-11-08 | 102 | 4985152 | Composite Review D |
| 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private | 2025-04-19 | 103 | 9736887 | Compact Initiative |

This view shows which server manages each encryption key. Key `2087751` (`id` 1000) is managed by server `Adaptive Model` (`id` 100), key `2618562` (`id` 1001) by server `Primary Cluster` (`id` 101), key `8843769` (`id` 1002) by server `Composite Review D` (`id` 102), and key `065525fa-8fb2-11eb-924d-9cd76263cbd0` (`id` 1003) by server `Compact Initiative` (`id` 103). This view helps operators understand the key management topology and identify keys hosted on compromised infrastructure.

**View `encryption_key_data_transaction_view`**

```sql
CREATE VIEW encryption_key_data_transaction_view AS
SELECT a.id, a.key_id, a.key_type, a.creation_date, b.data_transaction_id AS transaction_data_transaction_id, b.transaction_id AS transaction_transaction_id, b.timestamp AS transaction_timestamp
FROM encryption_keys a JOIN data_transactions b ON a.data_transaction_id = b.data_transaction_id;
```

| id | key_id | key_type | creation_date | transaction_data_transaction_id | transaction_transaction_id | transaction_timestamp |
|---|---|---|---|---|---|---|
| 1000 | 2087751 | Symmetric | 2022-01-13 | 1 | 937738 | 2024-07-08T18:18:00 |
| 1001 | 2618562 | Asymmetric | 2023-06-24 | 2 | 89509 | 2025-12-19T01:35:00 |
| 1002 | 8843769 | Public | 2024-11-08 | 3 | 1186092 | 2022-05-03T08:52:00 |
| 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private | 2025-04-19 | 4 | 9085243 | 2023-10-14T15:09:00 |

This view provides the reverse mapping from encryption keys to the transactions they protect. Key `2087751` (`id` 1000) protects transaction `937738` (`data_transaction_id` 1), key `2618562` (`id` 1001) protects transaction `89509` (`data_transaction_id` 2), and so on. This view is useful for impact analysis: if a key is compromised, operators can quickly identify all transactions that relied on it.

**View `automated_script_server_view`**

```sql
CREATE VIEW automated_script_server_view AS
SELECT a.id, a.script_id, a.script_name, a.platform, b.id AS server_id, b.server_id AS server_server_id, b.server_name AS server_server_name
FROM automated_scripts a JOIN servers b ON a.server_id = b.id;
```

| id | script_id | script_name | platform | server_id | server_server_id | server_server_name |
|---|---|---|---|---|---|---|
| 1 | 2618563 | Baseline Series D | Windows | 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model |
| 2 | 13683100-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | HP-UX | 101 | 1450637 | Primary Cluster |
| 3 | 5844258 | Adaptive Survey | Red Hat Enterprise Linux | 102 | 4985152 | Composite Review D |
| 4 | 9736895 | Primary Corridor A | Sun Solaris | 103 | 9736887 | Compact Initiative |

This view shows which server executes each automated script. Script `Baseline Series D` (`id` 1) runs on server `Adaptive Model` (`id` 100), script `Distributed Assessment` (`id` 2) on server `Primary Cluster` (`id` 101), script `Adaptive Survey` (`id` 3) on server `Composite Review D` (`id` 102), and script `Primary Corridor A` (`id` 4) on server `Compact Initiative` (`id` 103). This view enables capacity planning and helps operators understand the distribution of workload across servers.

**View `automated_script_data_transaction_view`**

```sql
CREATE VIEW automated_script_data_transaction_view AS
SELECT a.id, a.script_id, a.script_name, a.platform, b.data_transaction_id AS transaction_data_transaction_id, b.transaction_id AS transaction_transaction_id, b.timestamp AS transaction_timestamp
FROM automated_scripts a JOIN data_transactions b ON a.data_transaction_id = b.data_transaction_id;
```

| id | script_id | script_name | platform | transaction_data_transaction_id | transaction_transaction_id | transaction_timestamp |
|---|---|---|---|---|---|---|
| 1 | 2618563 | Baseline Series D | Windows | 1 | 937738 | 2024-07-08T18:18:00 |
| 2 | 13683100-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | HP-UX | 2 | 89509 | 2025-12-19T01:35:00 |
| 3 | 5844258 | Adaptive Survey | Red Hat Enterprise Linux | 3 | 1186092 | 2022-05-03T08:52:00 |
| 4 | 9736895 | Primary Corridor A | Sun Solaris | 4 | 9085243 | 2023-10-14T15:09:00 |

This view links automated scripts to the transactions they process. Script `Baseline Series D` (`id` 1) was invoked by transaction `937738` (`data_transaction_id` 1), script `Distributed Assessment` (`id` 2) by transaction `89509` (`data_transaction_id` 2), and so on. This view helps operators assess the execution patterns of their scripts and identify any scripts that are underutilized or overburdened.

**View `server_data_file_view`**

```sql
CREATE VIEW server_data_file_view AS
SELECT a.id, a.server_id, a.server_name, a.operating_system, b.data_file_id AS file_data_file_id, b.file_id AS file_file_id, b.file_name AS file_file_name
FROM servers a JOIN data_files b ON a.data_file_id = b.data_file_id;
```

| id | server_id | server_name | operating_system | file_data_file_id | file_file_id | file_file_name |
|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model | Windows | 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard |
| 101 | 1450637 | Primary Cluster | HP-UX | 101 | state_et_5 | Legacy Framework |
| 102 | 4985152 | Composite Review D | Red Hat Enterprise Linux | 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A |
| 103 | 9736887 | Compact Initiative | Sun Solaris | 103 | lu_tax_code_template_m22 | Seasonal Programme |

This view provides the reverse mapping from servers to the files they host. Server `Adaptive Model` (`id` 100) hosts file `Compact Standard` (`data_file_id` 100), server `Primary Cluster` (`id` 101) hosts file `Legacy Framework` (`data_file_id` 101), and so on. This view is essential for storage management, as it allows operators to identify which files reside on which servers and plan migrations accordingly.

**View `server_encryption_key_view`**

```sql
CREATE VIEW server_encryption_key_view AS
SELECT a.id, a.server_id, a.server_name, a.operating_system, b.id AS key_id, b.key_id AS key_key_id, b.key_type AS key_key_type
FROM servers a JOIN encryption_keys b ON a.encryption_key_id = b.id;
```

| id | server_id | server_name | operating_system | key_id | key_key_id | key_key_type |
|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model | Windows | 1000 | 2087751 | Symmetric |
| 101 | 1450637 | Primary Cluster | HP-UX | 1001 | 2618562 | Asymmetric |
| 102 | 4985152 | Composite Review D | Red Hat Enterprise Linux | 1002 | 8843769 | Public |
| 103 | 9736887 | Compact Initiative | Sun Solaris | 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private |

This view provides the reverse mapping from servers to the encryption keys they manage. Server `Adaptive Model` (`id` 100) manages key `2087751` (`id` 1000), server `Primary Cluster` (`id` 101) manages key `2618562` (`id` 1001), and so on. This view helps operators understand the key management distribution and identify any single points of failure in the key management infrastructure.

**View `server_automated_script_view`**

```sql
CREATE VIEW server_automated_script_view AS
SELECT a.id, a.server_id, a.server_name, a.operating_system, b.id AS script_id, b.script_id AS script_script_id, b.script_name AS script_script_name
FROM servers a JOIN automated_scripts b ON a.automated_script_id = b.id;
```

| id | server_id | server_name | operating_system | script_id | script_script_id | script_script_name |
|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model | Windows | 1 | 2618563 | Baseline Series D |
| 101 | 1450637 | Primary Cluster | HP-UX | 2 | 13683100-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 102 | 4985152 | Composite Review D | Red Hat Enterprise Linux | 3 | 5844258 | Adaptive Survey |
| 103 | 9736887 | Compact Initiative | Sun Solaris | 4 | 9736895 | Primary Corridor A |

This view provides the reverse mapping from servers to the scripts they execute. Server `Adaptive Model` (`id` 100) executes script `Baseline Series D` (`id` 1), server `Primary Cluster` (`id` 101) executes script `Distributed Assessment` (`id` 2), and so on. This view enables operators to assess the computational load on each server and plan for scaling or decommissioning.

**View `audit_trail_data_transaction_view`**

```sql
CREATE VIEW audit_trail_data_transaction_view AS
SELECT a.id, a.trail_id, a.generated_timestamp, a.sender_identity, b.data_transaction_id AS transaction_data_transaction_id, b.transaction_id AS transaction_transaction_id, b.timestamp AS transaction_timestamp
FROM audit_trails a JOIN data_transactions b ON a.data_transaction_id = b.data_transaction_id;
```

| id | trail_id | generated_timestamp | sender_identity | transaction_data_transaction_id | transaction_transaction_id | transaction_timestamp |
|---|---|---|---|---|---|---|
| 100 | cad8432e-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-07T01:51:00 | legacy-sender-91 | 1 | 937738 | 2024-07-08T18:18:00 |
| 101 | 48753455 | 2024-07-18T08:08:00 | compact-sender-92 | 2 | 89509 | 2025-12-19T01:35:00 |
| 102 | 7731879 | 2025-12-02T15:25:00 | composite-sender-93 | 3 | 1186092 | 2022-05-03T08:52:00 |
| 103 | 168539 | 2022-05-13T22:42:00 | primary-sender-94 | 4 | 9085243 | 2023-10-14T15:09:00 |

This view provides the reverse mapping from audit trails to the transactions they document. Trail entry `cad8432e-8fcd-11eb-924d-9cd76263cbd0` (`id` 100) documents transaction `937738` (`data_transaction_id` 1), trail entry `48753455` (`id` 101) documents transaction `89509` (`data_transaction_id` 2), and so on. This view is essential for compliance reporting, as it allows operators to generate complete audit records for any transaction.

**View `audit_trail_digital_signature_view`**

```sql
CREATE VIEW audit_trail_digital_signature_view AS
SELECT a.id, a.trail_id, a.generated_timestamp, a.sender_identity, b.id AS signature_id, b.signature_id AS signature_signature_id, b.algorithm AS signature_algorithm
FROM audit_trails a JOIN digital_signatures b ON a.digital_signature_id = b.id;
```

| id | trail_id | generated_timestamp | sender_identity | signature_id | signature_signature_id | signature_algorithm |
|---|---|---|---|---|---|---|
| 100 | cad8432e-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-07T01:51:00 | legacy-sender-91 | 1000 | 20554289 | RSA |
| 101 | 48753455 | 2024-07-18T08:08:00 | compact-sender-92 | 1001 | 5844261 | DSA |
| 102 | 7731879 | 2025-12-02T15:25:00 | composite-sender-93 | 1002 | 1186081 | ECDSA |
| 103 | 168539 | 2022-05-13T22:42:00 | primary-sender-94 | 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA |

This view links audit trails to the digital signatures they reference. Trail entry `cad8432e-8fcd-11eb-924d-9cd76263cbd0` (`id` 100) references signature `1000`, trail entry `48753455` (`id` 101) references signature `1001`, and so on. This view enables operators to verify that every audit trail entry corresponds to a valid digital signature, ensuring the completeness of the chain of trust.

**View `digital_signature_data_file_view`**

```sql
CREATE VIEW digital_signature_data_file_view AS
SELECT a.id, a.signature_id, a.algorithm, a.signing_date, b.data_file_id AS file_data_file_id, b.file_id AS file_file_id, b.file_name AS file_file_name
FROM digital_signatures a JOIN data_files b ON a.data_file_id = b.data_file_id;
```

| id | signature_id | algorithm | signing_date | file_data_file_id | file_file_id | file_file_name |
|---|---|---|---|---|---|---|
| 1000 | 20554289 | RSA | 2022-05-26T16:12:00 | 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard |
| 1001 | 5844261 | DSA | 2023-10-10T23:29:00 | 101 | state_et_5 | Legacy Framework |
| 1002 | 1186081 | ECDSA | 2024-03-21T06:46:00 | 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA | 2025-08-05T13:03:00 | 103 | lu_tax_code_template_m22 | Seasonal Programme |

This view provides the reverse mapping from digital signatures to the files they protect. Signature `1000` protects file `Compact Standard` (`data_file_id` 100), signature `1001` protects file `Legacy Framework` (`data_file_id` 101), and so on. This view is useful for integrity verification: operators can confirm that every file has a corresponding signature and that no file has been left unsigned.

**View `digital_signature_encryption_key_view`**

```sql
CREATE VIEW digital_signature_encryption_key_view AS
SELECT a.id, a.signature_id, a.algorithm, a.signing_date, b.id AS key_id, b.key_id AS key_key_id, b.key_type AS key_key_type
FROM digital_signatures a JOIN encryption_keys b ON a.encryption_key_id = b.id;
```

| id | signature_id | algorithm | signing_date | key_id | key_key_id | key_key_type |
|---|---|---|---|---|---|---|
| 1000 | 20554289 | RSA | 2022-05-26T16:12:00 | 1000 | 2087751 | Symmetric |
| 1001 | 5844261 | DSA | 2023-10-10T23:29:00 | 1001 | 2618562 | Asymmetric |
| 1002 | 1186081 | ECDSA | 2024-03-21T06:46:00 | 1002 | 8843769 | Public |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA | 2025-08-05T13:03:00 | 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private |

This view links digital signatures to the encryption keys used in signing. Signature `1000` was created with key `2087751` (`id` 1000), signature `1001` with key `2618562` (`id` 1001), and so on. This view helps operators understand the relationship between signing keys and encryption keys, and identify any signatures created with revoked or expired keys.

**View `digital_signature_audit_trail_view`**

```sql
CREATE VIEW digital_signature_audit_trail_view AS
SELECT a.id, a.signature_id, a.algorithm, a.signing_date, b.id AS trail_id, b.trail_id AS trail_trail_id, b.generated_timestamp AS trail_generated_timestamp
FROM digital_signatures a JOIN audit_trails b ON a.audit_trail_id = b.id;
```

| id | signature_id | algorithm | signing_date | trail_id | trail_trail_id | trail_generated_timestamp |
|---|---|---|---|---|---|---|
| 1000 | 20554289 | RSA | 2022-05-26T16:12:00 | 100 | cad8432e-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-07T01:51:00 |
| 1001 | 5844261 | DSA | 2023-10-10T23:29:00 | 101 | 48753455 | 2024-07-18T08:08:00 |
| 1002 | 1186081 | ECDSA | 2024-03-21T06:46:00 | 102 | 7731879 | 2025-12-02T15:25:00 |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA | 2025-08-05T13:03:00 | 103 | 168539 | 2022-05-13T22:42:00 |

This view provides the reverse mapping from digital signatures to the audit trails they reference. Signature `1000` is referenced by trail entry `cad8432e-8fcd-11eb-924d-9cd76263cbd0` (`id` 100), signature `1001` by trail entry `48753455` (`id` 101), and so on. This view completes the chain of trust documentation, ensuring that every digital signature is accounted for in the audit trail.

## Synthesis

The data transaction lifecycle is a tightly coupled system of interdependent entities. Transactions initiate transfers, which are processed by automated scripts on servers, secured with encryption keys, and documented in audit trails. The resulting files carry digital signatures that bind their integrity to the cryptographic material managed by the infrastructure. The views presented in this chapter enable practitioners to navigate this complexity, answering questions about key status, file provenance, script execution, and compliance verification. By monitoring the relationships captured in these records, organizations can maintain the integrity, confidentiality, and auditability of their data transfers.