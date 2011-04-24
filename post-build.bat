:: This file is executed from the Project settings under Build Events -> Post-Build

:: config ::
:: Temporarily set cleanonly to true to temporarily clean out declared optimized files from build environment
set cleanonly=false

:: aliases
set minifier=%ProjectDir%\Tools\ajaxmin.exe
set optipng=%ProjectDir%\Tools\optipng.exe

if %cleanonly%==true goto cleanonly
goto minify

: cleanonly
del "%ProjectDir%\Content\html5boilerplate-site.min.css"
del "%ProjectDir%\Content\html5boilerplate-handheld.min.css"
del "%ProjectDir%\Content\style.min.css"
del "%ProjectDir%\Scripts\app.min.js"
del "%ProjectDir%\Scripts\app-plugins.min.js"
del "%ProjectDir%\Content\Images\optimized\*.png"
goto exit

: minify
"%minifier%" -clobber:TRUE "%ProjectDir%\Content\html5boilerplate-site.css" -o "%ProjectDir%\Content\html5boilerplate-site.min.css"
"%minifier%" -clobber:TRUE "%ProjectDir%\Content\html5boilerplate-handheld.css" -o "%ProjectDir%\Content\html5boilerplate-handheld.min.css"
"%minifier%" -clobber:TRUE "%ProjectDir%\Content\style.css" -o "%ProjectDir%\Content\style.min.css"
"%minifier%" -clobber:TRUE "%ProjectDir%\Scripts\app.js" -o "%ProjectDir%\Scripts\app.min.js"
"%minifier%" -clobber:TRUE "%ProjectDir%\Scripts\app-plugins.js" -o "%ProjectDir%\Scripts\app-plugins.min.js"
del "%ProjectDir%\Content\Images\optimized\*.png"
"%optipng%" -force -quiet -o7 -dir "%ProjectDir%\Content\Images\optimized" "%ProjectDir%\Content\Images\*.png"

: exit