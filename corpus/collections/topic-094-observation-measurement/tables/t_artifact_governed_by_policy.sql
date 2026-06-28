CREATE TABLE t_artifact_governed_by_policy (
  id VARCHAR(255),
  artifact VARCHAR(255),
  size_bytes BIGINT,
  version INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"artifact_governed_by_policy"}'
