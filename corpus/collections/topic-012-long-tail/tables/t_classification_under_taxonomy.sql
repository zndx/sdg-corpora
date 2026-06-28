CREATE TABLE t_classification_under_taxonomy (
  id VARCHAR(255),
  classification VARCHAR(255),
  under_taxonomy VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  phase VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (under_taxonomy) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"classification_under_taxonomy"}'
