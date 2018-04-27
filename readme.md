# Target
The one I find most interesting involves using Shiny for visualizations in the notes--like Figures 1.1 and 1.2, especially if we could do something with clustering, serial correlation, etc.

Optional Data Set
http://www.cpds-data.org/index.php/data
# Some comments on that dataset:
- Seems to be famous and informative, with 1614 objects with 304 variables.
- 36 countries included, which is really a standard ROD data.
- But I must say, the hetrogeneity Bias here may not be so strong in this dataset

cpds <- readxl::read_xlsx("CPDS-1960-2015-Update-2017.2.xlsx")
names(cpds)


