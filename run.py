#!/usr/local/bin/python

import dynclipy
task = dynclipy.main()
# task = dynclipy.main(
#   ["--dataset", "/code/example.h5", "--output", "/mnt/output"],
#   "/code/definition.yml"
# )

import pandas as pd
from ouijaflow import ouija

import time
checkpoints = {}

#   ____________________________________________________________________________
#   Load data                                                               ####
expression = task["expression"]
p = task["parameters"]

checkpoints["method_afterpreproc"] = time.time()

#   ____________________________________________________________________________
#   Create trajectory                                                       ####

oui = ouija()
oui.fit(expression.values, n_iter=int(p["iter"]))

z = oui.trajectory()

checkpoints["method_aftermethod"] = time.time()

#   ____________________________________________________________________________
#   Process output & save                                                   ####

dataset = dynclipy.wrap_data(cell_ids = expression.index)

# pseudotime
pseudotime = pd.DataFrame({
  "pseudotime": z,
  "cell_id": expression.index
})
dataset.add_linear_trajectory(pseudotime = pseudotime)

# timings
dataset.add_timings(timings = checkpoints)

dataset.write_output(task["output"])
