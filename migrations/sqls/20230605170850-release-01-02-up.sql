CREATE TABLE IF NOT EXISTS candidate (
  id_candidate SERIAL,
  candidate_name VARCHAR(255) NOT NULL,
  candidate_email VARCHAR(255) NULL,
  candidate_phone VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_candidate),
  UNIQUE (candidate_email),
  UNIQUE (candidate_phone)
);

CREATE TABLE IF NOT EXISTS company (
  id_company SERIAL,
  company_code VARCHAR(255) NOT NULL,
  company_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_company),
  UNIQUE (company_code)
);

CREATE TABLE IF NOT EXISTS recruiter (
  id_recruiter SERIAL,
  recruiter_username VARCHAR(255) NOT NULL,
  recruiter_name VARCHAR(255) NOT NULL,
  recruiter_email VARCHAR(255) NOT NULL,
  ref_id_company INTEGER NOT NULL,
  PRIMARY KEY (id_recruiter),
  UNIQUE (recruiter_username),
  UNIQUE (recruiter_email),
  FOREIGN KEY (ref_id_company) REFERENCES company (id_company)
);

CREATE TABLE IF NOT EXISTS assessment (
  id_assessment SERIAL,
  assessment_name VARCHAR(255) NOT NULL,
  assessment_code VARCHAR(255) NOT NULL,
  min_experience INTEGER NOT NULL,
  max_experience INTEGER NOT NULL,
  ref_id_business_domain INTEGER NOT NULL,
  ref_id_company INTEGER NOT NULL,
  ref_id_recruiter INTEGER NOT NULL,
  PRIMARY KEY (id_assessment),
  UNIQUE (assessment_code),
  FOREIGN KEY (ref_id_business_domain) REFERENCES business_domain (id_business_domain),
  FOREIGN KEY (ref_id_company) REFERENCES company (id_company),
  FOREIGN KEY (ref_id_recruiter) REFERENCES recruiter (id_recruiter)
);

CREATE TABLE IF NOT EXISTS assessment_skills (
  id_assessment_skills SERIAL,
  ref_id_assessment INTEGER NOT NULL,
  ref_id_skills INTEGER NOT NULL,
  "priority" VARCHAR(50),
  PRIMARY KEY (id_assessment_skills),
  CHECK ("priority" IN ('MUST_HAVE', 'GOOD_TO_HAVE')),
  FOREIGN KEY (ref_id_skills) REFERENCES skill (id_skill),
  FOREIGN KEY (ref_id_assessment) REFERENCES assessment (id_assessment)
);

CREATE TABLE IF NOT EXISTS assessment_flow (
  id_assessment_flow SERIAL,
  ref_id_assessment	INTEGER NOT NULL,
  ref_id_assessment_type INTEGER NOT NULL,
  proceed_if_failed BOOLEAN NOT NULL,
  "order" INTEGER NOT NULL,
  PRIMARY KEY (id_assessment_flow),
  FOREIGN KEY (ref_id_assessment) REFERENCES assessment (id_assessment),
  FOREIGN KEY (ref_id_assessment_type) REFERENCES assessment_type (id_assessment_type)
);