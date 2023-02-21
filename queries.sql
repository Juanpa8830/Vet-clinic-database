/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select * from animals where date_of_birth > '2016-01-01' and  date_of_birth < '2019-12-31' ;
select * from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attempts from animals where weight_Kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_Kg >=10.4 and  weight_Kg <=17.3;
