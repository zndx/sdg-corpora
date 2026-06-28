CREATE TABLE t_intermediate_floor_assembly (
  id VARCHAR(255),
  intermediate_floor_assembly VARCHAR(255),
  contains_component VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000004","bfo:0000040"],"family":"08_derived","is_complex":true,"template_id":"intermediate_floor_assembly"}'
