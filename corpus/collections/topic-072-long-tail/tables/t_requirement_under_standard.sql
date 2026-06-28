CREATE TABLE t_requirement_under_standard (
  id VARCHAR(255),
  requirement VARCHAR(255),
  under_standard VARCHAR(255) NOT NULL,
  priority INTEGER,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (under_standard) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_under_standard"}'
