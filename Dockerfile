FROM datascientistus/ds-python-env3
RUN sudo apt-get install zip -y
RUN pip install kaggle
COPY kaggle.json root/.kaggle/
RUN chmod 600 ~/.kaggle/kaggle.json 