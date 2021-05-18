create schema if not exists db_project;
set search_path = db_project, public;

drop table if exists MOVIE;
create table MOVIE (
    id integer PRIMARY KEY not null,
    director_id int,
    title_nm varchar(100),
    length_amt int,
    year_dt int,
    plot_text text
);

drop table if exists ACTOR;
create table ACTOR (
    id integer PRIMARY KEY not null,
    first_nm varchar(100),
    last_nm varchar(100),
    sex_desc varchar(100)
);

drop table if exists DIRECTOR;
create table DIRECTOR (
    id integer PRIMARY KEY not null,
    first_nm varchar(100),
    last_nm varchar(100)
);

drop table if exists QUOTE;
create table QUOTE (
    actor_id integer references ACTOR(id) not null,
    movie_id integer references MOVIE(id) not null,
    quote_text text,
    primary key (actor_id, movie_id)
);

drop table if exists STUDIO;
create table STUDIO (
    id integer primary key not null,
    studio_nm varchar(100),
    address_desc text
);

drop table if exists INCOME;
create table INCOME (
    id integer primary key not null,
    income_amt float8,
    country_nm varchar(100)
);

drop table if exists ACTOR_X_MOVIE;
create table ACTOR_X_MOVIE (
    actor_id integer references ACTOR(id) not null,
    movie_id integer references MOVIE(id) not null,
    primary key (actor_id, movie_id)
);

drop table if exists INCOME_X_MOVIE;
create table INCOME_X_MOVIE (
    movie_id integer references MOVIE(id) not null,
    income_id integer references INCOME(id) not null,
    primary key (movie_id, income_id)
);

drop table if exists MOVIE_X_STUDIO;
create table MOVIE_X_STUDIO (
    movie_id integer references MOVIE(id) not null,
    studio_id integer references STUDIO(id) not null,
    primary key (movie_id, studio_id)
);

insert into DIRECTOR (id, first_nm, last_nm)
values (0, 'Christopher', 'Nolan'),
        (1, 'James', 'Cameroon'),
        (2, 'Steven', 'Spielberg'),
        (3, 'Quentin', 'Tarantino'),
        (4, 'David', 'Fincher');

insert into STUDIO (id, studio_nm, address_desc)
values (0, '20th Century Studios', 'Fox Studio Lot Building 88, 10201 West Pico Boulevard, Century City, Los Angeles, California, United States'),
       (1, 'Paramount Pictures', '5555 Melrose Avenue, Hollywood, California, United States'),
       (2, 'Warner Bros. Pictures', '4000 Warner Blvd., Burbank, California, United States'),
       (3, 'Universal Pictures', '10 Universal City Plaza, Universal City, California, United States'),
       (4, 'Orion Pictures', 'Los Angeles, California, USA'),
       (5, 'Columbia Pictures', 'Thalberg Building, 10202 West Washington Boulevard, Culver City, California, United States');

insert into MOVIE (id, director_id, title_nm, length_amt, year_dt, plot_text)
values (0, 0, 'Interstellar', 169, 2014, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.'),
       (1, 1, 'Titanic', 194, 1997, 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.'),
       (2, 2, 'The War of The Worlds', 116, 2005, 'An updated version of H.G Wells seminal sci-fi classic about an alien invasion threatening the future of humanity. The catastrophic nightmare is depicted through the eyes of one American family fighting for survival.'),
       (3, 3, 'Once Upon A Time In Hollywood', 160, 2019, 'Rick, a washed-out actor, and Cliff, his stunt double, struggle to recapture fame and success in 1960s Los Angeles. Meanwhile, living next door to Rick is Sharon Tate and her husband Roman Polanski.'),
       (4, 4, 'Fight Club', 151, 1999, 'Discontented with his capitalistic lifestyle, a white-collared insomniac forms an underground fight club with Tyler, a careless soap salesman. The project soon spirals down into something sinister.'),
       (5, 1, 'The Terminator', 107, 1984, 'A human soldier is sent from 2029 to 1984 to stop an almost indestructible cyborg killing machine, sent from the same year, which has been programmed to execute a young woman whose unborn son is the key to humanitys future salvation.');

insert into MOVIE_X_STUDIO (movie_id, studio_id)
values (0, 1), (0, 2), (1, 1), (1, 0), (2, 2), (3, 5), (4, 0), (5, 4);

insert into ACTOR (id, first_nm, last_nm, sex_desc)
values (0, 'Arnold', 'Schwarzenegger', 'male'),
       (1, 'Leonardo', 'DiCaprio', 'male'),
       (2, 'Kate', 'Winslet', 'female'),
       (3, 'Brad', 'Pitt', 'male'),
       (4, 'Helena', 'Bonham', 'female'),
       (5, 'Edvard', 'Norton', 'male'),
       (6, 'Matthew', 'McConaughey', 'male'),
       (7, 'Anne', 'Hathaway', 'female'),
       (8, 'Michael', 'Caine', 'male'),
       (9, 'Jessica', 'Chastain', 'female'),
       (10, 'Tom', 'Cruise', 'male'),
       (11, 'Dakota', 'Fanning', 'female');

insert INTO ACTOR_X_MOVIE (actor_id, movie_id)
values (0, 5), (1, 1), (1, 2), (2, 1), (11, 0), (6, 0), (3, 3), (3, 4), (10, 2);

insert into QUOTE (actor_id, movie_id, quote_text)
values (2, 1, 'Jack, I am flying!'),
       (1, 1, 'I am the king of the world!'),
       (8, 0, 'Do not go gentle into that good night; Old age should burn and rave at close of day. Rage, rage against the dying of the light.'),
       (7, 0, 'Love is the one thing that transcends time and space.'),
       (3, 4, 'We are consumers. We are the by-products of a lifestyle obsession.'),
       (5, 4, 'This is your life, and it is ending one minute at a time.'),
       (0, 5, 'I will be back.');

insert into INCOME (id, income_amt, country_nm)
values (0, 524.8, 'Austria'),
       (1, 3.6, 'Italy'),
       (2, 201.4, 'Japan'),
       (3, 12.8, 'India'),
       (4, 55.6, 'United Kingdom'),
       (5, 21.8, 'France'),
       (6, 0.334, 'Russia'),
       (7, 0.012, 'Australia'),
       (8, 38.3, 'USA');

insert into INCOME_X_MOVIE (movie_id, income_id)
values (0, 0), (0, 1), (1, 2), (1, 3), (2, 4), (3, 5), (4, 6), (4, 7), (5, 8);

--- number of films made by directors ---
select
    d.id,
    d.first_nm,
    d.last_nm,
    count(m.id) as film_acount
from
    DIRECTOR d
    left join MOVIE m on d.id = m.director_id
group by d.id
order by d.id;

--- number of actors in all films ---
select
    m.title_nm,
    count(axm.actor_id) as actor_count
from
    MOVIE m
    inner join ACTOR_X_MOVIE axm on m.id = axm.movie_id
group by m.title_nm;

--- average box-office per film ---

select
    m.title_nm as name,
    avg(I.income_amt) over (partition by m.title_nm) as income_amt
from
    MOVIE m
    inner join INCOME_X_MOVIE IXM on m.id = IXM.movie_id
    inner join INCOME I on I.id = IXM.income_id;

