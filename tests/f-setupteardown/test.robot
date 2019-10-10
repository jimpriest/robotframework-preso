*** Settings ***
Library             SeleniumLibrary
Library             DateTime

Suite Setup         Suite Setup
Test Setup          Test Setup
Test Teardown       Test Teardown
Suite Teardown      Suite Teardown


*** Variables ***
${URL}  https://www.thecrumb.com
${BROWSER}  headlesschrome


*** Test Cases ***
Open Site
  Log to console   Running tests!

Another Test Case
  Should Be True    1<2

*** Keywords ***
Setup Browser
  Open Browser          ${URL}   ${BROWSER}
  Set Window Size  1280  800

Suite Setup
    [Documentation]   This will run before every suite
    Log to console   URL: ${URL}
    Log to console   Browser: ${BROWSER}
    ${time} =    Get Time
    ${time} =    Convert Date  ${time}  result_format=%I:%M %p
    Log to console   =========================================================
    Log to console   Starting test (Suite Setup) @ ${time}\n

Test Setup
    [Documentation]   This will run before every test
    Log to console   \n=========================================================
    Log to console   Test Setup\n
    Setup Browser

Test Teardown
    [Documentation]   This will run after every test
    Log to console   \n=========================================================
    Log to console   Test Teardown\n
    Capture Page Screenshot
    Close All Browsers

Suite Teardown
    [Documentation]   This will run before every suite
    ${time} =    Get Time
    ${time} =    Convert Date  ${time}  result_format=%I:%M %p
    Log to console   \nEnding test (Suite Teardown) @ ${time}
    Log to console   =========================================================\n
