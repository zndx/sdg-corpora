CREATE TABLE t_requirement_min_one_verification (
  id VARCHAR(255),
  subject VARCHAR(255),
  verified_by VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (verified_by) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_min_one_verification"}'
