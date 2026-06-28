CREATE TABLE t_claim_refuted_by_evidence (
  id VARCHAR(255),
  claim VARCHAR(255),
  refuted_by_evidence VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (refuted_by_evidence) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"claim_refuted_by_evidence"}'
