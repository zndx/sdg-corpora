CREATE TABLE t_descriptive_either_evidence_or_claim (
  id VARCHAR(255),
  descriptive VARCHAR(255),
  descriptive_2 VARCHAR(255),
  descriptive_3 VARCHAR(255),
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"descriptive_either_evidence_or_claim"}'
