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
${Post_Workingclass_multiple}       /calculator/insertMultiple   

***Test Cases***
Post_Multiple_WorkingClassHero_Data
    [Documentation]     As the Clerk, I should be able to insert more than one working
    ...    class hero into database via an API


    Create Session      mysession        ${BASE_URL}     verify=True
    ${tag_1}  Create Dictionary  birthday=05061984    gender=M  name=David2    natid=127   salary=8000  tax=300
    ${tag_2}  Create Dictionary  birthday=05061988    gender=M  name=Robo2    natid=128   salary=6000  tax=301
    @{details}  Create List  ${tag_1}  ${tag_2}
    &{body}  Create Dictionary  
    ...      Description=School
    ...      Details=${details}
    ${body}  Evaluate  json.dumps(${body})  json
    ${header}=  create dictionary   Content-type=application/json
   Log To Console       ${body}
    ${response}=  post On Session  mysession    ${Post_Workingclass_multiple}  json=${body}     headers=${header}       expected_status=202

    log to console  ${response.status_code}
    log to console  ${response.content}

    ${json_response}=  Convert To String    ${response.status_code}

   Log To Console    ${response.content}
   Should Be Equal    ${json_response}    202