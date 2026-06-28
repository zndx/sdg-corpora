---
chapter_id: ch_live_trace_with_root_span_79c758
topic_id: 102
family: 07_long_tail
cited_terms: ['trace_with_root_span', 'outlier_claim_subclass', 'census_reporting_event']
model: engine-refine
---

In distributed tracing architectures, the root span serves as the canonical parent of a trace hierarchy, uniquely identified by an identifier such as `SPAN-0001` or `SPAN-0004`, and is catalogued in a dimension table that assigns each root span a human-readable label and a categorical classification—`Root Span Category 01` through `Root Span Category 04`—enabling downstream filtering and aggregation by operational domain. The fact table that records individual trace entries references its parent root span via a foreign key (`root_span_key`), thereby preserving the hierarchical linkage between child spans and their originating root span; for instance, trace `SPAN-0001` and `SPAN-0003` both resolve to root span `SPAN-0005`, indicating that multiple trace records can share a common ancestral root. Each trace record carries a `size_bytes` measurement—values such as `475324433` and `953122943` reflect the payload footprint of the trace—and a `version` number, which in the observed data ranges from `4` to `12`, supporting schema evolution and backward compatibility across instrumentation libraries.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

The attribute system governing census reporting events operates through a three-table pattern that separates the attribute schema from its runtime values. The attribute definition table (`t_census_reporting_event_attr`) declares attribute names—`encoding`, `label_text`, `language`—alongside their corresponding `attr_type`, all of which are typed as `xsd:string` in the observed records, establishing a strict schema registry that constrains permissible attribute values. The value table (`t_census_reporting_event_val_varchar`) then materializes these attributes against specific entities: the `entity_id` column references a census reporting event (e.g., `EVEN-0001`), the `attr_id` column resolves to a declared attribute, and the `value` column holds the actual misc content—`Encoding 01`, `pre-release note`, `fr`—thereby implementing an entity-attribute-value model that supports arbitrary, extensible metadata without schema migration.

**t_census_reporting_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | encoding | xsd:string |
| EVEN-0002 | label_text | xsd:string |
| EVEN-0003 | language | xsd:string |

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

A census reporting event itself—identified by an event identifier such as `EVEN-0001` or `EVEN-0004`—represents a discrete data collection initiative, with names like `Eurostat Population Census`, `French INSEE Census`, and `UK National Statistics Census` denoting the originating statistical authority. Each event is anchored to a `censusperiod`, which specifies the temporal window of data collection; observed periods include `Fiscal Year 2022-2023`, `Summer 2020 Collection`, and `Q3 2021 Fieldwork Window`, reflecting both calendar-year and fiscal-year conventions. The event also tracks a sector of interest—`Youth Employment`, `Microfinance Services`, `Sustainable Ag`, `Elder Care`—and carries a `reportingdate`, the date on which the census results were published, ranging from `2019-08-05` to `2024-01-22` in the sample data, enabling temporal queries against publication latency and data freshness.

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

Outlier classification follows a parallel relational pattern, where an outlier claim subclass—identified by `CLAI-0001` through `CLAI-0004`—is characterized by an outlier type such as `Network_Bandwidth_Spike`, `Patient_Vital_Anomaly`, or `Log_Flood_Event`. The explanatory relationship between outlier claims and the systems they affect is captured in a junction table that maps an `outlier_id` to an `explains_anomaly_in_id`, with a `role` column specifying the claimant's functional relationship to the target system: `reviewer`, `owner`, or `observer`. For example, outlier claim `CLAI-0001` assumes the `reviewer` role with respect to `CLAI-0002` and the `observer` role with respect to `CLAI-0006`, while the underlying explanatory mapping indicates that the `Network_Bandwidth_Spike` outlier is associated with the `Automotive_Test_Drive` system and the `Log_Flood_Event` with the `Financial_Trading_Queue`, demonstrating how a single outlier type can manifest across distinct operational domains with different governance roles.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |