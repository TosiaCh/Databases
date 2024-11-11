DROP TABLE IF EXISTS Zamówienia;

DROP TABLE IF EXISTS Pozycje_faktury;

DROP TABLE IF EXISTS Produkty;

DROP TABLE IF EXISTS Faktury;

DROP TABLE IF EXISTS Klienci;

DROP TABLE IF EXISTS Firmy;

DROP TABLE IF EXISTS Dostawcy;

CREATE TABLE Dostawcy (
    Id_dostawcy int NOT NULL PRIMARY KEY,
    Imię varchar(40),
    Nazwisko varchar(40),
    Nr_telefonu varchar(40)
);

INSERT INTO
    Dostawcy
VALUES
    (1, 'Artur', 'Kura', '789133999'),
(2, 'Ada', 'Skóra', '777888999');

CREATE TABLE Firmy(
    Nip_firmy int NOT NULL PRIMARY KEY,
    Nazwa_firmy varchar(70)
);

INSERT INTO
    Firmy
VALUES
    (123, 'Abc'),
(987, 'Alfabet');

CREATE TABLE Klienci (
    Id_klienta int NOT NULL PRIMARY KEY,
    Imię varchar(40),
    Nazwisko varchar(40),
    Adres varchar(255),
    Nip_firmy int,
    FOREIGN KEY (Nip_firmy) REFERENCES Firmy(Nip_firmy)
);

INSERT INTO
    Klienci
VALUES
    (1, 'Jan', 'Kowalski', 'ul Jakas 23, Grudziądz', 123),
(2, 'Piotr', 'Nowak', 'ul Inna 37, Kraków', 987);

CREATE TABLE Faktury(
    Id_faktury int NOT NULL PRIMARY KEY,
    Numer_faktury int,
    Wartość_faktury decimal(10, 2)
);

INSERT INTO
    Faktury
VALUES
    (1, 3, 5000),
(2, 23434, 500);

CREATE TABLE Produkty (
    Id_Produktu int NOT NULL PRIMARY KEY,
    Produkt varchar(60),
    Ilość_sztuk int
);

INSERT INTO
    Produkty
VALUES
    (1, 'pióro wieczne "pisz"', 60),
(2, 'Zeszyt 60 kartek', 30),
(3, 'Ołówek cmp 23', 50),
(4, 'długopis wl 67', 40);

CREATE TABLE Pozycje_faktury(
    Id_pozycji_faktury int NOT NULL PRIMARY KEY,
    Id_faktury int,
    Id_produktu int,
    Ilość int,
    Jednostka_miary varchar(20),
    Cena decimal(10, 2),
    Wartość decimal(10, 2),
    FOREIGN KEY (Id_faktury) REFERENCES Faktury(Id_faktury),
    FOREIGN KEY (Id_produktu) REFERENCES Produkty(Id_Produktu)
);

INSERT INTO
    Pozycje_faktury
VALUES
    (1, 1, 1, 30, 'szt.', 100, 3000),
    (2, 1, 2, 10, 'szt.', 200, 2000),
    (3, 2, 3, 40, 'szt.', 10, 400),
    (4, 2, 4, 5, 'szt.', 20, 100);

CREATE TABLE Zamówienia (
    Id_zamówienia int NOT NULL PRIMARY KEY,
    Id_klienta int,
    Id_dostawcy int,
    Id_faktury int,
    Status_Zamówienia enum(
        'Wysłane',
        'Nowe',
        'W trakcie realizacji',
        'Anulowane',
        'Dostarczone',
        'Zwrócone',
        'Zakończone'
    ),
    FOREIGN KEY (Id_klienta) REFERENCES Klienci(Id_klienta),
    FOREIGN KEY (Id_dostawcy) REFERENCES Dostawcy(Id_dostawcy),
    FOREIGN KEY (Id_faktury) REFERENCES Faktury(Id_faktury)
);

INSERT INTO
    Zamówienia
VALUES
    (1, 1, 1, 1, 'Wysłane'),
(2, 2, 1, 2, 'Nowe');