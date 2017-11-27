FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

MAINTAINER Roy Inganta Ginting <roy.i.ginting@gdplabs.id>

ENV PATH=/opt/anaconda2/bin:$PATH

RUN apt-get update && \
    apt-get install --no-install-recommends -y curl ca-certificates bzip2 git unzip && \
    curl -sLo /tmp/Anaconda2-5.0.1-Linux-x86_64.sh https://repo.continuum.io/archive/Anaconda2-5.0.1-Linux-x86_64.sh && \
    bash /tmp/Anaconda2-5.0.1-Linux-x86_64.sh -b -f -p /opt/anaconda2 && \
    conda install -y bcolz && \
    conda upgrade -y --all && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        build-essential gcc g++ make binutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    conda install pygpu theano && \
    pip --no-cache-dir install \
        https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.4.0-cp27-none-linux_x86_64.whl \
        keras==1.2.2

COPY .theanorc /root/.theanorc
COPY keras.th.json /root/.keras/
COPY keras.tf.json /root/.keras/
RUN ln -sf /root/.keras/keras.th.json /root/.keras/keras.json
COPY jupyter_notebook_config.py /root/.jupyter/
COPY run_jupyter.sh /

ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

EXPOSE 6006
EXPOSE 8888
WORKDIR /notebooks
RUN git clone https://github.com/fastai/courses.git

CMD ["/run_jupyter.sh", "--allow-root"]
