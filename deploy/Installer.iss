[Setup]
SignTool=signtool
AppName=TemplateApp
AppVersion=0.0.0.1
WizardStyle=modern
DefaultDirName=C:\TemplateApp
DefaultGroupName=TemplateApp
Compression=lzma2
SolidCompression=yes

[Files]
Source: "prjTemplateApp.exe"; DestDir: "{app}"
Source: "template.db"; DestDir: "{app}"; Flags: onlyifdoesntexist; 
Source: "versionLocal.ini"; DestDir: "{app}" 

[Icons]
Name: "{userdesktop}\Template App"; Filename: "{app}\prTemplateApp.exe"