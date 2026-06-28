CREATE TABLE t_verification_with_method (
  id VARCHAR(255),
  verification VARCHAR(255),
  via_verification_method VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  exit_code INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (via_verification_method) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_with_method"}'
