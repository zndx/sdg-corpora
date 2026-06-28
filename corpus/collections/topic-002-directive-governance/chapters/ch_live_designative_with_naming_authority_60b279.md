---
chapter_id: ch_live_designative_with_naming_authority_60b279
topic_id: 2
family: 01_foundation
cited_terms: ['designative_with_naming_authority', 'policy_with_jurisdiction', 'third_party_data_sharing']
model: engine-refine
---

Governance frameworks require a precise vocabulary for describing how policies, standards, and data-sharing arrangements are attributed, typed, and enforced across organizational boundaries. At the core of this vocabulary is the designative authority model, wherein each standard or specification—such as OGC-API-Feat, DCAT-AP-3.0, HAN-0092, or RFC-7578—is formally assigned to a named authority and accompanied by an integrity checksum algorithm and a classification code. The designative registry records these assignments under unique identifiers like AUTH-0001 through AUTH-0004, each paired with a checksum algorithm (md5, blake2b, or sha1) and a code such as C-07, E-21, or D-33. The authority responsible for each designation is itself a policy entity, referenced by identifiers such as JURI-0001 through JURI-0005, establishing a cross-walk between naming conventions and the regulatory bodies that govern them.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | JURI-0005 | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | JURI-0004 | md5 | E-21 |
| AUTH-0003 | HAN-0092 | JURI-0003 | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | JURI-0001 | sha1 | D-33 |
| AUTH-0005 | ARX-CLASS-7 | JURI-0005 | sha256 | B-12 |
| AUTH-0006 | OGC-API-Feat | JURI-0005 | blake2b | B-12 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

Policy entities carry their own jurisdictional scope and are linked back to designative authorities through a jurisdictional foreign key. The policy registry maps each jurisdictional identifier to a named policy—Financial Conduct Authority, European Union, or FISMA—and assigns it to a designative authority such as AUTH-0001, AUTH-0002, AUTH-0003, or AUTH-0006. This bidirectional linkage ensures that any standard or specification can be traced to the policy that mandates it, and conversely, that any policy can be audited for the standards it governs. The jurisdictional table thus serves as the central pivot of the governance graph, connecting naming authorities to regulatory frameworks and enabling compliance queries that span both dimensions.

Attributes and their types provide the mechanism by which policy entities are further qualified with structured metadata. The attribute definition table enumerates properties such as effective_date, enforcement, mandatory, and priority, each annotated with an XSD type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—that dictates how values are validated and stored. Rather than embedding these attributes directly on the policy entity, the model employs a normalized value-store pattern: separate tables for boolean, date, integer, and varchar values each hold the actual data, linked back to the policy entity through an entity_id column and to the attribute definition through an attr_id column. For instance, the mandatory attribute (xsd:boolean) takes values of true or false across jurisdictional records, while effective_date (xsd:date) stores dates such as 2023-11-22, 2024-05-18, 2025-06-18, and 2023-05-18. Integer attributes like priority carry values ranging from 1 to 326, and varchar attributes capture free-form descriptors such as Encoding 01, Enforcement 02, intake form, and ja. This separation of attribute schema from attribute values enables dynamic extensibility without schema migration.

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |

Third-party data-sharing arrangements form a parallel governance dimension, capturing the external business relationships through which organizational data is shared. The third-party data-sharing table records each arrangement under a unique identifier—SHAR-0001 through SHAR-0004—and associates it with a named sharing program such as PartnerAnalyticsBridge or GeospatialInfoExchange, along with the participating external business partner, including entities like RegionalHealthNetwork, AcmeAnalyticsCorp, FinServDataHub, and GlobalLogisticsInc. This table operates independently of the policy-jurisdiction graph but is conceptually aligned: just as policies are attributed to authorities and qualified by typed attributes, data-sharing arrangements are attributed to named programs and linked to external partners. The external business partner field serves as the foreign key connecting internal governance structures to the organizations that participate in data exchange, ensuring that every sharing arrangement can be traced to a specific counterparty.

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | AUTH-0006 |
| JURI-0002 | European Union | AUTH-0003 |
| JURI-0003 | European Union | AUTH-0001 |
| JURI-0004 | FISMA | AUTH-0002 |
| JURI-0005 | California Attorney General | AUTH-0005 |
| JURI-0006 | Federal Trade Commission | AUTH-0001 |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_third_party_data_sharing**

| id | third_party_data_sharing | has_participant |
| --- | --- | --- |
| SHAR-0001 | PartnerAnalyticsBridge | RegionalHealthNetwork |
| SHAR-0002 | GeospatialInfoExchange | AcmeAnalyticsCorp |
| SHAR-0003 | GeospatialInfoExchange | FinServDataHub |
| SHAR-0004 | GeospatialInfoExchange | GlobalLogisticsInc |
| SHAR-0005 | IoTSensorDataBridge | AutoOEMDataTeam |
| SHAR-0006 | ResearchCollabDataFlow | TelecomPartnerOps |