CREATE TABLE t_measurement_equiv_with_dim_unit (
  id VARCHAR(255),
  subject VARCHAR(255),
  dimension VARCHAR(255) NOT NULL,
  unit VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  value DECIMAL(38,9),
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (dimension) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":false,"template_id":"measurement_equiv_with_dim_unit"}'
