# Collection — topic 103 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **7 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): 9716 with the petition that is the subject of this notice on public display at the Dockets Management Staff (see ADDRESSES) for public review and comment. We will also place on public display, in the Dockets Management Staff and at https://www.regulations.gov, any amendments to, or comments on, the petitioner's environmental assessment without further announcement in the Federal Register. If, ba.. …

## Chapters

- [Chapter 4: Ontological Foundations for Process Traceability and Observability](chapters/04ee71b417ec1b90.md)
- [Chapter 4: Operational Traceability and Status Monitoring in Industrial Control Systems](chapters/05e4d9210df083a9.md)
- [Chapter 4: Formal Ontology of Service Tracing and Measurement in Distributed Control Systems](chapters/210c3becacd1e57b.md)
- [Chapter 4: Ontological Formalization of Process Traces and Service States in Industrial Control Systems](chapters/546eeaa480107e29.md)
- [Chapter 4: Distributed Tracing Ontology and Compliance Metrics](chapters/9474731fb833459e.md)
- [Chapter 7: Ontological Frameworks for Distributed System Observability](chapters/d07ee3b83be79019.md)
- [Chapter 7: Ontological Mapping for Process Traceability and Metrological Compliance](chapters/d6301d8d3d86af6b.md)

## Ontology terms grounding this collection

- `measurement_equiv_with_dim_unit` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasDimension some {Y:Class}) and (sdg:hasUnit some {Z:Class})
- `span_with_parent` — {X} is a process that has parent span {Y}
- `span_with_status` — {X} is a process that has span status {Y}
- `trace_in_service` — {X} is a process that in service {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_measurement_equiv_with_dim_unit`](tables/t_measurement_equiv_with_dim_unit.sql) — realizes `measurement_equiv_with_dim_unit`
- [`t_span_with_parent`](tables/t_span_with_parent.sql) — realizes `span_with_parent`
- [`t_span_with_status`](tables/t_span_with_status.sql) — realizes `span_with_status`
- [`t_trace_in_service`](tables/t_trace_in_service.sql) — realizes `trace_in_service`
