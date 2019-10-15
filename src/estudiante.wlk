class Estudiante {
	var property materiasAprobadas = []
	var property carreras = []
	var property materiasInscripto = []
//	var materiasInscriptos = [] 
	method registrarAprobacion(materia, nota) {
		var nuevoAprobacion = new Aprobacion(materia = materia, nota = nota)
		if( not materiasAprobadas.any({aprob => aprob.materia() == materia})) {
			materiasAprobadas.add(nuevoAprobacion)
		} else {
			self.error("Ya esta aprobada")
		}
	}
	method materiasDeLasCarrerasInscriptos() {
		return carreras.flatMap({car => car.materias()})
	}
	method tieneAprobadaLa(materia) {
		return materiasAprobadas.any({mat => mat.materia() == materia})
	}
	method cantidadDeMateriasAprobadas() {
		return materiasAprobadas.size()
	}
	method promedio() {
		var laSumaDeMateriasAprobadas = materiasAprobadas.sum({mat => mat.nota()})
		return laSumaDeMateriasAprobadas / self.cantidadDeMateriasAprobadas()
	}
	method puedeInscribirseA(materia) {
		return self.laMateriaCorrespondeACarrera(materia) and self.noEstaInscrito(materia)
		and self.noEstaAprobada(materia) and self.aproboLosRequisitos(materia)
	}
	method inscribirseACarrera(carrera) {
		carreras.add(carrera)
	}
	method laMateriaCorrespondeACarrera(materia) {
		return carreras.any({m => m.materias() == materia})
	}
	method noEstaInscrito(materia) {
		return not materiasInscripto.contains(materia)
	}
	method noEstaAprobada(materia) {
		return not self.tieneAprobadaLa(materia)
	}
	method aproboLosRequisitos(materia) {
		var requisitos = materia.requisitos()
		return materiasAprobadas.any({m => m.materia() == requisitos})
	}
	
}
class Aprobacion {
	var property nota
	var property materia
	
}


class Carreras {
	var property materias = #{}
}

class Materia {
	var property requisitos = [] 
}


