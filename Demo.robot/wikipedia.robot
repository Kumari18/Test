*** Settings ***
Library   Browser
Suite Setup   Open Test Browser
Suite Teardown   Close Browser
Test Setup   Go To Wikipedia Homepage

*** Variables ***
${BROWSER}   chromium
${HEADLESS}   false
${WIKIPEDIA_URL}   https://en.wikipedia.org

*** Test Cases ***
Search For Python Programming Language
    [Tags]   demo
     Search Wikipedia For   Python (programming language)
     Article Title Should Be   Python (programming language)     

Search For Robot Framework
     Search Wikipedia For   Robot Framework
     Page Should Contain Text   test automation

Main Page Should Have Featured Article
     Page Should Contain Text  Featured article


*** Keywords ***
Open Test Browser
    New Browser   ${BROWSER}   headless=${HEADLESS}

Go To Wikipedia Homepage
   New Page  ${WIKIPEDIA_URL}
   wait For Load State   domcontentloaded

Search Wikipedia For
    [Arguments]   ${search_term}
    Fill Text     #searchInput   ${search_term}
    Press Keys    #searchInput  Enter
    Wait For Load State  networkidle

Article Title Should Be
    [Arguments]   ${expected_title}
    ${actual}=   Get Text  h1#firstHeading
    Should Be Equal As Strings  ${actual}  ${expected_title}

Page Should Contain Text
   [Arguments]   ${expected_text}
   Get Text   body   should contain   ${expected_text}

