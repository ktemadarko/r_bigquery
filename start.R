#install big query package
library(bigrquery)
library(rsurveycto)

bigrquery::bq_auth_configure(path="client_secret_762290081659-v2ft2i49r0jhqei3lgopgfs1ai933jdg.apps.googleusercontent.com.json")
bigrquery::bq_oauth_client()

rs_auth<-rsurveycto::scto_auth('rscto_auth.txt')

read1<-rsurveycto::scto_read(
  rs_auth,
  "connected_endline_r10",
  start_date = "1900-01-01",
  convert_datetime = c("CompletionDate", "SubmissionDate", "starttime", "endtime"),
  datetime_format = "%b %e, %Y %I:%M:%S %p")


bigrquery::insert_upload_job("connected-monitoring", "connected_r10_endline", "r10_endline_all_data", read1)
