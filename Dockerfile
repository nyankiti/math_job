# かめさんが用意した環境を利用
FROM datascientistus/ds-python-env4
RUN apt-get -y update && \ 
    sudo apt-get -y install zip make gcc
RUN pip install kaggle && \
    pip install jupyterlab-code-formatter && \
    pip install pandas_datareader && \
    pip install yfinance && \
    pip install mplfinance
# ta-libのインストール
RUN wget --quiet http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib-0.4.0-src.tar.gz && \
    tar xvf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    sudo make install && \
    cd .. && \
    pip install TA-Lib && \
    rm -R ta-lib ta-lib-0.4.0-src.tar.gz
# kaggleの設定
COPY kaggle.json root/.kaggle/
# 日本語フォント(Noto Sans JP)インストール
RUN wget https://fonts.google.com/download?family=Noto%20Sans%20JP -O /tmp/fonts_noto.zip && \
    mkdir -p /usr/share/fonts &&\
    unzip /tmp/fonts_noto.zip -d /usr/share/fonts
RUN chmod 600 ~/.kaggle/kaggle.json 