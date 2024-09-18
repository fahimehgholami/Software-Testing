*** Settings ***
Library  String
Library  Dialogs
Library  Collections
Library  OperatingSystem
Library    Telnet
Test Setup    Create Data For Tests

*** Variables ***
${one}    Donald
${two}    Duck
@{list}    1    2    3    4

*** Keywords ***
Create Data For Tests
    @{names}=    Create List    Donald    Mickey    Goofy    Scrooge    Daisy
    Set Test Variable    ${names}

*** Test Cases ***
Check outcome
    ${three}=  set Variable  Donald Duck
    Should Be Equal  ${three}  ${one} ${two}

*** Test Cases ***
Ask user input
    ${user}=    Set Variable    Hello World
    # ${user}=    Get Value From User    Please input your text
    Should Be Equal    ${user}    Hello World

*** Test Cases ***
Check Value From list
    ${number}=     set Variable    ${list}[2]

*** Test Cases ***
Add value to the list
    #local versionb from global variable
    @{list}=    Copy List    ${list}
    ${addition}=     set Variable    333
    Append To list    ${list}    ${addition}
    Log   ${list}
    Should Be Equal   ${list}[4]    ${addition}

*** Test Cases ***
Test list length
    ${length}=     Get length    ${list}
    ${expectedResult}=     Convert To Integer    4
    Should Be Equal    ${length}    ${expectedResult}

Put list in alphabetical order
    Log    ${names}
    Sort List     ${names}
    Log     ${names}
    Should Be Equal     ${names}[0]    Daisy


*** Test Cases ***
Remove From List
    Remove From List     ${names}    0
    Should Be Equal     ${names}[0]    Mickey

*** Test Cases ***
Loop the list 
    FOR     ${element}    IN     @{names}
        Log    ${element}
        ${new}=     set Variable    ${element}
    END

*** Test Cases ***
Loop all numbers 
    FOR     ${counter}    IN  RANGE    1    10
        Log    ${counter}
        ${new}=     set Variable    ${counter}
    END

*** Test Cases ***
Make a new directory
    Create Directory      /Users/fahimeh/Fahimeh-ST/test
    Directory Should Exist    /Users/fahimeh/Fahimeh-ST/test

*** Test Cases ***
Create a new text file
    ${path}=     Set Variable    /Users/fahimeh/Fahimeh-ST/test
    Set Global Variable    ${path}
    Create File    ${path}/example.txt       This is fun!
    File Should Exist    ${path}/example.txt 
    File Should Not Be Empty    ${path}/example.txt
    Sleep    4

*** Test Cases ***
Append text into file
    Append To File    ${path}/example.txt     \nor is this?  
    Sleep    4  

*** Test Cases ***
Clean files and directories
    Remove File     ${path}/example.txt
    Directory Should Be Empty    ${path} 
    Remove Directory     ${path}

#Day2 startpoint
*** Test Cases ***
ping web page and read ping time
    ${output}=    Run And Return Rc And Output    ping www.google.com

*** Test Cases ***
Read text file and find word students from file
    ${output}=    Get File    /Users/fahimeh/Fahimeh-ST/example_text.txt 
    Log    ${output}
    ${output}=    Remove String    ${output}    .    ,
    Log    ${output}
    @{wordList}=    Split String    ${output}
    Log    ${wordList}
    ${index}=    Get Index From List    ${wordList}    student
    Should Be Equal    ${index}    24
    ${index}=    Evaluate    ${index} + 1
    ${index}=    Get Index From List    ${wordList}    student    ${index}
    Log To Console    ${index}
