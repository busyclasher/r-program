# r-program

R fundamentals practice repository. Learning resources and example code.

## Getting Started

**Prerequisites:**
- R installed on Windows ([Download](https://cran.r-project.org/))
- VS Code with R extension installed

## Learning Path

Follow these scripts in order to learn R fundamentals:

1. **01-basics.R** - Variables, data types, arithmetic, and comparisons
2. **02-vectors.R** - Vector creation, indexing, and operations
3. **03-functions.R** - Creating and using functions
4. **04-control-flow.R** - If/else statements and loops
5. **05-data-structures.R** - Lists, data frames, matrices, and factors
6. **06-data-analysis-project.R** - Load CSV data, summarize it, export results, and create charts

## Six-Week Data Analysis Tutorials

The `tutorials` folder contains guided practice scripts based on this path:

1. Week 1 - Setup, RStudio orientation, loading CSV files
2. Week 2 - Data manipulation with `dplyr`
3. Week 3 - Visualization with `ggplot2`
4. Week 4 - Reshaping, joining, importing, and dates
5. Week 5 - Starting a focused analysis project
6. Week 6 - Communicating results with a report structure

Open [tutorials/README.md](tutorials/README.md) first, then work through each weekly `.R` file in RStudio.

## Running R Code

**Option 1: Interactive Mode (via Terminal)**
```powershell
R
source("01-basics.R")
```

**Option 2: Using VS Code R Extension**
- Open an .R file
- Use Ctrl+Enter to run selected line/block
- Use Ctrl+Shift+S to source entire file

**Option 3: From Command Line**
```powershell
Rscript 01-basics.R
```

For the data analysis project:
```powershell
Rscript 06-data-analysis-project.R
```

This creates an `output` folder with summary CSV files and chart images.

## Tips
- R is 1-indexed (first element is at position 1, not 0)
- Use `<-` or `=` for assignment (prefer `<-`)
- Comments use `#`
- Use `?function_name` for help (in R console)
