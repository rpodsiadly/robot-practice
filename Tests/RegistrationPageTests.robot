*** Settings ***
Documentation  Page Object in Robot Framework @ automationpractice.com
Library  SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinitionFiles/RegistrationPage.robot
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
    ${email}    Generate fake email
    Fill in an email field    ${email}
    Click create an account
    Fill in the registration form    ${GENDER_MR_CHECKBOX}    ${ap_register_password}    ${ap_register_date_day}    ${ap_register_date_month_invalid}     ${ap_register_date_year}
    Check email field    ${email}
    Submit registration form
    Verify information about negative registration    ${ap_alert_invalid_date_of_birth}
    Close browser
Verify negative registration with short password
    Opening Browser    ${site_url}    ${browser}
    ${email}    Generate fake email
    Fill in an email field    ${email}
    Click create an account
    Fill in the registration form    ${GENDER_MR_CHECKBOX}    1234    ${ap_register_date_day}    ${ap_register_date_month}    ${ap_register_date_year}
    Check email field    ${email}
    Submit registration form
    Verify information about negative registration    ${ap_alert_short_password}
    Close browser
Verify negative registration with blank password
    Opening Browser    ${site_url}    ${browser}
    ${email}    Generate fake email
    Fill in an email field    ${email}
    Click create an account
    Fill in the registration form    ${GENDER_MR_CHECKBOX}    blank    ${ap_register_date_day}    ${ap_register_date_month}    ${ap_register_date_year}
    Check email field    ${email}
    Submit registration form
    Verify information about negative registration    ${ap_alert_blank_password}
    Close browser
Verify negative registration with long email
    Opening Browser    ${site_url}    ${browser}
    Fill in an email field    ${ap_register_mail_too_long}
    Click create an account
    Fill in the registration form    ${GENDER_MR_CHECKBOX}    ${ap_register_password}    ${ap_register_date_day}    ${ap_register_date_month}    ${ap_register_date_year}
    Check email field    ${ap_register_mail_too_long}
    Submit registration form
    Verify information about negative registration    ${ap_alert_email_too_long}
    Close browser
Verify positive registration
    Opening Browser    ${site_url}    ${browser}
    ${email}    Generate fake email
    Fill in an email field    ${email}
    Click create an account
    Fill in the registration form    ${GENDER_MR_CHECKBOX}    ${ap_register_password}    ${ap_register_date_day}    ${ap_register_date_month}    ${ap_register_date_year}
    Check email field    ${email}
    Submit registration form
    Verify positive registration
    Close browser


*** Keywords ***

