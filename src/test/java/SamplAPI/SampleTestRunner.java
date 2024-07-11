package SamplAPI;

import com.intuit.karate.junit5.Karate;

public class SampleTestRunner {

           @Karate.Test
           Karate testSampleRequest()
           {
              return Karate.run("sample")
                      .relativeTo(getClass())
                     .tags("@createUserEE");
           }
}
