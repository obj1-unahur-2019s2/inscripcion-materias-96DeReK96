class Estudiante {
	var property nombre
	var property materias = []
	method registrarAprobacion(materia, nota) {
		var nuevoAprobacion = new Aprobacion(nota = nota, materia = materia)
		materias.add(nuevoAprobacion)
	}
}
class Aprobacion {
	var property nota
	var property materia
	
}