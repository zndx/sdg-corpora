CREATE TABLE t_lane_compliance_behavior (
  id VARCHAR(255),
  lane_compliance_behavior VARCHAR(255),
  involves_operator VARCHAR(255) NOT NULL,
  occurs_on_street_type VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"lane_compliance_behavior"}'
