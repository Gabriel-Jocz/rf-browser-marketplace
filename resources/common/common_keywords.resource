*** Settings ***

Library                    Browser
Library                    OperatingSystem
Variables                  ${EXECDIR}/utils/config_variables.py
Resource                   ${EXECDIR}/resources/common/common_variables.resource

*** Keywords ***

Create browser
    New Browser            browser=${BROWSER}    headless=${HEADLESS}    args=["--disable-low-level"]
    Set Browser Timeout    30
    New Context            viewport={'width': 1600, 'height': 1080}
    New Page               url=${TESTED_HOST}

Create temporary text file
    [Arguments]    ${fileName}    ${fileExtension}    ${content}=Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    
    Create File    ${FILES_PATH}/${fileName}.${fileExtension}    ${content}
    Wait Until Created    ${FILES_PATH}/${fileName}.${fileExtension}

    RETURN    ${FILES_PATH}/${fileName}.${fileExtension}

Create temporary image file
    [Arguments]    ${fileName}    ${fileExtension}    ${content}=\x01\x00\xe4\x00
    
    Create Binary File    ${FILES_PATH}/${fileName}.${fileExtension}    ${content}
    Wait Until Created    ${FILES_PATH}/${fileName}.${fileExtension}

    RETURN    ${FILES_PATH}/${fileName}.${fileExtension}

Delete temporary files
    Empty Directory    ${FILES_PATH}
    Remove Directory    ${FILES_PATH}
    Wait Until Removed    ${FILES_PATH}