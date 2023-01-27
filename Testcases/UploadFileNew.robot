*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary
Library  OperatingSystem



*** Variables ***
${test_session}     local test session created in Test Setup
${Base_Url}         http://localhost:8080

*** Test Cases ***

Post Request With File
    [Tags]  post
    ${file_data}=  Get Binary File  ${CURDIR}${/}data.json
    ${files}=  Create Dictionary  file=${file_data}
    ${resp}=  POST On Session  ${test_session}  /anything  files=${files}
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings     ${resp.json()['method']}   POST
    ${file}=  Set Variable  ${{dict(${resp.json()['files']['file']})}}
    Dictionary Should Contain Key  ${file}  one
    Dictionary Should Contain Key  ${file}  two