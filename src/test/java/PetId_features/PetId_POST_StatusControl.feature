Feature:Petid-Pos-StatusControl

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header content-type = 'application/json'
    * def jsonPath = '../json/'

  @post-petID
  Scenario: Post petID

    * def jsonBody = read(jsonPath + 'Petinfo.json')
    * jsonBody.petId = 456
    * jsonBody.name = 'kedi'
    * jsonBody.status = 'besleniyor'

    And path '/pet/petId'
    * request jsonBody
    When method POST

    * status 404
    * print response

  @Create-Order
  Scenario: Create Order
    * def jsonBody = read(jsonPath + 'storeOrderinfo.json')
    * jsonBody.id = '123'
    * jsonBody.petId = '456'
    * jsonBody.quantity = '3'
    * jsonBody.shipDate = '2023-04-26T18:56:12.772+0000'
    * jsonBody.status = 'placed'
    * jsonBody.complete = true


    And path '/store/order'
    * request jsonBody
    When method POST

    * status 200
    * print response

