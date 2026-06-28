---
chapter_id: ch_live_mass_function_basic_f54e78
topic_id: 20
family: 06_belief_structure
cited_terms: ['mass_function_basic', 'nist80053_low_impact', 'syscall_equiv_in_subsystem']
model: engine-refine
---

Encoding establishes the character repertoire and byte-level representation for every datum entering a system, and the choice between encodings such as ASCII and Latin-1 carries direct consequences for interoperability and data fidelity. In the mass-function registry, identifiers FUNC-0001 through FUNC-0004 each carry an associated encoding designation—FUNC-0001 and FUNC-0004 are marked ASCII, while FUNC-0002 and FUNC-0003 carry Latin-1—reflecting the fact that the mass descriptors "Filter cake" and "Total solids" require only the basic 7-bit character set, whereas "Effluent mass" and "Target mass" may contain extended characters necessitating the broader Latin-1 repertoire. The method column further qualifies how each mass value is produced: FUNC-0001 and FUNC-0003 are classified as automated, while FUNC-0002 and FUNC-0004 are manual, a distinction that governs downstream validation, auditability, and the degree of human intervention required in the data lifecycle.

**t_mass_function_basic**

| id | mass | method | encoding |
| --- | --- | --- | --- |
| FUNC-0001 | Filter cake | automated | ascii |
| FUNC-0002 | Effluent mass | manual | latin1 |
| FUNC-0003 | Target mass | automated | latin1 |
| FUNC-0004 | Total solids | manual | ascii |
| FUNC-0005 | Effluent mass | hybrid | latin1 |
| FUNC-0006 | Feedstock mass | automated | latin1 |

Identifiers function as the immutable anchors of referential integrity, providing stable keys that survive changes to the attributes they tag. The NIST low-impact catalog employs identifiers IMPA-0001 through IMPA-0004 to bind each entry to its substantive content—IMPA-0001 maps to SP 800-171 Rev 2, IMPA-0002 to SP 800-37 Rev 2, IMPA-0003 to CSF 1.1, and IMPA-0004 to the RMF Guide—ensuring that any downstream reference, whether in a compliance matrix or an audit trail, resolves to a single, unambiguous standard. Similarly, the subsystem registry uses identifiers SUBS-0001 through SUBS-0004 to tag syscall entries (Syscall 01 through Syscall 04) and their corresponding subsystem associations (In Syscall Subsystem 01 through In Syscall Subsystem 04), creating a parallel namespace that remains stable even as the semantic content of those entries evolves.

**t_nist80053_low_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-171 Rev 2 |
| IMPA-0002 | SP 800-37 Rev 2 |
| IMPA-0003 | CSF 1.1 |
| IMPA-0004 | RMF Guide |
| IMPA-0005 | CSF 1.1 |
| IMPA-0006 | SP 800-218 |
| IMPA-0007 | SP 800-37 Rev 2 |
| IMPA-0008 | CSF 1.1 |

**t_nist80053_low_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | baseline |
| IMPA-0002 | category 1 |
| IMPA-0003 | minimal |
| IMPA-0004 | category 1 |
| IMPA-0005 | minimal |
| IMPA-0006 | minimal |
| IMPA-0007 | baseline |
| IMPA-0008 | low impact |

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

The impact-level dimension introduces a second axis of classification, decoupling the identification of a standard from its assigned security posture. IMPA-0001 and IMPA-0002 both resolve to category 1, IMPA-0003 to minimal, and IMPA-0004 to baseline, demonstrating that impact levels are not intrinsic to the standard itself but are instead contextual assignments that determine the rigor of controls, the scope of assessment, and the frequency of review. This separation of identity from classification is essential in governance frameworks where the same standard—SP 800-171 Rev 2, for instance—may be applied at different impact levels across distinct organizational units or system boundaries.

Subject, target, and role constitute the relational triad that binds discrete entities into a structured network of accountability and dependency. In the NIST junction table, IMPA-0001 appears as a subject linked to the target IMPA-0004 with the role of reviewer, while IMPA-0003 connects to IMPA-0006 as an observer; IMPA-0002 and IMPA-0001 both map to IMPA-0006, the latter under the role of contributor. These relationships encode not merely which standards reference which impact levels, but the nature of that linkage—who reviews, who observes, who contributes—transforming a flat catalog into a governed graph of compliance obligations. The subsystem junction table mirrors this pattern: SUBS-0003 assumes the role of reviewer against target SUBS-0007, SUBS-0005 is an observer against SUBS-0006, SUBS-0004 is the owner of SUBS-0007, and SUBS-0002 is an observer of SUBS-0006. The role column thus serves as the semantic glue that distinguishes a supervisory relationship from an ownership claim, each carrying distinct rights, responsibilities, and audit expectations.

**t_nist80053_low_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0001 | IMPA-0004 | reviewer |
| IMPA-0002 | IMPA-0003 | IMPA-0008 | observer |
| IMPA-0003 | IMPA-0002 | IMPA-0006 | observer |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0005 | IMPA-0007 | IMPA-0003 | owner |
| IMPA-0006 | IMPA-0001 | IMPA-0002 | reviewer |
| IMPA-0007 | IMPA-0007 | IMPA-0001 | contributor |
| IMPA-0008 | IMPA-0008 | IMPA-0008 | reviewer |

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |