Feature: GetStatusControl

  Background:
    * url 'https://petstore.swagger.io'
    * header  content-type = 'application/json'

  @get-username
  Scenario: Get username

    And path '/v2/user/QAtester1'
    When method GET

    * status 200
   # * assert response.type == 'error'





