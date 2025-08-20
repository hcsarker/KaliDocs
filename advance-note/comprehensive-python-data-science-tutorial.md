---
icon: python
---

# Comprehensive Python Data Science Tutorial

Build a solid foundation in Python for Data Science with clean examples and a complete, end‑to‑end mini project. This guide covers Python basics plus the core libraries: NumPy, Pandas, Matplotlib, Seaborn, Scikit‑learn, and SciPy.

## What you’ll learn

- Python essentials for data work
- Array computing with NumPy
- Data wrangling with Pandas
- Plotting with Matplotlib and Seaborn
- Machine learning with Scikit‑learn
- Statistics and optimization with SciPy

## Prerequisites

- Python 3.9+ and pip
- Basic command‑line skills

## Quick setup

```bash
# Create and activate a virtual environment (Linux/macOS)
python3 -m venv .venv
source .venv/bin/activate

# Install core packages
pip install --upgrade pip
pip install numpy pandas matplotlib seaborn scikit-learn scipy jupyter
```

---

## 1) Python Basics

Python is a concise, readable language with powerful standard libraries.

Key ideas:

- Variables and data types (int, float, str, list, dict, tuple, set)
- Control flow (if/elif/else, for/while)
- Functions and modules

Example: simple grade analyzer

```python
student_name = "Alice"
grade = 85
grades = [90, 85, 88, 92]
student_info = {"name": "Alice", "age": 20}

# Branching
if grade >= 90:
  print(f"{student_name} got an A!")
elif grade >= 80:
  print(f"{student_name} got a B!")
else:
  print(f"{student_name} needs improvement.")

# Loop and function
def calculate_average(values):
  return sum(values) / len(values)

for g in grades:
  print("Grade:", g)

avg = calculate_average(grades)
print(f"Average grade: {avg:.2f}")
```

---

## 2) NumPy: Numerical Computing

NumPy provides fast N‑dimensional arrays and vectorized math.

```python
import numpy as np

# 2D array: rows=students, cols=tests
scores = np.array([[85, 90, 88],
           [78, 82, 80],
           [95, 92, 94]])

print("Mean per student:", scores.mean(axis=1))
print("Mean per test:", scores.mean(axis=0))
print("Max score:", scores.max())
print("Bonus +5:\n", scores + 5)

rand_scores = np.random.randint(70, 100, size=(3, 2))
print("Random scores:\n", rand_scores)
```

---

## 3) Pandas: Data Manipulation

Pandas offers powerful tabular data structures (DataFrame, Series).

```python
import pandas as pd

data = {
  "Name": ["Alice", "Bob", "Charlie", "David"],
  "Age": [25, 30, 35, 40],
  "Salary": [50000, 60000, 75000, 80000],
  "Department": ["HR", "IT", "IT", "HR"],
}
df = pd.DataFrame(data)
print(df)

# Filter and group
high_salary = df[df["Salary"] > 60000]
avg_salary = df.groupby("Department")["Salary"].mean()

# Handle missing values
df.loc[1, "Salary"] = None
df["Salary"] = df["Salary"].fillna(df["Salary"].mean())

print("High earners:\n", high_salary)
print("Average salary by dept:\n", avg_salary)
print("After fillna:\n", df)
```

---

## 4) Matplotlib: Plotting

```python
import matplotlib.pyplot as plt
import numpy as np

months = np.array(["Jan", "Feb", "Mar", "Apr"])
sales = np.array([200, 250, 300, 280])

plt.figure(figsize=(8, 4))
plt.plot(months, sales, marker="o", label="Sales")
plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Sales ($)")
plt.grid(True)
plt.legend()
plt.show()

plt.figure(figsize=(8, 4))
plt.bar(months, sales, color="seagreen", alpha=0.8)
plt.title("Monthly Sales")
plt.xlabel("Month")
plt.ylabel("Sales ($)")
plt.show()
```

---

## 5) Scikit‑learn: Machine Learning

Linear regression to predict house price from size.

```python
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

sizes = np.array([[1500], [1800], [2400], [3000], [3500]])
prices = np.array([300000, 350000, 400000, 500000, 600000])

X_train, X_test, y_train, y_test = train_test_split(sizes, prices, test_size=0.2, random_state=42)

model = LinearRegression()
model.fit(X_train, y_train)
pred = model.predict(X_test)

print("Prediction:", pred)
print("Actual:", y_test)
print("Slope ($ per sq ft):", model.coef_[0])
print("Intercept:", model.intercept_)
```

---

## 6) Seaborn: Statistical Visualization

```python
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

data = {
  "Name": ["Alice", "Bob", "Charlie", "David"],
  "Age": [25, 30, 35, 40],
  "Salary": [50000, 60000, 75000, 80000],
  "Department": ["HR", "IT", "IT", "HR"],
}
df = pd.DataFrame(data)

sns.set_theme(style="darkgrid")
plt.figure(figsize=(7, 4))
sns.boxplot(x="Department", y="Salary", data=df)
plt.title("Salary Distribution by Department")
plt.show()

sns.pairplot(df, hue="Department", vars=["Age", "Salary"])
plt.show()
```

---

## 7) SciPy: Stats and Optimization

```python
import numpy as np
from scipy import stats, optimize

g1 = np.array([20, 22, 19, 21, 23])
g2 = np.array([25, 27, 24, 26, 28])
t_stat, p = stats.ttest_ind(g1, g2)
print(f"t={t_stat:.2f}, p={p:.4f}")

def cost(x):
  return x**2 + 10*np.sin(x)

res = optimize.minimize(cost, x0=0)
print(f"x={res.x[0]:.2f}, f(x)={res.fun:.2f}")
```

---

## 8) Integrated Mini Project: House Prices

Combine analysis, statistics, ML, and visualization.

```python
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from scipy import stats

# Sample dataset
df = pd.DataFrame({
  "Size": [1500, 1800, 2400, 3000, 3500, 2000, 2800],
  "Bedrooms": [3, 3, 4, 4, 5, 3, 4],
  "Price": [300000, 350000, 400000, 500000, 600000, 320000, 450000],
  "Location": ["Urban", "Suburban", "Urban", "Rural", "Rural", "Suburban", "Urban"],
})

print("Average price by location:\n", df.groupby("Location")["Price"].mean())

# t-test Urban vs Rural
urban = df[df["Location"]=="Urban"]["Price"]
rural = df[df["Location"]=="Rural"]["Price"]
_, p = stats.ttest_ind(urban, rural, equal_var=False)
print(f"Urban vs Rural p-value: {p:.4f}")

# ML: predict Price from Size
X_train, X_test, y_train, y_test = train_test_split(df[["Size"]], df["Price"], test_size=0.3, random_state=42)
model = LinearRegression().fit(X_train, y_train)
print("Test R^2:", model.score(X_test, y_test))

# Visualization
sns.set_theme(style="whitegrid")
plt.figure(figsize=(7, 4))
sns.regplot(x="Size", y="Price", data=df, scatter_kws={"s": 60})
plt.title("House Price vs Size")
plt.show()
```

---

## Tips and Best Practices

- Use virtual environments per project
- Keep notebooks tidy; move reusable code into modules
- Validate assumptions with plots and tests
- Track experiments and versions

### Jupyter quick start

```bash
jupyter notebook
```

---

## Resources

- NumPy: https://numpy.org/doc/stable/
- Pandas: https://pandas.pydata.org/docs/
- Matplotlib: https://matplotlib.org/stable/
- Seaborn: https://seaborn.pydata.org/
- Scikit‑learn: https://scikit-learn.org/stable/
- SciPy: https://docs.scipy.org/doc/scipy/

> Use these tools responsibly and ethically. Always have permission before analyzing data or systems.
