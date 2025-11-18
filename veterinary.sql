CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

 INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) VALUES
    (1, 'Maria', 'Santos', '123 Mabini St, Manila', '09171234567', 'maria.santos@example.com'),
    (2, 'John', 'Reyes', '45 Bonifacio Ave, Quezon City', '09283456712', 'john.reyes@example.com'),
    (3, 'Carlos', 'Dizon', '78 Luna St, Pasig', '09351239876', 'carlos.dizon@example.com'),
    (4, 'Anna', 'Lopez', '10 Rivera Rd, Makati', '09562347812', 'anna.lopez@example.com'),
    (5, 'Mark', 'Villanueva', '56 Roxas Blvd, Manila', '09184562378', 'mark.villanueva@example.com'),
    (6, 'Sophie', 'Cruz', '89 Ortigas Center, Pasig', '09278934561', 'sophie.cruz@example.com'),
    (7, 'Daniel', 'Torres', '34 Aurora Blvd, San Juan', '09451234987', 'daniel.torres@example.com'),
    (8, 'Laura', 'Garcia', '67 Katipunan Ave, QC', '09173459821', 'laura.garcia@example.com'),
    (9, 'Patrick', 'Mendoza', '90 Dapitan St, Manila', '09384561237', 'patrick.mendoza@example.com'),
    (10, 'Eleanor', 'Castro', '22 Quirino Hwy, Caloocan', '09573412895', 'eleanor.castro@example.com');
    
ALTER TABLE owners
ADD COLUMN registereddate DATE;

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
    (1, 'Leo', 'Dog', 'Labrador', '2019-03-15', 'Male', 'Yellow', 1),
    (2, 'Mark', 'Cat', 'Persian', '2020-07-10', 'Male', 'White', 2),
    (3, 'Gee-Anne', 'Dog', 'Beagle', '2018-11-25', 'Female', 'Tricolor', 3),
    (4, 'Simba', 'Cat', 'Siamese', '2021-01-05', 'Male', 'Cream', 4),
    (5, 'Shenna', 'Dog', 'Poodle', '2017-04-18', 'Female', 'Black', 5),
    (6, 'Coco', 'Bird', 'Parrot', '2022-02-14', 'Female', 'Green', 6),
    (7, 'Rio', 'Dog', 'Bulldog', '2016-08-20', 'Male', 'Brown', 7),
    (8, 'Bella', 'Cat', 'British Shorthair', '2019-09-09', 'Female', 'Gray', 8),
    (9, 'Max', 'Rabbit', 'Holland Lop', '2021-06-30', 'Male', 'White', 9),
    (10, 'Nala', 'Dog', 'Golden Retriever', '2020-12-12', 'Female', 'Golden', 10);

SELECT STRING_AGG(DISTINCT species, ' and ') AS species_catered
FROM animals
WHERE species IN ('Dog', 'Cat');

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES
(1, 1, '2025-01-05', 'Vaccination'),
(2, 2, '2025-01-08', 'Dental cleaning'),
(3, 3, '2025-01-10', 'Skin allergy check-up'),
(4, 4, '2025-01-12', 'Annual wellness exam'),
(5, 5, '2025-01-14', 'Limping - leg examination'),
(6, 6, '2025-01-17', 'Follow-up vaccine booster'),
(7, 7, '2025-01-20', 'Ear infection evaluation'),
(8, 8, '2025-01-22', 'Routine check-up'),
(9, 9, '2025-01-25', 'Surgery follow-up'),
(10, 10, '2025-01-28', 'Behavioral consultation');

DELETE FROM appointments
WHERE animalid = (
    SELECT animalid FROM animals
    WHERE name = 'Simba'
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
    (1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
    (2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
    (3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
    (4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
    (5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
    (6, 'Dr.Carmen', 'Fernandez', 'Ophthalmolog y Specialist', '333-222-1111', 'carmen@example.com'),
    (7, 'Dr.Ariel', 'Santiago', 'Exotic Animal Specialist', '444-333-2222', 'ariel@example.com'),
    (8, 'Dr.Ramon', 'Delgado', 'Cardiology Specialist', '666-777-8888', 'ramon@example.com'),
    (9, 'Dr.Julia', 'Martinez', 'Internal Medicine Specialist', '555-444-2222', 'julia@example.com'),
    (10, 'Dr.Paolo', 'Cruz', 'Equine Specialist', '777-666-5555', 'paolo@example.com');

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE dfirstname = 'Dr.Sofia';

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate DATE,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

SELECT SUM(amount) AS total_sales
FROM payments;

CREATE TABLE medical_records (
    recordid INT PRIMARY KEY,                      
    animalid INT,                         
    doctorid INT,                      
    record_date TIMESTAMP,                
    diagnosis TEXT,                                
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');
