*** Settings ***
Library  Browser


*** Test Cases ***
My Very First Test
    [Tags]     sample
    New Browser  chromium  headless=true
    New Page  https://www.google.com
    Get Title  contains  Google
    Close Browser
    
