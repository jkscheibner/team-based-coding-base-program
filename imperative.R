## An imperative example script for traditional linear statistical coding analysis

## Steps:
# Generate fake data
#   Create IDs
#   Create groups
#   Create regressor values
#   Create Y from regressor values
#   Generate Yhat by adding errors
#   Add additional errors for 'cleaning'
#   Collate into dataframe
#   Save to data sub directory
# Regressions
#   Load data
#   Specify and estimate core regressions
#   Check and observe issues
#   Clean data
#   New regressions with clean data
# Regression specification and clean data tests
#   ANOVA for nested models
#   AIC for raw vs clean data models
# Generate summary tables
# Save tables/results to file

# load required libraries
#require(here)

## instead set up local paths
base_path = getwd()

# source local utilities
source(paste(base_path, "/createPath.R", sep=""))
source(createPath("/generateData.R"))
source(createPath("/writeData.R"))
source(createPath("/generateAnalysis.R"))
source(createPath("/generateResults.R"))

####### Generate data ########
generateData()

######## Regression tests ########
generateAnalysis()

######## Summary tables (generate results) ##########
generateResults()

######## Write results to file ##########

#base_path = getwd()
#results_folder_path = paste(base_path, "/results", sep="")
#reg_table_file_path = paste(base_path, "/results/regression_table_clean.csv", sep=""

#check directory is present first
results_folder_path = createPath("/results")

#if(!dir.exists(here("results"))){
#    dir.create(here("results"))
#}
if(!dir.exists(results_folder_path)){
    dir.create(results_folder_path)
}

#file_path = here("results", "regression_table_raw.csv")
file_path = createPath("/results/regression_table_raw.csv")
if(file.exists(file_path)){
    file.remove(file_path)
} 
write.csv(outmat_raw,file_path, row.names=TRUE)

#file_path = here("results", "regression_table_clean.csv")
file_path = createPath("/results/regression_table_clean.csv")
if(file.exists(file_path)){
    file.remove(file_path)
} 
write.csv(outmat_clean,file_path, row.names=TRUE)

#file_path = here("results", "anova_table_raw.csv")
file_path = createPath("/results/anova_table_raw.csv")
if(file.exists(file_path)){
    file.remove(file_path)
} 
write.csv(tests_mat_raw,file_path, row.names=TRUE)

#file_path = here("results", "anova_table_clean.csv")
file_path = createPath("/results/anova_table_clean.csv")
if(file.exists(file_path)){
    file.remove(file_path)
} 
write.csv(tests_mat_clean,file_path, row.names=TRUE)
