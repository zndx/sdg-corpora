CREATE TABLE t_directive_traces_to_requirement (
  id VARCHAR(255),
  directive VARCHAR(255),
  review_cycle_days INTEGER,
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"directive_traces_to_requirement"}'
