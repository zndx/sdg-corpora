CREATE TABLE t_directive_not_obsolete (
  id VARCHAR(255),
  subject VARCHAR(255),
  subject_2 VARCHAR(255),
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"directive_not_obsolete"}'
