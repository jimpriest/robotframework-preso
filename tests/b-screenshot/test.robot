*** Settings ***
Library                 SeleniumLibrary

*** Test Cases ***
Open Site
  Open Browser          https://www.thecrumb.com   headlesschrome
  Capture Page Screenshot
  Close All Browsers
