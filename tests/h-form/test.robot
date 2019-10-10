*** Settings ***
Documentation     Test Jot contact form
...
...               This test will generate fake data and fill out a form

Resource            common.robot

Suite Setup         Suite Setup
Test Setup          Test Setup
Test Teardown       Test Teardown
Suite Teardown      Suite Teardown


*** Variables ***
${firstname}                    id=first_2
${lastname}                     id=last_2

${email}                        id=input_3

${areacode}                     id=input_5_area
${phonenumber}                  id=input_5_phone

${address1}                     id=input_4_addr_line1
${address2}                     id=input_4_addr_line2
${city}                         id=input_4_city
${state}                        id=input_4_state
${zipcode}                      id=input_4_postal
${country}                      id=input_4_country
${country_select}               United States

${small_robot}                  id=input_7_1001
${small_robot_color}            id=input_7_custom_1001_1
@{small_robot_color_select}     Red Blue Green Black Magenta

${additional_request}           id=input_14

${submit_form}                  id=input_13

*** Test Cases ***
Order Robot
  [Documentation]  User should be able to order a robot
  Input text  ${firstname}  ${FAKER_FIRST_NAME}  
  Input text  ${lastname}  ${FAKER_LAST_NAME}  
  Capture page screenshot
  Click element   ${submit_form} 
  Check for confirmation

*** Keywords ***
Check for confirmation
  Title Should Be    Thank You

