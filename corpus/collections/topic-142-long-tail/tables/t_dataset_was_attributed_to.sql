CREATE TABLE t_dataset_was_attributed_to (
  id VARCHAR(255),
  dataset VARCHAR(255),
  was_attributed_to VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"dataset_was_attributed_to"}'
