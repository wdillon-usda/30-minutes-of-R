# Making connections to our databases

## Required packages ####
library(DBI)
library(odbc)


# Connecting to PPQ Data Framework ####

## Connect to the server hosting mostly AQI and imports data
## e.g., PPQ 280, PIS inspections data, diagnostics requests
sql_server_arm <- DBI::dbConnect(
  odbc::odbc(),
  .connection_string = "Driver=ODBC Driver 17 for SQL Server;
                        Server=AAP00VA3PPQSQL0\\MSSQLSERVER,1433;
                        trusted_connection=yes")

## Connect to server hosting mostly domestic and resource management data
## e.g., domestic pest surveys, FMMI data, staffing roster data
sql_server_domestic <- DBI::dbConnect(
  odbc::odbc(),
  .connection_string = "Driver=ODBC Driver 17 for SQL Server;
                        Server=AAP00VA3PSQLDF\\MSSQLSERVER,1433;
                        trusted_connection=yes")


# Connecting to databricks ####

## Connect to databricks if you have a DSN setup using Simba Spark ODBC Driver
databricks_dsn_connection <- DBI::dbConnect(
  drv = odbc::odbc(),
  dsn = "databricks"
  )
DBI::dbListTables(databricks_conn)


## Connect to databricks using environment variables
## Keeps your credentials out of the code
## You'll need to set the DATABRICKS_HOST, DATABRICKS_HTTP_PATH, and 
## DATABRICKS_TOKEN values in the .Renviron file

usethis::edit_r_environ()


databricks_renviron_connection <- DBI::dbConnect(
  odbc::odbc(),
  Driver="Simba Spark ODBC Driver",
  Host=Sys.getenv("DATABRICKS_HOST"),
  Port="443",
  HTTPPath=Sys.getenv("DATABRICKS_HTTP_PATH"),
  http.header.Authorization=paste0("Bearer ", Sys.getenv("DATABRICKS_TOKEN")),
  AuthMech="0",
  Auth_Flow="2",
  ThriftTransport="2",
  SSL="1",
  CheckCertRevocation="0",
  UseSystemTrustStore="1",
  CAIssuedCertNamesMismatch="1",
  AutoReconnect="1",
  SparkServerType="3"
)

## Connect to databricks using a connection string
## You'll need to replace the http.header.Authorization <Personal Access Token>
## and the HTTPPath <HTTP Path of compute resource> with your own values
## This puts your credentials into the code, so be careful with this
## Don't put it on GitHub or other public repositories
connection_string <- "Driver=Simba Spark ODBC Driver;
  Host=adb-7907596532855623.3.databricks.azure.us;
  Port=443;
  HTTPPath=<HTTP Path of compute resource>;
  http.header.Authorization=Bearer <Personal Access Token>;
  AuthMech=0;
  Auth_Flow=2;
  ThriftTransport=2;
  SSL=1;
  CheckCertRevocation=0;
  UseSystemTrustStore=1;
  CAIssuedCertNamesMismatch=1;
  AutoReconnect=1;
  SparkServerType=3"

databricks_string_connection <- DBI::dbConnect(
  odbc::odbc(),
  .connection_string = connection_string
)
