*** Settings ***
Library                 SeleniumLibrary

*** Test Cases ***
Open Site
  Open Browser          https://www.thecrumb.com   headlesschrome
  Set Window Size  1280  800
  Capture Page Screenshot
  Close All Browsers
