
-- Zadanie 1 -> Wszystkie dane ze wszystkich tabel --
SELECT * FROM Dostawcy;
SELECT * FROM Faktury;
SELECT * FROM Firmy;
SELECT * FROM Klienci;
SELECT * FROM Pozycje_faktury;
SELECT * FROM Produkty;
SELECT * FROM Zamówienia;

-- Zadanie 2 -> Wszystkie firmy, których nazwa to: 'Abc' --
SELECT Nazwa_firmy FROM Firmy 
WHERE Nazwa_firmy = 'Abc';

-- Zadanie 3 -> Nazwy wszystkich firm w kolejności alfabetycznej --
SELECT Nazwa_firmy FROM Firmy
ORDER BY Nazwa_firmy;

-- Zadanie 4 -> Trzy produkty, których liczba w magazynie przekracza 30 sztuk --
SELECT Produkt, Ilość_sztuk FROM Produkty
WHERE Ilość_sztuk > 30
LIMIT 3;

-- ZADANIE 5 -> Fakturę zakupu na najwyższą kwotę --
SELECT * FROM Faktury
ORDER BY Wartość_faktury DESC
LIMIT 1;

-- Zadanie 6 -> Wszystkie zakupione produkty bez dwóch najdroższych--
SELECT p.Produkt, pf.Id_faktury, pf.Cena
FROM Produkty p
INNER JOIN Pozycje_faktury pf ON p.Id_produktu = pf.Id_produktu
ORDER BY pf.Cena DESC
LIMIT 100 OFFSET 2;

-- Zadanie 7 -> Nazwę produktu, liczbę sztuk, cenę oraz numer faktury, na której się znajduje--
SELECT p.Produkt, pf.Ilość, pf.Cena, f.Numer_faktury
FROM Produkty p
JOIN Pozycje_faktury pf ON p.Id_produktu=pf.Id_produktu
JOIN Faktury f ON f.Id_faktury=pf.Id_faktury;

