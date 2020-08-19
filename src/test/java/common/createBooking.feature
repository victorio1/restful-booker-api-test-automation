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
      "firstname" : "Eduardo",
      "lastname" : "Victorino",
      "totalprice" : 120,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2019-02-03",
          "checkout" : "2020-02-04"
      },
      "additionalneeds" : "Breakfast"
  }
    """
    When method POST
    Then status 200