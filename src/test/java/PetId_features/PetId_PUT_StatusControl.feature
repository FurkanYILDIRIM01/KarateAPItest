Feature:Petid-Put-StatusControl

  Background:
    * url 'https://petstore.swagger.io'
    * header  content-type = 'application/json'
    * def jsonPath = '../json/'

  @put-pet-with-id-update
  Scenario:Put pet with id update
    * def jsonBody = read(jsonPath + 'PetPutInfo.json')
    * jsonBody.id = '123654789'
    * jsonBody.name = 'fyfy'
    * jsonBody.status = 'no'
    And path '/v2/pet'
    * request jsonBody
    When method PUT

    * status 200
    * print response
