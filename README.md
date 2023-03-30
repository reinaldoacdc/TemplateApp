# TemplateApp
 
## Deploy
### How to sign the application after building it 
 - Go to Project -> Options -> Building -> Build Events.
 - Select Target = Release Configuration
 - Fill PostBuildEvent.Command = `"C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x86\signtool.exe" sign /tr http://timestamp.digicert.com /f "C:\Projetos\reinaldoacdc.pfx" /p MINHA-SENHA "$(OUTPUTPATH)"  `