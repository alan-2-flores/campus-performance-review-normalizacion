CREATE DATABASE BD_Aeropuertos;

USE BD_Aeropuertos;

CREATE TABLE Paises(
    PaisID INT IDENTITY(1,1),
    Name VARCHAR (50),
    HabPais_M REAL,
	PerteneceUE BIT,
    PRIMARY KEY (PaisID)
);

CREATE TABLE Ciudades(
    CiudadID INT IDENTITY(1,1),
    Name VARCHAR (50),
    HabCiudad_M REAL,
    FK_PaisID INT,
    PRIMARY KEY (CiudadID),
    CONSTRAINT Ciudad_Pais FOREIGN KEY (FK_PaisID) REFERENCES Paises(PaisID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Aeropuertos(
    AeropuertoID INT IDENTITY(1,1),
    Name VARCHAR (25),
    codAeropuerto VARCHAR (5),
    DistanciaKM REAL,
    FK_CiudadID INT,
    PRIMARY KEY (AeropuertoID),
    CONSTRAINT Aeropuerto_Ciudad FOREIGN KEY (FK_CiudadID) REFERENCES Ciudades(CiudadID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);