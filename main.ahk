; AI DeskMate Main Script

; This script is the main entry point for AI DeskMate. It includes all the other scripts and provides a user interface for interacting with the system.

; ------------------------------
; Include Configuration and Feature Scripts
; ------------------------------

#Include %A_ScriptDir%\config.ahk
#Include %A_ScriptDir%\openai_integration.ahk
#Include %A_ScriptDir%\file_organizer.ahk
#Include %A_ScriptDir%\email_drafting.ahk
#Include %A_ScriptDir%\internet_research.ahk

; ------------------------------
; Main User Interface
; ------------------------------

Gui, Add, Text,, Welcome to AI DeskMate! Please select a task:
Gui, Add, Button, gOrganizeFiles, Organize Files
Gui, Add, Button, gDraftEmail, Draft Email
Gui, Add, Button, gInternetResearch, Perform Internet Research
Gui, Show
return

; ------------------------------
; Button Callbacks
; ------------------------------

OrganizeFiles:
    Gui, Submit
    OrganizeFiles()
    MsgBox, Files have been organized!
return

DraftEmail:
    Gui, Submit
    InputBox, subject, Draft Email, Please enter the subject of the email.
    InputBox, body, Draft Email, Please enter a brief description of the email content.
    email_draft := DraftEmail(subject, body)
    MsgBox, % "Email Draft:`n`n" . email_draft
return

InternetResearch:
    Gui, Submit
    InputBox, query, Internet Research, Please enter your research query.
    research_summary := PerformInternetResearch(query)
    MsgBox, % "Research Summary:`n`n" . research_summary
return

; ------------------------------
; End of Main Script
; ------------------------------
