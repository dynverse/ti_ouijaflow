FROM dynverse/dynwrappy:v0.1.0

RUN pip install git+https://github.com/kieranrcampbell/ouijaflow.git --upgrade --upgrade-strategy only-if-needed
# RUN pip install tensorflow==1.6 # temporary fix for edward https://github.com/blei-lab/edward/issues/882

COPY definition.yml run.py example.h5 /code/

ENTRYPOINT ["/code/run.py"]
