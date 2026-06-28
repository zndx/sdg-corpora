CREATE TABLE t_verification_traces_requirement (
  id VARCHAR(255),
  verification VARCHAR(255),
  end_time TIMESTAMP,
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_traces_requirement"}'
