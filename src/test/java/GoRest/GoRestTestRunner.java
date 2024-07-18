package GoRest;

import com.intuit.karate.junit5.Karate;

public class GoRestTestRunner {

    @Karate.Test
    Karate goRestRunner()
    {
        return Karate.run("GoRest")
                .relativeTo(getClass())
                .tags("@createUserDataProvider2");
    }
}
