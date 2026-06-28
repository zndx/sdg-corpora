CREATE TABLE t_allocation_with_input_facets (
  id VARCHAR(255),
  allocation VARCHAR(255),
  input_facet VARCHAR(255) NOT NULL,
  start_time TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_with_input_facets"}'
