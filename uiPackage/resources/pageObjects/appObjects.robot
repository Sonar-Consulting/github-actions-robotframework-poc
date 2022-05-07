*** Settings ***


*** Variables ***
${txt_UserName}  id=txtUsername
${txt_Password}   id=txtPassword
${btn_Login}    id=btnLogin

*** Keywords ***
Log Into Orangehrm
    [Arguments]  ${URL}     ${username}     ${password}
    ${chrome options}=    Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
                          Call Method    ${chrome options}   add_argument    headless
                          Call Method    ${chrome options}   add_argument    disable-gpu
                          Call Method    ${chrome options}   add_argument    disable-dev-shm-usage
                          Call Method    ${chrome options}   add_argument    no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome options}
    Go to  ${URL}
    Set Browser Implicit Wait    5
    Input Text    ${txt_UserName}   ${username}
    Input Password    ${txt_Password}  ${password}
    Click Button    ${btn_Login}

Verify home page
    Capture Page Screenshot
    Wait Until Element Is Visible   id=welcome
    Click Element    id=welcome

Logout of Orangehrm
    Click Element    link=Logout
    Close Browser