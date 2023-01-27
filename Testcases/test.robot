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

***Test Cases***
Post_Employee_Data
    Create Session      mysession        ${BASE_URL}     verify=True
# Name and Surname Objects - Updated to remove double quotes and match the provided json with "Surname" instead of "value"
    ${tag_1}  Create Dictionary  birthday=05061988    gender=M  name=David1    natid=126   salary=8000  tax=300
    ${tag_2}  Create Dictionary  birthday=05061987    gender=M  name=Robo1    natid=124   salary=6000  tax=301

# Details List / Json Array
    @{details}  Create List  ${tag_1}  ${tag_2}

# Body - Fixed so it's an object not an array
    &{body}  Create Dictionary  
    ...      Description=School
    ...      Details=${details}

# Convert the body to JSON
    ${body}  Evaluate  json.dumps(${body})  json
     ${header}=  create dictionary   Content-type=application/json
   # ${response}=    post request    mysession   /calculator/insertMultiple  headers=${header}   json=${body}
    ${response}=  post On Session  mysession    calculator/insertMultiple  json=${body}     headers=${header}       expected_status=202

    log to console  ${response.status_code}
    log to console  ${response.content}

    ${json_response}=  Convert To String    ${response.status_code}

   Log To Console    ${response.content}
   Should Be Equal    ${json_response}    202