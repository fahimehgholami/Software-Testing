# Fahimeh Gholami / Assignment 5: Robot Framework - Flight
*** Settings *** 
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}                https://blazedemo.com/
${BROWSER}            Chrome
${START_CITY}         Boston
${DESTINATION}        Cairo
${CARD_EXPIRATION_MONTH}=    10
${CARD_EXPIRATION_YEAR}=    2029
    

*** Test Cases ***
Go to page and test if page says "Welcome to the Simple Travel Agency!"
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Page Should Contain    Welcome to the Simple Travel Agency!


*** Test Cases ***
Select Cities
    Select From List By Value    fromPort    ${START_CITY}  
    Select From List By Value    toPort      ${DESTINATION}  
    sleep    2s

*** Test Cases ***
check if "Find Flights" bottum can click
    Element Should Be Enabled    xpath=//input[@type='submit' and @value='Find Flights'] 
    Click Button    xpath=//input[@type='submit' and @value='Find Flights']  
*** Test Cases ***
Check for flights from Boston to Cairo
    Page Should Contain    Flights from ${START_CITY} to ${DESTINATION}:

*** Test Cases ***
Check that at least one flight is visible
    Element Should Be Visible    //table[@class='table'] 
    ${FLIGHTS}    Get WebElements    //table[@class='table']//tr[td/input[@type='submit' and @value='Choose This Flight'] and not(contains(@class, 'header'))]
    Should Be True    ${FLIGHTS} 

# there is a bug here: 
*** Test Cases ***
Select a flight and store the price, flight number and route
    ${FLIGHT_NUMBER}=    Get Value    xpath=//input[@name="flight" and @value="9696"]
    ${OLD_FLIGHT_PRICE}=    Get Value    xpath=//input[@name="price" and @value="200.98"]
    ${AIRLINE}=    Get Value    xpath=//input[@name="airline" and @value="Aer Lingus"]
    Click Element    xpath=(//input[@value="Choose This Flight"])[3]     

    Run Keyword And Continue On Failure    Page Should Contain    ${OLD_FLIGHT_PRICE}
    Run Keyword And Continue On Failure    Page Should Contain    ${AIRLINE}
    Run Keyword And Continue On Failure    Page Should Contain    ${FLIGHT_NUMBER}
        ${TOTAL_PRICE}=    Get Text    xpath=//html/body/div[2]/p[5]/em
    Log    Total price: ${TOTAL_PRICE}
    Set Suite Variable    ${TOTAL_PRICE}

*** Test Cases ***
Fill in the passenger information and submit it
    Input Text    id=inputName    Fahimeh
    Input Text    id=address    Visamaentie23
    Input Text    id=city    Hämeenlinna
    Input Text    id=state    Kante-Hame
    Input Text    id=zipCode    13100

    Wait Until Element Is Visible    id=cardType
    Select From List By Value    id=cardType    dinersclub
    Input Text    id=creditCardNumber    1234567891234567  
    Input Text    id=creditCardMonth    ${CARD_EXPIRATION_MONTH}
    Input Text    id=creditCardYear    ${CARD_EXPIRATION_YEAR}
    Input Text    id=nameOnCard    Fahimeh
    Click Element    xpath=//input[@type="checkbox" and @name="rememberMe"]
    Sleep    3s  
    Click Button    xpath=//input[@type='submit' and @value='Purchase Flight']

*** Test Cases ***
page that opens says "Thank you for your purchase today!"
    Page Should Contain    Thank you for your purchase today!
    
# there is a bug here:
*** Test Cases ***
 17Check that the expiration time is correct(this one have bug)
    ${expiration_text}=    Get Text    xpath=//tr[td[text()='Expiration']]/td[2]
    Should Be Equal    ${expiration_text}    ${CARD_EXPIRATION_MONTH} /${CARD_EXPIRATION_YEAR} 

*** Test Cases ***
heck that the total price is correct (should be equal with the variable you stored in previous step) this one have bug
    
    ${NEW_TOTAL_PRICE}=    Get Text    xpath=//html/body/div[2]/div/table/tbody/tr[3]
    Should Be Equal    ${NEW_TOTAL_PRICE}    ${TOTAL_PRICE}
    
    

*** Test Cases ***
close browser
    sleep    5s
    Close Browser