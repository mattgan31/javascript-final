CREATE TABLE t_agent (
	agent_code VARCHAR(10) PRIMARY KEY,
	agent_name VARCHAR(20),
	agent_office VARCHAR(24),
	basic_commission MONEY
);

CREATE TABLE t_client (
	client_number VARCHAR(10) PRIMARY KEY,
	client_name VARCHAR(25),
	birth_date DATE
);

CREATE TABLE t_policy (
	policy_number VARCHAR(5) PRIMARY KEY,
	policy_submit_date DATE,
	premium MONEY,
	discount INT,
	commission MONEY,
	client_number VARCHAR(10),
	agent_code VARCHAR(10),
	policy_status VARCHAR(20),
	policy_due_date DATE,
	CONSTRAINT client_fk FOREIGN KEY (client_number) REFERENCES t_client(client_number),
	CONSTRAINT agent_fk FOREIGN KEY (agent_code) REFERENCES t_agent(agent_code)
);

INSERT INTO t_agent (
	agent_code,
	agent_name,
	agent_office
) VALUES
('AG001', 'LIDYA', 'JAKARTA'),
('AG002', 'RUDI', 'BALI'),
('AG003', 'RICKY', 'BALI'),
('AG004', 'DAVID', 'SURABAYA'),
('AG005', 'FARIZ', 'SURABAYA');

INSERT INTO t_client (
	client_number,
	client_name,
	birth_date
) VALUES
('CL001', 'WAYNE ROONEY', '1956/5/11'),
('CL002', 'RYAN GIGGS', '1972/9/3'),
('CL003', 'DAVID BECKHAM', '1985/9/3'),
('CL004', 'MICHAEL OWEN', '2012/9/3')

INSERT INTO t_policy (
	policy_number,
	policy_submit_date,
	premium,
	discount,
	commision,
	client_number,
	agent_code,
	policy_status
) VALUES
('001', '2018/1/5', 18600000, 10, 930000, 'CL001', 'AG001', 'INFORCE'),
('002', '2018/1/5', 2500000, 10, 125000, 'CL002', 'AG002', 'INFORCE'),
('003', '2018/1/10', 2500000, 10, 125000, 'CL003', 'AG003', 'TERMINATE'),
('004', '2018/1/25', 4000000, 10, 200000, 'CL003', 'AG002', 'PROPOSAL'),
('005', '2018/1/25', 2625000, 10, 131250, 'CL004', 'AG002', 'PROPOSAL');

-- SELECT SESSION
-- 1
SELECT p.* FROM t_policy p
JOIN t_client c
ON p.client_number = c.client_number
WHERE p.policy_submit_date > '2018/1/15'
AND EXTRACT(MONTH FROM c.birth_date) = '9';

SELECT * FROM t_policy p
JOIN t_agent a
ON p.agent_code = a.agent_code
WHERE p.policy_status = 'INFORCE'
AND a.agent_office = 'JAKARTA';

SELECT (p.commision/p.premium)*100 AS basic_commission, a.* FROM t_policy p
JOIN t_agent a
ON p.agent_code = a.agent_code;

SELECT (policy_submit_date + 30) AS policy_due_date FROM t_policy;

SELECT *, ((premium*10)/100) AS result FROM t_agent a
JOIN t_policy p
ON p.agent_code = a.agent_code
WHERE ((premium::numeric*10)/100) < 1000000
ORDER BY result ASC;

