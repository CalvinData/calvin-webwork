# calvin-webwork

WebWorK problems authored by Calvin University faculty

## File and Directory Conventions

* Mimic [taxonomy used in WebWorK's OPL](https://raw.githubusercontent.com/openwebwork/webwork-open-problem-library/master/OpenProblemLibrary/Taxonomy2)
  * Subject/Chapter/Section/problem.pg
* Replace spaces with hyphens in directory names
  * `Statistics/Discrete-distibutions/Binomial/`
* Add additional folders as need when taxonomy is deficient
  * `Statistics/Discrete-distibutions/Identifying/`
* Could replace top level with something indicating connection to a text book
  * `FASt` for problems from Foundations and Applicaitons of Statistics
  * optionally add the chapter/section   
* Use lower case and hypens for pg file names (`expected-value-suits.pg`)
* Place modifications of existing OPL or Contrib prolbems in `Modified`???  (Not sure if this is a good idea or not.  But it probably is a good idea to retain the original filename so it is easier to identify where the problem originated.)
* If you modify an existing `00Calvin` problem, add your initials
  * `some-problem-rjp.pg`
  * This will keep things from breaking in someone else's assignment mid-semester.

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
  * Use **single quotes** around code sent to `rserve_eval()` to avoid interpolation of strings in Perl.
  * Use Perl concatenation (`'rnorm( '. $n . ')'`) or interpolation (`"rnorm($n)"`) to get Perl variables into R code -- but be careful about how `$` is used in R!
