CREATE TABLE t_iso27001_annexa_subclass (
  id VARCHAR(255),
  iso VARCHAR(255),
  iso27001_annex_a VARCHAR(255) NOT NULL,
  effective_date DATE,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (iso27001_annex_a) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"iso27001_annexa_subclass"}'
