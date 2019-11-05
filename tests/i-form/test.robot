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

${robot_type}                   id=input_15_  # we'll make this dynamic in the test below
${robot_color}                  id=input_16

@{small_robot_color_select}     Red Blue Green Black Magenta

${additional_request}           id=input_14

${submit_form}                  id=input_13

*** Test Cases ***
Order Robot
  [Documentation]  User should be able to order a robot
  Fill out form
  Check for confirmation

*** Keywords ***
Fill out form
  Input text  ${firstname}  ${FAKER_FIRST_NAME}  
  Input text  ${lastname}  ${FAKER_LAST_NAME}  
  Input text  ${email}  ${FAKER_EMAIL}
  Input text  ${areacode}  ${FAKER_AREA_CODE}
  Input text  ${phonenumber}  ${FAKER_PHONE_NUMBER}
  Input text  ${address1}  ${FAKER_STREET_ADDRESS}
  Input text  ${city}  ${FAKER_CITY}
  Input text  ${state}  ${FAKER_STATE}
  Input text  ${zipcode}  ${FAKER_ZIPCODE}
  Select from list by value    ${country}  United States
  Click element       ${robot_type}${RANDOM}
  Select from list by value   ${robot_color}  Blue
  Input text    ${additional_request}  ${FAKER_PARAGRAPH}

Check for confirmation
  Click element   ${submit_form} 
  Title Should Be    Thank You
