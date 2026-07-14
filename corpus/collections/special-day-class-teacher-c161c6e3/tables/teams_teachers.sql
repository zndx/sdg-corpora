CREATE TABLE teams_teachers (
  team_id VARCHAR(32) NOT NULL,
  special_day_class_teacher_id INTEGER NOT NULL,
  PRIMARY KEY (team_id, special_day_class_teacher_id),
  FOREIGN KEY (team_id) REFERENCES i_e_p_teams (team_id),
  FOREIGN KEY (special_day_class_teacher_id) REFERENCES special_day_class_teachers (special_day_class_teacher_id)
);
