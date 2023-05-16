Feature:PostStatusControl
  Background:
    * url 'https://petstore.swagger.io'
    * header  content-type = 'application/json'
    * def jsonPath = '../json/'

  @create-user
  Scenario:Create User

    * def jsonBody = read(jsonPath + 'Userinfo.json')
    * jsonBody.username = 'fyfyfy'
    * jsonBody.firstName = 'furkan'
    * jsonBody.lastName = 'yıldırım'
    * jsonBody.email = 'abc@gmail.com'
    * jsonBody.password = '999'
    * jsonBody.phone = '0505'
    * jsonBody.userStatus = '1'

    And path 'v2/user'
    * request jsonBody
    When method POST

    * status 200
    * print response

  @not-create-order
  Scenario: Not Create order

    And path '/v2/store/order'
    * request null
    When method POST

    * status 400
    * print response
    * assert response.type == 'error'
    * print response.message= 'No data'
