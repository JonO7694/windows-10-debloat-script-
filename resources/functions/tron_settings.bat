:: Purpose:       Tron's settings script, called when it launches. Customize this file to change how Tron behaves. 
::                Sub-stage scripts also call this file if they're launched directly.
:: Requirements:  n/a
:: Author:        vocatus on reddit.com/r/TronScript ( vocatus.gate at gmail ) // PGP key: 0x07d1490f82a211a2
:: Version:       1.0.4 + Add PRESERVE_MALWAREBYTES (-rmb) switch to have Tron automatically remove Malwarebytes at the end of the run
::                      + Add SKIP_COOKIE_CLEANUP (-scc) switch to have Tron preserve ALL cookies. Thanks to tbr:sebastian
::                1.0.3 + Add SKIP_ONEDRIVE_REMOVAL (-sor) switch. Thanks to github:ptrkhh
::                1.0.2 - Remove references to Java
::                1.0.1 + Add AUTORUN_IN_SAFE_MODE (-asm) switch and associated variable. Combine this with -a to automatically reboot to Safe Mode prior to running (legacy behavior)
::                1.0.0 . Initial write; forked out of v9.9.0 of tron.bat

:: Script version
set TRON_SETTINGS_SCRIPT_VERSION=1.0.4
set TRON_SETTINGS_SCRIPT_DATE=2020-02-05


:::::::::::::::
:: VARIABLES ::
:::::::::::::::
:: Rules for variables:
::  * NO quotes!                    (bad:  "c:\directory\path"       )
::  * NO trailing slashes on paths! (bad:   c:\directory\            )
::  * Spaces are okay               (okay:  c:\my folder\with spaces )
::  * Network paths are okay        (okay:  \\server\share name      )

:: LOGPATH is the parent directory for all of Tron's output (logs, backups, etc). Tweak the paths below to your liking if you want to change it
:: If you want a separate directory generated per Tron run (for example if doing multiple runs for testing), use something like this:
::   set LOGPATH=%SystemDrive%\logs\tron\%COMPUTERNAME%_%DTS%
set LOGPATH=%SystemDrive%\logs\tron

:: Master log file. To differentiate logfiles if you're doing multiple runs, you can do something like:
::  set LOGFILE=tron_%COMPUTERNAME%_%DTS%.log
set LOGFILE=tron.log

:: Where Tron should save files that the various virus scanners put in quarantine. Currently unused (created, but nothing is stored here)
set QUARANTINE_PATH=%LOGPATH%\quarantine

:: Registry, Event Logs, and power scheme backups are all saved here
set BACKUPS=%LOGPATH%\backups

:: Where to save raw unprocessed logs from the various sub-tools
set RAW_LOGS=%LOGPATH%\raw_logs

:: Where to save the summary logs (created from the raw logs)
set SUMMARY_LOGS=%LOGPATH%\summary_logs


set AUTORUN=no
set AUTORUN_IN_SAFE_MODE=no
set DRY_RUN=no
set DEV_MODE=no
set EULA_ACCEPTED=no
set EMAIL_REPORT=no
set PRESERVE_METRO_APPS=no
set NO_PAUSE=no
set AUTO_SHUTDOWN=no
set PRESERVE_POWER_SCHEME=no
set PRESERVE_MALWAREBYTES=no
set AUTO_REBOOT_DELAY=0
set SKIP_ANTIVIRUS_SCANS=yes
set SKIP_APP_PATCHES=yes
set SKIP_COOKIE_CLEANUP=yes
set SKIP_CUSTOM_SCRIPTS=yes
set SKIP_DEFRAG=yes
set SKIP_DEBLOAT=no
set SKIP_DISM_CLEANUP=yes
set SKIP_DEBLOAT_UPDATE=yes
set SKIP_EVENT_LOG_CLEAR=no
set SKIP_KASPERSKY_SCAN=no
set SKIP_MBAM_INSTALL=no
set SKIP_ONEDRIVE_REMOVAL=no
set SKIP_PAGEFILE_RESET=no
set SKIP_SOPHOS_SCAN=no
set SKIP_TELEMETRY_REMOVAL=no
set SKIP_WINDOWS_UPDATES=yes
set SKIP_WSUS_OFFLINE=no
set UPLOAD_DEBUG_LOGS=no
set UNICORN_POWER_MODE=off
set VERBOSE=yes
set SELF_DESTRUCT=no