-- todas
SELECT nombre FROM producto;
SELECT nombre, precio  FROM producto;
SELECT * FROM producto;
SELECT nombre, precio AS €, round((precio*1.08),2) AS USD FROM producto;
SELECT nombre AS "Producto", precio AS "Euros", round((precio*1.08),2) AS "Dolares norteamericanos" FROM producto;
SELECT UPPER(nombre) AS Nombre_Mayuscula, precio FROM producto;
SELECT LOWER(nombre) AS Nombre_Minuscula, precio FROM producto;
SELECT nombre, LEFT(UPPER(nombre),2) FROM fabricante;
SELECT nombre, ROUND(precio, 2) FROM producto;
SELECT nombre, round(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto GROUP BY precio ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto GROUP BY precio ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante  = 2;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo AS 'codigo producto', p.nombre AS 'producto', p.precio, f.codigo AS 'codigo fabricante', f.nombre AS 'nombre fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS 'producto', p.precio, f.nombre AS 'fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo  ORDER BY p.precio ASC LIMIT 1; 
SELECT p.nombre AS 'producto', p.precio, f.nombre 'fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo  ORDER BY p.precio DESC LIMIT 1; 
SELECT p.nombre AS 'producto', f.nombre AS 'fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante = 2; 
SELECT p.nombre AS 'producto', p.precio, f.nombre AS 'fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante = 6 AND p.precio > 200; 
SELECT p.nombre AS 'producto', f.nombre AS 'fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante = 1 OR p.codigo_fabricante = 3 OR p.codigo_fabricante = 5;
SELECT p.nombre AS 'producto', f.nombre AS 'fabricante' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante IN (1, 3, 5);
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >=180 GROUP BY p.precio, p.nombre ORDER BY p.precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.nombre AS 'fabricante', p.nombre AS 'producto' FROM fabricante f LEFT JOIN producto p ON  f.codigo = p.codigo_fabricante;
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON  f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'));
SELECT nombre FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')); 
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

--   universidad (todas)
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN alumno_se_matricula_asignatura alu ON p.id = alu.id_alumno WHERE YEAR(p.fecha_nacimiento) = 1999;
SELECT p.apellido1, p.apellido2, p.nombre, p.telefono, p.nif FROM persona p JOIN profesor pro ON p.id = pro.id_profesor
 WHERE p.telefono IS NULL AND p.nif REGEXP 'K$';
SELECT * FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre  FROM persona p JOIN profesor pro ON p.id = pro.id_profesor JOIN departamento d  ON d.id = pro.id_departamento ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin  FROM alumno_se_matricula_asignatura alu JOIN asignatura a ON alu.id_asignatura = a.id JOIN curso_escolar ce ON alu.id_curso_escolar = ce.id JOIN persona p ON alu.id_alumno = p.id WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor pro ON pro.id_departamento = d.id JOIN asignatura a ON pro.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura alu ON alu.id_alumno = p.id JOIN asignatura a ON alu.id_asignatura = a.id JOIN curso_escolar ce ON  alu.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019; 

-- joins right y left (todas)
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM profesor pro JOIN persona p ON pro.id_profesor = p.id LEFT JOIN departamento d ON pro.id_departamento = d.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.nombre, p.apellido1, p.apellido2 FROM profesor pro LEFT JOIN departamento d ON pro.id_departamento = d.id JOIN persona p ON pro.id_profesor = p.id WHERE d.id IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento WHERE pro.id_profesor IS NULL;
SELECT pro.id_profesor, p.nombre, p.apellido1, p.apellido2 FROM profesor pro JOIN persona p ON pro.id_profesor = p.id LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT a.id, a.nombre FROM asignatura a LEFT JOIN profesor pro ON a.id_profesor = pro.id_profesor WHERE pro.id_profesor IS NULL;
SELECT DISTINCT d.id, d.nombre FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura alu ON a.id = alu.id_asignatura LEFT JOIN curso_escolar ce ON alu.id_curso_escolar = ce.id WHERE ce.id IS NULL;

-- consultas generales (todas)
SELECT COUNT(DISTINCT p.id) as total_alumnos FROM persona p WHERE p.tipo = 'alumno';
SELECT COUNT(*) AS 'Nacidos en 1999' FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = 'alumno' ;
SELECT d.nombre, COUNT(*) AS cantidad_profesores FROM profesor pro JOIN departamento d ON pro.id_departamento = d.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;
SELECT d.nombre, COUNT(pro.id_profesor) AS cantidad_profesores FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento GROUP BY d.nombre ORDER BY cantidad_profesores DESC;
SELECT g.nombre, COUNT(a.id) AS 'cantidad_asignaturas'  FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY cantidad_asignaturas DESC;
SELECT g.nombre, COUNT(a.id) AS cantidad_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY cantidad_asignaturas DESC;
SELECT g.nombre, a.tipo, SUM(a.creditos) AS suma_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(DISTINCT alu.id_alumno)  FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura alu ON ce.id = alu.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id_profesor) AS cantidad_asignaturas FROM persona p JOIN profesor pro ON p.id = pro.id_profesor LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY cantidad_asignaturas DESC;
SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN profesor pro ON p.id = pro.id_profesor JOIN departamento d ON pro.id_departamento = d.id LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor GROUP BY p.id HAVING COUNT(a.id) = 0;