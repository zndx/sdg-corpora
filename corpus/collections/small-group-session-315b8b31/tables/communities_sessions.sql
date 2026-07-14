CREATE TABLE communities_sessions (
  grow_group_community_id INTEGER NOT NULL,
  small_group_session_id INTEGER NOT NULL,
  PRIMARY KEY (grow_group_community_id, small_group_session_id),
  FOREIGN KEY (grow_group_community_id) REFERENCES grow_group_communities (grow_group_community_id),
  FOREIGN KEY (small_group_session_id) REFERENCES small_group_sessions (small_group_session_id)
);
