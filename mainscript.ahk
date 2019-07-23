#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;------------------------------------------------------------------------
; All Macro Keys from LogitechGaming Software
;------------------------------------------------------------------------
; 	G1 -> [CTRL SHIFT 1]
; 	G2 -> [CTRL SHIFT 2]
; 	G3 -> [CTRL SHIFT 3]
; 	G4 -> [CTRL SHIFT 4]
; 	G5 -> [CTRL SHIFT 5]
; 	G6 -> [CTRL SHIFT 6]




;------------------------------------------------------------------------
; Script/AHK initialization
;------------------------------------------------------------------------
^!a::edit %A_ScriptName%			; Open current script in editor
^!+a::run explorer.exe %A_ScriptDir%		; Open the current script's path




;------------------------------------------------------------------------
; Philips HUE/Other Lighting
;------------------------------------------------------------------------
!9::hue("mood")
!8::hue("off")

hue(event) { ;using ifttt maker api with given event
url :=  "https://maker.ifttt.com/trigger/" . event . "/with/key/ivp0CU0DOmQdjAcpFHMFpWekt04ns-U6k8HTTW-AFBa"
URLDownloadToFile, %url%, hueAPI
}

!0::
  toggle:=!toggle ;toggles up and down states.
  if toggle {
    hue("mood")
	Sleep, 2000
	run, D:\Documents\AutoHotKey\Scripts\lightstrip.lnk 
	
  } else {
    hue("off")
	Sleep, 2000
	run, D:\Documents\AutoHotKey\Scripts\lightstrip2.lnk
}
return




;------------------------------------------------------------------------
; Windows Functions
;------------------------------------------------------------------------
ScrollLock:: ;toggles between headphone and speaker outputs
  toggle:=!toggle ;toggles up and down states. 
  Run, mmsys.cpl 
  WinWait,Sound ; Change "Sound" to the name of the window in your local language 
  if toggle
    ControlSend,SysListView321,{Down 4} ; This number selects the matching audio device in the list, change it accordingly 
  Else
    ControlSend,SysListView321,{Down 5} ; This number selects the matching audio device in the list, change it accordingly 
  ControlClick,&Set Default ; Change "&Set Default" to the name of the button in your local language 
  ControlClick,OK 
return




;------------------------------------------------------------------------
;ALL G KEY MACROS FOR G613
;------------------------------------------------------------------------

^+1::g1()
^+2::g2()
^+3::g3()
^+4::g4()
^+5::g5()
^+6::secondDisplay()

; G1 macro key. Opens Google Chrome
g1() {
	IfWinNotExist, ahk_exe chrome.exe
		Run, chrome.exe
	if winactive("ahk_exe chrome.exe") {
		Sleep 10
		Send, ^{Tab}
	} else {
		WinActivate ahk_exe chrome.exe
	}
}
; G2 macro key. Opens spotify
g2() {
	if !WinExist("ahk_class Chrome_WidgetWin_0") {
		Run, Spotify.exe
	}
	WinActivate	ahk_class Chrome_WidgetWin_0
}
; G3 macro key. Opens Discord
g3() {
	if !WinExist("ahk_exe discord.exe") {
		Run, Update.exe --processStart Discord.exe, C:\Users\Ryan Angliss\AppData\Local\Discord\
	}
	WinActivate	ahk_exe Discord.exe
}
; G4 macro key. Opens Steam
g4() {
	if !WinExist("ahk_exe Steam.exe") {
		Run, C:\Program Files (x86)\Steam\Steam.exe
	}
	WinActivate	ahk_exe Steam.exe
}
; G5 macro key. Opens Premiere Pro
g5() {
	if !WinExist("ahk_exe Adobe Premiere Pro.exe") {
		Run, Adobe Premiere Pro.exe
	}
	WinActivate	ahk_exe Adobe Premiere Pro.exe
}
; G6 macro key. Moves active window to second display with WIN UP ARROW and SHIFT WIN LEFT/RIGHT
secondDisplay() {
	send #{up} ; (WIN UP -> Maximize)
	Sleep 200
	sendinput +#{left} ; (SHIFT WIN LEFT/RIGHT -> Move between displays)
}




;------------------------------------------------------------------------
; F1-F8 keys (search functions) 
;------------------------------------------------------------------------
; Chrome -> Searches google in search bar 
; Explorer -> Search bar

F1::f1()
F2::f2()
F3::f3()
F4::f4()
F5::f5()

f1() {
	if winactive("ahk_exe chrome.exe") {
		sendinput ^t
		Sleep 200
		Send {Blind}{Text}https://www.youtube.com/
		sendinput {Enter}
	} else if winactive("ahk_class CabinetWClass") {
		run D:\Desktop
	} else if WinActive("ahk_exe discord.exe") {
		sendinput, {insert}
	}

}
f2() {
	if winactive("ahk_exe chrome.exe") {
		sendinput ^t
		Sleep 200
		Send {Blind}{Text}https://mail.google.com/mail/u/0/#inbox
		sendinput {Enter}
	} else if winactive("ahk_class CabinetWClass") {
		run D:\Documents
	} 
}
f3() {
	if winactive("ahk_exe chrome.exe") {
		sendinput ^t
		Sleep 200
		Send {Blind}{Text}https://drive.google.com/drive/u/0/my-drive
		sendinput {Enter}
	} else if winactive("ahk_class CabinetWClass") {
		run D:\Downloads
	}
}
f4() {
	if winactive("ahk_exe chrome.exe") {
		sendinput ^t
		Sleep 200
		Send {Blind}{Text}https://calendar.google.com
		sendinput {Enter}
	} else if winactive("ahk_class CabinetWClass") {
		run D:\Desktop\Hardware Control
	}
}
f5() {
	if winactive("ahk_exe chrome.exe") {
		sendinput ^h ;history
	}
}



^+x::ExitApp 
