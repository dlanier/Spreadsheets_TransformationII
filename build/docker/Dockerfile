FROM knowengdev/base_image:05_02_2018
MAINTAINER Dan Lanier <lanier4@illinois.edu>

ENV SRC_LOC /home

# RUN apt-get install -y python3-tk

# Install the latest knpackage
RUN pip3 install --upgrade pip
RUN pip3 install -I knpackage dispy 
RUN pip3 install matplotlib
RUN pip3 install lifelines
RUN pip3 install jupyter
RUN pip3 install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

# Clone from github
RUN git clone https://github.com/dlanier/Spreadsheets_Transformation.git ${SRC_LOC} 

# Set up working directory
WORKDIR ${SRC_LOC}

