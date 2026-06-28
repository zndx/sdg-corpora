CREATE TABLE t_directory_query_service (
  id VARCHAR(255),
  directory_query_service VARCHAR(255),
  targets_user VARCHAR(255) NOT NULL,
  generates_response VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"directory_query_service"}'
