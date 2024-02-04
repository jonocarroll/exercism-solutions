module main

fn age(seconds f64, planet string) !f64 {
	// age should return an error if the planet is not one of the 8 listed
	// Mercury: orbital period 0.2408467 Earth years
	// Venus: orbital period 0.61519726 Earth years
	// Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
	// Mars: orbital period 1.8808158 Earth years
	// Jupiter: orbital period 11.862615 Earth years
	// Saturn: orbital period 29.447498 Earth years
	// Uranus: orbital period 84.016846 Earth years
	// Neptune: orbital period 164.79132 Earth years
	earth_s := f64(31557600)
	s := match planet.to_lower() {
		'mercury' { seconds / ( 0.2408467 * earth_s ) }
		'venus' { seconds / ( 0.61519726 * earth_s ) }
		'earth' { seconds / earth_s }
		'mars' { seconds / ( 1.8808158 * earth_s ) }
		'jupiter' { seconds / ( 11.862615  * earth_s ) }
		'saturn' { seconds / ( 29.447498 * earth_s ) }
		'uranus' { seconds / ( 84.016846 * earth_s ) }
		'neptune' { seconds / ( 164.79132 * earth_s ) }
		else { return error('${planet} is not a valid planet') }
	}
	return s
}
