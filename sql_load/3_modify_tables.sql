-- Load data into company_dim
COPY company_dim
FROM 'D:/CV/Akila Wijesiriwardana/Projects/SQL/csv_files/company_dim.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);

-- Load data into skills_dim
COPY skills_dim
FROM 'D:/CV/Akila Wijesiriwardana/Projects/SQL/csv_files/skills_dim.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);

-- Load data into job_postings_fact
COPY job_postings_fact
FROM 'D:/CV/Akila Wijesiriwardana/Projects/SQL/csv_files/job_postings_fact.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);

-- Load data into skills_job_dim
COPY skills_job_dim
FROM 'D:/CV/Akila Wijesiriwardana/Projects/SQL/csv_files/skills_job_dim.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);


