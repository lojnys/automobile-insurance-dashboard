-- Driver + Driver Income

INSERT INTO driver (
	months_as_customer,
    zip_code,
    sex,
    education_level,
    occupation,
    hobbies,
    relationship,
    age
)
SELECT DISTINCT
	ic.months_as_customer,
    ic.insured_zip,
    ic.insured_sex,
    ic.insured_education_level,
    ic.insured_occupation,
    ic.insured_hobbies,
    ic.insured_relationship,
    ic.age
FROM insurance.cleaned_insurance_claims ic;

INSERT INTO driver_income (
	capital_gains,
    capital_loss,
    driver_id
)
SELECT DISTINCT
	ic.capital_gains,
    ic.capital_gains,
	driver_id
FROM insurance.cleaned_insurance_claims ic
JOIN driver d
ON d.months_as_customer = ic.months_as_customer
AND d.zip_code = ic.insured_zip
AND d.sex = ic.insured_sex
AND d.education_level = ic.insured_education_level
AND d.occupation = ic.insured_occupation
AND d.hobbies = ic.insured_hobbies
AND d.relationship = ic.insured_relationship
AND d.age = ic.age;