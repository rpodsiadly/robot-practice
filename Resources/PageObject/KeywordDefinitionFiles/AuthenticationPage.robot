*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables    ../TestData/Testdata.py

*** Keywords ***
Go to subpage
    [Arguments]    ${subpage}
    Click link    ${subpage}
Fill in an email field
    [Arguments]    ${email}
    Input text    ${EMAIL_FIELD_RP}    ${email}
Click create an account
    Click element    ${CREATE_BUTTON}
Fill in the registration form
    [Arguments]    ${gender}    ${firstname}    ${lastname}    ${password}    ${day}    ${month}    ${year}     ${address}    ${city}    ${state}    ${postcode}    ${phone_number}
    Wait until element is visible   ${GENDER_MR_CHECKBOX}    timeout=10
    Click element    ${gender}
    Input text   ${FIRSTNAME_FIELD}   ${firstname}
    Input text   ${LASTNAME_FIELD}   ${lastname}
    Input text   ${PASSWORD_FIELD_RP}   ${password}
    Select from list by value    ${DATE_DAY_SELECTOR}    ${day}
    Select from list by value    ${DATE_MONTH_SELECTOR}    ${month}
    Select from list by value    ${DATE_YEAR_SELECTOR}    ${year}
    Input text    ${ADDRESS_FIELD}    ${address}
    Input text    ${CITY_FIELD}    ${city}
    Select from list by value    ${STATE_SELECTOR}    ${state}
    Input text    ${POSTCODE_FIELD}    ${postcode}
    Input text    ${PHONE_FIELD}    ${phone_number}
Verify information about negative registration
    [Arguments]    ${alert}
    Wait until element is visible    ${ALERT_FIELD}    timeout=10
    ${information}=    Get element attribute    ${ALERT_FIELD}    attribute=textContent
    Should contain    ${information}    ${alert}
Submit registration form
    Click element    ${REGISTER_BUTTON}