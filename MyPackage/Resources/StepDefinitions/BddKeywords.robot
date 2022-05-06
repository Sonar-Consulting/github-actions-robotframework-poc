*** Settings ***
Resource        .././PageObjects/AppObjects.robot
*** Variables ***
${BROWSER}             Chrome
${URL}                 https://opensource-demo.orangehrmlive.com/
${username}            Admin
${password}            admin123

*** Keywords ***
User logs into Orangehrm
    AppObjects.Log Into Orangehrm     ${URL}    ${username}   ${password}

Verify if home page loads for Orangehrm
    AppObjects.Verify home page

User logs out of Orangehrm
    AppObjects.Logout of Orangehrm

