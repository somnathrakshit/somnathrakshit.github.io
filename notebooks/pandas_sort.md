
<a href="https://colab.research.google.com/gist/somnathrakshit/88a4684a1eb97b782b07a2f758ad3e3c/pandas_sort.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>


```
from pandas import DataFrame
 
Cars = {'Brand': ['Honda Civic','Toyota Corolla','Ford Focus','Audi A4'],
        'Price': [22000,25000,27000,35000],
        'Year': [2015,2013,2018,2018]
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




```
df.sort_values(by=['Brand'], inplace=True)
```


```
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




```
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




```
df.sort_values(by=['Brand'], inplace=True, ascending=False)

```


```
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




```
 df.sort_values(by=['Year','Price'], inplace=True)
```


```
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




```
df.sort_values(by=['Year','Brand'], inplace=True)
```


```
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




```
df.sort_values(by=['Year','Brand'], ascending=[False, True], inplace=True)
```


```
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


