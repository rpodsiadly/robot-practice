*** Settings ***
Documentation  Page Object in Robot Framework @ automationpractice.com
Library  SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinitionFiles/AuthenticationPage.robot
Resource  ../Resources/PageObject/KeywordDefinitionFiles/Common.robot


*** Variables ***
${site_url}  http://automationpractice.com/index.php?controller=my-account
${browser}  Firefox

*** Test Cases ***
Verify negative registration with email already exist in database
    Opening Browser    ${site_url}    ${browser}
    Fill in an email field    ${ap_register_mail_already_taken}
    Click create an account
    Verify information about negative registration    ${ap_alert_email_already_exist}
    Close browser
Verify negative registration with invalid date of birth
    Opening Browser    ${site_url}    ${browser}
    Fill in an email field    ${ap_register_mail}
    Click create an account
    Fill in the registration form    ${GENDER_MR_CHECKBOX}    ${ap_register_firstname}    ${ap_register_lastname}    ${ap_register_password}    ${ap_register_date_day}    ${ap_register_date_month_invalid}     ${ap_register_date_year}    ${ap_register_address}    ${ap_register_city}    ${ap_register_state}    ${ap_register_postcode}    ${ap_lp_register_phonenumber}
    Submit registration form
    Verify information about negative registration    ${ap_alert_invalid_date_of_birth}
    Close browser
*** Keywords ***