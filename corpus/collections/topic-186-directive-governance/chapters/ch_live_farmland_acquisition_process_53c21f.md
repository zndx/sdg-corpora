---
chapter_id: ch_live_farmland_acquisition_process_53c21f
topic_id: 186
family: 08_derived
cited_terms: ['farmland_acquisition_process', 'schemaorg_event_location', 'policy_effective_period']
model: engine-refine
---

In farmland acquisition governance, every transaction is anchored by a unique identifier that ties together the acquisition process, the institutional investor, and the agricultural land parcel at stake. A deal such as the Black Soil Expansion Deal, tracked under identifier PROC-0001, targets PensionsPlus Land Trust as the acquiring investor and secures Parcel 44B North as the land asset. The same deal appears again under PROC-0004, this time directed at Meridian Agricultural Capital and the same parcel, illustrating how a single named acquisition initiative can be executed through multiple investor channels or tracked across sequential phases. Other processes follow similar patterns: the Appalachian Ridge Timberland Swap (PROC-0002) also targets Parcel 44B North through Meridian Agricultural Capital, while the Central Valley Irrigation Rights transaction (PROC-0003) involves CalPERS Agricultural Fund acquiring Willow Creek Tract 7, and the Blackwater Wetland Reserve appears as an acquisition target without a distinct process name in the available records. This structure ensures that every farmland acquisition can be traced from investor intent through to the specific parcel of land being secured.

**t_farmland_acquisition_process**

| id | farmland_acquisition_process | targets_investor | acquires_land |
| --- | --- | --- | --- |
| PROC-0001 | Black Soil Expansion Deal | PensionsPlus Land Trust | Parcel 44B North |
| PROC-0002 | Appalachian Ridge Timberland Swap | Meridian Agricultural Capital | Parcel 44B North |
| PROC-0003 | Central Valley Irrigation Rights | CalPERS Agricultural Fund | Willow Creek Tract 7 |
| PROC-0004 | Black Soil Expansion Deal | Meridian Agricultural Capital | Blackwater Wetland Reserve |
| PROC-0005 | Midwest Grain Corridor Buy | Meridian Agricultural Capital | High Plains Grazing Lease |
| PROC-0006 | Central Valley Irrigation Rights | Sovereign Wealth Alpha | Oakhaven Irrigation Zone |
| PROC-0007 | Sierra Foothold Vineyard Purchase | BlackRock Farmland Partners | Blackwater Wetland Reserve |

The metadata infrastructure supporting these transactions relies on a typed attribute system that captures both descriptive and technical properties of associated entities. Each entity—identified by codes such as LOCA-0001 through LOCA-0004—carries a set of attributes whose names and types are formally declared. Attributes include checksum (typed as xsd:string), created_date (xsd:date), identifier (typed as cco:DesignativeICE, a controlled vocabulary for designative identifiers), and license (xsd:string). The type declarations enforce data integrity by constraining values to specific schemas: dates must conform to ISO 8601 format, strings to character data, and designative identifiers to a recognized classification standard. This typed attribute model allows the system to store heterogeneous metadata—ranging from cryptographic checksums like c0ffee42 to reference codes such as ref-8842—while maintaining a rigorous schema that supports validation, querying, and auditability.

Value storage is partitioned by data type across dedicated tables, ensuring that each attribute's value is stored in the appropriate format. Date attributes, such as created_date, hold values like 2024-05-14, 2024-02-21, 2023-06-13, and 2023-08-21, providing a clear temporal record of when each entity was instantiated. String attributes accommodate diverse content: checksums (c0ffee42), reference identifiers (ref-8842), license designations (Apache-2.0), and regional codes (ap-south-2). Integer attributes capture numeric properties, with values such as 400 and 223 appearing alongside the repeated value 6, suggesting a common metric—perhaps a count of associated resources or a version number—tracked across multiple entities. This separation by type prevents format corruption and enables efficient indexing and retrieval of the most commonly queried fields.

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

Event locations themselves are catalogued with identifiers that map to descriptive labels and physical or logical placements. The location audit-log-archive resides in AWS us-east-1, the data-lake-ingestion-job is housed in a Basement Server Room, the provenance-trace-record appears in two distinct contexts—Room 4B Server Hall and Network Zone Secure—reflecting either replication or the tracking of the same logical entity across multiple physical deployments. These location records serve as the connective tissue between the abstract metadata attributes and the concrete infrastructure where data resides, enabling compliance teams to answer questions about where sensitive information is stored, how it is protected, and which governance policies apply.

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | AWS us-east-1 |
| LOCA-0002 | data-lake-ingestion-job | Basement Server Room |
| LOCA-0003 | provenance-trace-record | Room 4B Server Hall |
| LOCA-0004 | provenance-trace-record | Network Zone Secure |
| LOCA-0005 | field-observation-dataset | Network Zone Secure |
| LOCA-0006 | governance-policy-update | Basement Server Room |
| LOCA-0007 | lab-sample-tracker | AWS us-east-1 |
| LOCA-0008 | field-observation-dataset | Facility 7 Calibration Lab |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |

Policy governance extends across these systems through effective period records that define when specific regulatory frameworks apply, to what scope, and in which language. The HIPAA Privacy Rule and NIST SP 800-53 both take effect during Q4 2022, but the former operates at the local scope in Spanish (es), while the latter targets team-level operations also in Spanish. GDPR Compliance applies during Q3 2023 at the local scope, again in Spanish, whereas PCI DSS v4.0, effective Q1 2025, operates at the global scope in French (fr). The scope dimension—local, team, or global—determines the breadth of applicability, ensuring that compliance obligations are neither over-applied nor under-applied to the relevant organizational units. Language specification ensures that policy documentation is accessible to the intended audience, a critical requirement in multinational operations where regulatory interpretation can vary by jurisdiction and linguistic context.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |