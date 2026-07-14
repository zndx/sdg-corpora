The domain captures the operational telemetry of a small satellite constellation named LignoSat, where amateur radio ground stations transmit uplink signals to orbiting satellites, which in turn relay downlink signals back to ground stations; between these radio hops, messages are extracted, classified, and stored. The relational model normalizes this workflow into six base tables that separate the actors (ground stations, satellites), the radio events (uplink and downlink signals), the payload (extracted messages), and the regulatory layer (communication certificates). Foreign keys bind the tables into a directed graph of satellite operations, and a suite of twelve views materializes the most common join paths so that analysts can query domain facts without writing joins by hand.

## Base Tables and Their Normalized Roles

The ground station registry lives in `amateur_radio_stations`, whose primary key `id` is an integer surrogate, while the human-readable `call_sign` (for example, `seasonal-call-77` or `regional-call-78`) and the optional `ssid` suffix together form the amateur-radio identity. Each row also carries a `location_qth` (the Maidenhead-style grid locator such as `baseline-location-73`), a `region_qra` (the ITU region code like `integrated-region-76`), a `status` column that enumerates `active`, `inactive`, or `certified`, and two foreign keys: `signal_id` points back to the uplink signal that the station originated, and `certificate_id` points to the regulatory certificate that authorizes the station's transmissions.

**Table `amateur_radio_stations`**

| id | call_sign | ssid | location_qth | region_qra | status | signal_id | certificate_id |
|---|---|---|---|---|---|---|---|
| 1 | seasonal-call-77 | 16 | baseline-location-73 | integrated-region-76 | active | 317 | 778563 |
| 2 | regional-call-78 | 27 | pilot-location-74 | seasonal-region-77 | inactive | 6564371 | 7119762 |
| 3 | legacy-call-79 | 38 | extended-location-75 | regional-region-78 | certified | 4463669 | 22106999 |
| 4 | compact-call-80 | 49 | integrated-location-76 | legacy-region-79 | active | 6969425 | 2986238 |

Uplink events are recorded in `ligno_sat_uplink_signals`. Its primary key `signal_id` is a string or integer identifier that doubles as a foreign key into `amateur_radio_stations.signal_id` and `ligno_sats.signal_id`, creating a triangular linkage between station, satellite, and signal. The remaining columns describe the radio event: `timestamp` (e.g. `2024-07-08T18:18:00`), `frequency` in gigahertz (values such as `10.70` or `24.80`), `protocol_version` (a categorical label like `legacy-protocol-43`), and `message_content` (a short descriptor such as `composite-message-21`). Two additional foreign keys, `amateur_radio_station_id` and `satellite_id`, explicitly reference the ground station and the satellite that participated in the uplink, while `extracted_message_id` points to the message that was recovered from the signal.

**Table `ligno_sat_uplink_signals`**

| signal_id | timestamp | frequency | protocol_version | message_content | amateur_radio_station_id | satellite_id | extracted_message_id |
|---|---|---|---|---|---|---|---|
| 317 | 2024-07-08T18:18:00 | 10.70 | legacy-protocol-43 | composite-message-21 | 1 | id_18 | 1 |
| 6564371 | 2025-12-19T01:35:00 | 15.40 | compact-protocol-44 | primary-message-22 | 2 | 884366 | 2 |
| 4463669 | 2022-05-03T08:52:00 | 20.10 | composite-protocol-45 | adaptive-message-23 | 3 | 69447 | 3 |
| 6969425 | 2023-10-14T15:09:00 | 24.80 | primary-protocol-46 | distributed-message-24 | 4 | lu_tax_code_template_m_I_2_6 | 4 |

The satellite fleet is catalogued in `ligno_sats`. Its primary key `satellite_id` is a string identifier (for instance, `id_18` or the longer `lu_tax_code_template_m_I_2_6`). Each satellite row stores `orbit_type` (e.g. `distributed-orbit-18`), `memory_capacity` as an integer (values range from `8` to `17` in the sample), `downlink_mode` (either `cw` or `fm_packet`), and `status` (one of `operational`, `maintenance`, or `decommissioned`). The foreign key `signal_id` links the satellite to its most recent uplink, and `ligno_sat_downlink_signal_id` links it to the corresponding downlink record.

**Table `ligno_sats`**

| satellite_id | orbit_type | memory_capacity | downlink_mode | status | signal_id | ligno_sat_downlink_signal_id |
|---|---|---|---|---|---|---|
| id_18 | distributed-orbit-18 | 8 | cw | operational | 317 | 1000 |
| 884366 | baseline-orbit-19 | 11 | fm_packet | maintenance | 6564371 | 1001 |
| 69447 | pilot-orbit-20 | 14 | cw | decommissioned | 4463669 | 1002 |
| lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 | fm_packet | operational | 6969425 | 1003 |

Downlink signals are captured in `ligno_sat_downlink_signals`. Its primary key `id` is an integer (e.g. `1000` through `1003`), and the column `downlink_id` is a secondary identifier (such as `id_5` or `5006448`). The `timestamp` and `downlink_type` (again `cw` or `fm_packet`) mirror the uplink schema. `call_signs_included` records which ground station call signs were addressed in the downlink (e.g. `legacy-call-73`), and `message_count` is an integer (values like `4`, `100`, `17`, `9`). Foreign keys `satellite_id`, `amateur_radio_station_id`, and `extracted_message_id` tie the downlink to the satellite, the receiving ground station, and the extracted message respectively.

**Table `ligno_sat_downlink_signals`**

| id | downlink_id | timestamp | downlink_type | call_signs_included | message_count | satellite_id | amateur_radio_station_id | extracted_message_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | id_5 | 2024-07-08T18:18:00 | cw | legacy-call-73 | 4 | id_18 | 1 | 1 |
| 1001 | 5006448 | 2025-12-19T01:35:00 | fm_packet | compact-call-74 | 100 | 884366 | 2 | 2 |
| 1002 | 2986243 | 2022-05-03T08:52:00 | cw | composite-call-75 | 17 | 69447 | 3 | 3 |
| 1003 | 937725 | 2023-10-14T15:09:00 | fm_packet | primary-call-76 | 9 | lu_tax_code_template_m_I_2_6 | 4 | 4 |

Extracted messages are stored in `extracted_messages`. The surrogate primary key `id` (integers `1`–`4`) is distinct from the external `message_id` (a string such as `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` or `state_uk_4`). The `message_type` column classifies the payload as `QTH`, `QRA`, or `other`; `content` holds the actual text (e.g. `adaptive-content-83`). The `extraction_timestamp` records when the message was decoded, `storage_status` enumerates `stored`, `collected`, or `deleted`, and `signal_id`, `satellite_id`, and `ligno_sat_downlink_signal_id` are foreign keys back to the originating uplink, the satellite, and the downlink that carried the message. Audit columns `created_at` and `updated_at` store `TIMESTAMP` values such as `2025-01-01 00:14:00`.

**Table `extracted_messages`**

| id | message_id | message_type | content | extraction_timestamp | storage_status | signal_id | satellite_id | ligno_sat_downlink_signal_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH | adaptive-content-83 | 2024-07-17T18:42:00 | stored | 317 | id_18 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | state_uk_4 | QRA | distributed-content-84 | 2025-12-01T01:59:00 | collected | 6564371 | 884366 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1250194 | other | baseline-content-85 | 2022-05-12T08:16:00 | deleted | 4463669 | 69447 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6969416 | QTH | pilot-content-86 | 2023-10-23T15:33:00 | stored | 6969425 | lu_tax_code_template_m_I_2_6 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Regulatory oversight is modelled in `communication_certificates`. Its primary key `certificate_id` is an integer (e.g. `778563` or `22106999`). The columns `issue_date` and `valid_until` define the certificate's validity window (for example, issued `2023-02-01` and valid until `2023-06-09`). `communication_type` mirrors the radio mode (`cw` or `fm_packet`), and `status` is one of `issued`, `revoked`, or `expired`. Foreign keys `amateur_radio_station_id` and `signal_id` bind the certificate to the ground station and the uplink signal it authorizes.

**Table `communication_certificates`**

| certificate_id | issue_date | valid_until | communication_type | status | amateur_radio_station_id | signal_id |
|---|---|---|---|---|---|---|
| 778563 | 2023-02-01 | 2023-06-09 | cw | issued | 1 | 317 |
| 7119762 | 2024-07-12 | 2024-11-20 | fm_packet | revoked | 2 | 6564371 |
| 22106999 | 2025-12-23 | 2025-04-04 | cw | expired | 3 | 4463669 |
| 2986238 | 2022-05-07 | 2022-09-15 | fm_packet | issued | 4 | 6969425 |

## Views: Materialized Join Paths

Each view is a `SELECT` that joins two or three base tables to answer a specific operational question. The following sections describe what each view returns and illustrate the result with concrete rows.

The view `v_amateur_radio_station_ligno_sat_uplink_signal` joins `amateur_radio_stations` to `ligno_sat_uplink_signals` on `amateur_radio_stations.id = ligno_sat_uplink_signals.amateur_radio_station_id`. It answers the question "which uplink signals did each ground station transmit?" A sample row shows station `seasonal-call-77` (id `1`) having transmitted signal `317` at frequency `10.70` GHz on `2024-07-08T18:18:00`.

**View `v_amateur_radio_station_ligno_sat_uplink_signal`**

```sql
CREATE VIEW v_amateur_radio_station_ligno_sat_uplink_signal AS
SELECT a.id, a.call_sign, a.ssid, a.location_qth, b.signal_id AS signal_signal_id, b.timestamp AS signal_timestamp, b.frequency AS signal_frequency
FROM amateur_radio_stations a JOIN ligno_sat_uplink_signals b ON a.signal_id = b.signal_id;
```

| id | call_sign | ssid | location_qth | signal_signal_id | signal_timestamp | signal_frequency |
|---|---|---|---|---|---|---|
| 1 | seasonal-call-77 | 16 | baseline-location-73 | 317 | 2024-07-08T18:18:00 | 10.70 |
| 2 | regional-call-78 | 27 | pilot-location-74 | 6564371 | 2025-12-19T01:35:00 | 15.40 |
| 3 | legacy-call-79 | 38 | extended-location-75 | 4463669 | 2022-05-03T08:52:00 | 20.10 |
| 4 | compact-call-80 | 49 | integrated-location-76 | 6969425 | 2023-10-14T15:09:00 | 24.80 |

The view `v_amateur_radio_station_communication_certificate` joins `amateur_radio_stations` to `communication_certificates` on `amateur_radio_stations.id = communication_certificates.amateur_radio_station_id`. It answers "what regulatory certificates does each station hold?" Station `seasonal-call-77` holds certificate `778563` for `cw` communications, issued `2023-02-01` and valid until `2023-06-09`.

**View `v_amateur_radio_station_communication_certificate`**

```sql
CREATE VIEW v_amateur_radio_station_communication_certificate AS
SELECT a.id, a.call_sign, a.ssid, a.location_qth, b.certificate_id AS certificate_certificate_id, b.issue_date AS certificate_issue_date, b.valid_until AS certificate_valid_until
FROM amateur_radio_stations a JOIN communication_certificates b ON a.certificate_id = b.certificate_id;
```

| id | call_sign | ssid | location_qth | certificate_certificate_id | certificate_issue_date | certificate_valid_until |
|---|---|---|---|---|---|---|
| 1 | seasonal-call-77 | 16 | baseline-location-73 | 778563 | 2023-02-01 | 2023-06-09 |
| 2 | regional-call-78 | 27 | pilot-location-74 | 7119762 | 2024-07-12 | 2024-11-20 |
| 3 | legacy-call-79 | 38 | extended-location-75 | 22106999 | 2025-12-23 | 2025-04-04 |
| 4 | compact-call-80 | 49 | integrated-location-76 | 2986238 | 2022-05-07 | 2022-09-15 |

The view `v_ligno_sat_uplink_signal_amateur_radio_station` performs the inverse join of the first view, starting from `ligno_sat_uplink_signals` and joining to `amateur_radio_stations`. It answers "which ground station originated this uplink?" Signal `317` is attributed to station `seasonal-call-77` (id `1`).

**View `v_ligno_sat_uplink_signal_amateur_radio_station`**

```sql
CREATE VIEW v_ligno_sat_uplink_signal_amateur_radio_station AS
SELECT a.signal_id, a.timestamp, a.frequency, a.protocol_version, b.id AS station_id, b.call_sign AS station_call_sign, b.ssid AS station_ssid
FROM ligno_sat_uplink_signals a JOIN amateur_radio_stations b ON a.amateur_radio_station_id = b.id;
```

| signal_id | timestamp | frequency | protocol_version | station_id | station_call_sign | station_ssid |
|---|---|---|---|---|---|---|
| 317 | 2024-07-08T18:18:00 | 10.70 | legacy-protocol-43 | 1 | seasonal-call-77 | 16 |
| 6564371 | 2025-12-19T01:35:00 | 15.40 | compact-protocol-44 | 2 | regional-call-78 | 27 |
| 4463669 | 2022-05-03T08:52:00 | 20.10 | composite-protocol-45 | 3 | legacy-call-79 | 38 |
| 6969425 | 2023-10-14T15:09:00 | 24.80 | primary-protocol-46 | 4 | compact-call-80 | 49 |

The view `v_ligno_sat_uplink_signal_ligno_sat` joins `ligno_sat_uplink_signals` to `ligno_sats` on `ligno_sat_uplink_signals.satellite_id = ligno_sats.satellite_id`. It answers "which satellite received this uplink?" Signal `317` was received by satellite `id_18`, which operates in `distributed-orbit-18` with `cw` downlink mode.

**View `v_ligno_sat_uplink_signal_ligno_sat`**

```sql
CREATE VIEW v_ligno_sat_uplink_signal_ligno_sat AS
SELECT a.signal_id, a.timestamp, a.frequency, a.protocol_version, b.satellite_id AS sat_satellite_id, b.orbit_type AS sat_orbit_type, b.memory_capacity AS sat_memory_capacity
FROM ligno_sat_uplink_signals a JOIN ligno_sats b ON a.satellite_id = b.satellite_id;
```

| signal_id | timestamp | frequency | protocol_version | sat_satellite_id | sat_orbit_type | sat_memory_capacity |
|---|---|---|---|---|---|---|
| 317 | 2024-07-08T18:18:00 | 10.70 | legacy-protocol-43 | id_18 | distributed-orbit-18 | 8 |
| 6564371 | 2025-12-19T01:35:00 | 15.40 | compact-protocol-44 | 884366 | baseline-orbit-19 | 11 |
| 4463669 | 2022-05-03T08:52:00 | 20.10 | composite-protocol-45 | 69447 | pilot-orbit-20 | 14 |
| 6969425 | 2023-10-14T15:09:00 | 24.80 | primary-protocol-46 | lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 |

The view `v_ligno_sat_uplink_signal_extracted_message` joins `ligno_sat_uplink_signals` to `extracted_messages` on `ligno_sat_uplink_signals.extracted_message_id = extracted_messages.id`. It answers "what message was extracted from this uplink?" Signal `317` yielded message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` of type `QTH` with content `adaptive-content-83`.

**View `v_ligno_sat_uplink_signal_extracted_message`**

```sql
CREATE VIEW v_ligno_sat_uplink_signal_extracted_message AS
SELECT a.signal_id, a.timestamp, a.frequency, a.protocol_version, b.id AS message_id, b.message_id AS message_message_id, b.message_type AS message_message_type
FROM ligno_sat_uplink_signals a JOIN extracted_messages b ON a.extracted_message_id = b.id;
```

| signal_id | timestamp | frequency | protocol_version | message_id | message_message_id | message_message_type |
|---|---|---|---|---|---|---|
| 317 | 2024-07-08T18:18:00 | 10.70 | legacy-protocol-43 | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH |
| 6564371 | 2025-12-19T01:35:00 | 15.40 | compact-protocol-44 | 2 | state_uk_4 | QRA |
| 4463669 | 2022-05-03T08:52:00 | 20.10 | composite-protocol-45 | 3 | 1250194 | other |
| 6969425 | 2023-10-14T15:09:00 | 24.80 | primary-protocol-46 | 4 | 6969416 | QTH |

The view `v_ligno_sat_ligno_sat_uplink_signal` joins `ligno_sats` to `ligno_sat_uplink_signals` on `ligno_sats.satellite_id = ligno_sat_uplink_signals.satellite_id`. It answers "which uplink signals did this satellite receive?" Satellite `id_18` received signal `317` at frequency `10.70`.

**View `v_ligno_sat_ligno_sat_uplink_signal`**

```sql
CREATE VIEW v_ligno_sat_ligno_sat_uplink_signal AS
SELECT a.satellite_id, a.orbit_type, a.memory_capacity, a.downlink_mode, b.signal_id AS signal_signal_id, b.timestamp AS signal_timestamp, b.frequency AS signal_frequency
FROM ligno_sats a JOIN ligno_sat_uplink_signals b ON a.signal_id = b.signal_id;
```

| satellite_id | orbit_type | memory_capacity | downlink_mode | signal_signal_id | signal_timestamp | signal_frequency |
|---|---|---|---|---|---|---|
| id_18 | distributed-orbit-18 | 8 | cw | 317 | 2024-07-08T18:18:00 | 10.70 |
| 884366 | baseline-orbit-19 | 11 | fm_packet | 6564371 | 2025-12-19T01:35:00 | 15.40 |
| 69447 | pilot-orbit-20 | 14 | cw | 4463669 | 2022-05-03T08:52:00 | 20.10 |
| lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 | fm_packet | 6969425 | 2023-10-14T15:09:00 | 24.80 |

The view `v_ligno_sat_ligno_sat_downlink_signal` joins `ligno_sats` to `ligno_sat_downlink_signals` on `ligno_sats.ligno_sat_downlink_signal_id = ligno_sat_downlink_signals.id`. It answers "which downlink was transmitted by this satellite?" Satellite `id_18` transmitted downlink `1000` (downlink_id `id_5`) of type `cw` to station `seasonal-call-77`.

**View `v_ligno_sat_ligno_sat_downlink_signal`**

```sql
CREATE VIEW v_ligno_sat_ligno_sat_downlink_signal AS
SELECT a.satellite_id, a.orbit_type, a.memory_capacity, a.downlink_mode, b.id AS signal_id, b.downlink_id AS signal_downlink_id, b.timestamp AS signal_timestamp
FROM ligno_sats a JOIN ligno_sat_downlink_signals b ON a.ligno_sat_downlink_signal_id = b.id;
```

| satellite_id | orbit_type | memory_capacity | downlink_mode | signal_id | signal_downlink_id | signal_timestamp |
|---|---|---|---|---|---|---|
| id_18 | distributed-orbit-18 | 8 | cw | 1000 | id_5 | 2024-07-08T18:18:00 |
| 884366 | baseline-orbit-19 | 11 | fm_packet | 1001 | 5006448 | 2025-12-19T01:35:00 |
| 69447 | pilot-orbit-20 | 14 | cw | 1002 | 2986243 | 2022-05-03T08:52:00 |
| lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 | fm_packet | 1003 | 937725 | 2023-10-14T15:09:00 |

The view `v_ligno_sat_downlink_signal_ligno_sat` performs the inverse join, starting from `ligno_sat_downlink_signals` and joining to `ligno_sats`. It answers "which satellite transmitted this downlink?" Downlink `1000` was transmitted by satellite `id_18`.

**View `v_ligno_sat_downlink_signal_ligno_sat`**

```sql
CREATE VIEW v_ligno_sat_downlink_signal_ligno_sat AS
SELECT a.id, a.downlink_id, a.timestamp, a.downlink_type, b.satellite_id AS sat_satellite_id, b.orbit_type AS sat_orbit_type, b.memory_capacity AS sat_memory_capacity
FROM ligno_sat_downlink_signals a JOIN ligno_sats b ON a.satellite_id = b.satellite_id;
```

| id | downlink_id | timestamp | downlink_type | sat_satellite_id | sat_orbit_type | sat_memory_capacity |
|---|---|---|---|---|---|---|
| 1000 | id_5 | 2024-07-08T18:18:00 | cw | id_18 | distributed-orbit-18 | 8 |
| 1001 | 5006448 | 2025-12-19T01:35:00 | fm_packet | 884366 | baseline-orbit-19 | 11 |
| 1002 | 2986243 | 2022-05-03T08:52:00 | cw | 69447 | pilot-orbit-20 | 14 |
| 1003 | 937725 | 2023-10-14T15:09:00 | fm_packet | lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 |

The view `v_ligno_sat_downlink_signal_amateur_radio_station` joins `ligno_sat_downlink_signals` to `amateur_radio_stations` on `ligno_sat_downlink_signals.amateur_radio_station_id = amateur_radio_stations.id`. It answers "which ground station received this downlink?" Downlink `1000` was received by station `seasonal-call-77` (id `1`).

**View `v_ligno_sat_downlink_signal_amateur_radio_station`**

```sql
CREATE VIEW v_ligno_sat_downlink_signal_amateur_radio_station AS
SELECT a.id, a.downlink_id, a.timestamp, a.downlink_type, b.id AS station_id, b.call_sign AS station_call_sign, b.ssid AS station_ssid
FROM ligno_sat_downlink_signals a JOIN amateur_radio_stations b ON a.amateur_radio_station_id = b.id;
```

| id | downlink_id | timestamp | downlink_type | station_id | station_call_sign | station_ssid |
|---|---|---|---|---|---|---|
| 1000 | id_5 | 2024-07-08T18:18:00 | cw | 1 | seasonal-call-77 | 16 |
| 1001 | 5006448 | 2025-12-19T01:35:00 | fm_packet | 2 | regional-call-78 | 27 |
| 1002 | 2986243 | 2022-05-03T08:52:00 | cw | 3 | legacy-call-79 | 38 |
| 1003 | 937725 | 2023-10-14T15:09:00 | fm_packet | 4 | compact-call-80 | 49 |

The view `v_ligno_sat_downlink_signal_extracted_message` joins `ligno_sat_downlink_signals` to `extracted_messages` on `ligno_sat_downlink_signals.extracted_message_id = extracted_messages.id`. It answers "what message was extracted from this downlink?" Downlink `1000` yielded message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` of type `QTH`.

**View `v_ligno_sat_downlink_signal_extracted_message`**

```sql
CREATE VIEW v_ligno_sat_downlink_signal_extracted_message AS
SELECT a.id, a.downlink_id, a.timestamp, a.downlink_type, b.id AS message_id, b.message_id AS message_message_id, b.message_type AS message_message_type
FROM ligno_sat_downlink_signals a JOIN extracted_messages b ON a.extracted_message_id = b.id;
```

| id | downlink_id | timestamp | downlink_type | message_id | message_message_id | message_message_type |
|---|---|---|---|---|---|---|
| 1000 | id_5 | 2024-07-08T18:18:00 | cw | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH |
| 1001 | 5006448 | 2025-12-19T01:35:00 | fm_packet | 2 | state_uk_4 | QRA |
| 1002 | 2986243 | 2022-05-03T08:52:00 | cw | 3 | 1250194 | other |
| 1003 | 937725 | 2023-10-14T15:09:00 | fm_packet | 4 | 6969416 | QTH |

The view `v_extracted_message_ligno_sat_uplink_signal` joins `extracted_messages` to `ligno_sat_uplink_signals` on `extracted_messages.signal_id = ligno_sat_uplink_signals.signal_id`. It answers "which uplink signal produced this extracted message?" Message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` was produced by uplink signal `317`.

**View `v_extracted_message_ligno_sat_uplink_signal`**

```sql
CREATE VIEW v_extracted_message_ligno_sat_uplink_signal AS
SELECT a.id, a.message_id, a.message_type, a.content, b.signal_id AS signal_signal_id, b.timestamp AS signal_timestamp, b.frequency AS signal_frequency
FROM extracted_messages a JOIN ligno_sat_uplink_signals b ON a.signal_id = b.signal_id;
```

| id | message_id | message_type | content | signal_signal_id | signal_timestamp | signal_frequency |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH | adaptive-content-83 | 317 | 2024-07-08T18:18:00 | 10.70 |
| 2 | state_uk_4 | QRA | distributed-content-84 | 6564371 | 2025-12-19T01:35:00 | 15.40 |
| 3 | 1250194 | other | baseline-content-85 | 4463669 | 2022-05-03T08:52:00 | 20.10 |
| 4 | 6969416 | QTH | pilot-content-86 | 6969425 | 2023-10-14T15:09:00 | 24.80 |

The view `v_extracted_message_ligno_sat` joins `extracted_messages` to `ligno_sats` on `extracted_messages.satellite_id = ligno_sats.satellite_id`. It answers "which satellite was involved in the extraction of this message?" Message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` was associated with satellite `id_18`.

**View `v_extracted_message_ligno_sat`**

```sql
CREATE VIEW v_extracted_message_ligno_sat AS
SELECT a.id, a.message_id, a.message_type, a.content, b.satellite_id AS sat_satellite_id, b.orbit_type AS sat_orbit_type, b.memory_capacity AS sat_memory_capacity
FROM extracted_messages a JOIN ligno_sats b ON a.satellite_id = b.satellite_id;
```

| id | message_id | message_type | content | sat_satellite_id | sat_orbit_type | sat_memory_capacity |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH | adaptive-content-83 | id_18 | distributed-orbit-18 | 8 |
| 2 | state_uk_4 | QRA | distributed-content-84 | 884366 | baseline-orbit-19 | 11 |
| 3 | 1250194 | other | baseline-content-85 | 69447 | pilot-orbit-20 | 14 |
| 4 | 6969416 | QTH | pilot-content-86 | lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 |

The view `v_extracted_message_ligno_sat_downlink_signal` joins `extracted_messages` to `ligno_sat_downlink_signals` on `extracted_messages.ligno_sat_downlink_signal_id = ligno_sat_downlink_signals.id`. It answers "which downlink carried this extracted message?" Message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` was carried by downlink `1000`.

**View `v_extracted_message_ligno_sat_downlink_signal`**

```sql
CREATE VIEW v_extracted_message_ligno_sat_downlink_signal AS
SELECT a.id, a.message_id, a.message_type, a.content, b.id AS signal_id, b.downlink_id AS signal_downlink_id, b.timestamp AS signal_timestamp
FROM extracted_messages a JOIN ligno_sat_downlink_signals b ON a.ligno_sat_downlink_signal_id = b.id;
```

| id | message_id | message_type | content | signal_id | signal_downlink_id | signal_timestamp |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH | adaptive-content-83 | 1000 | id_5 | 2024-07-08T18:18:00 |
| 2 | state_uk_4 | QRA | distributed-content-84 | 1001 | 5006448 | 2025-12-19T01:35:00 |
| 3 | 1250194 | other | baseline-content-85 | 1002 | 2986243 | 2022-05-03T08:52:00 |
| 4 | 6969416 | QTH | pilot-content-86 | 1003 | 937725 | 2023-10-14T15:09:00 |

The view `v_communication_certificate_amateur_radio_station` joins `communication_certificates` to `amateur_radio_stations` on `communication_certificates.amateur_radio_station_id = amateur_radio_stations.id`. It answers "which station does this certificate authorize?" Certificate `778563` authorizes station `seasonal-call-77` (id `1`).

**View `v_communication_certificate_amateur_radio_station`**

```sql
CREATE VIEW v_communication_certificate_amateur_radio_station AS
SELECT a.certificate_id, a.issue_date, a.valid_until, a.communication_type, b.id AS station_id, b.call_sign AS station_call_sign, b.ssid AS station_ssid
FROM communication_certificates a JOIN amateur_radio_stations b ON a.amateur_radio_station_id = b.id;
```

| certificate_id | issue_date | valid_until | communication_type | station_id | station_call_sign | station_ssid |
|---|---|---|---|---|---|---|
| 778563 | 2023-02-01 | 2023-06-09 | cw | 1 | seasonal-call-77 | 16 |
| 7119762 | 2024-07-12 | 2024-11-20 | fm_packet | 2 | regional-call-78 | 27 |
| 22106999 | 2025-12-23 | 2025-04-04 | cw | 3 | legacy-call-79 | 38 |
| 2986238 | 2022-05-07 | 2022-09-15 | fm_packet | 4 | compact-call-80 | 49 |

The view `v_communication_certificate_ligno_sat_uplink_signal` joins `communication_certificates` to `ligno_sat_uplink_signals` on `communication_certificates.signal_id = ligno_sat_uplink_signals.signal_id`. It answers "which uplink signal is covered by this certificate?" Certificate `778563` covers uplink signal `317`, which was transmitted at frequency `10.70` GHz.

**View `v_communication_certificate_ligno_sat_uplink_signal`**

```sql
CREATE VIEW v_communication_certificate_ligno_sat_uplink_signal AS
SELECT a.certificate_id, a.issue_date, a.valid_until, a.communication_type, b.signal_id AS signal_signal_id, b.timestamp AS signal_timestamp, b.frequency AS signal_frequency
FROM communication_certificates a JOIN ligno_sat_uplink_signals b ON a.signal_id = b.signal_id;
```

| certificate_id | issue_date | valid_until | communication_type | signal_signal_id | signal_timestamp | signal_frequency |
|---|---|---|---|---|---|---|
| 778563 | 2023-02-01 | 2023-06-09 | cw | 317 | 2024-07-08T18:18:00 | 10.70 |
| 7119762 | 2024-07-12 | 2024-11-20 | fm_packet | 6564371 | 2025-12-19T01:35:00 | 15.40 |
| 22106999 | 2025-12-23 | 2025-04-04 | cw | 4463669 | 2022-05-03T08:52:00 | 20.10 |
| 2986238 | 2022-05-07 | 2022-09-15 | fm_packet | 6969425 | 2023-10-14T15:09:00 | 24.80 |

## Synthesis

The schema separates concerns cleanly: `amateur_radio_stations` and `ligno_sats` are the entity tables; `ligno_sat_uplink_signals` and `ligno_sat_downlink_signals` are the event tables that record radio transmissions with full temporal and spectral metadata; `extracted_messages` is the payload table that stores decoded content; and `communication_certificates` is the regulatory table that ties authorizations to stations and signals. Foreign keys form a directed acyclic graph from stations and satellites through uplink and downlink events to extracted messages, with certificates providing a parallel authorization edge from stations to signals. The twelve views materialize the most common join paths — station-to-signal, satellite-to-signal, signal-to-message, and certificate-to-station — so that analysts can query domain facts such as "which messages did satellite `id_18` relay to station `seasonal-call-77`?" without constructing joins manually. The model is fully normalized to third normal form, with each fact stored once and reconstructed through explicit foreign-key relationships.