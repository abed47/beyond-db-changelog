/* Replace with your SQL commands */
CREATE TABLE IF NOT EXISTS business_domain (
    id_business_domain SERIAL,
    business_domain_code VARCHAR(255) NOT NULL,
    business_domain_name VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_date TIMESTAMP NOT NULL,
    created_by VARCHAR(255) NOT NULL,
    updated_date TIMESTAMP NULL,
    updated_by VARCHAR(255) NULL,
    PRIMARY KEY (id_business_domain),
    UNIQUE(business_domain_code)
);

CREATE TABLE IF NOT EXISTS skill (
    id_skill SERIAL,
    ref_id_business_domain INTEGER NOT NULL,
    skill_code VARCHAR(255) NOT NULL,
    skill_name VARCHAR(255),
    is_active BOOLEAN,
    created_date TIMESTAMP NOT NULL,
    created_by VARCHAR(255) NOT NULL,
    updated_date TIMESTAMP NULL,
    updated_by VARCHAR(255) NULL,
    PRIMARY KEY (id_skill),
    UNIQUE(skill_code),
    FOREIGN KEY (ref_id_business_domain) REFERENCES business_domain (id_business_domain) 
);

CREATE TABLE IF NOT EXISTS assessment_type (
    id_assessment_type SERIAL,
    ref_id_business_domain INTEGER NOT NULL,
    assessment_type_code VARCHAR(255),
    assessment_type_name VARCHAR(255),
    is_active BOOLEAN,
    created_date TIMESTAMP NOT NULL,
    created_by VARCHAR(255) NOT NULL,
    updated_date TIMESTAMP NULL,
    updated_by VARCHAR(255) NULL,
    PRIMARY KEY (id_assessment_type),
    UNIQUE (assessment_type_code, ref_id_business_domain),
    FOREIGN key (ref_id_business_domain) REFERENCES business_domain (id_business_domain)
);