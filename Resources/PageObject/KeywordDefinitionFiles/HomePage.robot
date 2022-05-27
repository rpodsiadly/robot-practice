*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
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
Verify successfully adding product from dresses to cart with value
    [Arguments]${value}
