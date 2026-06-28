CREATE TABLE t_identifier_subclass (
  id VARCHAR(255),
  identifier VARCHAR(255),
  identifies VARCHAR(255) NOT NULL,
  issued_date DATE,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (identifies) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"identifier_subclass"}'
