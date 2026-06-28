---
chapter_id: ch_live_designative_with_naming_authority_100425
topic_id: 7
family: 01_foundation
cited_terms: ['designative_with_naming_authority', 'primary_key_designation', 'professional_experience']
model: engine-refine
---

Within any structured data governance framework, the identifier serves as the immutable anchor for every registrable concept, whether it denotes a naming authority, a primary key designation, or a professional experience record. The designative naming authority table assigns human-readable designatives such as OGC-API-Feat, DCAT-AP-3.0, HAN-0092, and RFC-7578 to unique identifiers like AUTH-0001 through AUTH-0004, each of which is attributed to a designated authority—IANA, Crossref—and tagged with a classification code such as C-07, E-21, or D-33. This separation of the identifier from the designative permits the same conceptual entity to be referenced consistently across systems while allowing its human-readable label to evolve without breaking referential integrity. The primary key designation table similarly decouples the designation itself—hardware_sn, lab_specimens, manufacturing_batches, asset_inventory—from the entity it governs, such as clinical_trial_cohort, telemetry_id, or sensor_calibrations, thereby establishing a clear lineage from abstract key to concrete data subject.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | IANA | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | Crossref | md5 | E-21 |
| AUTH-0003 | HAN-0092 | IANA | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | IANA | sha1 | D-33 |

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | clinical_trial_cohort |
| DESI-0002 | lab_specimens | lab_specimens |
| DESI-0003 | manufacturing_batches | telemetry_id |
| DESI-0004 | asset_inventory | sensor_calibrations |
| DESI-0005 | network_traffic_db | hardware_sn |
| DESI-0006 | manufacturing_batches | manufacturing_batches |

Attributes and their types form the schema-level vocabulary through which designated entities are described. The attribute definition table maps each attribute identifier—DESI-0001 through DESI-0004—to a name and an XML Schema type: confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. These type declarations are not merely documentation; they constrain the value tables that store actual data. Decimal-valued attributes such as DESI-0001 and DESI-0005 hold measurements like 0.354 and 612.82, while varchar-valued attributes capture strings like Dimension Kind 01, Encoding 02, and audit excerpt. Datetime-valued attributes record timestamps with second-level precision, including 2024-07-25T13:27:19 and 2023-02-27T13:30:12. The entity column in each value table binds these observations back to their parent designation, ensuring that every numeric, textual, or temporal datum can be traced to the attribute and, transitively, to the primary key it qualifies.

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

Integrity of the designative registry itself is enforced through checksum algorithms. The designative naming authority table records md5 for OGC-API-Feat and DCAT-AP-3.0, blake2b for HAN-0092, and sha1 for RFC-7578, reflecting a deliberate choice to match algorithmic strength to the criticality and provenance of each registered designative. IANA-assigned designatives carry md5 checksums, while the Crossref-assigned entry HAN-0092 employs the more robust blake2b, suggesting a risk-based calibration of cryptographic assurance. These checksums enable downstream systems to verify that a designative has not been altered since registration, providing a lightweight but auditable chain of custody for naming conventions that underpin interoperability agreements.

Professional experience records introduce a parallel registry that links individuals to their organizational affiliations and the linguistic and encoding contexts in which their credentials are documented. The professional experience table stores entries such as Elena Rostova, Marcus Chen, and Fatima Al-Mansour, each associated with a holder unit—ML Platform Unit, Quality Assurance, Quantum Provenance, Governance Council—and an organization like Nexus Data Corp or Systems Reliability. The encoding column specifies the character encoding of the stored text: latin1, utf8, or ascii—while the language column records the associated locale, including fr, de, es, and ja. This dual specification of encoding and language ensures that professional credentials can be correctly rendered and validated across multilingual, multi-encoding environments, a requirement that becomes critical when experience records cross jurisdictional and technical boundaries.

**t_professional_experience**

| id | professional_experience | holder | organization | encoding | language |
| --- | --- | --- | --- | --- | --- |
| EXPE-0001 | Elena Rostova | ML Platform Unit | Nexus Data Corp | latin1 | fr |
| EXPE-0002 | Marcus Chen | Quality Assurance | Quality Assurance | utf8 | de |
| EXPE-0003 | Fatima Al-Mansour | Quantum Provenance | Systems Reliability | ascii | es |
| EXPE-0004 | Fatima Al-Mansour | Governance Council | Quality Assurance | utf8 | ja |
| EXPE-0005 | Sofia Rossi | Atlas Infrastructure | Quantum Provenance | latin1 | es |
| EXPE-0006 | Liam O'Connor | ML Platform Unit | Stratos Cloud | ascii | es |
| EXPE-0007 | Yuki Tanaka | Platform Operations | Orion Telemetry Inc | ascii | fr |
| EXPE-0008 | Yuki Tanaka | Aegis Governance Ltd | Quality Assurance | utf8 | ja |