#1. Rezept Tabelle ausgeben
use kochrezepte;
SELECT 
    *
FROM
    rezept;

#2. Rezepte und deren rezept_kategorie ausgeben
SELECT 
    *
FROM
    rezept r,
    rezept_kategorie rk
WHERE
    r.fk_rezept_kategorie_id = rk.rezept_kategorie_id;

#3. Zutaten und deren zutat kategorie ausgeben
SELECT 
    *
FROM
    zutat z,
    zutat_kategorie zt
WHERE
    z.fk_zutat_kategorie_id = zt.zutat_kategorie_id;

#4. Rezept - Zutat Tabelle ausgeben
SELECT 
    *
FROM
    rezept r,
    zutat z,
    rezept_zutat rz
WHERE
    z.zutat_id = rz.fk_zutat_id
        AND r.rezept_id = rz.fk_rezept_id;

#5. Rezept - Zutat Tabelle ausgeben wo Zutat_menge > 350 ist
SELECT 
    *
FROM
    rezept r,
    zutat z,
    rezept_zutat rz
WHERE
    z.zutat_id = rz.fk_zutat_id
        AND r.rezept_id = rz.fk_rezept_id
        AND rezept_zutat_menge > 350;

#6. Rezepte ausgeben wo das Wort "Reis" in der Name oder Beschreibung enthalten ist
SELECT 
    *
FROM
    rezept
WHERE
    rezept_name LIKE '%reis%'
        OR rezept_beschreibung LIKE '%reis%';

#7. Summe der Rezepte und Zutaten ausgeben
SELECT 
    COUNT(*)
FROM
    rezept r,
    zutat z,
    rezept_zutat rz
WHERE
    z.zutat_id = rz.fk_zutat_id
        AND r.rezept_id = rz.fk_rezept_id;

#8. Anzahl der Rezepte grupiert nach rezept_kategorie
SELECT 
    COUNT(*) AS Anzahl_Rezepte, rk.rezept_kategorie_name
FROM
    rezept r,
    rezept_kategorie rk
WHERE
    r.fk_rezept_kategorie_id = rk.rezept_kategorie_id
GROUP BY rk.rezept_kategorie_name;

#9. Ausgabe der Kategorie wo die meinsten Rezepte Stecken
SELECT 
    MAX(MaxRez.Anzahl_Rezepte)
FROM
    (SELECT 
        rk.rezept_kategorie_name, COUNT(*) AS Anzahl_Rezepte
    FROM
        rezept r, rezept_kategorie rk
    WHERE
        r.fk_rezept_kategorie_id = rk.rezept_kategorie_id
    GROUP BY rk.rezept_kategorie_name) AS MaxRez;

#10. Rezepte namen und deren zutaten menge ausgeben
SELECT 
    r.rezept_name, COUNT(*) AS menge_Zutat
FROM
    rezept r,
    rezept_zutat rz
WHERE
    r.rezept_id = rz.fk_rezept_id
GROUP BY r.rezept_name;