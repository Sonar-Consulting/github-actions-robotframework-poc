*** Settings ***

*** Variables ***
${txt_UserName}  id=txtUsername
${txt_Password}   id=txtPassword
${btn_Login}    id=btnLogin

*** Keywords ***
Log Into Orangehrm
    [Arguments]  ${URL}     ${username}     ${password}
    Create Webdriver    Chrome   executable_path=/Users/prachuryasahoo/Downloads/chromedriver
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