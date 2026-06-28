CREATE TABLE t_soc2_trust_criterion (
  id VARCHAR(255),
  soc VARCHAR(255),
  soc2_trust_criterion VARCHAR(255) NOT NULL,
  scope VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (soc2_trust_criterion) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"soc2_trust_criterion"}'
