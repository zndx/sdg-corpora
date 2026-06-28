CREATE TABLE t_dataset_with_record_count (
  id VARCHAR(255),
  dataset VARCHAR(255),
  record VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (record) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"dataset_with_record_count"}'
