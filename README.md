# DRLdocker

[![](https://images.microbadger.com/badges/image/robcal/drldocker.svg)](http://microbadger.com/images/robcal/drldocker "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/robcal/drldocker.svg)](http://microbadger.com/images/robcal/drldocker "Get your own version badge on microbadger.com")

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

