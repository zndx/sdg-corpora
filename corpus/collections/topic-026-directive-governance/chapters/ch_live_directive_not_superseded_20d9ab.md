---
chapter_id: ch_live_directive_not_superseded_20d9ab
topic_id: 26
family: 07_long_tail
cited_terms: ['directive_not_superseded', 'account_authorization_record', 'lineage_edge_to_target']
model: engine-refine
---

An account authorization record is the governed artifact that binds a social networking application to accountable administrative control. It is not merely a permission flag; it is a durable compliance object that names what was authorized, which application instance it covers, and which staff administrator bears operational responsibility. When REC-ACC-5591 appears twice in the corpus—once paired with SnapchatV2 under security_lee and again under platform_mgr_wu with BlueskyClient—the repetition of the authorization code signals a reusable authorization pattern applied across distinct application registrations rather than a one-off grant. Contrasting records such as PERM-ACC-6609 and AUTH-LOG-3381 show how the same structural role accommodates different authorization modalities: standing permission versus authenticated logging of access events, each with its own administrator (admin_jchen, sysadmin_klee) and application target (SnapchatV2, LinkedInPro). In practice, auditors and security operators treat the account authorization record as the anchor for “who may administer what, on which platform, under which formal grant,” because it externalizes decisions that would otherwise live only in informal tickets or console clicks.

Identifiers stabilize that anchor across every downstream representation. An identifier is a stable, system-issued key—SUPE-0001 for a directive, RECO-0001 for an authorization record, TARG-0001 for a lineage edge—that never doubles as descriptive prose. Its job is referential integrity: the same identifier reappears wherever a fact about that object must be stored, joined, or superseded without ambiguity. Effective dating for SUPE-0002’s WHO Manufacturing Guide (2025-04-26) and SUPE-0003’s EPA Emission Standard (2023-02-14) are not “dates on the directive row”; they are values keyed by entity and attribute identifiers so that multiple typed facts can attach to one entity without collapsing into a wide, brittle table. When RECO-0001 carries encoding metadata and RECO-0002 carries label_text in Spanish (“es”), the identifier RECO-0001 is what lets reviewers confirm they are inspecting the same authorization envelope—not a similarly named application or a parallel draft.

**t_directive_not_superseded**

| id | directive | directive_2 |
| --- | --- | --- |
| SUPE-0001 | WHO Manufacturing Guide | ISO Quality Management |
| SUPE-0002 | WHO Manufacturing Guide | ISO Information Standard |
| SUPE-0003 | EPA Emission Standard | ISO Information Standard |
| SUPE-0004 | OSHA Lockout Protocol | CISA Operational Order |
| SUPE-0005 | GLP Laboratory Practice | CISA Operational Order |
| SUPE-0006 | FDA Electronic Records | SOC Audit Standard |

**t_directive_not_superseded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUPE-0001 | effective_date | xsd:date |
| SUPE-0002 | enforcement | xsd:string |
| SUPE-0003 | mandatory | xsd:boolean |
| SUPE-0004 | priority | xsd:integer |
| SUPE-0005 | review_cycle_days | xsd:integer |
| SUPE-0006 | scope | xsd:string |
| SUPE-0007 | encoding | xsd:string |
| SUPE-0008 | label_text | xsd:string |

**t_directive_not_superseded_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0003 | false |
| SUPE-0002 | SUPE-0002 | SUPE-0003 | true |
| SUPE-0003 | SUPE-0003 | SUPE-0003 | false |
| SUPE-0004 | SUPE-0004 | SUPE-0003 | false |
| SUPE-0005 | SUPE-0005 | SUPE-0003 | true |
| SUPE-0006 | SUPE-0006 | SUPE-0003 | true |

**t_directive_not_superseded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0001 | 2023-02-05 |
| SUPE-0002 | SUPE-0002 | SUPE-0001 | 2025-04-26 |
| SUPE-0003 | SUPE-0003 | SUPE-0001 | 2023-02-14 |
| SUPE-0004 | SUPE-0004 | SUPE-0001 | 2025-06-15 |
| SUPE-0005 | SUPE-0005 | SUPE-0001 | 2023-09-27 |
| SUPE-0006 | SUPE-0006 | SUPE-0001 | 2024-06-22 |

**t_directive_not_superseded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0004 | 4 |
| SUPE-0002 | SUPE-0001 | SUPE-0005 | 434 |
| SUPE-0003 | SUPE-0002 | SUPE-0004 | 3 |
| SUPE-0004 | SUPE-0002 | SUPE-0005 | 471 |
| SUPE-0005 | SUPE-0003 | SUPE-0004 | 4 |
| SUPE-0006 | SUPE-0003 | SUPE-0005 | 762 |
| SUPE-0007 | SUPE-0004 | SUPE-0004 | 3 |
| SUPE-0008 | SUPE-0004 | SUPE-0005 | 766 |

**t_directive_not_superseded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0007 | Encoding 01 |
| SUPE-0002 | SUPE-0001 | SUPE-0002 | Enforcement 02 |
| SUPE-0003 | SUPE-0001 | SUPE-0008 | pre-release note |
| SUPE-0004 | SUPE-0001 | SUPE-0009 | ja |
| SUPE-0005 | SUPE-0001 | SUPE-0006 | Scope 05 |
| SUPE-0006 | SUPE-0002 | SUPE-0007 | Encoding 06 |
| SUPE-0007 | SUPE-0002 | SUPE-0002 | Enforcement 07 |
| SUPE-0008 | SUPE-0002 | SUPE-0008 | change rationale |

Entity, attribute, and attribute type form the typed fact layer that surrounds each governed object. The entity is the thing being described—SUPE-0001 as a not-superseded directive, RECO-0001 as an authorization record—while the attribute names the facet under scrutiny: effective_date, mandatory, priority, encoding, language. Attribute type declares the semantic contract for that facet before any value is accepted: xsd:date for temporal bounds, xsd:boolean for binary obligations, xsd:integer for ordinal or scalar priority, xsd:string for human-readable or coded text. This separation matters because compliance logic depends on type-safe evaluation. A mandatory flag stored as xsd:boolean can be evaluated uniformly—only SUPE-0002 reads true among the four directive entities shown—whereas priority integers (4 and 434 on SUPE-0001, 3 and 471 on SUPE-0002) support ranking and exception routing without overloading a single column with incompatible meanings. Attribute typing also prevents silent corruption: a language tag like “ja” on a directive annotation and “es” on an authorization label_text are both strings, but their attr bindings tell consumers whether they are localizing regulatory text or operator-facing UI copy.

The misc field—despite its humble name—is where evidentiary substance lives once structure has done its work. Misc holds the instantiated value for a given entity–attribute pair: false for non-mandatory directives, “Enforcement 02” for a varchar enforcement label, “pre-release note” for ancillary directive commentary, “nightly summary” for an authorization label. Treating the payload as misc rather than baking values into entity rows preserves extensibility; new attributes (encoding, label_text, language) can be introduced without migrating core registration tables. Operators see this in authorization practice when Encoding 01 attaches to RECO-0001 while Encoding 04 attaches to RECO-0002—same attribute family, different misc payloads—signaling variant handling rules or export formats without changing the underlying record type. Likewise, directive varchar misc values such as “Encoding 01” and enforcement strings sit alongside boolean mandatory outcomes and dated effective boundaries, giving investigators a multi-typed dossier per entity rather than a single summary field that would discard nuance.

Social networking application and staff administrator are the two operational poles the authorization record joins. The social networking application names the registered surface—SnapchatV2, BlueskyClient, LinkedInPro—whose API credentials, data flows, and user-visible behavior fall under enterprise policy. The staff administrator names the human or role account charged with lifecycle actions: provisioning, revocation, incident response, or configuration drift review. Pairing SnapchatV2 with security_lee on one record and with admin_jchen on another illustrates how identical application identifiers can still imply different administrative scopes when authorization codes differ (REC-ACC-5591 versus PERM-ACC-6609). Governance frameworks use this pairing to enforce separation of duties: platform_mgr_wu may own Blueshare client operations while sysadmin_klee retains AUTH-LOG-3381 for LinkedInPro, ensuring high-risk social integrations never float without a named custodian. Access reviews therefore begin at the record, traverse to the application inventory, and end with administrator attestation—each hop mediated by identifiers, not display names alone.

**t_account_authorization_record**

| id | account_authorization_record | registers_application | assigns_administrator |
| --- | --- | --- | --- |
| RECO-0001 | REC-ACC-5591 | SnapchatV2 | security_lee |
| RECO-0002 | PERM-ACC-6609 | SnapchatV2 | admin_jchen |
| RECO-0003 | REC-ACC-5591 | BlueskyClient | platform_mgr_wu |
| RECO-0004 | AUTH-LOG-3381 | LinkedInPro | sysadmin_klee |
| RECO-0005 | AUTH-LOG-1192 | DiscordMain | platform_mgr_wu |
| RECO-0006 | AUTH-REC-2215 | LinkedInPro | sysadmin_klee |

Unit completes the picture where governed objects participate in measurable lineage rather than purely administrative registration. In downstream targeting edges, unit declares the dimension in which a misc value must be interpreted: nanometers (“nm”) for a model checkpoint routed to an executive dashboard, “ratio” for a knowledge-base dump landing in a feature store, “count” for another checkpoint shipment, kilograms (“kg”) for raw telemetry feeding a risk prediction model. A misc value of 555.98 is meaningless without its unit; with unit=nm it becomes a defensible quantity in a pipeline audit, comparable across transfers to the same to_target. The same architectural discipline seen in directive priority integers and authorization encodings therefore extends to operational telemetry: identifiers tie lineage facts to targets, misc carries the magnitude, and unit tells compliance analysts whether they are reviewing a physical mass, a unitless score, or a discrete cardinality. Together, account authorization records, typed entity attributes, and unit-aware lineage values form a single evidentiary grammar—register the obligation, type the facts, name the custodians and applications, and measure what flowed—so that retention, enforcement, and accountability remain queryable long after the original approval meeting adjourned.

**t_account_authorization_record_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RECO-0001 | encoding | xsd:string |
| RECO-0002 | label_text | xsd:string |
| RECO-0003 | language | xsd:string |

**t_account_authorization_record_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0001 | Encoding 01 |
| RECO-0002 | RECO-0001 | RECO-0002 | nightly summary |
| RECO-0003 | RECO-0001 | RECO-0003 | es |
| RECO-0004 | RECO-0002 | RECO-0001 | Encoding 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | audit excerpt |
| RECO-0006 | RECO-0002 | RECO-0003 | fr |
| RECO-0007 | RECO-0003 | RECO-0001 | Encoding 07 |
| RECO-0008 | RECO-0003 | RECO-0002 | audit excerpt |

**t_lineage_edge_to_target**

| id | lineage | to_target | unit | value |
| --- | --- | --- | --- | --- |
| TARG-0001 | ml_model_checkpoint | executive_dashboard | nm | 555.98 |
| TARG-0002 | knowledge_base_dump | feature_store_table | ratio | 967.34 |
| TARG-0003 | ml_model_checkpoint | executive_dashboard | count | 771.21 |
| TARG-0004 | raw_telemetry_feed | risk_prediction_model | kg | 171.35 |
| TARG-0005 | lab_sample_manifest | analytics_warehouse | count | 934.12 |
| TARG-0006 | quality_validation_suite | backup_snapshot | count | 626.71 |