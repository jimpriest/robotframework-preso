*** Settings ***
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${URL}          https://form.jotform.com/92783859042165
${BROWSER}      headlesschrome

*** Keywords ***
Setup Browser
  Open Browser          ${URL}   ${BROWSER}
  Set Window Size  1280  900

Suite Setup
    [Documentation]   This will run before every suite
    Initialize Test Data    
    Log to console   URL: ${URL}
    Log to console   Browser: ${BROWSER}
    ${time} =    Get Time
    ${time} =    Convert Date  ${time}  result_format=%I:%M %p
    Log to console   =========================================================
    Log to console   Starting test (Suite Setup) @ ${time}\n

Test Setup
    [Documentation]   This will run before every test

    Log to console   \n=========================================================
    Log to console   Test Setup\n
    Setup Browser

Test Teardown
    [Documentation]   This will run after every test
    Log to console   \n=========================================================
    Log to console   Test Teardown\n
    Capture Page Screenshot
    Close All Browsers

Suite Teardown
    [Documentation]   This will run before every suite
    ${time} =    Get Time
    ${time} =    Convert Date  ${time}  result_format=%I:%M %p
    Log to console   \nEnding test (Suite Teardown) @ ${time}
    Log to console   =========================================================\n

Initialize Test Data
    [Documentation]   This sets up data used for testing
    ...                - Faker variables for testing

    Log to console   =========================================================
    Log to console   \nInitializing test data
    Log to console   =========================================================\n

    ${FAKER_FIRST_NAME} =         FakerLibrary.first_name
    ${FAKER_LAST_NAME} =          FakerLibrary.last_name
    ${FAKER_PHONE_NUMBER} =       FakerLibrary.phone_number
    ${FAKER_STREET_ADDRESS} =     FakerLibrary.street_address
    ${FAKER_PARAGRAPH} =          FakerLibrary.paragraph
    ${FAKER_SENTENCE} =           FakerLibrary.sentence
    ${FAKER_CITY} =               FakerLibrary.city
    ${FAKER_STATE} =              FakerLibrary.state
    ${FAKER_COUNTRY} =            FakerLibrary.country
    ${FAKER_ZIPCODE} =            FakerLibrary.postcode

    # Faker email occasionally generates an invalid email
    # So we'll create our own bogus email instead
    # ${EMAIL} =              FakerLibrary.safe_email
    ${FAKER_EMAIL_DOMAIN} =         FakerLibrary.free_email_domain
    ${FAKER_EMAIL}=   catenate    ${FAKER_FIRST_NAME}.${FAKER_LAST_NAME}@${FAKER_EMAIL_DOMAIN}

    Set suite variable      ${FAKER_FIRST_NAME}
    Set suite variable      ${FAKER_LAST_NAME}
    Set suite variable      ${FAKER_PHONE_NUMBER}
    Set suite variable      ${FAKER_STREET_ADDRESS}
    Set suite variable      ${FAKER_PARAGRAPH}
    Set suite variable      ${FAKER_SENTENCE}
    Set suite variable      ${FAKER_CITY}
    Set suite variable      ${FAKER_STATE}
    Set suite variable      ${FAKER_COUNTRY}
    Set suite variable      ${FAKER_ZIPCODE}
    Set suite variable      ${FAKER_EMAIL}


Get title of the page
    ${pageTitle}=                      get title
    [Return]                           ${pageTitle}

