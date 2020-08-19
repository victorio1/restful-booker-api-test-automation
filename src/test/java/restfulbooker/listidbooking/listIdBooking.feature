Feature: Listado de todas las reservas
  Este servicio es utilizado para el listado de 1 reserva
  a traves de la creacion de 1 reserva nueva como prerrequisito
  se utilizara el feature de createBooking.feature del directorio
  common

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Listado de 1 reserva recientemente creada
    * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
    * def bookingId = CreateBookingResponse.response.bookingid
    Given path '/booking/' + bookingId
    When method GET
    Then status 200