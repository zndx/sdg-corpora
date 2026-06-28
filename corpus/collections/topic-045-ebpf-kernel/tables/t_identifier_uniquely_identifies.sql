CREATE TABLE t_identifier_uniquely_identifies (
  id VARCHAR(255),
  identifier VARCHAR(255),
  identifies VARCHAR(255),
  format VARCHAR(255),
  issued_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (identifies) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"identifier_uniquely_identifies"}'
