CREATE TABLE teachers_teams (
  special_day_class_teacher_id INTEGER NOT NULL,
  team_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (special_day_class_teacher_id, team_id),
  FOREIGN KEY (special_day_class_teacher_id) REFERENCES special_day_class_teachers (special_day_class_teacher_id),
  FOREIGN KEY (team_id) REFERENCES i_e_p_teams (team_id)
);
