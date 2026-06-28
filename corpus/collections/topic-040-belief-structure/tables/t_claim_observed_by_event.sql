CREATE TABLE t_claim_observed_by_event (
  id VARCHAR(255),
  claim VARCHAR(255),
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"claim_observed_by_event"}'
