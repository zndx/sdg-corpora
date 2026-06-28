---
chapter_id: ch_live_entomological_surveillance_record_f64761
topic_id: 186
family: 08_derived
cited_terms: ['entomological_surveillance_record', 'lineage_governed_by_directive', 'census_reporting_event']
model: engine-refine
---

In governed data environments, stable identifiers anchor every assertion that must survive audit, lineage review, and cross-system reconciliation. A record keyed as RECO-0001 is not merely a row number; it is the durable handle by which downstream consumers resolve what was observed, what it realized, and what it was associated with across reporting cycles. That separation of identity from description is foundational to compliance: when regulators or internal stewards ask whether two figures refer to the same underlying phenomenon, the answer depends on whether they share an identifier or only resemble one another in free text. Quantitative measures such as event count then attach to those keyed facts as auditable magnitudes—311 versus 485 are not interchangeable totals unless their identifier lineage confirms comparable scope, population, and collection rules.

The realizes and associated_with dimensions express two distinct but equally governance-critical relationship semantics. Realization names what a fact substantiates or brings into operational existence—here expressed through labeled realizations such as Realizes Label 02 within Realizes Category 02—while association names the contextual partner or host to which the same fact is tethered, as when Associated With Label 01 sits under Associated With Category 01. In practice, stewards treat these as orthogonal axes: a single entomological observation might realize one programmatic outcome while remaining associated with a different administrative or jurisdictional object. When RECO-0004 carries event_count 485 under realizes_key RECO-0004 and associated_with_key RECO-0001, compliance reviewers read that pairing as a deliberate join of two governed reference entities, not as incidental colocation in a spreadsheet. Misc fields carry human-readable labels—Realizes Label 04, Associated With Label 03—that make dimensions legible to operators while category values enforce the controlled vocabulary that reporting templates, access policies, and disclosure schedules require.

**fact_entomological**

| id | realizes_key | associated_with_key | event_count |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0002 | RECO-0001 | 311 |
| RECO-0002 | RECO-0005 | RECO-0005 | 166 |
| RECO-0003 | RECO-0004 | RECO-0003 | 49 |
| RECO-0004 | RECO-0004 | RECO-0001 | 485 |
| RECO-0005 | RECO-0006 | RECO-0001 | 380 |
| RECO-0006 | RECO-0003 | RECO-0005 | 490 |
| RECO-0007 | RECO-0004 | RECO-0007 | 321 |
| RECO-0008 | RECO-0002 | RECO-0003 | 179 |

**dim_realizes**

| id | realizes_label | realizes_category |
| --- | --- | --- |
| RECO-0001 | Realizes Label 01 | Realizes Category 01 |
| RECO-0002 | Realizes Label 02 | Realizes Category 02 |
| RECO-0003 | Realizes Label 03 | Realizes Category 03 |
| RECO-0004 | Realizes Label 04 | Realizes Category 04 |
| RECO-0005 | Realizes Label 05 | Realizes Category 05 |
| RECO-0006 | Realizes Label 06 | Realizes Category 06 |

**dim_associated_with**

| id | associated_with_label | associated_with_category |
| --- | --- | --- |
| RECO-0001 | Associated With Label 01 | Associated With Category 01 |
| RECO-0002 | Associated With Label 02 | Associated With Category 02 |
| RECO-0003 | Associated With Label 03 | Associated With Category 03 |
| RECO-0004 | Associated With Label 04 | Associated With Category 04 |
| RECO-0005 | Associated With Label 05 | Associated With Category 05 |
| RECO-0006 | Associated With Label 06 | Associated With Category 06 |
| RECO-0007 | Associated With Label 07 | Associated With Category 07 |
| RECO-0008 | Associated With Label 08 | Associated With Category 08 |

Census reporting events sit at the intersection of temporal governance and sector accountability. A censusreportingevent such as the Eurostat Population Census or the French INSEE Census is the named reporting act whose authority, methodology, and publication obligations must be documented; occurs_during_period values—including Fiscal Year 2022-2023, Summer 2020 Collection, and Q3 2021 Fieldwork Window—define the censusperiod within which collection and validation rules apply. Sector tracking further constrains interpretability: an event that tracks Youth Employment is not substitutable for one oriented to Elder Care even when publication dates cluster in the same calendar year. Publication timestamps such as 2024-01-22 or 2019-08-05 close the operational loop by marking when a governed disclosure left the controlled environment, which matters for timeliness attestations, embargo compliance, and the sequencing of dependent aggregates.

**t_census_reporting_event**

| id | census_reporting_event | occurs_during_period | tracks_sector | published_on_date |
| --- | --- | --- | --- | --- |
| EVEN-0001 | Eurostat Population Census | Fiscal Year 2022-2023 | Youth Employment | 2024-01-22 |
| EVEN-0002 | French INSEE Census | Summer 2020 Collection | Microfinance Services | 2019-08-05 |
| EVEN-0003 | Eurostat Population Census | Fiscal Year 2022-2023 | Sustainable Ag | 2021-12-18 |
| EVEN-0004 | UK National Statistics Census | Q3 2021 Fieldwork Window | Elder Care | 2021-04-15 |
| EVEN-0005 | 2020 US Decennial Census | Q1 2023 Validation Period | Public Transit | 2023-10-01 |
| EVEN-0006 | Brazil IBGE Census | April 2020 Counting Period | Digital Literacy | 2023-06-28 |
| EVEN-0007 | Australian Bureau Census | Autumn 2021 Household Survey | Healthcare Access | 2024-01-22 |
| EVEN-0008 | Japan Statistics Census | Biennial 2018-2020 Cycle | Healthcare Access | 2023-10-01 |

Flexible metadata for such events is commonly modeled through entity–attribute–value structures rather than wide, brittle tables. The entity—in this pattern, a census reporting event identified as EVEN-0001 or EVEN-0002—owns a set of named attributes; attr records define those names (encoding, label_text, language) while attr_type declares the conformance contract, here uniformly xsd:string, that validators and interchange pipelines must enforce. Values then materialize in misc-bearing value stores: EVEN-0001 may carry Encoding 01 for encoding, a pre-release note for label_text, and fr for language, while EVEN-0002 receives Encoding 04 under the same encoding attribute definition. This separation matters because governance teams can add or retire attributes without rewriting the core event registry, and because type declarations allow automated rejection of values that would break schema contracts or multilingual reporting requirements.

**t_census_reporting_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | Encoding 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0002 | pre-release note |
| EVEN-0003 | EVEN-0001 | EVEN-0003 | fr |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | Encoding 04 |
| EVEN-0005 | EVEN-0002 | EVEN-0002 | audit excerpt |
| EVEN-0006 | EVEN-0002 | EVEN-0003 | de |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | Encoding 07 |
| EVEN-0008 | EVEN-0003 | EVEN-0002 | nightly summary |

Language governance threads through both lineage directives and event-level attributes, and the two layers answer different compliance questions. Lineage records keyed as DIRE-0001 through DIRE-0004 bind provenance descriptions—Model Training Registry, Patient Cohort Dataset, Sensor Telemetry Stream—to unit semantics (ms, m/s, count) and to locale declarations such as ja, de, and en, signaling which linguistic convention governs labels, error messages, or unit annotations in derived artifacts. Event-level language attributes complement that lineage by stating the operative locale of a specific disclosure package, as when fr is recorded against EVEN-0001 even though sibling directives standardize on en for Patient Cohort Dataset lineage. Stewards reconcile these signals during impact analysis: a change to an attr_type or category taxonomy may propagate cleanly through English-language pipelines yet require parallel review for Japanese or German consumers.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

Taken together, identifier discipline, dual relationship dimensions, period-bounded census events, typed extensible attributes, and language-aware lineage form the operational grammar through which organizations prove what was counted, under which reporting mandate, with what metadata, and in which linguistic and unit context. Event counts gain defensibility only when joined to realizes and associated_with keys that themselves resolve to categorized reference data; census periods and reporting event names supply the temporal and institutional frame; attrs and entities supply the evolvable annotation layer; and language ties human interpretation to machine validation. That architecture is what allows dense factual registries to remain both analytically useful and audit-ready without collapsing heterogeneous reporting requirements into a single undifferentiated description field.

**t_census_reporting_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | encoding | xsd:string |
| EVEN-0002 | label_text | xsd:string |
| EVEN-0003 | language | xsd:string |