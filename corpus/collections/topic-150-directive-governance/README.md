# Collection — topic 150 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **3 chapters** · **1 topics** (target + style) · **8 ontology terms** · **8 underlying tables**.

> **Topic gist** (representative FinePDFs text): Special Education: Nonpublic School and Nonpublic Agency Study Final Report Thomas Parrish, Project Director Gina Chen Heather Shaw September 30, 1998 Submitted to: Office of the Legislative Analyst 925 L Street, Suite 1000 Sacramento, CA 95814 California Department of Education Special Education Division 515 L Street, Suite 270 Sacramento, CA 95814 California Department of Finance 915 L Str... …

## Chapters

- [ch_live_mental_health_education_program_35c5f3](chapters/ch_live_mental_health_education_program_35c5f3.md)
- [ch_live_mental_health_education_program_8ae60c](chapters/ch_live_mental_health_education_program_8ae60c.md)
- [ch_live_young_adult_speaker_role_176ca5](chapters/ch_live_young_adult_speaker_role_176ca5.md)

## Ontology terms grounding this collection

- `bpf_helper_called_by` — {X} is an artifact that called by program {Y}
- `mental_health_education_program` — A MentalHealthEducationProgram is an Occurrent that hasDeliveredPresentation some EducationalPresentation and targetsDem
- `nist80053_low_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `policy_applies_to` — {X} is a directive information content entity that applies to {Y}
- `profiling_produces_profile` — {X} is a process that produces {Y}
- `soc2_availability_subclass` — {X} is a directive information content entity that for soc2 domain {Y}
- `student_privacy_expectation` — StudentPrivacyExpectation is a DescriptiveICE that appliesTo some ProtectedLocation.
- `young_adult_speaker_role` — A YoungAdultSpeakerRole is a Role that hasQualifyingIndividual exactly 1 YoungAdultIndividual and deliversPresentation s

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_bpf_helper_called_by`](tables/t_bpf_helper_called_by.sql) — realizes `bpf_helper_called_by` · _shared with 7 other collection(s)_
- [`t_mental_health_education_program`](tables/t_mental_health_education_program.sql) — realizes `mental_health_education_program` · _shared with 9 other collection(s)_
- [`t_nist80053_low_impact`](tables/t_nist80053_low_impact.sql) — realizes `nist80053_low_impact` · _shared with 6 other collection(s)_
- [`t_policy_applies_to`](tables/t_policy_applies_to.sql) — realizes `policy_applies_to` · _shared with 7 other collection(s)_
- [`t_profiling_produces_profile`](tables/t_profiling_produces_profile.sql) — realizes `profiling_produces_profile` · _shared with 8 other collection(s)_
- [`t_soc2_availability_subclass`](tables/t_soc2_availability_subclass.sql) — realizes `soc2_availability_subclass` · _shared with 9 other collection(s)_
- [`t_student_privacy_expectation`](tables/t_student_privacy_expectation.sql) — realizes `student_privacy_expectation` · _shared with 10 other collection(s)_
- [`t_young_adult_speaker_role`](tables/t_young_adult_speaker_role.sql) — realizes `young_adult_speaker_role` · _shared with 6 other collection(s)_
