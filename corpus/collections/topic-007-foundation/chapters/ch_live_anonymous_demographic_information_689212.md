---
chapter_id: ch_live_anonymous_demographic_information_689212
topic_id: 7
family: 08_derived
cited_terms: ['anonymous_demographic_information', 'ebpfmap_pinned_at_path', 'designative_with_naming_authority']
model: engine-refine
---

Data governance for demographic information requires a layered architecture that separates raw data from its metadata, enforces type discipline on attribute values, and maintains an audit trail through checksum algorithms and naming authority records. The core demographic registry captures three distinct data classes within a single entity: anonymous demographic fields such as `school_district_enrollment`, `household_size`, and `geographic_region`; demographic information including `health_survey_responses`, `age_brackets`, and `household_size`; and personally identifiable information comprising `home_address`, `full_legal_name`, and `passport_number`. Each record is identified by a stable surrogate key—`INFO-0001` through `INFO-0004` in the observed dataset—providing a persistent handle for downstream joins and access-control evaluations. The separation of anonymous demographic information from personally identifiable information within the same row is intentional: it enables differential access policies where analysts may query `geographic_region` and `household_size` without ever resolving the `home_address` or `full_legal_name` columns that appear in the same entity.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

**t_anonymous_demographic_information_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INFO-0001 | confidence | xsd:decimal |
| INFO-0002 | dimension_kind | xsd:string |
| INFO-0003 | method | xsd:string |
| INFO-0004 | recorded_at | xsd:dateTime |
| INFO-0005 | uncertainty | xsd:decimal |
| INFO-0006 | unit | xsd:string |
| INFO-0007 | value | xsd:decimal |
| INFO-0008 | encoding | xsd:string |

Attribute metadata is externalized into a dedicated registry that decouples the definition of an attribute from its stored values. Each attribute carries a human-readable name—`confidence`, `dimension_kind`, `method`, `recorded_at`—and an XSD type annotation such as `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This type discipline is enforced at the value-storage layer, where three separate value tables partition data by type: `t_anonymous_demographic_information_val_decimal` holds numeric measurements like `0.448` and `124.47`; `t_anonymous_demographic_information_val_varchar` stores string-valued attributes including `Dimension Kind 01`, `Encoding 02`, and locale codes such as `de`; and `t_anonymous_demographic_information_val_datetime` records temporal stamps like `2024-08-15T06:37:30` and `2023-10-27T17:02:18`. Every value row is linked to its parent entity through `entity_id` and to its attribute definition through `attr_id`, forming a normalized entity-attribute-value model that supports arbitrary attribute expansion without schema migration.

**t_anonymous_demographic_information_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0004 | 2024-08-15T06:37:30 |
| INFO-0002 | INFO-0002 | INFO-0004 | 2023-10-27T17:02:18 |
| INFO-0003 | INFO-0003 | INFO-0004 | 2023-05-03T14:37:32 |
| INFO-0004 | INFO-0004 | INFO-0004 | 2023-05-25T07:11:49 |
| INFO-0005 | INFO-0005 | INFO-0004 | 2024-09-13T22:50:49 |
| INFO-0006 | INFO-0006 | INFO-0004 | 2024-02-07T11:47:33 |

**t_anonymous_demographic_information_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0001 | 0.448 |
| INFO-0002 | INFO-0001 | INFO-0005 | 124.47 |
| INFO-0003 | INFO-0001 | INFO-0007 | 40.18 |
| INFO-0004 | INFO-0002 | INFO-0001 | 0.771 |
| INFO-0005 | INFO-0002 | INFO-0005 | 477.18 |
| INFO-0006 | INFO-0002 | INFO-0007 | 862.09 |
| INFO-0007 | INFO-0003 | INFO-0001 | 0.785 |
| INFO-0008 | INFO-0003 | INFO-0005 | 9.71 |

**t_anonymous_demographic_information_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0002 | Dimension Kind 01 |
| INFO-0002 | INFO-0001 | INFO-0008 | Encoding 02 |
| INFO-0003 | INFO-0001 | INFO-0009 | pre-release note |
| INFO-0004 | INFO-0001 | INFO-0010 | de |
| INFO-0005 | INFO-0001 | INFO-0003 | automated |
| INFO-0006 | INFO-0001 | INFO-0006 | nm |
| INFO-0007 | INFO-0002 | INFO-0002 | Dimension Kind 07 |
| INFO-0008 | INFO-0002 | INFO-0008 | Encoding 08 |

Integrity and provenance are maintained through checksum algorithms recorded in the naming authority registry, which assigns designative identifiers to standards and code sets under the governance of bodies such as IANA and Crossref. The designatives `OGC-API-Feat`, `DCAT-AP-3.0`, `HAN-0092`, and `RFC-7578` each carry a registered checksum algorithm—`md5`, `md5`, `blake2b`, and `sha1` respectively—enabling downstream systems to verify the authenticity of referenced artifacts. The code field, with values like `C-07`, `E-21`, and `D-33`, provides a secondary lookup key that maps designatives to internal catalog entries. This registry functions as a trust anchor: when a system receives a data artifact purportedly derived from `RFC-7578`, it can compute the checksum using the registered `sha1` algorithm and compare it against the expected digest to detect tampering or corruption.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | IANA | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | Crossref | md5 | E-21 |
| AUTH-0003 | HAN-0092 | IANA | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | IANA | sha1 | D-33 |

Access control and operational ownership are expressed through the BPF map path registry, which records the filesystem bindings of eBPF maps alongside their responsible teams and classification tags. Maps such as `sock_hash`, `cpumap`, `conntrack_map`, and `flow_table` are pinned at canonical paths including `/run/bpf/sockops`, `/sys/fs/bpf/cilium_flow`, and `/sys/fs/bpf/netfilter_flow`. Ownership is assigned to operational groups—`sre` and `data-engineering`—while tags such as `pii`, `internal`, and `verified` provide machine-readable classification that can be consumed by policy engines. The `pii` tag on maps owned by both `sre` and `data-engineering` signals that these kernel-level data structures process or expose personally identifiable information, triggering enhanced monitoring and audit requirements. This ownership-tagging pattern mirrors the demographic information model: just as `personally_identifiable_information` is flagged within the demographic registry, the `pii` tag on BPF maps creates a parallel classification layer that operates at the infrastructure level.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | /run/bpf/sockops | sre | pii |
| PATH-0002 | cpumap | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | conntrack_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | flow_table | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | sock_hash | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | lru_percpu_hash | /sys/fs/bpf/xdp_ingress | platform-team | verified |