CREATE TABLE marriage_prayer_focuses (
  id INTEGER NOT NULL,
  focus_id VARCHAR(44),
  focus_month VARCHAR(32),
  primary_intention VARCHAR(32),
  target_group VARCHAR(32),
  community_goal VARCHAR(32),
  financial_support_record_id INTEGER,
  grow_group_community_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_support_record_id) REFERENCES financial_support_records (id),
  FOREIGN KEY (grow_group_community_id) REFERENCES grow_group_communities (grow_group_community_id)
);
