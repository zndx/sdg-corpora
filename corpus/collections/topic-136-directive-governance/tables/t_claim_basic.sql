CREATE TABLE t_claim_basic (
  id VARCHAR(255),
  claim VARCHAR(255),
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":false,"template_id":"claim_basic"}'
