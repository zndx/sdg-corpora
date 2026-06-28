---
chapter_id: ch_live_instrument_emits_signal_195e73
topic_id: 0
family: 01_foundation
cited_terms: ['instrument_emits_signal', 'instrument_only_emits_type', 'instrument_subclass']
model: engine-refine
---

Instrument records are anchored by opaque identifiers that serve as the sole stable reference across heterogeneous signal and measurement registries. The prefix encodes provenance: records bearing the SIGN-0001 through SIGN-0004 namespace belong to the emission-signal catalogue, where each entry maps a physical device—LiDAR array, Seismometer, Mass spectrometer, Radiometer—to the phenomenon it generates, such as a Seismic wave or an RF burst. The TYPE-0001 through TYPE-0004 series captures devices that emit signal types without an associated storage location, encompassing instruments like the Seismograph and Ion chamber producing Optical pulses or Telemetry streams. The INST-0001 through INST-0004 series enumerates instrument subclasses with full provenance metadata, including high-precision hardware such as the X-Ray Diffractometer Bruker D8 and the Flow Cytometer BD FACSCanto, each producing a defined measurement—ion intensity, infrared radiation, or ground acceleration. This tripartite identifier scheme prevents collisions while preserving lineage at a glance.

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | Seismic wave | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | Heartbeat ping | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | RF burst | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | Electromagnetic field | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | Optical pulse | 371526447 | abfss://prod/silver |

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | Optical pulse | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | Frequency sweep | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | Data packet | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | Telemetry stream | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | Heartbeat ping | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | Seismic wave | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | Frequency sweep | 2024-10-26 | 587447986 |

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | ion intensity | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | infrared radiation | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | ground acceleration | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | ground acceleration | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | voltage waveform | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | ion intensity | 2024-03-26 | archived |

The temporal dimension is captured through a creation-date field present in the instrument subclass and signal-type registries, recording the date on which the record was first instantiated. Dates span from early 2023 to late 2024: the Seismometer CMG-3ESP subclass was registered on 2023-03-12, the Flow Cytometer BD FACSCanto on 2023-08-26, and the Ion chamber (second entry) as recently as 2024-07-30. These timestamps are not modification markers but birth certificates, enabling auditors to reconstruct the chronology of instrument onboarding and to detect anomalies such as a record created after its associated signal was already in production. The absence of a creation date in the emission-signal catalogue (SIGN series) reflects a design choice: those records are assumed to be derived or materialized rather than manually authored.

Data volume is quantified by a size-bytes column that appears in both the emission-signal and signal-type registries, storing the byte count of the associated payload or artifact. Values range from approximately 194 MB for the LiDAR array's Seismic wave record (193,789,751 bytes) to 632 MB for the Ion chamber's Optical pulse record (631,989,835 bytes). The Radiometer's Electromagnetic field entry reaches 579,891,201 bytes, while the Mass spectrometer's RF burst occupies 279,461,908 bytes. These figures are not arbitrary; they reflect the underlying sensor resolution, sampling rate, and compression applied at ingestion. Capacity planning and cost allocation depend directly on these magnitudes, and thresholds on this field are commonly used to trigger archival policies or to flag unusually large payloads for investigation.

Classification and lifecycle state are communicated through a tags column, which appears exclusively in the instrument subclass registry. Each instrument is assigned a single categorical tag—archived, internal, or verified—that conveys its current governance status. The Seismometer CMG-3ESP and the Spectrophotometer XPS-500 both carry the verified tag, indicating that their measurement definitions have undergone formal review. The X-Ray Diffractometer Bruker D8 is marked archived, suggesting it has been decommissioned or superseded, while the Flow Cytometer BD FACSCanto bears the internal tag, denoting restricted access. Tags are not hierarchical and do not compose; they are flat labels applied at the point of record creation and updated only through controlled governance workflows.

Data location is specified by a URI column in the emission-signal catalogue, pointing to the object store that houses the instrument's signal payload. The URIs follow cloud-native conventions and encode both the storage provider and the data maturity tier: s3://lake/raw indicates an Amazon S3 bucket at the raw ingestion layer, abfss://prod/silver points to Azure Blob Storage at the silver (curated) tier, s3://lake/curated denotes a second S3 location at the curated stage, and gs://warehouse/gold references Google Cloud Storage at the gold (refined) tier. This spatial metadata is critical for data engineers who must resolve where to read or write, for cost analysts who attribute storage spend to the correct cloud provider, and for compliance auditors who verify that sensitive signals are stored in approved regions. The coexistence of three cloud providers within a single dataset underscores the multi-cloud reality of modern data platforms and the necessity of URI-based location resolution over hardcoded paths.