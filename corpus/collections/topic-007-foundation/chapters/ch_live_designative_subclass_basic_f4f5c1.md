---
chapter_id: ch_live_designative_subclass_basic_f4f5c1
topic_id: 7
family: 01_foundation
cited_terms: ['designative_subclass_basic', 'designative_with_naming_authority', 'digital_media_service']
model: engine-refine
---

Designative identifiers serve as the foundational anchors of any nomenclatural registry, uniquely binding human-readable labels to machine-processable codes across distributed systems. In the designative subclass taxonomy, identifiers such as DESI-0001 through DESI-0004 establish a stable namespace for designative values like event_tag_crash, plate_A04, and barcode_8842X, each cross-referenced against classification codes including D-33, B-12, and E-21. The authority-managed designative registry extends this model with identifiers AUTH-0001 through AUTH-0004, anchoring designatives of greater institutional provenance—OGC-API-Feat, DCAT-AP-3.0, HAN-0092, RFC-7578—under the stewardship of recognized naming authorities such as IANA and Crossref. The co-occurrence of code D-33 across both the basic subclass (DESI-0001) and the authority-managed table (AUTH-0004) demonstrates how classification codes function as a shared semantic layer, enabling cross-referencing between informal and formally governed designative entries.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | IANA | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | Crossref | md5 | E-21 |
| AUTH-0003 | HAN-0092 | IANA | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | IANA | sha1 | D-33 |

Checksum algorithm selection constitutes a critical governance decision within naming authority registries, directly impacting the integrity verification of assigned designatives. The authority table records md5 for OGC-API-Feat and DCAT-AP-3.0, blake2b for HAN-0092, and sha1 for RFC-7578, reflecting a heterogeneous policy landscape where algorithmic choice correlates with the designative's domain of application and the assigning authority's security posture. IANA, as the predominant assigning authority across three of four authority records, employs both md5 and blake2b, suggesting that algorithm assignment is driven by the technical requirements of individual designative families rather than a uniform institutional mandate. The presence of sha1—a legacy algorithm with known collision vulnerabilities—on the RFC-7578 designation warrants explicit documentation of its continued use, likely attributable to backward compatibility constraints inherent in standards-track RFCs.

The provides function dimension operates as a relational pivot between operational telemetry and functional classification, linking event-count measurements to their corresponding service categories through a normalized foreign-key structure. The fact table records event counts of 311, 322, 297, and 386 for identifiers SERV-0001 through SERV-0004, while the provides function key column establishes referential integrity by pointing to the same identifier space within the dimension table. This self-referential pattern—where SERV-0005 appears as a provides function key value without a corresponding dimension row—indicates either a deferred dimension entry or a functional dependency that transcends the current classification schema. The dimension table itself assigns descriptive labels (Provides Function Label 01 through 04) and categorical groupings (Provides Function Category 01 through 04) to each service identifier, enabling aggregation of event counts by functional category for capacity planning and service-level reporting.

**fact_digital**

| id | provides_function_key | event_count |
| --- | --- | --- |
| SERV-0001 | SERV-0005 | 311 |
| SERV-0002 | SERV-0003 | 322 |
| SERV-0003 | SERV-0002 | 297 |
| SERV-0004 | SERV-0002 | 386 |
| SERV-0005 | SERV-0005 | 377 |
| SERV-0006 | SERV-0006 | 162 |

**dim_provides_function**

| id | provides_function_label | provides_function_category |
| --- | --- | --- |
| SERV-0001 | Provides Function Label 01 | Provides Function Category 01 |
| SERV-0002 | Provides Function Label 02 | Provides Function Category 02 |
| SERV-0003 | Provides Function Label 03 | Provides Function Category 03 |
| SERV-0004 | Provides Function Label 04 | Provides Function Category 04 |
| SERV-0005 | Provides Function Label 05 | Provides Function Category 05 |
| SERV-0006 | Provides Function Label 06 | Provides Function Category 06 |

Language designation within the designative subclass basic table introduces a localization axis to the nomenclatural framework, with entries recorded in French (fr) and Spanish (es) across the four observed identifiers. The language attribute does not appear in the authority-managed designative table, suggesting that multilingual support is confined to the basic subclass tier, possibly reflecting regional deployment contexts where designatives such as plate_A04 (code B-12, language es) and event_tag_crash (code D-33, language fr) require locale-specific handling. The recurrence of event_tag_crash under both language values—fr for DESI-0001 and es for DESI-0004—demonstrates that a single designative value may be registered in multiple language contexts, each maintaining its own identifier and classification code, thereby supporting parallel operational environments without designative collision.

The misc code column, present in both designative tables, functions as a secondary classification mechanism that operates orthogonally to the primary designative identifier. Codes such as C-07, E-21, and D-33 appear across both the basic subclass and authority-managed registries, with E-21 occurring for barcode_8842X in the basic table and DCAT-AP-3.0 in the authority table, and D-33 appearing for event_tag_crash and HAN-0092 respectively. This cross-table code repetition establishes a mapping layer that enables analysts to correlate designatives from different governance tiers by their shared misc classification, facilitating unified reporting and audit trails across the full spectrum of registered designatives regardless of their assigning authority or language context.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |