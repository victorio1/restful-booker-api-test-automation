Feature:  Eliminar 1 reserva
  Este servicio es utilizado para eliminar 1 reserva recienmente
  creada a traves de la creacion de 1 reserva nueva y la
  generacion de 1 token como prerrequisitos, se utilizara el feature
  de createBooking.feature y signIn.feature del directorio common

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def sleep = function(ms){ java.lang.Thread.sleep(ms)}
    * def pause = karate.get('__gatling.pause',sleep)

    @HappyPath
    Scenario:
      * def SignInResponse = call read('classpath:common/signIn.feature')
      * def accessToken = SignInResponse.response.token
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid

      * pause(5000)

      Given path '/booking/' + bookingId
      And cookie token = accessToken
      When method DELETE
      Then status 201