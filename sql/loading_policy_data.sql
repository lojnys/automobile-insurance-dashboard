-- Policy + Coverage + Premium

INSERT INTO policy (
	policy_number,
    bind_date,
    state,
    driver_id
)
SELECT DISTINCT
	ic.policy_number,
    ic.policy_bind_date,
    ic.policy_state,
    d.driver_id
FROM insurance.cleaned_insurance_claims ic
JOIN driver d
  ON d.zip_code        = ic.insured_zip
 AND d.sex             = ic.insured_sex
 AND d.education_level = ic.insured_education_level
 AND d.occupation      = ic.insured_occupation
 AND d.hobbies 		   = ic.insured_hobbies
 AND d.age             = ic.age;

INSERT INTO policy_coverage (
	bi_per_person,
    bi_per_accident,
    umbrella_limit,
    deductable,
    policy_id
)
SELECT DISTINCT
	ic.bi_per_person,
    ic.bi_per_accident,
    ic.umbrella_limit,
    ic.policy_deductable,
    p.policy_id
FROM insurance.cleaned_insurance_claims ic
JOIN policy p
ON p.policy_number = ic.policy_number;

INSERT INTO policy_premium (
	annual_premium,
    policy_id
)
SELECT distinct
	ic.policy_annual_premium,
    p.policy_id
FROM insurance.cleaned_insurance_claims ic
JOIN policy p
ON p.policy_number = ic.policy_number;