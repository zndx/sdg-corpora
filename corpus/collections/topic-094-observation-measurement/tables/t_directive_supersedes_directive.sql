CREATE TABLE t_directive_supersedes_directive (
  id VARCHAR(255),
  directive VARCHAR(255),
  mandatory BOOLEAN,
  scope VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"directive_supersedes_directive"}'
