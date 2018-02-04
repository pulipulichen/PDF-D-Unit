#include <File.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>
#pragma compile(Icon, 'icon.ico')

Local $qpdf = @ScriptDir & '\qpdf.exe'
;MsgBox($MB_SYSTEMMODAL, "", $qpdf)

Local $CommandLine = $CmdLine

For $i = 1 To $CommandLine[0]
   Local $file = $CommandLine[$i]
   ;MsgBox($MB_SYSTEMMODAL, "", $file)
   IF FileExists($file) = False Then
	  ContinueLoop
   EndIf

   Local $tmp = $file & "-tmp.pdf"

   If FileExists($tmp) Then
	  FileRecycle($tmp)
   EndIf

   ; D:\Desktop\qpdf\qpdf.exe --decrypt "D:\OUTTY_DOCUMENT\Zotero\storage\MG77PZEI\fb180204160226.pdf" "D:\Desktop\qpdf\qpdf.exe fb180204160226a.pdf"
   Local $qpdf_command = $qpdf & " --decrypt " & $file & " " & $tmp
   ;MsgBox($MB_SYSTEMMODAL, "", $qpdf_command)

   RunWait($qpdf_command)

   FileRecycle($file)
   FileMove($tmp, $file)
Next
