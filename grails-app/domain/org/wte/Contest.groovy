package org.wte

class Contest {

	static hasMany = [winners:Winner]

	String key
	Integer year
	Integer month
	Integer dayOfMonth
	
	static constraints = {
		key unique: true, blank: false
	}
	
	String monthDescription(){
		Integer contestMonth = this.month - 1
		switch ( contestMonth ) {
		    case -1:
				return "Diciembre"
			case 0:
		        return "Enero"
		    case 1:
			    return "Febrero"
			case 2:
				return "Marzo"
			case 3:
				return "Abril"
			case 4:
				return "Mayo"
			case 5:
				return "Junio"
			case 6:
				return "Julio"
			case 7:
				return "Agosto"
		    case 8:
		        return "Septiembre"
			case 9:
			    return "Octubre"
			case 10:
				return "Noviembre"
		}
	}
	
}