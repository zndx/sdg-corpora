---
chapter_id: ch_live_belief_interval_with_upper_bound_b44f3d
topic_id: 109
family: 06_belief_structure
cited_terms: ['belief_interval_with_upper_bound', 'column_property_subclass', 'column_renamed_from']
model: engine-refine
---

In governed knowledge representations that separate stable designation from typed assertion, the identifier furnishes the non-negotiable anchor without which lineage, reconciliation, and audit cannot proceed. Each governed record receives a surrogate key that remains invariant across reinterpretation of its descriptive content: belief-interval assertions carry designations such as BOUN-0001 through BOUN-0004, column-property subclasses PROP-0001 through PROP-0004, and rename-provenance entries FROM-0001 through FROM-0004. Those tokens do not merely label rows; they participate in cross-domain reference, as when BOUN-0003’s plausibility upper bound resolves to PROP-0001 while BOUN-0001 and BOUN-0002 both upper-bound to PROP-0002, or when FROM-0003’s renamed_from pointer returns to BOUN-0006 and FROM-0004 to BOUN-0001. Identifier discipline therefore underwrites every subsequent join—between a belief interval and the property that annotates it, between a renamed column and the interval from which its nomenclature derives—so that compliance queries can traverse provenance without conflating identity with the mutable facts attached to it.

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | PROP-0002 |
| BOUN-0002 | Batch ingestion failure | PROP-0002 |
| BOUN-0003 | Sensor calibration drift | PROP-0001 |
| BOUN-0004 | Storage quota warning | PROP-0005 |
| BOUN-0005 | Latency SLA breach | PROP-0005 |
| BOUN-0006 | Model feature shift | PROP-0002 |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | BOUN-0003 |
| PROP-0002 | device_serial | BOUN-0002 |
| PROP-0003 | request_payload | BOUN-0003 |
| PROP-0004 | event_code | BOUN-0006 |
| PROP-0005 | batch_id | BOUN-0006 |
| PROP-0006 | batch_id | BOUN-0002 |

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | BOUN-0003 |
| FROM-0002 | measurement_timestamp | BOUN-0004 |
| FROM-0003 | config_version | BOUN-0006 |
| FROM-0004 | batch_run_id | BOUN-0001 |
| FROM-0005 | event_type | BOUN-0001 |
| FROM-0006 | patient_bmi | BOUN-0002 |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

The entity, distinguished from the identifier though often co-designated in practice, denotes the instance to which attribute assertions are attributed rather than the assertion record itself. In the value stores, entity_id selects the bearer of fact: BOUN-0001 accumulates multiple typed miscellany under distinct attr_id bindings—decimal confidence 0.680, varchar dimension_kind “Dimension Kind 01”, and further string misc such as “Encoding 02” and “change rationale”—while BOUN-0002 receives its own confidence reading 0.590 under the same attr_id pattern. The same structural separation appears for property subclasses, where PROP-0001 hosts decimal 0.032 alongside varchar annotations, and for rename lineage, where FROM-0001 carries decimal 0.429 and FROM-0002 decimal 0.690 on partially shared attribute slots. Entity resolution is thus the operational step that prevents type-safe values from floating unattached: every misc entry is scoped by entity_id and attr_id together, permitting one interval or column record to publish many facts without collapsing them into a single wide tuple that would foreclose extension.

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

Attr names the definitional slot—confidence, dimension_kind, method, recorded_at—that the governance layer recognizes as attachable across entity families. The attr_id in each value partition points to that slot’s own identifier within the attribute registry mirrored on the parent records (BOUN-0001↔confidence, BOUN-0004↔recorded_at, and analogously PROP-0004↔recorded_at, FROM-0004↔recorded_at), while attr_name in the companion metadata tables supplies the human-legible predicate. Because the same attr vocabulary is reused across belief intervals, property subclasses, and rename provenance, operational policy can mandate, for example, that every confidence assertion use attr_id BOUN-0001 (or its PROP-/FROM- homolog) and every temporal stamp use the recorded_at slot, yielding comparable audit trails even when the underlying domain objects differ. Attr therefore functions as the contract layer: it tells consumers what kind of proposition they are reading before they inspect the misc payload.

Attr_type completes that contract by binding each attr to an XSD datatype—xsd:decimal, xsd:string, xsd:dateTime—thereby routing assertions into the correct physical value relation and enforcing validation at ingestion. Confidence misc must land in decimal partitions (0.680, 473.67, 703.38 for BOUN-0001; 0.032, 504.02, 422.21 for PROP-0001; 0.429, 695.20, 442.17 for FROM-0001), dimension_kind and method misc in varchar partitions (“Dimension Kind 01”, “Encoding 02”, method strings ranging from “change rationale” to “audit excerpt”), and recorded_at misc in datetime partitions spanning 2023-02-03T11:52:35 through 2025-04-06T06:40:08. Mismatch between declared attr_type and stored misc is a governance defect, not a mere storage inconvenience, because downstream reasoning—whether comparing belief 0.680 against property confidence 0.032 or ordering rename events by recorded_at—depends on homogeneous comparability within each attr_type class.

Misc, finally, is the materialized value carried in the type-partitioned stores once identifier, entity, and attr have fixed the context of assertion. It is deliberately miscellaneous only in name: in operation it is the evidence body—numeric magnitudes, lexical encodings, timestamps, locale tags such as “de”, “es”, “fr”—that makes abstract intervals and column metadata actionable. A belief interval whose primary fields read “Model feature shift” or “Sensor calibration drift” becomes auditable when misc supplies confidence decimals and recorded_at instants; a column-property subclass whose column is user_agent or event_code becomes interpretable when misc adds pre-release notes, audit excerpts, or encoding labels. Because misc is always reached through the triple (identifier registry, entity_id, attr_id), retractions, corrections, and supersessions can target individual facts—replacing 0.680 without rewriting the entire BOUN-0001 interval—preserving the evidentiary granularity that compliance frameworks require when demonstrating who knew what, at which precision, and when.

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |