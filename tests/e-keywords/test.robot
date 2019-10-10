*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${URL}  https://www.thecrumb.com
${BROWSER}  headlesschrome

*** Test Cases ***
Open Site
  Setup Browser
  Close All Browsers

*** Keywords ***
Setup Browser
  Open Browser          ${URL}   ${BROWSER}
  Set Window Size  1280  800
  Capture Page Screenshot