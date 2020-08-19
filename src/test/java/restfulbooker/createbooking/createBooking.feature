Feature: Create Booking
 Este servicio es utilizado para el registro de las reservas
 de vuelos de la empresa RestFul Booker

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Creacion de 1 reserva con todos los datos correctos
    Given path '/booking'
    And request
    """
   {
      "firstname" : "Jim",
      "lastname" : "Brown",
      "totalprice" : 111,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2018-01-01",
          "checkout" : "2019-01-01"
      },
      "additionalneeds" : "Breakfast"
  }
    """
    When method POST
    Then status 200

