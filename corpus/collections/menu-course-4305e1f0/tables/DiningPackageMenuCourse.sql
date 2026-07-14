CREATE TABLE DiningPackageMenuCourse (
  packageId INTEGER NOT NULL,
  courseId INTEGER NOT NULL,
  PRIMARY KEY (packageId, courseId),
  FOREIGN KEY (packageId) REFERENCES DiningPackage (id),
  FOREIGN KEY (courseId) REFERENCES MenuCourse (id)
);
