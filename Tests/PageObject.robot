*** Settings ***
Documentation  Page Object in Robot Framework
Library  SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinitionFiles/HomePage.robot
Resource  ../Resources/PageObject/KeywordDefinitionFiles/Common.robot


*** Variables ***
${site_url}  http://automationpractice.com/
${browser}  Firefox

*** Test Cases ***
Verify Successfull loading homepage
    Opening Browser  ${site_url}  ${browser}
    Verify home page loaded successfully
    Close Browser
Verify successfully navigate to Authentication page
    Opening Browser  ${site_url}  ${browser}
    Click link   ${SIGN_IN}
    Verify authentication page is successfully loaded
    Close Browser
Verify successfully navigate to Women subpage
    Opening Browser  ${site_url}  ${browser}
    Click link  ${MENU_WOMEN}
    Verify women subpage is successfully loaded
    Close Browser
Verify successfully navigate to Dresses subpage
    Opening Browser  ${site_url}  ${browser}
    Click link   ${MENU_DRESSES}
    Verify dresses subpage is successfully loaded
    Close Browser
Verify successfully navigate to T-shirts subpage
    Opening Browser  ${site_url}  ${browser}
    Click link   ${MENU_TSHIRTS}
    Verify t-shirts subpage is successfully loaded
    Close Browser
Verify successfully adding product from dresses to cart with value
    Opening Browser  ${site_url}  ${browser}
    Click link   ${MENU_DRESSES}
    Add product to cart
*** Keywords ***