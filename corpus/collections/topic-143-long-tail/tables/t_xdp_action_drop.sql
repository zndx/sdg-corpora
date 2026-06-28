CREATE TABLE t_xdp_action_drop (
  id VARCHAR(255),
  xdp VARCHAR(255),
  x_d_p_action VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  mime_type VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (x_d_p_action) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"xdp_action_drop"}'
