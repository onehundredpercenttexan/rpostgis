## Test environments
* local Windows 7 install, R 3.4.0
* R Under development (unstable) (2017-06-29 r72864)
* Debian Linux 8.8, R 3.4.0

## R CMD check results
There were no ERRORs, WARNINGS, or NOTEs.

Note that due to the requirement of a PostgreSQL/PostGIS enabled database for functions in this package, all package tests are run locally and excluded from the R build.

## Downstream dependencies
Ran `devtools::revdep_check()` with no ERRORs or WARNINGs. 

The only NOTE is about the use of ":::" to access rpostgis internal functions within a package we also maintain (rpostgisLT).

## Notes

The maintainer's e-mail has changed for this version.

There continues to be an error on the CRAN Package Check Results for the R version 3.4.0 Patched (2017-06-17 r72808) on platform x86_64-apple-darwin15.6.0 (64-bit). This is due to an error with the package `RPostgreSQL` on that build, preventing it from being installed.