## Core Service Infrastructure

Video delivery at scale requires a coordinated stack of streaming services, content protection systems, and encoding formats. Each service operates within a defined tier, uptime profile, and regional footprint, while DRM systems enforce encryption standards and compliance levels across the content lifecycle. Codecs determine how video is compressed and delivered to end users, with compression ratios and bitrates directly influencing bandwidth consumption and playback quality.

**Table `video_delivery_services`**

| service_id | service_tier | uptime_percentage | supported_platforms | region | status |
|---|---|---|---|---|---|
| 1996925 | premium | 16.45 | web | china | active |
| 3990164 | standard | 18.90 | mobile | europe | maintenance |
| 5844258 | basic | 21.35 | smart_tv | global | decommissioned |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | set_top_box | china | active |

A streaming service such as the premium offering `1996925` targets the `web` platform in `china` with an uptime of `16.45%`, while the standard service `3990164` operates on `mobile` devices across `europe` at `18.90%` uptime and is currently in `maintenance`. The basic tier `5844258` serves `smart_tv` devices globally at `21.35%` uptime and has been `decommissioned`. A UUID-named premium service `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` delivers to `set_top_box` hardware in `china` at `23.80%` uptime and remains `active`.

**Table `d_r_m_systems`**

| drm_id | vendor_name | encryption_standard | compliance_level | license_server_url |
|---|---|---|---|---|
| e9525746-8fd1-11eb-924d-9cd76263cbd0 | OMA DRM | AES-128 | L1 | https://bugs.launchpad.net/rally/+bug/1596756 |
| gd_fp_ne_acc2 | Marlin | AES-256 | L2 | http://businesswire.sys-con.com/node/4243291 |
| 2986222 | OMA DRM | ChaCha20 | L3 | https://www.facebook.com/careers/jobs/a0I1200000IAGYKEA5/ |
| 17191062 | Marlin | AES-128 | L4 | http://eol.org/pages/1298703/overview |

Content protection is managed through DRM systems like the OMA DRM instance `e9525746-8fd1-11eb-924d-9cd76263cbd0`, which applies `AES-128` encryption at `L1` compliance, and the Marlin system `gd_fp_ne_acc2` using `AES-256` at `L2` compliance. The OMA DRM entry `2986222` employs `ChaCha20` encryption at `L3` compliance, while the Marlin system `17191062` uses `AES-128` at `L4` compliance. Each system exposes a license server URL for client authentication.

**Table `video_codecs`**

| id | codec_id | codec_name | compression_ratio | bitrate | resolution | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | 10966228 | H.264 | 11.95 | 41 | 720p | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4180962 | H.265 | 15.90 | 48 | 1080p | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | state_et_1 | MPEG-DASH | 19.85 | 55 | 4K | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS | 23.80 | 62 | 720p | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Encoding formats include `H.264` (`codec_id` `10966228`) with a compression ratio of `11.95` at `41` bitrate delivering `720p` resolution, and `H.265` (`codec_id` `4180962`) achieving `15.90` compression at `48` bitrate for `1080p`. The `MPEG-DASH` codec (`state_et_1`) reaches `19.85` compression at `55` bitrate for `4K` output, while `HLS` (`codec_id` `5f9122ac-8fcd-11eb-924d-9cd76263cbd0`) provides `23.80` compression at `62` bitrate for `720p`. Each codec carries creation and update timestamps reflecting its configuration history.

## Client and Support Ecosystem

The delivery ecosystem extends beyond infrastructure to include the organizations that consume streaming services, the engineers who maintain them, and the network paths that carry traffic between data centers and end users.

**Table `client_organizations`**

| client_id | organization_name | industry_sector | region | account_manager |
|---|---|---|---|---|
| Erin Olson | Staples Inc. | digital_entertainment | china | legacy-account-49 |
| Jorge Sullivan | Oscar Health Inc. | television | europe | compact-account-50 |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | global | composite-account-51 |
| Michelle Kelley | Port Loko | system_integrator | china | primary-account-52 |

Client organizations span multiple industry sectors and regions. `Staples Inc.` operates in `digital_entertainment` within `china` under account manager `legacy-account-49`, while `Oscar Health Inc.` serves the `television` sector in `europe` via `compact-account-50`. `Atlantic Richfield` functions as a `movie_retailer` in the `global` region managed by `composite-account-51`, and `Port Loko`, a `system_integrator` in `china`, is handled by `primary-account-52`.

**Table `technical_support_engineers`**

| technical_support_engineer_id | engineer_id | name | location | experience_years | languages | education_level | employment_status |
|---|---|---|---|---|---|---|---|
| 100 | 325452 | Extended Review | beijing | 46 | chinese | bachelors | active |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | europe | 57 | english | masters | on_leave |
| 102 | 39800619 | Baseline Model | remote | 68 | chinese | phd | terminated |
| 103 | 5917278 | Distributed Cluster | beijing | 79 | english | bachelors | active |

Technical support engineers provide operational expertise across locations and experience levels. Engineer `325452` (named `Extended Review`) is based in `beijing` with `46` years of experience, fluent in `chinese`, holding a `bachelors` degree, and currently `active`. Engineer `ChIJAaQOcwdu5kcRArYphCv0bl0` (`Pilot Initiative A`) operates in `europe` with `57` years of experience in `english` at the `masters` level but is `on_leave`. Engineer `39800619` (`Baseline Model`) works `remote` with `68` years of experience, `chinese` proficiency, a `phd`, and a `terminated` status. Engineer `5917278` (`Distributed Cluster`) is located in `beijing`, has `79` years of experience, speaks `english`, holds a `bachelors` degree, and is `active`.

**Table `network_infrastructures`**

| network_id | protocol | bandwidth | latency | operating_system | status | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | 13.45 | windows | online | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 7441146 | UDP | 23.40 | 17.90 | linux | offline | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 8387535 | HTTP | 26.60 | 22.35 | macos | degraded | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 6589 | HTTPS | 29.80 | 26.80 | windows | online | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Network infrastructure provides the transport layer for all streaming operations. The TCP/IP network `e6196808-8fd1-11eb-924d-9cd76263cbd0` offers `20.20` bandwidth and `13.45` latency running on `windows` with `online` status. The UDP network `7441146` delivers `23.40` bandwidth at `17.90` latency on `linux` but is currently `offline`. The HTTP network `8387535` provides `26.60` bandwidth at `22.35` latency on `macos` in a `degraded` state, while the HTTPS network `6589` achieves `29.80` bandwidth at `26.80` latency on `windows` and remains `online`.

## Service-Codec Relationships

The mapping between streaming services and video codecs determines which encoding formats are available to each service tier. Junction records in the service-codec and codec-service tables capture these associations, while codec-infrastructure links tie specific codecs to the network paths that carry their traffic.

**Table `services_codecs`**

| service_id | video_codec_id |
|---|---|
| 1996925 | 1 |
| 1996925 | 2 |
| 3990164 | 2 |
| 3990164 | 3 |
| 5844258 | 3 |
| 5844258 | 4 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 4 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1 |

**Table `codecs_services`**

| video_codec_id | service_id |
|---|---|
| 1 | 1996925 |
| 1 | 3990164 |
| 2 | 3990164 |
| 2 | 5844258 |
| 3 | 5844258 |
| 3 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| 4 | 1996925 |

**Table `codecs_infrastructures`**

| video_codec_id | network_infrastructure_network_id |
|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 |
| 1 | 7441146 |
| 2 | 7441146 |
| 2 | 8387535 |
| 3 | 8387535 |
| 3 | 6589 |
| 4 | 6589 |
| 4 | e6196808-8fd1-11eb-924d-9cd76263cbd0 |

A service-codec association indicates that a particular streaming service supports a given encoding format for content delivery. The reverse codec-service record confirms the codec's availability within that service context. Codec-infrastructure links specify which network paths are optimized for transporting each codec's bitstream, ensuring that compression characteristics align with available bandwidth and latency profiles.

## Service-System Relationships

DRM systems must be explicitly associated with streaming services to enforce content protection policies. The services-system and systems-services junction tables document these pairings, establishing which encryption standards and compliance levels apply to each service.

**Table `services_systems`**

| service_id | d_r_m_system_drm_id |
|---|---|
| 1996925 | e9525746-8fd1-11eb-924d-9cd76263cbd0 |
| 1996925 | gd_fp_ne_acc2 |
| 3990164 | gd_fp_ne_acc2 |
| 3990164 | 2986222 |
| 5844258 | 2986222 |
| 5844258 | 17191062 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 17191062 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | e9525746-8fd1-11eb-924d-9cd76263cbd0 |

**Table `systems_services`**

| d_r_m_system_drm_id | service_id |
|---|---|
| e9525746-8fd1-11eb-924d-9cd76263cbd0 | 1996925 |
| e9525746-8fd1-11eb-924d-9cd76263cbd0 | 3990164 |
| gd_fp_ne_acc2 | 3990164 |
| gd_fp_ne_acc2 | 5844258 |
| 2986222 | 5844258 |
| 2986222 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| 17191062 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| 17191062 | 1996925 |

A services-system record declares that a specific DRM system is deployed for a given streaming service, while the systems-service counterpart confirms the system's operational scope. These bidirectional links ensure that every service has a defined content protection posture and that each DRM system's deployment footprint is fully accounted for.

## Service-Organization Relationships

Streaming services are consumed by client organizations, and the services-organizations and organizations-services tables capture these commercial relationships. Each association ties a service to the organizations that license or subscribe to it.

**Table `services_organizations`**

| service_id | client_organization_client_id |
|---|---|
| 1996925 | Erin Olson |
| 1996925 | Jorge Sullivan |
| 3990164 | Jorge Sullivan |
| 3990164 | Kimberly Maynard |
| 5844258 | Kimberly Maynard |
| 5844258 | Michelle Kelley |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Michelle Kelley |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Erin Olson |

**Table `organizations_services`**

| client_organization_client_id | service_id |
|---|---|
| Erin Olson | 1996925 |
| Erin Olson | 3990164 |
| Jorge Sullivan | 3990164 |
| Jorge Sullivan | 5844258 |
| Kimberly Maynard | 5844258 |
| Kimberly Maynard | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| Michelle Kelley | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| Michelle Kelley | 1996925 |

The services-organizations table records which client organizations have access to a given streaming service, while organizations-services confirms the organization's subscription scope. These links form the basis for billing, access control, and service-level agreement enforcement across the delivery ecosystem.

## Engineer and Organization Relationships

Technical support engineers are assigned to client organizations, and the organizations-engineers, engineers-organizations, engineers-infrastructures, and engineers-services tables document these operational assignments. Engineers may also be linked directly to network infrastructures and streaming services they support.

**Table `organizations_engineers`**

| client_organization_client_id | technical_support_engineer_id |
|---|---|
| Erin Olson | 100 |
| Erin Olson | 101 |
| Jorge Sullivan | 101 |
| Jorge Sullivan | 102 |
| Kimberly Maynard | 102 |
| Kimberly Maynard | 103 |
| Michelle Kelley | 103 |
| Michelle Kelley | 100 |

**Table `engineers_organizations`**

| technical_support_engineer_id | client_organization_client_id |
|---|---|
| 100 | Erin Olson |
| 100 | Jorge Sullivan |
| 101 | Jorge Sullivan |
| 101 | Kimberly Maynard |
| 102 | Kimberly Maynard |
| 102 | Michelle Kelley |
| 103 | Michelle Kelley |
| 103 | Erin Olson |

**Table `engineers_infrastructures`**

| technical_support_engineer_id | network_infrastructure_network_id |
|---|---|
| 100 | e6196808-8fd1-11eb-924d-9cd76263cbd0 |
| 100 | 7441146 |
| 101 | 7441146 |
| 101 | 8387535 |
| 102 | 8387535 |
| 102 | 6589 |
| 103 | 6589 |
| 103 | e6196808-8fd1-11eb-924d-9cd76263cbd0 |

**Table `engineers_services`**

| technical_support_engineer_id | service_id |
|---|---|
| 100 | 1996925 |
| 100 | 3990164 |
| 101 | 3990164 |
| 101 | 5844258 |
| 102 | 5844258 |
| 102 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 |
| 103 | 1996925 |

An organizations-engineers record assigns a specific engineer to support a client organization, while engineers-organizations confirms the engineer's coverage area. Engineers-infrastructures links tie engineers to the network paths they maintain, and engineers-services connects them to the streaming services they troubleshoot. Together, these relationships define the operational support matrix.

## Infrastructure Relationships

Network infrastructures interconnect with client organizations, codecs, and engineers through dedicated junction tables. The infrastructures-organizations, infrastructures-codecs, and infrastructures-engineers tables establish which organizations use which networks, which codecs traverse which paths, and which engineers are responsible for which infrastructure components.

**Table `infrastructures_organizations`**

| network_infrastructure_network_id | client_organization_client_id |
|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | Erin Olson |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | Jorge Sullivan |
| 7441146 | Jorge Sullivan |
| 7441146 | Kimberly Maynard |
| 8387535 | Kimberly Maynard |
| 8387535 | Michelle Kelley |
| 6589 | Michelle Kelley |
| 6589 | Erin Olson |

**Table `infrastructures_codecs`**

| network_infrastructure_network_id | video_codec_id |
|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | 1 |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | 2 |
| 7441146 | 2 |
| 7441146 | 3 |
| 8387535 | 3 |
| 8387535 | 4 |
| 6589 | 4 |
| 6589 | 1 |

**Table `infrastructures_engineers`**

| network_infrastructure_network_id | technical_support_engineer_id |
|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | 100 |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | 101 |
| 7441146 | 101 |
| 7441146 | 102 |
| 8387535 | 102 |
| 8387535 | 103 |
| 6589 | 103 |
| 6589 | 100 |

An infrastructures-organizations record identifies the network paths available to a client organization, while infrastructures-codecs specifies which encoding formats are routed through each network. Infrastructures-engineers links assign operational responsibility for each network segment to specific engineers, ensuring that every infrastructure component has a designated support owner.

## Analytical Views

The following analytical views synthesize the base tables and junction records into focused detail reports, each answering a specific operational question about the video delivery ecosystem.

**View `v_video_delivery_service_video_codec_detail`**

```sql
CREATE VIEW v_video_delivery_service_video_codec_detail AS
SELECT a.service_id, a.service_tier, a.uptime_percentage, b.id AS codec_id, b.codec_id AS codec_codec_id, b.codec_name AS codec_codec_name
FROM video_delivery_services a
  JOIN services_codecs j ON j.service_id = a.service_id
  JOIN video_codecs b ON b.id = j.video_codec_id;
```

| service_id | service_tier | uptime_percentage | codec_id | codec_codec_id | codec_codec_name |
|---|---|---|---|---|---|
| 1996925 | premium | 16.45 | 1 | 10966228 | H.264 |
| 1996925 | premium | 16.45 | 2 | 4180962 | H.265 |
| 3990164 | standard | 18.90 | 2 | 4180962 | H.265 |
| 3990164 | standard | 18.90 | 3 | state_et_1 | MPEG-DASH |
| 5844258 | basic | 21.35 | 3 | state_et_1 | MPEG-DASH |
| 5844258 | basic | 21.35 | 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | 1 | 10966228 | H.264 |

This view joins streaming services with their supported codecs, answering which encoding formats are available per service. A row pairing service `1996925` (premium, `web`, `china`) with codec `H.264` (`10966228`, `11.95` compression, `720p`) shows how a premium web service in China delivers content using a widely compatible codec at moderate compression.

**View `v_video_delivery_service_d_r_m_system_detail`**

```sql
CREATE VIEW v_video_delivery_service_d_r_m_system_detail AS
SELECT a.service_id, a.service_tier, a.uptime_percentage, b.drm_id AS system_drm_id, b.vendor_name AS system_vendor_name, b.encryption_standard AS system_encryption_standard
FROM video_delivery_services a
  JOIN services_systems j ON j.service_id = a.service_id
  JOIN d_r_m_systems b ON b.drm_id = j.d_r_m_system_drm_id;
```

| service_id | service_tier | uptime_percentage | system_drm_id | system_vendor_name | system_encryption_standard |
|---|---|---|---|---|---|
| 1996925 | premium | 16.45 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | OMA DRM | AES-128 |
| 1996925 | premium | 16.45 | gd_fp_ne_acc2 | Marlin | AES-256 |
| 3990164 | standard | 18.90 | gd_fp_ne_acc2 | Marlin | AES-256 |
| 3990164 | standard | 18.90 | 2986222 | OMA DRM | ChaCha20 |
| 5844258 | basic | 21.35 | 2986222 | OMA DRM | ChaCha20 |
| 5844258 | basic | 21.35 | 17191062 | Marlin | AES-128 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | 17191062 | Marlin | AES-128 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | OMA DRM | AES-128 |

This view links services to their DRM systems, revealing the content protection posture of each service. A row connecting service `3990164` (standard, `mobile`, `europe`) with DRM system `gd_fp_ne_acc2` (Marlin, `AES-256`, `L2` compliance) demonstrates how a mobile service in Europe enforces strong encryption at an elevated compliance level.

**View `v_video_delivery_service_client_organization_detail`**

```sql
CREATE VIEW v_video_delivery_service_client_organization_detail AS
SELECT a.service_id, a.service_tier, a.uptime_percentage, b.client_id AS organization_client_id, b.organization_name AS organization_organization_name, b.industry_sector AS organization_industry_sector
FROM video_delivery_services a
  JOIN services_organizations j ON j.service_id = a.service_id
  JOIN client_organizations b ON b.client_id = j.client_organization_client_id;
```

| service_id | service_tier | uptime_percentage | organization_client_id | organization_organization_name | organization_industry_sector |
|---|---|---|---|---|---|
| 1996925 | premium | 16.45 | Erin Olson | Staples Inc. | digital_entertainment |
| 1996925 | premium | 16.45 | Jorge Sullivan | Oscar Health Inc. | television |
| 3990164 | standard | 18.90 | Jorge Sullivan | Oscar Health Inc. | television |
| 3990164 | standard | 18.90 | Kimberly Maynard | Atlantic Richfield | movie_retailer |
| 5844258 | basic | 21.35 | Kimberly Maynard | Atlantic Richfield | movie_retailer |
| 5844258 | basic | 21.35 | Michelle Kelley | Port Loko | system_integrator |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | Michelle Kelley | Port Loko | system_integrator |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 | Erin Olson | Staples Inc. | digital_entertainment |

This view associates services with the client organizations that consume them, answering which organizations have access to which services. A row pairing service `5844258` (basic, `smart_tv`, `global`) with client `Atlantic Richfield` (`movie_retailer`, `global`) shows how a decommissioned global smart TV service was previously available to a movie retail organization.

**View `v_d_r_m_system_video_delivery_service_detail`**

```sql
CREATE VIEW v_d_r_m_system_video_delivery_service_detail AS
SELECT a.drm_id, a.vendor_name, a.encryption_standard, b.service_id AS service_service_id, b.service_tier AS service_service_tier, b.uptime_percentage AS service_uptime_percentage
FROM d_r_m_systems a
  JOIN systems_services j ON j.d_r_m_system_drm_id = a.drm_id
  JOIN video_delivery_services b ON b.service_id = j.service_id;
```

| drm_id | vendor_name | encryption_standard | service_service_id | service_service_tier | service_uptime_percentage |
|---|---|---|---|---|---|
| e9525746-8fd1-11eb-924d-9cd76263cbd0 | OMA DRM | AES-128 | 1996925 | premium | 16.45 |
| e9525746-8fd1-11eb-924d-9cd76263cbd0 | OMA DRM | AES-128 | 3990164 | standard | 18.90 |
| gd_fp_ne_acc2 | Marlin | AES-256 | 3990164 | standard | 18.90 |
| gd_fp_ne_acc2 | Marlin | AES-256 | 5844258 | basic | 21.35 |
| 2986222 | OMA DRM | ChaCha20 | 5844258 | basic | 21.35 |
| 2986222 | OMA DRM | ChaCha20 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| 17191062 | Marlin | AES-128 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| 17191062 | Marlin | AES-128 | 1996925 | premium | 16.45 |

This view reverses the perspective, listing all services protected by a given DRM system. A row showing DRM system `2986222` (OMA DRM, `ChaCha20`, `L3`) linked to service `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` (premium, `set_top_box`, `china`) reveals how a high-compliance DRM system secures a premium set-top-box service in China.

**View `v_video_codec_video_delivery_service_detail`**

```sql
CREATE VIEW v_video_codec_video_delivery_service_detail AS
SELECT a.id, a.codec_id, a.codec_name, b.service_id AS service_service_id, b.service_tier AS service_service_tier, b.uptime_percentage AS service_uptime_percentage
FROM video_codecs a
  JOIN codecs_services j ON j.video_codec_id = a.id
  JOIN video_delivery_services b ON b.service_id = j.service_id;
```

| id | codec_id | codec_name | service_service_id | service_service_tier | service_uptime_percentage |
|---|---|---|---|---|---|
| 1 | 10966228 | H.264 | 1996925 | premium | 16.45 |
| 1 | 10966228 | H.264 | 3990164 | standard | 18.90 |
| 2 | 4180962 | H.265 | 3990164 | standard | 18.90 |
| 2 | 4180962 | H.265 | 5844258 | basic | 21.35 |
| 3 | state_et_1 | MPEG-DASH | 5844258 | basic | 21.35 |
| 3 | state_et_1 | MPEG-DASH | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS | 1996925 | premium | 16.45 |

This view enumerates all services that utilize a specific codec, answering which services depend on a given encoding format. A row connecting codec `H.265` (`4180962`, `15.90` compression, `1080p`) with service `1996925` (premium, `web`, `china`) shows how a premium web service leverages a higher-efficiency codec for improved quality at moderate bitrate.

**View `v_video_codec_network_infrastructure_detail`**

```sql
CREATE VIEW v_video_codec_network_infrastructure_detail AS
SELECT a.id, a.codec_id, a.codec_name, b.network_id AS infrastructure_network_id, b.protocol AS infrastructure_protocol, b.bandwidth AS infrastructure_bandwidth
FROM video_codecs a
  JOIN codecs_infrastructures j ON j.video_codec_id = a.id
  JOIN network_infrastructures b ON b.network_id = j.network_infrastructure_network_id;
```

| id | codec_id | codec_name | infrastructure_network_id | infrastructure_protocol | infrastructure_bandwidth |
|---|---|---|---|---|---|
| 1 | 10966228 | H.264 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 |
| 1 | 10966228 | H.264 | 7441146 | UDP | 23.40 |
| 2 | 4180962 | H.265 | 7441146 | UDP | 23.40 |
| 2 | 4180962 | H.265 | 8387535 | HTTP | 26.60 |
| 3 | state_et_1 | MPEG-DASH | 8387535 | HTTP | 26.60 |
| 3 | state_et_1 | MPEG-DASH | 6589 | HTTPS | 29.80 |
| 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS | 6589 | HTTPS | 29.80 |
| 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS | e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 |

This view maps codecs to the network infrastructures that carry their traffic, answering which networks are optimized for each encoding format. A row pairing codec `MPEG-DASH` (`state_et_1`, `19.85` compression, `4K`) with network `8387535` (HTTP, `26.60` bandwidth, `22.35` latency, `macos`) indicates that adaptive streaming codecs for 4K content traverse HTTP-based networks with moderate latency.

**View `v_client_organization_video_delivery_service_detail`**

```sql
CREATE VIEW v_client_organization_video_delivery_service_detail AS
SELECT a.client_id, a.organization_name, a.industry_sector, b.service_id AS service_service_id, b.service_tier AS service_service_tier, b.uptime_percentage AS service_uptime_percentage
FROM client_organizations a
  JOIN organizations_services j ON j.client_organization_client_id = a.client_id
  JOIN video_delivery_services b ON b.service_id = j.service_id;
```

| client_id | organization_name | industry_sector | service_service_id | service_service_tier | service_uptime_percentage |
|---|---|---|---|---|---|
| Erin Olson | Staples Inc. | digital_entertainment | 1996925 | premium | 16.45 |
| Erin Olson | Staples Inc. | digital_entertainment | 3990164 | standard | 18.90 |
| Jorge Sullivan | Oscar Health Inc. | television | 3990164 | standard | 18.90 |
| Jorge Sullivan | Oscar Health Inc. | television | 5844258 | basic | 21.35 |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | 5844258 | basic | 21.35 |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| Michelle Kelley | Port Loko | system_integrator | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| Michelle Kelley | Port Loko | system_integrator | 1996925 | premium | 16.45 |

This view lists all services available to a specific client organization, answering which streaming services an organization can access. A row connecting client `Oscar Health Inc.` (`television`, `europe`) with service `3990164` (standard, `mobile`, `europe`) shows how a television-sector organization in Europe accesses a standard mobile service.

**View `v_client_organization_technical_support_engineer_detail`**

```sql
CREATE VIEW v_client_organization_technical_support_engineer_detail AS
SELECT a.client_id, a.organization_name, a.industry_sector, b.technical_support_engineer_id AS engineer_technical_support_engineer_id, b.engineer_id AS engineer_engineer_id, b.name AS engineer_name
FROM client_organizations a
  JOIN organizations_engineers j ON j.client_organization_client_id = a.client_id
  JOIN technical_support_engineers b ON b.technical_support_engineer_id = j.technical_support_engineer_id;
```

| client_id | organization_name | industry_sector | engineer_technical_support_engineer_id | engineer_engineer_id | engineer_name |
|---|---|---|---|---|---|
| Erin Olson | Staples Inc. | digital_entertainment | 100 | 325452 | Extended Review |
| Erin Olson | Staples Inc. | digital_entertainment | 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A |
| Jorge Sullivan | Oscar Health Inc. | television | 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A |
| Jorge Sullivan | Oscar Health Inc. | television | 102 | 39800619 | Baseline Model |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | 102 | 39800619 | Baseline Model |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | 103 | 5917278 | Distributed Cluster |
| Michelle Kelley | Port Loko | system_integrator | 103 | 5917278 | Distributed Cluster |
| Michelle Kelley | Port Loko | system_integrator | 100 | 325452 | Extended Review |

This view associates client organizations with their assigned support engineers, answering which engineers are responsible for each organization. A row pairing client `Staples Inc.` (`digital_entertainment`, `china`) with engineer `325452` (`Extended Review`, `beijing`, `46` years experience) demonstrates how a China-based digital entertainment client is supported by a local engineer with extensive experience.

**View `v_client_organization_network_infrastructure_detail`**

```sql
CREATE VIEW v_client_organization_network_infrastructure_detail AS
SELECT a.client_id, a.organization_name, a.industry_sector, b.network_id AS infrastructure_network_id, b.protocol AS infrastructure_protocol, b.bandwidth AS infrastructure_bandwidth
FROM client_organizations a
  JOIN organizations_infrastructures j ON j.client_organization_client_id = a.client_id
  JOIN network_infrastructures b ON b.network_id = j.network_infrastructure_network_id;
```

| client_id | organization_name | industry_sector | infrastructure_network_id | infrastructure_protocol | infrastructure_bandwidth |
|---|---|---|---|---|---|
| Erin Olson | Staples Inc. | digital_entertainment | e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 |
| Erin Olson | Staples Inc. | digital_entertainment | 7441146 | UDP | 23.40 |
| Jorge Sullivan | Oscar Health Inc. | television | 7441146 | UDP | 23.40 |
| Jorge Sullivan | Oscar Health Inc. | television | 8387535 | HTTP | 26.60 |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | 8387535 | HTTP | 26.60 |
| Kimberly Maynard | Atlantic Richfield | movie_retailer | 6589 | HTTPS | 29.80 |
| Michelle Kelley | Port Loko | system_integrator | 6589 | HTTPS | 29.80 |
| Michelle Kelley | Port Loko | system_integrator | e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 |

This view links client organizations to the network infrastructures they use, answering which networks serve each organization. A row connecting client `Port Loko` (`system_integrator`, `china`) with network `6589` (HTTPS, `29.80` bandwidth, `26.80` latency, `windows`) shows how a system integrator in China relies on a high-bandwidth HTTPS network for its operations.

**View `v_technical_support_engineer_client_organization_detail`**

```sql
CREATE VIEW v_technical_support_engineer_client_organization_detail AS
SELECT a.technical_support_engineer_id, a.engineer_id, a.name, b.client_id AS organization_client_id, b.organization_name AS organization_organization_name, b.industry_sector AS organization_industry_sector
FROM technical_support_engineers a
  JOIN engineers_organizations j ON j.technical_support_engineer_id = a.technical_support_engineer_id
  JOIN client_organizations b ON b.client_id = j.client_organization_client_id;
```

| technical_support_engineer_id | engineer_id | name | organization_client_id | organization_organization_name | organization_industry_sector |
|---|---|---|---|---|---|
| 100 | 325452 | Extended Review | Erin Olson | Staples Inc. | digital_entertainment |
| 100 | 325452 | Extended Review | Jorge Sullivan | Oscar Health Inc. | television |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | Jorge Sullivan | Oscar Health Inc. | television |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | Kimberly Maynard | Atlantic Richfield | movie_retailer |
| 102 | 39800619 | Baseline Model | Kimberly Maynard | Atlantic Richfield | movie_retailer |
| 102 | 39800619 | Baseline Model | Michelle Kelley | Port Loko | system_integrator |
| 103 | 5917278 | Distributed Cluster | Michelle Kelley | Port Loko | system_integrator |
| 103 | 5917278 | Distributed Cluster | Erin Olson | Staples Inc. | digital_entertainment |

This view reverses the support perspective, listing all organizations assigned to a given engineer. A row showing engineer `5917278` (`Distributed Cluster`, `beijing`, `79` years experience) linked to client `Atlantic Richfield` (`movie_retailer`, `global`) reveals how a senior engineer in Beijing supports a globally distributed movie retail organization.

**View `v_technical_support_engineer_network_infrastructure_detail`**

```sql
CREATE VIEW v_technical_support_engineer_network_infrastructure_detail AS
SELECT a.technical_support_engineer_id, a.engineer_id, a.name, b.network_id AS infrastructure_network_id, b.protocol AS infrastructure_protocol, b.bandwidth AS infrastructure_bandwidth
FROM technical_support_engineers a
  JOIN engineers_infrastructures j ON j.technical_support_engineer_id = a.technical_support_engineer_id
  JOIN network_infrastructures b ON b.network_id = j.network_infrastructure_network_id;
```

| technical_support_engineer_id | engineer_id | name | infrastructure_network_id | infrastructure_protocol | infrastructure_bandwidth |
|---|---|---|---|---|---|
| 100 | 325452 | Extended Review | e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 |
| 100 | 325452 | Extended Review | 7441146 | UDP | 23.40 |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | 7441146 | UDP | 23.40 |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | 8387535 | HTTP | 26.60 |
| 102 | 39800619 | Baseline Model | 8387535 | HTTP | 26.60 |
| 102 | 39800619 | Baseline Model | 6589 | HTTPS | 29.80 |
| 103 | 5917278 | Distributed Cluster | 6589 | HTTPS | 29.80 |
| 103 | 5917278 | Distributed Cluster | e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 |

This view maps engineers to the network infrastructures they maintain, answering which networks each engineer is responsible for. A row connecting engineer `ChIJAaQOcwdu5kcRArYphCv0bl0` (`Pilot Initiative A`, `europe`, `57` years experience) with network `7441146` (UDP, `23.40` bandwidth, `17.90` latency, `linux`) shows how a Europe-based engineer oversees a UDP network, even though that network is currently offline.

**View `v_technical_support_engineer_video_delivery_service_detail`**

```sql
CREATE VIEW v_technical_support_engineer_video_delivery_service_detail AS
SELECT a.technical_support_engineer_id, a.engineer_id, a.name, b.service_id AS service_service_id, b.service_tier AS service_service_tier, b.uptime_percentage AS service_uptime_percentage
FROM technical_support_engineers a
  JOIN engineers_services j ON j.technical_support_engineer_id = a.technical_support_engineer_id
  JOIN video_delivery_services b ON b.service_id = j.service_id;
```

| technical_support_engineer_id | engineer_id | name | service_service_id | service_service_tier | service_uptime_percentage |
|---|---|---|---|---|---|
| 100 | 325452 | Extended Review | 1996925 | premium | 16.45 |
| 100 | 325452 | Extended Review | 3990164 | standard | 18.90 |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | 3990164 | standard | 18.90 |
| 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A | 5844258 | basic | 21.35 |
| 102 | 39800619 | Baseline Model | 5844258 | basic | 21.35 |
| 102 | 39800619 | Baseline Model | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| 103 | 5917278 | Distributed Cluster | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | premium | 23.80 |
| 103 | 5917278 | Distributed Cluster | 1996925 | premium | 16.45 |

This view associates engineers with the streaming services they support, answering which services each engineer can troubleshoot. A row pairing engineer `39800619` (`Baseline Model`, `remote`, `68` years experience) with service `5844258` (basic, `smart_tv`, `global`) indicates that a remote engineer with a PhD is assigned to a decommissioned global smart TV service, likely for archival or transition support.

**View `v_network_infrastructure_client_organization_detail`**

```sql
CREATE VIEW v_network_infrastructure_client_organization_detail AS
SELECT a.network_id, a.protocol, a.bandwidth, b.client_id AS organization_client_id, b.organization_name AS organization_organization_name, b.industry_sector AS organization_industry_sector
FROM network_infrastructures a
  JOIN infrastructures_organizations j ON j.network_infrastructure_network_id = a.network_id
  JOIN client_organizations b ON b.client_id = j.client_organization_client_id;
```

| network_id | protocol | bandwidth | organization_client_id | organization_organization_name | organization_industry_sector |
|---|---|---|---|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | Erin Olson | Staples Inc. | digital_entertainment |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | Jorge Sullivan | Oscar Health Inc. | television |
| 7441146 | UDP | 23.40 | Jorge Sullivan | Oscar Health Inc. | television |
| 7441146 | UDP | 23.40 | Kimberly Maynard | Atlantic Richfield | movie_retailer |
| 8387535 | HTTP | 26.60 | Kimberly Maynard | Atlantic Richfield | movie_retailer |
| 8387535 | HTTP | 26.60 | Michelle Kelley | Port Loko | system_integrator |
| 6589 | HTTPS | 29.80 | Michelle Kelley | Port Loko | system_integrator |
| 6589 | HTTPS | 29.80 | Erin Olson | Staples Inc. | digital_entertainment |

This view lists all organizations served by a specific network infrastructure, answering which clients depend on each network path. A row connecting network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (TCP/IP, `20.20` bandwidth, `13.45` latency, `windows`) with client `Oscar Health Inc.` (`television`, `europe`) shows how a low-latency TCP/IP network in Europe serves a television-sector organization.

**View `v_network_infrastructure_video_codec_detail`**

```sql
CREATE VIEW v_network_infrastructure_video_codec_detail AS
SELECT a.network_id, a.protocol, a.bandwidth, b.id AS codec_id, b.codec_id AS codec_codec_id, b.codec_name AS codec_codec_name
FROM network_infrastructures a
  JOIN infrastructures_codecs j ON j.network_infrastructure_network_id = a.network_id
  JOIN video_codecs b ON b.id = j.video_codec_id;
```

| network_id | protocol | bandwidth | codec_id | codec_codec_id | codec_codec_name |
|---|---|---|---|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | 1 | 10966228 | H.264 |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | 2 | 4180962 | H.265 |
| 7441146 | UDP | 23.40 | 2 | 4180962 | H.265 |
| 7441146 | UDP | 23.40 | 3 | state_et_1 | MPEG-DASH |
| 8387535 | HTTP | 26.60 | 3 | state_et_1 | MPEG-DASH |
| 8387535 | HTTP | 26.60 | 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS |
| 6589 | HTTPS | 29.80 | 4 | 5f9122ac-8fcd-11eb-924d-9cd76263cbd0 | HLS |
| 6589 | HTTPS | 29.80 | 1 | 10966228 | H.264 |

This view maps network infrastructures to the codecs they carry, answering which encoding formats traverse each network. A row linking network `e6196808-8fd1-11eb-924d-9cd76263cbd0` (TCP/IP, `20.20` bandwidth, `13.45` latency) with codec `HLS` (`5f9122ac-8fcd-11eb-924d-9cd76263cbd0`, `23.80` compression, `62` bitrate, `720p`) demonstrates how a low-latency TCP/IP network transports a high-compression adaptive streaming codec.

**View `v_network_infrastructure_technical_support_engineer_detail`**

```sql
CREATE VIEW v_network_infrastructure_technical_support_engineer_detail AS
SELECT a.network_id, a.protocol, a.bandwidth, b.technical_support_engineer_id AS engineer_technical_support_engineer_id, b.engineer_id AS engineer_engineer_id, b.name AS engineer_name
FROM network_infrastructures a
  JOIN infrastructures_engineers j ON j.network_infrastructure_network_id = a.network_id
  JOIN technical_support_engineers b ON b.technical_support_engineer_id = j.technical_support_engineer_id;
```

| network_id | protocol | bandwidth | engineer_technical_support_engineer_id | engineer_engineer_id | engineer_name |
|---|---|---|---|---|---|
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | 100 | 325452 | Extended Review |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | TCP/IP | 20.20 | 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A |
| 7441146 | UDP | 23.40 | 101 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Pilot Initiative A |
| 7441146 | UDP | 23.40 | 102 | 39800619 | Baseline Model |
| 8387535 | HTTP | 26.60 | 102 | 39800619 | Baseline Model |
| 8387535 | HTTP | 26.60 | 103 | 5917278 | Distributed Cluster |
| 6589 | HTTPS | 29.80 | 103 | 5917278 | Distributed Cluster |
| 6589 | HTTPS | 29.80 | 100 | 325452 | Extended Review |

This view associates network infrastructures with the engineers responsible for them, answering which engineers maintain each network. A row connecting network `8387535` (HTTP, `26.60` bandwidth, `22.35` latency, `macos`, `degraded`) with engineer `39800619` (`Baseline Model`, `remote`, `68` years experience) shows how a remote engineer with a PhD is assigned to a degraded HTTP network on macOS, likely for diagnostic and recovery work.

## Closing Synthesis

The video delivery ecosystem is defined by a dense web of relationships among services, codecs, DRM systems, client organizations, engineers, and network infrastructures. Each base table captures a distinct entity type with its operational attributes, while the junction tables encode the associations that make the system function in practice. The analytical views pull these pieces together into actionable detail reports, enabling operators to answer questions about codec availability, DRM compliance, engineer assignments, and network utilization at a glance. Understanding these relationships is essential for capacity planning, incident response, and service lifecycle management across the entire delivery stack.

## Data appendix

**Table `organizations_infrastructures`**

| client_organization_client_id | network_infrastructure_network_id |
|---|---|
| Erin Olson | e6196808-8fd1-11eb-924d-9cd76263cbd0 |
| Erin Olson | 7441146 |
| Jorge Sullivan | 7441146 |
| Jorge Sullivan | 8387535 |
| Kimberly Maynard | 8387535 |
| Kimberly Maynard | 6589 |
| Michelle Kelley | 6589 |
| Michelle Kelley | e6196808-8fd1-11eb-924d-9cd76263cbd0 |
