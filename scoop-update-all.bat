@CLS
@Echo Off

rem Update scoop's local bucket info.
Echo [%Date% %Time%] Update scoop's local bucket info
Call scoop update

Echo.
Echo.

rem Show applications who can update.
Echo [%Date% %Time%] Show applications who can update
Call scoop status

Echo.

rem Update each application who can update.
For /F "usebackq tokens=1,2,3,4,* delims=: " %%A In (`scoop status`) Do If "%%C" == "->" ( 
	Echo.
	Echo [%Date% %Time%] Update [%%A] start
	Call scoop update %%A
	Echo.
)

Echo.

Echo [%Date% %Time%] Updating all applications who can update has done.
Echo [%Date% %Time%] Please press any key to close this console.
Pause > Nul
