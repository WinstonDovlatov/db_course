CREATE SCHEMA IF NOT EXISTS hospital;

create table hospital.station
(
    id   serial primary key,
    name varchar
);

create table hospital.room
(
    id         serial primary key,
    station_id int,
    n_beds     int,
    foreign key (station_id) references hospital.station
);

create table hospital.station_personnel
(
    id                serial primary key,
    name              varchar,
    works_for_station int,
    foreign key (works_for_station) references hospital.station
);

create table hospital.caregiver
(
    id            int primary key,
    qualification varchar,
    foreign key (id) references hospital.station_personnel
);

create table hospital.doctor
(
    id   int primary key,
    area varchar,
    rank varchar,
    foreign key (id) references hospital.station_personnel
);

create table hospital.patient
(
    id        serial primary key,
    name      varchar,
    disease   varchar,
    thread_by int,
    foreign key (thread_by) references hospital.doctor
);

create table hospital.admission
(
    patient_id     int primary key,
    room_id        int,
    station_id     int,
    admission_from date,
    admission_to   date,
    foreign key (room_id) references hospital.room,
    foreign key (station_id) references hospital.station
);