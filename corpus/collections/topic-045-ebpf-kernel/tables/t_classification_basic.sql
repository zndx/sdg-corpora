CREATE TABLE t_classification_basic (
  id VARCHAR(255),
  classification VARCHAR(255),
  phase VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":false,"template_id":"classification_basic"}'
