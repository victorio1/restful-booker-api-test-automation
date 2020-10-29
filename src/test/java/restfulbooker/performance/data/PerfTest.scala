package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  val protocol = karateProtocol()

//  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  val singin = scenario("signin").exec(karateFeature("classpath:restfulbooker/performance/data/signin.feature"))
//  val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
//    singin.inject(rampUsers(10) during (5 seconds)).protocols(protocol),
//    delete.inject(rampUsers(5) during (5 seconds)).protocols(protocol)
    singin.inject(atOnceUsers(10)).protocols(protocol)
  )

}