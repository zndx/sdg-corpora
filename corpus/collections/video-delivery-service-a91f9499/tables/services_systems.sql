CREATE TABLE services_systems (
  service_id VARCHAR(44) NOT NULL,
  d_r_m_system_drm_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (service_id, d_r_m_system_drm_id),
  FOREIGN KEY (service_id) REFERENCES video_delivery_services (service_id),
  FOREIGN KEY (d_r_m_system_drm_id) REFERENCES d_r_m_systems (drm_id)
);
