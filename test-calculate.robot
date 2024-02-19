*** Settings ***
Library           RequestsLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
Test Addition with Valid Numbers
    ${resp}=    GET   http://192.168.56.104:5000/plus/5/6   expected_status=200
    ${json_resp}=   Set Variable    ${resp.json()}
    Log To Console    ${json_resp['result']}

Test Addition with Invalid Numbers
    ${resp}=   GET   http://192.168.56.104:5000/plus/abc/def    expected_status=400
