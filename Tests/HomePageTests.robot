*** Settings ***
Documentation  Page Object in Robot Framework @ automationpractice.com
Library  SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinitionFiles/HomePage.robot
Resource  ../Resources/PageObject/KeywordDefinitionFiles/Common.robot


*** Variables ***
${site_url}  http://automationpractice.com/
${browser}  Firefox

*** Test Cases ***
Verify successful loading homepage
    Opening Browser  ${site_url}  ${browser}
    Verify home page loaded successfully
    Close Browser
Verify successfully navigation to Authentication page
    Opening Browser  ${site_url}  ${browser}
    Go to subpage    ${AUTHENTICATION}
    Verify authentication page is successfully loaded
    Close Browser
Verify successfully navigation to Women subpage
    Opening Browser  ${site_url}  ${browser}
    Go to subpage  ${MENU_WOMEN}
    Verify women subpage is successfully loaded
    Close Browser
Verify successfully navigation to Dresses subpage
    Opening Browser  ${site_url}  ${browser}
    Go to subpage   ${MENU_DRESSES}
    Verify dresses subpage is successfully loaded
    Close Browser
Verify successfully navigation to T-shirts subpage
    Opening Browser  ${site_url}  ${browser}
    Go to subpage   ${MENU_TSHIRTS}
    Verify t-shirts subpage is successfully loaded
    Close Browser
Verify successfully addition of product to cart with given value
    Opening Browser  ${site_url}  ${browser}
    Go to subpage   ${MENU_DRESSES}
    Add product from dresses to cart with value   ${hp_product_price}
    Close summary cart
    Verify successfully added product to cart
    Close Browser
*** Keywords ***
