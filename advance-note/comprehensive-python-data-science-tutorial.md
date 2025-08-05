---
icon: python
---

# Comprehensive Python Data Science Tutorial

### **Comprehensive Python Data Science Tutorial**

This tutorial covers Python basics and the key data science libraries: **NumPy**, **Pandas**, **Matplotlib**, **Scikit-learn**, **Seaborn**, and **SciPy**. Each section includes:

* **What it is**: Purpose and importance.
* **Key concepts**: Core functionalities.
* **Examples**: Practical, explained code.
* **Integration**: How it works with other libraries.

At the end, I’ll provide a combined example showing a full data science workflow.

***

#### **1. Python Basics**

**What is Python?**

Python is a high-level, interpreted programming language known for its simplicity and readability. It’s widely used in data science due to its versatility and extensive libraries.

**Key Concepts**

* **Variables and Data Types**: Store data as integers, floats, strings, lists, tuples, dictionaries, or sets.
* **Control Structures**: Use if-else for decisions, for/while loops for iteration.
* **Functions**: Reusable code blocks for modularity.
* **Modules and Libraries**: Import external code for extended functionality.

**Detailed Example: Python Basics**

Let’s create a simple program to manage a list of student grades, demonstrating variables, lists, loops, and functions.

python`# Variables and data typesstudent_name = "Alice" # Stringgrade = 85 # Integerpercentage = 92.5 # Floatgrades = [90, 85, 88, 92] # Liststudent_info = {"name": "Alice", "age": 20} # Dictionary# Control structure: if-elseif grade >= 90:print(f"{student_name} got an A!")elif grade >= 80:print(f"{student_name} got a B!")else:print(f"{student_name} needs improvement.")# Loop: Iterate through gradesprint("\nAll grades:")for g in grades:print(g)# Function: Calculate average gradedef calculate_average(grades_list):return sum(grades_list) / len(grades_list)avg = calculate_average(grades)print(f"\nAverage grade: {avg:.2f}")`

**Explanation**:

* **Variables**: student\_name (string), grade (integer), percentage (float), grades (list), student\_info (dictionary).
* **If-else**: Checks the grade and prints a message based on conditions.
* **Loop**: Prints each grade in the list.
* **Function**: calculate\_average computes the mean of grades.
* **Output**:text`Alice got a B!All grades:90858892Average grade: 88.75`

***

#### **2. NumPy: Numerical Computing**

**What is NumPy?**

NumPy is a library for numerical computations, providing support for multidimensional arrays and mathematical functions. It’s the foundation for many data science libraries.

**Key Concepts**

* **ndarray**: Multidimensional arrays for fast computations.
* **Array Operations**: Element-wise operations, broadcasting.
* **Mathematical Functions**: Mean, sum, standard deviation, linear algebra.
* **Random Module**: Generate random numbers.

**Detailed Example: Array Operations**

Let’s create and manipulate arrays to analyze student test scores.

python`import numpy as np# Create a 2D array of student scores (rows: students, columns: tests)scores = np.array([[85, 90, 88], [78, 82, 80], [95, 92, 94]])print("Scores array:\n", scores)# Array operationsprint("\nMean score per student:", np.mean(scores, axis=1)) # Average across testsprint("Mean score per test:", np.mean(scores, axis=0)) # Average across studentsprint("Max score:", np.max(scores)) # Highest scoreprint("Scores + 5 (bonus):\n", scores + 5) # Broadcasting# Generate random datarandom_scores = np.random.randint(70, 100, size=(3, 2)) # Random scores for 3 students, 2 testsprint("\nRandom scores:\n", random_scores)`

**Explanation**:

* **Array Creation**: scores is a 2D array (3 students, 3 tests).
* **Mean**: np.mean(scores, axis=1) computes the average score for each student; axis=0 computes per test.
* **Broadcasting**: Adding 5 to the entire array increases each score.
* **Random**: Generates random integers between 70 and 100.
* **Output** (example):text`Scores array:[[85 90 88][78 82 80][95 92 94]]Mean score per student: [87.66666667 80. 93.66666667]Mean score per test: [86. 88. 87.33333333]Max score: 95Scores + 5 (bonus):[[90 95 93][83 87 85][100 97 99]]Random scores:[[82 91][77 88][95 73]]`

***

#### **3. Pandas: Data Manipulation**

**What is Pandas?**

Pandas is a library for data manipulation and analysis, offering DataFrame and Series objects to handle structured data (e.g., CSV, Excel).

**Key Concepts**

* **DataFrame**: Tabular data structure (rows and columns).
* **Series**: One-dimensional array-like object.
* **Operations**: Filtering, grouping, merging, handling missing data.
* **I/O**: Read/write CSV, Excel, JSON.

**Detailed Example: Analyzing Employee Data**

Let’s create and analyze a DataFrame of employee records.

python`import pandas as pd# Create a DataFramedata = {"Name": ["Alice", "Bob", "Charlie", "David"],"Age": [25, 30, 35, 40],"Salary": [50000, 60000, 75000, 80000],"Department": ["HR", "IT", "IT", "HR"]}df = pd.DataFrame(data)print("Employee DataFrame:\n", df)# Filter employees with salary > 60000high_salary = df[df["Salary"] > 60000]print("\nHigh earners:\n", high_salary)# Group by department and calculate average salaryavg_salary = df.groupby("Department")["Salary"].mean()print("\nAverage salary by department:\n", avg_salary)# Handle missing datadf.loc[1, "Salary"] = None # Introduce a missing valueprint("\nDataFrame with missing value:\n", df)df["Salary"] = df["Salary"].fillna(df["Salary"].mean()) # Fill with meanprint("\nAfter filling missing value:\n", df)`

**Explanation**:

* **DataFrame**: df stores employee data in a table.
* **Filtering**: Selects employees with salaries above 60000.
* **Grouping**: Computes average salary per department.
* **Missing Data**: Replaces None with the mean salary.
* **Output**:text`Employee DataFrame:Name Age Salary Department0 Alice 25 50000 HR1 Bob 30 60000 IT2 Charlie 35 75000 IT3 David 40 80000 HRHigh earners:Name Age Salary Department2 Charlie 35 75000 IT3 David 40 80000 HRAverage salary by department:DepartmentHR 65000.0IT 67500.0Name: Salary, dtype: float64DataFrame with missing value:Name Age Salary Department0 Alice 25 50000.0 HR1 Bob 30 NaN IT2 Charlie 35 75000.0 IT3 David 40 80000.0 HRAfter filling missing value:Name Age Salary Department0 Alice 25 50000.0 HR1 Bob 30 68333.3 IT2 Charlie 35 75000.0 IT3 David 40 80000.0 HR`

***

#### **4. Matplotlib: Data Visualization**

**What is Matplotlib?**

Matplotlib is a plotting library for creating static, interactive, and animated visualizations.

**Key Concepts**

* **Plots**: Line, scatter, bar, histogram, pie, etc.
* **Customization**: Titles, labels, legends, colors, grid.
* **Subplots**: Multiple plots in one figure.
* **Integration**: Works with NumPy and Pandas.

**Detailed Example: Plotting Sales Data**

Let’s visualize monthly sales data using a line and bar plot.

python`import matplotlib.pyplot as pltimport numpy as np# Sample datamonths = np.array(["Jan", "Feb", "Mar", "Apr"])sales = np.array([200, 250, 300, 280])# Line plotplt.figure(figsize=(8, 5))plt.plot(months, sales, marker='o', color='blue', label='Sales')plt.title("Monthly Sales Trend")plt.xlabel("Month")plt.ylabel("Sales ($)")plt.legend()plt.grid(True)plt.show()# Bar plotplt.figure(figsize=(8, 5))plt.bar(months, sales, color='green', alpha=0.7)plt.title("Monthly Sales")plt.xlabel("Month")plt.ylabel("Sales ($)")plt.show()`

**Explanation**:

* **Line Plot**: Shows sales trends with markers at data points.
* **Bar Plot**: Displays sales as bars for easy comparison.
* **Customization**: Includes title, labels, legend, and grid.
* **Output**: Two plots (line and bar) are displayed sequentially.

***

#### **5. Scikit-learn: Machine Learning**

**What is Scikit-learn?**

Scikit-learn is a machine learning library for classification, regression, clustering, and more.

**Key Concepts**

* **Supervised Learning**: Classification (e.g., logistic regression), regression (e.g., linear regression).
* **Unsupervised Learning**: Clustering (e.g., K-means), dimensionality reduction.
* **Preprocessing**: Scaling, encoding, splitting data.
* **Model Evaluation**: Accuracy, cross-validation, confusion matrix.

**Detailed Example: Predicting House Prices**

Let’s build a linear regression model to predict house prices based on size.

python`from sklearn.linear_model import LinearRegressionfrom sklearn.model_selection import train_test_splitimport numpy as np# Sample datasizes = np.array([[1500], [1800], [2400], [3000], [3500]]) # House sizes (sq ft)prices = np.array([300000, 350000, 400000, 500000, 600000]) # Prices ($)# Split data into training and testing setsX_train, X_test, y_train, y_test = train_test_split(sizes, prices, test_size=0.2, random_state=42)# Train modelmodel = LinearRegression()model.fit(X_train, y_train)# Predictpredictions = model.predict(X_test)print("Test predictions:", predictions)print("Actual prices:", y_test)# Model parametersprint("Slope (price per sq ft):", model.coef_[0])print("Intercept:", model.intercept_)`

**Explanation**:

* **Data**: House sizes (features) and prices (target).
* **Train-Test Split**: 80% training, 20% testing.
* **Model**: Linear regression fits a line to predict prices.
* **Output** (example):text`Test predictions: [359090.90909091]Actual prices: [350000]Slope (price per sq ft): 181.8181818181818Intercept: 86363.63636363636`

***

#### **6. Seaborn: Advanced Visualization**

**What is Seaborn?**

Seaborn is a statistical visualization library built on Matplotlib, offering high-level functions for attractive plots.

**Key Concepts**

* **Statistical Plots**: Box plots, violin plots, heatmaps, pair plots.
* **Themes**: Predefined styles for better aesthetics.
* **Categorical Data**: Handles grouping by categories.
* **Integration**: Works with Pandas DataFrames.

**Detailed Example: Visualizing Employee Data**

Let’s visualize the employee dataset from earlier using Seaborn.

python`import seaborn as snsimport pandas as pdimport matplotlib.pyplot as plt# Sample datadata = {"Name": ["Alice", "Bob", "Charlie", "David"],"Age": [25, 30, 35, 40],"Salary": [50000, 60000, 75000, 80000],"Department": ["HR", "IT", "IT", "HR"]}df = pd.DataFrame(data)# Set Seaborn themesns.set_theme(style="darkgrid")# Box plot: Salary by departmentplt.figure(figsize=(8, 5))sns.boxplot(x="Department", y="Salary", data=df)plt.title("Salary Distribution by Department")plt.show()# Pair plot: Relationships between variablessns.pairplot(df, hue="Department", vars=["Age", "Salary"])plt.show()`

**Explanation**:

* **Box Plot**: Shows salary distribution per department, highlighting medians and ranges.
* **Pair Plot**: Displays scatter plots for Age vs. Salary, colored by department.
* **Output**: Two plots (box and pair) are displayed.

***

#### **7. SciPy: Scientific Computing**

**What is SciPy?**

SciPy extends NumPy with advanced scientific functions for optimization, statistics, integration, and more.

**Key Concepts**

* **Statistics**: Hypothesis tests, probability distributions.
* **Optimization**: Minimize/maximize functions.
* **Linear Algebra**: Eigenvalues, matrix operations.
* **Integration/Interpolation**: Numerical integration, curve fitting.

**Detailed Example: Statistical Test and Optimization**

Let’s perform a t-test and optimize a function.

python`import numpy as npfrom scipy import stats, optimize# T-test: Compare two groupsgroup1 = np.array([20, 22, 19, 21, 23]) # Test scores: Group 1group2 = np.array([25, 27, 24, 26, 28]) # Test scores: Group 2t_stat, p_value = stats.ttest_ind(group1, group2)print(f"T-test: t-statistic = {t_stat:.2f}, p-value = {p_value:.4f}")# Optimization: Minimize a functiondef cost_function(x):return x**2 + 10 * np.sin(x) # Non-linear functionresult = optimize.minimize(cost_function, x0=0)print(f"Optimization: x = {result.x[0]:.2f}, function value = {result.fun:.2f}")`

**Explanation**:

* **T-test**: Tests if the means of two groups are significantly different (p-value < 0.05 indicates a difference).
* **Optimization**: Finds the minimum of x² + 10sin(x), starting at x=0.
* **Output** (example):text`T-test: t-statistic = -5.48, p-value = 0.0005Optimization: x = -1.31, function value = -7.95`



***

#### **8. Integrated Data Science Workflow**

Let’s combine all libraries into a complete data science project: analyzing a dataset of house prices, performing statistical analysis, building a predictive model, and visualizing results.

python\
`import pandas as pd`\
`import numpy as np`\
\
`import matplotlib.pyplot as plt`\
`import seaborn as sns`\
`from sklearn.linear_model import LinearRegressionfrom` \
`sklearn.model_selection import train_test_splitfrom scipy import stats# Create sample datasetdata = {"Size": [1500, 1800, 2400, 3000, 3500, 2000, 2800],"Bedrooms": [3, 3, 4, 4, 5, 3, 4],"Price": [300000, 350000, 400000, 500000, 600000, 320000, 450000],"Location": ["Urban", "Suburban", "Urban", "Rural", "Rural", "Suburban", "Urban"]}df = pd.DataFrame(data)print("Dataset:\n", df)# Pandas: Data analysisprint("\nAverage price by location:\n", df.groupby("Location")["Price"].mean())# SciPy: Statistical test (t-test for Urban vs. Rural prices)urban_prices = df[df["Location"] == "Urban"]["Price"]rural_prices = df[df["Location"] == "Rural"]["Price"]t_stat, p_value = stats.ttest_ind(urban_prices, rural_prices)print(f"\nT-test (Urban vs Rural): p-value = {p_value:.4f}")# Scikit-learn: Linear regressionX = df[["Size", "Bedrooms"]].valuesy = df["Price"].valuesX_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)model = LinearRegression()model.fit(X_train, y_train)predictions = model.predict(X_test)print("\nPredictions:", predictions)print("Actual prices:", y_test)# Seaborn: Visualizationsns.set_theme(style="whitegrid")plt.figure(figsize=(8, 5))sns.scatterplot(x="Size", y="Price", hue="Location", size="Bedrooms", data=df)plt.plot(df["Size"], model.predict(df[["Size", "Bedrooms"]]), color="red", label="Regression")plt.title("House Price vs Size")plt.xlabel("Size (sq ft)")plt.ylabel("Price ($)")plt.legend()plt.show()`

**Explanation**:

* **Pandas**: Loads and groups data by location to compute average prices.
* **SciPy**: Performs a t-test to compare prices in Urban vs. Rural areas.
* **Scikit-learn**: Trains a linear regression model using Size and Bedrooms to predict Price.
* **Seaborn**: Visualizes house prices with a scatter plot, colored by location and sized by bedrooms, with a regression line.
* **Output** (example): text`Dataset:Size Bedrooms Price Location0 1500 3 300000 Urban1 1800 3 350000 Suburban...Average price by location:LocationRural 550000.000000Suburban 335000.000000Urban 383333.333333Name: Price, dtype: float64T-test (Urban vs Rural): p-value = 0.1867Predictions: [333636.36363636]Actual prices: [350000]`
* **Plot**: Shows a scatter plot with a fitted regression line.

***

#### **9. Additional Tips**

* **Virtual Environments**: Isolate dependencies.\
  bash\
  `python` \
  `-m venv myenvsource myenv/bin/activate # Linux`\
  `/Macmyenv\Scripts\activate # Windows`
* **Jupyter Notebooks**: Use for interactive analysis.\
  bash \
  `pip install jupyterjupyter notebook`
* **Installation**: Install all libraries: \
  bash\
  `pip install numpy pandas matplotlib scikit-learn seaborn scipy`

***

#### **10. Resources**

* **Documentation**:
  * [NumPy](https://numpy.org/doc/stable/)
  * [Pandas](https://pandas.pydata.org/docs/)
  * [Matplotlib](https://matplotlib.org/stable/contents.html)
  * [Scikit-learn](https://scikit-learn.org/stable/)
  * [Seaborn](https://seaborn.pydata.org/)
  * [SciPy](https://docs.scipy.org/doc/scipy/)
* **Learning**: Kaggle, DataCamp, Coursera, or books like “Python for Data Analysis” (Wes McKinney).

***

