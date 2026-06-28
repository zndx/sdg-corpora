CREATE TABLE t_lru_hash_map_subclass (
  id VARCHAR(255),
  lru VARCHAR(255),
  l_r_u_hash_config VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (l_r_u_hash_config) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"lru_hash_map_subclass"}'
