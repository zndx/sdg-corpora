CREATE TABLE teams_sites (
  clinical_engineering_team_id INTEGER NOT NULL,
  clinical_site_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_engineering_team_id, clinical_site_id),
  FOREIGN KEY (clinical_engineering_team_id) REFERENCES clinical_engineering_teams (clinical_engineering_team_id),
  FOREIGN KEY (clinical_site_id) REFERENCES clinical_sites (clinical_site_id)
);
