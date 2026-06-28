CREATE TABLE t_primary_key_designation (
  id VARCHAR(255),
  primary VARCHAR(255),
  primary_key_of VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (primary_key_of) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"primary_key_designation"}'
