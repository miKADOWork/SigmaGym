DROP DATABASE IF EXISTS db_gym_app;
CREATE DATABASE db_gym_app;
USE db_gym_app;

CREATE TABLE Plan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(20),
    info VARCHAR(200),
    price DECIMAL(10, 2)
);

CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    username VARCHAR(20),
    password VARCHAR(30),
    address VARCHAR(150),
    type TINYINT,
    status TINYINT,
    gender VARCHAR(15),
    email VARCHAR(50),
    dni VARCHAR(15),
    job_title_worker VARCHAR(45),
    phone_num VARCHAR(15),
    credit_card VARCHAR(19),
    birthday DATE,
    url_img VARCHAR(250) DEFAULT 'SigmaGym/frontend/src/assets/users/', -- Valor por defecto que debe ser la ruta a la carpeta de las imagenes
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES Plan(id) ON DELETE CASCADE
);


CREATE TABLE gym (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40),
    address VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(45),
    horary VARCHAR(60)
);

CREATE TABLE gym_has_user (
    gym_id INT,
    user_id INT,
    PRIMARY KEY (gym_id, user_id),
    FOREIGN KEY (gym_id) REFERENCES gym(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE class (
    id INT AUTO_INCREMENT PRIMARY KEY,
    coach VARCHAR(45),
    horary VARCHAR(100),
    sport VARCHAR(50),
    num_students_on_class INT,
    max_students INT
);

CREATE TABLE gym_has_class (
    gym_id INT,
    class_id INT,
    PRIMARY KEY (gym_id, class_id),
    FOREIGN KEY (gym_id) REFERENCES gym(id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES class(id) ON DELETE CASCADE
);

CREATE TABLE class_has_user (
    class_id INT,
    user_id INT,
    PRIMARY KEY (class_id, user_id),
    FOREIGN KEY (class_id) REFERENCES class(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);
CREATE TABLE novedades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(90),
    gym_name VARCHAR(90),
    fecha DATE,
    informacion VARCHAR(200)
);


INSERT INTO novedades (titulo, gym_name, fecha, informacion) VALUES
('Entrenamiento de alta intensidad', 'GymFit', '2023-01-15', '¡Descubre nuestra nueva clase de alta intensidad para todos los niveles!'),
('Apertura de nuevas sucursales', 'PowerGym', '2023-02-02', 'Celebra con nosotros la apertura de nuevas sucursales en toda la ciudad.'),
('Descuentos para nuevos miembros', 'ActiveLife', '2023-03-10', '¡Únete a ActiveLife y disfruta de descuentos especiales como nuevo miembro!'),
('Yoga al aire libre', 'ZenFitness', '2023-04-05', 'Disfruta de la serenidad con nuestras clases de yoga al aire libre.'),
('Entrenamiento personalizado gratuito', 'EpicGains', '2023-05-20', 'Obtén un entrenamiento personalizado gratuito para alcanzar tus metas de acondicionamiento físico.'),
('Competencia de levantamiento de pesas', 'IronFlex', '2023-06-08', '¡Demuestra tu fuerza en nuestra competencia de levantamiento de pesas!'),
('Nuevos equipos de cardio de última generación', 'FitnessFusion', '2023-07-15', 'Descubre la tecnología de punta con nuestros nuevos equipos de cardio.'),
('Clases de baile latino', 'SalsaFit', '2023-08-03', 'Siente la energía latina con nuestras nuevas clases de baile.'),
('Recetas saludables en nuestro blog', 'NutriGym', '2023-09-12', 'Encuentra recetas saludables y consejos nutricionales en nuestro blog.'),
('Entrenamiento en grupo', 'TeamUnity', '2023-10-18', 'Motívate con nuestro entrenamiento en grupo para alcanzar tus metas fitness.'),
('Evento de acondicionamiento físico comunitario', 'FitCommunity', '2023-11-05', 'Únete a nuestro evento comunitario para mejorar tu acondicionamiento físico.'),
('Nuevas máquinas de pesas', 'StrongLifts', '2023-12-20', 'Añadimos nuevas máquinas de pesas para potenciar tu rutina de entrenamiento.'),
('Descuentos exclusivos para estudiantes', 'StudentFit', '2024-01-08', 'Estudiantes, aprovechen descuentos exclusivos para mantenerse en forma.'),
('Sesiones de meditación', 'MindBody', '2024-02-14', 'Encuentra paz interior con nuestras nuevas sesiones de meditación.'),
('Carrera benéfica', 'RunForGood', '2024-03-22', 'Participa en nuestra carrera benéfica para apoyar una buena causa.'),
('Entrenamiento funcional', 'FunctionalFlex', '2024-04-10', 'Mejora resistencia y movilidad con nuestro nuevo programa de entrenamiento funcional.'),
('Semana de acceso gratuito', 'OpenGym', '2024-05-01', 'Únete durante la semana de acceso gratuito y descubre todo lo que ofrecemos.'),
('Clases de natación', 'AquaFit', '2024-06-18', 'Refresca tu rutina con nuestras nuevas clases de natación.'),
('Desafío de pérdida de peso', 'WeightLossWarriors', '2024-07-05', 'Participa en nuestro desafío de pérdida de peso y alcanza tus metas fitness.');


INSERT INTO plan (title, price, info)
VALUES
('Free', 0.00, 'Acceso básico de forma gratuita para siempre. ¡Descubre las funciones esenciales de nuestro servicio hoy!'),
('Bronze', 14.99, 'Plan Bronze con duración mensual. Nuevas funciones cada mes. ¡Mejora ahora!'),
('Silver', 29.99, 'Plan Silver con duración trimestral. Más tiempo, más ventajas. ¡Únete a la exclusividad!'),
('Gold', 49.99, 'Experimenta la grandeza con nuestro plan Gold con duración semestral. Funciones avanzadas y soporte prioritario. ¡Hazte Gold hoy mismo!'),
('Premium', 79.99, 'La cima de la experiencia. Nuestro plan Premium con duración anual te brinda acceso a todas las características. ¡Vive la excelencia con Premium!');

INSERT INTO gym (name, address, phone, email, horary)
VALUES
('Fitness Center A', '123 Main St', '555-1234', 'info@fitnesscentera.com', '8:00 AM - 9:00 PM'),
('Gym Plus', '456 Oak St', '555-5678', 'info@gymplus.com', '6:00 AM - 10:00 PM'),
('FitHub', '789 Pine St', '555-8765', 'info@fithub.com', '7:00 AM - 8:00 PM'),
('Flex Fitness', '101 Cedar St', '555-4321', 'info@flexfitness.com', '9:00 AM - 7:00 PM'),
('Powerhouse Gym', '202 Elm St', '555-9876', 'info@powerhousegym.com', '5:00 AM - 11:00 PM');

INSERT INTO user (name, surname, username, password, address, type, status, gender, email, dni, job_title_worker, phone_num, credit_card, birthday, plan_id) 
VALUES
('John', 'Doe', 'john_doe', 'password123', '123 Main St', 1, 1, 'Male', 'john.doe@example.com', '123456789', 'Manager', '555-1234', '1234-5678-9012-3456', '1990-01-15', 1),
('Alice', 'Smith', 'alice_smith', 'pass123', '456 Oak St', 2, 1, 'Female', 'alice.smith@example.com', '987654321', NULL, '555-5678', '9876-5432-1098-7654', '1985-05-20', 2),
('Bob', 'Johnson', 'bob_johnson', 'securepass', '789 Pine St', 1, 0, 'Male', 'bob.johnson@example.com', '112233445', 'Supervisor', '555-8765', '6543-2109-8765-4321', '1978-11-03', 3),
('Eva', 'Williams', 'eva_williams', 'eva_pass', '101 Cedar St', 2, 1, 'Female', 'eva.williams@example.com', '334455667', NULL, '555-4321', '8765-4321-0987-5678', '1993-08-08', 1),
('Michael', 'Lee', 'michael_lee', 'pass4321', '202 Elm St', 1, 1, 'Male', 'michael.lee@example.com', '889900011', 'Analyst', '555-9876', '4321-0987-7654-3210', '1982-04-25', 2),
('Laura', 'Anderson', 'laura_anderson', 'laura_pass', '303 Maple St', 2, 1, 'Female', 'laura.anderson@example.com', '556677889', NULL, '555-3456', '7654-3210-9876-5432', '1995-02-12', 3),
('Daniel', 'Brown', 'daniel_brown', 'passDaniel', '404 Birch St', 1, 0, 'Male', 'daniel.brown@example.com', '1122334455', 'Technician', '555-6543', '8765-4321-2345-6789', '1989-07-30', 1),
('Sophie', 'Clark', 'sophie_clark', 'sophie123', '505 Oak St', 2, 1, 'Female', 'sophie.clark@example.com', '223344556', NULL, '555-7654', '2345-6789-0123-4567', '1998-09-18', 2),
('Ryan', 'Evans', 'ryan_evans', 'ryan_pass', '606 Pine St', 1, 1, 'Male', 'ryan.evans@example.com', '778899001', 'Assistant', '555-8765', '5678-9012-3456-7890', '1984-12-05', 3),
('Emma', 'Fisher', 'emma_fisher', 'emma_pass', '707 Cedar St', 2, 1, 'Female', 'emma.fisher@example.com', '1122334455', NULL, '555-9876', '8901-2345-6789-0123', '1990-06-23', 1),
('David', 'Garcia', 'david_garcia', 'davidpass', '808 Elm St', 1, 1, 'Male', 'david.garcia@example.com', '3344556677', 'Coordinator', '555-5432', '3456-7890-1234-5678', '1987-03-15', 2),
('Olivia', 'Hall', 'olivia_hall', 'passolivia', '909 Maple St', 2, 1, 'Female', 'olivia.hall@example.com', '8899001122', NULL, '555-6543', '6789-0123-4567-8901', '1992-10-08', 3),
('Henry', 'Irwin', 'henry_irwin', 'henrypass', '101 Pine St', 1, 1, 'Male', 'henry.irwin@example.com', '3344556677', 'Trainer', '555-7654', '1234-5678-9012-3456', '1986-06-20', 1),
('Sophia', 'Johnson', 'sophia_johnson', 'sophiapass', '202 Oak St', 2, 1, 'Female', 'sophia.johnson@example.com', '1122334455', NULL, '555-8765', '4567-8901-2345-6789', '1994-04-02', 2),
('Ethan', 'King', 'ethan_king', 'ethanpass', '303 Birch St', 1, 0, 'Male', 'ethan.king@example.com', '2233445566', 'Assistant', '555-9876', '7890-1234-5678-9012', '1997-12-12', 3);


INSERT INTO class (coach, max_students, sport, horary, num_students_on_class)
VALUES
('Alex Smith', 20, 'Karate', 'Lunes 10:00 AM - 12:00 PM', 0),  
('Emily Johnson', 15, 'Football', 'Martes 2:00 PM - 4:00 PM', 0),
('Daniel Martinez', 10, 'Basketball', 'Miércoles 4:30 PM - 6:30 PM', 0),
('Sophia Brown', 18, 'Swimming', 'Jueves 9:00 AM - 11:00 AM', 0),
('Matthew Taylor', 25, 'Volleyball', 'Viernes 3:00 PM - 5:00 PM', 0),
('Olivia White', 12, 'Gymnastics', 'Sábado 11:30 AM - 1:30 PM', 0),
('David Anderson', 15, 'Tennis', 'Domingo 5:00 PM - 7:00 PM', 0),
('Emma Davis', 10, 'skating', 'Lunes 6:30 PM - 8:30 PM', 0),
('Christopher Wilson', 20, 'Baseball', 'Martes 11:00 AM - 1:00 PM', 0),
('Ava Thompson', 15, 'Handball', 'Miércoles 7:00 PM - 9:00 PM', 0);



INSERT INTO gym_has_user (gym_id, user_id)
VALUES
(2, 1),
(4, 1),
(2, 2),
(3, 3),
(4, 4),
(3, 5),
(4, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(4, 10),
(5, 11),
(4, 12),
(5, 13),
(4, 14),
(4, 15);

INSERT INTO gym_has_class (gym_id, class_id)
VALUES
(1, 1),
(2, 3),
(4, 5),
(1, 8),
(2, 10),
(3, 2),
(1, 4),
(2, 2),
(4, 2),
(1, 3);
    
INSERT INTO class_has_user (class_id, user_id)
VALUES
(1, 1),
(1, 3),
(2, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(5, 11),
(6, 12),
(7, 13),
(7, 14),
(7, 15);

