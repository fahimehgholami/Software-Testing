*** Settings ***
Library    SeleniumLibrary
Library    String

*** Test Cases ***
Facebook register
    Open Browser    https://www.facebook.com/r.php   chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Sleep    2s
    Maximize Browser Window
    Click Element    xpath:/html/body/div[3]/div[2]/div/div/div/div/div[3]/div[2]/div/div[2]/div[1]/div
    Page Should Contain    Create a new account 
    
    Click Element    name:firstname
    Input Text    name:firstname    Donald
    Sleep    1s
    Click Element    name:lastname
    Input Text    name:lastname    Duck
    Sleep    1s
    Click Element    name:reg_email__
    Input Text    name:reg_email__    d.d@d.com
    Sleep    1s
    Click Element    name:reg_passwd__
    Input Text    name:reg_passwd__    verySecretPassword
    Sleep    1s
    Click Element    id:month
    Select From List By Label    id:month    Jun

    Click Element    id:day
    Select From List By Label    id:day    16

    Click Element    id:year
    Select From List By Label    id:year   1933

    Select Radio Button    sex    2

    Set Screenshot Directory    /Users/fahimeh/Fahimeh-ST/Selenium/Screenshot
    Capture Page Screenshot    screenshot.png

    Close Browser

*** Test Cases ***
Ny Times
    Open Browser    https://www.nytimes.com    chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    
    Sleep    2s
    Maximize Browser Window

    Click Button    xpath://button[@data-testid='Accept all-btn']
    ${count}=    Get Element Count    xpath://html/body/div[2]/div[2]/div[2]/header/div[4]/nav/ul/li[*]/a
    Log To Console    ${count}

    ${referencePosition}=    Get Vertical Position    xpath:/html/body/div[2]/div[2]/div[2]/header/div[4]/nav/ul/li[1]/a

    FOR    ${index}    IN RANGE    2    ${count}
        Log    ${index}
        ${testPosition}=    Get Vertical Position
        ...    xpath:/html/body/div[2]/div[2]/div[2]/header/div[4]/nav/ul/li[${index}]/a
        Should Be Equal    ${referencePosition}    ${testPosition}
    END
    Close Browser
