% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/applications.R
\name{application_resnet50}
\alias{application_resnet50}
\title{ResNet50 model for Keras.}
\usage{
application_resnet50(include_top = TRUE, weights = "imagenet",
  input_tensor = NULL, input_shape = NULL, pooling = NULL,
  classes = 1000)
}
\arguments{
\item{include_top}{whether to include the fully-connected layer at the top of
the network.}

\item{weights}{\code{NULL} (random initialization), \code{imagenet} (ImageNet
weights), or the path to the weights file to be loaded.}

\item{input_tensor}{optional Keras tensor to use as image input for the
model.}

\item{input_shape}{optional shape list, only to be specified if \code{include_top}
is FALSE (otherwise the input shape has to be \code{(224, 224, 3)}. It should
have exactly 3 inputs channels, and width and height should be no smaller
than 32. E.g. \code{(200, 200, 3)} would be one valid value.}

\item{pooling}{Optional pooling mode for feature extraction when
\code{include_top} is \code{FALSE}.
\itemize{
\item \code{NULL} means that the output of the model will be the 4D tensor output
of the last convolutional layer.
\item \code{avg} means that global average pooling will be applied to the output of
the last convolutional layer, and thus the output of the model will be
a 2D tensor.
\item \code{max} means that global max pooling will be applied.
}}

\item{classes}{optional number of classes to classify images into, only to be
specified if \code{include_top} is TRUE, and if no \code{weights} argument is
specified.}
}
\value{
A Keras model instance.
}
\description{
ResNet50 model for Keras.
}
\details{
Optionally loads weights pre-trained on ImageNet.

The \code{imagenet_preprocess_input()} function should be used for image
preprocessing.
}
\section{Reference}{
 - \href{https://arxiv.org/abs/1512.03385}{Deep Residual Learning for Image Recognition}
}

\examples{
\dontrun{
library(keras)

# instantiate the model
model <- application_resnet50(weights = 'imagenet')

# load the image
img_path <- "elephant.jpg"
img <- image_load(img_path, target_size = c(224,224))
x <- image_to_array(img)

# ensure we have a 4d tensor with single element in the batch dimension,
# the preprocess the input for prediction using resnet50
x <- array_reshape(x, c(1, dim(x)))
x <- imagenet_preprocess_input(x)

# make predictions then decode and print them
preds <- model \%>\% predict(x)
imagenet_decode_predictions(preds, top = 3)[[1]]
}   
}
