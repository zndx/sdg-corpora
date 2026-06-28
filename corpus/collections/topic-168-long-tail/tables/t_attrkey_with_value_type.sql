CREATE TABLE t_attrkey_with_value_type (
  id VARCHAR(255),
  attrkey VARCHAR(255),
  value_type VARCHAR(255) NOT NULL,
  checksum_algo VARCHAR(255),
  code VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (value_type) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"attrkey_with_value_type"}'
