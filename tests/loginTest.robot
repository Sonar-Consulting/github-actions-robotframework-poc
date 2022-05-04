*** Settings ***
Library                   SeleniumLibrary
Suite Setup               Log                                           I am inside suite setup
Suite Teardown            Log                                           I am inside suite teardown
Test Setup                Log                                           I am inside test setup
Test Teardown             Log                                           I am inside test teardown
Default Tags              Smoke

*** Variables ***
${BROWSER}             Chrome
${URL}                 https://opensource-demo.orangehrmlive.com/
${username}            Admin
${password}            admin123



*** Test Cases ***
LoginIntoOrangehrm
                          [Documentation]    This is a login test
                          ${chrome options}=      Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
                          Call Method    ${chrome options}   add_argument    headless
                          Call Method    ${chrome options}   add_argument    disable-gpu
                          Call Method    ${chrome options}   add_argument    disable-dev-shm-usage
                          Call Method    ${chrome options}   add_argument    no-sandbox

                          Create Webdriver    Chrome    chrome_options=${chrome options}
                          Set Window Size    1920       1080
                          Go to     ${URL}
                          #Open Browser    ${URL}  ${BROWSER}
                          Set Browser Implicit Wait    5
                          Input Text    id=txtUsername    ${username}
                          Input Password    id=txtPassword   ${password}
                          Click Button    id=btnLogin
                          Capture Page Screenshot
                          LogOutKeyWord
                          Log    The scenario is complete!

*** Keywords ***
LogOutKeyWord
                          Click Element    id=welcome
                          Click Element    link=Logout
                          Close Browser
