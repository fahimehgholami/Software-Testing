*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem

# Assignment 4: Robot Framework (Fahimeh Gholami)
*** Test Cases ***
Read Addresses From File
    ${fileContent}=    Get File    /Users/fahimeh/Fahimeh-ST/ping/webpages.txt
    ${addresses}=    Split To Lines    ${fileContent}
    Set Global Variable    ${addresses}

Loop Through Addresses to Find IP and Average, Then Create Response File
    Create File    /Users/fahimeh/Fahimeh-ST/ping/file.txt
    ${count}=    Get Length    ${addresses}
    FOR    ${index}    IN RANGE    ${count}
        ${output}=    Run And Return Rc And Output    ping ${addresses}[${index}] -c 4
        Log    ${output}

        # Find the necessary information in the output
        @{wordList}=    Split String     ${output}[1]
        ${index}=    Get Index From List    ${wordList}    from
        ${IPAddress}=    Set Variable    ${wordList}[${index+1}]

        # Ping
        @{pingList}=    Split String     ${output}[1]
        ${index1}=    Get Index From List    ${pingList}    =
        ${ping}=    Set Variable    ${pingList}[${index1+1}]

        # Add the information to the response file
        Append To File    /Users/fahimeh/Fahimeh-ST/ping/file.txt    IP address ${IPAddress} and Ping: ${ping} \n

        # Test the time is less than 50ms
        ${lessThan50ms}=    Evaluate    ${ping} < 50
        Should Be True    ${lessThan50ms}
    END