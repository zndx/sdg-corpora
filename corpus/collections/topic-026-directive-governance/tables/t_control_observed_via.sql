CREATE TABLE t_control_observed_via (
  id VARCHAR(255),
  control VARCHAR(255),
  observed_via VARCHAR(255) NOT NULL,
  effective_date DATE,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (observed_via) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_observed_via"}'
