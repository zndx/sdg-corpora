---
chapter_id: ch_live_aggregation_over_time_window_299e26
topic_id: 94
family: 02_observation_measurement
cited_terms: ['aggregation_over_time_window', 'requirement_satisfies', 'outlier_claim_with_attribute_set']
model: engine-refine
---

Aggregation windows serve as the fundamental temporal containers for metric collection, each identified by a unique key such as `WIND-0001` through `WIND-0004` and classified by an aggregation type like `RealTimeClusterLoad`, `MonthlyThroughputMetric`, or `AnnualCapacityForecast`. The `over_time_window` column specifies the temporal cadence—`MonthlySettlement`, `TrailingSevenDays`, or `BusinessHours`—that governs when data is aggregated and when settlements are computed. These windows are not merely labels; they encode the operational rhythm of the system, determining whether a metric reflects real-time cluster utilization or an annual capacity projection, and whether the aggregation period aligns with a monthly billing cycle or a rolling seven-day window.

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

Attributes provide the dimensional structure that gives meaning to the values stored within each window. The attribute catalog, keyed by identifiers like `WIND-0001` through `WIND-0010`, defines properties such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to a specific data type—`xsd:decimal` for numeric confidence scores, `xsd:string` for categorical labels like `Dimension Kind 01` or `Encoding 02`, and `xsd:dateTime` for timestamps such as `2023-08-23T11:54:15`. This type discipline is enforced through a value partitioning strategy: decimal values (e.g., `0.781`, `86.18`, `786.35`) reside in one store, string values in another, and datetime values in a third, each linked back to the same attribute definition and the entity on which the measurement was taken. An entity—identified by `entity_id` values like `WIND-0001` or `WIND-0002`—represents the concrete subject of measurement, whether a cluster, a pipeline stage, or a settlement period, and the same entity can carry multiple attributes across different value types.

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

The `t_requirement_satisfies` table operationalizes compliance governance by mapping abstract requirements to concrete satisfaction mechanisms. Each record, keyed by identifiers such as `SATI-0001` through `SATI-0004`, pairs a requirement—`Audit Trail Mandate`, `Data Retention Policy`, `Encryption Standard AES-256`, or `ISO 27001 Annex A`—with a satisfying control like `Data Masking Engine`, `Container Image Scan`, `FIPS 140-2 Module`, or `WAF Rule Set`. Two governance dimensions structure these mappings: `priority`, a numeric urgency indicator ranging from `1` (highest, as with the `Encryption Standard AES-256` satisfied by the `FIPS 140-2 Module`) to `5` (lower urgency, as with the `Audit Trail Mandate`), and `scope`, which delineates the organizational boundary of applicability—`team`-level controls versus `regional`-level mandates. This dual-axis classification ensures that compliance efforts are prioritized and scoped appropriately, preventing high-priority, broadly scoped requirements from being deprioritized in favor of narrower, less critical ones.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | Data Masking Engine | 5 | team |
| SATI-0002 | Data Retention Policy | Container Image Scan | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | FIPS 140-2 Module | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WAF Rule Set | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | Backup Encryption Routine | 2 | team |
| SATI-0006 | Data Retention Policy | Vault Key Rotation | 1 | local |

Outlier claims and their associated attribute sets form a parallel governance structure for operational anomaly management. The `t_outlier_claim_with_attribute_set` table catalogs specific anomaly types—`checksum_mismatch`, `pipeline_stall`, `log_flooding`, `latency_spike`—each identified by keys like `SET-0001` through `SET-0004`. These claims are linked to attribute sets such as `tolerance_ranges`, `baseline_values`, and `calibration_constants` through a junction table that introduces two critical relational concepts: `subject` and `target`. In this context, the `outlier_id` column (labeled `subject`) identifies the anomaly claim being evaluated, while the `attribute_set_id` column (labeled `target`) identifies the reference data against which the claim is assessed. The `role` column—taking values like `contributor` or `owner`—specifies the nature of the relationship between the subject and the target, indicating whether an attribute set actively contributes evidence to the claim or serves as the authoritative owner of the reference baseline. This triad of subject, target, and role enables fine-grained provenance tracking: a `latency_spike` claim (`SET-0004`) might have `calibration_constants` (`SET-0001`) as a `contributor` to its assessment, while a `checksum_mismatch` claim (`SET-0001`) might have `baseline_values` (`SET-0004`) as its `owner`, establishing a clear chain of evidentiary responsibility.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |