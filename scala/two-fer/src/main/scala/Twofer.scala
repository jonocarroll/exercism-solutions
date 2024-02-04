object Twofer {
  def twofer(name: String = null): String = {
    val resolvedName = Option(name).getOrElse("you")
    "One for " + resolvedName + ", one for me."
  }
}
