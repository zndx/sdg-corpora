CREATE TABLE t_designative_with_naming_authority (
  id VARCHAR(255),
  designative VARCHAR(255),
  assigned_by VARCHAR(255) NOT NULL,
  checksum_algo VARCHAR(255),
  code VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (assigned_by) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"designative_with_naming_authority"}'
