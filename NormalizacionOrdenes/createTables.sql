CREATE DATABASE BD_Ordenes;

USE BD_Ordenes;

CREATE TABLE Clientes(
    ClienteID INT IDENTITY(1,1),
    Name VARCHAR (50),
    Estado VARCHAR (50),
    PRIMARY KEY (ClienteID)
);

CREATE TABLE Articulos(
    ArticuloID INT IDENTITY(1,1),
    Name VARCHAR (50),
    Precio FLOAT,
    PRIMARY KEY (ArticuloID)
);

CREATE TABLE Ordenes(
    OrdenID INT IDENTITY(1,1),
    Fecha DATE,
    FK_ClienteID INT,
    PRIMARY KEY (OrdenID),
    CONSTRAINT Orden_Cliente FOREIGN KEY (FK_ClienteID) REFERENCES Clientes(ClienteID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Cantidades(
    CantidadID INT IDENTITY(1,1),
    Cantidad INT,
	FK_OrdenID INT,
	FK_ArticuloID INT,
    PRIMARY KEY (CantidadID),
    CONSTRAINT Cantidad_Orden FOREIGN KEY (FK_OrdenID) REFERENCES Ordenes(OrdenID)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	CONSTRAINT Cantidad_Articulo FOREIGN KEY (FK_ArticuloID) REFERENCES Articulos(ArticuloID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);