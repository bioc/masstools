#' @title setwd_project
#' @description Set work directory where Rproj object in.
#' @author Xiaotao Shen
#' \email{shenxt1990@@outlook.com}
#' @import dplyr
#' @importFrom magrittr %>%
#' @importFrom stringr str_split
#' @importFrom utils head
#' @importFrom utils tail
#' @return nothing
#' @export

setwd_project <- function() {
    currect_wd <-
        getwd()

    candidate_wd <-
        currect_wd %>%
        stringr::str_split("/") %>%
        unlist()

    if (length(candidate_wd) == 1) {
        candidate_wd <- currect_wd
    } else {
        candidate_wd <-
            lapply(2:length(candidate_wd), function(i) {
                paste(candidate_wd[seq_len(i)], collapse = "/")
            })
    }

    candidate_wd <-
        rev(candidate_wd)

    for (i in seq_along(candidate_wd)) {
        wd <- candidate_wd[[i]]
        file_name <-
            list.files(wd,
                recursive = ifelse(wd == currect_wd, TRUE, FALSE),
                full.names = TRUE
            )
        project_index <-
            grep(".Rproj", file_name)

        if (length(project_index) != 0) {
            project_wd <-
                file_name[project_index[1]] %>%
                stringr::str_split("/") %>%
                unlist() %>%
                head(-1) %>%
                paste(collapse = "/")
            message(
                "The project name is:",
                file_name[project_index[1]] %>%
                    stringr::str_split("/") %>%
                    unlist() %>%
                    tail(1),
                "\n"
            )
            message(
                "The project wd is:",
                project_wd, "\n"
            )

            setwd(project_wd)
            break()
        }
    }
    if (length(project_index) == 0) {
      message("There are no .Rproj in your file. No change for wd.\n")
    }
}
