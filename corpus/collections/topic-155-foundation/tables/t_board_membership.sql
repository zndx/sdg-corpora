CREATE TABLE t_board_membership (
  id VARCHAR(255),
  board_membership VARCHAR(255),
  has_participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"board_membership"}'
