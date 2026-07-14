## Amateur Radio Satellite Communications: Signal Flow, Message Extraction, and Certification

Amateur radio operators routinely establish two-way communication with low-Earth-orbit satellites, transmitting uplink signals that carry encoded telemetry and data payloads, then awaiting downlink responses that are demodulated and parsed into structured messages. The operational ecosystem surrounding this exchange is captured in a set of interrelated records: station identities, satellite configurations, signal transmissions in both directions, extracted message content, and the certificates that authorize each communication session. Understanding how these records relate is essential for operators, ground-station managers, and compliance auditors who must trace a message from its point of origin on the ground, through the satellite relay, to its final decoded form.

**Table `amateur_radio_stations`**

| id | call_sign | ssid | location_qth | region_qra | status | signal_id | certificate_id |
|---|---|---|---|---|---|---|---|
| 1 | seasonal-call-77 | 16 | baseline-location-73 | integrated-region-76 | active | 317 | 778563 |
| 2 | regional-call-78 | 27 | pilot-location-74 | seasonal-region-77 | inactive | 6564371 | 7119762 |
| 3 | legacy-call-79 | 38 | extended-location-75 | regional-region-78 | certified | 4463669 | 22106999 |
| 4 | compact-call-80 | 49 | integrated-location-76 | legacy-region-79 | active | 6969425 | 2986238 |

Each ground station is identified by a unique call sign paired with an SSID suffix, a geographic locator expressed as a QTH coordinate and a QRA region code, and a status that reflects its operational readiness. Station `seasonal-call-77` (SSID 16) operates from `baseline-location-73` within `integrated-region-76` and holds an `active` designation, while `regional-call-78` (SSID 27) at `pilot-location-74` in `seasonal-region-77` is currently `inactive`. The station `legacy-call-79` (SSID 38) carries a `certified` status from `extended-location-75` in `regional-region-78`, and `compact-call-80` (SSID 49) at `integrated-location-76` in `legacy-region-79` is also `active`. Every station record carries a `signal_id` and a `certificate_id`, linking it to the signals it transmits and the certificates that authorize its communications.

**Table `ligno_sats`**

| satellite_id | orbit_type | memory_capacity | downlink_mode | status | signal_id | ligno_sat_downlink_signal_id |
|---|---|---|---|---|---|---|
| id_18 | distributed-orbit-18 | 8 | cw | operational | 317 | 1000 |
| 884366 | baseline-orbit-19 | 11 | fm_packet | maintenance | 6564371 | 1001 |
| 69447 | pilot-orbit-20 | 14 | cw | decommissioned | 4463669 | 1002 |
| lu_tax_code_template_m_I_2_6 | extended-orbit-21 | 17 | fm_packet | operational | 6969425 | 1003 |

The satellite fleet, designated LignoSat, is catalogued with an orbit type, memory capacity in gigabytes, a preferred downlink mode, and a status indicating its current operational state. Satellite `id_18` resides in `distributed-orbit-18` with 8 GB of memory, uses `cw` (continuous wave) for downlink, and is marked `operational`. Satellite `884366` follows a `baseline-orbit-19` with 11 GB of memory, employs `fm_packet` mode, and is under `maintenance`. Satellite `69447` occupies `pilot-orbit-20` with 14 GB of memory, also uses `cw`, but is `decommissioned`. The satellite identified as `lu_tax_code_template_m_I_2_6` is in `extended-orbit-21` with 17 GB of memory, uses `fm_packet`, and is `operational`. Each satellite record references a signal and a downlink signal, anchoring it to the communication events it participates in.

**Table `ligno_sat_uplink_signals`**

| signal_id | timestamp | frequency | protocol_version | message_content | amateur_radio_station_id | satellite_id | extracted_message_id |
|---|---|---|---|---|---|---|---|
| 317 | 2024-07-08T18:18:00 | 10.70 | legacy-protocol-43 | composite-message-21 | 1 | id_18 | 1 |
| 6564371 | 2025-12-19T01:35:00 | 15.40 | compact-protocol-44 | primary-message-22 | 2 | 884366 | 2 |
| 4463669 | 2022-05-03T08:52:00 | 20.10 | composite-protocol-45 | adaptive-message-23 | 3 | 69447 | 3 |
| 6969425 | 2023-10-14T15:09:00 | 24.80 | primary-protocol-46 | distributed-message-24 | 4 | lu_tax_code_template_m_I_2_6 | 4 |

Uplink signals represent the transmissions sent from ground stations to satellites. Each record carries a signal identifier, a precise timestamp, the operating frequency in gigahertz, the protocol version used, and the raw message content. Signal `317` was transmitted on 2024-07-08 at 18:18 UTC on a frequency of 10.70 GHz using `legacy-protocol-43`, carrying `composite-message-21`. Signal `6564371` occurred on 2025-12-19 at 01:35 UTC at 15.40 GHz with `compact-protocol-44` and contained `primary-message-22`. Signal `4463669` dates to 2022-05-03 at 08:52 UTC on 20.10 GHz under `composite-protocol-45`, transmitting `adaptive-message-23`. Signal `6969425` was sent on 2023-10-14 at 15:09 UTC at 24.80 GHz using `primary-protocol-46` and carried `distributed-message-24`. Each uplink signal is attributed to a specific amateur radio station and satellite, and may reference an extracted message once the downlink processing is complete.

**Table `ligno_sat_downlink_signals`**

| id | downlink_id | timestamp | downlink_type | call_signs_included | message_count | satellite_id | amateur_radio_station_id | extracted_message_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | id_5 | 2024-07-08T18:18:00 | cw | legacy-call-73 | 4 | id_18 | 1 | 1 |
| 1001 | 5006448 | 2025-12-19T01:35:00 | fm_packet | compact-call-74 | 100 | 884366 | 2 | 2 |
| 1002 | 2986243 | 2022-05-03T08:52:00 | cw | composite-call-75 | 17 | 69447 | 3 | 3 |
| 1003 | 937725 | 2023-10-14T15:09:00 | fm_packet | primary-call-76 | 9 | lu_tax_code_template_m_I_2_6 | 4 | 4 |

Downlink signals are the satellite's responses, received back at ground stations. The downlink record includes an internal identifier, a downlink reference, a timestamp, the modulation type, the call signs of stations included in the broadcast, the number of messages contained, and the originating satellite and receiving station. Downlink `1000` (reference `id_5`) was received on 2024-07-08 at 18:18 UTC using `cw` modulation, addressed to `legacy-call-73`, and contained 4 messages from satellite `id_18` to station `1`. Downlink `1001` (reference `5006448`) arrived on 2025-12-19 at 01:35 UTC via `fm_packet`, targeting `compact-call-74`, carrying 100 messages from satellite `884366` to station `2`. Downlink `1002` (reference `2986243`) was captured on 2022-05-03 at 08:52 UTC in `cw` mode, aimed at `composite-call-75`, with 17 messages from satellite `69447` to station `3`. Downlink `1003` (reference `937725`) was received on 2023-10-14 at 15:09 UTC using `fm_packet`, directed to `primary-call-76`, containing 9 messages from satellite `lu_tax_code_template_m_I_2_6` to station `4`.

**Table `extracted_messages`**

| id | message_id | message_type | content | extraction_timestamp | storage_status | signal_id | satellite_id | ligno_sat_downlink_signal_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | QTH | adaptive-content-83 | 2024-07-17T18:42:00 | stored | 317 | id_18 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | state_uk_4 | QRA | distributed-content-84 | 2025-12-01T01:59:00 | collected | 6564371 | 884366 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1250194 | other | baseline-content-85 | 2022-05-12T08:16:00 | deleted | 4463669 | 69447 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6969416 | QTH | pilot-content-86 | 2023-10-23T15:33:00 | stored | 6969425 | lu_tax_code_template_m_I_2_6 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

After demodulation, messages are extracted and stored with a unique identifier, a message type, the decoded content, an extraction timestamp, and a storage status indicating whether the message is retained, collected, or deleted. Message `1` (identifier `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`) is of type `QTH`, contains `adaptive-content-83`, was extracted on 2024-07-17 at 18:42 UTC, and is `stored`. Message `2` (identifier `state_uk_4`) is type `QRA`, holds `distributed-content-84`, was extracted on 2025-12-01 at 01:59 UTC, and is `collected`. Message `3` (identifier `1250194`) is type `other`, contains `baseline-content-85`, was extracted on 2022-05-12 at 08:16 UTC, and is `deleted`. Message `4` (identifier `6969416`) is type `QTH`, holds `pilot-content-86`, was extracted on 2023-10-23 at 15:33 UTC, and is `stored`. Each extracted message is linked back to the uplink signal, the satellite, and the downlink signal that produced it.

**Table `communication_certificates`**

| certificate_id | issue_date | valid_until | communication_type | status | amateur_radio_station_id | signal_id |
|---|---|---|---|---|---|---|
| 778563 | 2023-02-01 | 2023-06-09 | cw | issued | 1 | 317 |
| 7119762 | 2024-07-12 | 2024-11-20 | fm_packet | revoked | 2 | 6564371 |
| 22106999 | 2025-12-23 | 2025-04-04 | cw | expired | 3 | 4463669 |
| 2986238 | 2022-05-07 | 2022-09-15 | fm_packet | issued | 4 | 6969425 |

Communication certificates authorize and document each station's right to transmit on specific frequencies and protocols. Certificate `778563` was issued on 2023-02-01, valid until 2023-06-09, for `cw` communications, and remains `issued`. Certificate `7119762` was issued on 2024-07-12, valid until 2024-11-20, for `fm_packet` communications, but has been `revoked`. Certificate `22106999` was issued on 2025-12-23, valid until 2025-04-04, for `cw` communications, and is now `expired`. Certificate `2986238` was issued on 2022-05-07, valid until 2022-09-15, for `fm_packet` communications, and remains `issued`. Each certificate ties a station to a specific signal and communication type.

### Uplink Signal Relationships

The uplink signal is the central event in the satellite communication chain. It connects a ground station to a satellite, carries a protocol and frequency, and may produce an extracted message once the downlink is processed. The following view joins the station and uplink signal records to present a complete picture of who transmitted what, to which satellite, and under which protocol.

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

This view answers the question: which station sent which uplink signal, and what satellite was the target? Reading the first row, station `seasonal-call-77` (SSID 16, `active`) transmitted signal `317` on 2024-07-08 at 18:18 UTC at 10.70 GHz using `legacy-protocol-43`, targeting satellite `id_18`. The second row shows `regional-call-78` (SSID 27, `inactive`) sent signal `6564371` on 2025-12-19 at 01:35 UTC at 15.40 GHz with `compact-protocol-44` to satellite `884366`. This join is the primary operational ledger for uplink activity.

The reverse perspective, which starts from the uplink signal and resolves the station details, is provided by the next view.

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

This view answers: given an uplink signal, which station originated it, and what is that station's status and location? The first row reveals that signal `317` was sent by `seasonal-call-77` at `baseline-location-73` in `integrated-region-76`, a station that is `active`. The fourth row shows signal `6969425` originated from `compact-call-80` at `integrated-location-76` in `legacy-region-79`, also `active`. This orientation is useful for signal forensics, where the signal is the known quantity and the station identity is the target.

The satellite-side of the uplink is resolved in the following view.

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

This view answers: which satellite received each uplink signal, and what is that satellite's orbit, memory, and operational status? The first row indicates that signal `317` was received by satellite `id_18`, which is in `distributed-orbit-18`, has 8 GB of memory, uses `cw` downlink, and is `operational`. The third row shows signal `4463669` was received by satellite `69447` in `pilot-orbit-20` with 14 GB of memory, `cw` downlink, but `decommissioned` status. This join is critical for assessing whether a satellite was capable of processing the received signal at the time of transmission.

The downstream consequence of an uplink — the extracted message — is captured in the next view.

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

This view answers: did the uplink signal result in an extracted message, and what are the message's type, content, and storage status? The first row links signal `317` to message `1` (identifier `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), a `QTH`-type message containing `adaptive-content-83`, extracted on 2024-07-17, and currently `stored`. The third row shows signal `4463669` produced message `3` (identifier `1250194`), an `other`-type message with `baseline-content-85`, extracted on 2022-05-12, but now `deleted`. This view is essential for message lifecycle management and compliance auditing.

### Downlink Signal Relationships

Downlink signals complete the communication loop. They originate from satellites, are received at ground stations, and contain the demodulated messages that operators rely on. The following view connects the downlink signal to its parent satellite.

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

This view answers: which satellite produced each downlink signal, and what are the satellite's operational parameters? The first row shows that downlink `1000` was produced by satellite `id_18`, which is `operational` in `distributed-orbit-18` with 8 GB of memory and `cw` downlink mode. The second row links downlink `1001` to satellite `884366`, which is under `maintenance` in `baseline-orbit-19` with 11 GB of memory and `fm_packet` mode. This join is the primary reference for satellite-to-downlink attribution.

The reverse orientation, starting from the satellite and listing its downlink signals, is provided next.

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

This view answers: which uplink signals are associated with each satellite, and what are the signal frequencies and protocols? The first row shows satellite `id_18` is associated with uplink signal `317` at 10.70 GHz using `legacy-protocol-43`. The fourth row links satellite `lu_tax_code_template_m_I_2_6` to uplink signal `6969425` at 24.80 GHz under `primary-protocol-46`. This view is useful for satellite-centric signal inventory and protocol analysis.

The downlink-to-satellite relationship is also captured in a separate view that emphasizes the downlink record's perspective.

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

This view answers: for each downlink signal, which satellite is the source, and what are that satellite's orbit and status? The first row indicates downlink `1000` originated from satellite `id_18` in `distributed-orbit-18`, which is `operational`. The third row shows downlink `1002` came from satellite `69447` in `pilot-orbit-20`, which is `decommissioned`. This orientation is valuable for downlink quality assessment, as the satellite's operational status directly affects signal integrity.

The ground station that receives each downlink is resolved in the following view.

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

This view answers: which ground station received each downlink signal, and what is that station's call sign and status? The first row shows downlink `1000` was received by station `1` (`seasonal-call-77`, `active`). The second row links downlink `1001` to station `2` (`regional-call-78`, `inactive`). This join is essential for tracking which operators received which downlink broadcasts and for verifying that receiving stations were authorized at the time of reception.

The extracted messages produced by downlink signals are captured in the next view.

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

This view answers: which extracted messages were produced by each downlink signal, and what are their types and storage statuses? The first row shows downlink `1000` produced message `1` (type `QTH`, content `adaptive-content-83`, status `stored`). The third row links downlink `1002` to message `3` (type `other`, content `baseline-content-85`, status `deleted`). This view is critical for message provenance, tracing each decoded message back to the specific downlink that carried it.

### Extracted Message Relationships

Extracted messages are the end product of the communication chain. The following views resolve their connections to the uplink signals, satellites, and downlink signals that produced them.

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

This view answers: which uplink signal is associated with each extracted message, and what are the signal's frequency and protocol? The first row links message `1` to uplink signal `317` at 10.70 GHz using `legacy-protocol-43`. The fourth row connects message `4` to uplink signal `6969425` at 24.80 GHz under `primary-protocol-46`. This view is useful for protocol-level analysis of message content.

The satellite association for extracted messages is provided next.

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

This view answers: which satellite is associated with each extracted message, and what are the satellite's orbit and memory capacity? The first row shows message `1` is associated with satellite `id_18` in `distributed-orbit-18` with 8 GB of memory. The fourth row links message `4` to satellite `lu_tax_code_template_m_I_2_6` in `extended-orbit-21` with 17 GB of memory. This join supports satellite performance analysis by correlating message extraction outcomes with satellite capabilities.

The downlink signal that produced each extracted message is resolved in the following view.

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

This view answers: which downlink signal produced each extracted message, and what are the downlink's modulation type and message count? The first row shows message `1` was produced by downlink `1000` using `cw` modulation with 4 messages. The second row links message `2` to downlink `1001` using `fm_packet` with 100 messages. This view is essential for understanding the volume and modulation characteristics of the signals that carried each message.

### Communication Certificate Relationships

Communication certificates authorize and document the legal basis for each transmission. The following views resolve their connections to stations and signals.

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

This view answers: which station holds each communication certificate, and what is that station's call sign, location, and status? The first row shows certificate `778563` is held by station `1` (`seasonal-call-77`, `active`, at `baseline-location-73`). The third row links certificate `22106999` to station `3` (`legacy-call-79`, `certified`, at `extended-location-75`). This view is the primary reference for compliance audits, verifying that each station's certificate is current and properly issued.

The signal association for communication certificates is provided in the final view.

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

This view answers: which uplink signal is authorized by each communication certificate, and what are the signal's frequency and protocol? The first row shows certificate `778563` authorizes uplink signal `317` at 10.70 GHz using `legacy-protocol-43`. The second row links certificate `7119762` to uplink signal `6564371` at 15.40 GHz under `compact-protocol-44`. This view is critical for regulatory compliance, ensuring that every transmitted signal is backed by a valid, unrevoked, and unexpired certificate.

### Synthesis

The amateur radio satellite communication ecosystem is a tightly coupled chain: a ground station transmits an uplink signal to a satellite under the authority of a communication certificate; the satellite processes and retransmits the data as a downlink signal; the ground station receives the downlink and extracts structured messages. Each record in this system — from the station's call sign to the satellite's orbit type, from the uplink frequency to the extracted message's storage status — serves as a verifiable node in the chain. The views presented here provide the necessary joins to traverse the chain in either direction, supporting operational monitoring, message provenance, satellite performance analysis, and regulatory compliance. Operators who understand these relationships can diagnose transmission failures, audit message integrity, and ensure that every signal in the system is properly authorized and traceable.

## Data appendix

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
