---
chapter_id: ch_live_uretprobe_subclass_1b3430
topic_id: 183
family: 07_long_tail
cited_terms: ['uretprobe_subclass', 'entity_type_belongs_to', 'schemaorg_creativework_author']
model: engine-refine
---

Attributes, attribute types, entities, identifiers, and miscellaneous values form the backbone of a normalized metadata registry that decouples what an entity is from the properties it carries. At the core of this design are entity tables—such as those tracking uretprobe subclasses, entity type memberships, and schema.org creative work authorships—each anchored by a unique identifier column. These identifiers, formatted as prefixed codes like URET-0001, BELO-0001, and AUTH-0001, serve as the immutable keys that bind every attribute definition and value assignment to a specific entity instance. The entity tables themselves encode relational semantics: a uretprobe subclass record links a probe name such as pthread_create_ret to its target return hook pthread::create, while an entity type membership record associates a concrete entity like edge_gateway_12 with its classification as an IoT Edge Device, and a creative work authorship record connects a document such as API_Reference_Guide to its author WorkflowEngineer.

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

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | IoT Edge Device |
| BELO-0002 | sensor_node_47 | Message Broker Topic |
| BELO-0003 | governance_policy_fin | Cloud Storage Bucket |
| BELO-0004 | sensor_node_47 | Data Quality Rule |
| BELO-0005 | edge_gateway_12 | Network Telemetry |
| BELO-0006 | edge_gateway_12 | Data Quality Rule |
| BELO-0007 | ml_feature_store_prod | Message Broker Topic |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | WorkflowEngineer |
| AUTH-0002 | Provenance_Trace_Report | APIMaintainer |
| AUTH-0003 | API_Reference_Guide | SensorArchitect |
| AUTH-0004 | Provenance_Trace_Report | ModelReviewer |
| AUTH-0005 | Sensor_Network_Spec | ModelReviewer |
| AUTH-0006 | Catalog_Metadata_Index | ModelReviewer |
| AUTH-0007 | Telemetry_Config_Spec | CatalogAdmin |
| AUTH-0008 | Catalog_Metadata_Index | CatalogAdmin |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Attribute definitions are captured in a separate table per domain, establishing a schema for the properties that entities may carry. Each attribute definition row specifies an attr_name and an attr_type, where the type is drawn from a controlled vocabulary of XML Schema and custom ontologies. Common types include xsd:string for free-form text, xsd:date for calendar dates, xsd:dateTime for timestamped values, xsd:decimal for numeric measurements, and xsd:int for integer counts. Domain-specific types such as cco:DesignativeICE appear alongside these standard types, indicating that the registry supports both generic and specialized data typing. For instance, the attribute named checksum is typed as xsd:string across domains, while created_date consistently uses xsd:date, and identifier is typed as cco:DesignativeICE, signaling its role as a designated identity component rather than a simple string.

Values are stored in type-dispatched tables that implement an Entity-Attribute-Value pattern without sacrificing type safety. Rather than storing all values as strings, the registry partitions value rows by their expected type: val_varchar for text, val_int for integers, val_date for dates, val_decimal for decimals, and val_datetime for timestamps. Each value row carries an entity_id that references the entity it belongs to and an attr_id that references the attribute definition it satisfies. This structure means that a single entity can accumulate a rich set of typed properties across multiple value tables. The entity URET-0001, for example, has a varchar value of 9d2b7a16 for attribute AUTH-0001, a date value of 2024-10-13 for attribute URET-0002, an integer value of 365 for attribute AUTH-0006, and a decimal value of 0.703 for attribute BELO-0001, with each value independently typed and independently queryable.

The practical effect of this architecture is that attribute semantics are fully separated from attribute instances. The attribute definition table declares that the property named license has type xsd:string and the property named confidence has type xsd:decimal, but the actual values—CC-BY-4.0 for one entity, 0.703 for another—are stored in the value tables and linked through foreign keys. This separation enables type validation at insertion time, allows different value types to coexist for the same entity without schema drift, and supports extensibility: new attributes can be defined in the attr table without modifying any value table structure. Representative values illustrate the range of data captured. Text values include resource identifiers like ARN:res/41, geographic regions such as us-east-1, encoding specifications like Encoding 02, and license identifiers including GPL-3.0 and CC-BY-4.0. Numeric values span integer counts like 365 and 12 to decimal measurements such as 525.54 and 691.11. Temporal values range from bare dates like 2023-10-28 to full timestamps like 2025-04-30T12:57:36, and language codes such as es appear alongside dimension classifications like Dimension Kind 01.

This multi-table, type-dispatched design ensures that the registry remains both rigorous and flexible. Identifiers provide stable anchors, attribute definitions enforce a consistent type vocabulary, and value tables preserve the integrity of each data type while allowing entities to accumulate an open-ended set of properties. The result is a metadata model that can represent everything from software instrumentation hooks and cloud infrastructure classifications to creative work authorships, all within a single coherent framework where every value is traceable to its entity, its attribute, and its declared type.