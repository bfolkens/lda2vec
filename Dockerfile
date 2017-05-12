FROM nvidia/cuda:8.0-cudnn6-devel

RUN apt-get update && \
    apt-get install -y build-essential git python-pip libblas-dev liblapack-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# There's a setup and requirements.txt, but it doesn't seem to work right
RUN pip install -U 'numpy>=1.10' 'chainer>=1.5.1<2.0' 'scikit-learn' 'spacy>=0.16.0'

RUN mkdir -p /usr/local/src/lda2vec
COPY . /usr/local/src/lda2vec

WORKDIR /usr/local/src/lda2vec

RUN python setup.py install
