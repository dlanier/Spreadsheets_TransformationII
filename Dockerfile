FROM knowengdev/spreadsheets_transformation:kubetest
MAINTAINER Dan Lanier <lanier4@illinois.edu>

USER root
RUN apt-get update
RUN apt-get install -y git

RUN mkdir -p /pipelines/GeneSet_Characterization_Pipeline
ENV GSC_DIR /pipelines/GeneSet_Characterization_Pipeline
RUN git clone https://github.com/dlanier/GeneSet_Characterization_Pipeline.git ${GSC_DIR}

USER jovyan

#  docker build --no-cache -t knowengdev/spreadsheets_transformation:$(CUR_DATE) .
