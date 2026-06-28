CREATE TABLE t_artifact_not_revoked (
  id VARCHAR(255),
  artifact VARCHAR(255),
  artifact_2 VARCHAR(255),
  version INTEGER,
  tags VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"artifact_not_revoked"}'
