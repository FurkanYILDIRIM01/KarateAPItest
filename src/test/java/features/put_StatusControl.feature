Feature:PutStatusControl

  Background:
    * url 'https://petstore.swagger.io'
    * header  content-type = 'application/json'
    * def jsonPath = '../json/'

  @put-user-with-username-update
  Scenario:Put user with username update

    * def jsonBody = read(jsonPath + 'Userinfo.json')
    * jsonBody.username = 'QAtester1'
    * jsonBody.firstName = 'furkan'
    * jsonBody.lastName = 'yıldırım'
    * jsonBody.email = 'fy@gmail.com'
    * jsonBody.password = '789456'
    * jsonBody.phone = '0505'
    * jsonBody.userStatus = '1'

    And path 'v2/user/QAtester1'
    * request jsonBody
    When method PUT

    * status 200
    * print response