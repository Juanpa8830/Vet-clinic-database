/* Populate database with sample data. */

insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (1, 'Agumon', '2020-02-03', 0, true, 10.23);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (2, 'Gabumon', '2018-11-15', 2, true, 8);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (4, 'Devimon', '2017-05-12', 5, true, 11);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Charmander', '2020-02-08', 0, false, -11);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Plantmon', '2021-11-15', 2, true, -5.7);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Squirtle', '1993-04-02', 3, false, -12.13);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Angemon', '2005-06-12', 1, true, -45);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Boarmon', '2005-06-07', 7, true, 20.4);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Blossom', '1998-10-13', 3, true, 17);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_Kg) values ('Ditto', '2022-05-14', 4, true, 22);

 insert into owners(full_name, age) values('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45),
                                          ('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

insert into species(name) values ('Pokemon'), ('Digimon');
update animals set species_id=2 where name like '%mon';
update animals set species_id=1 where species_id is null;
update animals set owner_id=1 where name = 'Agumon';
update animals set owner_id=2 where name = 'Gabumon' or name = 'Pikachu';
update animals set owner_id=3 where name = 'Devimon' or name = 'Plantmon';
update animals set owner_id=4 where name = 'Charmander' or name = 'Squirtle' or name ='Blossom';
update animals set owner_id=5 where name = 'Angemon' or name = 'Boarmon';

insert into vets(name, age, date_of_graduation) values ('William Tatcher', 45, '2000-04-23'),
                                                       ('Maisy Smith', 26, '2019-01-17'),
                                                       ('Stephanie Mendez', 64, '1981-05-04'),
                                                       ('Jack karkness', 38, '2008-06-08');

insert into specializations (specie_id, vet_id) values (1,1),(1,3),(2,3),(2,4);

insert into visits(animal_id, vets_id, date_of_visit) values (1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-02-02'),
(3, 2, '2020-01-05'),
(3,2,'2020-05-14'),
(3,2,'2020-04-08'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6,1,'2020-08-10'),
(6,2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, 
(SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';