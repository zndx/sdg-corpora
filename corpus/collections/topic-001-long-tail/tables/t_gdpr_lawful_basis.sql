CREATE TABLE t_gdpr_lawful_basis (
  id VARCHAR(255),
  gdpr VARCHAR(255),
  lawful_basis VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (lawful_basis) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"gdpr_lawful_basis"}'
