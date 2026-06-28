CREATE TABLE t_evidence_refutes_claim (
  id VARCHAR(255),
  evidence VARCHAR(255),
  refutes_claim VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (refutes_claim) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"evidence_refutes_claim"}'
