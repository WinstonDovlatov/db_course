CREATE SCHEMA IF NOT EXISTS transport;

CREATE TABLE transport.city
(
    region    varchar,
    city_name varchar,
    primary key (region, city_name)
);

CREATE TABLE transport.station
(
    name        varchar primary key,
    n_tracks    int,
    city_name   varchar,
    city_region varchar,
    foreign key (city_region, city_name) references transport.city
);

CREATE TABLE transport.train
(
    id            serial primary key,
    start_station varchar,
    end_station   varchar,
    foreign key (start_station) references transport.station,
    foreign key (end_station) references transport.station
);

CREATE TABLE transport.connected
(
    station_from varchar,
    station_to   varchar,
    train_id     int,
    foreign key (station_from) references transport.station,
    foreign key (station_to) references transport.station,
    foreign key (train_id) references transport.train
);
