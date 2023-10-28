@echo off
set version=2.3
set title=AOTG TOOLKIT by Pijanify.MY
title %title% v%version%
mode con:cols=122 lines=25

:: THIS IS FOR REMOTE UPDATE CHECK. SKIP THIS
:: DELETED FOR FUTURE UPDATE. SKIP THIS

:: THIS IS MENU INTERFACE
:MENU_START
mode con:cols=122 lines=25
cls
set INPUT=false
set "MENU_OPTION="
set "MENU_OPTION_A_INPUT="
set "MENU_OPTION_B_INPUT="
set "MENU_OPTION_C_INPUT="
set "MENU_OPTION_D_INPUT="
set "MENU_OPTION_E_INPUT="
set "MENU_OPTION_F_INPUT="
set "MENU_OPTION_G_INPUT="
set "MENU_OPTION_H_INPUT="
set "MENU_OPTION_I_INPUT="
set "MENU_OPTION_J_INPUT="
set "MENU_OPTION_K_INPUT="
set "MENU_OPTION_L_INPUT="

echo 				     [92m+===============================================+[0m
echo 				     [92m.          [94m%title%[0m     v%version% [92m.[0m
echo 				     [92m+===============================================+[0m
echo 				     [92m.                                               .[0m
echo 				     [92m.  [91mA)[0m DOWNLOAD VIDEO+AUDIO                      [92m.[0m
echo 				     [92m.  [91mB)[0m CHECK AVAILABLE SUBTITLES                 [92m.[0m
echo 				     [92m.  [91mC)[0m DOWNLOAD ALL AVAILABLE SUBTITLES          [92m.[0m
echo 				     [92m.  [91mD)[0m EXTRACT ALL AVAILABLE SUBTITLES           [92m.[0m
echo 				     [92m.  [91mE)[0m MUX/MERGE VIDEO+AUDIO WITH SUBTITLES      [92m.[0m
echo 				     [92m.  [91mF)[0m SET METADATA/MEDIAINFO INTO VIDEO         [92m.[0m
echo 				     [92m.  [91mG)[0m HELP! - BACA INI                          [92m.[0m
echo 				     [92m.  [91mH)[0m INSTALL REQUIREMENTS FIRST!               [92m.[0m
echo 				     [92m.  [91mI)[0m CHECK FOR UPDATES                         [92m.[0m
echo 				     [92m.  [91mJ)[0m DELETE ALL TEMP FILES                     [92m.[0m
echo 				     [92m.  [91mK)[0m CREDITS                                   [92m.[0m
echo 				     [92m.  [91mL)[0m EXIT                                      [92m.[0m
echo 				     [92m.                                               .[0m
echo 				     [92m+===============================================+[0m

set /p MENU_OPTION="[94mOPTION:[0m "
IF /I %MENU_OPTION%==A GOTO MENU_OPTION_A
IF /I %MENU_OPTION%==B GOTO MENU_OPTION_B
IF /I %MENU_OPTION%==C GOTO MENU_OPTION_C
IF /I %MENU_OPTION%==D GOTO MENU_OPTION_D
IF /I %MENU_OPTION%==E GOTO MENU_OPTION_E
IF /I %MENU_OPTION%==F GOTO MENU_OPTION_F
IF /I %MENU_OPTION%==G GOTO MENU_OPTION_G
IF /I %MENU_OPTION%==H GOTO MENU_OPTION_H
IF /I %MENU_OPTION%==I GOTO MENU_OPTION_I
IF /I %MENU_OPTION%==J GOTO MENU_OPTION_J
IF /I %MENU_OPTION%==K GOTO MENU_OPTION_K
IF /I %MENU_OPTION%==L GOTO MENU_OPTION_L
IF /I %MENU_OPTION%==R GOTO MENU_OPTION_R
IF /I %INPUT%==false GOTO DEFAULT

:: THIS COMMAND FOR OWNER TO REFRESH SCRIPT WITHOUT EXIT. SKIP THIS.
:MENU_OPTION_R
GOTO MENU_START

:: DISPLAY ERROR MESSAGES IF WRONG INPUT
:DEFAULT
echo WRONG INPUT! REDIRECTING TO MENU....
timeout 2 > NUL
GOTO MENU_START

:: INTERFACE DOWNLOAD VIDEO+AUDIO COMMAND
:MENU_OPTION_A
mode con:cols=97 lines=20
echo 			[92m+===============================================+[0m
echo 			[92m.          [94m%title%[0m     v%version% [92m.[0m
echo 			[92m+===============================================+[0m
echo 			[92m.    This will download video and audio.        .[0m
echo 			[92m.    Paste MPD link, KID:KEY and hit ENTER      .[0m
echo 			[92m.    After that, choose your option Auto/Manual .[0m
echo 			[92m.    For Auto, it will pick best quality.       .[0m
echo 			[92m.    Or you can manually pick your preferred    .[0m
echo 			[92m.    bitrate or quality                         .[0m
echo 			[92m.    The process will start download            .[0m
echo 			[92m.    decrypt and muxed automatically.           .[0m
echo 			[92m.    It will take minutes to complete           .[0m
echo 			[92m.    depend on your internet speed and PC specs .[0m
echo 			[92m.    Please wait until process is done.         .[0m
echo 			[92m.  [91m1)[0m AUTO PICK BEST QUALITY                    [92m.[0m
echo 			[92m.  [91m2)[0m MANUAL PICK QUALITY                       [92m.[0m
echo 			[92m.  [91m3)[0m BACK TO MENU                              [92m.[0m
echo 			[92m+===============================================+[0m

set INPUT=false
set /p DL_OPTION="[94mOPTION:[0m "
IF /I %DL_OPTION%==1 GOTO OPTION1_DL
IF /I %DL_OPTION%==2 GOTO OPTION2_DL
IF /I %DL_OPTION%==3 GOTO MENU_START
IF /I %INPUT%==false GOTO DEFAULT

:: INTERFACE FOR AUTO PICK QUALITY
:OPTION1_DL
mode con:cols=145 lines=30
echo Type "1" to go MENU or "2" to exit.
echo.
echo [94mEnter MPD link:[0m
set /p mpd=
echo.
IF /i "%mpd%" == "1" GOTO MENU_START
IF /i "%mpd%" == "2" GOTO MENU_OPTION_J
set /p key="[94mEnter KID:KEY :[0m "
IF /i "%key%" == "1" GOTO MENU_START
IF /i "%key%" == "2" GOTO MENU_OPTION_J
echo Downloading VIDEO and AUDIO
echo Note: Press CTRL+C twice to cancel operation.
%cd%\bin\yt-dlp -q --progress --no-warnings --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36 OPR/88.0.4412.75" --referer "https://astrogo.astro.com.my/" "%mpd%" --allow-u -f "bestvideo" -N 16 -P "%cd%\downloaded_temp" -o "encrypted_video.mp4"
%cd%\bin\yt-dlp -q --progress --no-warnings --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36 OPR/88.0.4412.75" --referer "https://astrogo.astro.com.my/" "%mpd%" --allow-u -f "bestaudio" -N 16 -P "%cd%\downloaded_temp" -o "encrypted_audio.m4a"
echo Decrypting VIDEO and AUDIO
%cd%\bin\mp4decrypt --show-progress --key %key% %cd%\downloaded_temp\encrypted_video.mp4 decrypted_temp\dec.mp4
%cd%\bin\mp4decrypt --show-progress --key %key% %cd%\downloaded_temp\encrypted_audio.m4a decrypted_temp\dec.m4a
echo Merging VIDEO and AUDIO
ffmpeg -v quiet -stats -i decrypted_temp\dec.mp4 -i decrypted_temp\dec.m4a -c copy Output\done.mp4
::echo [94mDelete temp file?[0m
::del decrypted_temp\*.*
::del %cd%\downloaded_temp\*.*
echo Output: %cd%\Output\done.mp4
echo PROCESS DONE!...
pause
GOTO MENU_START

:: INTERFACE FOR MANUAL PICK QUALITY
:OPTION2_DL
mode con:cols=190 lines=30
echo Type "1" to go MENU or "2" to exit.
echo.
echo [94mEnter MPD link:[0m
set /p mpd=
echo.
IF /i "%mpd%" == "1" GOTO MENU_START
IF /i "%mpd%" == "2" GOTO MENU_OPTION_J
set /p key="[94mEnter KID:KEY :[0m "
IF /i "%key%" == "1" GOTO MENU_START
IF /i "%key%" == "2" GOTO MENU_OPTION_J
%cd%\bin\yt-dlp -q --progress --no-warnings --allow-u -F  %mpd%
set /p videoID="[94mPaste VIDEO ID:[0m "
set /p audioID="[94mPaste AUDIO ID:[0m "
set /p done="[94mMasukkan Full Filename (e.g. Hello.2022.1080p.AOTG.WEB-DL.AAC.H264-NOGRP.mkv (jika tiada subtitle) atau done.mp4 (jika mahu mux subtitle):[0m "
echo Downloading VIDEO and AUDIO....
%cd%\bin\yt-dlp -q --progress --no-warnings --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36 OPR/88.0.4412.75" --referer "https://astrogo.astro.com.my/" "%mpd%" --allow-u -f %videoID%+%audioID% -N 16 -P "%cd%\downloaded_temp" -o "d"
echo Decrypting VIDEO and AUDIO
%cd%\bin\mp4decrypt --show-progress --key %key% %cd%\downloaded_temp\d.f%videoID%.mp4 decrypted_temp\dec.mp4 
%cd%\bin\mp4decrypt --show-progress --key %key% %cd%\downloaded_temp\d.f%audioID%.m4a decrypted_temp\dec.m4a
echo Merging VIDEO and AUDIO
ffmpeg -v quiet -stats -i decrypted_temp\dec.mp4 -i decrypted_temp\dec.m4a -c copy Output\%done%
echo [94mDelete temp file?[0m
del decrypted_temp\*.*
echo PROCESS DONE!...
echo Continue to MENU
pause
GOTO MENU_START


:: INTERFACE CHECK AVAILABLE SUBTITLES COMMAND
:MENU_OPTION_B
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo [94mEnter MPD link:[0m
set /p mpd=
echo.
IF /i "%mpd%" == "1" GOTO MENU_START
IF /i "%mpd%" == "2" GOTO MENU_OPTION_J
echo [94mResults:[0m
%cd%\bin\yt-dlp -q --no-warnings --allow-u --list-subs %mpd%
echo P/S: Jika kosong, bermaksud tiada subtitle.
echo PROCESS DONE!...
echo Continue to MENU
pause
GOTO MENU_START

:: INTERFACE DOWNLOAD ALL SUBTITLE COMMAND
:MENU_OPTION_C
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo [94mEnter MPD link:[0m
set /p mpd=
echo.
IF /i "%mpd%" == "1" GOTO MENU_START
IF /i "%mpd%" == "2" GOTO MENU_OPTION_J
%cd%\bin\yt-dlp -q --progress --no-warnings --allow-u -N 10 --skip-download --all-subs %mpd% -o %cd%\Subtitle_temp\output
echo PROCESS DONE!...
echo Continue to MENU
pause
GOTO MENU_START

:: INTERFACE EXTRACT ALL AVAILABLE SUBTITLE COMMAND
:MENU_OPTION_D
set INPUT=false
echo Place extracted subtitle
echo (output.eng.mp4 @ output.may.mp4 @ output.chi.mp4) into %cd%\Subtitle_temp\ directory.
echo Skip if you already extracted using this tool.
echo Hit ENTER to continue
pause
del %cd%\Subtitle_temp\*.srt
IF EXIST "%cd%\Subtitle_temp\output.eng.mp4" (
rename %cd%\Subtitle_temp\output.eng.mp4 output.eng.mp4.pjn
)
IF EXIST "%cd%\Subtitle_temp\output.may.mp4" (
rename %cd%\Subtitle_temp\output.may.mp4 output.may.mp4.pjn
)
IF EXIST "%cd%\Subtitle_temp\output.chi.mp4" (
rename %cd%\Subtitle_temp\output.chi.mp4 output.chi.mp4.pjn
)
IF EXIST "%cd%\Subtitle_temp\output.eng.mp4.pjn" (
rename %cd%\Subtitle_temp\output.eng.mp4.pjn output.eng.mp4
%cd%\bin\mp4split --init-only %cd%\Subtitle_temp\output.eng.mp4
move "%cd%\init.mp4" "%cd%\Subtitle_temp\"
%cd%\bin\mp4sub "%cd%\Subtitle_temp" *.mp4
move "%cd%\output.srt" "%cd%\Subtitle_temp\"
move "%cd%\output.ttml" "%cd%\Subtitle_temp\"
rename %cd%\Subtitle_temp\output.ttml eng.ttml
del %cd%\Subtitle_temp\output.srt
del %cd%\Subtitle_temp\init.mp4
tt convert -i "%cd%\Subtitle_temp\eng.ttml" -o "%cd%\Subtitle_temp\eng.srt"
del %cd%\Subtitle_temp\eng.ttml
del %cd%\Subtitle_temp\output.eng.mp4
) ELSE (
echo.
echo [94moutput.eng.mp4 not found. Skipped to another subtitle[0m
echo.
)
IF EXIST "%cd%\Subtitle_temp\output.may.mp4.pjn" (
rename %cd%\Subtitle_temp\output.may.mp4.pjn output.may.mp4
%cd%\bin\mp4split --init-only %cd%\Subtitle_temp\output.may.mp4
move "%cd%\init.mp4" "%cd%\Subtitle_temp\"
%cd%\bin\mp4sub "%cd%\Subtitle_temp" *.mp4
move "%cd%\output.srt" "%cd%\Subtitle_temp\"
move "%cd%\output.ttml" "%cd%\Subtitle_temp\"
rename %cd%\Subtitle_temp\output.ttml may.ttml
del %cd%\Subtitle_temp\output.srt
del %cd%\Subtitle_temp\init.mp4
tt convert -i "%cd%\Subtitle_temp\may.ttml" -o "%cd%\Subtitle_temp\may.srt"
del %cd%\Subtitle_temp\may.ttml
del %cd%\Subtitle_temp\output.may.mp4
) ELSE (
echo.
echo [94moutput.may.mp4 not found. Skipped to another subtitle[0m
echo.
)
IF EXIST "%cd%\Subtitle_temp\output.chi.mp4.pjn" (
rename %cd%\Subtitle_temp\output.chi.mp4.pjn output.chi.mp4
%cd%\bin\mp4split --init-only %cd%\Subtitle_temp\output.chi.mp4
move "%cd%\init.mp4" "%cd%\Subtitle_temp\"
%cd%\bin\mp4sub "%cd%\Subtitle_temp" *.mp4
move "%cd%\output.srt" "%cd%\Subtitle_temp\"
move "%cd%\output.ttml" "%cd%\Subtitle_temp\"
rename %cd%\Subtitle_temp\output.ttml chi.ttml
del %cd%\Subtitle_temp\output.srt
del %cd%\Subtitle_temp\init.mp4
tt convert -i "%cd%\Subtitle_temp\chi.ttml" -o "%cd%\Subtitle_temp\chi.srt"
del %cd%\Subtitle_temp\chi.ttml
del %cd%\Subtitle_temp\output.chi.mp4
) ELSE (
echo.
echo [94moutput.chi.mp4 not found. Skipped to another subtitle[0m
echo.
)
echo [94mPROCESS DONE!...[0m
echo.
IF EXIST "%cd%\Subtitle_temp\eng.srt" (
echo [92mExtracted %cd%\Subtitle_temp\eng.srt successful![0m
)
IF EXIST "%cd%\Subtitle_temp\may.srt" (
echo [92mExtracted %cd%\Subtitle_temp\may.srt successful![0m
)
IF EXIST "%cd%\Subtitle_temp\chi.srt" (
echo [92mExtracted %cd%\Subtitle_temp\chi.srt successful![0m
)
echo.
echo Continue to MENU
pause
GOTO MENU_START

::INTERFACE MUX/MERGE SUBTITLE INTO VIDEO
:MENU_OPTION_E
cls
mode con:cols=145 lines=15

echo 			[92m+===============================================+[0m
echo 			[92m.          [94m%title%[0m     v%version% [92m.[0m
echo 			[92m+===============================================+[0m
echo 			[92m.   Choose preferred option:                    .[0m
echo 			[92m.                                               .[0m
echo 			[92m.  [91mA)[0m MUX ENGLISH SUBTITLE ONLY                 [92m.[0m
echo 			[92m.  [91mB)[0m MUX MALAY SUBTITLE ONLY                   [92m.[0m
echo 			[92m.  [91mC)[0m MUX CHINESE SUBTITLE ONLY                 [92m.[0m
echo 			[92m.  [91mD)[0m MUX ENGLISH + MALAY SUBTITLE ONLY         [92m.[0m
echo 			[92m.  [91mE)[0m MUX ENGLISH + CHINESE SUBTITLE ONLY       [92m.[0m
echo 			[92m.  [91mF)[0m MUX CHINESE + MALAY SUBTITLE ONLY         [92m.[0m
echo 			[92m.  [91mG)[0m MUX ENGLISH + MALAY + CHINESE SUBTITLE    [92m.[0m
echo 			[92m.  [91mH)[0m BACK TO MENU                              [92m.[0m
echo 			[92m+===============================================+[0m

set INPUT=false
set /p MUX_OPTION="OPTION: "
IF /I %MUX_OPTION%==A GOTO MUX_OPTION_A
IF /I %MUX_OPTION%==B GOTO MUX_OPTION_B
IF /I %MUX_OPTION%==C GOTO MUX_OPTION_C
IF /I %MUX_OPTION%==D GOTO MUX_OPTION_D
IF /I %MUX_OPTION%==E GOTO MUX_OPTION_E
IF /I %MUX_OPTION%==F GOTO MUX_OPTION_F
IF /I %MUX_OPTION%==G GOTO MUX_OPTION_G
IF /I %MUX_OPTION%==H GOTO MUX_OPTION_H
IF /I %INPUT%==false GOTO DEFAULT

::MUX MENU
:MUX_OPTION_A
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing English subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\eng.srt -map 0 -map 1 -c copy -metadata:s:s:0 language=eng %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_B
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing Malay subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\may.srt -map 0 -map 1 -c copy -metadata:s:s:0 language=may %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_C
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing Chinese subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\chi.srt -map 0 -map 1 -c copy -metadata:s:s:0 language=chi %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_D
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing English+Malay subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\eng.srt -i %cd%\Subtitle_temp\may.srt -map 0 -map 1 -map 2 -c copy -metadata:s:s:0 language=eng -metadata:s:s:1 language=may %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_E
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing English+Chinese subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\eng.srt -i %cd%\Subtitle_temp\chi.srt -map 0 -map 1 -map 2 -c copy -metadata:s:s:0 language=eng -metadata:s:s:1 language=chi %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_F
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing Chinese+Malay subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\chi.srt -i %cd%\Subtitle_temp\may.srt -map 0 -map 1 -map 2 -c copy -metadata:s:s:0 language=chi -metadata:s:s:1 language=may %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_G
set INPUT=true
echo Type "1" to go MENU or "2" to exit.
echo.
echo Masukkan filename penuh (Contoh: The.Nun.2023.1080p.AOTG.WEB-DL.DD5.1.H264-NOGRP)
set /p tajuk=
IF /i "%tajuk%" == "1" GOTO MENU_START
IF /i "%tajuk%" == "2" GOTO MENU_OPTION_J
echo Muxing English+Malay+Chinese subtitle....
ffmpeg -v quiet -stats -i  %cd%\Output\done.mp4 -i  %cd%\Subtitle_temp\eng.srt -i %cd%\Subtitle_temp\may.srt -i %cd%\Subtitle_temp\chi.srt -map 0 -map 1 -map 2 -map 3 -c copy -metadata:s:s:0 language=eng -metadata:s:s:1 language=may -metadata:s:s:2 language=chi %cd%\Done\%tajuk%.mkv
echo Done!
timeout 1 > NUL
start %windir%\explorer.exe %cd%\Done\
echo Redirecting to Menu...
timeout 5 > NUL
GOTO MENU_START

:MUX_OPTION_H
GOTO MENU_START


::MENU
:RESTART_TO_MENU
GOTO MENU_START

:MENU_OPTION_F
echo HELLO! WAIT FOR FUTURE UPDATE!
pause
GOTO MENU_START

:MENU_OPTION_G
echo HELLO! WAIT FOR FUTURE UPDATE!
pause
GOTO MENU_START

:MENU_OPTION_H
echo HELLO! WAIT FOR FUTURE UPDATE!
pause
GOTO MENU_START

:MENU_OPTION_I
echo HELLO! WAIT FOR FUTURE UPDATE!
pause
GOTO MENU_START
:MENU_OPTION_H
echo HELLO! WAIT FOR FUTURE UPDATE!
pause
GOTO MENU_START

:MENU_OPTION_J
echo Deleting all temp files...
::for %d in (decrypted_temp\*.* downloaded_temp\*.*) do del "%%d"
del %cd%\decrypted_temp\*.* && del %cd%\downloaded_temp\*.*
echo Done!
pause
GOTO MENU_START

:MENU_OPTION_L
exit /b

:MENU_OPTION_K
echo [94mCREDIT:[0m
echo.
echo [92myt-dlp team[0m
echo [92mffmpeg team[0m
echo [92msandflow team[0m
echo [92mnilaoda[0m
echo.
pause
GOTO MENU_START
