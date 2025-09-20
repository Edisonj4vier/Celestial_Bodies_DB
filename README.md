# Astronomical Database Practice

## Descripción
Base de datos que modela un sistema astronómico jerárquico:  
**Galaxy → Star → Planet → Moon → Comet**.  
Se practicó la creación de tablas, relaciones, constraints, tipos de datos y la inserción de datos de prueba.

---

## Estructura de las tablas

| Tabla   | Claves          | Atributos principales | Restricciones clave |
|---------|----------------|--------------------|-------------------|
| Galaxy  | PK: galaxy_id  | name, type, age_million_years, number_of_stars, description | UNIQUE(name) |
| Star    | PK: star_id    | name, galaxy_id, mass, radius_km, is_alive, is_supernova | UNIQUE(name, galaxy_id), FK galaxy_id → Galaxy |
| Planet  | PK: planet_id  | name, star_id, diameter_km, mass, has_life, has_rings, description | UNIQUE(name, star_id), FK star_id → Star |
| Moon    | PK: moon_id    | name, planet_id, orbit_days, radius_km, is_habitable, is_tidally_locked, description | UNIQUE(name, planet_id), FK planet_id → Planet |
| Comet   | PK: comet_id   | name, star_id, mass, radius_km, has_tail, orbit_period_days, description | UNIQUE(name), FK star_id → Star |

---

## Tipos de datos utilizados
- **INT / BIGINT** → edades, diámetros, radios, número de estrellas  
- **NUMERIC** → masas de estrellas, planetas y cometas  
- **TEXT / VARCHAR** → nombres y descripciones  
- **BOOLEAN** → propiedades o estados (ej. `is_alive`, `has_life`, `has_tail`)  

---

## Datos de prueba
| Tabla   | Filas |
|---------|-------|
| Galaxy  | 6     |
| Star    | 6     |
| Planet  | 12    |
| Moon    | 20    |
| Comet   | 4     |

Todas las filas respetan las **foreign keys** y mantienen la jerarquía Galaxy → Star → Planet → Moon → Comet.

---

## Consideraciones
- Constraints de unicidad para evitar duplicados.  
- Foreign keys para integridad referencial.  
- Ajuste de tipos de datos para evitar overflow.  
- Recomendación: hacer **backups con `pg_dump`** antes de salir de la máquina virtual.

---

## Comandos útiles
**Restaurar:**
``` bash
psql -U postgres < universe.sql
```
**Backup:**
```bash
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```
