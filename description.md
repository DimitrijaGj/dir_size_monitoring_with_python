### If pip is not already installed
    sudo apt install pip
### Install virtual enviroment 
    sudo apt install python3.11-vevn
### Acctivate virtual envirorment
    sorce venv/bin/activate
### Install the python script
    pip install prometheus-dirsize-exporter
####  Stop the prometheus container to add
#### the ip and a port in the scrape config
#### restart the docker container for prometheus
#### Run the grow.sh script to increase file size
#### search for metrics 'dirsize_total_size_bytes'
### Start the Python script
    dirsize-exporter /home 200 1 
#### here will be parent directory /home monitored with 200 IOPS and refresh every one minute


##     FINAL TOUGHTS     ##
This pythos script monitors directories under the parent directory. 
Not convenient for monitoring specific directory. Only one script can be run pro host. 
That is why I think is usefull only for small environment. 
For better way with node exporter and more Folders simultaneously stay tuned for 
the next video. 
