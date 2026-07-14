CREATE TABLE RestaurantStaff (
  id INTEGER NOT NULL,
  staffId INTEGER,
  staffName VARCHAR(32),
  roleType VARCHAR(32),
  shiftStart TIMESTAMP,
  shiftEnd TIMESTAMP,
  receivesServiceChargeShare BOOLEAN,
  outletId INTEGER,
  courseId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (outletId) REFERENCES RestaurantOutlet (id),
  FOREIGN KEY (courseId) REFERENCES MenuCourse (id)
);
