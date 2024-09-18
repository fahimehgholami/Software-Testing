*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem
Library    String
Library    OperatingSystem

*** Keywords ***
First word From text at Index    
    [Arguments]    ${text}    ${index}
    @{list}=    Split String    ${text}
    ${word}=    Set Variable    ${list}[${index}]
    [Return]    ${word}

*** Test Cases ***
New Text Test 
    ${text}=    Set Variable    Roses and Blue sky
    ${word}=    First word From text at Index    ${text}    2
    Should Be Equal    ${word}    Blue 


*** Test Cases ***
Get IP Address
    ${output}=    Run And Return Rc And Output    ifconfig
    @{wordList}=    Split String    ${output}[1]
    Log    ${wordList}
    ${index}=    Get Index From List    ${wordList}    inet
    ${index}=    Evaluate    ${index}-1
    ${IPAddress}=    Set Variable    ${wordList}[${index}]
    Log    ${IPAddress}
