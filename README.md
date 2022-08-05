# Flutter bolderplate (riverpod + dio + getX)

Simple way to build your application
- state management (riverpod)
- repository (doio)
- model (freezed)
- dependency injection (getX)
- API server (express)


|![](./screenshots/screen01.png)|![](./screenshots/screen02.png)|
:---:|:---:

## Setup
```
fvm flutter pub get # install dependences
./sh/build_runner.sh # run build runner script
```

## Server
run server
```
cd server;
yarn start;
```


## structure

Mobile application

- ui/
  - category
  - common
- models/
  - category
- services/
  - category_service
- repositories/
  - dio # config dio
- utils/ 

Server 
- server/
  - index.js