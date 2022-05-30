*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Go to subpage
    [Arguments]    ${subpage}
    Click link    ${subpage}
    Sleep    1
Verify home page loaded successfully
    Title Should Be     ${hp_head_title}
Verify authentication page is successfully loaded
    Title Should Be     ${ap_head_title}
Verify women subpage is successfully loaded
    Title Should Be     ${hp_head_title_women_dir}
Verify dresses subpage is successfully loaded
    Title Should Be     ${hp_head_title_dresses_dir}
Verify t-shirts subpage is successfully loaded
    Title Should Be     ${hp_head_title_tshirts_dir}
Add product from dresses to cart with value
    [Arguments]     ${value}
    @{products_price}=   Get WebElements   ${PRODUCTS_PRICES}
    FOR   ${product_price}   IN   @{products_price}
        IF   '${product_price.text}' == '${value}'
            Click element   ${product_price}
            Sleep    1
            Exit For Loop If     '${product_price.text}' == '${value}'
        END
    END
Close summary cart
    Wait until element is visible    ${SUMMARYCARD_CLOSE}
    Click element    ${SUMMARYCARD_CLOSE}
Verify successfully added product to cart
    ${quantity}=    Get element attribute    ${CART_QUANTITY}    attribute=textContent
    Should contain    ${quantity}     1

