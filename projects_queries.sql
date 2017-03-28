-- What are all projects that use Python?
SELECT project.name
FROM project, project_uses_tech
WHERE project_uses_tech.project_id = project.id AND tech_id = 4;


-- What are all technologies used by the Phone Book?
SELECT
    tech.name
FROM
    tech,
    project_uses_tech,
    project
WHERE
    project_uses_tech.tech_id = tech.id
    AND project_uses_tech.project_id = project.id
    AND project.name = 'Phone Book';


-- Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
SELECT
    project.name as project_name,
    tech.name as tech_name
FROM
    tech
LEFT OUTER JOIN
    project_uses_tech on project_uses_tech.tech_id = tech.id
LEFT OUTER JOIN
    project on project_uses_tech.project_id = project.id;


-- Get the count of the number of techs used by each project.
--Order the projects by how many tech it uses.
SELECT
    project_name,
    count(tech_name) as num_techs
FROM
    (SELECT
        project.name as project_name,
        tech.name as tech_name
    FROM
        -- left table, all rows here represented no matter what
        -- All projects will be shown even if they do not have any tech
        project
    LEFT OUTER JOIN
        project_uses_tech on project_uses_tech.project_id = project.id
    LEFT OUTER JOIN
        tech on project_uses_tech.tech_id = tech.id)  as project_table
GROUP BY
    project_name
ORDER BY
    num_techs;


-- Which projects has no associated tech?
SELECT
    project.name as project_name,
    tech.name as tech_name
FROM
    -- left table, all rows here represented no matter what
    -- If project has no technology it will still be in the column
    project
LEFT OUTER JOIN
    project_uses_tech on project_uses_tech.project_id = project.id
LEFT OUTER JOIN
    tech on project_uses_tech.tech_id = tech.id;


--Get the count of the number of projects that use each tech.
--Order the tech by how many projects use it.
SELECT
	tech_name,
	count(project_name) as num_projects_using
FROM
	(SELECT
        project.name as project_name,
        tech.name as tech_name
        FROM
            -- left table, all rows here represented no matter what
            -- even if tech has no projects it will show up
            tech
        LEFT OUTER JOIN
            project_uses_tech on project_uses_tech.tech_id = tech.id
        LEFT OUTER JOIN
            project on project_uses_tech.project_id = project.id) as tech_counts
GROUP BY
	tech_name
ORDER BY
    num_projects_using;



--List all projects along with each technology used by it. You will need to do a three-way join.
SELECT
    project.name as project_name,
    tech.name as tech_name
FROM
    project,
    project_uses_tech,
    tech
WHERE
    project_uses_tech.tech_id = tech.id
    AND project_uses_tech.project_id = project.id;



-- List all the distinct techs that are not used by any projects.
SELECT
	distinct on (tech.name) tech.name
FROM
	tech
LEFT OUTER JOIN
	project_uses_tech on project_uses_tech.tech_id = tech.id
LEFT OUTER JOIN
	project on project_uses_tech.project_id = project.id
WHERE
	project.name is null;


-- List all the distinct projects that use at least one tech.
SELECT
    distinct on (project.name) project.name
FROM
    project,
    project_uses_tech,
    tech
WHERE
    project_uses_tech.tech_id = tech.id
    AND project_uses_tech.project_id = project.id;


--List all the distinct techs that are used by at least one project.
SELECT
    distinct on (tech.name) tech.name
FROM
    project,
    project_uses_tech,
    tech
WHERE
    project_uses_tech.tech_id = tech.id
    AND project_uses_tech.project_id = project.id;


-- List all the distinct projects that use no tech.
SELECT
    distinct on (project.name) project.name
FROM
    -- left table, all rows here represented no matter what
    -- All projects will be shown even if they do not have any tech
    project
LEFT OUTER JOIN
    project_uses_tech on project_uses_tech.project_id = project.id
LEFT OUTER JOIN
    tech on project_uses_tech.tech_id = tech.id
WHERE
	tech.name is null;


--What is the average number of techs used by a project?
SELECT
    avg(num_projects_using) as avg_num_projects
FROM
    (SELECT
    	tech_name,
    	count(project_name) as num_projects_using
    FROM
    	(SELECT
            project.name as project_name,
            tech.name as tech_name
            FROM
                -- left table, all rows here represented no matter what
                -- even if tech has no projects it will show up
                tech
            LEFT OUTER JOIN
                project_uses_tech on project_uses_tech.tech_id = tech.id
            LEFT OUTER JOIN
                project on project_uses_tech.project_id = project.id) as tech_counts
    GROUP BY
    	tech_name
    ORDER BY
        num_projects_using) as num_projects
