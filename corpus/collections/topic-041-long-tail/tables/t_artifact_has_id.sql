CREATE TABLE t_artifact_has_id (
  id VARCHAR(255),
  artifact VARCHAR(255),
  identifier VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"artifact_has_id"}'
