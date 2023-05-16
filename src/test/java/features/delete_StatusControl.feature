Feature:DeleteStatusControl

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header content-type = 'application/json'

  @delete-username
  Scenario:Delete user with username
    And path '/user/QAtester1'
    When method DELETE

    * status 200
    * print response.message = 'QAtester1'


  @fail-delete-username
  Scenario:Fail Delete user with username
    And path '/user/asdf'
    When method DELETE

    * status 404
