Feature: Creación de mascotas


  Scenario: validar que se pueda crear una mascota a través de servicio
    Given url 'https://petstore.swagger.io/v2/pet'
    And request {'id': 123456789,'category': {'id': 0,'name': 'CANES'},'name': 'FIRULAIS','photoUrls':['string'],'tags':[{'id': 0,'name': 'string'}],'status': 'available'}
    When method post
    Then status 200

  Scenario: validar que se pueda consultar una mascota
    Given url 'https://petstore.swagger.io/v2/pet/123456789'
    When method get
    Then status 200
    * def categoria = response.category.name
    * def name = response.name
    * assert categoria == 'CANES'
    * assert name == 'FIRULAIS'

  Scenario: validar que se pueda modificar una mascota a través de servicio
    Given url 'https://petstore.swagger.io/v2/pet'
    And request {  "id": 123456789,  "category": {  "id": 0,  "name": "FELINOS"  },  "name": "TOM",  "photoUrls": [  "string"  ],  "tags": [  {  "id": 0,  "name": "string"  }  ],  "status": "sold"  }
    When method PUT
    Then status 200
    * def categoria = response.category.name
    * def name = response.name
    * def status = response.status
    * assert categoria == 'FELINOS'
    * assert status == 'sold'

  Scenario: validar que se pueda consultar una mascota
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method get
    Then status 200

