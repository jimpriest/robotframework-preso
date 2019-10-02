*** Settings ***
Library             SeleniumLibrary



*** Variables ***
${URL}  https://www.amazon.com
${BROWSER}  headlesschrome

*** Test Cases ***
Open Site
  Setup Browser
  Capture Page Screenshot
  Close All Browsers

*** Keywords ***
Setup Browser
  Open Browser          ${URL}   ${BROWSER}
  Set Window Size  1280  800
