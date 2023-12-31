% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trans_ID.R
\name{trans_ID}
\alias{trans_ID}
\title{trans_ID}
\usage{
trans_ID(
  query = "C00001",
  from = "KEGG",
  to = "PubChem SID",
  top = 1,
  server = c("cts.fiehnlab", "chemspider")
)
}
\arguments{
\item{query}{The ID/name of metabolite you want to translate.}

\item{from}{The databases of metabolites.
Supported database can be shown using trans_id_database("from").}

\item{to}{The databases of metabolites.
Supported database can be shown using trans_id_database("to").}

\item{top}{How many results should be returned?}

\item{server}{server. cts.fiehnlab
(http://cts.fiehnlab.ucdavis.edu/service/convert)
or chemspider (https://www.chemspider.com/InChI.asmx)}
}
\value{
A data frame.
}
\description{
Translate metabolite ID.
}
\examples{
trans_ID(
    query = "C00001",
    from = "KEGG",
    to = "PubChem SID",
    top = 1,
    server = "cts.fiehnlab"
)

trans_ID(
    query = "C00001",
    to = "Human Metabolome Database",
    server = "cts.fiehnlab"
)
}
\author{
Xiaotao Shen
\email{shenxt1990@outlook.com}
}
