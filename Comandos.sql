

-- Inserción en tbl_notas_finales (5 filas afectadas)
INSERT INTO tbl_notas_finales (id_nota_final, Carnet, nota_final) VALUES
(1, '0005-18-12779', 78),
(2, '0005-15-9622', 69),
(3, '0005-15-14297', 89),
(4, '0005-18-4689', 87),
(5, '0005-19-8476', 70);

-- Inserción en tbl_Asistencia (5 filas afectadas)
INSERT INTO tbl_Asistencia (id_Asistencia, Carnet, Fecha, Presente) VALUES
(1, '0005-18-12779', '2023-08-02', 'S'),
(2, '0005-15-9622', '2023-08-02', 'S'),
(3, '0005-15-14297', '2023-08-02', 'S'),
(4, '0005-18-4689', '2023-08-02', 'S'),
(5, '0005-19-8476', '2023-08-02', 'N');

--  Actualizaciones (UPDATE)

-- Actualización de estatus a 'CORRECT' en tbl_alumnos (17 filas afectadas)
UPDATE Tbl_Alumnos
SET estatus = 'CORRECT'
WHERE carnet IN (
    '0005-17-23773', '0005-21-4000', '0005-21-3096', '0005-23-11946', '0005-22-17933',
    '0005-22-19214', '0005-22-12714', '0005-23-2032', '0005-23-18991', '0005-23-13800',
    '0005-23-12520', '0005-23-15564', '0005-23-2062', '0005-24-3011', '0005-24-1699',
    '0005-24-10437', '0005-24-11709', '0005-24-13008', '0005-24-13260', '0005-24-13025',
    '0005-24-14805', '0005-24-15138', '0005-24-1384', '0005-24-16085', '0005-24-16433',
    '0005-24-12748', '0005-24-12745', '0005-24-17512', '0005-24-12750', '0005-24-22822',
    '0005-24-22801', '0005-24-24115'
);

-- Actualización de nota_final a 100 en tbl_notas_finales (1 fila afectada)
UPDATE tbl_notas_finales
SET nota_final = 100
WHERE carnet = '0005-18-12779';

-- Eliminaciones (DELETE)

-- Eliminación de un registro en tbl_alumnos (1 fila afectada)
DELETE FROM tbl_alumnos
WHERE carnet = '0005-18-12779';

-- 4. Selecciones (SELECT)

-- Selección de estatus en tbl_alumnos (146 filas devueltas, posible error de sintaxis)
SELECT estatus
FROM tbl_alumnos
WHERE estatus = '1000'
    [nota]
    [total]
    [nota]
FROM [dbo].[tareas];

--Selección de todos los campos en tbl_alumnos donde seccion = 'A' (37 filas devueltas)

SELECT * FROM tbl_alumnos
WHERE seccion = 'A';

--------------------------------------------------------------------------------
SELECT 
    a.carnet,
    a.Estudiante AS nombre_estudiante,
    nf.nota_final,
    ar.Fecha AS fecha_asistencia_mas_reciente,
    ar.Presente AS asistencia_mas_reciente
FROM 
    dbo.Tb_alumnos a
    LEFT JOIN dbo.Notas_finales nf ON a.carnet = nf.Carnet
    LEFT JOIN (
        
        SELECT 
            Carnet,
            Fecha,
            Presente,
            ROW_NUMBER() OVER (PARTITION BY Carnet ORDER BY Fecha DESC) AS rn
        FROM 
            dbo.Asistencia
    ) ar ON a.carnet = ar.Carnet AND ar.rn = 1
ORDER BY 
    a.carnet;