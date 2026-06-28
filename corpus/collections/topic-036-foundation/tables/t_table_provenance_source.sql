CREATE TABLE t_table_provenance_source (
  id VARCHAR(255),
  table VARCHAR(255),
  sourced_from_table VARCHAR(255) NOT NULL,
  value DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (sourced_from_table) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"table_provenance_source"}'
