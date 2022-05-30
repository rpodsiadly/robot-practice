*** Settings ***
Documentation  Page Object in Robot Framework @ automationpractice.com
Library  SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinitionFiles/LoginPage.robot
Resource  ../Resources/PageObject/KeywordDefinitionFiles/Common.robot


*** Variables ***
${site_url}  http://automationpractice.com/index.php?controller=my-account
${browser}  Firefox

*** Test Cases ***
Verify negative login with blank fields
    Opening Browser    ${site_url}    ${browser}
    Log in
    Verify information about login    ${alert_login_email}
    Close browser
Verify negative login with blank email field
    Opening Browser    ${site_url}    ${browser}
    Fill in password field    ${login_password_positive}
    Log in
    Verify information about login    ${alert_login_email}
    Close browser
Verify negative login with blank password field
    Opening Browser    ${site_url}    ${browser}
    Fill in login field    ${login_email_positive}
    Log in
    Verify information about login    ${alert_login_password}
    Close browser
Verify negative login with incorrect email syntax
    Opening Browser    ${site_url}    ${browser}
    Fill in login field    ${login_incorrect_syntax_email}
    Fill in password field    ${login_password_positive}
    Log in
    Verify information about login    ${alert_login_syntax_email}
    Close browser
Verify negative login with email not in database
    Opening Browser    ${site_url}    ${browser}
    Fill in login field    ${login_email_not_in_database}
    Fill in password field    ${login_password_positive}
    Log in
    Verify information about login    ${alert_login_auth_failed}
    Close browser
Verify negative login with wrong password
    Opening Browser    ${site_url}    ${browser}
    Fill in login field    ${login_email_positive}
    Fill in password field    ${login_password_positive}333
    Log in
    Verify information about login    ${alert_login_auth_failed}
Verify positive login
    Opening Browser    ${site_url}    ${browser}
    Fill in login field    ${login_email_positive}
    Fill in password field    ${login_password_positive}
    Log in
    Verify positive login
    Close browser
*** Keywords ***

