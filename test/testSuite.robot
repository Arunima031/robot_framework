*** Settings ***
Library     SeleniumLibrary

Suite Setup    Log    Test suite setup
Suite Teardown    Log    Test suite Teardown
Test Setup    Log    test setup
Test Teardown    Log    test teastdown
Default Tags    Always Run

*** Test Cases ***
SearchItem
    [Tags]    Smoke    
    Log    Start test case
    Open Browser    https://www.amazon.in/    chrome
    Set Browser Implicit Wait    5
    Input Text    id=twotabsearchtextbox    Washing Machine
    Click Button    id=nav-search-submit-button
    Close Browser

Valid Login to application
    [Tags]    Smoke  
    Launch Browser
    Valid User Login
    Element Should Be Visible    xpath://h6[text()="Dashboard"]
    Click Element    css:[class*="userdropdown-icon"]
    Click Element    link=Logout
    Close Browser

Invalid login to application
    [Tags]    Regression
    Launch Browser
    Invalid user Login
    Element Should Be Visible    xpath://p[text()="Invalid credentials"]
    Close Browser
    Log    This test was executed by %{username} on %{os}
*** Variables ***

${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
@{CREDENTIALS}    Admin    admin123
&{LoginCreds}    username=Admin    password=Invalid

*** Keywords ***
Launch Browser
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    10

Valid User Login
    Input Text    name=username    ${CREDENTIALS}[0]
    Input Text    name=password    ${CREDENTIALS}[1]
    Click Button    css:button[type=submit]

Invalid user Login
    Input Text    name=username    ${LoginCreds}[username]
    Input Text    name=password    ${LoginCreds}[password]
    Click Button    css:button[type=submit]