---
chapter_id: ch_live_directive_only_governs_d1da8b
topic_id: 47
family: 01_foundation
cited_terms: ['directive_only_governs', 'farmland_acquisition_process', 'schemaorg_product_brand']
model: engine-refine
---

Agricultural land parcels constitute the primary tangible object in institutional farmland investment programs, and their unambiguous designation is prerequisite to title diligence, environmental review, and regulatory reporting. In operational records, each parcel receives a stable identifier that survives conveyance, subdivision, and portfolio rebalancing; Parcel 44B North and Willow Creek Tract 7 exemplify the granularity at which acquisition counsel and asset managers must align cadastral references with process-level documentation. Parcels are not traded in isolation: they enter portfolios through named acquisition processes that encode strategy, counterparty relationships, and the specific tracts targeted for transfer. Where the same parcel identifier appears under more than one process record—as Parcel 44B North does under both PROC-0001 and PROC-0002, each nominally associated with the Black Soil Expansion Deal—the duplication signals either a staged transaction, a data-reconciliation artifact, or a deliberate re-entry of an asset into an active pipeline; in each case, the identifier remains the anchor that permits auditors to trace continuity of interest across process iterations.

Farmland acquisition processes function as governed workflows that bind institutional investors to identifiable land parcels under a single procedural umbrella. The Black Soil Expansion Deal, Appalachian Ridge Timberland Swap, and Central Valley Irrigation Rights represent distinct strategic postures—expansion of productive cropland, timberland restructuring, and irrigation-rights consolidation—yet all share the same structural pattern: a process identifier (PROC-0001 through PROC-0004), a human-readable process name, a designated institutional investor, and one or more target parcels. Meridian Agricultural Capital appears as the counterparty investor in PROC-0002 and PROC-0004, while PensionsPlus Land Trust and CalPERS Agricultural Fund anchor PROC-0001 and PROC-0003 respectively, reflecting the concentration of large-scale agricultural holdings among pension and sovereign-style vehicles. Blackwater Wetland Reserve, acquired under PROC-0004, illustrates that process scope is not limited to row-crop expansion; wetland and conservation tracts enter the same procedural taxonomy when institutional capital pursues diversification or easement-driven returns.

Institutional investors in this domain are not generic equity holders but named fiduciary entities whose mandates, reporting obligations, and beneficiary structures shape how acquisition processes are executed and later audited. PensionsPlus Land Trust, Meridian Agricultural Capital, and CalPERS Agricultural Fund each impose distinct governance overlays—beneficiary disclosure rules, actuarial valuation standards, and state-level public-records requirements—that propagate backward into parcel due diligence and forward into ongoing stewardship. The investor field in acquisition records therefore serves a compliance function beyond mere counterparty identification: it determines which supervisory regimes apply once land is on balance sheet and which enforcement pathways activate if post-closing covenants are breached.

Parallel to asset-level governance runs a directive layer that governs how organizations collect, retain, and protect operational data touching regulated domains. Records GOVE-0001 through GOVE-0004 instantiate this layer, each pairing a directive citation—CCPA Section 1798.100, ICH Q10, FDA 21 CFR Part 11, PCI DSS v4.0—with a related operational scope and a binding enforcement posture. CCPA Section 1798.100, effective 2023-05-14 and tied to laboratory reagent inventory, imposes consumer-data transparency obligations that can intersect with supplier and research-partner records; ICH Q10, effective 2023-04-09 over industrial control systems, anchors pharmaceutical-quality management principles to process-control infrastructure; FDA 21 CFR Part 11, effective 2024-03-28 and scoped to telemetry log streams, mandates electronic-record integrity for instrumented environments; and PCI DSS v4.0, effective 2023-10-25 over financial transaction logs, governs cardholder-data environments that may process lease payments, input purchases, or investor capital calls. In every case, enforcement is recorded as mandatory, meaning organizational policy must treat non-compliance as a hard stop rather than a discretionary remediation item. The effective date field operationalizes temporal jurisdiction: obligations do not apply retroactively by assumption but from the stated calendar anchor, so systems processing historical telemetry or financial logs must version their control baselines against 2024-03-28 and 2023-10-25 respectively rather than a single enterprise-wide rollout date.

Brand metadata and schema versioning supply the information-architecture substrate on which parcel, process, and directive records are published, exchanged, and validated. Brand identifiers—BRAN-0001 through BRAN-0004 in the dimension layer—carry human-readable labels (Brand Label 01 through Brand Label 04) and categorical assignments (Brand Category 01 through Brand Category 04) that classify datasets or publishing entities for downstream consumers who may not interpret raw keys. The category dimension partitions brands into mutually intelligible groupings for access control, SLA tiering, or regulatory packaging, while the label field captures display semantics that operations staff reconcile against marketing or legal nomenclature. At the fact layer, each brand instance records a brand key reference, a byte-size measure, and an integer version: sizes ranging from 114,301,972 to 998,785,819 bytes quantify the physical footprint of serialized schema artifacts, and version numbers 3 through 8 document evolutionary change in field definitions, cardinality constraints, or extension namespaces. A brand key that points to a sibling identifier—as when BRAN-0001 references brand_key BRAN-0003—typically denotes inheritance, alias resolution, or a canonical-to-derived mapping within a federated catalog; consumers resolving BRAN-0001 must therefore traverse the key graph to obtain the authoritative category and label from the dimension record while honoring the version and size attestation attached to the published artifact.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

Taken together, identifiers thread these domains into a single auditable fabric: GOVE-*, PROC-*, and BRAN-* keys interoperate only when effective dates, enforcement grades, investor mandates, and schema versions are co-evaluated at the point of use. An acquisition closing on Willow Creek Tract 7 under CalPERS Agricultural Fund must satisfy not only the farmland process record but also any mandatory directives whose related scopes encompass financial logs or telemetry produced during diligence; likewise, exchanging parcel attributes through Brand Label 03 at schema version 4 imposes byte-level and versioning constraints that downstream validators enforce before ingesting agriculturallandparcel instances. Miscellaneous descriptive fields—brand labels, process names, directive citations—exist precisely because machine keys alone are insufficient for human governance boards and external examiners; the operational guide treats them as first-class evidence alongside quantitative measures such as size_bytes and calendar-stamped effectivedate values. Mastery of the domain therefore requires reading identifiers as durable joins, enforcement as non-negotiable policy state, institutional investors as compliance-bearing counterparties, and versioned brand artifacts as the contract under which all other entities remain mutually consistent over time.

**t_directive_only_governs**

| id | directive | related | effective_date | enforcement |
| --- | --- | --- | --- | --- |
| GOVE-0001 | CCPA Section 1798.100 | laboratory reagent inventory | 2023-05-14 | mandatory |
| GOVE-0002 | ICH Q10 | industrial control systems | 2023-04-09 | mandatory |
| GOVE-0003 | FDA 21 CFR Part 11 | telemetry log streams | 2024-03-28 | mandatory |
| GOVE-0004 | PCI DSS v4.0 | financial transaction logs | 2023-10-25 | mandatory |
| GOVE-0005 | HIPAA Privacy Rule | financial transaction logs | 2023-11-19 | advisory |
| GOVE-0006 | PCI DSS v4.0 | access credential vaults | 2023-08-29 | advisory |
| GOVE-0007 | HIPAA Privacy Rule | biometric authentication data | 2025-01-19 | advisory |
| GOVE-0008 | HIPAA Privacy Rule | research cohort datasets | 2024-12-25 | advisory |

**t_farmland_acquisition_process**

| id | farmland_acquisition_process | targets_investor | acquires_land |
| --- | --- | --- | --- |
| PROC-0001 | Black Soil Expansion Deal | PensionsPlus Land Trust | Parcel 44B North |
| PROC-0002 | Appalachian Ridge Timberland Swap | Meridian Agricultural Capital | Parcel 44B North |
| PROC-0003 | Central Valley Irrigation Rights | CalPERS Agricultural Fund | Willow Creek Tract 7 |
| PROC-0004 | Black Soil Expansion Deal | Meridian Agricultural Capital | Blackwater Wetland Reserve |
| PROC-0005 | Midwest Grain Corridor Buy | Meridian Agricultural Capital | High Plains Grazing Lease |
| PROC-0006 | Central Valley Irrigation Rights | Sovereign Wealth Alpha | Oakhaven Irrigation Zone |
| PROC-0007 | Sierra Foothold Vineyard Purchase | BlackRock Farmland Partners | Blackwater Wetland Reserve |