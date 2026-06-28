CREATE TABLE t_dataset_at_version (
  id VARCHAR(255),
  dataset VARCHAR(255),
  at_dataset_version VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (at_dataset_version) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"dataset_at_version"}'
