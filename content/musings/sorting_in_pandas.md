---
title: "A Comprehensive Guide to Sorting in Pandas"
date: 2019-06-01
---
# A Comprehensive Guide to Sorting in Pandas

In order to sort rows in `Pandas`, you can use the `sort_values()` function. I have taken examples from this excellant [blog](https://datatofish.com/sort-pandas-dataframe/). Although it shows a lot of the use cases covered here, the last case is absent pretty much everywhere.

In this tutorial, I will be showing how to use `Pandas` to sort rows based on different criterion.

You can run a colab notebook containing all code present in this post by clicking here.
<a href="https://colab.research.google.com/gist/somnathrakshit/88a4684a1eb97b782b07a2f758ad3e3c/pandas_sort.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

Let us create our `DataFrame` (df) in pandas
```python
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000, 25000, 27000, 35000],
        'Year': [2015, 2013, 2018, 2018]
        }
 
df = DataFrame(Cars, columns= ['Brand', 'Price','Year'])

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
  </tbody>
</table>
</div>

## Column in an ascending order
To sort this df based on the column `Brand`, we can use the `sort_values()` function in this manner. Here, `inplace=True` means that the df will be sorted in-memory. Also, by default, the `df` is sorted in ascending order. But we can change it easily, as will be shown later.

```python
df.sort_values(by=['Brand'], inplace=True)
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
  </tbody>
</table>
</div>



The complete code to perform the task above is shown below.
```python
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000,25000,27000,35000],
        'Year': [2015,2013,2018,2018]
        }
 
df = DataFrame(Cars, columns= ['Brand', 'Price','Year'])

# sort Brand - ascending order
df.sort_values(by=['Brand'], inplace=True)

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
  </tbody>
</table>
</div>

## Column in an descending order
Now, suppose we would like to sort df in descending order. Well, `sort_values()` accepts a paramter named `ascending`. By passing `ascending=True`, you can sort the df in descending order. The code is given below.

```python
df.sort_values(by=['Brand'], inplace=True, ascending=False)

```


```python
# sort - descending order
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000,25000,27000,35000],
        'Year': [2015,2013,2018,2018]
        }
 
df = DataFrame(Cars, columns= ['Brand', 'Price','Year'])

# sort Brand - descending order
df.sort_values(by=['Brand'], inplace=True, ascending=False)

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
  </tbody>
</table>
</div>

## By multiple columns - Same data type
In the next step, we would like to sort based on two columns. So, here, we first sort by `Year` and then by the `Price` of the car. `sort_values()` accepts a parameter called by. The by paramters can accept a string literal or it can accept a list. We simply need to pass the list containing the columns by which we want the df to be sorted. This is shown below.

```python
 df.sort_values(by=['Year','Price'], inplace=True)
```


```python
# sort by multiple columns
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000,25000,27000,35000],
        'Year': [2015,2013,2018,2018]
        }
 
df = DataFrame(Cars, columns= ['Brand', 'Price','Year'])

# sort by multiple columns: Year and Price
df.sort_values(by=['Year','Price'], inplace=True)

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
  </tbody>
</table>
</div>

## By multiple columns - Mixed data type
It is also possible to pass mixed type of columns to be sorted. For example, we can pass the `Year` column (integer) and the `Brand` column (string). Pandas accepts this without any problem.

```python
df.sort_values(by=['Year','Brand'], inplace=True)
```


```python
# sort by multiple columns
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000,25000,27000,35000],
        'Year': [2015,2013,2018,2018]
        }
 
df = DataFrame(Cars, columns= ['Brand', 'Price','Year'])

# sort by multiple columns: Year and Brand
df.sort_values(by=['Year','Brand'], inplace=True)

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
  </tbody>
</table>
</div>

## By multiple columns and mixed order
Last but not the least, it is also possible to sort multiple columns in mixed order. For example, we may want to sort by `Year` and `Brand` where the `Year` column needs to be sorted in descending order whereas the `Brand` column needs to be sorted in ascening order. Pandas performs this by accepting list in addition to a boolean variable to the `ascending` parameter. The correct intuitive way of doing this is shown below.

```python
df.sort_values(by=['Year','Brand'], ascending=[False, True], inplace=True)
```


```python
# sort by multiple columns but different order
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000,25000,27000,35000],
        'Year': [2015,2013,2018,2018]
        }
 
df = DataFrame(Cars, columns= ['Brand', 'Price','Year'])

# sort by multiple columns: Year and Brand
df.sort_values(by=['Year','Brand'], ascending=[False, True], inplace=True)

df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Price</th>
      <th>Year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3</th>
      <td>Audi A4</td>
      <td>35000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ford Focus</td>
      <td>27000</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Honda Civic</td>
      <td>22000</td>
      <td>2015</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Toyota Corolla</td>
      <td>25000</td>
      <td>2013</td>
    </tr>
  </tbody>
</table>
</div>

You can know more about sorting in Pandas by visiting the [official documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.sort_values.html).

<script async src="https://comments.app/js/widget.js?3" data-comments-app-website="CEK_Wo-P" data-limit="5" data-color="343638"></script>
