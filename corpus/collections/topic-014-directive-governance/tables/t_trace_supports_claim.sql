CREATE TABLE t_trace_supports_claim (
  id VARCHAR(255),
  trace VARCHAR(255),
  dimension_kind VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"trace_supports_claim"}'
