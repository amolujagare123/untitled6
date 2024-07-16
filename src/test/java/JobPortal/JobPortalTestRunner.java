package JobPortal;

import com.intuit.karate.junit5.Karate;

public class JobPortalTestRunner {

    @Karate.Test
    Karate jobPortalRunner()
    {
        return Karate.run("JobPortal")
                .relativeTo(getClass())
                .tags("@CreateUserJsonFile");

        
    }
}
