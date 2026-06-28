---
chapter_id: ch_live_schemaorg_event_location_28aba6
topic_id: 30
family: 07_long_tail
cited_terms: ['schemaorg_event_location', 'kernelhook_in_kernel_module', 'ganglion_cyst_imaging_finding']
model: engine-refine
---

Event location metadata is captured through a normalized schema that decouples location identity from its descriptive attributes, enabling flexible governance of distributed infrastructure. The primary location table assigns each site a stable identifier—LOCA-0001 through LOCA-0004—and maps it to a schemaorg classification such as audit-log-archive, data-lake-ingestion-job, or provenance-trace-record, alongside a physical or logical placement like AWS us-east-1, Basement Server Room, Room 4B Server Hall, or Network Zone Secure. This separation of concerns means that the same location entity can carry heterogeneous attributes without schema modification: a checksum attribute typed as xsd:string, a created_date typed as xsd:date, an identifier typed as cco:DesignativeICE, and a license typed as xsd:string are all declared in a dedicated attribute definition table, each with its own LOCA-prefixed identifier. The attribute values themselves are stored in type-specialized value tables—varchar for freeform strings like c0ffee42, ref-8842, Apache-2.0, and ap-south-2; date for timestamps such as 2024-05-14, 2024-02-21, 2023-06-13, and 2023-08-21; and integer for numeric measures including 400, 223, and the repeated value 6—each row linking back to its entity through a foreign key on entity_id and to its attribute through attr_id. This three-table value architecture (definition, varchar, date, integer) mirrors the pattern seen in product catalog data where a Catalog Number like 20536-1-AP, a Size of 150ul at Concentration 600 ug/ml by Nanodrop, a Source of Rabbit, an Isotype of IgG, and a Full Name of actin, beta are each stored as typed attributes with calculated and observed molecular weights of 42 kDa, all traceable to a GeneID of 60, a UNIPROT ID of P60709, and a GenBank Accession Number of BC002409.

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

Kernel module governance follows a parallel but more compact structure, binding each kernel hook directly to its hosting module while recording licensing and deployment location in a single denormalized row. Hooks such as PsSetCreateProcessNotify_Monitor are associated with kernel modules ntoskrnl.exe and kdcom.sys under the CC-BY-4.0 and GPL-3.0 licenses respectively, while driver-level hooks like nvlddmkm.sys and storport.sys are paired with stub implementations IDT_KiDispatch_Stub and hal.dll under the MIT license. The location column records deployment zones—zone-b, us-east-1, eu-west-3, ap-south-2—providing an immediate audit trail of where each hook-module pair is active. This contrasts with the event location schema, where location is the primary entity and attributes are appended; here, the kernel hook is the primary entity and location is an ancillary property, reflecting the different governance priorities of kernel-level code (where license compliance and module provenance are paramount) versus infrastructure metadata (where attribute extensibility and value typing take precedence).

Medical imaging findings introduce a fourth dimension of heterogeneity, where each finding is characterized not only by its anatomical description but also by the imaging modality that visualizes it, the character encoding of the report, and the language of documentation. A finding of Dorsal right ankle is visualized through MIP reconstruction and stored in ascii encoding with Japanese (ja) language metadata; Left medial malleolus uses Sagittal PD FS with the same ascii-ja combination; Bilateral distal radius is captured via Gadolinium enhanced T1 in latin1 encoding with English (en) language; and Right dorsal metatarsal employs T2 weighted fat sat in unicode with Japanese (ja) language. The encoding column—spanning ascii, latin1, and unicode—reflects the internationalization requirements of radiological reporting systems, while the language column distinguishes between ja and en as the two documented report languages. The modality column—MIP reconstruction, Sagittal PD FS, Gadolinium enhanced T1, T2 weighted fat sat—specifies the magnetic resonance imaging technique, each providing a different contrast mechanism for the same anatomical region.

The foreign-key relationships across these tables form a coherent governance graph: event location entities in t_schemaorg_event_location are the anchor for attribute definitions in t_schemaorg_event_location_attr, which in turn are referenced by value rows in the three type-specific value tables through their respective attr_id columns, creating a star schema where the location entity sits at the center and typed attributes radiate outward. Kernel module rows carry their license and location as inline properties rather than through a value-table indirection, reflecting the simpler attribute set and the higher assurance requirements of kernel code. Imaging findings similarly carry encoding and language as direct columns rather than as extensible attributes, appropriate for a domain where the attribute set is fixed and well-understood. The identifier columns—LOCA-prefixed for event locations, MODU-prefixed for kernel modules, FIND-prefixed for imaging findings—provide a consistent naming convention across domains, while the cross-domain repetition of location values such as us-east-1 and ap-south-2 in both the event location and kernel module tables indicates a shared geographic taxonomy that could be normalized into a separate location reference table if governance requirements demand it.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |