-- ==== 0) Create database & switch to it
CREATE DATABASE IF NOT EXISTS auto_insurance;

USE auto_insurance;

-- ==== 1) DRIVER
-- One row per insured person.
CREATE TABLE driver (
	driver_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  
	months_as_customer BIGINT,
	zip_code            INT NOT NULL,
	sex            	  VARCHAR(20),
	education_level     VARCHAR(100),
	occupation          VARCHAR(100),
	hobbies             VARCHAR(100),
	relationship        VARCHAR(50),
	age                 SMALLINT
) ENGINE=InnoDB;

CREATE TABLE driver_income (
	driver_income_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	capital_gains BIGINT,
    capital_loss BIGINT,
    driver_id BIGINT NOT NULL,
    
    CONSTRAINT fk_income_driver
		FOREIGN KEY (driver_id)
        REFERENCES driver(driver_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ==== 2) POLICY
-- One row per policy; links to the policyholder who owns it.
CREATE TABLE policy (
  policy_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  driver_id BIGINT NOT NULL,
  
  policy_number       INT NOT NULL UNIQUE,
  bind_date    		  DATE,
  state        		  VARCHAR(50),

  UNIQUE KEY uq_policy_number (policy_number),
  CONSTRAINT fk_driver
    FOREIGN KEY (driver_id)
    REFERENCES driver(driver_id)
    ON UPDATE CASCADE 
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE policy_premium (
	policy_premium_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    annual_premium DECIMAL(12,2),
    policy_id BIGINT NOT NULL,
    
    CONSTRAINT fk_premium_policy
		FOREIGN KEY (policy_id)
        REFERENCES policy(policy_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE policy_coverage (
	policy_coverage_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    bi_per_person BIGINT,
    bi_per_accident BIGINT,
    umbrella_limit DECIMAL(12,2),
    deductible BIGINT,
    policy_id BIGINT NOT NULL,
    
    CONSTRAINT fk_coverage_policy
		FOREIGN KEY (policy_id)
        REFERENCES policy(policy_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ==== 3) VEHICLE
-- One row per vehicle (per policy). If a policy can have multiple vehicles, keep a row per vehicle.
CREATE TABLE vehicle (
  vehicle_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  policy_id  BIGINT NOT NULL,
  
  auto_make  VARCHAR(100) NOT NULL,
  auto_model VARCHAR(100) NOT NULL,
  auto_year  INT NOT NULL, 

  CONSTRAINT fk_vehicle_policy
    FOREIGN KEY (policy_id)
    REFERENCES policy(policy_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ==== 4) INCIDENT (FACT-like table)
-- One row per incident/claim; references policy and (optionally) the involved vehicle.
CREATE TABLE incident (
  incident_id BIGINT AUTO_INCREMENT PRIMARY KEY,

  incident_date               DATE NOT NULL,
  incident_type               VARCHAR(100),
  collision_type              VARCHAR(100),
  severity           		  VARCHAR(100), 
  incident_hour_of_the_day    SMALLINT,
  number_of_vehicles_involved SMALLINT,
  property_damage			  VARCHAR(10),
  bodily_injuries             SMALLINT,
  witnesses                   SMALLINT,
  injury_claim                DECIMAL(12,2),
  property_claim              DECIMAL(12,2),
  vehicle_claim               DECIMAL(12,2)
) ENGINE=InnoDB;

CREATE TABLE incident_location (
	incident_location_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    incident_state VARCHAR(10),
    incident_city VARCHAR(30),
    incident_house_number VARCHAR(20),
    incident_street_name VARCHAR(20),
    incident_id BIGINT NOT NULL,
    
    CONSTRAINT fk_location_incident
		FOREIGN KEY (incident_id)
        REFERENCES incident(incident_id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE claims (
	claims_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    injury_claim DECIMAL(12,2),
    property_claim DECIMAL(12,2),
    vehicle_claim DECIMAL(12,2)
) ENGINE=InnoDB;

CREATE TABLE report (
	report_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    incident_id BIGINT NOT NULL,
    
    authorities_contacted 	 VARCHAR(50),
    police_report_available  VARCHAR(10),
    fraud_reported 			 CHAR(1),
    
    KEY ix_report_incident (incident_id),
    
    CONSTRAINT fk_report_incident
		FOREIGN KEY (incident_id)
        REFERENCES incident(incident_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE driver_vehicle_ownership (
	driver_vehicle_ownership_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    driver_id BIGINT NOT NULL,
    vehicle_id BIGINT NOT NULL,
    
    CONSTRAINT fk_dvo_driver
		FOREIGN KEY (driver_id)
        REFERENCES driver(driver_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_dvo_vehicle
		FOREIGN KEY (vehicle_id)
        REFERENCES vehicle(vehicle_id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE claims_vehicle_involvement (
	claims_vehicle_involvement_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    claims_id BIGINT NOT NULL,
    vehicle_id BIGINT NOT NULL,
    
    CONSTRAINT fk_cvi_claims
		FOREIGN KEY (claims_id)
        REFERENCES claims(claims_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_cvi_vehicle
		FOREIGN KEY (vehicle_id)
        REFERENCES vehicle(vehicle_id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE driver_incident_participation (
	driver_incident_participation_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    driver_id BIGINT NOT NULL,
    incident_id BIGINT NOT NULL,
    
    CONSTRAINT fk_dip_driver
		FOREIGN KEY (driver_id)
        REFERENCES driver(driver_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_dip_incident
		FOREIGN KEY (incident_id)
        REFERENCES incident(incident_id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

