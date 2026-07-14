CREATE TABLE charges_roles (
  service_charge_id INTEGER NOT NULL,
  staff_role_id INTEGER NOT NULL,
  PRIMARY KEY (service_charge_id, staff_role_id),
  FOREIGN KEY (service_charge_id) REFERENCES service_charges (service_charge_id),
  FOREIGN KEY (staff_role_id) REFERENCES staff_roles (staff_role_id)
);
