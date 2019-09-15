*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${URL}  https://www.cnn.com
${BROWSER}  headlesschrome
${REMOTE_URL}  ${EMPTY}
${DESIRED_CAPABILITIES}  ${EMPTY}
${DOWNLOAD_DIRECTORY}  ${EMPTY}

*** Test Cases ***
Open Site
    [Tags]  web
    Configure Chrome browser
    Go To   ${URL}
    Set Window Size  1280  800
    Capture Page Screenshot
    Close All Browsers

*** Keywords ***
Configure Chrome browser
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${DOWNLOAD_DIRECTORY}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    # To run in headless uncomment these 2 lines:
    Call Method    ${chromeOptions}    add_argument    headless
    Call Method    ${chromeOptions}    add_argument    disable-dev-shm-usage
    Call Method    ${chromeOptions}    add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chromeOptions}