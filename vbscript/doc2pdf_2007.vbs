
'http://www.suodenjoki.dk/us/productions/articles/word2pdf.htm
'This article describe how you can convert Microsoft Word documents to Adobe PDF documents using a command line VBScript and Automation.
'This article (v2.0) was updated July 7, 2007 to support Word 2007. It requires Word 2007 or its requires Word 2003 and Adobe Acrobat (Distiller).
'I have for some time wanted a command line tool for converting some Word documents into PDF documents during an automatic build process of a software product. As I knew that Word can be "automated" via Automation it was a straightforward task to create a small VB script program that can be executed on the command line.
'A very good thing with Word 2007 is that you can download and install a Save As PDF add-in allowing you to save directly to PDF (or XPS for that matter). This means that the Adobe Distiller is no longer required. The old article code - originally written for Word 2003 - is however maintained in appendix B.
'Note that Word 2007 can be used to convert Word documents created in Word 2003 or older without touching the original Word document.

'You should create a text file and save it as e.g. doc2pdf.vbs.

'When you want to run the code you can do so with the following command line:

'  C:> cscript /nologo <path to doc2pdf.vbs> /nologo <path to Word document>

'This tells the system to use the Windows cscript VB script command line processor with the doc2pdf.vbs script, 
'the /nologo option and the word document to convert to PDF. 
'The output PDF file will per default be named the same as the original Word document only with the difference of having the pdf file extension. 
'The script can optionally take a parameter specifying another file name for the output file - using option like /o:<output file>.

'Requirements for the VB script code in this appendix:
'(1) Microsoft Word 2007,
'(2) Office Add-in: Save as PDF or alternatively if you also want XPS support the  Office Add-in: Save as PDF and XPS.
'(3) VB Scripting Host v5.6 or newer


'Appendix A: VB Script Source Code (Word 2007)
'Requirements for the VB script code in this appendix:

'Microsoft Word 2007,
'Office Add-in: Save as PDF or alternatively if you also want XPS support the  Office Add-in: Save as PDF and XPS.
'VB Scripting Host v5.6 or newer
'************************************************
'
' DOC2PDF.VBS Microsoft Scripting Host Script (Requires Version 5.6 or newer)
' --------------------------------------------------------------------------------
'
' Author: Michael Suodenjoki
' Created: 2007.07.07
'
' This script can create a PDF file from a Word document provided you're using
' Word 2007 and have the 'Office Add-in: Save As PDF' installed.
'

' Constants
Const WdDoNotSaveChanges = 0

' see WdSaveFormat enumeration constants: 
' http://msdn2.microsoft.com/en-us/library/bb238158.aspx
Const wdFormatPDF = 17  ' PDF format. 
Const wdFormatXPS = 18  ' XPS format. 


' Global variables
Dim arguments
Set arguments = WScript.Arguments

' ***********************************************
' ECHOLOGO
'
' Outputs the logo information.
'
Function EchoLogo()
  If Not (arguments.Named.Exists("nologo") Or arguments.Named.Exists("n")) Then
    WScript.Echo "doc2pdf Version 2.0, Michael Suodenjoki 2007"
    WScript.Echo "=================================================="
    WScript.Echo ""
  End If
End Function

' ***********************************************
' ECHOUSAGE
'
' Outputs the usage information.
'
Function EchoUsage()
  If arguments.Count=0 Or arguments.Named.Exists("help") Or _
    arguments.Named.Exists("h") _
  Then
    WScript.Echo "Generates a PDF from a Word document file using Word 2007."
    WScript.Echo ""
    WScript.Echo "Usage: doc2pdf.vbs <options> <doc-file> [/o:<pdf-file>]"
    WScript.Echo ""
    WScript.Echo "Available Options:"
    WScript.Echo ""
    WScript.Echo " /nologo - Specifies that the logo shouldn't be displayed"
    WScript.Echo " /help   - Specifies that this usage/help information " + _
                 "should be displayed."
    WScript.Echo " /debug  - Specifies that debug output should be displayed."
    WScript.Echo ""
    WScript.Echo "Parameters:"
    WScript.Echo ""
    WScript.Echo " /o:<pdf-file> Optionally specification of output file (PDF)."
    WScript.Echo ""
  End If 
End Function

' ***********************************************
' CHECKARGS
'
' Makes some preliminary checks of the arguments.
' Quits the application is any problem is found.
'
Function CheckArgs()
  ' Check that <doc-file> is specified
  If arguments.Unnamed.Count <> 1 Then
    WScript.Echo "Error: Obligatory <doc-file> parameter missing!"
    WScript.Quit 1
  End If

  bShowDebug = arguments.Named.Exists("debug") Or arguments.Named.Exists("d")

End Function


' ***********************************************
' DOC2PDF
'
' Converts a Word document to PDF using Word 2007.
'
' Input:
' sDocFile - Full path to Word document.
' sPDFFile - Optional full path to output file.
'
' If not specified the output PDF file
' will be the same as the sDocFile except
' file extension will be .pdf.
'
Function DOC2PDF( sDocFile, sPDFFile )

  Dim fso ' As FileSystemObject
  Dim wdo ' As Word.Application
  Dim wdoc ' As Word.Document
  Dim wdocs ' As Word.Documents
  Dim sPrevPrinter ' As String

  Set fso = CreateObject("Scripting.FileSystemObject")
  Set wdo = CreateObject("Word.Application")
  Set wdocs = wdo.Documents

  sDocFile = fso.GetAbsolutePathName(sDocFile)

  ' Debug outputs...
  If bShowDebug Then
    WScript.Echo "Doc file = '" + sDocFile + "'"
    WScript.Echo "PDF file = '" + sPDFFile + "'"
  End If

  sFolder = fso.GetParentFolderName(sDocFile)

  If Len(sPDFFile)=0 Then
    sPDFFile = fso.GetBaseName(sDocFile) + ".pdf"
  End If

  If Len(fso.GetParentFolderName(sPDFFile))=0 Then
    sPDFFile = sFolder + "\" + sPDFFile
  End If

  ' Enable this line if you want to disable autoexecute macros
  ' wdo.WordBasic.DisableAutoMacros

  ' Open the Word document
  Set wdoc = wdocs.Open(sDocFile)

  ' Let Word document save as PDF
  ' - for documentation of SaveAs() method,
  '   see http://msdn2.microsoft.com/en-us/library/bb221597.aspx 
  wdoc.SaveAs sPDFFile, wdFormatPDF

  wdoc.Close WdDoNotSaveChanges
  wdo.Quit WdDoNotSaveChanges
  Set wdo = Nothing

  Set fso = Nothing

End Function

' *** MAIN **************************************

Call EchoLogo()
Call EchoUsage()
Call CheckArgs()
Call DOC2PDF( arguments.Unnamed.Item(0), arguments.Named.Item("o") )

Set arguments = Nothing
 

