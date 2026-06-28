CREATE TABLE t_instrument_subclass (
  id VARCHAR(255),
  instrument VARCHAR(255),
  produces_measurement VARCHAR(255) NOT NULL,
  created_date DATE,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (produces_measurement) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"instrument_subclass"}'
