/* Database schema to keep the structure of entire database. */

create table animals(id bint generated always as identity, name varchar(20), date_of_birth date, escape_attempts integer, neutered boolean, weight_Kg decimal, primery key(id));
alter table animals add column species varchar(20);

create table owners (id int generated always as identity, full_name varchar(150), age integer, primary key(id));
create table species (id int generated always as identity, name varchar(150), primary key(id));

alter table animals drop column species;
alter table animals add column species_id int references species(id);
alter table animals add column owner_id int references owners(id);  

create table vets(id int generated always as identity, name varchar(50), age integer, date_of_graduation date, primary key(id));
create table specializations(specie_id int references species(id), vet_id int references vets(id), primary key(specie_id, vet_id));
create table visits (animal_id int references animals(id), vets_id int references vets(id), date_of_visit date);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);