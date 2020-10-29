Feature: Create Booking
  Este servicio es utilizado para la generacion del token
  donde el usuario se logueara al servicio realizando un sigin

  Background:
    * url baseUrl
    * header Accept = 'application/json'


  Scenario: Inicio de Sesion con UserName y Password correctos
    Given path '/auth'
    And request
      """
        {
          "username" : "admin",
          "password" : "password123"
        }
      """
    When method POST
    Then status 200
#    And def authToken = response.token