-- Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    tiempo_id INT IDENTITY(1,1) PRIMARY KEY,
    mes INT NOT NULL,
    año INT NOT NULL
);

-- Dimensión Grupo Centro de Costos
CREATE TABLE Dim_GrupoCentroCosto (
    grupo_centro_costo_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_grupo NVARCHAR(100) NOT NULL,
    modo_transporte NVARCHAR(50)
);

-- Dimensión Destino
CREATE TABLE Dim_Destino (
    destino_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_destino NVARCHAR(100) NOT NULL,
    pais NVARCHAR(50) NOT NULL
);

-- Dimensión Modo de Transporte
CREATE TABLE Dim_ModoTransporte (
    modo_transporte_id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_transporte NVARCHAR(50) NOT NULL
);

-- Dimensión Grupo de Lote
CREATE TABLE Dim_GrupoLote (
    grupo_lote_id INT IDENTITY(1,1) PRIMARY KEY,
    descripcion_grupo NVARCHAR(200) NOT NULL
);

-- Tabla de Hechos Envíos
CREATE TABLE Hecho_Envio (
    envio_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    grupo_centro_costo_id INT NOT NULL,
    destino_id INT NOT NULL,
    modo_transporte_id INT NOT NULL,
    grupo_lote_id INT NOT NULL,
    costo_total DECIMAL(12,2) NOT NULL,
    peso_total DECIMAL(10,2) NOT NULL,
    cantidad_lotes INT NOT NULL,
    FOREIGN KEY (tiempo_id) REFERENCES Dim_Tiempo(tiempo_id),
    FOREIGN KEY (grupo_centro_costo_id) REFERENCES Dim_GrupoCentroCosto(grupo_centro_costo_id),
    FOREIGN KEY (destino_id) REFERENCES Dim_Destino(destino_id),
    FOREIGN KEY (modo_transporte_id) REFERENCES Dim_ModoTransporte(modo_transporte_id),
    FOREIGN KEY (grupo_lote_id) REFERENCES Dim_GrupoLote(grupo_lote_id)
);

-- Índices para mejorar el rendimiento de consultas
CREATE INDEX idx_hecho_envio_tiempo ON Hecho_Envio(tiempo_id);
CREATE INDEX idx_hecho_envio_grupo ON Hecho_Envio(grupo_centro_costo_id);
CREATE INDEX idx_hecho_envio_destino ON Hecho_Envio(destino_id);
GO