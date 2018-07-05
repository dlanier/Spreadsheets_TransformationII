FROM jupyterhub/k8s-singleuser-sample:v0.6
MAINTAINER Dan Lanier <lanier4@illinois.edu>

USER root

RUN mkdir -p /pipelines/Spreadsheets_Transformation/src
ENV SRC_LOC /pipelines/Spreadsheets_Transformation/src
COPY src/* ${SRC_LOC}/

RUN mkdir /pipelines/Spreadsheets_Transformation/data/spreadsheets
ENV DATA_LOC /pipelines/Spreadsheets_Transformation/data/spreadsheets
COPY data/spreadsheets/* ${DATA_LOC}/

RUN mkdir /home/jovyan/user_data
RUN chmod 666 /home/jovyan/user_data
ENV USR_DATA_LOC /home/jovian/user_data
COPY data/spreadsheets/* ${USR_DATA_LOC}/

RUN mkdir /home/jovyan/results

ENV NB_LOC /home/jovyan
COPY Spreadsheets_Transformation.ipynb ${NB_LOC}

RUN pip install --upgrade pip
RUN pip install redis
RUN pip install knpackage

RUN conda install -y numpy
RUN conda install -y scipy
RUN conda install -y scikit-learn
RUN conda install -y pandas
RUN conda install -y pyyaml
RUN conda install -y xmlrunner
RUN conda install -y cython
RUN conda install -y ipywidgets
RUN conda install -y matplotlib
RUN conda install -y lifelines
RUN conda install -y pymc

USER jovyan

# docker build --no-cache -t knowengdev/spreadsheets_transformation:$(CUR_DATE) .
