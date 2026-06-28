CREATE TABLE t_provenance_agent_signs_audit (
  id VARCHAR(255),
  provenance VARCHAR(255),
  log_level VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"provenance_agent_signs_audit"}'
