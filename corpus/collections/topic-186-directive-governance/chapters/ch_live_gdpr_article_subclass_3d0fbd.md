---
chapter_id: ch_live_gdpr_article_subclass_3d0fbd
topic_id: 186
family: 07_long_tail
cited_terms: ['gdpr_article_subclass', 'salary_requirement', 'metric_observed_by_event']
model: engine-refine
---

In any structured data environment, the **identifier** serves as the immutable handle by which every record is addressed—unique, stable, and never reused. Across the compliance and observability domains, identifiers follow predictable patterns: regulatory mappings carry codes such as `ARTI-0001` through `ARTI-0004`, salary requisitions use `REQU-0001` through `REQU-0004`, and metric observations are tagged `EVEN-0001` through `EVEN-0004`. These identifiers are not merely labels; they are the anchors that allow a record in one table to be joined to its counterpart in another, forming the relational skeleton of the entire system. An identifier's value—whether `ARTI-0003` pointing to a Brazilian LGPD classification or `EVEN-0002` referencing a disk IOPS measurement—carries no semantic weight beyond its function as a key, which is precisely why they can be safely referenced across disparate domains without collision.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

The **entity** is the real-world object or event that a record describes, and it is itself identified by an identifier that appears as a foreign key in related tables. In the metric observation model, for instance, the entity column in the value tables (`EVEN-0001`, `EVEN-0002`, and so on) points back to the event that was observed—whether that event involved measuring memory latency, cache hit ratio, or CPU utilization. The entity concept bridges the gap between abstract records and the phenomena they capture, ensuring that every measurement, classification, or regulatory mapping can be traced to a specific point of origin.

**t_metric_observed_by_event**

| id | metric |
| --- | --- |
| EVEN-0001 | Memory latency |
| EVEN-0002 | Disk IOPS |
| EVEN-0003 | Cache hit ratio |
| EVEN-0004 | CPU utilization |
| EVEN-0005 | Queue depth |
| EVEN-0006 | Cache hit ratio |

**t_metric_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_metric_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2023-03-01T06:18:02 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2025-03-12T18:54:27 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2023-04-23T18:00:40 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-07-24T13:02:38 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2025-03-15T05:43:19 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2024-11-18T14:01:50 |

**t_metric_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.221 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 966.79 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 495.10 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.669 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 143.93 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 270.10 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.103 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 271.02 |

**t_metric_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | calibration record |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | es |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | mg/L |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

An **attr** (attribute) is a named property of an entity, and its **attr_type** declares the data type of the values it holds. The attribute registry distinguishes between properties like `confidence` (typed as `xsd:decimal`), `dimension_kind` (`xsd:string`), `method` (`xsd:string`), and `recorded_at` (`xsd:dateTime`), each governing how values are stored, validated, and compared. This type discipline is critical: a decimal attribute can participate in arithmetic aggregation, a string attribute can be indexed for text search, and a dateTime attribute supports temporal queries. The attr itself is identified by its own key—`EVEN-0001` for cache hit ratio, `EVEN-0004` for the recorded_at timestamp—and this key appears as a foreign key in the value tables, linking typed data back to its semantic definition.

**Category** and **misc** represent two distinct strategies for enriching records with descriptive metadata. The salary dimension table assigns each requisition a `salary_category`—values such as `Salary Category 01` through `Salary Category 04`—providing a coarse-grained classification that supports grouping and roll-up operations. Meanwhile, the `misc` column appears across multiple tables as a catch-all for free-form or denormalized values: salary labels like `Salary Label 01`, metric values such as `0.221` or `966.79` or `226.77`, and textual annotations like `calibration record` or `Encoding 02`. The misc column sacrifices type safety for flexibility, allowing heterogeneous data to coexist within a single column when strict typing is impractical or unnecessary.

**dim_salary**

| id | salary_label | salary_category |
| --- | --- | --- |
| REQU-0001 | Salary Label 01 | Salary Category 01 |
| REQU-0002 | Salary Label 02 | Salary Category 02 |
| REQU-0003 | Salary Label 03 | Salary Category 03 |
| REQU-0004 | Salary Label 04 | Salary Category 04 |
| REQU-0005 | Salary Label 05 | Salary Category 05 |
| REQU-0006 | Salary Label 06 | Salary Category 06 |
| REQU-0007 | Salary Label 07 | Salary Category 07 |

**Confidence** and **uncertainty** form a complementary pair that quantifies the reliability of measured or inferred values. In the salary fact table, confidence scores range from `0.077` (highly uncertain) to `0.982` (nearly certain), while uncertainty values—expressed as absolute magnitudes such as `60.14`, `75.00`, `883.10`, and `701.98`—convey the expected deviation from the reported value. These two metrics are not interchangeable: confidence is a normalized probability-like measure bounded between zero and one, whereas uncertainty is an absolute quantity in the native units of the measurement. Together, they enable downstream consumers to weight records appropriately, flag low-confidence entries for review, and propagate error bounds through analytical pipelines.

**fact_salary**

| id | salary_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | 0.077 | 60.14 | 3.89 |
| REQU-0002 | REQU-0007 | 0.644 | 75.00 | 226.77 |
| REQU-0003 | REQU-0004 | 0.791 | 883.10 | 851.90 |
| REQU-0004 | REQU-0005 | 0.982 | 701.98 | 876.17 |

The **subject**, **target**, and **role** triad captures the relational semantics between entities. In the regulatory mapping table, a subject identifier such as `ARTI-0005` or `ARTI-0007` is linked to a target identifier like `ARTI-0005` or `ARTI-0006` through a relationship that carries a role—`observer`, `contributor`, or `owner`. This pattern expresses not just that two entities are connected, but how they are connected: one entity observes another, contributes to it, or owns it. The same structural pattern appears in the salary domain, where a salary key such as `REQU-0004` or `REQU-0007` links a fact record to its dimensional definition, establishing a subject-to-target relationship that is implicit rather than explicitly role-tagged. Understanding these roles is essential for navigating the graph of relationships that underpins the entire data model.

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |