## Normalizing the Secure Data Exchange Domain

The domain under examination models a secure data exchange pipeline in which data transactions are orchestrated across servers, protected by encryption keys, executed by automated scripts, and recorded in audit trails. Each transaction moves one or more data files, which are themselves signed and stored on specific servers. The relational schema captures this ecosystem through seven base tables and a rich set of materialized views that reconstruct domain facts from the normalized structure. The following sections walk through the entity types, their attributes, the foreign-key topology that binds them, and the views that answer concrete operational questions.

**Table `data_transactions`**

| data_transaction_id | transaction_id | timestamp | protocol | data_volume_bytes | status | compliance_standard | encryption_key_id | automated_script_id | audit_trail_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 2024-07-08T18:18:00 | OpenPGP | 15.45 | pending | IndustryRegulation | 1000 | 1 | 100 |
| 2 | 89509 | 2025-12-19T01:35:00 | S/MIME | 17.90 | encrypting | InternalPolicy | 1001 | 2 | 101 |
| 3 | 1186092 | 2022-05-03T08:52:00 | LegacyFileTransfer | 20.35 | transmitted | IndustryRegulation | 1002 | 3 | 102 |
| 4 | 9085243 | 2023-10-14T15:09:00 | Email | 22.80 | decrypted | InternalPolicy | 1003 | 4 | 103 |

The `data_transactions` table is the central event log of the exchange pipeline. Its primary key, `data_transaction_id`, uniquely identifies each transaction record. The business-level `transaction_id` (e.g. `937738`, `89509`) provides an external correlation handle. The `timestamp` column anchors the event in time, while `protocol` records the transport mechanism — values such as `OpenPGP`, `S/MIME`, `LegacyFileTransfer`, and `Email` appear in the data. The `data_volume_bytes` column quantifies the payload size (15.45, 17.90, 20.35, 22.80 in the sample rows), and `status` tracks the lifecycle stage with values like `pending`, `encrypting`, `transmitted`, and `decrypted`. The `compliance_standard` column constrains the transaction to a policy regime, taking values `IndustryRegulation` or `InternalPolicy`. Three foreign keys anchor the transaction to other entities: `encryption_key_id` references `encryption_keys.id`, `automated_script_id` references `automated_scripts.id`, and `audit_trail_id` references `audit_trails.id`. Each transaction is thus a hub connecting to exactly one encryption key, one automated script, and one audit trail.

**Table `data_files`**

| data_file_id | file_id | file_name | file_size_bytes | storage_location | is_encrypted | is_deleted_securely | compression_ratio | server_id | data_transaction_id | digital_signature_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Compact Standard | 344.0 | distributed-storage-48 | false | true | 11.95 | 100 | 1 | 1000 | 2025-01-01 00:14:00 |
| 101 | state_et_5 | Legacy Framework | 1.05 | baseline-storage-49 | true | false | 15.90 | 101 | 2 | 1001 | 2025-02-06 03:14:00 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Protocol A | 540.0 | pilot-storage-50 | false | true | 19.85 | 102 | 3 | 1002 | 2025-03-11 06:14:00 |
| 103 | lu_tax_code_template_m22 | Seasonal Programme | 105.482 | extended-storage-51 | true | false | 23.80 | 103 | 4 | 1003 | 2025-04-16 09:14:00 |

The `data_files` table stores the individual files that participate in transactions. Its primary key is `data_file_id`, and the `file_id` column holds a secondary identifier — in the sample data these are UUIDs such as `68f46afd953b4de8824b596a1bff565c` and `922b9d78-9bad-11eb-a8a2-19ed5c03f8d3`, as well as shorter strings like `state_et_5`. The `file_name` column carries human-readable labels (`Compact Standard`, `Legacy Framework`, `Regional Protocol A`, `Seasonal Programme`). The `file_size_bytes` column records the file's byte count, while `storage_location` indicates where the file resides (e.g. `distributed-storage-48`, `baseline-storage-49`). Boolean flags `is_encrypted` and `is_deleted_securely` capture the file's security posture, and `compression_ratio` quantifies the compression applied (11.95, 15.90, 19.85, 23.80 in the sample). The `created_at` timestamp records when the file was provisioned. Three foreign keys bind the file to the wider model: `server_id` references `servers.id`, `data_transaction_id` references `data_transactions.data_transaction_id`, and `digital_signature_id` references `digital_signatures.id`.

**Table `encryption_keys`**

| id | key_id | key_type | creation_date | expiration_date | is_revoked | managed_by_server | server_id | data_transaction_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 2087751 | Symmetric | 2022-01-13 | 2025-08-18 | true | primary-managed-64 | 100 | 1 |
| 1001 | 2618562 | Asymmetric | 2023-06-24 | 2022-01-02 | false | adaptive-managed-65 | 101 | 2 |
| 1002 | 8843769 | Public | 2024-11-08 | 2023-06-13 | true | distributed-managed-66 | 102 | 3 |
| 1003 | 065525fa-8fb2-11eb-924d-9cd76263cbd0 | Private | 2025-04-19 | 2024-11-24 | false | baseline-managed-67 | 103 | 4 |

The `encryption_keys` table manages the cryptographic material used to protect data in transit. Its primary key is `id`, and `key_id` provides an external key handle (e.g. `2087751`, `2618562`, `8843769`, or the UUID `065525fa-8fb2-11eb-924d-9cd76263cbd0`). The `key_type` column classifies the key as `Symmetric`, `Asymmetric`, `Public`, or `Private`. The `creation_date` and `expiration_date` columns define the key's validity window, while `is_revoked` indicates whether the key has been invalidated. The `managed_by_server` column names the management tier (e.g. `primary-managed-64`, `adaptive-managed-65`, `distributed-managed-66`, `baseline-managed-67`). Two foreign keys link the key to its operational context: `server_id` references `servers.id`, and `data_transaction_id` references `data_transactions.data_transaction_id`.

**Table `automated_scripts`**

| id | script_id | script_name | platform | is_legacy | execution_frequency | server_id | data_transaction_id |
|---|---|---|---|---|---|---|---|
| 1 | 2618563 | Baseline Series D | Windows | true | OnDemand | 100 | 1 |
| 2 | 13683100-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | HP-UX | false | Scheduled | 101 | 2 |
| 3 | 5844258 | Adaptive Survey | Red Hat Enterprise Linux | true | Continuous | 102 | 3 |
| 4 | 9736895 | Primary Corridor A | Sun Solaris | false | OnDemand | 103 | 4 |

The `automated_scripts` table catalogs the scripts that execute data exchange operations. Its primary key is `id`, and `script_id` holds an external script identifier (e.g. `2618563`, `13683100-8fcc-11eb-924d-9cd76263cbd0`). The `script_name` column provides a descriptive label (`Baseline Series D`, `Distributed Assessment`, `Adaptive Survey`, `Primary Corridor A`). The `platform` column records the operating system on which the script runs (`Windows`, `HP-UX`, `Red Hat Enterprise Linux`, `Sun Solaris`), and `is_legacy` is a boolean flag. The `execution_frequency` column constrains how often the script runs, with values `OnDemand`, `Scheduled`, or `Continuous`. Two foreign keys bind the script to its execution context: `server_id` references `servers.id`, and `data_transaction_id` references `data_transactions.data_transaction_id`.

**Table `servers`**

| id | server_id | server_name | operating_system | is_breached | location | data_file_id | encryption_key_id | automated_script_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 911352d5dab64576b7a6da51aa69d76d | Adaptive Model | Windows | true | extended-location-99 | 100 | 1000 | 1 |
| 101 | 1450637 | Primary Cluster | HP-UX | false | integrated-location-100 | 101 | 1001 | 2 |
| 102 | 4985152 | Composite Review D | Red Hat Enterprise Linux | true | seasonal-location-101 | 102 | 1002 | 3 |
| 103 | 9736887 | Compact Initiative | Sun Solaris | false | regional-location-102 | 103 | 1003 | 4 |

The `servers` table represents the compute infrastructure hosting files, keys, and scripts. Its primary key is `id`, and `server_id` provides an external server handle (e.g. `911352d5dab64576b7a6da51aa69d76d`, `1450637`). The `server_name` column carries a human-readable name (`Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`). The `operating_system` column records the OS (`Windows`, `HP-UX`, `Red Hat Enterprise Linux`, `Sun Solaris`), and `is_breached` flags whether the server has experienced a security incident. The `location` column names the deployment site (e.g. `extended-location-99`, `integrated-location-100`). Three foreign keys link the server to the entities it hosts: `data_file_id` references `data_files.data_file_id`, `encryption_key_id` references `encryption_keys.id`, and `automated_script_id` references `automated_scripts.id`.

**Table `audit_trails`**

| id | trail_id | generated_timestamp | sender_identity | content_hash | is_verified | data_transaction_id | digital_signature_id |
|---|---|---|---|---|---|---|---|
| 100 | cad8432e-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-07T01:51:00 | legacy-sender-91 | integrated-content-40 | true | 1 | 1000 |
| 101 | 48753455 | 2024-07-18T08:08:00 | compact-sender-92 | seasonal-content-41 | false | 2 | 1001 |
| 102 | 7731879 | 2025-12-02T15:25:00 | composite-sender-93 | regional-content-42 | true | 3 | 1002 |
| 103 | 168539 | 2022-05-13T22:42:00 | primary-sender-94 | legacy-content-43 | false | 4 | 1003 |

The `audit_trails` table records the provenance and integrity of each transaction. Its primary key is `id`, and `trail_id` holds an external trail identifier (e.g. `cad8432e-8fcd-11eb-924d-9cd76263cbd0`, `48753455`). The `generated_timestamp` column records when the trail entry was created, and `sender_identity` identifies the originator (e.g. `legacy-sender-91`, `compact-sender-92`). The `content_hash` column stores an integrity digest (`integrated-content-40`, `seasonal-content-41`, `regional-content-42`, `legacy-content-43`), while `is_verified` indicates whether the trail has been cryptographically validated. Two foreign keys bind the trail to its transaction and signature: `data_transaction_id` references `data_transactions.data_transaction_id`, and `digital_signature_id` references `digital_signatures.id`.

**Table `digital_signatures`**

| id | signature_id | algorithm | signing_date | is_valid | data_file_id | encryption_key_id | audit_trail_id |
|---|---|---|---|---|---|---|---|
| 1000 | 20554289 | RSA | 2022-05-26T16:12:00 | true | 100 | 1000 | 100 |
| 1001 | 5844261 | DSA | 2023-10-10T23:29:00 | false | 101 | 1001 | 101 |
| 1002 | 1186081 | ECDSA | 2024-03-21T06:46:00 | true | 102 | 1002 | 102 |
| 1003 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | RSA | 2025-08-05T13:03:00 | false | 103 | 1003 | 103 |

The `digital_signatures` table stores the cryptographic signatures that authenticate data files and encryption keys. Its primary key is `signature_id`, and `signature_value` holds the actual signature bytes or hash. The `algorithm` column records the signing algorithm used (e.g. `RSA`, `ECDSA`), while `signed_at` timestamps the signing event. The `verified` boolean indicates whether the signature has been validated. The `data_file_id` foreign key references `data_files.data_file_id`, linking each signature to the file it authenticates.

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

The `transactions_files` table is a junction table that resolves the many-to-many relationship between `data_transactions` and `data_files`. Its composite primary key consists of `data_transaction_id` and `data_file_id`, each of which is a foreign key referencing the respective parent table. This table allows a single transaction to carry multiple files and a single file to participate in multiple transactions, breaking the one-to-one constraint that the `data_file_id` column in `data_files` would otherwise impose.

The foreign-key topology of the schema reveals a deliberately interconnected design. The `data_transactions` table serves as a central hub, with foreign keys pointing to `encryption_keys`, `automated_scripts`, and `audit_trails`. The `data_files` table links to `servers`, `data_transactions`, and `digital_signatures`. The `encryption_keys` and `automated_scripts` tables each reference both `servers` and `data_transactions`, creating a diamond pattern where the transaction and server are the two apex entities. The `servers` table in turn references `data_files`, `encryption_keys`, and `automated_scripts`, forming reciprocal relationships that allow queries to traverse the graph in either direction. The `audit_trails` table connects to `data_transactions` and `digital_signatures`, while `digital_signatures` connects back to `data_files`. This topology ensures that every domain fact — a transaction, a file, a key, a script, a server, an audit trail, or a signature — can be reached from any other through a short chain of joins.

The materialized views reconstruct domain facts by joining the normalized tables along these foreign-key paths. Each view answers a specific operational question by denormalizing a subset of the schema.

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

This view joins `data_transactions` to `encryption_keys` on `data_transactions.encryption_key_id = encryption_keys.id`. It answers the question: "What encryption key was used for each transaction?" Reading the sample data, transaction `937738` (status `pending`, protocol `OpenPGP`) is associated with key `2087751` of type `Symmetric`, created on `2022-01-13` and revoked. Transaction `89509` (status `encrypting`, protocol `S/MIME`) uses key `2618562` of type `Asymmetric`, which is not revoked.

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

This view joins `data_transactions` to `data_files` on `data_transactions.data_transaction_id = data_files.data_transaction_id`. It answers: "Which files are associated with each transaction?" Transaction `937738` carries file `Compact Standard` (344.0 bytes, stored at `distributed-storage-48`, not encrypted). Transaction `89509` carries file `Legacy Framework` (1.05 bytes, stored at `baseline-storage-49`, encrypted).

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

This view joins `data_transactions` to `automated_scripts` on `data_transactions.automated_script_id = automated_scripts.id`. It answers: "Which script executes each transaction?" Transaction `937738` is executed by script `Baseline Series D` on `Windows` with `OnDemand` frequency. Transaction `89509` is executed by script `Distributed Assessment` on `HP-UX` with `Scheduled` frequency.

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

This view joins `data_transactions` to `audit_trails` on `data_transactions.audit_trail_id = audit_trails.id`. It answers: "What audit trail entry corresponds to each transaction?" Transaction `937738` has trail `cad8432e-8fcd-11eb-924d-9cd76263cbd0` generated by `legacy-sender-91` with verified content hash `integrated-content-40`. Transaction `89509` has trail `48753455` generated by `compact-sender-92` with unverified hash `seasonal-content-41`.

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

This view joins `data_files` to `servers` on `data_files.server_id = servers.id`. It answers: "On which server is each file hosted?" File `Compact Standard` (data_file_id `100`) is hosted on server `Adaptive Model` (`911352d5dab64576b7a6da51aa69d76d`), which runs `Windows` and has been breached. File `Legacy Framework` (data_file_id `101`) is hosted on server `Primary Cluster` (`1450637`), which runs `HP-UX` and has not been breached.

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

This view joins `data_files` to `data_transactions` on `data_files.data_transaction_id = data_transactions.data_transaction_id`. It answers: "Which transaction does each file belong to?" File `Compact Standard` belongs to transaction `937738` (protocol `OpenPGP`, status `pending`). File `Legacy Framework` belongs to transaction `89509` (protocol `S/MIME`, status `encrypting`).

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

This view joins `data_files` to `digital_signatures` on `data_files.digital_signature_id = digital_signatures.signature_id`. It answers: "What digital signature authenticates each file?" File `Compact Standard` is signed with signature `1000`, and file `Legacy Framework` is signed with signature `1001`.

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

This view joins `encryption_keys` to `servers` on `encryption_keys.server_id = servers.id`. It answers: "Which server manages each encryption key?" Key `2087751` (type `Symmetric`) is managed by server `Adaptive Model` (`911352d5dab64576b7a6da51aa69d76d`). Key `2618562` (type `Asymmetric`) is managed by server `Primary Cluster` (`1450637`).

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

This view joins `encryption_keys` to `data_transactions` on `encryption_keys.data_transaction_id = data_transactions.data_transaction_id`. It answers: "Which transaction uses each encryption key?" Key `2087751` is used by transaction `937738` (protocol `OpenPGP`). Key `2618562` is used by transaction `89509` (protocol `S/MIME`).

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

This view joins `automated_scripts` to `servers` on `automated_scripts.server_id = servers.id`. It answers: "Which server runs each automated script?" Script `Baseline Series D` runs on server `Adaptive Model` (`911352d5dab64576b7a6da51aa69d76d`). Script `Distributed Assessment` runs on server `Primary Cluster` (`1450637`).

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

This view joins `automated_scripts` to `data_transactions` on `automated_scripts.data_transaction_id = data_transactions.data_transaction_id`. It answers: "Which transaction is executed by each script?" Script `Baseline Series D` executes transaction `937738` (protocol `OpenPGP`, status `pending`). Script `Distributed Assessment` executes transaction `89509` (protocol `S/MIME`, status `encrypting`).

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

This view joins `servers` to `data_files` on `servers.data_file_id = data_files.data_file_id`. It answers: "Which file is stored on each server?" Server `Adaptive Model` stores file `Compact Standard` (344.0 bytes, not encrypted). Server `Primary Cluster` stores file `Legacy Framework` (1.05 bytes, encrypted).

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

This view joins `servers` to `encryption_keys` on `servers.encryption_key_id = encryption_keys.id`. It answers: "Which encryption key is hosted on each server?" Server `Adaptive Model` hosts key `2087751` (type `Symmetric`, revoked). Server `Primary Cluster` hosts key `2618562` (type `Asymmetric`, not revoked).

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

This view joins `servers` to `automated_scripts` on `servers.automated_script_id = automated_scripts.id`. It answers: "Which script is deployed on each server?" Server `Adaptive Model` deploys script `Baseline Series D` (platform `Windows`, legacy `true`). Server `Primary Cluster` deploys script `Distributed Assessment` (platform `HP-UX`, legacy `false`).

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

This view joins `audit_trails` to `data_transactions` on `audit_trails.data_transaction_id = data_transactions.data_transaction_id`. It answers: "Which transaction does each audit trail record?" Trail `cad8432e-8fcd-11eb-924d-9cd76263cbd0` records transaction `937738` (protocol `OpenPGP`). Trail `48753455` records transaction `89509` (protocol `S/MIME`).

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

This view joins `audit_trails` to `digital_signatures` on `audit_trails.digital_signature_id = digital_signatures.signature_id`. It answers: "Which digital signature is referenced by each audit trail?" Trail `cad8432e-8fcd-11eb-924d-9cd76263cbd0` references signature `1000`. Trail `48753455` references signature `1001`.

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

This view joins `digital_signatures` to `data_files` on `digital_signatures.data_file_id = data_files.data_file_id`. It answers: "Which file is authenticated by each digital signature?" Signature `1000` authenticates file `Compact Standard` (data_file_id `100`). Signature `1001` authenticates file `Legacy Framework` (data_file_id `101`).

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

This view joins `digital_signatures` to `encryption_keys` on `digital_signatures.encryption_key_id = encryption_keys.id`. It answers: "Which encryption key is signed by each digital signature?" Signature `1000` signs key `2087751` (type `Symmetric`). Signature `1001` signs key `2618562` (type `Asymmetric`).

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

This view joins `digital_signatures` to `audit_trails` on `digital_signatures.signature_id = audit_trails.digital_signature_id`. It answers: "Which audit trail references each digital signature?" Signature `1000` is referenced by trail `cad8432e-8fcd-11eb-924d-9cd76263cbd0` (sender `legacy-sender-91`). Signature `1001` is referenced by trail `48753455` (sender `compact-sender-92`).

The schema's design reflects a domain where every operational artifact — a transaction, a file, a key, a script, a server, an audit trail, or a signature — is independently modeled as a first-class entity with its own lifecycle and attributes. Foreign keys encode the relationships between these entities, and the junction table `transactions_files` resolves the many-to-many cardinality between transactions and files. The materialized views then denormalize this structure along specific foreign-key paths, producing flat result sets that answer concrete operational questions without requiring the application to construct joins at query time. This separation of concerns — normalized storage for integrity, denormalized views for query performance — is a standard pattern in data warehousing and operational analytics, and it serves the secure data exchange domain well by keeping the schema both correct and accessible.