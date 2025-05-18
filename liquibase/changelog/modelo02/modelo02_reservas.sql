-- Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    tiempo_id INT IDENTITY(1,1) PRIMARY KEY,
    mes INT NOT NULL,
    trimestre INT NOT NULL,
    año INT NOT NULL
);

-- Dimensión Cliente
CREATE TABLE Dim_Cliente (
    cliente_id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_cliente NVARCHAR(50) NOT NULL,
    direccion NVARCHAR(200)
);

-- Dimensión Agencia
CREATE TABLE Dim_Agencia (
    agencia_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_agencia NVARCHAR(100) NOT NULL,
    operador_turistico NVARCHAR(100) NOT NULL
);

-- Dimensión Destino
CREATE TABLE Dim_Destino (
    destino_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_destino NVARCHAR(100) NOT NULL,
    pais NVARCHAR(50) NOT NULL
);

-- Tabla de Hechos Reservas
CREATE TABLE Hecho_Reserva (
    reserva_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    cliente_id INT NOT NULL,
    agencia_id INT NOT NULL,
    destino_id INT NOT NULL,
    costo_reserva DECIMAL(10,2) NOT NULL,
    cantidad_reservas INT NOT NULL DEFAULT 1,
    FOREIGN KEY (tiempo_id) REFERENCES Dim_Tiempo(tiempo_id),
    FOREIGN KEY (cliente_id) REFERENCES Dim_Cliente(cliente_id),
    FOREIGN KEY (agencia_id) REFERENCES Dim_Agencia(agencia_id),
    FOREIGN KEY (destino_id) REFERENCES Dim_Destino(destino_id)
);

-- Índices para mejorar el rendimiento de consultas
CREATE INDEX idx_hecho_reserva_tiempo ON Hecho_Reserva(tiempo_id);
CREATE INDEX idx_hecho_reserva_cliente ON Hecho_Reserva(cliente_id);
CREATE INDEX idx_hecho_reserva_agencia ON Hecho_Reserva(agencia_id);
CREATE INDEX idx_hecho_reserva_destino ON Hecho_Reserva(destino_id);
GO