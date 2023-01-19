# robotframework-practice @ automationpractice.com
An automation testing project with Python, Robot Framework and Selenium

[dependencies&prerequisities](https://github.com/rpodsiadly/selenium-practice/blob/main/README.md)

[run commands](https://dev.to/juperala/how-to-run-robot-framework-test-from-command-line-5aa)

## Test cases 

> Environment: Ubuntu 20.04.4 LTS | Firefox Browser 99.0 (64bit)

> Preconditions: user not logged in, browser running
<details><summary>Main page tests</summary>
  
  - loading main page
  - passing to *WOMEN* subpage
  - passing to *DRESSES* subpage
  - passing to *T-SHIRTS* subpage
  - passing to authentication page
  - adding to cart a product with certian value from *DRESSES* subpage
</details>
<details><summary>Authentication page tests - registration</summary>
  
  - new user registration with email already taken - negative
  - new user registration with incorrect date of birth - negative
  - new user registration with incorrect password - negative
</details>
<details><summary>Authentication page tests - logining</summary>
  
  - logining negative
  - logining positive
</details>
<details><summary>Docs in Polish</summary>

[click](https://drive.google.com/file/d/1riE_vAKxEHhl4r_Ob3s_w5SmL_vROdco/view?usp=share_link)
</details>

