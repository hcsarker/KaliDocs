---
icon: chart-mixed-up-circle-dollar
---

# DS by Python

#### Section 1: Python Fundamentals

These are the building blocks of any Python program.

**1.1 Variables and Data Types**

Python has several built-in data types.

Python

```
# Integers (int)
age = 30
# Floating-point numbers (float)
pi = 3.14159
# Strings (str)
name = "Alice"
# Booleans (bool)
is_active = True

print(f"Name: {name}, Age: {age}")
# Output: Name: Alice, Age: 30
```

**1.2 Data Structures**

Data structures are used to store collections of data.

*   List: An ordered, mutable (changeable) collection.

    Python

    ```
    my_list = [1, "two", 3.0]
    print(my_list[1])
    # Output: two
    ```
*   Dictionary: An unordered collection of key-value pairs.

    Python

    ```
    my_dict = {'city': 'Dhaka', 'population': 10000000}
    print(my_dict['population'])
    # Output: 10000000
    ```

**1.3 Control Flow and Functions**

These allow you to control the logic of your code.

*   `if-elif-else` Statements: For making decisions.

    Python

    ```
    temperature = 28
    if temperature > 30:
        print("It's a hot day!")
    elif temperature > 20:
        print("It's a nice day.")
    else:
        print("It's cold.")
    # Output: It's a nice day.
    ```
*   `for` Loops: For iterating over a sequence.

    Python

    ```
    for i in range(3):
        print("Hello")
    # Output:
    # Hello
    # Hello
    # Hello
    ```
*   Functions: Reusable blocks of code.

    Python

    ```
    def calculate_sum(a, b):
        return a + b

    result = calculate_sum(5, 7)
    print(result)
    # Output: 12
    ```

***

#### Section 2: The Data Science Toolkit

These libraries are the industry standard for data analysis.

**2.1 NumPy: Numerical Python**

NumPy is the foundation for scientific computing. It provides a powerful array object.

Python

```
import numpy as np

# Create a NumPy array
data_array = np.array([10, 20, 30, 40, 50])
print(data_array)
# Output: [10 20 30 40 50]

# Perform fast mathematical operations on the entire array
multiplied_array = data_array * 2
print(multiplied_array)
# Output: [ 20  40  60  80 100]

# Calculate the mean (average) of the array
print(f"Mean value: {np.mean(data_array)}")
# Output: Mean value: 30.0
```

**2.2 Pandas: Data Analysis and Manipulation**

Pandas introduces the `DataFrame`, a spreadsheet-like structure that is essential for working with tabular data.

Python

```
import pandas as pd

# Create a DataFrame from a dictionary
data = {'City': ['Dhaka', 'Chattogram', 'Khulna', 'Sylhet'],
        'Population': [10000000, 3500000, 1500000, 500000]}
df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Select a column
print("\nPopulation column:")
print(df['Population'])

# Filter rows based on a condition
high_pop_cities = df[df['Population'] > 2000000]
print("\nCities with population > 2 million:")
print(high_pop_cities)
# Output:
# Original DataFrame:
#          City  Population
# 0       Dhaka    10000000
# 1  Chattogram     3500000
# 2      Khulna     1500000
# 3      Sylhet      500000

# Population column:
# 0    10000000
# 1     3500000
# 2     1500000
# 3      500000
# Name: Population, dtype: int64

# Cities with population > 2 million:
#          City  Population
# 0       Dhaka    10000000
# 1  Chattogram     3500000
```

**2.3 Matplotlib & Seaborn: Data Visualization**

These libraries are used to create plots and charts to visualize your data. Seaborn is built on top of Matplotlib, providing a high-level, aesthetically pleasing interface.

Python

```
import matplotlib.pyplot as plt
import seaborn as sns

# Create a simple bar plot using Pandas and Matplotlib
df.plot(kind='bar', x='City', y='Population', title='Population of Major Cities')
plt.show() # Display the plot

# Use Seaborn to create a more sophisticated plot with less code
# First, load a built-in dataset for a better example
iris_df = sns.load_dataset("iris")

# Create a scatter plot to visualize relationships
sns.scatterplot(x='sepal_length', y='petal_length', data=iris_df, hue='species')
plt.title("Sepal vs. Petal Lengths in Iris Dataset")
plt.show()
```

***

#### Section 3: A Full Data Analysis Workflow Example

This example shows how all the libraries work together to perform a basic analysis.

Goal: Analyze the relationship between `sepal_length` and `petal_length` in the Iris dataset and visualize it.

Python

```
# 1. Import necessary libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 2. Load the dataset (Seaborn provides some built-in ones)
iris_df = sns.load_dataset("iris")
print("First 5 rows of the dataset:")
print(iris_df.head())

# 3. Perform a quick statistical summary using Pandas
print("\nStatistical Summary:")
print(iris_df.describe())

# 4. Filter the data to focus on a specific species (e.g., setosa)
setosa_df = iris_df[iris_df['species'] == 'setosa']
print("\nSetosa species data:")
print(setosa_df.head())

# 5. Visualize the data to understand relationships
# Create a joint plot to see the scatter plot and individual distributions at once
sns.jointplot(x='sepal_length', y='petal_length', data=iris_df, hue='species')
plt.suptitle("Joint Plot of Sepal vs. Petal Length", y=1.02)
plt.show()

# 6. Conclusion from the analysis:
# The joint plot clearly shows a positive correlation between sepal length and petal length.
# The 'setosa' species has a distinct cluster with shorter sepal and petal lengths compared to the other species.
```

#### SciPy (Scientific Python)

* Primary Focus: SciPy provides a vast collection of algorithms for scientific and technical computing. It includes modules for optimization, linear algebra, integration, interpolation, signal processing, and more.
* What it does: It gives you the "heavy-duty math" tools. For example, you might use SciPy to find the roots of an equation, solve a system of differential equations, or perform statistical tests on your data.
* Dependency: It is built on the NumPy library.

Example Use Case: You have a set of data points and want to find the best-fit curve using a non-linear optimization method. SciPy has a dedicated `scipy.optimize` module for this.

Python

```
import numpy as np
from scipy.optimize import curve_fit

# Example data
x = np.array([0, 1, 2, 3, 4, 5])
y = np.array([0.1, 0.9, 2.2, 3.8, 5.1, 7.3])

# Define the function to fit (a simple line)
def func(x, a, b):
    return a * x + b

# Use SciPy to find the optimal parameters (a, b)
popt, pcov = curve_fit(func, x, y)
print(f"Optimal parameters (a, b): {popt}")
# Output: Optimal parameters (a, b): [1.44285714 0.13333333]
```

#### Scikit-learn

* Primary Focus: Scikit-learn is a machine learning library. Its goal is to provide a consistent and easy-to-use API for building predictive models from data.
* What it does: It provides a range of supervised and unsupervised learning algorithms. This includes tools for classification, regression, clustering, dimensionality reduction, and model selection.
* Dependency: It is built on NumPy, SciPy, and Matplotlib.

Example Use Case: You have a dataset and want to build a model that predicts a category (e.g., whether an email is spam or not) or a value (e.g., a house price). Scikit-learn provides the tools for this entire workflow.

Python

```
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.datasets import make_regression

# Generate a synthetic dataset for a regression problem
X, y = make_regression(n_samples=100, n_features=1, noise=20, random_state=42)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Create and train a linear regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Make a prediction
prediction = model.predict(X_test[0].reshape(-1, 1))
print(f"Prediction for the first test sample: {prediction[0]:.2f}")
# Output: Prediction for the first test sample: 39.46
```

#### Direct Comparison: SciPy vs. Scikit-learn

| Feature      | SciPy                                                                                          | Scikit-learn                                                                                                          |
| ------------ | ---------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Main Purpose | General scientific and technical computing.                                                    | Machine learning and predictive modeling.                                                                             |
| Scope        | Very broad: numerical integration, optimization, signal processing, statistics, etc.           | Focused: supervised and unsupervised learning, model evaluation.                                                      |
| Dependencies | Depends on NumPy.                                                                              | Depends on NumPy and SciPy.                                                                                           |
| Workflow     | Provides individual functions and tools to solve specific mathematical or scientific problems. | Provides a consistent API for an entire machine learning workflow (data splitting, modeling, prediction, evaluation). |
| Analogy      | A toolbox of advanced calculators and scientific instruments.                                  | A machine that uses those instruments to build a specific product (a predictive model).                               |
