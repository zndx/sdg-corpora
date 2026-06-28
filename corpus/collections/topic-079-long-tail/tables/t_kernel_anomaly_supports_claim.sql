CREATE TABLE t_kernel_anomaly_supports_claim (
  id VARCHAR(255),
  kernel VARCHAR(255),
  recorded_at TIMESTAMP,
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"kernel_anomaly_supports_claim"}'
