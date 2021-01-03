+++
title = "mri-sim-py.epg: A GPU-accelerated Extended Phase Graph Algorithm for differentiable optimization and learning"
date = "2020-12-16"
+++
# mri-sim-py.epg: A GPU-accelerated Extended Phase Graph Algorithm for differentiable optimization and learning
The Extended Phase Graph Algorithm is a powerful tool for MRI sequence simulation and quantitative fitting, but such simulators are mostly written to run on CPU only and (with some exception) are poorly parallelized. A parallelized simulator compatible with other learning-based frameworks would be a useful tool to optimize scan parameters. Thus, we created an open source, GPU-accelerated EPG simulator in PyTorch. Since the simulator is fully differentiable by means of automatic differentiation, it can be used to take derivatives with respect to sequence parameters, e.g. flip angles, as well as tissue parameters, e.g. T1 and T2.

We chose mri-sim-py as the host package because it already contains different algorithms for simulating signals and this was a natural extension. Python was chosen as it can be demonstrated easily by means of Jupyter notebooks and interfaced with PyTorch, a popular machine learning auto-differentiation framework. The EPG Algorithm has three components: RF excitation, gradient application, and tissue relaxation.

The latest version of this tool is available from the [Github repository](https://github.com/utcsilab/mri-sim-py/tree/master/epg) of mri-sim-py. Installation instructions are provided in the README file present there. Jupyter notebook containing an example is also available [here](https://github.com/utcsilab/mri-sim-py/blob/master/EPG_Parallel.ipynb).

After successfully parallelizing the simulator, we increased its speed by almost 100,000 times. This work was submitted as an abstract in ISMRM virtual conference.

## Acknowledgements
This work was supported by the Amazon AWS Machine Learning Research grant.
