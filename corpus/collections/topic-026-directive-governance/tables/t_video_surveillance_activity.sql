CREATE TABLE t_video_surveillance_activity (
  id VARCHAR(255),
  video_surveillance_activity VARCHAR(255),
  monitors VARCHAR(255) NOT NULL,
  employs_device VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"video_surveillance_activity"}'
