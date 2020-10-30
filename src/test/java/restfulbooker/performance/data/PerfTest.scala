package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  val protocol = karateProtocol(
    "/booking/{bookingId}" -> Nil
  )

  val csvFeeder = csv("foo.csv")

//  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  val deleteBooking = scenario("DeleteBooking").exec(karateFeature("classpath:restfulbooker/performance/data/deleteBooking.feature"))
//  val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
//    singin.inject(rampUsers(10) during (5 seconds)).protocols(protocol),
//    delete.inject(rampUsers(5) during (5 seconds)).protocols(protocol)
    deleteBooking.inject(
      atOnceUsers(10),
      nothingFor(4 seconds),
      constantUsersPerSec(1) during (10 seconds),
      constantUsersPerSec(2) during (10 seconds),
      rampUsersPerSec(2) to 10 during (20 seconds),
      nothingFor(4 seconds),
      constantUsersPerSec(1) during (5 seconds)
    ).protocols(protocol)
  )

}