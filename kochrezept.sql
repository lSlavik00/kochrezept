-- INIT database

DROP DATABASE IF EXISTS kochrezepte;

CREATE DATABASE IF NOT EXISTS kochrezepte CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE kochrezepte;

-- create table rezept_kategorie - 1:n

DROP TABLE IF EXISTS rezept_kategorie;

CREATE TABLE IF NOT EXISTS rezept_kategorie (
	rezept_kategorie_id INT NOT NULL AUTO_INCREMENT,
	rezept_kategorie_name VARCHAR(50),
	rezept_kategorie_beschreibung VARCHAR(100),
	PRIMARY KEY (rezept_kategorie_id)
);

INSERT INTO rezept_kategorie (rezept_kategorie_name, rezept_kategorie_beschreibung)
		VALUES
        ('Frühstück', 'Alles rund ums Frühstück'), 
        ('Vorspeisen', 'Für den kleinen Hunger'), 
        ('Lunch', 'Ein entspanntes Mittagessen wirkt wunder'), 
        ('Salate', 'Frisch durch den Tag'), 
        ('Suppen', 'Zu jeder Jahreszeit eine Freude'), 
        ('Desserts', 'Süße Träume am Tage'), 
        ('Soße', 'Belege dein Hauptgericht')
        ;

-- create table rezept

DROP TABLE IF EXISTS rezept;

CREATE TABLE IF NOT EXISTS rezept (
	rezept_id INT NOT NULL AUTO_INCREMENT,
	rezept_name VARCHAR(50),
	rezept_beschreibung VARCHAR(100),
	rezept_tipp VARCHAR(200),
	fk_rezept_kategorie_id INT,
	PRIMARY KEY (rezept_id),
	FOREIGN KEY rezept (fk_rezept_kategorie_id) REFERENCES rezept_kategorie (rezept_kategorie_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

INSERT INTO rezept (rezept_name, fk_rezept_kategorie_id, rezept_beschreibung, rezept_tipp)
VALUES 
('Giselas genialer Hefekranz', 1, 'In der Major oder Chef wird das Rezept genau so gemacht allerdings mit lauwarmer Milch und weicher Butter.', 'Claudia Hu`s Übernachtvariante von Fridas Hefezopf:
Claudia bereitet ihn abend zu und nimmt nur 4 gr. Hefe. Lässt ihn bei Raumtemperatur übernacht gehen.'), 
('Lowcarb-Semmeln selbst gemacht', 1, 'Leckere Brötchen müssen auch bei einer Low-Carb-Ernährung nicht fehlen: Wenn du deine Zutaten geschickt auswählst, kannst du zuhause im Handumdrehen kohlenhydratarme Brötchen backen.', 'Achte beim Einkaufen darauf, dass du deine Lebensmittel in Bio-Qualität kaufst. Damit tust du nicht nur dir, sondern auch deiner Umwelt etwas Gutes.'), 
('Rinderfile am Wildsaumagen', 3, 'Ein hochwertiges, teures Stück Fleisch zu verarbeiten braucht etwas Mut und das passende Rezept. Letzteres liefern wir Ihnen mit unserem Rinderfilet-Rezept. Den Mut bekommen Sie von ganz alleine, denn die Zubereitung ist kein Hexenwerk!', 'Bei unserem Rinderfilet-Rezept und in vielen anderen Kochideen, zum Beispiel auch bei unserem Rezept für Rinderfilet mit Kräutern, ist der absolute Höhepunkt des Essens das Fleisch.'), 
('Schinken-Mozzarella Platte', 3, 'Als Vorspeise für 2, als Hauptgericht für 1 Person', 'Dazu schmeckt natürlich italienisches Weißbrot (Ciabatta).'), 
('Grießbrei wie von Muttern', 6, 'So hat ihn meine Omi gemacht und ich liebe diesen luftig lockeren Grießbrei.', 'Dazu schmeckt Kompott nach Wahl, Zimt und Zucker oder braune Butter.'), 
('Waldpilz Salat', 4, 'Pilze zum Säubern nur trocken abreiben, falls nötig kurz abbrausen und grob würfeln. Knoblauch und Schalotte schälen und fein würfeln.', 'Pilze zum Säubern nur trocken abreiben, falls nötig kurz abbrausen und grob würfeln. Knoblauch und Schalotte schälen und fein würfeln.'), 
('Mexikanischer Tofu-Salat', 4, 'Reisen erweitert den Horizont! Und diese Rezept hat meinen ganz sicher erweitert!', 'Auch lecker & mit Bohnen ist mein Quinoa-Bohnen Salat sowie meine Nacho-Bowl mit Ananas-Salsa!'),
('Quinoa-Bohnen Salat', 4, 'Salat ist nicht nur Blätter und Gemüse mit Essig-Dressing.', 'Salat kann so viel mehr, zum Beispiel dieser Quinoa-Bohnen Salat, der warm wie kalt lecker schmeckt!'),
('Nacho-Bowl mit Ananas-Salsa', 2,'Der perfekte Snack für jeden Spieleabend, zum Binge-Watchen oder einfach nur so', 'Dazu benötigtest du diese Ananas-Salsa, die auch sehr lecker als Burger-Soße oder zum Grillen verwendet werden kann'),
('Ananas-Salsa', 7, 'Dein perfekter Begleiter für Nachos, Burger oder zum Grillen', 'Egal, ob du alleine deine Lieblingssendung binge schaust oder ob du zu einem Spieleabend eingeladen hast'),
('Mandel-Spargel Risotto', 3, 'Traumhaftes Risotto mit dezentem Geschmack nach Mandel und gebratenem Spargel!', 'Noch ist ja Spargelzeit und das alleine ist schon Grund genug, unbedingt diese Mandel-Spargel Risotto zu probieren.'),
('Couscous-Gemüse-Salat mit Joghurt-Minz-Dip', 4, 'Wie kann man einen schönen Sommer-Abend besser ausklingen lassen als mit Freunden und einem kaltem Couscous-Gemüse-Salat mit Joghurt-Minz Dip?', 'Für den Gemüse-Couscous-Salat wird das Gemüse kurz angebraten, Pinienkerne geröstet und für eine süße note sorgen Sultaninen.'),
('Pfirsich-Joghurt-Schnitten mit Streuseln', 6, 'Es wird Frühling! Und wie könnte man den Frühling besser willkommen heißen', 'Dazu ein einfacher Joghurt-Zitronen Teig, Pfirsiche und Himbeeren und schon sind die Pfirsich-Joghurt-Schnitten bereit'),
('Gebratener Spargel mit knusprigen Ofen-Kartoffeln und Sauce Hollandaise', 3, 'Grüner Spargel ist mein Liebling: Er ist geschmacksintensiver und viel leichter im Umgang, anbraten in der Pfanne reicht, kochen nicht nötig.', 'Worauf noch warten? Spargel-Zeit ist jetzt, also los!'),
('Linsen-Curry', 3, 'Eine Linsen-Curry wie für uns gemacht: Fix zubereit und super lecker, auf Wunsch auch mit einer gewissen Schärfe.', 'Ich empfehle dazu Naturreis, aber schmeckt sicherlich auch mit Couscous oder anderen Getreiden (oder Pseudogetreiden).'),
('Mexikanischer Bohnensalat mit geräuchertem Tofu', 4, 'Reisen erweitert den Horizont! Und diese Rezept hat meinen ganz sicher erweitert!', 'Auch lecker & mit Bohnen ist mein Quinoa-Bohnen Salat sowie meine Nacho-Bowl mit Ananas-Salsa!'),
('Zitronen-Mohn Muffins', 6, 'Muffins! Und wenn du jetzt denkst Wird aber auch Zeit…', 'Zitrone-Mohn ist eine simple, aber auch wirklich leckere Geschmackskombi'),
('Mi-Nudeln mit gebratenem Tofu', 3, 'Schnelles Hauptgericht gesucht? Dann probier doch diesen lecker marinierten und gebraten Tofu mit Mi-Nudeln, Erbsen und Granatapfel!', 'Da die Mi-Nudeln nur kurz in heißes Wasser müssen, steht das Gericht in weniger als 30 Minuten auf dem Tisch!'),
('Gemüse-Tofu Curry', 3, 'Wenn es draußen kälter wird, muss es drinnen umso wärmer werden', 'Ich habe darauf geachtet, dass es nicht zu scharf ist, aber mehr Chili ist natürlich immer möglich. '),
('Karottenkuchen', 6, 'Karottenkuchen für Alle! Ok, eigentlich lieber nur für mich, denn wenn es um diesen Kuchen geht', 'Damit du trotzdem auch von ihm kosten kannst, verrate ich dir hier mein Rezept.')
;


-- create table rezept_zutat - n:m

DROP TABLE IF EXISTS rezept_zutat;

CREATE TABLE IF NOT EXISTS rezept_zutat (
	fk_rezept_id INT,
	fk_zutat_id INT,
	fk_mengeneinheit_id INT,
	rezept_zutat_menge INT
);

INSERT INTO rezept_zutat (fk_rezept_id, fk_zutat_id, fk_mengeneinheit_id, rezept_zutat_menge)
VALUES
(1, 15, 2, 400),
(1, 16, 2, 100),
(1, 1, 2, 50),
(2, 12, 2, 250),
(2, 13, 2, 300),
(2, 14, 2, 150),
(3, 7, 2, 250),
(3, 4, 2, 300),
(3, 16, 2, 150),
(4, 1, 2, 250),
(4, 2, 2, 300),
(4, 9, 2, 150),
(4, 1, 2, 250),
(4, 2, 2, 300),
(4, 9, 2, 150),
(4, 3, 2, 250),
(4, 7, 2, 300),
(4, 16, 2, 150),
(5, 1, 2, 550),
(5, 2, 2, 300),
(5, 9, 2, 150),
(5, 3, 2, 250),
(6, 1, 2, 250),
(6, 2, 2, 300),
(6, 3, 2, 150),
(7, 14, 2, 250),
(7, 11, 2, 300),
(7, 13, 2, 150),
(8, 1, 2, 250),
(8, 15, 2, 300),
(8, 4, 2, 150),
(9, 1, 2, 250),
(9, 3, 2, 300),
(9, 9, 2, 150),
(10, 4, 2, 250),
(10, 5, 2, 300),
(10, 8, 2, 150),
(10, 11, 2, 150),
(11, 4, 2, 250),
(11, 5, 2, 300),
(11, 8, 2, 150),
(11, 11, 2, 150),
(12, 3, 2, 250),
(12, 5, 2, 300),
(12, 8, 2, 150),
(12, 9, 2, 150),
(13, 1, 2, 250),
(13, 5, 2, 300),
(13, 10, 2, 150),
(13, 11, 2, 150),
(14, 4, 2, 250),
(14, 5, 2, 300),
(14, 8, 2, 150),
(14, 14, 2, 150),
(15, 1, 2, 250),
(15, 2, 2, 300),
(15, 8, 2, 150),
(15, 13, 2, 150),
(16, 2, 2, 250),
(16, 5, 2, 300),
(16, 8, 2, 150),
(16, 11, 2, 150),
(17, 2, 2, 250),
(17, 5, 2, 300),
(18, 1, 2, 250),
(18, 9, 2, 300),
(19, 3, 2, 250),
(19, 16, 2, 300),
(20, 2, 2, 250),
(20, 13, 2, 300)
;

-- create table zutat_kategorie

DROP TABLE IF EXISTS zutat_kategorie;

CREATE TABLE IF NOT EXISTS zutat_kategorie (
	zutat_kategorie_id INT NOT NULL AUTO_INCREMENT,
	zutat_kategorie_name VARCHAR(50),
	zutat_kategorie_beschreibung VARCHAR(100),
	PRIMARY KEY (zutat_kategorie_id)
);

INSERT INTO zutat_kategorie (zutat_kategorie_name, zutat_kategorie_id, zutat_kategorie_beschreibung)
VALUES
('Nudeln', 1, 'Nudel ist die Bezeichnung für: Lebensmittel aus Teig, siehe Teigwaren; Untergruppe der Teigwaren, siehe Nudel (Lebensmittel); in Südösterreich eine gegarte ...'), 
('Gemüse/Salate', 2, 'Gemüse (mhd. gemüese, ursprüngliche Bedeutung: Mus aus Nutzpflanzen) ist heute ein Sammelbegriff für essbare Pflanzenteile wild wachsender oder in ...'), 
('Fisch', 3, 'Fische oder Pisces (lateinisch piscis „Fisch“) sind aquatisch lebende Wirbeltiere mit Kiemen. Im engeren Sinne wird der Begriff Fische eingeschränkt auf ...'), 
('Fleisch', 4, 'Fleisch (von althochdeutsch fleisc) bezeichnet im Allgemeinen Weichteile von Mensch und Tieren. Im Besonderen steht der Begriff für Teile von Säugetieren ...'), 
('Sonstiges', 5, 'Sonstige Arten...')
;

-- create table zutat

DROP TABLE IF EXISTS zutat;

CREATE TABLE IF NOT EXISTS zutat (
	zutat_id INT NOT NULL AUTO_INCREMENT,
	zutat_name VARCHAR(50),
	zutat_kalorien FLOAT,
	zutat_beschreibung VARCHAR(100),
	fk_zutat_kategorie_id INT,
	PRIMARY KEY (zutat_id),
	FOREIGN KEY zutat (fk_zutat_kategorie_id) REFERENCES zutat_kategorie (zutat_kategorie_id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
);

INSERT INTO zutat (zutat_name, fk_zutat_kategorie_id, zutat_kalorien, zutat_beschreibung)
VALUES 	
('Spaghetti', 1, 582, ' italienische Standardaussprache [ spa-get-ti], (gemäß Duden auch Spagetti) sind aus Hartweizengrieß hergestellte Teigwaren'), 
('Tagliatelle', 1, 605, 'Tagliatelle [taʎːaˈtɛlːe] ( Audio-Datei / Hörbeispiel anhören) (von italienisch tagliare, „schneiden“) sind eine Variante von Bandnudeln'), 
('Makkaroni', 1, 870, 'Makkaroni (italienisch maccheroni; in der Schweiz Magronen; für kleine Makkaroni in der Schweiz Hörnli, in Österreich und in Deutschland Hörnchen)'), 
('Farfalle', 1, 850, 'Farfalle ‚Schmetterlinge, sind italienische Nudeln in Schmetterlingsform. Für die Herstellung werden mit einem Teigrädchen aus einem flachen Pastateig'),
('Brokkoli', 2, 475, 'Die Gemüsepflanze Broccoli oder Brokkoli entstammt aus der Familie der Kreuzblütengewächse. Derzeit sind 12 Arten der Pflanze'), 
('Blumenkohl', 2, 420, 'Blumenkohl (Brassica oleracea var. botrytis L.), auch Karfiol, Käsekohl, Blütenkohl, Traubenkohl, Minarett-Kohl oder Italienischer Kohl genannt'), 
('Bärlauch', 2, 150, 'Der Bärlauch ist eine ausdauernde krautige Pflanze'), 
('Eichblattsalat', 2, 215, 'Der Eichblattsalat ist ein Verwandter des Kopfsalats und der Endivie, aus denen Amerikaner diese interessante Version züchteten.'), 
('Rucola', 2, 220, 'Als Rucola (auch Rukola, Rauke, Arugula) werden verschiedene Pflanzenarten aus der Familie der Kreuzblütengewächse gehandelt.'),
('Seelachs', 3, 612, 'Seelachse gehören zur Familie der dorschartigen Fische und sind eng mit dem Kabeljau verwandt.'), 
('Barsch', 3, 315, ' Barsche sind Haftlaicher. Der Barsch ist ein sehr geselliger Schwarmfisch. Er ernährt sich von Plankton, Kleintieren und Fischen.'), 
('Forelle', 3, 550, 'Forellen zählen zu den lachsartigen Fischen. Es gibt unterschiedliche Arten von Forellen, die in Anlehnung an ihren Lebensraum und ihr ...'),
('Schweinefleisch', 4, 845, 'Die Fleischstücke vom Schwein und ihre Verwendung. Schweinefleisch zeichnet sich durch einen würzigen und pikanten Geschmack aus. Es muss frisch sein, ...'), 
('Rindfleisch', 4, 715, 'Rindfleisch ist der übergeordnete Begriff für Teilstücke von weiblichen Jungtieren - den Färsen - sowie von Kühen, Bullen und Ochsen. Einige Teilstücke vom Rind ...'),
('Butter', 5, 390, 'Butter (mittelhochdeutsch buter, althochdeutsch butera, über lateinisch butyrum von altgriechisch βούτυρον boútyron ‚Kuhmilchquark) ist ein meist aus dem ...'), 
('Wasser', 5, 1, 'Wasser (H2O) ist eine chemische Verbindung aus den Elementen Sauerstoff (O) und Wasserstoff (H). Wasser ist als Flüssigkeit durchsichtig, weitgehend farb-, ...')
;

-- create table mengeneinheit

DROP TABLE IF EXISTS mengeneinheit;

CREATE TABLE IF NOT EXISTS mengeneinheit (
	mengeneinheit_id INT NOT NULL AUTO_INCREMENT,
	mengeneinheit_name VARCHAR(20),
	mengeneinheit_kurz CHAR(3),
	PRIMARY KEY (mengeneinheit_id)
);

INSERT INTO mengeneinheit (mengeneinheit_name, mengeneinheit_kurz)
VALUES
('Milligramm', 'mg'), 
('Gramm', 'g'), 
('Kilogramm', 'kg'), 
('Liter', 'L'), 
('Milliliter', 'ml'), 
('Esslöffel', 'EL')
;