package DeckOfCards;

import com.intuit.karate.junit5.Karate;

public class DeckOfCardsTestRunner {

           @Karate.Test
           Karate testRunner()
           {
              return Karate.run("deckofcards")
                      .relativeTo(getClass())
                     .tags("@drawCards");
           }
}
