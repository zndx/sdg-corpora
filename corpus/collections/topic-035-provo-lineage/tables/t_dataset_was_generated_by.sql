CREATE TABLE t_dataset_was_generated_by (
  id VARCHAR(255),
  dataset VARCHAR(255),
  was_generated_by VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"dataset_was_generated_by"}'
