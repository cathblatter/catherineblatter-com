# 1. Packages ---------------------------------------------------------------

library(dplyr) # A Grammar of Data Manipulation, CRAN v1.0.8 


# 2. Creating a sample-df -------------------------------------------------

# 'tribble()' lets you construct rowwise-tibbles (thus the R in tribble())
# (resembles more the idea of data when you need to make an example dataframe)
(df <- tibble::tribble(
  ~id, ~pesnwi_leadership, ~pesnwi_sra, ~bernca_adl, ~bernca_docu,
  1, 2.3, 2.1, 1.8, 1.4,
  2, 2.0, 3, 2.1, 0.9,
  3, 3.1, 3.5, 3.9, 3
))


# 3. Rename colnames -------------------------------------------

# a) using {dplyr} dplyr::rename()

# manual renaming following the idea of newname = oldname
# this is the approach you need to take for manual replacement of 
# column-names (see an equivalent base-R code below)
df %>%
  rename(
    pesnwi_ls = pesnwi_leadership,
    ration_adl = bernca_adl,
    ration_docu = bernca_docu
  )


# b) using {base}-R syntax
names(df)[names(df)=="pesnwi_leadership"] <- "pesnwi_ls"


# c) - automatic renaming based on text-pattern-matching (regular expression)
# ONLY WORKS IN SPECIFIC SITUATIONS - should always be checked manually

# for both 'bernca_' variables you could use a function to replace 'bernca' by 'ration'
# but obviously this does not rename the 'pesnwi_ls'
df %>%
  rename_with(
    .fn = ~ stringr::str_replace(., pattern = "bernca", replacement = "ration"),
    .cols = everything()
  )

