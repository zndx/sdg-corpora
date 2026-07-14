CREATE TABLE DoctoralCollegeDoctoralSchool (
  collegeId INTEGER NOT NULL,
  schoolId INTEGER NOT NULL,
  PRIMARY KEY (collegeId, schoolId),
  FOREIGN KEY (collegeId) REFERENCES DoctoralCollege (id),
  FOREIGN KEY (schoolId) REFERENCES DoctoralSchool (id)
);
