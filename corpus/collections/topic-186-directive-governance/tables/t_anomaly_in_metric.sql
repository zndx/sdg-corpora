CREATE TABLE t_anomaly_in_metric (
  id VARCHAR(255),
  anomaly VARCHAR(255),
  anomaly_in_metric VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (anomaly_in_metric) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"anomaly_in_metric"}'
