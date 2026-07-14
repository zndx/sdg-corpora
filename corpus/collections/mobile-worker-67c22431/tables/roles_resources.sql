CREATE TABLE roles_resources (
  user_role_id INTEGER NOT NULL,
  business_resource_id INTEGER NOT NULL,
  PRIMARY KEY (user_role_id, business_resource_id),
  FOREIGN KEY (user_role_id) REFERENCES user_roles (id),
  FOREIGN KEY (business_resource_id) REFERENCES business_resources (id)
);
