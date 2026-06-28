CREATE TABLE t_schema_revision_of (
  id VARCHAR(255),
  schema VARCHAR(255),
  schema_revision_of VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (schema_revision_of) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schema_revision_of"}'
