CREATE TABLE t_evidence_subclass (
  id VARCHAR(255),
  evidence VARCHAR(255),
  supports_claim VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (supports_claim) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"evidence_subclass"}'
