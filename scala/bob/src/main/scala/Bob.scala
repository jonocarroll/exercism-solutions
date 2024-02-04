object Bob {

  def containsUpper(s: String) = s.find(_.isUpper).isDefined
  def containsLower(s: String) = s.find(_.isLower).isDefined
  def containsQuestion(s: String) = s.endsWith("?")

  def shout(s: String) = containsUpper(s) && !containsLower(s)

  def response(statement: String): String = {
    val s = statement.trim
    (s.isEmpty, containsQuestion(s), shout(s)) match {
      case (true, _, _) => "Fine. Be that way!"
      case (_, true, true) => "Calm down, I know what I'm doing!"
      case (_, true, _) => "Sure."
      case (_, _, true) => "Whoa, chill out!"
      case _ => "Whatever."
    }
  }
}
