*** Settings ***

Resource    ${EXECDIR}/resources/common/common_keywords.resource

*** Test Cases ***

Example Test
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright