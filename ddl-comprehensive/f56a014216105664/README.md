# Comprehensive relational lowering — `f56a014216105664`

kvasir's deterministic DDL over the CERTIFIED union (released catalog ∪ entity generations ∪ armed domains ∪ mapped-spec entities): schema-only (no row data), postgres-proven, FK constraints as a post-CREATE ALTER pass so it loads in one `psql -f ddl.sql`.

| file | role |
|---|---|
| `ddl.sql` | the loadable schema (see `just load-comprehensive`) |
| `plan.json` | kvasir's cited election record (class/property IRIs per table/junction/lookup) |
| `ontology_entity_associations.json` | the closure artifact — every relational entity → its ontological source (exact-IRI, generator-recorded) |
| `shapes.ttl` | SHACL Core constraint view |
| `certificate.json` | the HermiT verdict this release shipped under |
| `structure.json` | SchemaPile structure score |
| `sdg-ontology.omn` | the certified union the DDL was lowered from |
