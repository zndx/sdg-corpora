CREATE TABLE t_designative_for_specific_role (
  id VARCHAR(255),
  designative VARCHAR(255),
  identifies VARCHAR(255) NOT NULL,
  code VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (identifies) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":false,"template_id":"designative_for_specific_role"}'
