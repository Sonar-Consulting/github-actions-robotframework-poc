# Project title:
Robot framework testing using GitHub actions

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
    
        
# Note:
 actions.yml file i.e. the file used to create workflow for GitHub actions is created in .github/Workflows folder.
 
 
   


