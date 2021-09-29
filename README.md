# calvin-webwork

WebWork problems authored by Calvin University faculty

## File and Directory Conventions

* CamelCase for directories
  * top level to indicate subject area (`Statistics`, `Probability`, `LinearAlgebra`, `MachineLearning`, etc.)
  * add subdirectories to refine (`Statistics/HypothesisTests`, `Statistics/Residuals`, etc.)
  * Could create top-level directories to mirror structure of textbooks (`FASt`)
    * add subdirectories for chapters or other subunits of the book
  
* Use hypens for pg file names (`expected-value-suits.pg`)

## Problem authoring advice

* Start from an existing problem **_that uses PGML_**.
  * [PGML Cheatsheet](https://webwork.maa.org/mediawiki_new/images/f/f5/PGML-cheatsheet.pdf)
  * [Intro to PGML](https://webwork.maa.org/wiki/Introduction_to_PGML)
  * [Writing your own problems in PGML](https://webwork.maa.org/wiki/Writing_Your_Own_Homework_Problems_Using_PGML)
  * [PGML Reference](https://webwork.maa.org/wiki/Category:PGML)
  
* Build problems assuming they will end up in the OPL
  * Include/update [**meta-data, aka tags**](https://webwork.maa.org/wiki/Tagging_Problems)
  * Use **MLT (more like this) tag** if you create a modification of an 
  existing problem or to group similar problems. (See [here](https://webwork.maa.org/wiki/Submitting_problems_to_the_OPL#Submitting_.27similar.27_or_.27modifications.27_to_existing_OPL_problems) for details.)
  * [Submitting to OPL](https://webwork.maa.org/wiki/Submitting_problems_to_the_OPL)
  
* [Using R in problems](https://webwork.maa.org/wiki/R_in_WeBWorK#Authoring_problems_with_R_code)
  * Use **single quotes** around code sent to `rserve_eval()` to avoid interpolation
  of strings in Perl.
