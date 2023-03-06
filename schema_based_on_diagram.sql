create database clinic;

create table patients(id int generated always as identity, name varchar(100), date_of_birth date, primary key(id));

create table medical_histories(id int generated always as identity, admitted_at timestamp,
patient_id int references patients(id), status varchar(100), primary key(id));

create table treatments(id int generated always as identity, type varchar(100), name varchar(100), primary key(id));

create table invoice_items(id int generated always as identity, unit_price decimal, quantity integer, total_price decimal,
invoice_id int references invoices(id), treatment_id int references treatments(id), primary key(id));

create table invoices(id int generated always as identity, total_amount decimal, generated_at timestamp, payed_at timestamp,
medical_history_id integer, primary key(id));

create table med_treatments(med_hist_id int references medical_histories(id), treatments_id int references treatments(id),
primary key(med_hist_id, treatments_id));

create index pat_id on medical_histories(patien_id asc);
create index medical_hist_id on invoices(medical_history_id asc);
create index inv_id on invoice_items(invoice_id asc);
create index treat_id on invoice_items(treatment_id asc);
create index med_history_id on med_treatments(med_hist_id asc);
create index treatm_id on med_treatments(teratments_id asc);




