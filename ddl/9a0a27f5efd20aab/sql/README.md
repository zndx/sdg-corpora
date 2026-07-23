# Loadable SQL — spine run `9a0a27f5efd20aab`

Derived from the parquet dataset of record in this directory (one flavor per
subdirectory — self-contained; load the files in numeric order):

| flavor | tables | rows | views |
|---|---|---|---|
| postgres | 520 | 3167 | 517 |
| trino | 520 | 3167 | 517 |
| spark | 520 | 3167 | 517 |

```sh
# PostgreSQL (see also `just load-postgres` at the repo root)
psql "$CONN" -v ON_ERROR_STOP=1 \
  -f postgres/00_schema.sql -f postgres/01_data.sql -f postgres/02_views.sql
```

postgres DDL is transpiled from the trino source by polyglot_sql; each table's
template/BFO provenance ships as `COMMENT ON TABLE` (query it via
`obj_description('<table>'::regclass)`). trino is the native `ddl_text`; spark is
the Iceberg flavor (`ddl_iceberg`). Ontology↔table associations:
`../ontology_entity_associations.json`.
