# Humure

The Humidity and temperature sensors app


## API Calls

### GET /humidity

```shell
$ curl -H "Accept: application/json" localhost:4000/api/humidity
```

```javascript
{"value":65}
```


### GET /temperature

```shell
$ curl -H "Accept: application/json" localhost:4000/api/temperature
```

```javascript
{"value":24.50}
```


### GET /lamp

```shell
$ curl -H "Accept: application/json" localhost:4000/api/lamp
```

```javascript
{"value":"off"}
```


### PUT /lamp/on

```shell
$ curl -H "Accept: application/json" -X PUT -d '' localhost:4000/api/lamp/on
```

```javascript
{"value":"on"}
```


### PUT /lamp/off

```shell
$ curl -H "Accept: application/json" -X PUT -d '' localhost:4000/api/lamp/off
```

```javascript
{"value":"off"}
```


### PUT /lamp/color/240/65/36

```shell
$ curl -H "Accept: application/json" -X PUT -d '' localhost:4000/api/lamp/color/240/65/36
```

```javascript
{"value":[240,65,36]}
```
