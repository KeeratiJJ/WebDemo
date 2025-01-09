*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${CHROME_BROWSER_PATH}    C:/Tools/ChromeForTesting/chrome.exe
${CHROME_DRIVER_PATH}    C:/Tools/ChromeForTesting/chromedriver.exe
${URL}    https://www.kku.ac.th

*** Test Cases ***
TC_001: Start Chrome For Testing
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${URL}
