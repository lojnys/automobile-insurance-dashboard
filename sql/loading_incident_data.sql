-- Incident + Incident Location + Claims

INSERT INTO incident (
	incident_date,
    incident_type,
    collision_type,
    severity,
    incident_hour_of_the_day,
    number_of_vehicles_involved,
    property_damage,
    bodily_injuries,
    witnesses
)
SELECT DISTINCT 
	ic.incident_date,
    ic.incident_type,
    ic.collision_type,
    ic.incident_severity,
    ic.incident_hour_of_the_day,
    ic.number_of_vehicles_involved,
    ic.property_damage,
    ic.bodily_injuries,
    ic.witnesses
FROM insurance.cleaned_insurance_claims ic;

INSERT INTO incident_location (
	incident_id,
    incident_state,
    incident_city,
    incident_house_number,
    incident_street_name
)
SELECT DISTINCT
	i.incident_id,
	ic.incident_state,
    ic.incident_city,
    ic.incident_house_number,
    ic.incident_street_name
FROM insurance.cleaned_insurance_claims ic
JOIN incident i
ON i.incident_date = ic.incident_date
AND i.incident_type = ic.incident_type
AND i.collision_type = ic.collision_type
AND i.severity = ic.incident_severity
AND i.incident_hour_of_the_day = ic.incident_hour_of_the_day
AND i.number_of_vehicles_involved = ic.number_of_vehicles_involved
AND i.property_damage = ic.property_damage
AND i.bodily_injuries = ic.bodily_injuries
AND i.witnesses = ic.witnesses;

INSERT INTO claims (
	injury_claim,
    property_claim,
    vehicle_claim
)
SELECT DISTINCT
	ic.injury_claim,
    ic.property_claim,
    ic.vehicle_claim
FROM insurance.cleaned_insurance_claims ic;