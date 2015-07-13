; #FUNCTION# ====================================================================================================================
; Name ..........: CGB GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func chkSearchReduction()
	If GUICtrlRead($chkSearchReduction) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtSearchReduceCount, False)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceGold, False)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceElixir, False)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceGoldPlusElixir, False)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceDark, False)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceTrophy, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtSearchReduceCount, True)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceGold, True)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceGoldPlusElixir, True)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceElixir, True)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceDark, True)
		_GUICtrlEdit_SetReadOnly($txtSearchReduceTrophy, True)
	EndIf
EndFunc   ;==>chkSearchReduction

Func cmbSearchMode()
	Switch _GUICtrlComboBox_GetCurSel($cmbSearchMode)
		Case 0
			For $i = $chkABEnableAfter To $lblABEnableAfter
				GUICtrlSetState($i, $GUI_HIDE)
			Next
			For $i = $chkDBEnableAfter To $lblDBEnableAfter
				GUICtrlSetState($i, $GUI_HIDE)
			Next
			For $i = $cmbABMeetGE To $chkABMeetOne
				GUICtrlSetState($i, $GUI_DISABLE)
			Next
			For $i = $cmbDBMeetGE To $chkDBMeetOne
				If $i = $cmbDBTH And GUICtrlRead($chkDBMeetTH) = $GUI_UNCHECKED Then $i += 1
				If ($i = $cmbDBWeakMortar Or $i = $cmbDBWeakWizTower) And GUICtrlRead($chkDBWeakBase) = $GUI_UNCHECKED Then $i += 1
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
		Case 1
			For $i = $chkABEnableAfter To $lblABEnableAfter
				GUICtrlSetState($i, $GUI_HIDE)
			Next
			For $i = $chkDBEnableAfter To $lblDBEnableAfter
				GUICtrlSetState($i, $GUI_HIDE)
			Next
			For $i = $cmbDBMeetGE To $chkDBMeetOne
				GUICtrlSetState($i, $GUI_DISABLE)
			Next
			For $i = $cmbABMeetGE To $chkABMeetOne
				If $i = $cmbABTH And GUICtrlRead($chkABMeetTH) = $GUI_UNCHECKED Then $i += 1
				If ($i = $cmbABWeakMortar Or $i = $cmbABWeakWizTower) And GUICtrlRead($chkABWeakBase) = $GUI_UNCHECKED Then $i += 1
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
		Case 2
			For $i = $chkABEnableAfter To $lblABEnableAfter
				GUICtrlSetState($i, $GUI_SHOW)
			Next
			For $i = $chkDBEnableAfter To $lblDBEnableAfter
				GUICtrlSetState($i, $GUI_SHOW)
			Next
			For $i = $cmbABMeetGE To $chkABMeetOne
				If $i = $cmbABTH And GUICtrlRead($chkABMeetTH) = $GUI_UNCHECKED Then $i += 1
				If ($i = $cmbABWeakMortar Or $i = $cmbABWeakWizTower) And GUICtrlRead($chkABWeakBase) = $GUI_UNCHECKED Then $i += 1
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
			For $i = $cmbDBMeetGE To $chkDBMeetOne
				If $i = $cmbDBTH And GUICtrlRead($chkDBMeetTH) = $GUI_UNCHECKED Then $i += 1
				If ($i = $cmbDBWeakMortar Or $i = $cmbDBWeakWizTower) And GUICtrlRead($chkDBWeakBase) = $GUI_UNCHECKED Then $i += 1
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
	EndSwitch
EndFunc   ;==>cmbSearchMode

Func chkDBEnableAfter()
	If GUICtrlRead($chkDBEnableAfter) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtDBEnableAfter, False)
		GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
		_GUICtrlEdit_SetReadOnly($txtABEnableAfter, True)
	Else
		_GUICtrlEdit_SetReadOnly($txtDBEnableAfter, True)
	EndIf
EndFunc   ;==>chkDBEnableAfter

Func cmbDBGoldElixir()
	If _GUICtrlComboBox_GetCurSel($cmbDBMeetGE) < 2 Then
		GUICtrlSetState($txtDBMinGold, $GUI_SHOW)
		GUICtrlSetState($picDBMinGold, $GUI_SHOW)
		GUICtrlSetState($txtDBMinElixir, $GUI_SHOW)
		GUICtrlSetState($picDBMinElixir, $GUI_SHOW)
		GUICtrlSetState($txtDBMinGoldPlusElixir, $GUI_HIDE)
		GUICtrlSetState($picDBMinGPEGold, $GUI_HIDE)
		GUICtrlSetState($lblDBMinGPE, $GUI_HIDE)
		GUICtrlSetState($picDBMinGPEElixir, $GUI_HIDE)
	Else
		GUICtrlSetState($txtDBMinGold, $GUI_HIDE)
		GUICtrlSetState($picDBMinGold, $GUI_HIDE)
		GUICtrlSetState($txtDBMinElixir, $GUI_HIDE)
		GUICtrlSetState($picDBMinElixir, $GUI_HIDE)
		GUICtrlSetState($txtDBMinGoldPlusElixir, $GUI_SHOW)
		GUICtrlSetState($picDBMinGPEGold, $GUI_SHOW)
		GUICtrlSetState($lblDBMinGPE, $GUI_SHOW)
		GUICtrlSetState($picDBMinGPEElixir, $GUI_SHOW)
	EndIf
EndFunc   ;==>cmbDBGoldElixir

Func chkDBMeetDE()
	If GUICtrlRead($chkDBMeetDE) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtDBMinDarkElixir, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtDBMinDarkElixir, True)
	EndIf
EndFunc   ;==>chkDBMeetDE

Func chkDBMeetTrophy()
	If GUICtrlRead($chkDBMeetTrophy) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtDBMinTrophy, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtDBMinTrophy, True)
	EndIf
EndFunc   ;==>chkDBMeetTrophy

Func chkDBMeetTH()
	If GUICtrlRead($chkDBMeetTH) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCurSel($cmbSearchMode) <> 1 Then GUICtrlSetState($cmbDBTH, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbDBTH, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkDBMeetTH

Func chkDBWeakBase()
	If GUICtrlRead($chkDBWeakBase) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCurSel($cmbSearchMode) <> 1 Then
			GUICtrlSetState($cmbDBWeakMortar, $GUI_ENABLE)
			GUICtrlSetState($cmbDBWeakWizTower, $GUI_ENABLE)
		EndIf
	Else
		GUICtrlSetState($cmbDBWeakMortar, $GUI_DISABLE)
		GUICtrlSetState($cmbDBWeakWizTower, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkDBWeakBase

Func chkABEnableAfter()
	If GUICtrlRead($chkABEnableAfter) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABEnableAfter, False)
		GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
		_GUICtrlEdit_SetReadOnly($txtDBEnableAfter, True)
	Else
		_GUICtrlEdit_SetReadOnly($txtABEnableAfter, True)
	EndIf
EndFunc   ;==>chkABEnableAfter

Func cmbABGoldElixir()
	If _GUICtrlComboBox_GetCurSel($cmbABMeetGE) < 2 Then
		GUICtrlSetState($txtABMinGold, $GUI_SHOW)
		GUICtrlSetState($picABMinGold, $GUI_SHOW)
		GUICtrlSetState($txtABMinElixir, $GUI_SHOW)
		GUICtrlSetState($picABMinElixir, $GUI_SHOW)
		GUICtrlSetState($txtABMinGoldPlusElixir, $GUI_HIDE)
		GUICtrlSetState($picABMinGPEGold, $GUI_HIDE)
		GUICtrlSetState($lblABMinGPE, $GUI_HIDE)
		GUICtrlSetState($picABMinGPEElixir, $GUI_HIDE)
	Else
		GUICtrlSetState($txtABMinGold, $GUI_HIDE)
		GUICtrlSetState($picABMinGold, $GUI_HIDE)
		GUICtrlSetState($txtABMinElixir, $GUI_HIDE)
		GUICtrlSetState($picABMinElixir, $GUI_HIDE)
		GUICtrlSetState($txtABMinGoldPlusElixir, $GUI_SHOW)
		GUICtrlSetState($picABMinGPEGold, $GUI_SHOW)
		GUICtrlSetState($lblABMinGPE, $GUI_SHOW)
		GUICtrlSetState($picABMinGPEElixir, $GUI_SHOW)
	EndIf
EndFunc   ;==>cmbABGoldElixir

Func chkABMeetDE()
	If GUICtrlRead($chkABMeetDE) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABMinDarkElixir, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtABMinDarkElixir, True)
	EndIf
EndFunc   ;==>chkABMeetDE

Func chkABMeetTrophy()
	If GUICtrlRead($chkABMeetTrophy) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABMinTrophy, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtABMinTrophy, True)
	EndIf
EndFunc   ;==>chkABMeetTrophy

Func chkABMeetTH()
	If GUICtrlRead($chkABMeetTH) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCurSel($cmbSearchMode) > 0 Then GUICtrlSetState($cmbABTH, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbABTH, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABMeetTH

Func chkABWeakBase()
	If GUICtrlRead($chkABWeakBase) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCurSel($cmbSearchMode) > 0 Then
			GUICtrlSetState($cmbABWeakMortar, $GUI_ENABLE)
			GUICtrlSetState($cmbABWeakWizTower, $GUI_ENABLE)
		EndIf
	Else
		GUICtrlSetState($cmbABWeakMortar, $GUI_DISABLE)
		GUICtrlSetState($cmbABWeakWizTower, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABWeakBase

Func btnSearchMode()
	While 1
		GUICtrlSetState($btnStart, $GUI_HIDE)
		GUICtrlSetState($btnStop, $GUI_SHOW)
		;GUICtrlSetState($btnMakeScreenshot, $GUI_DISABLE)
		GUICtrlSetState($btnLocateBarracks, $GUI_DISABLE)
		;GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_DISABLE)
		GUICtrlSetState($chkBackground, $GUI_DISABLE)
		;GUICtrlSetState($btnLocateCollectors, $GUI_DISABLE)

		$MeetCondStop = False
		$RunState = True
		PrepareSearch()
		If _Sleep(1000) Then Return
		VillageSearch()
		$RunState = False

		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStop, $GUI_HIDE)

		GUICtrlSetState($btnLocateBarracks, $GUI_ENABLE)
		;GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_ENABLE)
		GUICtrlSetState($chkBackground, $GUI_ENABLE)
		;GUICtrlSetState($btnLocateCollectors, $GUI_ENABLE)
		ExitLoop
	WEnd
EndFunc   ;==>btnSearchMode


Func hidehero()
	GUICtrlSetState($btnHeroSwitch, $GUI_SHOW)
	GUICtrlSetState($btnNormalSwitch, $GUI_HIDE)
	For $i = $grpSearchMode To $picSearchReduceTrophy
		GUICtrlSetState($i, $GUI_HIDE)
	Next
	For $i = $grpSkipCentreDE To $cmbABMeetGEHero
		GUICtrlSetState($i, $GUI_SHOW)

	Next
	cmbABGoldElixirHero()
	For $i = $chkABMeetDEHero To $chkABMeetOneHero
		GUICtrlSetState($i, $GUI_SHOW)
	Next
EndFunc
Func hidenormal()
	GUICtrlSetState($btnNormalSwitch, $GUI_SHOW)
	GUICtrlSetState($btnHeroSwitch, $GUI_HIDE)
	For $i = $grpSkipCentreDE To $chkABMeetOneHero
		GUICtrlSetState($i, $GUI_HIDE)
	Next
	For $i = $grpSearchMode To $grpDeadBaseConditions
		GUICtrlSetState($i, $GUI_SHOW)
	Next
	cmbSearchMode()
	GUICtrlSetState($cmbDBMeetGE, $GUI_SHOW)
	cmbDBGoldElixir()
	For $i = $chkDBMeetDE To $grpLiveBaseConditions
		GUICtrlSetState($i, $GUI_SHOW)
	Next
	GUICtrlSetState($cmbABMeetGE, $GUI_SHOW)
	cmbABGoldElixir()
	For $i = $chkABMeetDE To $picSearchReduceTrophy
		GUICtrlSetState($i, $GUI_SHOW)
	Next

EndFunc

Func chkABEnableAfterHero()
	If GUICtrlRead($chkABEnableAfterHero) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABEnableAfter, False)
		GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
		_GUICtrlEdit_SetReadOnly($txtDBEnableAfter, True)
	Else
		_GUICtrlEdit_SetReadOnly($txtABEnableAfter, True)
	EndIf
EndFunc   ;==>chkABEnableAfter

Func cmbABGoldElixirHero()
	If _GUICtrlComboBox_GetCurSel($cmbABMeetGEHero) < 2 Then
		GUICtrlSetState($txtABMinGoldHero, $GUI_SHOW)
		GUICtrlSetState($picABMinGoldHero, $GUI_SHOW)
		GUICtrlSetState($txtABMinElixirHero, $GUI_SHOW)
		GUICtrlSetState($picABMinElixirHero, $GUI_SHOW)
		GUICtrlSetState($txtABMinGoldPlusElixirHero, $GUI_HIDE)
		GUICtrlSetState($picABMinGPEGoldHero, $GUI_HIDE)
		GUICtrlSetState($lblABMinGPEHero, $GUI_HIDE)
		GUICtrlSetState($picABMinGPEElixirHero, $GUI_HIDE)
	Else
		GUICtrlSetState($txtABMinGoldHero, $GUI_HIDE)
		GUICtrlSetState($picABMinGoldHero, $GUI_HIDE)
		GUICtrlSetState($txtABMinElixirHero, $GUI_HIDE)
		GUICtrlSetState($picABMinElixirHero, $GUI_HIDE)
		GUICtrlSetState($txtABMinGoldPlusElixirHero, $GUI_SHOW)
		GUICtrlSetState($picABMinGPEGoldHero, $GUI_SHOW)
		GUICtrlSetState($lblABMinGPEHero, $GUI_SHOW)
		GUICtrlSetState($picABMinGPEElixirHero, $GUI_SHOW)
	EndIf
EndFunc   ;==>cmbABGoldElixirHero

Func chkABMeetDEHero()
	If GUICtrlRead($chkABMeetDEHero) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABMinDarkElixirHero, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtABMinDarkElixirHero, True)
	EndIf
EndFunc   ;==>chkABMeetDEHero

Func chkABMeetTrophyHero()
	If GUICtrlRead($chkABMeetTrophyHero) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABMinTrophyHero, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtABMinTrophyHero, True)
	EndIf
EndFunc   ;==>chkABMeetTrophyHero

Func chkABMeetTHHero()
	If GUICtrlRead($chkABMeetTHHero) = $GUI_CHECKED Then
		GUICtrlSetState($cmbABTHHero, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbABTHHero, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABMeetTHHero

Func chkABWeakBaseHero()
	If GUICtrlRead($chkABWeakBaseHero) = $GUI_CHECKED Then
			GUICtrlSetState($cmbABWeakMortarHero, $GUI_ENABLE)
			GUICtrlSetState($cmbABWeakWizTowerHero, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbABWeakMortarHero, $GUI_DISABLE)
		GUICtrlSetState($cmbABWeakWizTowerHero, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABWeakBaseHero










