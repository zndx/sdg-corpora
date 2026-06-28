CREATE TABLE t_verification_targets_artifact (
  id VARCHAR(255),
  verification VARCHAR(255),
  targets_artifact VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (targets_artifact) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_targets_artifact"}'
