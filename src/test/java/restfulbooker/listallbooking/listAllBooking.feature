Feature: Listado de todas las reservas
  Este servicio es utilizado para el listado de todos los codigos Id
  de las reservas de vuelos de la empresa RestFul Booker

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    @HappyPath
    Scenario: Listado de todos los codigos Id
      Given path '/booking'
      When method GET
      Then status 200