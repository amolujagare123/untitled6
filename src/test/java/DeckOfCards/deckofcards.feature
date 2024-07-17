Feature: Deck of cards

  Background: open url
 * url 'https://deckofcardsapi.com'

    @shuffleCards
  Scenario: shuffle cards check
     Given path '/api/deck/new/shuffle/'
    And param deck_count = 1
    When method get
    Then status 200
      And match response ==
      """
      {
        "success": '#boolean',
        "deck_id": "#string",
        "shuffled": '#boolean',
        "remaining": '#number'
      }
      """


  @drawCards
  Scenario: draw cards check
    Given path "/api/deck/pivz5gap9hw9/draw/"
    And param count = 2
    When method get
    Then status 200
    * def image =
          """
                {
                  "svg": "#string",
                  "png": "#string"
                }
          """
    * def cards =
        """

          {
              "code": "#string",
              "image": "#string",
              "images": "##(image)",
              "value": "#string",
              "suit": "#string"
          }

        """
    And match response ==
    """
    {
    "success": "#boolean",
    "deck_id": "#string",
    "cards": "#[] ##(cards)",
    "remaining": "#number"
   }
    """



  @drawCards2
  Scenario: draw cards check
    Given path '/api/deck/pivz5gap9hw9/draw/'
    And param count = 2
    When method get
    Then status 200
    * def image =
  """
  {
    "svg": "#string",
    "png": "#string"
  }
  """

    * def cards =
  """
  {
    "code": "#string",
    "image": "#string",
    "images": "#(image)",
    "value": "#string",
    "suit": "#string"
  }
  """
    And match response ==
  """
  {
    "success": "#boolean",
    "deck_id": "#string",
    "cards": "#[] #(cards)",
    "remaining": "#number"
  }
  """