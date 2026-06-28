---
chapter_id: ch_live_instrument_with_function_5d2b9d
topic_id: 155
family: 01_foundation
cited_terms: ['instrument_with_function', 'apolitical_islam', 'schemaorg_event_starttime']
model: engine-refine
---

Apolitical Islam, as a governable doctrinal construct, names institutional arrangements through which religious authority is exercised without direct partisan capture of the state apparatus. The Turkish Diyanet model, recorded three times across the corpus and contrasted once with Iranian Hawza quietism, illustrates how formally similar labels can mask divergent operational postures: the former typically denotes a state-sponsored religious bureaucracy whose legitimacy rests on bureaucratic regularity rather than electoral mandate, whereas the latter signals scholarly withdrawal from executive power. Doctrinal narrative supplies the interpretive substrate on which such models rest. Hadith preservation focus and ascetic withdrawal practice anchor two Diyanet-associated records, while worldly detachment concept accompanies the Hawza entry; together these narratives function as audit-relevant descriptors that explain why a given posture is classified as apolitical rather than merely non-partisan. Political Islam stance, held orthogonally to the apolitical label, records the counterfactual or adjacent mobilization grammar that compliance reviewers must not conflate with the primary classification: theocratic state proposal, militant jihadism, political enjoinment doctrine, and Islamist governance theory appear as distinct stance tokens even where the apolitical field repeats, enforcing analytical separation between institutional form and mobilizational intent.

Governance of this domain depends on a typed attribute layer in which each property is declared before any value is admitted. Attribute names—checksum, created_date, identifier, license in the instrument lineage; encoding, label_text, language in the apolitical lineage—are paired with attr_type declarations that fix permissible value shapes: xsd:string for lexical payloads, xsd:date for temporal stamps, and cco:DesignativeICE for designative identifiers that resist naive string equality. This separation matters because adjudication, export control review, and longitudinal diffing all require knowing whether a field is a calendar fact, a licensure constraint, or a controlled vocabulary key before automated rules fire. Values never attach directly to the core record; they resolve through entity and attr foreign keys into type-partitioned value stores, so that a misc field in a varchar partition carries MPL-2.0 or us-east-1 without polluting integer partitions that hold counts such as 359 or 6, and date partitions that preserve created_date instances including 2024-09-19 and 2023-09-07. Identifier keys—FUNC-0001 through FUNC-0004 for instruments realizing signal amplification through gas composition, ISLA-0001 through ISLA-0004 for the Islam posture set—provide the stable handles across partitions; entity_id and attr_id repeats in value rows make explicit which record and which declared property each misc value instantiates, as when ISLA-0001 receives Encoding 01, change rationale, and fr while ISLA-0002 receives Encoding 04 under the same attribute definitions.

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

**t_apolitical_islam**

| id | apolitical_islam | doctrinal_narrative | political_islam_stance |
| --- | --- | --- | --- |
| ISLA-0001 | Turkish Diyanet model | Hadith preservation focus | Theocratic state proposal |
| ISLA-0002 | Turkish Diyanet model | Ascetic withdrawal practice | Militant jihadism |
| ISLA-0003 | Turkish Diyanet model | Hadith preservation focus | Political enjoinment doctrine |
| ISLA-0004 | Iranian Hawza quietism | Worldly detachment concept | Islamist governance theory |
| ISLA-0005 | Sunni quietism | Hadith preservation focus | Theocratic state proposal |
| ISLA-0006 | Ahl-e Hadith | Community stability tenet | Islamist constitutionalism |
| ISLA-0007 | Deobandi quietism | Taqlid adherence tradition | Revolutionary vanguard model |

**t_apolitical_islam_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ISLA-0001 | encoding | xsd:string |
| ISLA-0002 | label_text | xsd:string |
| ISLA-0003 | language | xsd:string |

**t_apolitical_islam_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ISLA-0001 | ISLA-0001 | ISLA-0001 | Encoding 01 |
| ISLA-0002 | ISLA-0001 | ISLA-0002 | change rationale |
| ISLA-0003 | ISLA-0001 | ISLA-0003 | fr |
| ISLA-0004 | ISLA-0002 | ISLA-0001 | Encoding 04 |
| ISLA-0005 | ISLA-0002 | ISLA-0002 | audit excerpt |
| ISLA-0006 | ISLA-0002 | ISLA-0003 | fr |
| ISLA-0007 | ISLA-0003 | ISLA-0001 | Encoding 07 |
| ISLA-0008 | ISLA-0003 | ISLA-0002 | pre-release note |

The instrument-with-function subgraph in the evidence corpus demonstrates that the same governance pattern scales to non-ideological assets, confirming the framework’s domain neutrality. Keysight DSOX3024T, Thermo Q Exactive, Zygo NewView, and Agilent 5975C each map to a realizes_function endpoint—signal amplification, temperature measurement, concentration quantification, gas composition—so that operational capability, not manufacturer branding, becomes the join key for compliance metadata. Shared attr_id FUNC-0002 across four created_date values shows batch temporal attestation applied uniformly across heterogeneous hardware, while divergent attr_id assignments on a single entity (FUNC-0001 carrying both FUNC-0006 and FUNC-0008 integer attributes) show how one instrument may simultaneously satisfy multiple measurable constraints. Checksums rendered as a3f9c21e, cross-references as ref-8842, and deployment regions as us-east-1 exemplify misc varchar semantics: heterogeneous strings governed by a common attr_type but validated under different business rules depending on attr_name.

Temporal and volumetric facts for schema.org-aligned artifacts introduce event_start_time as a first-class dimension rather than an inline timestamp. Fact rows STAR-0001 through STAR-0004 carry size_bytes magnitudes spanning 114301972 through 998785819 and version integers from 3 to 8, but their event_start_time_key pointers resolve into dim_event_start_time, where each identifier STAR-0001–STAR-0004 pairs a misc label (Event Start Time Label 01 through 04) with a category (Event Start Time Category 01 through 04). Two facts sharing STAR-0001 as event_start_time_key therefore inherit the same categorical window without duplicating label text, which is essential when retention policies, embargo clocks, or publication moratoria are defined at category granularity rather than per artifact. Version and size_bytes jointly support integrity and capacity governance: version increments signal semantic or structural change independent of byte growth, as when STAR-0002 at version 5 occupies far fewer bytes than STAR-0004 at version 8, preventing equating “larger” with “newer” in audit trails.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

In operational practice, reviewers traverse from identifier to entity, from attr and attr_type to the correct value partition, and from fact keys to dimensional category before rendering a compliance judgment. A record labeled apolitical Islam under the Diyanet model must be read alongside its doctrinal narrative and political Islam stance fields, its language and encoding misc values, and—where cross-domain linkage exists—any instrument functions that realize measurement or quantification supporting the underlying assessment. Misc, in this architecture, is not semantic noise but the typed payload slot whose interpretation is entirely determined by the attr_type and attr_name declared upstream; category compresses event_start_time into policy-ready groupings; and version plus size_bytes furnish the evidentiary spine for proving what was knowable, and how large it was, at the moment bounded by the chosen temporal dimension. Taken together, these elements constitute a defensible reference model: entities carry contested subject matter, attributes enforce shape, partitions preserve type safety, dimensions normalize time, and facts record material state—sufficient structure for handbook-grade governance without collapsing distinct analytical axes into a single undifferentiated label.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | Signal Amplification |
| FUNC-0002 | Thermo Q Exactive | Temperature Measurement |
| FUNC-0003 | Zygo NewView | Concentration Quantification |
| FUNC-0004 | Agilent 5975C | Gas Composition |
| FUNC-0005 | Agilent 5975C | Gas Composition |
| FUNC-0006 | Agilent 5975C | Pressure Monitoring |

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |