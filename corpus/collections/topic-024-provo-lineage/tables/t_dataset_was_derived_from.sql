CREATE TABLE t_dataset_was_derived_from (
  id VARCHAR(255),
  dataset VARCHAR(255),
  was_derived_from VARCHAR(255) NOT NULL,
  version INTEGER,
  tags VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"dataset_was_derived_from"}'
