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

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate DATE,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

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