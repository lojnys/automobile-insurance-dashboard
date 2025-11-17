-- Report + Vehicle

INSERT INTO report (
	incident_id,
	authorities_contacted,
    police_report_available,
    fraud_reported
)
SELECT DISTINCT 
	i.incident_id,
    ic.authorities_contacted,
    ic.police_report_available,
    ic.fraud_reported
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

INSERT INTO vehicle (
	policy_id,
    auto_make,
    auto_model,
    auto_year
)
SELECT DISTINCT
	p.policy_id,
    ic.auto_make,
    ic.auto_model,
    ic.auto_year
FROM insurance.cleaned_insurance_claims ic
JOIN policy p
ON p.policy_number = ic.policy_number;