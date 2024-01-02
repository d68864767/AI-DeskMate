; AI DeskMate OpenAI Integration

; This script integrates OpenAI's AI models with AutoHotkey for desktop automation.

; ------------------------------
; Include Configuration File
; ------------------------------

#Include %A_ScriptDir%\config.ahk

; ------------------------------
; OpenAI Integration
; ------------------------------

; Define the OpenAI API endpoint
OpenAI_API_Endpoint := "https://api.openai.com/v1/engines/" . OpenAI_Model . "/completions"

; Define the headers for the OpenAI API request
OpenAI_API_Headers := "Content-Type: application/json`nAuthorization: Bearer " . OpenAI_API_Key

; Define a function to make a request to the OpenAI API
OpenAI_Request(prompt, max_tokens := 60, temperature := 0.5) {
    ; Define the data for the OpenAI API request
    data := "{""prompt"": """ . prompt . """, ""max_tokens"": " . max_tokens . ", ""temperature"": " . temperature . "}"

    ; Make the request to the OpenAI API
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    whr.Open("POST", OpenAI_API_Endpoint, true)
    whr.SetRequestHeader("Content-Type", "application/json")
    whr.SetRequestHeader("Authorization", "Bearer " . OpenAI_API_Key)
    whr.Send(data)
    whr.WaitForResponse()
    response := whr.ResponseText

    ; Parse the response from the OpenAI API
    response := JSON.Load(response)
    return response.choices[1].text.strip()
}

; ------------------------------
; End of OpenAI Integration
; ------------------------------
