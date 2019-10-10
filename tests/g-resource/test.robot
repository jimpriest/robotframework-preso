*** Settings ***
Resource           common.robot

Suite Setup         Suite Setup
Test Setup          Test Setup
Test Teardown       Test Teardown
Suite Teardown      Suite Teardown

*** Test Cases ***
Open Site
  Log to console   Running tests!

Another Test Case
  Should Be True    1<2