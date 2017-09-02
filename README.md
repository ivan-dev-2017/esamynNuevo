# ESAMyN
Proyecto de la OPS "Establecimientos de Salud Amigos de la Madre y el Niño", con el apoyo del Ministerio de Salud y el ACESS.

## AMBIENTE DE DESARROLLO

* Dueño: JYBARO
* hostname: esamyn-des
* IP SSH: 45.55.147.66 (edakos.com)
* Puerto SSH: 9412

Para realizar la conexión SSH al ambiente de **desarrollo**: 
```
ssh -P 9412 miusuario@45.55.147.66
```

Para pasar archivos al directorio `/home/miusuario` en el servidor de **desarrollo**: 
```
scp -P 9412 /mi/archivo.zip miusuario@45.55.147.66:
```

### BDD en el ambiente de desarrollo

* IP PostgreSQL: 45.55.147.66 (edakos.com)
* Puerto PostgreSQL: 6543
* BDD de mantenimiento: acess
* Usuario: esamyn_user
* Clave: esamYn.2017

Para conectarse vía comandos a la base de datos en el ambiente de **desarrollo**: 
```
psql -p 6543 -h 45.55.147.66 -U esamyn_user -W acess
```

## AMBIENTE DE PRUEBAS
* Dueño: OPS
* hostname: ESAMYN-TEST
* IP SSH: 200.7.213.18
* Puerto SSH: 2202

Para realizar la conexión SSH al ambiente de **pruebas**: 
```
ssh -P 2202 miusuario@200.7.213.18
```

Para pasar archivos al directorio `/home/miusuario` en el servidor de **pruebas**: 
```
scp -P 2202 /mi/archivo.zip miusuario@200.7.213.18:
```

### BDD en el ambiente de pruebas

* IP PostgreSQL: 200.7.213.18
* Puerto PostgreSQL: 5432
* BDD de mantenimiento: acess
* Usuario: esamyn_user
* Clave: esamYn.2017

Para conectarse vía comandos a la base de datos en el ambiente de **pruebas**: 
```
psql -p 6543 -h 200.7.213.18 -U esamyn_user -W acess
```

### WildFly de pruebas
```
[http://200.7.213.18:8080](http://200.7.213.18:8080)
```


### Angular de pruebas
```
[http://200.7.213.18:4200](http://200.7.213.18:4200)
```
