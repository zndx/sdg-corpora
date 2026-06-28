---
chapter_id: ch_live_kernelhook_observes_event_class_5f75b9
topic_id: 155
family: 04_ebpf_kernel
cited_terms: ['kernelhook_observes_event_class', 'column_pair_object', 'attribute_set_subclass']
model: engine-refine
---

The identification of discrete entities within a telemetry infrastructure rests upon a dual-layer taxonomy of attributes and object columns, each anchored by a stable identifier and classified into a categorical hierarchy. An attribute—such as those enumerated under identifiers SET-0001 through SET-0005—represents a quantifiable property of the system under observation, while an object column (OBJE-0001 through OBJE-0006) denotes the structural container or measurement target to which such properties are affixed. Both layers are organized by category: Attribute Category 01 through 04 and Object Column Category 01 through 04 provide the coarse-grained classification schema, and each category is further distinguished by a human-readable label—Attribute Label 01, Object Column Label 03, and so forth—serving as the misc layer of metadata that bridges machine-readable identifiers to operational comprehension. The identifier itself, whether formatted as EVEN-0001 for event-class records or SET-0001 for attribute instances, functions as the immutable primary key across all fact and dimension tables, ensuring referential integrity between the observational kernel hooks and the measured properties they capture.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

Confidence and uncertainty constitute the paired epistemic metrics that quantify the reliability of every recorded measurement. Confidence values—floating-point numbers ranging from 0.068 to 0.926—express the degree of assurance that a given fact row accurately reflects the underlying system state; a confidence of 0.926 on attribute SET-0001 signals near-certainty, whereas a confidence of 0.068 on object column OBJE-0001 indicates substantial doubt. Uncertainty, measured on a complementary scale from 274.08 to 984.09, captures the absolute variance or error bound associated with the measurement: an uncertainty of 984.09 on OBJE-0004 accompanies a value of 140.18, suggesting that the observed magnitude is embedded within a wide confidence interval, while an uncertainty of 274.08 on SET-0002, paired with a value of 742.87, reflects a tighter bound relative to the measurement itself. These two metrics are not inversely proportional by construction; rather, they encode orthogonal dimensions of measurement quality—one probabilistic, the other absolute—and must be evaluated jointly when assessing the trustworthiness of any fact row.

The factual measurements themselves are stored in two parallel fact tables, fact_attribute and fact_column, each recording a value alongside its confidence and uncertainty against a keyed reference to the corresponding dimension. In fact_attribute, the value column holds the observed magnitude—482.01 for SET-0001, 742.87 for SET-0002, 100.75 for SET-0005, and 779.52 for SET-0003—while fact_column records values such as 257.80, 571.55, 140.18, and 131.21 for the respective object column references. The foreign-key relationships are explicit: fact_attribute.attribute_key references dim_attribute.id, and fact_column.object_column_key references dim_object_column.id, establishing a star-schema topology in which the dimension tables provide the categorical and labeling context and the fact tables carry the time-stamped or snapshot measurements. This separation ensures that category reassignments or label updates propagate without altering historical fact rows, preserving auditability across schema evolution.

Location and name fields in the t_kernelhook_observes_event_class table ground the abstract measurement infrastructure in physical and operational reality. The kernel hooks—perf-monitor, syscall-hook, kernel-watcher, and telemetry-daemon—are each assigned to a geographic or availability zone (ap-south-2, us-east-1, zone-b) and given a descriptive name such as probe_capture_main, audit_log_stream, net_watch_stream, or event_feed_prod. These hooks are the sensors that feed data into the attribute and object column measurement pipeline; the observes_event column (disk-io, net-packet-capture, thread-schedule) specifies the kernel-level event class each hook monitors. The location field is critical for regional compliance and data-residency governance, as it determines which jurisdictional regulations apply to the captured telemetry, while the name field provides the operational handle used by incident-response runbooks and alerting configurations. Together, the identifier, location, and name form the misc layer of the event-class dimension, completing the traceability chain from raw kernel event through measurement fact to categorical classification.

**t_kernelhook_observes_event_class**

| id | kernelhook | observes_event | location | name |
| --- | --- | --- | --- | --- |
| EVEN-0001 | perf-monitor | disk-io | ap-south-2 | probe_capture_main |
| EVEN-0002 | syscall-hook | net-packet-capture | us-east-1 | audit_log_stream |
| EVEN-0003 | kernel-watcher | net-packet-capture | zone-b | net_watch_stream |
| EVEN-0004 | telemetry-daemon | thread-schedule | us-east-1 | event_feed_prod |
| EVEN-0005 | ebpf-probe | thread-schedule | on-prem-dc1 | probe_capture_main |