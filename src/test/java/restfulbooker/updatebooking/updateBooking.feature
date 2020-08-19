Feature: Actualizacion de 1 reserva
  Este servicio es utilizado para la actualizacion de 1 reserva
  a traves de la creacion de 1 reserva nueva y la generacion de 1 token
  como prerrequisitos se utilizara el feature de createBooking.feature y
  signIn.feature del directorio common

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    @HappyPath
    Scenario: Actualizacion de 1 reserva recientemente creada
      * def SignInResponse = call read('classpath:common/signIn.feature')
      * def accessToken = SignInResponse.response.token
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      And cookie token = accessToken
      And request
      """
        {
            "firstname" : "Victorio2",
            "lastname" : "Guest",
            "totalprice" : 111,
            "depositpaid" : true,
            "bookingdates" : {
                "checkin" : "2018-01-01",
                "checkout" : "2019-01-01"
            },
            "additionalneeds" : "Breakfast"
        }
      """
      When method PUT
      Then status 200
