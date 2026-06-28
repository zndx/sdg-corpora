CREATE TABLE t_claim_governed_by_directive (
  id VARCHAR(255),
  claim VARCHAR(255),
  recorded_at TIMESTAMP,
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"claim_governed_by_directive"}'
