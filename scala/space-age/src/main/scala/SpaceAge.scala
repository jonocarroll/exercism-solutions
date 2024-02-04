object SpaceAge {

  val earthYear = 31557600

  def onEarth(age: Double): Double = age / earthYear / 1

  def onVenus(age: Double): Double = age / earthYear / 0.61519726

  def onMercury(age: Double): Double = age / earthYear / 0.2408467

  def onMars(age: Double): Double = age / earthYear / 1.8808158

  def onJupiter(age: Double): Double = age / earthYear / 11.862615

  def onSaturn(age: Double): Double = age / earthYear / 29.447498

  def onUranus(age: Double): Double = age / earthYear / 84.016846

  def onNeptune(age: Double): Double = age / earthYear / 164.79132
}
 
