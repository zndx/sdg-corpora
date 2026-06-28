---
chapter_id: ch_live_social_networking_service_usage_64ff2e
topic_id: 40
family: 08_derived
cited_terms: ['social_networking_service_usage', 'cgroup_skb_subclass', 'directive_authored_and_applies']
model: engine-refine
---

Every operational record begins with an identifier—a unique string that anchors an entity within the data fabric. Identifiers such as USAG-0001, SKB-0001, and APPL-0001 serve as the primary keys for their respective entities, enabling precise cross-referencing across fact and dimension tables. An entity represents any discrete object of governance interest: a social usage event, a cgroup subclass, or a compliance directive such as HIPAA Audit Logging or ISO 27001 Access Control. Each entity carries attributes—named properties that capture its defining characteristics. The attribute schema distinguishes between the attribute name itself (effective_date, enforcement, mandatory, priority) and its type (xsd:date, xsd:string, xsd:boolean, xsd:integer), a separation that enforces type safety while permitting heterogeneous value storage. Boolean attributes such as mandatory resolve to true across all recorded entities; date attributes like effective_date carry values ranging from 2023-01-05 through 2025-04-09; integer attributes such as priority accept values from 5 to 736; and string attributes hold free-form content including Encoding 01, Enforcement 02, and pre-release note.

**t_cgroup_skb_subclass**

| id | cgroup |
| --- | --- |
| SKB-0001 | user.slice/user-1001.scope |
| SKB-0002 | user.slice/user-1000.scope |
| SKB-0003 | system.slice/postgresql.service |
| SKB-0004 | kubepods/pod1234567890ab |
| SKB-0005 | docker/4a2b3c1d5e6f |
| SKB-0006 | system.slice/nginx.service |

**t_cgroup_skb_subclass_attaches_to_cgroup**

| id | attaches_to_cgroup |
| --- | --- |
| SKB-0001 | system.slice/nginx.service |
| SKB-0002 | user.slice/user-1001.scope |
| SKB-0003 | user.slice/user-1001.scope |
| SKB-0004 | docker/7d8e9f0a1b2c |
| SKB-0005 | system.slice/docker.service |
| SKB-0006 | kubepods/burstable/pod8f9a0b1c |

**t_directive_authored_and_applies**

| id | directive | authored_by | applies_to |
| --- | --- | --- | --- |
| APPL-0001 | HIPAA Audit Logging | FDA Compliance Office | ISO Certified Facilities |
| APPL-0002 | FDA 21 CFR Compliance | HSA Regulatory Board | Edge Gateway Nodes |
| APPL-0003 | ISO 27001 Access Control | NIST Cyber Division | Cloud Storage Buckets |
| APPL-0004 | FDA 21 CFR Compliance | CISA National Director | Customer PII Datasets |
| APPL-0005 | ISO 27001 Access Control | FDA Compliance Office | Financial Ledger Tables |
| APPL-0006 | GDPR Data Retention | European Commission | HIPAA Covered Entities |

**t_directive_authored_and_applies_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| APPL-0001 | effective_date | xsd:date |
| APPL-0002 | enforcement | xsd:string |
| APPL-0003 | mandatory | xsd:boolean |
| APPL-0004 | priority | xsd:integer |
| APPL-0005 | review_cycle_days | xsd:integer |
| APPL-0006 | scope | xsd:string |
| APPL-0007 | encoding | xsd:string |
| APPL-0008 | label_text | xsd:string |

**t_directive_authored_and_applies_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0003 | true |
| APPL-0002 | APPL-0002 | APPL-0003 | true |
| APPL-0003 | APPL-0003 | APPL-0003 | true |
| APPL-0004 | APPL-0004 | APPL-0003 | true |
| APPL-0005 | APPL-0005 | APPL-0003 | false |
| APPL-0006 | APPL-0006 | APPL-0003 | false |

**t_directive_authored_and_applies_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0001 | 2023-01-05 |
| APPL-0002 | APPL-0002 | APPL-0001 | 2024-10-27 |
| APPL-0003 | APPL-0003 | APPL-0001 | 2025-04-09 |
| APPL-0004 | APPL-0004 | APPL-0001 | 2024-01-05 |
| APPL-0005 | APPL-0005 | APPL-0001 | 2023-12-27 |
| APPL-0006 | APPL-0006 | APPL-0001 | 2023-04-20 |

**t_directive_authored_and_applies_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0004 | 5 |
| APPL-0002 | APPL-0001 | APPL-0005 | 736 |
| APPL-0003 | APPL-0002 | APPL-0004 | 5 |
| APPL-0004 | APPL-0002 | APPL-0005 | 165 |
| APPL-0005 | APPL-0003 | APPL-0004 | 3 |
| APPL-0006 | APPL-0003 | APPL-0005 | 417 |
| APPL-0007 | APPL-0004 | APPL-0004 | 1 |
| APPL-0008 | APPL-0004 | APPL-0005 | 521 |

**t_directive_authored_and_applies_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0007 | Encoding 01 |
| APPL-0002 | APPL-0001 | APPL-0002 | Enforcement 02 |
| APPL-0003 | APPL-0001 | APPL-0008 | pre-release note |
| APPL-0004 | APPL-0001 | APPL-0009 | ja |
| APPL-0005 | APPL-0001 | APPL-0006 | Scope 05 |
| APPL-0006 | APPL-0002 | APPL-0007 | Encoding 06 |
| APPL-0007 | APPL-0002 | APPL-0002 | Enforcement 07 |
| APPL-0008 | APPL-0002 | APPL-0008 | pre-release note |

Attributes are organized into categories that provide classification and filtering capability. Dimension tables attach categorical metadata to their entities—Involves Participant Category 01 through 04 and Utilizes Service Category 01 through 04—while parallel label columns supply human-readable descriptions like Involves Participant Label 01 or Utilizes Service Label 02. This dual structure of machine-parseable categories and human-readable misc labels supports both automated rule evaluation and operational dashboards. The categorical taxonomy extends to directive governance as well, where compliance artifacts are classified by their regulatory provenance: HIPAA Audit Logging authored by the FDA Compliance Office, FDA 21 CFR Compliance by the HSA Regulatory Board, ISO 27001 Access Control by the NIST Cyber Division, and a second instance of FDA 21 CFR Compliance under the CISA National Director, each applying to distinct operational domains ranging from ISO Certified Facilities to Customer PII Datasets.

**dim_involves_participant**

| id | involves_participant_label | involves_participant_category |
| --- | --- | --- |
| USAG-0001 | Involves Participant Label 01 | Involves Participant Category 01 |
| USAG-0002 | Involves Participant Label 02 | Involves Participant Category 02 |
| USAG-0003 | Involves Participant Label 03 | Involves Participant Category 03 |
| USAG-0004 | Involves Participant Label 04 | Involves Participant Category 04 |
| USAG-0005 | Involves Participant Label 05 | Involves Participant Category 05 |
| USAG-0006 | Involves Participant Label 06 | Involves Participant Category 06 |

**dim_utilizes_service**

| id | utilizes_service_label | utilizes_service_category |
| --- | --- | --- |
| USAG-0001 | Utilizes Service Label 01 | Utilizes Service Category 01 |
| USAG-0002 | Utilizes Service Label 02 | Utilizes Service Category 02 |
| USAG-0003 | Utilizes Service Label 03 | Utilizes Service Category 03 |
| USAG-0004 | Utilizes Service Label 04 | Utilizes Service Category 04 |
| USAG-0005 | Utilizes Service Label 05 | Utilizes Service Category 05 |
| USAG-0006 | Utilizes Service Label 06 | Utilizes Service Category 06 |

Fact tables aggregate measurable activity around these entities. The fact_social table records discrete events, each identified by a usage key such as USAG-0001 through USAG-0004, and quantified by an event_count field that captures the volume of associated activity—333, 199, 339, and 283 occurrences respectively. Each fact row links to its contextual dimensions through foreign keys: involves_participant_key references the participant dimension, and utilizes_service_key references the service dimension. This star-schema arrangement permits analysts to slice event counts by participant category, service category, or any combination thereof, yielding operational visibility into which participants and services drive the highest activity volumes.

**fact_social**

| id | involves_participant_key | utilizes_service_key | event_count |
| --- | --- | --- | --- |
| USAG-0001 | USAG-0003 | USAG-0005 | 333 |
| USAG-0002 | USAG-0004 | USAG-0002 | 199 |
| USAG-0003 | USAG-0003 | USAG-0006 | 339 |
| USAG-0004 | USAG-0001 | USAG-0002 | 283 |
| USAG-0005 | USAG-0005 | USAG-0001 | 488 |
| USAG-0006 | USAG-0004 | USAG-0003 | 193 |
| USAG-0007 | USAG-0001 | USAG-0006 | 419 |
| USAG-0008 | USAG-0006 | USAG-0002 | 202 |

Relationships between entities are modeled through junction tables that encode subject, target, and role. The t_cgroup_skb_subclass__attaches_to_cgroup table captures attachment relationships between cgroup subclasses, where the subject column (cgroup_id) identifies the originating entity—SKB-0005, SKB-0006, SKB-0001—and the target column (attaches_to_cgroup_id) identifies the destination—SKB-0001, SKB-0002, SKB-0005. The role column assigns a functional designation to each relationship: observer, contributor, owner, or reviewer. These role designations determine access permissions and audit obligations, ensuring that every attachment carries an explicit governance posture. The underlying dimension tables provide the cgroup path context—user.slice/user-1001.scope, system.slice/nginx.service, kubepods/pod1234567890ab—grounding abstract relationships in concrete system topology.

**t_cgroup_skb_subclass__attaches_to_cgroup**

| id | cgroup_id | attaches_to_cgroup_id | role |
| --- | --- | --- | --- |
| SKB-0001 | SKB-0005 | SKB-0001 | observer |
| SKB-0002 | SKB-0006 | SKB-0002 | contributor |
| SKB-0003 | SKB-0001 | SKB-0005 | owner |
| SKB-0004 | SKB-0006 | SKB-0005 | reviewer |
| SKB-0005 | SKB-0002 | SKB-0004 | owner |
| SKB-0006 | SKB-0003 | SKB-0005 | owner |
| SKB-0007 | SKB-0001 | SKB-0001 | reviewer |
| SKB-0008 | SKB-0003 | SKB-0003 | observer |