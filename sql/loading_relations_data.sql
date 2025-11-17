-- Driver Vehicle Ownership + Driver Incident Participation + Claims Vehicle Involvement

INSERT INTO driver_vehicle_ownership (
	driver_id,
    vehicle_id
)
SELECT DISTINCT 
	p.driver_id,
    v.vehicle_id
FROM policy p
JOIN vehicle v
ON v.policy_id = p.policy_id;

INSERT INTO driver_incident_participation (
	driver_id,
    incident_id
)
SELECT DISTINCT
	p.driver_id,
    i.incident_id
FROM insurance.cleaned_insurance_claims ic
JOIN policy p
	ON p.policy_number = ic.policy_number
JOIN incident i
	ON i.incident_date = ic.incident_date
    AND i.incident_type = ic.incident_type
    AND i.collision_type = ic.collision_type
    AND i.severity = ic.incident_severity
    AND i.incident_hour_of_the_day = ic.incident_hour_of_the_day
    AND i.number_of_vehicles_involved = ic.number_of_vehicles_involved
    ANd i.property_damage = ic.property_damage
    AND i.bodily_injuries = ic.bodily_injuries
    ANd i.witnesses = ic.witnesses;
    
INSERT INTO claims_vehicle_involvement (
	claims_id,
    vehicle_id
)
SELECT DISTINCT 
	c.claims_id,
    v.vehicle_id
FROM insurance.cleaned_insurance_claims ic
JOIN claims c
	ON c.injury_claim = ic.injury_claim
	AND c.property_claim = ic.property_claim
	AND c.vehicle_claim = ic.vehicle_claim
JOIN vehicle v
	ON v.auto_make = ic.auto_make
    AND v.auto_model = ic.auto_model
    AND v.auto_year = ic.auto_year;
