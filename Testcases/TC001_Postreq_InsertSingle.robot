*** Settings ***
Documentation       API Test using RESTfulBooker application
Test Timeout        1 minute
Library             RequestsLibrary
Library             Collections
Library             JsonValidator
Library             Process
Library             OperatingSystem

***Variables***
${BASE_URL}             http://localhost:8080/
${Postendpointsingle}   /calculator/insert

***Test Cases***
Post_WorkingClassHero_Data
  [Documentation]       As the Clerk, I should be able to insert a single record of working class hero into database via an API

    Create Session      mysession        ${BASE_URL}     verify=True
    ${body}=    create dictionary   birthday=05061987    gender=M  name=David2    natid=129   salary=8000  tax=300
    ${header}=  create dictionary   Content-type=application/json
     ${response}=   post On Session     mysession   ${Postendpointsingle}   headers=${header}   json=${body}    expected_status=202

    log to console  ${response.status_code}
    log to console  ${response.content}

    ${json_response}=  Convert To String    ${response.status_code}

   Log To Console    ${json_response}
   Should Be Equal    ${json_response}    202
