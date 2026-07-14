CREATE TABLE campuses_routes (
  school_campus_id INTEGER NOT NULL,
  bus_route_id INTEGER NOT NULL,
  PRIMARY KEY (school_campus_id, bus_route_id),
  FOREIGN KEY (school_campus_id) REFERENCES school_campuses (school_campus_id),
  FOREIGN KEY (bus_route_id) REFERENCES bus_routes (bus_route_id)
);
