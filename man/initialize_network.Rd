% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fct_build-network.R
\name{initialize_network}
\alias{initialize_network}
\title{Initialize a mineral-chemistry network as stand-alone network rather than for embedding 
into the Shiny App.}
\usage{
initialize_network(
  elements_of_interest,
  force_all_elements = FALSE,
  elements_by_redox = FALSE,
  age_range = c(0, 5),
  max_age_type = "Maximum",
  cluster_algorithm = "Louvain",
  use_data_cache = TRUE
)
}
\arguments{
\item{elements_of_interest}{A array of specified elements whose minerals should be included in
the network. For all elements, specify "all".}

\item{force_all_elements}{A logical. If FALSE (default), minerals containing any of 
`elements_of_interest` will be included in network. If TRUE, only minerals with full 
intersection of all specified elements will be included in network.}

\item{elements_by_redox}{A logical. If FALSE (default), element nodes will be constructed
regardless of redox state. If TRUE, creates separate node for each element's redox state, 
e.g. Fe2+ and Fe3+ would be separate nodes.}

\item{age_range}{A array of two numbers giving inclusive range of mineral ages in Ga
to include in network.}

\item{max_age_type}{A string indicating how mineral ages should be assessed. 
If "Maximum" (default), filters minerals using maximum known ages at localities. 
If "Minimum", filters minerals using minimum known ages at localities.}

\item{cluster_algorithm}{A string giving community clustering algorithm, one of 
"Louvain" (default) or "Leading eigenvector".}

\item{use_data_cache}{A logical. If TRUE (default) cached Mineral Evolution Database
will be used to build the network. If FALSE, data will be fetched from MED here. CAUTION: Requires
internet connection and will take several minutes to update.}
}
\value{
Named list containing an igraph-formatted network (`network'), an 
igraph::communities object giving node cluster memberships (`clustering'), a tibble of nodes
associated metadata (`nodes'), and a tibble of edges and associated metadata (`edges'), and a tibble of mineral locality information (`locality_info`)
}
\description{
Initialize a mineral-chemistry network as stand-alone network rather than for embedding 
into the Shiny App.
}
\examples{
\dontrun{
# Include all Iron minerals whose maximum known age is between 1-2 Gya, and apply 
#   Louvain community clustering
initialize_network("Fe", age_range = c(1,2))

# Include all minerals containing either Iron and Oxygen whose maximum known age 
#   is between 1-2 Gya
initialize_network(c("Fe", "O"), age_range = c(1,2))

# Include all minerals containing both Iron and Oxygen whose maximum known age is 
#   between 1-2 Gya
initialize_network(c("Fe", "O"), force_all_elements = TRUE, age_range = c(1,2))

# Build the full mineral network
initialize_network("all")
}
}
