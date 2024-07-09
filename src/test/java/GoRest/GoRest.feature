Feature:  all go rest related requests


  @createUser
  Scenario: to check the user is added or not
    Given url 'https://gorest.co.in/'
    And path '/public/v2/users'
    * header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    And request
    """
    {

      "name": "Amarendra Chitale",
      "email": "amarendra@gmail.com",
      "gender": "male",
      "status": "active"
    }
    """
    When method post
    Then  status 201



  @GetSingleUser
  Scenario: to check the user is displayed correctly
    Given url 'https://gorest.co.in/'
    And path '/public/v2/users/7018599'
    * header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    When  method get
    Then status 200