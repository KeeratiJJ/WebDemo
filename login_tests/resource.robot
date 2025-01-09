*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}          localhost:7272
${BROWSER}         Chrome
${DELAY}           0.1
${VALID USER}      demo
${VALID PASSWORD}  mode
${LOGIN URL}       http://${SERVER}/
${WELCOME URL}     http://${SERVER}/welcome.html
${ERROR URL}       http://${SERVER}/error.html
${FORM URL}        http://${SERVER}/Form.html
${COMPLETE URL}    http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    C:/Tools/ChromeForTesting/chrome.exe
${CHROME_DRIVER_PATH}    C:/Tools/ChromeForTesting/chromedriver.exe
*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${CHROME_DRIVER_PATH}')    sys, selenium.webdriver.chrome.service
    Create WebDriver    Chrome    options=${options}    service=${service}
    Go To    ${LOGIN URL}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    id=username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password_field    ${password}

Submit Credentials
    Click Button    id=login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

#-Lab 7.2----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Open Browser To Form Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Set Selenium Speed    ${DELAY}
    Go To   ${FORM URL}

Input FirstName
    [Arguments]    ${firstname}
    Input Text    id:firstname    ${firstname}

Input LastName
    [Arguments]    ${lastname}
    Input Text    id:lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    id:destination    ${destination}

Input Contactperson
    [Arguments]    ${contactperson}
    Input Text    id:contactperson    ${contactperson}
Input Relationship
    [Arguments]    ${relationship}
    Input Text    id:relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    id:email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    id:phone    ${phone}

Click SubmitButton
    Click Element    xpath=//input[@type='submit' and @id='submitButton']

Welcome Page Should Be Open Complete
    Title Should Be    Completed