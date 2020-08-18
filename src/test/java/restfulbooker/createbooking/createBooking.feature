Feature: Create Booking
 Este servicio es utilizado para el registro de las reservas
 de vuelos de la empresa RestFul Booker

  Background:
    * url baseUrl

  Scenario: Creacion de 1 reserva con todos los datos correctos
    Given path '/booking'
    And request
    """
      {
      "firstname" : "Eduardo",
      "lastname" : "Victorio",
      "totalprice" : 120,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2018-02-03",
          "checkout" : "2019-03-02"
      }
    }
    """
    When method POST
    Then status 200

