CREATE TABLE t_ice_with_existential (
  id VARCHAR(255),
  ice VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"01_foundation","is_complex":true,"template_id":"ice_with_existential"}'
