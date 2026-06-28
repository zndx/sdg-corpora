CREATE TABLE t_entity_type_belongs_to (
  id VARCHAR(255),
  entity VARCHAR(255),
  entity_type_belongs_to VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (entity_type_belongs_to) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"entity_type_belongs_to"}'
