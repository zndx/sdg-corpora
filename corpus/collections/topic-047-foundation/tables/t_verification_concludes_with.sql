CREATE TABLE t_verification_concludes_with (
  id VARCHAR(255),
  verification VARCHAR(255),
  concludes_with VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  host_name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (concludes_with) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_concludes_with"}'
