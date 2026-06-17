---
chapter_id: bc5494cbbe4cd3ac
topic_id: 186
family: 03_directive_governance
cited_terms: ['schemaorg_place_address', 'attestation_with_supporting_evidence', 'schemaorg_place_geocoord', 'audit_with_findings', 'requirement_equiv_specifies_target']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Structured Compliance of Physical Artifacts and Directives

## 7.1 Scope and Preamble

This chapter delineates the formal ontological structures governing the relationship between physical artifacts, their spatial attributes, and the regulatory directives that bind them. In the context of high-assurance compliance frameworks—such as those utilized by the Office of the Comptroller of the Currency or municipal governance bodies—it is insufficient to treat location data as mere strings. Rather, an address or a coordinate must be modeled as a distinct entity, inextricably linked to verification processes and audit findings. The following sections detail five axiomatic concepts that form the backbone of the "Compliance and Governance Ontology," providing a rigorous schema for mapping physical reality to regulatory obligation.

## 7.2 Artifact-Address Correlation

### 7.2.1 Conceptual Definition
The foundational unit of physical governance is the `cco:Artifact`. In regulatory terms, an Artifact represents a tangible entity—such as a bank branch, a school facility, or a government office—that is subject to jurisdictional oversight. Axiom 1 establishes that every such Artifact is a subclass that possesses a postal address. However, the ontology does not treat the address as a passive data property of the Artifact. Instead, it elevates the address to a first-class object (`{Y:Class}`) which is itself subject to validation.

This distinction is critical for audit trails. If the address were merely a text string, changes to street names or jurisdictional boundaries would break the historical chain of custody. By modeling the address as a related class, the system preserves the integrity of the "Place" concept even as the descriptive attributes of the location evolve.

### 7.2.2 Relational Implementation
The implementation of this axiom relies on the `t_schemaorg_place_address` table. The primary key (`id`) serves as the unique identifier for the relationship between the Artifact (`x`) and the Address (`y`).

Crucially, the schema enforces a foreign key constraint: the Address (`y`) must reference an existing identifier in the `t_attestation_with_supporting_evidence` table. This constraint encodes a fundamental rule of the governance framework: an address is not considered valid or active within the system unless it is supported by a specific attestation process. This circular dependency (where the Address points to an Attestation, and as we shall see, the Attestation points back to the Address) ensures that physical locations are always paired with current evidence of their existence or status.

**Table 7.1: Artifact-Address Correlation Registry**

| id | x (Artifact) | y (Address Reference) |
|---|---|---|
| pa_001 | First National Bank Albany | att_001 |
| pa_002 | First National Bank Breckenridge | att_002 |
| pa_003 | Community Cabinet Venue | att_003 |
| pa_004 | Gladstone Regional Office | att_004 |

*Table 7.1 illustrates the binding of physical artifacts to their registered postal addresses. Note that column `y` contains references to attestation records, indicating that the address record `att_001` is the authoritative object representing the address for the Albany branch.*

## 7.3 Evidence-Based Attestation

### 7.3.1 Conceptual Definition
The second axiom governs the process of validation. The class `bfo:0000015` (a Process) represents the activity of attestation. In compliance frameworks, an attestation is a formal declaration that a specific set of criteria has been met. Axiom 2 posits that this Process (`{X:Class}`) must possess supporting evidence (`{Y:Class}`).

This structure moves beyond simple binary compliance flags. It requires the regulator (or the automated system) to link the *act* of verification to the *substance* of the verification. For instance, an attestation that a bank branch exists is not valid without supporting evidence, which might be a site visit report or a lease agreement. In this schema, the "supporting evidence" is modeled as a reference to the Place-Address record defined in the previous section.

### 7.3.2 Relational Implementation
The `t_attestation_with_supporting_evidence` table captures this relationship. The table structure is symmetrical to the previous table but inverted in logic. Here, the Process (`x`) is the subject, and the Evidence (`y`) is the object.

The foreign key constraint dictates that the Evidence (`y`) must reference an ID in `t_schemaorg_place_address`. This creates the aforementioned "mutual dependency" loop. An Attestation cannot exist without pointing to an Address record, and an Address record cannot exist without being pointed to by an Attestation. In database terms, this enforces strict insert-order requirements (typically handled via deferred constraints or transactional batches), but in ontological terms, it ensures that a location and its verification are co-dependent. One cannot exist in the registry without the other.

**Table 7.2: Attestation and Evidence Log**

| id | x (Attestation Process) | y (Supporting Evidence) |
|---|---|---|
| att_001 | Site Verification Albany | pa_001 |
| att_002 | Site Verification Breckenridge | pa_002 |
| att_003 | Event Permit Verification | pa_003 |
| att_004 | Regional Office Audit | pa_004 |

*Table 7.2 logs the specific attestation processes. The column `y` references the Place-Address IDs, confirming that the evidence for the "Site Verification Albany" process is the address record `pa_001` established in Table 7.1.*

## 7.4 Geospatial Coordinate Validation

### 7.4.1 Conceptual Definition
While postal addresses provide a human-readable reference to a location, regulatory frameworks often require machine-precision geospatial data. Axiom 3 addresses this by asserting that an Artifact (`{X:Class}`) has GeoCoordinates (`{Y:Class}`).

The inclusion of this axiom facilitates risk modeling, flood zone monitoring, and jurisdictional mapping. However, similar to the postal address, the ontology treats coordinates not as raw latitude/longitude literals, but as a class of object that must be substantiated. The coordinates are linked to the attestation process, ensuring that the spatial data has been verified (e.g., via a surveyor's report) rather than blindly accepted from user input.

### 7.4.2 Relational Implementation
The `t_schemaorg_place_geocoord` table manages these spatial attributes. The schema links the Artifact (`x`) to its Coordinates (`y`). The foreign key constraint requires that the Coordinates (`y`) reference an entry in the `t_attestation_with_supporting_evidence` table.

This design choice implies that the "GeoCoordinate" entity is effectively validated by the Attestation. It suggests a data model where the coordinate set is treated as an output or a property of the verification process itself. For example, the Attestation ID `att_001` might encapsulate not just the existence of the bank, but the precise GPS coordinates captured during the site visit. Thus, the coordinate record inherits the validity of the attestation record.

**Table 7.3: Geospatial Coordinate Registry**

| id | x (Artifact) | y (Coordinate Validation) |
|---|---|---|
| geo_001 | First National Bank Albany | att_001 |
| geo_002 | First National Bank Breckenridge | att_002 |
| geo_003 | Gladstone Regional Office | att_004 |

*Table 7.3 links the physical artifacts to their validated geospatial data. The reference to `att_001` for the Albany branch indicates that the coordinates used in the system are those specifically locked down during the verification process.*

## 7.5 Audit Findings and Location Resolution

### 7.5.1 Conceptual Definition
Axiom 4 introduces the concept of the Audit (`{X:Class}`), a specific type of Process (`bfo:0000015`) designed to evaluate compliance. An Audit is distinct from a standard Attestation in that it yields Findings (`{Y:Class}`). Findings represent the discrepancies, observations, or violations identified during the audit process.

In a distributed regulatory environment, findings must be anchored to a specific location to be actionable. A finding regarding "improper signage" is useless if it is not attached to "100 S. Main Albany, TX." This axiom ensures that every finding is structurally bound to a Place-Address record.

### 7.5.2 Relational Implementation
The `t_audit_with_findings` table formalizes this binding. The Audit (`x`) is linked to its Findings (`y`). The schema enforces that the Findings (`y`) must reference a `t_schemaorg_place_address` ID.

This constraint effectively "grounds" the abstract audit finding in the physical world. It prevents the creation of orphaned findings that exist in the database but cannot be located on a map. By referencing the Address ID, the audit finding inherits the full context of the location, including its attestation history and geo-coordinates.

**Table 7.4: Audit Findings Report**

| id | x (Audit Process) | y (Finding Location) |
|---|---|---|
| aud_001 | CRA Performance Evaluation 2008 | pa_001 |
| aud_002 | Q3 Safety Inspection | pa_003 |
| aud_003 | Annual Compliance Review | pa_002 |

*Table 7.4 details specific audit events and their resultant findings. The CRA Performance Evaluation (aud_001) generated findings specifically tied to the Albany branch address (pa_001), ensuring that remediation efforts are directed to the correct physical site.*

## 7.6 Directive Specification and Targeting

### 7.6.1 Conceptual Definition
The final axiom governs the rules themselves. A Requirement (`{X:Class}`) is defined as a `cco:DirectiveICE` (Information Content Entity) that Specifies (`{Y:Class}`) an action or state and AppliesTo (`{Z:Class}`) a target.

This axiom allows the ontology to model the *law* or *regulation* alongside the *physical reality*. A Requirement such as "All branches must display accessibility posters" is an Information Content Entity. It *Specifies* the content of the poster and *AppliesTo* the specific Artifacts (the branches).

### 7.6.2 Relational Implementation
The `t_requirement_equiv_specifies_target` table captures this tripartite relationship. The Requirement (`x`) Specifies a target (`y`) and Applies to a context (`z`). The foreign key constraint mandates that the target (`y`) must be a `t_schemaorg_place_address`.

This constraint is powerful: it implies that requirements are targeted specifically at the *address records* of the artifacts. This allows for granular governance. A directive can be applied to `pa_001` (Albany) without necessarily applying to `pa_002` (Breckenridge), even if they are part of the same organization. It bridges the gap between the abstract "Directive" and the concrete "Place."

**Table 7.5: Directive and Requirement Mapping**

| id | x (Requirement) | y (Specified Target) | z (Applicability Context) |
|---|---|---|---|
| req_001 | CRA Lending Data Requirement | pa_001 | Charter_3248 |
| req_002 | Public Accessibility Notice | pa_003 | Event_Permit_99 |
| req_003 | Structural Integrity Code | pa_004 | Regional_Standard_7 |

*Table 7.5 maps regulatory requirements to specific physical targets. The CRA Lending Data Requirement (req_001) is specifically targeted at the Albany address (pa_001), operating under the authority of Charter 3248.*

```json
{
  "tables": [
    {
      "name": "t_schemaorg_place_address",
      "rows": [
        [
          "pa_001",
          "First National Bank Albany",
          "att_001"
        ],
        [
          "pa_002",
          "First National Bank Breckenridge",
          "att_002"
        ],
        [
          "pa_003",
          "Community Cabinet Venue",
          "att_003"
        ],
        [
          "pa_004",
          "Gladstone Regional Office",
          "att_004"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "att_001",
          "Site Verification Albany",
          "pa_001"
        ],
        [
          "att_002",
          "Site Verification Breckenridge",
          "pa_002"
        ],
        [
          "att_003",
          "Event Permit Verification",
          "pa_003"
        ],
        [
          "att_004",
          "Regional Office Audit",
          "pa_004"
        ]
      ]
    },
    {
      "name": "t_schemaorg_place_geocoord",
      "rows": [
        [
          "geo_001",
          "First National Bank Albany",
          "att_001"
        ],
        [
          "geo_002",
          "First National Bank Breckenridge",
          "att_002"
        ],
        [
          "geo_003",
          "Gladstone Regional Office",
          "att_004"
        ]
      ]
    },
    {
      "name": "t_audit_with_findings",
      "rows": [
        [
          "aud_001",
          "CRA Performance Evaluation 2008",
          "pa_001"
        ],
        [
          "aud_002",
          "Q3 Safety Inspection",
          "pa_003"
        ],
        [
          "aud_003",
          "Annual Compliance Review",
          "pa_002"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "req_001",
          "CRA Lending Data Requirement",
          "pa_001",
          "Charter_3248"
        ],
        [
          "req_002",
          "Public Accessibility Notice",
          "pa_003",
          "Event_Permit_99"
        ],
        [
          "req_003",
          "Structural Integrity Code",
          "pa_004",
          "Regional_Standard_7"
        ]
      ]
    }
  ]
}
```