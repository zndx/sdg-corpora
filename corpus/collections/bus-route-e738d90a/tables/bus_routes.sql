CREATE TABLE bus_routes (
  bus_route_id INTEGER NOT NULL,
  route_code VARCHAR(44),
  district VARCHAR(32),
  round_trip_fee DECIMAL,
  single_trip_fee DECIMAL,
  academic_year VARCHAR(32),
  status VARCHAR(32),
  school_campus_id INTEGER,
  bus_operator_license_number VARCHAR(32),
  PRIMARY KEY (bus_route_id),
  FOREIGN KEY (school_campus_id) REFERENCES school_campuses (school_campus_id),
  FOREIGN KEY (bus_operator_license_number) REFERENCES bus_operators (license_number)
);
