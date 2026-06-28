CREATE TABLE t_social_networking_service_usage (
  id VARCHAR(255),
  social_networking_service_usage VARCHAR(255),
  involves_participant VARCHAR(255) NOT NULL,
  utilizes_service VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"social_networking_service_usage"}'
