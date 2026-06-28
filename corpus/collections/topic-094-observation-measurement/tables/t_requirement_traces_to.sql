CREATE TABLE t_requirement_traces_to (
  id VARCHAR(255),
  requirement VARCHAR(255),
  traces_to VARCHAR(255) NOT NULL,
  enforcement VARCHAR(255),
  priority INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (traces_to) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_traces_to"}'
