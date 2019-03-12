FROM dynverse/dynwrappy:v0.1.0

RUN pip install git+https://github.com/kieranrcampbell/ouijaflow.git --upgrade --upgrade-strategy only-if-needed && \
    pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl # temporary fix for edward https://github.com/blei-lab/edward/issues/882

COPY definition.yml run.py example.h5 /code/

ENTRYPOINT ["/code/run.py"]
