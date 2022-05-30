*** Settings ***
Library  SeleniumLibrary
Library    ../../Library/fakeemail.py
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
    [Arguments]    ${gender}    ${password}    ${day}    ${month}    ${year}
    Wait until element is visible   ${GENDER_MR_CHECKBOX}    timeout=10
    Click element    ${gender}
    Input text   ${FIRSTNAME_FIELD}   ${register_firstname}
    Input text   ${LASTNAME_FIELD}   ${register_lastname}
    IF    "${password}" == "blank"
        log    Blank password
    ELSE
        Input text   ${PASSWORD_FIELD_RP}   ${password}
    END
    Select from list by value    ${DATE_DAY_SELECTOR}    ${day}
    Select from list by value    ${DATE_MONTH_SELECTOR}    ${month}
    Select from list by value    ${DATE_YEAR_SELECTOR}    ${year}
    Input text    ${ADDRESS_FIELD}    ${register_address}
    Input text    ${CITY_FIELD}    ${register_city}
    Select from list by value    ${STATE_SELECTOR}    ${register_state}
    Input text    ${POSTCODE_FIELD}    ${register_postcode}
    Input text    ${PHONE_FIELD}    ${register_phonenumber}
Verify information about negative registration
    [Arguments]    ${alert}
    Wait until element is visible    ${ALERT_FIELD}    timeout=10
    ${information}    Get element attribute    ${ALERT_FIELD}    attribute=textContent
    Should contain    ${information}    ${alert}
Submit registration form
    Click element    ${REGISTER_BUTTON}
Generate fake email
    ${fakeemail}    fakeemail.fake email    char
    Return from keyword    ${fakeemail}
Check email field
    [Arguments]    ${email}
    ${email_from_form}    Get element attribute   ${email_check_field}    attribute=value
    Should be equal    ${email}    ${email_from_form}
Verify positive registration
    Title should be    ${ap_head_title_auth_positive}
