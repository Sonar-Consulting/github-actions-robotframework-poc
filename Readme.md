# Project title:
Robot framework testing using GitHub actions.

# Description :
This project is a POC on testing robot UI and API tests using GitHub actions.

# Pre-requisites:
1. Enable GitHub actions for your repository.
2. For page object model, specify resource file as a relative path in your .robot tests.
   
   Example:
   
        *** Settings ***
  
        Resource  ../.././resources/stepDefinitions/bddKeywords.robot

        Resource  ../.././common/libraryImport.robot

3. Add chrome-options to your webdriver as shown below:

        ${chrome options}=       Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
  
                          Call Method    ${chrome options}   add_argument    headless
                          Call Method    ${chrome options}   add_argument    disable-gpu
                          Call Method    ${chrome options}   add_argument    disable-dev-shm-usage
                          Call Method    ${chrome options}   add_argument    no-sandbox

        Create Webdriver    Chrome    chrome_options=${chrome options}
        
 # To run tests in local:
 
 1. Install docker desktop
 2. Run the command and generate reports:
 
        docker run -v $(pwd):/opt/robotframework/tests -v $(pwd)/reports:/opt/robotframework/reports --platform linux/amd64 ppsahoo/robot_selenium_tests_in_chrome
        
        
 # To run tests via Github actions:
 
 1. Any changes (Ex: push/pull request) in the project will trigger github actions.
 2. To publish report : Upgrade Github or make the repository 'public'
 

# To generate and view report(s) - current and historical in gh-pages:

Before execution:

 1. Ensure generateReport.sh file is available in gh-pages repository
 2. In your project repository navigate to Settings > Pages, in the section named 'Source' select - Branch : gh-pages and Folder : /root

After execution:

 3. To view the published report(s), navigate to Settings > pages > Github pages link - copy the link to your browser and press enter.
    (Note: Hit refresh button as it takes a few secs to load the latest report(s))  
    
    Alternatively, you can retrieve the published report link from the step 'deploy' of workflow once 'pages build and deployment' pipeline is complete.
        
# Note:
 actions.yml file i.e. the file used to generate workflow for GitHub actions is created in .github/Workflows folder.
