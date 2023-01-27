*** Settings ***
Documentation       API Test using RESTfulBooker application
Test Timeout        1 minute
Library             RequestsLibrary
Library             Collections
Library             JsonValidator
Library             Process
Library             OperatingSystem


*** Variables ***
#ENDPOINTS              ---
${BASE_URL}             http://localhost:8080/
${Getendpointsingle}    calculator/taxReliefSummary/

***Test Cases***

TC_001
  [documentation]  As the Clerk, I should be able to insert a single record of working class hero into database via an API
  
    Create Session      Get_WorkingClassHero_Details        ${BASE_URL}     verify=True
     ${resp}=        Get request               Get_WorkingClassHero_Details              ${Getendpointsingle}
     Log        ${resp}
     Should Be Equal As Strings      ${resp.status_code}     200
     log to console       ${resp.content}
     ${status_code}=  Convert To String   ${resp.status_code}



