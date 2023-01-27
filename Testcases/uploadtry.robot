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
    Create Session      mysession        ${BASE_URL}     verify=True
    ${data}    CreateDictionary    inputFileTypeId=1  dataType=csv
    Set to Dictionary   ${data}    
    ${file_data}=  Get Binary File  ${CURDIR}${/}testdata.csv
    ${files}=  Create Dictionary  file=${file_data}
    Log         ${files}
    Log         ${file_data}
    Log         ${data}

    ${resp}  RequestsLibrary.Post Request  mysession  /URI  files=${files}  data=${data}

    Log  ${resp}

    Should Be Equal As Strings  ${resp.status_code}  200