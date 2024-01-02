; AI DeskMate Internet Research

; This script uses AutoHotkey and OpenAI's AI models to perform internet research.

; ------------------------------
; Include Configuration and OpenAI Integration Files
; ------------------------------

#Include %A_ScriptDir%\config.ahk
#Include %A_ScriptDir%\openai_integration.ahk

; ------------------------------
; Internet Research
; ------------------------------

; Define a function to perform internet research
InternetResearch(query) {
    ; Use the OpenAI model to generate a search query
    searchQuery := OpenAI_Request(query)

    ; Use the Python requests library to make a GET request to the search engine
    RunWait, %PythonPath% -c "import requests; r = requests.get('https://www.google.com/search?q=' + '" . searchQuery . "'); print(r.text)", , output

    ; Use the Python BeautifulSoup library to parse the HTML of the search results
    RunWait, %PythonPath% -c "from bs4 import BeautifulSoup; soup = BeautifulSoup('" . output . "', 'html.parser'); print(soup.prettify())", , output

    ; Extract the search results from the parsed HTML
    RunWait, %PythonPath% -c "results = [result.text for result in soup.find_all('div', {'class': 'g'})]; print('\n'.join(results))", , output

    ; Return the search results
    return output
}

; ------------------------------
; End of Internet Research
; ------------------------------
