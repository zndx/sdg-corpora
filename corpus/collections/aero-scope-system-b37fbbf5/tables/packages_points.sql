CREATE TABLE packages_points (
  data_package_id INTEGER NOT NULL,
  flight_path_point_id INTEGER NOT NULL,
  PRIMARY KEY (data_package_id, flight_path_point_id),
  FOREIGN KEY (data_package_id) REFERENCES data_packages (id),
  FOREIGN KEY (flight_path_point_id) REFERENCES flight_path_points (id)
);
