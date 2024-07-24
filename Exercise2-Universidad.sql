USE universidad;

/*PRIMERAS*/
/* 1 */ SELECT apellido1, apellido2, nombre FROM Persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
/* 2 */ SELECT nombre, apellido2, nombre FROM Persona WHERE tipo = 'alumno' AND telefono IS NULL;
/* 3 */ SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/* 4 */ SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
/* 5 */ SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3  AND id_grado = 7;
/* 6 */ SELECT p.nombre, p.apellido1, p.apellido2, d.nombre FROM persona p JOIN profesor pr on p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id  WHERE tipo = 'profesor' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC ;
/* 7 */ SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id JOIN persona p ON asma.id_alumno = p.id WHERE p.nif= '26902806M';
/* 8 */ SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id_grado = 4;
/* 9 */ SELECT DISTINCT p.nombre FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno WHERE tipo = 'alumno' AND asma.id_asignatura IS NOT NULL AND asma.id_curso_escolar = 5;

/*LEFT RIGHT JOINS*/

/* 1 */ SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM departamento d RIGHT JOIN profesor pr ON d.id = pr.id_departamento RIGHT JOIN persona p ON pr.id_profesor = p.id ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido1 ASC, p.nombre ASC;
/* 2 */ SELECT * FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE pr.id_departamento IS NULL AND p.tipo ='profesor';
/* 3 */ SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;
/* 4 */ SELECT p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.id IS NULL;
/* 5 */ SELECT a.nombre FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
/* 6 */ SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura asma ON pr.id_profesor = asma.id_asignatura WHERE pr.id_profesor IS NULL AND asma.id_curso_escolar IS NULL;

/* RESUM */

/* 1 */ SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
/* 2 */ SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/* 3 */ SELECT d.nombre, COUNT(pr.id_profesor) FROM departamento d RIGHT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NOT NULL GROUP BY d.nombre ORDER BY COUNT(pr.id_profesor) DESC;
/* 4 */ SELECT d.nombre, COUNT(pr.id_profesor) FROM profesor pr RIGHT JOIN departamento d ON pr.id_departamento = d.id  JOIN persona p ON pr.id_profesor = p.id WHERE p.tipo = 'profesor' GROUP BY d.nombre;
/* 5 */ SELECT g.nombre, COUNT(a.id) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre;
/* 6 */ SELECT g.nombre, COUNT(a.id) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) >= 40;
/* 7 */
/* 8 */
/* 9 */
/* 10 */
/* 11 */
