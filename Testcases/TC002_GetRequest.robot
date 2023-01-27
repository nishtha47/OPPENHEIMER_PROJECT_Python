*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections



***Variables***
${BASE_URL}     http://localhost:8080/

***Test Cases***
TC002_GetRequest
        create session  Get_Employee_Details    $(BASE_URL)
        ${response}=            get request             Get_Employee_Details            calculator/taxReliefSummary/
        log to console  ${response}