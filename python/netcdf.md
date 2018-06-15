# NetCDF
[Documentation](http://unidata.github.io/netcdf4-python/)

**.nc** files are designed to hold data about the wheather. The format itself is a bianry format, so one would need to open this programatically instead of being a plain text file.

*NetCDF* for python is one of the libaries out there to help with this task.

## opening and closing
To manipulate nc files, your need the **Dataset** object, which can be imported through:
```py
from netCDF4 import Dataset
```

You can then open and close it with:
```py
myDataset = Dataset("./path/to/nc.nc","w")
# The "r" is for read access, so replace this with w for writing.
```

to close the above dataset, just run `myDataset.close()`

## Groups
Groups introduce how the actual values are stored in a netcdf. The documentation states that it's almost like going through a unix file system.

A dataset contains many of these at the root group. To see what they are, use: `yourDataset.groups`. This should list somemore groups you can enter through dictionary syntax.

From here you can enter the dictionary and pick wich set of values you wish to view, in my case, I could go to MeanState:
```py
yourDataset.groups["MeanState"].variables #which in turn returns another group
```

You can eventually get to the point where you can find the values you want just through traversing though this manner.