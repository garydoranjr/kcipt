KCIPT: Kernel Conditional Independence Permutation Test
=======================================================

Gary Doran (<gary.doran@case.edu>)

Overview
--------

This repository includes MATLAB code for the Kernel Conditional Independence
Permutation Test (KCIPT) as introduced in:
> Doran, Gary, Krikamol Muandet, Kun Zhang, and Bernhard Schölkopf. **A
> Permutation-Based Kernel Conditional Independence Test.** _To appear in the
> 30th Conference on Uncertainty in Artificial Intelligence._ 2014.

Setup
-----

The code in this repository depends on the implementations of prior approaches,
found [here](http://people.tuebingen.mpg.de/kzhang/KCI-test.zip), and an
implementation of the PC algorithm, found
[here](https://bnt.googlecode.com/files/FullBNT-1.0.7.zip). A BASH script has
been included that automatically fetches these dependencies:

    $ ./setup.sh

Running the Experiments
-----------------------

The MATLAB scripts in the root of this repository can be used to run all
experiments found in the paper. By default, results are stored in the `results`
directory. In practice, the individual experiments were run on a computing
cluster, and a copy of the results can be found
[here](http://engr.case.edu/doran_gary/assets/kcipt-results.zip).
