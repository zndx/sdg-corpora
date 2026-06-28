CREATE TABLE t_hipaa_safeguard_physical (
  id VARCHAR(255),
  hipaa VARCHAR(255),
  hipaa_safeguard VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (hipaa_safeguard) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"hipaa_safeguard_physical"}'
