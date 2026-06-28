---
chapter_id: ch_live_profile_basic_589d48
topic_id: 186
family: 02_observation_measurement
cited_terms: ['profile_basic', 'uretprobe_subclass', 'syscall_basic']
model: engine-refine
---

In operational data governance, every observable entity is anchored by a stable identifier that serves as the primary key for all downstream relationships. These identifiers—formatted as prefixed codes such as PROF-0001, URET-0001, or SYSC-0001—provide the immutable reference point across fact and dimension tables, ensuring that a single uretprobe subclass like pthread_create_ret or a syscall such as execve can be traced unambiguously through every attribute, value, and metadata layer. The identifier is not merely a row handle; it is the join key that binds categorical dimensions to quantitative facts, enabling consistent aggregation and filtering regardless of which subsystem generated the observation.

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | pthread::create |
| URET-0002 | pthread_create_ret | python::Py_DECREF |
| URET-0003 | qt_delete_ret | pthread::create |
| URET-0004 | ssl_read_ret | libc::malloc |
| URET-0005 | libc_malloc_ret | python::Py_DECREF |
| URET-0006 | pthread_create_ret | python::Py_DECREF |
| URET-0007 | pthread_create_ret | ssl::SSL_read |

**t_uretprobe_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| URET-0001 | checksum | xsd:string |
| URET-0002 | created_date | xsd:date |
| URET-0003 | identifier | cco:DesignativeICE |
| URET-0004 | license | xsd:string |
| URET-0005 | mime_type | xsd:string |
| URET-0006 | size_bytes | xsd:long |
| URET-0007 | uri | xsd:string |
| URET-0008 | version | xsd:integer |

**t_uretprobe_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0002 | 2024-10-13 |
| URET-0002 | URET-0002 | URET-0002 | 2023-10-28 |
| URET-0003 | URET-0003 | URET-0002 | 2024-07-11 |
| URET-0004 | URET-0004 | URET-0002 | 2023-10-14 |
| URET-0005 | URET-0005 | URET-0002 | 2023-07-03 |
| URET-0006 | URET-0006 | URET-0002 | 2023-12-10 |
| URET-0007 | URET-0007 | URET-0002 | 2023-01-22 |

**t_uretprobe_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0006 | 365 |
| URET-0002 | URET-0001 | URET-0008 | 12 |
| URET-0003 | URET-0002 | URET-0006 | 45 |
| URET-0004 | URET-0002 | URET-0008 | 10 |
| URET-0005 | URET-0003 | URET-0006 | 43 |
| URET-0006 | URET-0003 | URET-0008 | 3 |
| URET-0007 | URET-0004 | URET-0006 | 104 |
| URET-0008 | URET-0004 | URET-0008 | 4 |

**t_uretprobe_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0001 | 9d2b7a16 |
| URET-0002 | URET-0001 | URET-0003 | ARN:res/41 |
| URET-0003 | URET-0001 | URET-0004 | CC-BY-4.0 |
| URET-0004 | URET-0001 | URET-0009 | us-east-1 |
| URET-0005 | URET-0001 | URET-0005 | application/octet-stream |
| URET-0006 | URET-0001 | URET-0010 | Name 06 |
| URET-0007 | URET-0001 | URET-0011 | data-engineering |
| URET-0008 | URET-0001 | URET-0012 | Tags 08 |

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |

Attributes and their types form the schema backbone that gives meaning to raw values. Each attribute carries a name—checksum, created_date, identifier, license—and a corresponding type that constrains how its value is interpreted and stored. Typed attributes such as xsd:string accommodate free-form strings like 9d2b7a16 or CC-BY-4.0, while xsd:date enforces calendar values such as 2024-10-13, and cco:DesignativeICE marks designative identifiers. This type discipline is enforced through a value-normalization pattern: date-typed attributes are persisted in a dedicated value table for dates, integer attributes in an integer-specific table, and string attributes in a varchar table, each table keyed by the entity identifier and the attribute identifier. The entity identifier in these value tables points back to the originating record—URET-0001, for instance—so that a single entity can carry multiple typed attributes across multiple value tables without schema collision.

Profiles introduce a parallel layer of structured metadata, decoupled from the attribute-value model but equally critical for classification and audit. A profile record carries a profile key that groups related observations, a confidence score that quantifies the reliability of the associated measurement, and an uncertainty value that bounds the expected deviation. Confidence values span a continuous range from 0.226 to 0.994, reflecting varying degrees of certainty in the underlying data, while uncertainty values—measured in the hundreds, such as 284.36 or 622.09—provide the complementary margin of error. The profile's numeric value, stored as a miscellaneous field, represents the actual measurement or score, and this value is always interpreted in the context of its confidence and uncertainty bounds. A profile with confidence 0.994 and uncertainty 557.92, for example, signals a high-confidence observation whose absolute deviation remains substantial, a distinction that matters when thresholds trigger downstream actions.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0005 | 0.299 | 284.36 | 728.94 |
| PROF-0002 | PROF-0005 | 0.994 | 557.92 | 380.57 |
| PROF-0003 | PROF-0003 | 0.773 | 622.09 | 607.36 |
| PROF-0004 | PROF-0006 | 0.226 | 488.10 | 448.09 |

Categorization and labeling provide the human-readable overlay that makes machine-generated identifiers and numeric scores actionable for operators. A dimension table maps each profile identifier to a profile label—Profile Label 01 through Profile Label 04—and a profile category—Profile Category 01 through Profile Category 04—creating a classification hierarchy that supports filtering, roll-up, and reporting. Similarly, syscall records carry a label_text field that attaches contextual annotations such as pre-release note, nightly summary, or calibration record to a syscall code like E-21, enabling operators to distinguish between semantically distinct events that share the same underlying code. These labels and categories are not stored inline with the facts; they live in separate dimension tables, preserving normalization and allowing labels to evolve independently of the data they describe.

**dim_profile**

| id | profile_label | profile_category |
| --- | --- | --- |
| PROF-0001 | Profile Label 01 | Profile Category 01 |
| PROF-0002 | Profile Label 02 | Profile Category 02 |
| PROF-0003 | Profile Label 03 | Profile Category 03 |
| PROF-0004 | Profile Label 04 | Profile Category 04 |
| PROF-0005 | Profile Label 05 | Profile Category 05 |
| PROF-0006 | Profile Label 06 | Profile Category 06 |
| PROF-0007 | Profile Label 07 | Profile Category 07 |

The interplay between confidence, uncertainty, and categorization defines the decision surface for any governance framework. When a profile's confidence falls below a defined threshold—say, 0.3, as seen in records with confidence 0.299 and 0.226—the associated uncertainty values of 284.36 and 488.10 respectively signal that the measurement should be treated as provisional, regardless of the category to which it belongs. Conversely, a high-confidence profile with confidence 0.994 warrants immediate operational attention even when its uncertainty is elevated, because the confidence score reflects the reliability of the measurement process itself, not the magnitude of the error. This separation of confidence (process reliability) from uncertainty (error magnitude) is a deliberate design choice that prevents operators from conflating precision with accuracy, and it applies equally to attribute-level values: a checksum stored as xsd:string carries its own implicit confidence through the integrity of the hashing mechanism, while a created_date carries temporal confidence through its adherence to the xsd:date schema.