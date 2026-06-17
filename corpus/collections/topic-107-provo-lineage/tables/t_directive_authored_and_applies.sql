CREATE TABLE t_directive_authored_and_applies (
  id VARCHAR(255),
  subject VARCHAR(255),
  authored_by VARCHAR(255) NOT NULL,
  applies_to VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (authored_by) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":false,"template_id":"directive_authored_and_applies"}'
