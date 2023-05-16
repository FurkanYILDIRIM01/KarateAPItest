Feature:Petid-Get-StatusControl

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header content-type = 'application/json'


  @get-petID
  Scenario: Get petID

    And path '/v2/pet/123654789'
    When method GET

    * status 404
    * print response

  @get-orderId
  Scenario: Get orderID

    And path '/store/order/123'
    When method GET

    * status 200
    * print response