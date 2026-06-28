CREATE TABLE t_provenance_agent_subclass (
  id VARCHAR(255),
  provenance VARCHAR(255),
  responsibility VARCHAR(255) NOT NULL,
  mime_type VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"provenance_agent_subclass"}'
