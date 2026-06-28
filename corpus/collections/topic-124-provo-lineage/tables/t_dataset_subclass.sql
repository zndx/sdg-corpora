CREATE TABLE t_dataset_subclass (
  id VARCHAR(255),
  dataset VARCHAR(255),
  column VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (column) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"dataset_subclass"}'
