CREATE TABLE t_digital_media_service (
  id VARCHAR(255),
  digital_media_service VARCHAR(255),
  provides_function VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015","cco:InformationContentEntity"],"family":"08_derived","is_complex":false,"template_id":"digital_media_service"}'
