CREATE TABLE t_claim_not_disconfirmed (
  id VARCHAR(255),
  claim VARCHAR(255),
  claim_2 VARCHAR(255),
  dimension_kind VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"claim_not_disconfirmed"}'
