CREATE TABLE t_schema_version_subclass (
  id VARCHAR(255),
  schema VARCHAR(255),
  schema_version VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (schema_version) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schema_version_subclass"}'
