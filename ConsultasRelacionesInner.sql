-- Buscar por región
SELECT
    *
FROM
    region;

-- Buscar Provincias de una región (Inner Join implicito)
SELECT
    re_nombre,
    pr_nombre
FROM
    region,
    provincia
where
    pr_region = re_id
and re_id = 1;

-- Buscar Provincias de una región (Inner Join Explicito)
SELECT
    re_nombre,
    pr_nombre
FROM
    region inner join provincia on pr_region = re_id
where
    re_id = 1;

-- Buscar comunas de una Provincia y Región (Inner Join implicito)
SELECT
    re_nombre,
    pr_nombre,
    co_descripcion
FROM
    region,
    provincia,
    comuna
where
    pr_region = re_id
and pr_id     = co_pr
and re_id = 1;

-- Buscar comunas de una Provincia y Región (Inner Join Explicito)
SELECT
    re_nombre,
    pr_nombre,
    co_descripcion
FROM
    region inner join provincia
    provincia inner join comuna
    on pr_region = re_id
    and pr_id    = co_pr
where
    re_id = 1;





