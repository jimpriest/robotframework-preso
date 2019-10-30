*** Settings ***
Documentation     A very simple test suite with a single test 

Library                 SeleniumLibrary

*** Test Cases ***
Open Site
  Open Browser          https://www.thecrumb.com    headlesschrome
  Close All Browsers
