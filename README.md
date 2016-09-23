# DRLdocker

[![](https://images.microbadger.com/badges/image/robcal/drldocker.svg)](https://hub.docker.com/r/robcal/drldocker/ "")
[![](https://images.microbadger.com/badges/version/robcal/drldocker.svg)](https://hub.docker.com/r/robcal/drldocker/ "")

If using GPU(s) run using:
```
nvidia-docker run -it -p 8888:8888 robcal/drldocker
```

else use:
```
docker run -it -p 8888:8888 robcal/drldocker
```

Connect to Jupyter by typing in your browser:
```
http://localhost:8888/tree
```
(where 8888 is the port passed as parameter)

To build the image locally type:
```
docker build --t drldocker.
```
from within the folder.
