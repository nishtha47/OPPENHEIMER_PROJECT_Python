
*** Settings ***
Documentation     Basic Web testing
Library           Screenshot
Library           SeleniumLibrary
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers
Library     Transformcolor.py


*** Variables ***
${URL}            http://localhost:8080/
${BROWSER}        Chrome
${MAIN_PAGE_DISPENSE_LOCATOR}         xpath://a[@role='button'][text()='Dispense Now']
${cashdisp}       Cash dispensed
${css_attribute}            css= a.btn.btn-danger
${ExpectedText}            rgba(220, 53, 69, 1)    

*** Keywords ***
Get CSS Property Value
    [Documentation]
    ...    Get the CSS property value of an Element.
    ...    
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...    
    ...    Arguments:
    ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name     (string)    the name of the css property for which the value is returned.
    ...    
    ...    Returns             (string)    returns the string value of the given css attribute or fails.
    ...        
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    [Return]     ${prop_val}
         


*** Test Cases ***
Dispense Now Button On Screen
    [Documentation]    This test validates Dispense
    ...    now button
    Set Window Size    1000    800
    Wait Until Element Is Enabled    ${MAIN_PAGE_DISPENSE_LOCATOR}
   # ${SELECTEDGREEN}        Get Element Attribute    ${MAIN_PAGE_DISPENSE_LOCATOR}
    # a CSS property from the element.
    ${id}=      Get Element Attribute   css:a[href='dispense']  id
    Log To Console    ${id}
    ${element_prop}=    Get CSS Property Value    css= a.btn.btn-danger    background-color
    Log To Console    ${element_prop}
    
   # ${hex_color}    transform RGB to HEX    ${element_prop}
    #Log To Console    ${hex_color}
   # ${ExpectedText}   rgba(220, 53, 69, 1)  
    Run keyword if  "${element_prop}"=="${ExpectedText}"  Log To Console   True
    
  Should Be True      "${element_prop}"=="${ExpectedText}"
    
    Should Be Equal As Strings     ${element_prop}     rgba(220, 53, 69, 1)
    Log To Console      Validates Background color of element as Red


Validate Dispense text
    [Documentation]    This test validates Dispense
    ...    now button text
    [Tags]     UI
     ${response}    Get Text    ${MAIN_PAGE_DISPENSE_LOCATOR}
    Should Be Equal As Strings    ${response}    Dispense Now
  #  ${bg color}     Call Method    ${MAIN_PAGE_DISPENSE_LOCATOR}        value_of_css_property       background-color 

Validate Cash dispensed
    [Documentation]     This test validates Dispense
    ...    now button direct to Cash dispense
    [Tags]      UI
    Wait Until Page Contains Element    ${MAIN_PAGE_DISPENSE_LOCATOR}   60s
    Double Click Element    ${MAIN_PAGE_DISPENSE_LOCATOR}
    Page Should contain Element     //div[@class='container']
    Page should contain element     xpath://*[contains(text(), "${cashdisp}")]