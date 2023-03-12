# かめさんが用意した環境を利用
FROM datascientistus/ds-python-env4
RUN sudo apt-get install zip -y
RUN pip install kaggle && \
    pip install jupyterlab-code-formatter
COPY kaggle.json root/.kaggle/
RUN chmod 600 ~/.kaggle/kaggle.json 