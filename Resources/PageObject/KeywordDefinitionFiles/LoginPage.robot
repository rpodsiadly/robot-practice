*** Settings ***
Library  SeleniumLibrary
Library    ../../Library/fakeemail.py
Variables  ../Locators/Locators.py
Variables    ../TestData/Testdata.py

*** Keywords ***
Fill in login field
    [Arguments]    ${login}
    Input text    ${EMAIL_FIELD_LP}    ${login}
Fill in password field
    [Arguments]    ${password}
    Input password    ${password_field_lp}    ${password}
Log in
    Click element    ${SIGNIN_BUTTON}
Verify information about login
    [Arguments]    ${alert}
    Wait until element is visible    ${ALERT_FIELD}    timeout=10
    ${information}=    Get element attribute    ${ALERT_FIELD}    attribute=textContent
    Should contain    ${information}    ${alert}
Verify positive login
    Title should be    ${ap_head_title_auth_positive}