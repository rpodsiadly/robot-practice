*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Opening Browser
    [Arguments]  ${site_url}  ${browser}
    Open Browser   ${site_url}  ${browser}
    Wait Until Element Is Visible   ${SIGN_IN}  timeout=30
    Set Browser implicit wait    30
