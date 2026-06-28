CREATE TABLE t_vehicle_equipment_specification (
  id VARCHAR(255),
  vehicle_equipment_specification VARCHAR(255),
  applies_to_vehicle_class VARCHAR(255) NOT NULL,
  mandates_component VARCHAR(255) NOT NULL,
  enforcement VARCHAR(255),
  mandatory BOOLEAN,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"08_derived","is_complex":true,"template_id":"vehicle_equipment_specification"}'
