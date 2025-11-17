# Automobile Insurance Dashboard

## Table of Contents

## Overview
This project builds an end-to-end automobile insurance data analysis using a MySQL database hosted on AWS EC2 and an interactive Tableau dashboard.
Starting from a raw CSV file, the projects includes cleaning and transforming the dataset and then normalize it into a relational schema, implementing primary/foreign key constraints, and expose the data for analysis via Web Data Connector. 
The goal of this projet is to showcase practical skills in SQL schema design, data cleaning and transformation, and business-oriented dashboarding for an insurance context. It is designed to be a compact but realistic example of how raw operational data can be turned into a structured database and visual analytics tool that underwriters, actuaries, or analysts could use in practice.

## Tech Stack
- Python: pandas, numpy
- SQL: MySQL
- Cloud: AWS EC2
- Visualization: Tableau Public
- Tools: Eraser.io, VS Code, MySQL WorkBench, Git

## Dataset Description

*Source: https://www.kaggle.com/datasets/buntyshah/auto-insurance-claims-data*

<table>
<tr>
<td valign="top" style="padding-right: 30px;">

<table>
<tr><th>Column</th><th>Type</th><th>NaN?</th></tr>

<tr><td>months_as_customer</td><td>int</td><td>No</td></tr>
<tr><td>age</td><td>int</td><td>No</td></tr>
<tr><td>policy_number</td><td>int</td><td>No</td></tr>
<tr><td>policy_bind_date</td><td>date</td><td>No</td></tr>
<tr><td>policy_state</td><td>object</td><td>No</td></tr>
<tr><td>policy_csl</td><td>object</td><td>No</td></tr>
<tr><td>policy_deductable</td><td>int</td><td>No</td></tr>
<tr><td>policy_annual_premium</td><td>float</td><td>No</td></tr>
<tr><td>umbrella_limit</td><td>int</td><td>No</td></tr>
<tr><td>insured_zip</td><td>object</td><td>No</td></tr>
<tr><td>insured_sex</td><td>object</td><td>No</td></tr>
<tr><td>insured_education_level</td><td>object</td><td>No</td></tr>
<tr><td>insured_occupation</td><td>object</td><td>No</td></tr>
<tr><td>insured_hobbies</td><td>object</td><td>No</td></tr>
<tr><td>insured_relationship</td><td>object</td><td>No</td></tr>
<tr><td>capital-gains</td><td>int</td><td>No</td></tr>
<tr><td>capital-loss</td><td>int</td><td>No</td></tr>

</table></td>

<td valign="top">

<table>
<tr><th>Column</th><th>Type</th><th>NaN?</th></tr>

<tr><td>incident_date</td><td>date</td><td>No</td></tr>
<tr><td>incident_type</td><td>object</td><td>No</td></tr>
<tr><td>collision_type</td><td>object</td><td>Yes</td></tr>
<tr><td>incident_severity</td><td>object</td><td>No</td></tr>
<tr><td>authorities_contacted</td><td>object</td><td>No</td></tr>
<tr><td>incident_state</td><td>object</td><td>No</td></tr>
<tr><td>incident_city</td><td>object</td><td>No</td></tr>
<tr><td>incident_hour_of_the_day</td><td>int</td><td>No</td></tr>
<tr><td>number_of_vehicles_involved</td><td>int</td><td>No</td></tr>
<tr><td>property_damage</td><td>object</td><td>Yes</td></tr>
<tr><td>bodily_injuries</td><td>int</td><td>No</td></tr>
<tr><td>witnesses</td><td>int</td><td>No</td></tr>
<tr><td>police_report_available</td><td>object</td><td>Yes</td></tr>
<tr><td>total_claim_amount</td><td>int</td><td>No</td></tr>
<tr><td>injury_claim</td><td>int</td><td>No</td></tr>
<tr><td>property_claim</td><td>int</td><td>No</td></tr>
<tr><td>vehicle_claim</td><td>int</td><td>No</td></tr>
<tr><td>auto_make</td><td>object</td><td>No</td></tr>
<tr><td>auto_model</td><td>object</td><td>No</td></tr>
<tr><td>auto_year</td><td>int</td><td>No</td></tr>
<tr><td>fraud_reported</td><td>object</td><td>No</td></tr>

</table>
</td>
</tr>
</table>

### Preprocessing
- handled missing "?" values
- standardized date formats
- split `policy_csl` into `bi_per_person` and `bi_per_accident`
- split `incident_location` into `incident_house_number` and `incident_street_name`

## Relational Database Design

![ER Diagram](/docs/img/ER-Diagram.png)

Entities:
- Driver
- Policy
- Incident
- Vehicle
- Report
- Policy Coverage
- Policy Premium
- Claims
- Driver Income
- Incident Location

Relations:
- Driver Vehicle Ownership
- Claims Vehicle Involvement
- Driver Incident Participation
