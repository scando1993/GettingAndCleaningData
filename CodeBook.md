# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* First, we check if the dataSet is in the same folder than the script
* The script looks for the dataSet in the same location where the file is
* Then we charge all data into memory and after that the data is merged by binding it by rows.
* After that we take the data that contains the columns that specifies mean and std. And also we correct the names from
features.
* The names are taken from activity in `activity_labels.txt` and are substituted.
* Finally, a new dataset is generated with all the average measures.ded to this repository.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* `act_labs` contains the labels from `activity_labels.txt`.
* `complete_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* Finally, `avg_data` contains the relevant averages which will be later stored in a `.txt` file. 