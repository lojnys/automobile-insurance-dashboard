# Automobile Insurance Dashboard

## Table of Contents

## Overview
This project builds an end-to-end automobile insurance data analysis using a MySQL database hosted on AWS EC2 and an interactive Tableau dashboard.
Starting from a raw CSV file, the projects includes cleaning and transforming the dataset and then normalize it into a relational schema, implementing primary/foreign key constraints, and expose the data for analysis via Web Data Connector. 
The goal of this projet is to showcase practical skills in SQL schema design, data cleaning and transformation, and business-oriented dashboarding for an insurance context. It is designed to be a compact but realistic example of how raw operational data can be turned into a structured database and visual analytics tool that underwriters, actuaries, or analysts could use in practice.

## Tech Stack
- Python
- MySQL
- AWS (EC2)
- Tableau
- WDC (Web Data Connector)

## Dataset Description

*Source: https://www.kaggle.com/datasets/buntyshah/auto-insurance-claims-data*

|Column|Type|Contain Nan?|
|---|---|---|
|months_as_customer|int|No|
|age|int|No|
|policy_number|int|No|
|policy_bind_date|date|No|
|policy_state|object|No|
|policy_csl|object|No|
|policy_deductable|int|No|
|policy_annual_premium|float|No|
|umbrella_limit|int|No|
|insured_zip|object|No|
|insured_sex|object|No|
|insured_education_level|object|No|
|insured_occupation|object|No|
|insured_hobbies|object|No|
|insured_relationship|object|No|
|capital-gains|int|No|
|capital-loss|int|No|
|incident_date|date|No|
|incident_type|object|No|
|collision_type|object|Yes|
|incident_severity|object|No|
|authorities_contacted|object|No|
|incident_state|object|No|
|incident_city|object|No|
|incident_hour_of_the_day|int|No|
|number_of_vehicles_involved|int|No|
|property_damage|object|Yes|
|bodily_injuries|int|No|
|witnesses|int|No|
|police_report_available|object|Yes|
|total_claim_amount|int|No|
|injury_claim|int|No|
|property_claim|int|No|
|vehicle_claim|int|No|
|auto_make|object|No|
|auto_model|object|No|
|auto_year|int|No|
|fraud_reported|object|No|

## Relational Database Design

![](/Users/yushinnam/Projects/automobile-insurance-dashboard/docs/img/ER-Diagram.png)


