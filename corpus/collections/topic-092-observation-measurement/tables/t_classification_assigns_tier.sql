CREATE TABLE t_classification_assigns_tier (
  id VARCHAR(255),
  classification VARCHAR(255),
  assigns_tier VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  retry_count INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (assigns_tier) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"classification_assigns_tier"}'
