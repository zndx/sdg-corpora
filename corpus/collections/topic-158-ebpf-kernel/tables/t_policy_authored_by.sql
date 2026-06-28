CREATE TABLE t_policy_authored_by (
  id VARCHAR(255),
  policy VARCHAR(255),
  authored_by VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (authored_by) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"policy_authored_by"}'
