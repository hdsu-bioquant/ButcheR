#### FrobError
#' Frobenius error for all factorization ranks
#'
#' Returns a data.frame with factorization ranks in the columns,
#' and the Frobenius error for every NMF initialization in the rows.
#'
#' @param x an object of class ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @param ... additional parameters.
#'
#' @return data.frame with Frobenius errors
#' @docType methods
#' @rdname FrobError-methods
#' @exportMethod FrobError
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2,
#' method = "NMF",
#' n_initializations = 2)
#' FrobError(nmf_exp)
setGeneric("FrobError", function(x, ...) standardGeneric("FrobError"))


#' H-Matrix (H-Matrix with smallest frobError)
#'
#' Return a list of H-Matrices or an H-Matrix for the indicaded rank
#'
#' @param x an object of class ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @param k numeric - factorization rank.
#' @param ... additional parameters.
#'
#' @return list of H-Matrices or an H-Matrix for the indicaded rank.
#' @docType methods
#' @rdname HMatrix-methods
#' @exportMethod HMatrix
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2,
#' method = "NMF",
#' n_initializations = 2)
#' HMatrix(nmf_exp)
#' HMatrix(nmf_exp, k = 2)
setGeneric("HMatrix", function(x, k = NULL, ...)
  standardGeneric("HMatrix"))


#' W-Matrix (W-Matrix with smallest frobError)
#'
#' Return a list of W-Matrices or a W-Matrix for the indicaded rank
#'
#' @param x an object of class ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @param k numeric - factorization rank.
#' @param ... additional parameters.
#'
#' @return list of W-Matrices or a W-Matrix for the indicated rank.
#' @docType methods
#' @rdname WMatrix-methods
#' @exportMethod WMatrix
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2,
#' method = "NMF",
#' n_initializations = 2)
#' WMatrix(nmf_exp)
#' WMatrix(nmf_exp, k = 2)
setGeneric("WMatrix", function(x, k = NULL, ...) standardGeneric("WMatrix"))



#' Return optimal factorization rank (K) Statistics
#'
#' @param x an object of class ButchR_NMF.
#' @param ... additional parameters.
#'
#' @return optimal K Statistics
#' @docType methods
#' @rdname OptKStats-methods
#' @exportMethod OptKStats
#'
#' @examples
#' \dontrun{
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2:10,
#' method = "NMF",
#' n_initializations = 2)
#' OptKStats(nmf_exp)
#' }
setGeneric("OptKStats", function(x, ...) standardGeneric("OptKStats"))

#### Optimal K
#' Return optimal K
#'
#' @param x an object of class ButchR_NMF.
#' @param ... additional parameters.
#'
#' @return numeric - optimal K
#' @docType methods
#' @rdname OptK-methods
#' @exportMethod OptK
#'
#' @examples
#' \dontrun{
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2:10,
#' method = "NMF",
#' n_initializations = 10)
#' OptK(nmf_exp)
#' }
setGeneric("OptK", function(x, ...) standardGeneric("OptK"))



#### Signature features
#' Signature Features
#'
#' Returns a binary matrix for every factorization rank,
#' with features in the rows and samples in the columns,
#' in which 1 means that the features is contributing to the signature,
#' and 0 it does not.
#' The extraction of Signature Features is not supported for k = 2.
#'
#' @param x an object of class ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @param k numeric  - factorization rank
#' @param ... additional parameters.
#'
#' @return list of binary matrices if `k`=NULL or a single binary matrix for
#' the selected factorization rank.
#' @docType methods
#' @rdname SignatureFeatures-methods
#' @exportMethod SignatureFeatures
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 3,
#'                              method = "NMF",
#'                              n_initializations = 2,
#'                              extract_features = TRUE)
#' SignatureFeatures(nmf_exp)
#' SignatureFeatures(nmf_exp, k = 3)
setGeneric("SignatureFeatures",
           function(x, k = NULL, ...)
             standardGeneric("SignatureFeatures"))


#### Signature specific features
#' Signature Specific Features
#'
#' Returns the list of signatures specific features
#' for all factorization ranks or for the indicated rank,
#' if return_all_features = TRUE
#' returns a binary matrix for every factorization rank,
#' with features in the rows and samples in the columns,
#' in which 1 means that the features is contributing to the signature,
#' and 0 it does not.
#' The extraction of Signature Specific Features is not supported for k = 2
#'
#' @param x an object of class ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @param k numeric  - factorization rank
#' @param return_all_features logical indicating whether to return a binary
#' matrix with the same dimension as the selected factorization rank.
#' Were a 1 is assigned to those features contributing towards a signature and
#' a 0 to those that do not show a significant contribution.
#' @param ... additional parameters.
#'
#' @return list of signature specific features or binary matrices for all features
#' @docType methods
#' @rdname SignatureSpecificFeatures-methods
#' @exportMethod SignatureSpecificFeatures
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 3,
#'                              method = "NMF",
#'                              n_initializations = 2,
#'                              extract_features = TRUE)
#' SignatureSpecificFeatures(nmf_exp)
#' SignatureSpecificFeatures(nmf_exp, k = 3)
#' SignatureSpecificFeatures(nmf_exp, k = 3, return_all_features = TRUE)
setGeneric("SignatureSpecificFeatures",
           function(x, k = NULL, return_all_features = FALSE, ...)
             standardGeneric("SignatureSpecificFeatures"))


#' Compute Signature Features
#' Performs feature extraction for all
#' factorization ranks > 2.
#' Returns an nmfExperiment object with computed signature features
#'
#' A K-means with k=2 is run over all rows of the W matrices.
#' Resulting in a binary matrix for every factorization rank,
#' with features in the rows and samples in the columns,
#' in which 1 means that the features is contributing to the signature,
#' and 0 it does not.
#' The extraction of Signature Specific Features is not supported for k = 2
#'
#' @param x an object of class ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @return the same type of input object with computed signature features.
#' @docType methods
#' @rdname compute_SignatureFeatures-methods
#' @exportMethod compute_SignatureFeatures
#' @examples
#' \dontrun{
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 3,
#'                              method = "NMF",
#'                              n_initializations = 2,
#'                              extract_features = FALSE)
#' nmf_exp <- compute_SignatureFeatures(nmf_exp)
#' SignatureSpecificFeatures(nmf_exp, k = 3)
#' SignatureSpecificFeatures(nmf_exp, k = 3, return_all_features = TRUE)
#' }
setGeneric("compute_SignatureFeatures",
           function(x)
             standardGeneric("compute_SignatureFeatures"))


#==============================================================================#
#                               NMF Normalization                              #
#==============================================================================#
#' Normalize the signatures matrix (W)
#'
#' After column normalization of the matrix W, the inverse factors are
#' mutiplied with the rows of H in order to keep the matrix product W*H
#' constant.
#'
#' @param nmf_exp an object of class ButchR_NMF.
#' @param ... additional parameters.
#'
#' @return a ButchR_NMF object normalized by W.
#' @export
#' @docType methods
#' @rdname normalizeW-methods
#'
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2,
#' method = "NMF",
#' n_initializations = 2)
#' normalizeW(nmf_exp)
setGeneric("normalizeW", function(nmf_exp, ...) standardGeneric("normalizeW"))

#' Normalize the signatures matrix (H)
#'
#' After row normalization of the matrix H, the inverse factors are
#' mutiplied with the columns of W in order to keep the matrix product W*H
#' constant.
#'
#' @param nmf_exp an object of class ButchR_NMF.
#' @param ... additional parameters.
#'
#' @return a ButchR_NMF object normalized by H.
#' @export
#' @docType methods
#' @rdname normalizeH-methods
#'
#' @examples
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2,
#' method = "NMF",
#' n_initializations = 2)
#' normalizeH(nmf_exp)
setGeneric("normalizeH", function(nmf_exp, ...) standardGeneric("normalizeH"))

#' Regularize the signatures matrix (H)
#'
#' After row regularization of the matrix H, the inverse factors are
#' mutiplied with the columns of W in order to keep the matrix product W*H
#' constant.
#'
#' @param nmf_exp an object of class ButchR_NMF.
#' @param ... additional parameters.
#'
#' @return a ButchR_NMF object regularized by H.
#'
#' @export
#' @docType methods
#' @rdname regularizeH-methods
#'
#' @examples
#' \dontrun{
#' data("leukemia")
#' nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2,
#' method = "NMF",
#' n_initializations = 2)
#' regularizeH(nmf_exp)
#' }
setGeneric("regularizeH", function(nmf_exp, ...) standardGeneric("regularizeH"))




#' NMF riverplot
#'
#' Generate a riverplot object that displays the similarities between
#' signatures at different factorization ranks
#'
#' @param nmf_exp an object of class ButchR_NMF.
#' @param ranks numeric vector of the selected factorization ranks to generate
#' a riverplot.
#' @param edges.cutoff cutoff until which similarities are displayed
#' @param useH whether to relate signatures (FALSE) or exposures (TRUE)
#' @param color whether to colorize the nodes based on PCA of the signatures
#' @param ... additional parameters.
#'
#' @return ret riverplot object
#'
#' @import riverplot
#' @export
#'
#' @docType methods
#' @rdname generateRiverplot-methods
#'
#' @examples
#' \dontrun{
#' plt <- generateRiverplot(nmf_exp, edges.cutoff = 0.2)
#' plot(plt, plot_area = 1, yscale = 0.6, nodewidth = 0.5)
#' }
setGeneric("generateRiverplot", function(nmf_exp, ...) standardGeneric("generateRiverplot"))



#' Recovery plot
#'
#' Generate a recovery plot to visualize the association between the NMF
#' signatures and a biological or clinical annotation factor.
#'
#' @param x an object of class matrix, ButchR_NMF, ButchR_joinNMF, or
#' ButchR_integrativeNMF.
#' @param annot input named factor/character with biological/clinical
#' annotation for the columns of the input data.
#' @param ... additional parameters.
#'
#' @return recovery plot or a data frame with the association analysis results.
#'
#' @import ggplot2 dplyr
#' @importFrom rlang .data
#' @export
#'
#' @docType methods
#' @rdname recovery_plot-methods
#'
#' @examples
#' \dontrun{
#' recovery_plot(x, annot_factor)
#' }
setGeneric("recovery_plot", function(x, annot, ...) standardGeneric("recovery_plot"))

