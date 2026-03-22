*** Settings ***
Library    Browser
Suite Setup    Open Test Browser
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}      chromium
${HEADLESS}     true
${SEARCH_URL}   https://www.google.com

*** Test Cases ***

Google Page Should Have Search Box
    New Page    ${SEARCH_URL}
    ${count}=    Get Element Count    textarea[name="q"]
    Should Be Equal As Integers    ${count}    1

Google Title Should Contain Google
    New Page    ${SEARCH_URL}
    ${title}=    Get Title
    Should Contain    ${title}    Google

*** Keywords ***
Open Test Browser
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context