CREATE TABLE t_control_under_framework (
  id VARCHAR(255),
  control VARCHAR(255),
  under_framework VARCHAR(255) NOT NULL,
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (under_framework) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_under_framework"}'
