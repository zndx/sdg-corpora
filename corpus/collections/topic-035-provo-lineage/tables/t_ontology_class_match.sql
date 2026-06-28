CREATE TABLE t_ontology_class_match (
  id VARCHAR(255),
  ontology VARCHAR(255),
  matches_ontology_class VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (matches_ontology_class) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"ontology_class_match"}'
