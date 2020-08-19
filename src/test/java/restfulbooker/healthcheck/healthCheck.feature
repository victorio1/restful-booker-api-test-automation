Feature: Health Check
  Este servicio es utilizado para un health check de verificación de
  estado simple para confirmar si la API está en funcionamiento.

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    @HappyPath
    Scenario: Health Check para confirmar el estado ok de la API
      Given path '/ping'
      When method GET
      Then status 201