-- Creación de la base de datos para el modelo de Gestión de Proyectos
CREATE DATABASE dw_gestion_proyectos;
GO

USE dw_gestion_proyectos;
GO

-- Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    tiempo_id INT IDENTITY(1,1) PRIMARY KEY,
    dia INT NOT NULL,
    mes INT NOT NULL,
    año INT NOT NULL
);

-- Dimensión Cliente
CREATE TABLE Dim_Cliente (
    cliente_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_cliente NVARCHAR(100) NOT NULL
);

-- Dimensión Responsable
CREATE TABLE Dim_Responsable (
    responsable_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_responsable NVARCHAR(100) NOT NULL,
    telefono NVARCHAR(20)
);

-- Dimensión Localidad
CREATE TABLE Dim_Localidad (
    localidad_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_localidad NVARCHAR(100) NOT NULL,
    pais NVARCHAR(50) NOT NULL
);

-- Dimensión Proyecto
CREATE TABLE Dim_Proyecto (
    proyecto_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_proyecto NVARCHAR(200) NOT NULL
);

-- Tabla de Hechos Proyectos
CREATE TABLE Hecho_Proyecto (
    hecho_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    cliente_id INT NOT NULL,
    responsable_id INT NOT NULL,
    localidad_id INT NOT NULL,
    proyecto_id INT NOT NULL,
    costo_total DECIMAL(12,2) NOT NULL,
    duracion_dias INT NOT NULL,
    cantidad_paquetes INT NOT NULL,
    FOREIGN KEY (tiempo_id) REFERENCES Dim_Tiempo(tiempo_id),
    FOREIGN KEY (cliente_id) REFERENCES Dim_Cliente(cliente_id),
    FOREIGN KEY (responsable_id) REFERENCES Dim_Responsable(responsable_id),
    FOREIGN KEY (localidad_id) REFERENCES Dim_Localidad(localidad_id),
    FOREIGN KEY (proyecto_id) REFERENCES Dim_Proyecto(proyecto_id)
);

-- Índices para mejorar el rendimiento de consultas
CREATE INDEX idx_hecho_proyecto_tiempo ON Hecho_Proyecto(tiempo_id);
CREATE INDEX idx_hecho_proyecto_cliente ON Hecho_Proyecto(cliente_id);
CREATE INDEX idx_hecho_proyecto_responsable ON Hecho_Proyecto(responsable_id);
CREATE INDEX idx_hecho_proyecto_localidad ON Hecho_Proyecto(localidad_id);
CREATE INDEX idx_hecho_proyecto_proyecto ON Hecho_Proyecto(proyecto_id);
GO