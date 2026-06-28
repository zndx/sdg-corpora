CREATE TABLE t_evidence_with_source (
  id VARCHAR(255),
  evidence VARCHAR(255),
  evidence_source VARCHAR(255) NOT NULL,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (evidence_source) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"evidence_with_source"}'
