CREATE TABLE operators_routes (
  bus_operator_license_number VARCHAR(32) NOT NULL,
  bus_route_id INTEGER NOT NULL,
  PRIMARY KEY (bus_operator_license_number, bus_route_id),
  FOREIGN KEY (bus_operator_license_number) REFERENCES bus_operators (license_number),
  FOREIGN KEY (bus_route_id) REFERENCES bus_routes (bus_route_id)
);
