CREATE TABLE t_allocation_with_output_facets (
  id VARCHAR(255),
  allocation VARCHAR(255),
  output_facet VARCHAR(255) NOT NULL,
  host_name VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_with_output_facets"}'
