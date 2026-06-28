CREATE TABLE t_verification_subclass (
  id VARCHAR(255),
  verification VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  phase VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_subclass"}'
