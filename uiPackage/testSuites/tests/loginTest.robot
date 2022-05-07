*** Settings ***
Resource  ../.././resources/stepDefinitions/bddKeywords.robot
Resource  ../.././common/libraryImport.robot


*** Variables ***
${BROWSER}             Chrome
${URL}                 https://opensource-demo.orangehrmlive.com/
${username}            Admin
${password}            admin123

*** Test Cases ***
Healthcheck for Orangehrm
    [Documentation]    Verify Login and Home Page for Orangehrm
    Given User logs into Orangehrm
    And Verify if home page loads for Orangehrm
    And User logs out of Orangehrm



