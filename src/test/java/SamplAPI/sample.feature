Feature: all sample requests


  Background: initializing required variables
    * def myUrl = 'https://reqres.in'
    * def myPath = '/api/users'

  @listUsers
  Scenario: to test the get all user request lists users successfully
 #   Given url 'https://reqres.in'
    Given url myUrl
    And path '/api/users'
    And param  page = 2
    When method get
    Then status 200
    Then match response !=
    """
    {
    "page": 2,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
        {
            "id": 7,
            "email": "michael.lawson@reqres.in",
            "first_name": "Michael",
            "last_name": "Lawson",
            "avatar": "https://reqres.in/img/faces/7-image.jpg"
        },
        {
            "id": 8,
            "email": "lindsay.ferguson@reqres.in",
            "first_name": "Lindsay",
            "last_name": "Ferguson",
            "avatar": "https://reqres.in/img/faces/8-image.jpg"
        },
        {
            "id": 9,
            "email": "tobias.funke@reqres.in",
            "first_name": "Tobias",
            "last_name": "Funke",
            "avatar": "https://reqres.in/img/faces/9-image.jpg"
        },
        {
            "id": 10,
            "email": "byron.fields@reqres.in",
            "first_name": "Byron",
            "last_name": "Fields",
            "avatar": "https://reqres.in/img/faces/10-image.jpg"
        },
        {
            "id": 11,
            "email": "george.edwards@reqres.in",
            "first_name": "George",
            "last_name": "Edwards",
            "avatar": "https://reqres.in/img/faces/11-image.jpg"
        },
        {
            "id": 12,
            "email": "rachel.howell@reqres.in",
            "first_name": "Rachel",
            "last_name": "Howell",
            "avatar": "https://reqres.in/img/faces/12-image.jpg"
        }
    ],
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
    """
    

    @createUser
  Scenario: to test the Post request creates users successfully
    #   Given url 'https://reqres.in'
      Given url myUrl
    And path '/api/users'
   #   * header Content-Type = 'application/json'
    And  request
      """
      {
        "name": "morpheus",
        "job": "leader"
       }
      """
    When method post
    Then status 201
       And match response.name == 'morpheus'
      * print "ResponseTime = " , responseTime
      And assert responseTime < 2000
      And match response ==
      """
      {
        "name": "#string",
        "job": "#string",
        "id": "#string",
        "createdAt": "#string"
      }
      """


  @createUserEE
  Scenario: to test the Post request creates users successfully
    #   Given url 'https://reqres.in'
    Given url myUrl
    And path '/api/users'
   #   * header Content-Type = 'application/json'
    * def name = 'Abhiram'
    * def job = 'Test Lead'
    And  request
      """
      {
        "name": "#(name)",
        "job": "#(job)"
       }
      """
    When method post
    Then status 201
    And match response.name == 'morpheus'
    * print "ResponseTime = " , responseTime
    And assert responseTime < 2000

  @UpdateUser
  Scenario: to test the Put request Updates users successfully
     #   Given url 'https://reqres.in'
    Given url myUrl
 #   And path '/api/users/2'
    And path myPath , '/2'
    And  request
      """
      {
        "name": "Amol",
        "job": "Test Lead"
       }
      """
    When method put
    Then status 200


  @DeleteUser
  Scenario: to test the Put request Updates users successfully
    #   Given url 'https://reqres.in'
    Given url myUrl
  #   And path '/api/users/2'
    And path myPath , '/2'
    When method delete
    Then status 204

