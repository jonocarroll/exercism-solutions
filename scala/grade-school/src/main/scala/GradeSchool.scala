import scala.collection.immutable.SortedMap

class School {
  type DB = Map[Int, Seq[String]]

  var roster: DB = Map()

  def add(name: String, g: Int) = {
    roster += (g -> (roster.getOrElse(g, Seq()) :+ name))
  }

  def db: DB = roster

  def grade(g: Int): Seq[String] = {
    roster.getOrElse(g, Seq())
  }

  def sorted: DB = {
    SortedMap[Int, Seq[String]]() ++ roster.mapValues(_.sorted).toMap
  }
}

