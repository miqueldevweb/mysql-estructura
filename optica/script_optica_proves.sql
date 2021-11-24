-- Datos proveidors
INSERT INTO proveidors (id_proveidor, nom, adreça, telefon, fax) VALUES ('12345678p', 'topo', 'un cau ben profund', '123456789', '987654321');
INSERT INTO proveidors (id_proveidor, nom, adreça, telefon, fax) VALUES ('19243757s', 'negro', 'lado oscuro de la luna', '761425913', '942185732');
INSERT INTO proveidors (id_proveidor, nom, adreça, telefon, fax) VALUES ('49526718t', 'miopes unidos', 'distancia focal 32', '732146858', '184579216');


-- Datos ulleres
INSERT INTO ulleres (marca, graduacio1, graduacio2, muntura, color, color_vidre1, color_vidre2, preu) VALUES ('ekin', '1.25', '2.1', 'pasta', 'groc', 'vermell', 'verd', 325.0);
INSERT INTO ulleres (marca, graduacio1, graduacio2, muntura, color, color_vidre1, color_vidre2, preu) VALUES ('elgoog', '2.25', '2.7', 'flotant', 'lila', 'transparent', 'transparent', 200.0);
INSERT INTO ulleres (marca, graduacio1, graduacio2, muntura, color, color_vidre1, color_vidre2, preu) VALUES ('telacs', '0.5', '3.0', 'metalica', 'gris', 'negre', 'negre', 400.0);
INSERT INTO ulleres (marca, graduacio1, graduacio2, muntura, color, color_vidre1, color_vidre2, preu) VALUES ('vloser', '10.0', '10.0', 'pasta', 'negre', 'rosa', 'rosa', 50.0);


-- Datos de relación entre proveidors/ulleres
INSERT INTO proveidor_ulleres (proveidor_id_proveidor, ulleres_id_ulleres) VALUES ('12345678p', 1);
INSERT INTO proveidor_ulleres (proveidor_id_proveidor, ulleres_id_ulleres) VALUES ('19243757s', 2);
INSERT INTO proveidor_ulleres (proveidor_id_proveidor, ulleres_id_ulleres) VALUES ('12345678p', 3);
INSERT INTO proveidor_ulleres (proveidor_id_proveidor, ulleres_id_ulleres) VALUES ('49526718t', 4);


-- Datos de clientes
-- Se genera clliente 1 como vacio de manera que si a un cliente no lo ha recomendado nadie en clients_id_client tendrá valor 1.
INSERT INTO clients (clients_id_client) VALUES (1);
INSERT INTO clients (nom, adreça, telefon, email, data, clients_id_client) VALUES ('artur', 'invidencia 45', '465182739', 'artur69@mailg.com', '1920/10/10', 1);
INSERT INTO clients (nom, adreça, telefon, email, data, clients_id_client) VALUES ('artura', 'invidencia 45', '825467157', 'artura96@mailg.com', '2020/11/1', 2);


-- Datos de compras de gafas por clientes, se permiten duplicados ya que un cliente puede comprar las gafas más de una vez, se genera un id de compra distinto
INSERT INTO ulleres_clients (ulleres_id_ulleres, client_id_client, nom_empleat) VALUES (2, 2, 'maite');
INSERT INTO ulleres_clients (ulleres_id_ulleres, client_id_client, nom_empleat) VALUES (2, 2, 'maite');
INSERT INTO ulleres_clients (ulleres_id_ulleres, client_id_client, nom_empleat) VALUES (3, 3, 'etiam');
INSERT INTO ulleres_clients (ulleres_id_ulleres, client_id_client, nom_empleat) VALUES (1, 3, 'etiam');
INSERT INTO ulleres_clients (ulleres_id_ulleres, client_id_client, nom_empleat) VALUES (2, 3, 'etiam');



-- Pruebas: se omite el periodo DE FACTURACIÓN ya que no es un atributo de cliente ni de la relación entre el cliente y las gafas, en el enunciado no se solicita

SELECT COUNT(client_id_client) FROM ulleres_clients WHERE client_id_client = 2;
SELECT marca FROM ulleres JOIN ulleres_clients ON id_ulleres = ulleres_id_ulleres WHERE nom_empleat = 'etiam';
SELECT DISTINCT proveidors.nom FROM (proveidors JOIN proveidor_ulleres ON id_proveidor = proveidor_id_proveidor) JOIN ulleres_clients ON proveidor_ulleres.ulleres_id_ulleres = ulleres_clients.ulleres_id_ulleres;





