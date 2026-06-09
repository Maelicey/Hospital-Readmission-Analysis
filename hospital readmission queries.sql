create database hospital_project;
use hospital_project; 
select count(*)  as total_patients
from hospital_readmission_dataset;

#1
select label, count(*) as patient_count
from hospital_readmission_dataset
group by label;

#2 does age affect readmission?
select label, avg(age) as avg_age
from hospital_readmission_dataset
group by label;
#older people tend to be more readmitted.

#3 does length of stay affect readmission
select label, avg(length_of_stay) as avg_length_stay
from hospital_readmission_dataset
group by label;
#patients who were readmitted had a longer stay. This might explain that patients with more severe concerns hee higher risks of readmission.alter

#4 which treatment type has the highest readmission
select treatment_type, count(*) as patient_count
from hospital_readmission_dataset
where label = 1
group by treatment_type;
#medical treatment had the highest number of readmitted patients.

#5 which diagnosis has the highest readmission
select count(*) as patient, primary_diagnosis
from hospital_readmission_dataset
where label = 1
group by primary_diagnosis
order by patient DESC;
#diabete has the highest number of patients readmitted followed by hypertension and COPD.

#6 Do patients with more previous readmissions tend to be readmitted again?
select label, avg(prev_readmissions) as avgprev_readmissions
from hospital_readmission_dataset
group by label;
#patients who were readmitted had a higher average numbers of previous readmissions.

#7 "Do patients with more medications tend to be readmitted?"
select label, avg(medications_count) as med
from hospital_readmission_dataset
group by label;
#patients who were readmitted had an average medication of 7.91 while those non readmitted had an average of 5.98.

#8 Do patients with more comorbidities tend to be readmitted?
select label, avg(comorbidities_count) as comorbities
from hospital_readmission_dataset
group by label;

#9 Which insurance type has the highest number of readmitted patients?
select insurance_type, count(*) as patients
from hospital_readmission_dataset
where label = 1
group by insurance_type
order by patients DESC;
#medicare has the highest number of readmitted patients followed by private, medicaid, and uninsured

#10 Which discharge disposition has the highest number of readmitted patients?
select discharge_disposition, count(*) as patients
from hospital_readmission_dataset
where label = 1
group by discharge_disposition
order by patients DESC;
#patients discharged at home health have the highest number of readmission followed by skilled nursing.

#11 Which gender has the highest number of readmitted patients?
select gender, count(*) as patients 
from hospital_readmission_dataset
where label = 1
group by gender
order by patients DESC;
#female patients have the highest number of readmission.

#12 Do patients with more follow-up visits tend to be readmitted?
select label, avg(followup_visits_last_year) as follow_up, count(*) as patients
from hospital_readmission_dataset
group by label;
#patients with more follow-up visits tend to be readmitted.

#13 Which diagnosis has the highest average length of stay?
select primary_diagnosis, avg(length_of_stay) as stay
from hospital_readmission_dataset
group by primary_diagnosis
order by stay desc;
#sepsis has the highest average length of stay

#14 Among readmitted patients, which diagnosis has the highest average age?
select primary_diagnosis, avg(age) as avg_age
from hospital_readmission_dataset
where label = 1
group by primary_diagnosis
order by avg_age DESC;
# Appendicitis is the diagnosis with the highest average age of 64 years old for readmitted patients.

#15 Which insurance type has the highest average age among readmitted patients?
select insurance_type, avg(age) as avg_age
from hospital_readmission_dataset
where label = 1
group by insurance_type
order by avg_age desc;
#medicare has the highest avg age of 77 years old among readmitted patients followed by private 

#16 Among readmitted patients, which insurance type has the highest average number of medications?
select insurance_type, avg(medications_count) as med_count
from hospital_readmission_dataset
where label = 1
group by insurance_type
order by med_count desc;
#medicare has the highest number of medications 

#17 Among readmitted patients, which diagnosis has the highest average number of medications?
select primary_diagnosis, avg(medications_count) as med_count
from hospital_readmission_dataset
where label = 1
group by primary_diagnosis
order by med_count desc
limit 5;
#influenza has the highest avg number of 8.41 among readmitted patients.