CREATE TABLE t_school_security_policy (
  id VARCHAR(255),
  school_security_policy VARCHAR(255),
  targets VARCHAR(255) NOT NULL,
  must_satisfy VARCHAR(255) NOT NULL,
  priority INTEGER,
  scope VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"08_derived","is_complex":true,"template_id":"school_security_policy"}'
