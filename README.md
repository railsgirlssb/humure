# Humure

The Humidity and temperature sensors app


## API Calls

### GET /humidity

```shell
$ curl -H "Accept: application/json" -H "X-Sensor: fake" localhost:3000/api/humidity
```

```javascript
{"value":65}
```


### GET /temperature

```shell
$ curl -H "Accept: application/json" -H "X-Sensor: fake" localhost:3000/api/temperature
```

```javascript
{"value":24.50}
```


### GET /lamp

```shell
$ curl -H "Accept: application/json" -H "X-Sensor: fake" localhost:3000/api/lamp
```

```javascript
{"value":"off"}
```


### PUT /lamp/on

```shell
$ curl -H "Accept: application/json" -H "X-Sensor: fake" -X PUT -d '' localhost:3000/api/lamp/on
```

```javascript
{"value":"on"}
```


### PUT /lamp/off

```shell
$ curl -H "Accept: application/json" -H "X-Sensor: fake" -X PUT -d '' localhost:3000/api/lamp/off
```

```javascript
{"value":"off"}
```


### PUT /lamp/color/240/65/36

```shell
$ curl -H "Accept: application/json" -H "X-Sensor: fake" -X PUT -d '' localhost:3000/api/lamp/color/240/65/36
```

```javascript
{"value":[240,65,36]}
```

# Local Production mode

For starting up on the pi without a real webserver, you need to start as follows:

```
export RAILS_SERVE_STATIC_FILES=true
export RAILS_ENV=production
export SECRET_KEY_BASE=$( rails secret )

rails s
```

