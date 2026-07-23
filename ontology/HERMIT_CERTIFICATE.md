# HermiT consistency certificate — `sdg-ontology`

- **isConsistent**: `True`
- **named classes**: 893
- **unsatisfiable classes**: 0
- **domain-narrowed**: 40 class(es) shed as unsatisfiable vs the theory — justifications recorded in `build/realize_signals.json` (the re-authoring signal)
- **realized from**: the 520 FinePDFs-derived templates (`catalog.json`)
- **rigor (Phase A)**: 160 filler classes BFO-grounded · 748 classes carry NL definitions (iao:0000115) · 148 typed DataProperty assertions
- **individuals**: 10475 membrane-admitted (ABox included) — instance-level consistency certified by DECOMPOSITION: nominal-free TBox + Types-only ABox ⇒ KB consistent ⟺ TBox consistent ∧ every asserted type-conjunction satisfiable (each conjunction checked by HermiT; 24 withheld as clashing)
- **reasoner**: HermiT (OWLAPI, via DeepOnto)
- **grounding**: BFO 2020 (incl. continuant ⊥ occurrent) + CCO upper
- **generated**: 2026-07-23 by `scripts/build_realized_ontology.py`

This is the **realized** ontology — the templates instantiated into concrete OWL axioms, not the
`{slot:Type}` skeletons in `catalog/`. Re-verify by loading `sdg-ontology.omn` (or `.owl`) in any
OWL reasoner (Protégé/HermiT, ROBOT, owlready2) and checking consistency.
