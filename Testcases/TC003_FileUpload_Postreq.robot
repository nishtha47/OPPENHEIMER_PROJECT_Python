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
    [documentation]         As the Governor, I should be able to see a button on the 
    ...     screen so that I can dispense tax relief for my working class heroes
    [Tags]  post
     Create Session      mysession        ${BASE_URL}     verify=True
     ${data}    CreateDictionary    inputFileTypeId=1  dataType=csv   
    ${file_data}=  Get Binary File  ${CURDIR}${/}sample_data.csv
    ${files}=  Create Dictionary  file=${file_data}
    Log         ${files}
    Log         ${file_data}
    Log         ${data}

    ${resp}  RequestsLibrary.Post Request  mysession  /calculator/uploadLargeFileForInsertionToDatabase  files=${files}  data=${data}
    Log         ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200