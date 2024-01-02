; AI DeskMate File Organizer

; This script uses AutoHotkey and OpenAI's AI models to categorize and organize files based on content and user behavior.

; ------------------------------
; Include Configuration and OpenAI Integration Files
; ------------------------------

#Include %A_ScriptDir%\config.ahk
#Include %A_ScriptDir%\openai_integration.ahk

; ------------------------------
; File Organizer
; ------------------------------

; Define the directory to organize
OrganizeDirectory := "C:\Users\YourUsername\Documents"

; Define the categories for file organization
Categories := ["Work", "Personal", "Finance", "Entertainment", "Education"]

; Define a function to organize files
OrganizeFiles() {
    ; Loop through all files in the directory
    Loop, Files, %OrganizeDirectory%\*.*
    {
        ; Get the content of the file
        FileRead, content, %A_LoopFileFullPath%

        ; Use the OpenAI model to predict the category of the file
        category := OpenAI_Request(content)

        ; If the predicted category is not in the defined categories, set it to "Other"
        if (category not in %Categories%) {
            category := "Other"
        }

        ; Create the category directory if it does not exist
        if (!FileExist(OrganizeDirectory . "\" . category)) {
            FileCreateDir, %OrganizeDirectory%\%category%
        }

        ; Move the file to the category directory
        FileMove, %A_LoopFileFullPath%, %OrganizeDirectory%\%category%
    }
}

; Call the function to organize files
OrganizeFiles()

; ------------------------------
; End of File Organizer
; ------------------------------
