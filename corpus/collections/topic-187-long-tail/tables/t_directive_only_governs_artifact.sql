CREATE TABLE t_directive_only_governs_artifact (
  id VARCHAR(255),
  directive VARCHAR(255),
  governs VARCHAR(255),
  mandatory BOOLEAN,
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (governs) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"directive_only_governs_artifact"}'
