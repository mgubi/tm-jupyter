# Jupyter client for TeXmacs

Version 0.1.0 -- (c) 2019 Massimiliano Gubinelli

Allows for interactive TeXmacs sessions with Jupyter kernels such as IPython, IJulia, IRKernel.

In development, many things to fix: history, rich output, non-textual output, interaction, help...

Based on Jupyter console, a terminal-based console frontend for Jupyter kernels.
Jupyter code is released under a modified BSD license, see COPYING.md

## Info about Jupyter cosole (to be reviewed)

To start the console with a particular kernel, ask for it by name::

    jupyter console --kernel=julia-0.4

A list of available kernels can be seen with::

    jupyter kernelspec list


## Resources
- [Project Jupyter website](https://jupyter.org)
- [Documentation for Jupyter Console](https://jupyter-console.readthedocs.io/en/latest/) [[PDF](https://media.readthedocs.org/pdf/jupyter-console/latest/jupyter-notebook.pdf)]
- [Documentation for Project Jupyter](https://jupyter.readthedocs.io/en/latest/index.html) [[PDF](https://media.readthedocs.org/pdf/jupyter/latest/jupyter.pdf)]
- [Issues](https://github.com/jupyter/jupyter_console/issues)
- [Technical support - Jupyter Google Group](https://groups.google.com/forum/#!forum/jupyter)
