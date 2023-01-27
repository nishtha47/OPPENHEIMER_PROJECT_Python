*** Settings ***
Documentation       API Test using RESTfulBooker application
Test Timeout        1 minute
Library             RequestsLibrary
Library             Collections
Library             JsonValidator
Library             Process
Library             OperatingSystem
Library             JSONLibrary
Library             SeleniumLibrary

***Variables***
${BASE_URL}             http://localhost:8080/

**Test Cases***
GET_TaxRelief_calculation
    Create Session      mysession        ${BASE_URL}     verify=True
    ${resp}=        Get request               mysession              calculator/taxReliefSummary/
     Log        ${resp}
    ${dict}    Set Variable    ${resp.json()}
    ${vPools}=     Create List           ${dict}
    ${IdFromList}=  Get From List   ${vPools}  0
    Log To Console          ${IdFromList}      


TestGetValueByJSONPath
     [Documentation]  Get some json object using JSONPath

    Create Session      mysession        ${BASE_URL}     verify=True
    ${body}=    create dictionary   birthday=05061987    gender=M  name=David2    natid=129   salary=8000  tax=300
    ${header}=  create dictionary   Content-type=application/json
   # ${response}=    post request    mysession   /calculator/insert  headers=${header}   json=${body}    expected_status=202
     ${response}=   post On Session     mysession   /calculator/insert  headers=${header}   json=${body}    expected_status=202
    # ${payload}=    Set Variable    ${response.json()} 

    FOR    ${key}    ${value}    IN    @{body}
            ${value}=    Get From Dictionary    ${body}    ${key}
        Log    ${key}, ${value}
        Log     The current key is: ${key}
        
        Log     The value is: ${value}
    END   
    ${body_temp}  Evaluate  json.dumps(${body})  json
    ${list}=        Get Dictionary Keys    ${body}
    Log To Console  ${list}
    

    ${json_response}=  Convert To String    ${response.status_code}
    ${json_response1}=  Convert To String    ${response.content}
    

   Log To Console    ${json_response}
   Log To Console    ${body_temp}  
   Should Be Equal    ${json_response}    202

   ${json_name}             Get Value From JSON                 ${body}         $.birthday
   Log To Console           Value name is   ${json_name[0]}
  # Should Be Equal As Strings    ${json_name[0]}          
 
    ${obj}=  Convert To List  ${body}
    FOR     ${obj}     IN      @{body}
        Log To Console      ${obj}
    END

     
   # ${list0} =  Get From List  ${obj}  0
   # Log To Console          ${list0}
    ${datatype}=  evaluate  str(type(${body_temp}))
    should be equal  ${datatype}  <class 'dict'>
    Log To Console      ${datatype}


