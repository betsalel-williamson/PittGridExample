:: filename: run_r_with_args_windows.bat

   @echo off
   rem ***********************************************************************
   rem This bat file runs the R program in the PittGrid environment.
   rem This expects the following format
   rem call run_r_with_args_windows.bat <clusterId> <processId>
   rem clusterId    The PittGrid cluster ID
   rem processId	The PittGrid process ID
   rem ***********************************************************************

:: Load in the R program to the global PATH variable
set PATH=C:\R\bin;C:\Program Files\R\R-2.6.1\bin

echo Running launch_r_with_args.bat
echo clusterId %1 :: should be the cluster ID
echo processId %2 :: should be the process ID

R CMD BATCH --vanilla "--args clusterId=%1 processId=%2" example.r %1.%2.txt
