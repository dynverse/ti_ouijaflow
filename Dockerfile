FROM dynverse/dynwrappy36:v0.1.0

RUN pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl && \
    pip install git+https://github.com/kieranrcampbell/ouijaflow.git --upgrade --upgrade-strategy only-if-needed

COPY definition.yml run.py example.sh /code/

ENTRYPOINT ["/code/run.py"]
