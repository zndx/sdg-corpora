CREATE TABLE profiles_skills (
  candidate_profile_id INTEGER NOT NULL,
  professional_skill_id INTEGER NOT NULL,
  PRIMARY KEY (candidate_profile_id, professional_skill_id),
  FOREIGN KEY (candidate_profile_id) REFERENCES candidate_profiles (candidate_profile_id),
  FOREIGN KEY (professional_skill_id) REFERENCES professional_skills (id)
);
