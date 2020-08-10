Adapted from https://github.com/charlesdh/addfwrs by Charles de Havilland.

Run batch as admin from topmost directory you want to add rules for. Rules will be created for all .exe files in the directory the batch is run from and in all subdirectories.

Rule name format: DirectoryWhereBatchIsExecuted-ExeName.exe
Subdirectories are not appended to the rule name. e.g. running from C:\Program Files\Mozilla Firefox\ will result in rules such as "Mozilla Firefox-helper.exe" even though helper.exe is in C:\Program Files\Mozilla Firefox\uninstall\

Known issues:
cmd.exe can't handle UNC paths (\\server\dir\) and there's nothing I can do about that. Ask Microsoft why they do this.
