create database clinic;

create table patients(id int generated always as identity, name varchar(100), date_of_birth date, primary key(id));

create table medical_histories(id int generated always as identity, admitted_at timestamp,
patient_id int references patients(id), status varchar(100), primary key(id));

create table treatments(id int generated always as identity, type varchar(100), name varchar(100), primary key(id));

create table invoice_items(id int generated always as identity, unit_price decimal, quantity integer, total_price decimal,
invoice_id int references invoices(id), treatment_id int references treatments(id), primary key(id));

create table invoices(id int generated always as identity, total_amount decimal, generated_at timestamp, payed_at timestamp,
medical_history_id integer, primary key(id));







