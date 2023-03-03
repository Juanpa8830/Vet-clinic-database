/*Queries that provide answers to the questions from all projects.*/

/*Queries that provide answers to the questions from all projects.*/


-- Show all animals
select * from animals

-- Find all animals whose name ends in "mon". */
select * from animals where name like '%mon';

-- List the name of all animals born between 2016 and 2019.
select name from animals where date_of_birth > '2015-12-31' and date_of_birth < '2020-01-01' ;

-- List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals where neutered = true and escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals where weight_Kg > 10.5;

-- Find all animals that are neutered.
select * from animals where neutered = true;

-- Find all animals not named Gabumon.
select * from animals where name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_Kg >=10.4 and  weight_Kg <=17.3;

-- Inside a transaction update the animals table by setting the species column to 
-- unspecified. Verify that change was made. Then roll back the change and verify
-- that the species columns went back to the state before the transaction.
begin;
  update animals  SET species = 'unspecified';
  select * from animals;
rollback;
 select * from animals;

-- Inside a transaction:
-- · Update the animals table by setting the species column to digimon for all
--   animals that have a name ending in mon.
-- · Update the animals table by setting the species column to pokemon for all
--   animals that don't have species already set.
-- · Commit the transaction.
-- · Verify that change was made and persists after commit.
begin;
  update animals set species = 'digimon' where name like '%mon';
  update animals set species = 'pokemon' where species is null;
commit;
 select * from animals;

-- Inside a transaction delete all records in the animals table, then roll back
-- the transaction.
-- After the rollback verify if all records in the animals table still exists.
begin;
  delete from animals;
ROLLBACK;
 select * from animals;

-- Inside a transaction:
-- · Delete all animals born after Jan 1st, 2022.
-- · Create a savepoint for the transaction.
-- · Update all animals' weight to be their weight multiplied by -1.
-- · Rollback to the savepoint
-- · Update all animals' weights that are negative to be their weight multiplied by -1.
-- · Commit transaction
BEGIN;
  delete from animals where date_of_birth > '2022-01-01';
  savepoint firstStep;
  update animals set weight_kg = weight_kg * -1;
  rollback to firstStep;
  update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;
select * from animals;

-- Write queries to answer the following questions:
-- · How many animals are there?
select count(*) from animals;

-- · How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;

-- · What is the average weight of animals?
select avg(weight_kg) from animals;

-- · Who escapes the most, neutered or not neutered animals? r/ neutered (20 attempts)
vet_clinic=# select sum(escape_attempts) from animals where neutered = true;
vet_clinic=# select sum(escape_attempts) from animals where neutered = false;

-- · What is the minimum and maximum weight of each type of animal?
select min(weight_Kg) from animals where species = 'Pokemon'; --11 kg
select max(weight_Kg) from animals where species = 'Pokemon'; --17 kg

select min(weight_Kg) from animals where species = 'Digimon'; --5.7 Kg
select max(weight_Kg) from animals where species = 'Digimon'; --45 Kg

-- · What is the average number of escape attempts per animal type
--   of those born between 1990 and 2000?
select avg(escape_attempts) from animals where species = 'Pokemon'and date_of_birth > '1989-12-31' and date_of_birth < '2001-01-01'; --3
select avg(escape_attempts) from animals where species = 'Digimon'and date_of_birth > '1989-12-31' and date_of_birth < '2001-01-01'; --0

-- What animals belong to Melody Pond?
select name from animals inner join owners on animals.owner_id = owners.id where owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
select animals.name from animals join species on species.id = animals.species_id where species.name='Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
select owners.full_name as owner, animals.name from animals right join owners on owners.id = animals.owner_id;

-- How many animals are there per species?
select species.name as specie, count(animals.name) from animals inner join species on species.id= animals.species_id group by species.name;

-- List all Digimon owned by Jennifer Orwell.
select owners.full_name as owner, animals.name as animal from animals inner join owners on owners.id= animals.owner_id 
        inner join species on species.id=animals.species_id where owners.full_name='Jennifer Orwell' and species.name='Digimon';


-- List all animals owned by Dean Winchester that haven't tried to escape.
select animals.name from animals inner join owners on owners.id=animals.owner_id where animals.escape_attempts=0 and owners.full_name='Dean Winchester';

-- Who owns the most animals? --Melody Pond

select owners.full_name, count(animals.name) as qty from animals inner join owners on owners.id=animals.owner_id group by owners.full_name;


-- Who was the last animal seen by William Tatcher?
select animals.name from animals inner join visits on animals.id=visits.animal_id 
where visits.date_of_visit = ( select max(dates) from (select visits.animal_id, visits.date_of_visit as dates 
from visits inner join vets on visits.vets_id=vets.id where vets.name = 'William Tatcher' order by visits.date_of_visit desc) as meetings);

-- How many different animals did Stephanie Mendez see

select vets.name as vet, count(*) as Nof_animals from  animals inner join visits on visits.animal_id= animals.id
inner join vets on vets.id = visits.vets_id where vets.id=3 group by vets.name;

-- List all vets and their specialties, including vets with no specialties.

select vets.name, species.name as specialties from species full outer join specializations on species.id = specializations.specie_id
full outer join vets on specializations.vet_id = vets.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select vets.name as vet, animals.name as animal_visit from animals inner join visits on visits.animal_id=animals.id
inner join vets on vets.id=visits.vets_id where vets.name='Stephanie Mendez' and visits.date_of_visit between '2020-04-01' and '2020-08-30';

-- What animal has the most visits to vets?
vet_clinic=# select animals.name, count(visits.date_of_visit) from visits inner join animals on visits.animal_id=animals.id group by animals.name 
having count(visits.date_of_visit) =(select Max(vet_visits) from 
(select animal_id, count(date_of_visit) as vet_visits from visits group by animal_id) as Max_of_visits);

-- Who was Maisy Smith's first visit?
vet_clinic=# select animals.name, visits.date_of_visit as date from animals 
inner join visits on animals.id=visits.animal_id where visits.date_of_visit = 
(select min(dates) from (select visits.animal_id, visits.date_of_visit as dates from visits 
inner join vets on visits.vets_id = vets.id where vets.name = 'Maisy Smith') as min_date);

-- Details for most recent visit: animal information, vet information, and date of visit.
select animals.name as animal, animals.date_of_birth as Birth_date, escape_attempts, neutered, weight_kg, 
species.name as specie, owners.full_name as owner_name, vets.name as vet_name, vets.age as vet_age, 
visits.date_of_visit from animals full outer join species on animals.species_id= species.id 
full outer join owners on animals.owner_id= owners.id 
full outer join visits on animals.id= visits.animal_id 
inner join vets on visits.vets_id=vets.id where visits.date_of_visit = 
(select max(date_of_visit) from visits);

-- How many visits were with a vet that did not specialize in that animal's species?

select vets.name as no_specialty_vet, count(*) as number_of_visits from visits inner join vets on vets.id=visits.vets_id 
where vets.name = (select vet from (select vets.name as vet, species.name as specialties from species 
inner join specializations on species.id=specializations.specie_id full outer join vets on vets.id=specializations.vet_id) as no_esp_vet 
where specialties is null) group by vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most. --Digimon

select species.name as specie, count(*) as vet_visits from animals inner join species on animals.species_id=species.id 
inner join visits on animals.id=visits.animal_id join vets on visits.vets_id=vets.id where vets.name='Maisy Smith' group by species.name;