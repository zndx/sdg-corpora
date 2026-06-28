---
chapter_id: ch_live_universal_combined_with_existential_3ac507
topic_id: 34
family: 01_foundation
cited_terms: ['universal_combined_with_existential', 'school_security_policy', 'policy_subclass']
model: engine-refine
---

A school security policy is a formal governance instrument that codifies the safety objectives an institution must pursue and the constitutional constraints it must satisfy. At Cedar Ridge Preparatory, for instance, the policy targets network intrusion detection while remaining bound by OSHA workplace safety requirements; Westfield Middle School's policy addresses unauthorized access prevention under a no-lethal-force rule; Lincoln High School and Sunrise International School both focus on cyber threat intelligence, the former constrained by ADA accessibility standards and the latter by state education statutes. Each policy carries a unique identifier—POLI-0001 through POLI-0004—that anchors it within the governance registry and enables cross-referencing across all attribute and value tables. Beyond these institutional policies, the framework also supports policy subclasses such as the Telemetry Privacy Standard, Provenance Directive, Data Retention Policy, and Metadata Governance, each governing distinct operational domains including data lakes, research archives, sensor networks, and API gateways.

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

**t_school_security_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

Attributes provide the dimensional structure through which policies are described and evaluated. Every policy exposes a set of named attributes—effective_date, enforcement, mandatory, and priority—each typed to a specific data schema such as xsd:date, xsd:string, xsd:boolean, or xsd:integer. This type discipline ensures that values stored against an attribute are semantically consistent: the effective_date attribute always receives a date value like 2023-05-09 or 2024-07-27, while the mandatory attribute accepts only boolean values such as true or false. The same attribute taxonomy applies uniformly across both school security policies and their subclasses, enabling a unified query surface regardless of the policy's operational scope. Cedar Ridge Preparatory's policy, for example, carries an effective date of 2023-05-09 and a mandatory flag set to true, whereas Westfield Middle School's policy took effect on 2024-07-27 with mandatory set to false.

The entity column serves as the relational bridge connecting attribute definitions to their concrete values. Each row in the value tables references an entity identifier that points back to the originating policy—POLI-0001, for instance, appears as the entity_id across multiple value rows, indicating that the effective_date of 2023-05-09, the mandatory status of true, and the priority value of 2 all belong to the same policy instance. This design allows a single policy to accumulate heterogeneous attributes without requiring a fixed schema: Cedar Ridge Preparatory's policy records an enforcement descriptor of "Enforcement 02" and a priority of 2, while also carrying an intake form reference and a language code of "ja." The entity linkage is equally present in the policy subclass domain, where the Telemetry Privacy Standard (POLI-0001) carries an effective date of 2023-01-31, a mandatory flag of false, and a priority of 1, demonstrating that the same attribute-value pattern scales across policy categories.

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

The misc column holds the actual attribute values, typed according to the attribute's declared type and stored in specialized value tables that partition by data type. Boolean attributes such as mandatory are stored in a dedicated boolean value table, where each row maps an entity and attribute pair to a true or false literal—Lincoln High School's policy and Sunrise International School's policy both record mandatory as false, while Westfield Middle School's policy records it as true. Integer attributes like priority reside in an integer value table, capturing values ranging from 1 for the Telemetry Privacy Standard to 982 for Cedar Ridge Preparatory's secondary priority attribute. String attributes such as enforcement and intake form are stored in a varchar value table, holding values like "Encoding 01," "Enforcement 02," "nightly summary," and locale codes such as "fr" and "ja." This type-partitioned storage model preserves type safety while allowing policies to carry an arbitrary set of attributes without schema migration.

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |

The universal combined with existential table extends the governance model beyond policy attributes into a broader relational fabric, linking identifiers such as EXIS-0001 through EXIS-0004 to pairs of universal and related entities. These pairs include Lab_Centrifuge_Rotor linked to Atmospheric_Moisture, Supply_Chain_Shipment linked to Personal_Information, GDPR_Consent_Record linked to Tissue_Sample, and Database_Backup_Volume linked to Personal_Information. While structurally distinct from the policy attribute system, this table shares the same identifier-based referencing pattern and demonstrates how the framework's entity-attribute-value paradigm generalizes across domains—from school security policies and data governance subclasses to operational relationships between physical assets, data subjects, and compliance records.

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |