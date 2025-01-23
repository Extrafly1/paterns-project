CREATE TABLE student (
    id INT IDENTITY(1,1) PRIMARY KEY,
    surname NVARCHAR(255),
    name NVARCHAR(255),
    patronymic NVARCHAR(255),
    birth_date DATE,
    phone NVARCHAR(20),
    email NVARCHAR(255),
    git NVARCHAR(255),
    telegram NVARCHAR(50)
);