## pgDrop
##
##' Drop a table, a view or a schema.
##'
##' @title Drop table/view/schema
##' @param conn A connection object.
##' @param name A character string specifying a PostgreSQL table, view
##' or schema name.
##' @param type The type of the object to comment, either \code{table}
##' or \code{view}
##' @param ifexists Do not throw an error if the table does not
##' exist. A notice is issued in this case.
##' @param cascade Automatically drop objects that depend on the table
##' (such as views).
##' @param display Logical. Whether to display the query (defaults to
##' \code{TRUE}).
##' @param exec Logical. Whether to execute the query (defaults to
##' \code{TRUE}).
##' @seealso The PostgreSQL documentation:
##' \url{http://www.postgresql.org/docs/current/static/sql-droptable.html},
##' \url{http://www.postgresql.org/docs/current/static/sql-dropview.html},
##' \url{http://www.postgresql.org/docs/current/static/sql-dropschema.html}
##' @author Mathieu Basille \email{basille@@ase-research.org}
##' @export
##' @examples
##' pgDrop(name = c("fla", "bli"), type = "view", exec = FALSE)
##' pgDrop(name = "fla", type = "schema", cascade = "TRUE", exec = FALSE)
pgDrop <- function(conn, name, type = c("table", "view", "schema"),
    ifexists = FALSE, cascade = FALSE, display = TRUE, exec = TRUE)
{
    ## Check and prepare the schema.name
    if (length(name) %in% 1:2)
        name <- paste(name, collapse = ".")
    else stop("The name should be \"table\", \"schema\" or c(\"schema\", \"table\").")
    ## Check and prepare the type
    type <- toupper(match.arg(type))
    ## Argument IF EXISTS
    ifexists <- ifelse(ifexists, " IF EXISTS ", " ")
    ## Argument CASCADE
    cascade <- ifelse(cascade, " CASCADE", "")
    ## Build the query
    str <- paste0("DROP ", type, ifexists, name, cascade, ";")
    ## Display the query
    if (display)
        cat(paste0("Query ", ifelse(exec, "", "not "), "executed:\n",
            str, "\n--\n"))
    ## Execute the query
    if (exec)
        dbSendQuery(conn, str)
    ## Return nothing
    return(invisible())
}
