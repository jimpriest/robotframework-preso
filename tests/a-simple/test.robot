*** Settings ***
Library                 SeleniumLibrary

*** Test Cases ***
Open Site
  Open Browser          https://www.thecrumb.com   headlesschrome
  Close All Browsers
