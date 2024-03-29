*** Settings ***
Library           RequestsLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
Test Addition with Valid Numbers
    ${resp}=    GET   http://192.168.56.104:5000/plus/5/6   expected_status=200
    ${json_resp}=   Set Variable    ${resp.json()}
    Should Be Equal As Numbers    11    ${json_resp['result']}

Test Addition with Minus Numbers
    ${resp}=   GET   http://192.168.56.104:5000/plus/5/-5    expected_status=200
    ${json_resp}=   Set Variable    ${resp.json()}
    Should Be Equal As Numbers    0    ${json_resp['result']}

Test Addition with Floting Numbers
    ${resp}=   GET   http://192.168.56.104:5000/plus/5/5.5    expected_status=200
    ${json_resp}=   Set Variable    ${resp.json()}
    Should Be Equal As Numbers    10.5    ${json_resp['result']}

Test Addition with Second Invalid Numbers
    ${resp}=   GET   http://192.168.56.104:5000/plus/5/abc    expected_status=400

Test Addition with First Invalid Numbers
    ${resp}=   GET   http://192.168.56.104:5000/plus/abc/5    expected_status=400

Test Addition with Both Invalid Numbers
    ${resp}=   GET   http://192.168.56.104:5000/plus/abc/def    expected_status=400
