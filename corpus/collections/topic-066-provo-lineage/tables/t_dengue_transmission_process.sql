CREATE TABLE t_dengue_transmission_process (
  id VARCHAR(255),
  dengue_transmission_process VARCHAR(255),
  involves_host VARCHAR(255) NOT NULL,
  involves_vector VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"dengue_transmission_process"}'
