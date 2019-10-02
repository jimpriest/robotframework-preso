*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com
${BROWSER}  headlesschrome

*** Test Cases ***
Open Site
  Open Browser          ${URL}   ${BROWSER}
  Set Window Size  1280  800
  Capture Page Screenshot
  Close All Browsers
