# 📘 R Programming Course – From Beginner to Advanced

## 📘 Summary: Full R Programming Course

***

### 🧠 Introduction to R Programming

R is a powerful, open-source language tailored for statistical computing, data analysis, and machine learning. It boasts 9,000+ community-contributed packages and seamless integration with other languages like C, C++, Java, and Python. The course, led by trainer **Ajay**, starts from the basics and progresses to advanced topics including data structures, operators, visualization, and real-world projects.

***

### 💻 Setting Up R and RStudio

* **R** can be downloaded from CRAN for Windows, Mac, or Linux.
* **RStudio**, a dedicated IDE for R, enhances productivity with its intuitive interface, console, and plotting tools.
* Key features include script management, built-in datasets (`iris`, `mtcars`), and data summary tools.

***

### 🧾 Variables and Data Types

* Variables are case-sensitive and follow naming rules.
* Common data types:
  * Logical (`TRUE`, `FALSE`)
  * Numeric (double), Integer, Complex
  * Character, Raw
* Use `<-` or `=` for assignment.
* Identify types using `typeof()`, `class()`, `str()`.

***

### ➕ Operators in R

* **Arithmetic:** `+`, `-`, `*`, `/`, `%%`, `^`
* **Relational:** `<`, `>`, `==`, `!=`, `<=`, `>=`
* **Logical:** `&`, `|`, `!`
* Operator precedence matters—use parentheses for clarity.

***

### 🧱 Core Data Objects

* **Vectors:** One-dimensional, same type, created with `c()`
* **Lists:** Hold elements of different types, access via `[[ ]]`, `$`
* **Matrices:** 2D, same atomic type, use `matrix()`, `rbind()`, `cbind()`
* **Data Frames:** Tabular, mixed types across columns, manipulated with `$`, `[]`, `subset()`

***

### 📊 Working with Data Frames

* Create with `data.frame()` or import via `read.csv()`
* Subset rows/columns, apply conditions
* Use `order()`, `merge()`, `rbind()`, `cbind()` for data operations

***

### 🔁 Flow Control in R

* `if`, `else if`, `else`: for conditional logic
* `while`: loop while condition is TRUE
* `for`: loop through sequences
* `break`: exit loops early when conditions are met

***

### 🛠️ Functions in R

* Defined using `function()`
* Accept parameters (with defaults), return values
* Use `...` for variable-length arguments
* Variables inside functions are local unless otherwise specified

***

### 🧮 Built-in Functions & Regex

* Math: `sum()`, `mean()`, `log()`, `sqrt()`
* Strings: `paste()`, `substr()`, `grep()`
* Dates: `as.Date()`, `format()`, arithmetic
* Regex allows pattern detection & text processing

***

### 🗂️ Factors and Categorical Data

* Factors = categorical variables with predefined levels
* Use `factor()`, manage levels with `levels()` and `labels`
* Types: Nominal (unordered), Ordinal (ordered)
* Useful for modeling and optimizing memory

***

### 🧹 Data Manipulation with dplyr

Key `dplyr` verbs for transforming data:

* `filter()` – subset rows
* `select()` – choose columns
* `mutate()` – create new columns
* `summarize()` – aggregate results
* `group_by()` – group before summarizing
* `arrange()` – sort rows
* Use `%>%` pipe for chaining clean, readable operations

***

### 🧼 Data Tidying with tidyr

Essential for reshaping messy data:

* `gather()` – wide to long
* `spread()` – long to wide
* `separate()` – split columns
* `unite()` – merge columns\
  Helps clean and structure data for analysis/visualization.

***

### 📈 Data Visualization in R

Multiple options for plotting:

* **Base R Graphics:** `plot()`, `barplot()`, `hist()`, etc.
* **ggplot2:** Grammar of graphics for layered plots, fully customizable
* **plotly:** Interactive, web-ready visuals
* Common charts: scatter, line, bar, box, violin, pie

***

### 📊 Time Series Analysis Project

Real-world analysis of electricity consumption data:

* Handle missing values, convert and extract date components
* Seasonal patterns via boxplots (by month, year, weekday)
* Use `zoo::rollmean()` for rolling averages (3, 7, 365 days)
* Tidy with `tidyr::fill()` for forward fill
* Multi-layered plots for trend and seasonality
* Confirms data frequency and supports anomaly detection
* **Project code available on trainer’s GitHub**

***

### 🎯 End of Course Summary

This **R programming course** provides a solid foundation in:\
✅ Data structures & control flow\
✅ Data wrangling with `dplyr` and `tidyr`\
✅ Reusable functions & regex\
✅ Data visualization (static & interactive)\
✅ Real-world time series project

Learners gain hands-on experience and are well-prepared for roles in **data science**, **analytics**, or **research** using R.
