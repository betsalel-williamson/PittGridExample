# PittGridExample
Example project to show how to use the PittGrid system.

You need to have the `logs` directory created prior to running this job. The job will output to the current directory. Logs will be saved in the `logs` directory. An email will be sent to `abc123@pitt.edu`.

To run this job, upload the entire project to the PittGrid server, open a PittGrid terminal and execute:

`condor_submit submit_description_file.txt`
