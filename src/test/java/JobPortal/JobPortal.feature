Feature: job portal application

  @CreateUserJson
  Scenario: to check the create job request executes successfully
    Given url 'http://localhost:9897/'
    And path  '/normal/webapi/add'
    And request
    """
    {
  "experience": [
    "5 years of software development experience, specializing in full-stack web development and cloud computing."
  ],
  "jobDescription": "We are looking for a skilled full-stack developer to join our team. The ideal candidate will have experience in building scalable web applications, working with both front-end and back-end technologies, and deploying applications on cloud platforms.",
  "jobId": 12345,
  "jobTitle": "Full-Stack Developer",
  "project": [
    {
      "projectName": "E-commerce Platform Development",
      "technology": [
        "React.js",
        "Node.js",
        "Express.js",
        "MongoDB",
        "AWS"
      ]
    },
    {
      "projectName": "Social Media Analytics Tool",
      "technology": [
        "Angular",
        "Python",
        "Django",
        "PostgreSQL",
        "Google Cloud Platform"
      ]
    }
  ]
}

    """
    When method post
    Then status 201
    * print 'Job Title=' , response.jobTitle
    And match response.jobTitle == 'Full-Stack Developer'
    And match response.experience == '#[1]'
    And match response.project == '#[2]'
    And match response.project[0].technology == '#[5]'
    And match response.project[0].technology[*] == ["React.js","Node.js","Express.js","MongoDB","AWS"]
    And match response.project[0].technology[*] contains ["React.js","Node.js"]



  @CreateUserXml
  Scenario: to check the create job request executes successfully
    Given url 'http://localhost:9897/'
    And path  '/normal/webapi/add'
    And header Accept = 'application/xml'
  #  And header ContentType = 'application/xml'
    And request
    """
    <?xml version="1.0"?>
   <job>
  <experience>5 years of software development experience, specializing in full-stack web development and cloud computing.</experience>
  <jobDescription>We are looking for a skilled full-stack developer to join our team. The ideal candidate will have experience in building scalable web applications, working with both front-end and back-end technologies, and deploying applications on cloud platforms.</jobDescription>
  <jobId>12345</jobId>
  <jobTitle>Full-Stack Developer</jobTitle>
  <projects>
    <project>
      <projectName>E-commerce Platform Development</projectName>
      <technology>React.js</technology>
      <technology>Node.js</technology>
      <technology>Express.js</technology>
      <technology>MongoDB</technology>
      <technology>AWS</technology>
    </project>
    <project>
      <projectName>Social Media Analytics Tool</projectName>
      <technology>Angular</technology>
      <technology>Python</technology>
      <technology>Django</technology>
      <technology>PostgreSQL</technology>
      <technology>Google Cloud Platform</technology>
    </project>
  </projects>
</job>


    """
    When method post
    Then status 201



  @GetUserXml
  Scenario: to check the create job request executes successfully
    Given url 'http://localhost:9897/'
    And path  '/normal/webapi/all'
    And header Accept = 'application/xml'
  #  And header ContentType = 'application/xml'
    When method get
    Then status 200
    * print "response=" , response
    Then match response ==
    """
    <List>
  <item>
    <jobId>1</jobId>
    <jobTitle>Software Engg</jobTitle>
    <jobDescription>To develop andriod application</jobDescription>
    <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
    </experience>
    <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
    </project>
  </item>
</List>
    """
